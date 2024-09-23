@implementation NSAKSerializerStream

- (void)dealloc
{
  __CFDictionary *roomForIntLocations;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  roomForIntLocations = self->roomForIntLocations;
  if (roomForIntLocations)
    CFRelease(roomForIntLocations);
  unallocate((mach_vm_address_t)self->memory, self->max);
  v4.receiver = self;
  v4.super_class = (Class)NSAKSerializerStream;
  -[NSAKSerializerStream dealloc](&v4, sel_dealloc);
}

- (unint64_t)writeInt:(unint64_t)a3
{
  int v3;

  if (a3 >= 0x80000001)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSOtherSerializationException"), CFSTR("can't write int larger than INT_MAX"), 0));
  v3 = a3;
  extendStreamFor((vm_address_t)self, 4);
  *(_DWORD *)((char *)self->memory + self->current) = v3;
  self->current += 4;
  return 4;
}

- (unint64_t)writeAlignedDataSize:(unint64_t)a3
{
  uint64_t v5;
  unint64_t current;
  size_t v7;

  v5 = *MEMORY[0x1E0C85AD8];
  if (*MEMORY[0x1E0C85AD8] > a3)
    return -[NSAKSerializerStream writeInt:](self, "writeInt:", a3);
  current = self->current;
  if (((current + 4) & (v5 - 1)) == 0)
    return -[NSAKSerializerStream writeInt:](self, "writeInt:", a3);
  v7 = v5 - ((current + 12) & (v5 - 1));
  extendStreamFor((vm_address_t)self, v7 + 12);
  -[NSAKSerializerStream writeInt:](self, "writeInt:", 0x80000000);
  -[NSAKSerializerStream writeInt:](self, "writeInt:", a3);
  -[NSAKSerializerStream writeInt:](self, "writeInt:", v7);
  bzero((char *)self->memory + self->current, v7);
  self->current += v7;
  return v7 + 12;
}

- (unint64_t)writeData:(const void *)a3 length:(unint64_t)a4
{
  unint64_t v7;
  _QWORD *v8;
  size_t v9;
  NSUInteger v11;

  extendStreamFor((vm_address_t)self, a4);
  v7 = (unint64_t)self->memory + self->current;
  if (a4 >= 0x80000)
  {
    v8 = (_QWORD *)MEMORY[0x1E0C85AD8];
    if (((*MEMORY[0x1E0C85AD8] - 1) & (v7 | (unint64_t)a3)) != 0
      || (malloc_default_zone(), malloc_zone_claimed_address()))
    {
      v9 = a4;
    }
    else
    {
      v11 = -*v8 & a4;
      NSCopyMemoryPages(a3, (void *)v7, v11);
      a3 = (char *)a3 + v11;
      v7 += v11;
      v9 = a4 - v11;
      if (a4 == v11)
        goto LABEL_7;
    }
    goto LABEL_6;
  }
  v9 = a4;
  if (a4)
LABEL_6:
    memmove((void *)v7, a3, v9);
LABEL_7:
  self->current += a4;
  return a4;
}

- (unint64_t)writeRoomForInt:(int *)a3
{
  int v5;

  if (!self->roomForIntLocations)
    self->roomForIntLocations = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, 0, 0);
  do
    v5 = __ldaxr(writeRoomForInt__globalSequence);
  while (__stlxr(v5 + 1, writeRoomForInt__globalSequence));
  *a3 = v5;
  CFDictionarySetValue(self->roomForIntLocations, (const void *)v5, (const void *)self->current);
  return -[NSAKSerializerStream writeInt:](self, "writeInt:", 0);
}

- (void)writeDelayedInt:(unint64_t)a3 for:(int)a4
{
  __CFDictionary *roomForIntLocations;
  int v6;
  const void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 >= 0x80000001)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = CFSTR("NSOtherSerializationException");
    v10 = CFSTR("can't write int larger than INT_MAX");
LABEL_7:
    objc_exception_throw((id)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0, v11, v12));
  }
  v11 = 0;
  roomForIntLocations = self->roomForIntLocations;
  if (!roomForIntLocations
    || (v6 = a3, v7 = (const void *)a4, !CFDictionaryGetValueIfPresent(roomForIntLocations, (const void *)a4, &v11)))
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = CFSTR("NSSerializeException");
    v10 = CFSTR("writeDelayedInt:for:");
    goto LABEL_7;
  }
  CFDictionaryRemoveValue(self->roomForIntLocations, v7);
  *(_DWORD *)((char *)self->memory + (unint64_t)v11) = v6;
}

- (BOOL)writeToPath:(id)a3 safely:(BOOL)a4
{
  _BOOL8 v4;
  __CFDictionary *roomForIntLocations;
  void *v9;
  char v10;

  v4 = a4;
  if ((objc_msgSend(a3, "isEqualToString:", &stru_1E0F56070) & 1) != 0)
    return 0;
  roomForIntLocations = self->roomForIntLocations;
  if (roomForIntLocations)
  {
    if (CFDictionaryGetCount(roomForIntLocations))
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSSerializeException"), CFSTR("missing writeDelayedInt:for:"), 0));
  }
  v9 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), "initWithBytes:length:", self->memory, self->current);
  v10 = objc_msgSend(v9, "writeToFile:atomically:", a3, v4);

  return v10;
}

- (void)copySerializationInto:(void *)a3
{
  __CFDictionary *roomForIntLocations;
  unint64_t memory;
  size_t current;
  _QWORD *v8;
  NSUInteger v9;

  roomForIntLocations = self->roomForIntLocations;
  if (roomForIntLocations && CFDictionaryGetCount(roomForIntLocations))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSSerializeException"), CFSTR("missing writeDelayedInt:for:"), 0));
  memory = (unint64_t)self->memory;
  current = self->current;
  if (current >= 0x80000)
  {
    v8 = (_QWORD *)MEMORY[0x1E0C85AD8];
    if (((*MEMORY[0x1E0C85AD8] - 1) & (memory | (unint64_t)a3)) != 0)
      goto LABEL_8;
    malloc_default_zone();
    if (malloc_zone_claimed_address())
      goto LABEL_8;
    v9 = current & -*v8;
    NSCopyMemoryPages((const void *)memory, a3, v9);
    memory += v9;
    a3 = (char *)a3 + v9;
    current -= v9;
  }
  if (current)
LABEL_8:
    memmove(a3, (const void *)memory, current);
}

@end
