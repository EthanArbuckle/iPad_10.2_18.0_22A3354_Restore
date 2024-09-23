@implementation _MTLHeap

- (unint64_t)resourceOptions
{
  char v3;
  char v4;

  v3 = -[_MTLHeap storageMode](self, "storageMode");
  v4 = -[_MTLHeap cpuCacheMode](self, "cpuCacheMode");
  return v4 & 0xF | (unint64_t)(16 * (v3 & 0xF)) | ((-[_MTLHeap hazardTrackingMode](self, "hazardTrackingMode") & 3) << 8);
}

- (unint64_t)storageMode
{
  return self->_heapResourceOptions >> 4;
}

- (unint64_t)hazardTrackingMode
{
  unint64_t heapResourceOptions;

  heapResourceOptions = self->_heapResourceOptions;
  if (((heapResourceOptions >> 8) & 2) != 0)
    return (heapResourceOptions >> 8) & 3;
  else
    return 1;
}

- (unint64_t)cpuCacheMode
{
  return self->_heapResourceOptions & 0xF;
}

- (int64_t)type
{
  return self->_heapType;
}

- (_MTLHeap)initWithType:(int64_t)a3 options:(unint64_t)a4
{
  _MTLHeap *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MTLHeap;
  result = -[_MTLAllocation initWithAllocationType:](&v7, sel_initWithAllocationType_, 2);
  if (result)
  {
    result->_heapType = a3;
    result->_heapResourceOptions = a4;
  }
  return result;
}

- (_MTLHeap)init
{
  return -[_MTLHeap initWithType:options:](self, "initWithType:options:", 0, 0);
}

- (unint64_t)unfilteredResourceOptions
{
  return self->_heapResourceOptions;
}

- (unint64_t)memoryPoolId
{
  return 0;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  __CFString *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  int64_t v9;
  const __CFString *v10;
  unint64_t v11;
  const __CFString *v12;
  unint64_t v13;
  const __CFString *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[25];

  v18[24] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = -[_MTLObjectWithLabel retainedLabel](self, "retainedLabel");
  v6 = (void *)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)_MTLHeap;
  v7 = -[_MTLHeap description](&v17, sel_description);
  v18[0] = v4;
  v18[1] = CFSTR("label =");
  v8 = CFSTR("<none>");
  if (v5)
    v8 = v5;
  v18[2] = v8;
  v18[3] = v4;
  v18[4] = CFSTR("type =");
  v9 = -[_MTLHeap type](self, "type");
  v10 = CFSTR("MTLHeapTypePlacement");
  if (v9 != 1)
    v10 = CFSTR("Invalid");
  if (!v9)
    v10 = CFSTR("MTLHeapTypeAutomatic");
  v18[5] = v10;
  v18[6] = v4;
  v18[7] = CFSTR("size =");
  v18[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_MTLHeap size](self, "size"));
  v18[9] = v4;
  v18[10] = CFSTR("usedSize =");
  v18[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_MTLHeap usedSize](self, "usedSize"));
  v18[12] = v4;
  v18[13] = CFSTR("cpuCacheMode =");
  v11 = -[_MTLHeap cpuCacheMode](self, "cpuCacheMode");
  v12 = CFSTR("MTLCPUCacheModeDefaultCache");
  if (v11)
    v12 = CFSTR("Invalid");
  if (v11 == 1)
    v12 = CFSTR("MTLCPUCacheModeWriteCombined");
  v18[14] = v12;
  v18[15] = v4;
  v18[16] = CFSTR("storageMode =");
  v13 = -[_MTLHeap storageMode](self, "storageMode");
  v14 = CFSTR("MTLStorageModePrivate");
  if (v13 != 2)
    v14 = CFSTR("Invalid");
  if (!v13)
    v14 = CFSTR("MTLStorageModeShared");
  v18[17] = v14;
  v18[18] = v4;
  v18[19] = CFSTR("hazardTrackingMode =");
  v18[20] = MTLHazardTrackingModeString(-[_MTLHeap hazardTrackingMode](self, "hazardTrackingMode"));
  v18[21] = v4;
  v18[22] = CFSTR("resourceOptions =");
  v18[23] = MTLResourceOptionsString(-[_MTLHeap resourceOptions](self, "resourceOptions"));
  v15 = (void *)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 24), "componentsJoinedByString:", CFSTR(" ")));

  return v15;
}

- (id)description
{
  return -[_MTLHeap formattedDescription:](self, "formattedDescription:", 0);
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  -[_MTLHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  -[_MTLHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4
{
  -[_MTLHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  -[_MTLHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  -[_MTLHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  -[_MTLHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (BOOL)detachBacking
{
  return -[_MTLHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4
{
  -[_MTLHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (unint64_t)gpuAddress
{
  return self->_gpuAddress;
}

@end
