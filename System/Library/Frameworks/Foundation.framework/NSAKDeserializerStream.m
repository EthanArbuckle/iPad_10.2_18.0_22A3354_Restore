@implementation NSAKDeserializerStream

- (id)initFromMemoryNoCopy:(const void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  *((_QWORD *)self + 1) = a3;
  *((_QWORD *)self + 2) = a3;
  *((_QWORD *)self + 3) = a4;
  *((_QWORD *)self + 4) = a4;
  *((_BYTE *)self + 40) = a5;
  return self;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->freeWhenDone)
    unallocate((mach_vm_address_t)self->memory, self->max);
  v3.receiver = self;
  v3.super_class = (Class)NSAKDeserializerStream;
  -[NSAKDeserializerStream dealloc](&v3, sel_dealloc);
}

- (id)initFromPath:(id)a3
{
  void *v5;
  void *v6;
  vm_size_t v7;
  vm_address_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  void *v12;
  size_t v13;
  NSUInteger v15;

  if (objc_msgSend(a3, "isEqualToString:", &stru_1E0F56070)
    || (v5 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", a3, 1, 0)) == 0)
  {
    -[NSAKDeserializerStream dealloc](self, "dealloc");
    return 0;
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "length");
  v8 = allocate(v7);
  v9 = objc_msgSend(v6, "bytes");
  v10 = (char *)v9;
  if (v7 >= 0x80000)
  {
    v11 = (_QWORD *)MEMORY[0x1E0C85AD8];
    if (((*MEMORY[0x1E0C85AD8] - 1) & (v9 | v8)) != 0
      || (malloc_default_zone(), malloc_zone_claimed_address()))
    {
      v12 = (void *)v8;
      v13 = v7;
    }
    else
    {
      v15 = v7 & -*v11;
      NSCopyMemoryPages(v10, (void *)v8, v15);
      v10 += v15;
      v12 = (void *)(v8 + v15);
      v13 = v7 - v15;
      if (v7 == v15)
        goto LABEL_10;
    }
    goto LABEL_9;
  }
  v13 = v7;
  v12 = (void *)v8;
  if (v7)
LABEL_9:
    memmove(v12, v10, v13);
LABEL_10:

  return -[NSAKDeserializerStream initFromMemoryNoCopy:length:freeWhenDone:](self, "initFromMemoryNoCopy:length:freeWhenDone:", v8, v7, 1);
}

- (int)readInt
{
  unint64_t left;
  const char *current;
  int v4;

  left = self->left;
  if (left <= 3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSDeserializeException"), CFSTR("deserialization string too short"), 0));
  current = self->current;
  v4 = *(_DWORD *)current;
  self->current = current + 4;
  self->left = left - 4;
  return v4;
}

- (unint64_t)readAlignedDataSize
{
  int v3;
  int v4;
  int v5;
  unint64_t left;
  unint64_t v7;

  v3 = -[NSAKDeserializerStream readInt](self, "readInt");
  if (v3 == 0x80000000)
  {
    v4 = -[NSAKDeserializerStream readInt](self, "readInt");
    v5 = -[NSAKDeserializerStream readInt](self, "readInt");
    left = self->left;
    if (left < v5)
      goto LABEL_7;
    v7 = left - v5;
    self->current += v5;
    self->left = v7;
  }
  else
  {
    v4 = v3;
    v7 = self->left;
  }
  if (v7 < v4)
LABEL_7:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSDeserializeException"), CFSTR("deserialization string too short"), 0));
  return v4;
}

- (void)readData:(void *)a3 length:(unint64_t)a4
{
  char *v5;
  const char *current;
  _QWORD *v8;
  size_t v9;
  unint64_t v10;
  NSUInteger v11;

  if (self->left < a4)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSDeserializeException"), CFSTR("deserialization string too short"), 0));
  v5 = (char *)a3;
  current = self->current;
  if (a4 >= 0x80000)
  {
    v8 = (_QWORD *)MEMORY[0x1E0C85AD8];
    if (((*MEMORY[0x1E0C85AD8] - 1) & ((unint64_t)current | (unint64_t)a3)) != 0
      || (malloc_default_zone(), malloc_zone_claimed_address()))
    {
      v9 = a4;
    }
    else
    {
      v11 = -*v8 & a4;
      NSCopyMemoryPages(current, v5, v11);
      current += v11;
      v5 += v11;
      v9 = a4 - v11;
      if (a4 == v11)
        goto LABEL_8;
    }
    goto LABEL_7;
  }
  v9 = a4;
  if (a4)
LABEL_7:
    memmove(v5, current, v9);
LABEL_8:
  v10 = self->left - a4;
  self->current += a4;
  self->left = v10;
}

@end
