@implementation MTLHeapDescriptorInternal

- (BOOL)validateWithDevice:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int64_t var5;
  const __CFString *v13;
  char v14;
  MTLHeapDescriptorPrivate *v15;
  unint64_t var2;
  unint64_t var1;
  const __CFString *v18;
  char v19;
  char v20;
  BOOL v21;
  const __CFString *v23;
  _OWORD v24[3];
  uint64_t v25;

  v25 = 0;
  memset(v24, 0, sizeof(v24));
  _MTLMessageContextBegin_((uint64_t)v24, (uint64_t)"-[MTLHeapDescriptorInternal validateWithDevice:]", 364, (uint64_t)a3, 2, (uint64_t)"Heap Descriptor Validation");
  v10 = objc_msgSend(a3, "supportsSharedStorageHeapResources");
  v11 = 0;
  var5 = self->_private->var5;
  if (!var5)
    goto LABEL_7;
  if (var5 == 2)
  {
    v11 = 1;
    if ((objc_msgSend(a3, "supportsSparseHeaps") & 1) == 0)
    {
      v13 = CFSTR("Sparse heaps are not supported.");
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  if (var5 != 1)
  {
    v13 = CFSTR("Unknown heap type.");
    goto LABEL_10;
  }
  v11 = 0;
  if ((objc_msgSend(a3, "isPlacementHeapSupported") & 1) != 0)
  {
LABEL_7:
    v14 = 1;
    goto LABEL_11;
  }
  v13 = CFSTR("Placement heap type is not supported.");
LABEL_10:
  _MTLMessageContextPush_((uint64_t)v24, 4, (uint64_t)v13, v5, v6, v7, v8, v9, (uint64_t)v23);
  v14 = 0;
LABEL_11:
  v15 = self->_private;
  var2 = v15->var2;
  if (var2 >= 2)
  {
    _MTLMessageContextPush_((uint64_t)v24, 4, (uint64_t)CFSTR("Invalid cpuCacheMode (%@)"), v5, v6, v7, v8, v9, (uint64_t)CFSTR("Invalid"));
    v15 = self->_private;
  }
  var1 = v15->var1;
  if (var1 == 2)
    goto LABEL_19;
  if (!var1)
  {
    if ((v11 | v10 ^ 1) == 1)
    {
      if (v11)
        v18 = CFSTR("Sparse heap cannot have shared storage mode");
      else
        v18 = CFSTR("Shared storage mode disallowed");
      goto LABEL_21;
    }
LABEL_19:
    v19 = 1;
    goto LABEL_22;
  }
  v23 = CFSTR("Invalid");
  v18 = CFSTR("Invalid storageMode (%@)");
LABEL_21:
  _MTLMessageContextPush_((uint64_t)v24, 4, (uint64_t)v18, v5, v6, v7, v8, v9, (uint64_t)v23);
  v19 = 0;
LABEL_22:
  v20 = v14 & v19;
  if (*(_QWORD *)&v24[0])
    v20 = 0;
  if (var2 < 2)
    v21 = v20;
  else
    v21 = 0;
  _MTLMessageContextEnd((uint64_t)v24);
  return v21;
}

- (unint64_t)resourceOptions
{
  return self->_private->var6;
}

- (int64_t)type
{
  return self->_private->var5;
}

- (unint64_t)hazardTrackingMode
{
  return (self->_private->var6 >> 8) & 3;
}

- (const)descriptorPrivate
{
  return self->_private;
}

- (unint64_t)size
{
  return self->_private->var0;
}

- (unint64_t)protectionOptions
{
  return self->_private->var8;
}

- (unint64_t)pinnedGPUAddress
{
  return self->_private->var7;
}

- (unint64_t)memoryPoolId
{
  return self->_private->var9;
}

- (void)setSize:(unint64_t)a3
{
  self->_private->var0 = a3;
}

- (void)setStorageMode:(unint64_t)a3
{
  MTLHeapDescriptorPrivate *v3;

  v3 = self->_private;
  v3->var1 = a3;
  v3->var6 = v3->var6 & 0xFFFFFFFFFFFFFF0FLL | (16 * a3);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_private);

  self->_addressRanges = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLHeapDescriptorInternal;
  -[MTLHeapDescriptorInternal dealloc](&v3, sel_dealloc);
}

- (void)setHazardTrackingMode:(unint64_t)a3
{
  self->_private->var6 = self->_private->var6 & 0xFFFFFFFFFFFFFCFFLL | (a3 << 8);
}

- (void)setProtectionOptions:(unint64_t)a3
{
  self->_private->var8 = a3;
}

- (void)setResourceOptions:(unint64_t)a3
{
  MTLHeapDescriptorPrivate *v3;

  v3 = self->_private;
  v3->var6 = a3;
  v3->var1 = a3 >> 4;
  v3->var2 = a3 & 0xF;
}

- (void)setCpuCacheMode:(unint64_t)a3
{
  MTLHeapDescriptorPrivate *v3;

  v3 = self->_private;
  v3->var2 = a3;
  v3->var6 = v3->var6 & 0xFFFFFFFFFFFFFFF0 | a3;
}

- (MTLHeapDescriptorInternal)init
{
  MTLHeapDescriptorInternal *v2;
  char *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLHeapDescriptorInternal;
  v2 = -[MTLHeapDescriptorInternal init](&v5, sel_init);
  if (v2)
  {
    v3 = (char *)malloc_type_calloc(1uLL, 0x50uLL, 0x1000040E69F3CC4uLL);
    v2->_private = (MTLHeapDescriptorPrivate *)v3;
    if (v3)
    {
      *(_OWORD *)v3 = xmmword_182809F50;
      *((_OWORD *)v3 + 1) = xmmword_18281A040;
      v3[32] = 1;
      *(_OWORD *)(v3 + 40) = xmmword_18281A050;
      *((_QWORD *)v3 + 8) = 0;
      *((_QWORD *)v3 + 9) = 0;
      *((_QWORD *)v3 + 7) = 0;
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)setType:(int64_t)a3
{
  self->_private->var5 = a3;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  int v6;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class != object_getClass(a3)
      || (-[MTLHeapDescriptorInternal addressRanges](self, "addressRanges") != 0) == (*((_QWORD *)a3 + 3) == 0))
    {
      LOBYTE(v6) = 0;
    }
    else if (!-[MTLHeapDescriptorInternal addressRanges](self, "addressRanges")
           || (v6 = objc_msgSend(-[MTLHeapDescriptorInternal addressRanges](self, "addressRanges"), "isEqual:", *((_QWORD *)a3 + 3))) != 0)
    {
      LOBYTE(v6) = memcmp(self->_private, *((const void **)a3 + 2), 0x50uLL) == 0;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  unsigned int v3;

  v3 = _MTLHashState((int *)self->_private, 0x50uLL);
  return -[MTLResourceAddressRangeArray hash](self->_addressRanges, "hash") + v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  _OWORD *v6;
  MTLHeapDescriptorPrivate *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  if (v4)
  {
    v6 = *(_OWORD **)(v4 + 16);
    v7 = self->_private;
    *v6 = *(_OWORD *)&v7->var0;
    v8 = *(_OWORD *)&v7->var8;
    v10 = *(_OWORD *)&v7->var2;
    v9 = *(_OWORD *)&v7->var4;
    v6[3] = *(_OWORD *)&v7->var6;
    v6[4] = v8;
    v6[1] = v10;
    v6[2] = v9;
    *(_QWORD *)(v4 + 24) = -[MTLResourceAddressRangeArray copy](self->_addressRanges, "copy");
  }
  return v5;
}

- (unint64_t)cpuCacheMode
{
  return self->_private->var2;
}

- (unint64_t)storageMode
{
  return self->_private->var1;
}

- (int64_t)sparsePageSize
{
  return self->_private->var3;
}

- (void)setSparsePageSize:(int64_t)a3
{
  self->_private->var3 = a3;
}

- (BOOL)sparsePageAccessCountersEnabled
{
  return self->_private->var4;
}

- (void)setSparsePageAccessCountersEnabled:(BOOL)a3
{
  self->_private->var4 = a3;
}

- (id)description
{
  return -[MTLHeapDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  unint64_t var6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  uint64_t v11;
  const __CFString *v12;
  int64_t var5;
  const __CFString *v14;
  const __CFString *v15;
  MTLResourceAddressRangeArray *addressRanges;
  const __CFString *v17;
  objc_super v19;
  _QWORD v20[23];

  v20[21] = *MEMORY[0x1E0C80C00];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  var6 = self->_private->var6;
  v7 = CFSTR("MTLStorageModePrivate");
  if (var6 >> 4 != 2)
    v7 = CFSTR("Invalid");
  v8 = (void *)MEMORY[0x1E0CB3940];
  v19.receiver = self;
  v19.super_class = (Class)MTLHeapDescriptorInternal;
  if (var6 >> 4)
    v9 = v7;
  else
    v9 = CFSTR("MTLStorageModeShared");
  v10 = -[MTLHeapDescriptorInternal description](&v19, sel_description);
  v20[0] = v5;
  v20[1] = CFSTR("size =");
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_private->var0);
  v12 = CFSTR("MTLCPUCacheModeDefaultCache");
  v20[2] = v11;
  v20[3] = v5;
  if ((var6 & 0xF) != 0)
    v12 = CFSTR("Invalid");
  if ((var6 & 0xF) == 1)
    v12 = CFSTR("MTLCPUCacheModeWriteCombined");
  v20[4] = CFSTR("cpuCacheMode =");
  v20[5] = v12;
  v20[6] = v5;
  v20[7] = CFSTR("storageMode =");
  v20[8] = v9;
  v20[9] = v5;
  v20[10] = CFSTR("hazardTrackingMode =");
  v20[11] = MTLHazardTrackingModeString((var6 >> 8) & 3);
  v20[12] = v5;
  v20[13] = CFSTR("resourceOptions =");
  v20[14] = MTLResourceOptionsString(var6);
  v20[15] = v5;
  v20[16] = CFSTR("type =");
  var5 = self->_private->var5;
  v14 = CFSTR("MTLHeapTypePlacement");
  if (var5 != 1)
    v14 = CFSTR("Invalid");
  if (var5)
    v15 = v14;
  else
    v15 = CFSTR("MTLHeapTypeAutomatic");
  v20[17] = v15;
  v20[18] = v5;
  v20[19] = CFSTR("addressRanges =");
  addressRanges = self->_addressRanges;
  if (addressRanges)
    v17 = -[MTLResourceAddressRangeArray formattedDescription:](addressRanges, "formattedDescription:", v4);
  else
    v17 = CFSTR("nil");
  v20[20] = v17;
  return (id)objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@"), v10, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 21), "componentsJoinedByString:", CFSTR(" ")));
}

- (void)setPinnedGPUAddress:(unint64_t)a3
{
  self->_private->var7 = a3;
}

- (void)setMemoryPoolId:(unint64_t)a3
{
  self->_private->var9 = a3;
}

- (void)setAddressRanges:(id)a3
{
  MTLResourceAddressRangeArray *addressRanges;

  addressRanges = self->_addressRanges;
  if (addressRanges != a3)
  {

    self->_addressRanges = (MTLResourceAddressRangeArray *)a3;
  }
}

- (id)addressRanges
{
  return self->_addressRanges;
}

@end
