@implementation XRVMRegionAnnotation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initSamplingRegion:(id)a3 inTask:(unsigned int)a4
{
  id v6;
  XRVMRegionAnnotation *v7;
  unint64_t *v8;
  uint64_t v9;
  unint64_t *v10;
  FILE *v11;
  int v12;
  int *v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  mach_vm_size_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int *pageMap;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  BOOL v36;
  mach_vm_size_t dispositions_count;
  objc_super v39;

  v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)XRVMRegionAnnotation;
  v7 = -[XRVMRegionAnnotation init](&v39, sel_init);
  if (v7)
  {
    v8 = (unint64_t *)MEMORY[0x24BDB03A8];
    v9 = *MEMORY[0x24BDB03A8];
    v10 = (unint64_t *)MEMORY[0x24BDB03C8];
    if (*MEMORY[0x24BDB03A8] >= *MEMORY[0x24BDB03C8])
      v9 = *MEMORY[0x24BDB03C8];
    if (v9 != 4096 && v9 != 0x4000)
      sub_222BC65DC();
    LODWORD(dispositions_count) = v9;
    if (sysctlbyname("vm.self_region_page_size", 0, 0, &dispositions_count, 4uLL) && *__error() != 2)
    {
      v11 = (FILE *)*MEMORY[0x24BDAC8D8];
      v12 = *__error();
      v13 = __error();
      v14 = strerror(*v13);
      fprintf(v11, "Error setting sysctl %s: (%d) %s\n", "vm.self_region_page_size", v12, v14);
    }
    v15 = objc_msgSend(v6, "location");
    v16 = (uint64_t *)MEMORY[0x24BDB0398];
    v17 = (uint64_t *)MEMORY[0x24BDB03B8];
    v18 = *MEMORY[0x24BDB0398];
    if (*MEMORY[0x24BDB0398] >= *MEMORY[0x24BDB03B8])
      v18 = *MEMORY[0x24BDB03B8];
    v19 = v15 & ~v18;
    v7->_baseAddress = v19;
    v20 = objc_msgSend(v6, "virtualSize");
    v21 = *v16;
    if (*v16 >= (unint64_t)*v17)
      v21 = *v17;
    v22 = (v19 + v20 + v21) & ~v21;
    v23 = v22 - v7->_baseAddress;
    v24 = *v8;
    if (*v8 >= *v10)
      v24 = *v10;
    v25 = v23 / v24;
    dispositions_count = v23 / v24;
    v7->_vpages = objc_msgSend(v6, "virtualPages");
    v7->_pageMap = (int *)malloc_type_calloc(v25, 4uLL, 0x100004052888210uLL);
    v7->_pageSize = objc_msgSend(v6, "pageSize");
    if (!mach_vm_page_range_query(a4, v7->_baseAddress, v22 - v7->_baseAddress, (mach_vm_address_t)v7->_pageMap, &dispositions_count))
    {
      v26 = dispositions_count;
      if (dispositions_count)
      {
        LODWORD(v27) = 0;
        LODWORD(v28) = 0;
        LODWORD(v29) = 0;
        LODWORD(v30) = 0;
        pageMap = (unsigned int *)v7->_pageMap;
        do
        {
          v32 = *pageMap++;
          v33 = ((v32 >> 4) & 1) + v28;
          v34 = ((v32 >> 3) & 1) + v29;
          v35 = ((v32 >> 6) & 1) + v27;
          v36 = (v32 & 1) == 0;
          if ((v32 & 1) != 0)
            v30 = (v30 + 1);
          else
            v30 = v30;
          if (v36)
            v29 = v29;
          else
            v29 = v34;
          if (v36)
            v28 = v33;
          else
            v28 = v28;
          if (v36)
            v27 = v27;
          else
            v27 = v35;
          --v26;
        }
        while (v26);
      }
      else
      {
        v30 = 0;
        v29 = 0;
        v28 = 0;
        v27 = 0;
      }
      objc_msgSend(v6, "_setResident:dirty:swapped:speculative:", v30, v29, v28, v27);
    }
  }

  return v7;
}

- (int)dispositionForPage:(unint64_t)a3
{
  uint64_t v3;
  unint64_t v4;
  unint64_t baseAddress;
  BOOL v6;
  unint64_t v7;
  unint64_t v8;

  v3 = *MEMORY[0x24BDB0398];
  if (*MEMORY[0x24BDB0398] >= *MEMORY[0x24BDB03B8])
    v3 = *MEMORY[0x24BDB03B8];
  v4 = a3 & ~v3;
  baseAddress = self->_baseAddress;
  v6 = v4 >= baseAddress;
  v7 = v4 - baseAddress;
  if (v6 && (v8 = v7 / self->_pageSize, v8 < self->_vpages))
    return self->_pageMap[v8];
  else
    return 0;
}

- (void)dealloc
{
  int *pageMap;
  objc_super v4;

  pageMap = self->_pageMap;
  if (pageMap)
    free(pageMap);
  v4.receiver = self;
  v4.super_class = (Class)XRVMRegionAnnotation;
  -[XRVMRegionAnnotation dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int *pageMap;
  uint64_t v6;
  unint64_t vpages;
  unint64_t v8;
  uint64_t v9;
  int *v10;
  int v11;
  unint64_t v12;
  int v13;
  unint64_t i;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    v18 = DTXPrimitiveArrayCreateWithTypesAndValues();
    pageMap = self->_pageMap;
    v6 = *pageMap;
    vpages = self->_vpages;
    if (vpages < 2)
    {
      v9 = 1;
    }
    else
    {
      v8 = 1;
      LODWORD(v9) = 1;
      do
      {
        if ((_DWORD)v6 == pageMap[v8])
        {
          v9 = (v9 + 1);
        }
        else
        {
          DTXPrimitiveArrayAppendValues();
          pageMap = self->_pageMap;
          v6 = pageMap[v8];
          vpages = self->_vpages;
          v9 = 1;
        }
        ++v8;
      }
      while (v8 < vpages);
    }
    v16 = v6;
    v15 = v9;
    DTXPrimitiveArrayAppendValues();
    v17 = 0;
    objc_msgSend(v4, "encodeBytes:length:forKey:", DTXPrimitiveArrayGetSerialized(), 0, CFSTR("dataList"), v15, 3, v16, 3, 0, 0);
    DTXPrimitiveArrayDestroy();
  }
  else
  {
    objc_msgSend(v4, "encodeValueOfObjCType:at:", "Q", &self->_baseAddress);
    objc_msgSend(v4, "encodeValueOfObjCType:at:", "I", &self->_vpages);
    LODWORD(v18) = 1;
    v10 = self->_pageMap;
    v11 = *v10;
    v17 = *v10;
    v12 = self->_vpages;
    if (v12 >= 2)
    {
      v13 = 1;
      for (i = 1; i < v12; ++i)
      {
        if (v11 == v10[i])
        {
          ++v13;
        }
        else
        {
          objc_msgSend(v4, "encodeValueOfObjCType:at:", "I", &v18);
          objc_msgSend(v4, "encodeValueOfObjCType:at:", "I", &v17);
          v10 = self->_pageMap;
          v11 = v10[i];
          v17 = v11;
          v12 = self->_vpages;
          v13 = 1;
        }
        LODWORD(v18) = v13;
      }
    }
    objc_msgSend(v4, "encodeValueOfObjCType:at:", "I", &v18);
    objc_msgSend(v4, "encodeValueOfObjCType:at:", "I", &v17);
    v17 = 0;
    objc_msgSend(v4, "encodeValueOfObjCType:at:", "I", &v17);
  }

}

- (XRVMRegionAnnotation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  const __CFArray *v6;
  unsigned int v7;
  unsigned int Count;
  int v9;
  unsigned int i;
  int v11;
  int v12;
  int v13;
  int *pageMap;
  int v15;
  int v16;
  unsigned int v17;
  int *v18;
  int v20;
  uint64_t v21;

  v4 = a3;
  v5 = v4;
  if (self)
  {
    if (objc_msgSend(v4, "allowsKeyedCoding"))
    {
      v21 = 0;
      objc_msgSend(objc_retainAutorelease(v5), "decodeBytesForKey:returnedLength:", CFSTR("dataList"), &v21);
      DTXPrimitiveArrayReferencingSerialized();
      v6 = (const __CFArray *)CFArrayCreateWithDTXPrimitiveArray();
      self->_baseAddress = objc_msgSend((id)CFArrayGetValueAtIndex(v6, 0), "unsignedLongLongValue");
      v7 = objc_msgSend((id)CFArrayGetValueAtIndex(v6, 1), "unsignedIntValue");
      self->_vpages = v7;
      self->_pageMap = (int *)malloc_type_calloc(v7, 4uLL, 0x100004052888210uLL);
      Count = CFArrayGetCount(v6);
      if (Count >= 3)
      {
        v9 = 0;
        for (i = 2; i < Count; i += 2)
        {
          v11 = objc_msgSend((id)CFArrayGetValueAtIndex(v6, i), "unsignedIntValue");
          if (v11)
          {
            v12 = v11;
            v13 = objc_msgSend((id)CFArrayGetValueAtIndex(v6, i | 1), "unsignedIntValue");
            pageMap = self->_pageMap;
            v15 = v12 + v9;
            do
            {
              pageMap[v9++] = v13;
              --v12;
            }
            while (v12);
            v9 = v15;
          }
        }
      }
      CFRelease(v6);
    }
    else
    {
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "Q", &self->_baseAddress, 8);
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "I", &self->_vpages, 4);
      self->_pageMap = (int *)malloc_type_calloc(self->_vpages, 4uLL, 0x100004052888210uLL);
      v20 = 0;
      LODWORD(v21) = 0;
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "I", &v21, 4);
      if ((_DWORD)v21)
      {
        v16 = 0;
        do
        {
          objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "I", &v20, 4);
          if ((_DWORD)v21)
          {
            v17 = 0;
            v18 = self->_pageMap;
            do
              v18[v16 + v17++] = v20;
            while (v17 < v21);
            v16 += v17;
          }
          objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "I", &v21, 4);
        }
        while ((_DWORD)v21);
      }
    }
  }

  return self;
}

- (unint64_t)pageSize
{
  return self->_pageSize;
}

- (void)setPageSize:(unint64_t)a3
{
  self->_pageSize = a3;
}

@end
