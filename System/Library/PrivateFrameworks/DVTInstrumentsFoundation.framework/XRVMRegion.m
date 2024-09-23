@implementation XRVMRegion

+ (unint64_t)regionIndexInArray:(id)a3 forAddress:(unint64_t)a4
{
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  unint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v5 = (const __CFArray *)a3;
  v6 = v5;
  if (v5)
  {
    Count = CFArrayGetCount(v5);
    v8 = Count - 1;
    if (Count >= 1)
    {
      v9 = Count;
      CFArrayGetValueAtIndex(v6, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = objc_msgSend(v10, "unsignedLongLongValue");
      else
        v11 = v10[1];

      if (v11 <= a4)
      {
        v10 = v10;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = objc_msgSend(v10, "unsignedLongLongValue");

        }
        else
        {
          v14 = v10[1];
          v15 = v10[2];

          v13 = v15 + v14;
        }
        if (v13 > a4)
        {
          v12 = 0;
          goto LABEL_14;
        }
        CFArrayGetValueAtIndex(v6, v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v17;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = objc_msgSend(v10, "unsignedLongLongValue");

        }
        else
        {
          v19 = v10[1];
          v20 = v10[2];

          v18 = v20 + v19;
        }
        if (v18 > a4)
        {
          v10 = v10;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v21 = objc_msgSend(v10, "unsignedLongLongValue");
          else
            v21 = v10[1];

          if (v21 <= a4)
          {
            v12 = v8;
            goto LABEL_14;
          }
          if (v9 >= 3)
          {
            v22 = 0;
            v23 = v10;
            while (1)
            {
              v24 = v8 + v22;
              if ((uint64_t)(v8 + v22) < 0 != __OFADD__(v8, v22))
                ++v24;
              v12 = v24 >> 1;
              CFArrayGetValueAtIndex(v6, v24 >> 1);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              v23 = v25;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v26 = objc_msgSend(v23, "unsignedLongLongValue");
              else
                v26 = v23[1];

              if (v26 <= a4)
              {
                v10 = v23;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v27 = objc_msgSend(v10, "unsignedLongLongValue");

                }
                else
                {
                  v28 = v10[1];
                  v29 = v10[2];

                  v27 = v29 + v28;
                }
                v22 = v12;
                if (v27 > a4)
                  goto LABEL_14;
              }
              else
              {
                v8 = v12;
              }
              v12 = 0x7FFFFFFFFFFFFFFFLL;
              v10 = v23;
              if ((uint64_t)(v8 - v22) <= 1)
                goto LABEL_14;
            }
          }
        }
      }
      v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

      goto LABEL_15;
    }
  }
  v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    MEMORY[0x24BEDD108](a1, sel_setVersion_);
}

- (XRVMRegion)initWithAddress:(unint64_t)a3 size:(unint64_t)a4 regionInfo:(vm_region_submap_info_64 *)a5
{
  XRVMRegion *result;
  _QWORD *v9;
  unsigned int *v10;
  unint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)XRVMRegion;
  result = -[XRVMRegion init](&v12, sel_init);
  if (result)
  {
    result->start = a3;
    result->length = a4;
    result->current_prot = a5->protection;
    result->max_prot = a5->max_protection;
    result->external_pager = a5->external_pager;
    result->share_mode = a5->share_mode;
    result->user_tag = a5->user_tag;
    v9 = (_QWORD *)MEMORY[0x24BDB0398];
    result->is_submap = a5->is_submap != 0;
    if (*v9 >= *MEMORY[0x24BDB03B8])
      v10 = (unsigned int *)MEMORY[0x24BDB03C0];
    else
      v10 = (unsigned int *)MEMORY[0x24BDB03A0];
    result->region_page_shift = *v10;
    result->pages_resident = a5->pages_resident;
    result->pages_dirtied = a5->pages_dirtied;
    result->pages_swapped_out = a5->pages_swapped_out;
    result->pages_shared_now_private = a5->pages_shared_now_private;
    v11 = *MEMORY[0x24BDB03A8];
    if (*MEMORY[0x24BDB03A8] >= *MEMORY[0x24BDB03C8])
      v11 = *MEMORY[0x24BDB03C8];
    result->_pageSize = v11;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->start;
  *((_QWORD *)result + 2) = self->length;
  *((_DWORD *)result + 6) = self->current_prot;
  *((_DWORD *)result + 7) = self->max_prot;
  *((_BYTE *)result + 32) = self->external_pager;
  *((_BYTE *)result + 33) = self->share_mode;
  *((_BYTE *)result + 34) = self->user_tag;
  *((_BYTE *)result + 35) = self->is_submap;
  *((_DWORD *)result + 19) = self->region_page_shift;
  *((_QWORD *)result + 10) = self->_pageSize;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t start;
  unint64_t length;
  uint64_t current_prot;
  uint64_t max_prot;
  uint64_t v8;
  uint64_t pages_resident;
  uint64_t pages_shared_now_private;
  uint64_t pages_swapped_out;
  uint64_t pages_dirtied;
  uint64_t ref_count;
  uint64_t region_page_shift;
  id v15;

  v15 = a3;
  if (objc_msgSend(v15, "allowsKeyedCoding"))
  {
    region_page_shift = self->region_page_shift;
    ref_count = self->ref_count;
    pages_dirtied = self->pages_dirtied;
    pages_swapped_out = self->pages_swapped_out;
    pages_shared_now_private = self->pages_shared_now_private;
    pages_resident = self->pages_resident;
    v8 = bswap32(*(_DWORD *)&self->external_pager);
    max_prot = self->max_prot;
    current_prot = self->current_prot;
    length = self->length;
    start = self->start;
    DTXPrimitiveArrayCreateWithTypesAndValues();
    objc_msgSend(v15, "encodeBytes:length:forKey:", DTXPrimitiveArrayGetSerialized(), 0, CFSTR("dataList"), start, 6, length, 3, current_prot, 3, max_prot, 3, v8, 3, pages_resident, 3, pages_shared_now_private, 3,
      pages_swapped_out,
      3,
      pages_dirtied,
      3,
      ref_count,
      3,
      region_page_shift,
      0);
    DTXPrimitiveArrayDestroy();
    objc_msgSend(v15, "encodeObject:forKey:", self->path, CFSTR("path"));
    objc_msgSend(v15, "encodeObject:forKey:", self->type, CFSTR("type"));
  }
  else
  {
    objc_msgSend(v15, "encodeValueOfObjCType:at:", "Q", &self->start);
    objc_msgSend(v15, "encodeValueOfObjCType:at:", "Q", &self->length);
    objc_msgSend(v15, "encodeValueOfObjCType:at:", "i", &self->current_prot);
    objc_msgSend(v15, "encodeValueOfObjCType:at:", "i", &self->max_prot);
    objc_msgSend(v15, "encodeValueOfObjCType:at:", "C", &self->external_pager);
    objc_msgSend(v15, "encodeValueOfObjCType:at:", "C", &self->share_mode);
    objc_msgSend(v15, "encodeValueOfObjCType:at:", "C", &self->user_tag);
    objc_msgSend(v15, "encodeValueOfObjCType:at:", "B", &self->is_submap);
    objc_msgSend(v15, "encodeValueOfObjCType:at:", "I", &self->pages_resident);
    objc_msgSend(v15, "encodeValueOfObjCType:at:", "I", &self->pages_shared_now_private);
    objc_msgSend(v15, "encodeValueOfObjCType:at:", "I", &self->pages_swapped_out);
    objc_msgSend(v15, "encodeValueOfObjCType:at:", "I", &self->pages_dirtied);
    objc_msgSend(v15, "encodeValueOfObjCType:at:", "I", &self->ref_count);
    objc_msgSend(v15, "encodeValueOfObjCType:at:", "I", &self->region_page_shift);
    objc_msgSend(v15, "encodeObject:", self->path);
    objc_msgSend(v15, "encodeObject:", self->type);
    objc_msgSend(v15, "encodeObject:", 0);
  }

}

- (XRVMRegion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const __CFArray *v7;
  int v8;
  unsigned int v9;
  unsigned int *v10;
  NSString *v11;
  NSString *path;
  NSString *v13;
  NSString *type;
  unsigned int *v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  id v20;
  unint64_t v21;
  uint64_t v23;

  v4 = a3;
  v5 = v4;
  if (self)
  {
    if (objc_msgSend(v4, "allowsKeyedCoding"))
    {
      v23 = 0;
      v6 = objc_retainAutorelease(v5);
      objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("dataList"), &v23);
      DTXPrimitiveArrayReferencingSerialized();
      v7 = (const __CFArray *)CFArrayCreateWithDTXPrimitiveArray();
      self->start = objc_msgSend((id)CFArrayGetValueAtIndex(v7, 0), "unsignedLongLongValue");
      self->length = objc_msgSend((id)CFArrayGetValueAtIndex(v7, 1), "unsignedLongLongValue");
      self->current_prot = objc_msgSend((id)CFArrayGetValueAtIndex(v7, 2), "unsignedIntValue");
      self->max_prot = objc_msgSend((id)CFArrayGetValueAtIndex(v7, 3), "unsignedIntValue");
      v8 = objc_msgSend((id)CFArrayGetValueAtIndex(v7, 4), "unsignedIntValue");
      self->external_pager = HIBYTE(v8);
      self->share_mode = BYTE2(v8);
      self->user_tag = BYTE1(v8);
      self->is_submap = v8 != 0;
      self->pages_resident = objc_msgSend((id)CFArrayGetValueAtIndex(v7, 5), "unsignedIntValue");
      self->pages_shared_now_private = objc_msgSend((id)CFArrayGetValueAtIndex(v7, 6), "unsignedIntValue");
      self->pages_swapped_out = objc_msgSend((id)CFArrayGetValueAtIndex(v7, 7), "unsignedIntValue");
      self->pages_dirtied = objc_msgSend((id)CFArrayGetValueAtIndex(v7, 8), "unsignedIntValue");
      self->ref_count = objc_msgSend((id)CFArrayGetValueAtIndex(v7, 9), "unsignedIntValue");
      if (CFArrayGetCount(v7) < 11)
      {
        if (*MEMORY[0x24BDB0398] >= *MEMORY[0x24BDB03B8])
          v10 = (unsigned int *)MEMORY[0x24BDB03C0];
        else
          v10 = (unsigned int *)MEMORY[0x24BDB03A0];
        v9 = *v10;
      }
      else
      {
        v9 = objc_msgSend((id)CFArrayGetValueAtIndex(v7, 10), "unsignedIntValue");
      }
      self->region_page_shift = v9;
      CFRelease(v7);
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      path = self->path;
      self->path = v11;

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      type = self->type;
      self->type = v13;

    }
    else
    {
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "Q", &self->start, 8);
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "Q", &self->length, 8);
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "i", &self->current_prot, 4);
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "i", &self->max_prot, 4);
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "C", &self->external_pager, 1);
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "C", &self->share_mode, 1);
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "C", &self->user_tag, 1);
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "B", &self->is_submap, 1);
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "I", &self->pages_resident, 4);
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "I", &self->pages_shared_now_private, 4);
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "I", &self->pages_swapped_out, 4);
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "I", &self->pages_dirtied, 4);
      objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "I", &self->ref_count, 4);
      if (objc_msgSend(v5, "versionForClassName:", CFSTR("XRVMRegion")) < 2)
      {
        if (*MEMORY[0x24BDB0398] >= *MEMORY[0x24BDB03B8])
          v15 = (unsigned int *)MEMORY[0x24BDB03C0];
        else
          v15 = (unsigned int *)MEMORY[0x24BDB03A0];
        self->region_page_shift = *v15;
      }
      else
      {
        objc_msgSend(v5, "decodeValueOfObjCType:at:size:", "I", &self->region_page_shift, 4);
      }
      objc_msgSend(v5, "decodeObject");
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      v17 = self->path;
      self->path = v16;

      objc_msgSend(v5, "decodeObject");
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v19 = self->type;
      self->type = v18;

      v20 = (id)objc_msgSend(v5, "decodeObject");
    }
    v21 = *MEMORY[0x24BDB03A8];
    if (*MEMORY[0x24BDB03A8] >= *MEMORY[0x24BDB03C8])
      v21 = *MEMORY[0x24BDB03C8];
    self->_pageSize = v21;
  }

  return self;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *path;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)XRVMRegion;
  -[XRVMRegion description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[XRVMRegion displayType](self, "displayType");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  path = (const __CFString *)self->path;
  if (!path)
  {
    if (self->is_submap)
      path = CFSTR("(submap)");
    else
      path = &stru_24EB2CF78;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@  %16@ %#16llx-%#16llx %1x/%1x %@"), v4, v5, self->start, self->length + self->start, self->current_prot, self->max_prot, path);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  XRVMRegion *v4;
  XRVMRegion *v5;
  XRVMRegion *v6;
  NSString *path;
  NSString *v8;
  BOOL v9;
  objc_super v11;

  v4 = (XRVMRegion *)a3;
  if (v4 == self)
  {
    v9 = 1;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)XRVMRegion;
    v9 = -[XRVMRegion isEqual:](&v11, sel_isEqual_, v4);
    goto LABEL_20;
  }
  v5 = v4;
  v6 = v5;
  if (self->start == v5->start
    && self->length == v5->length
    && self->current_prot == v5->current_prot
    && self->max_prot == v5->max_prot
    && self->user_tag == v5->user_tag
    && self->pages_resident == v5->pages_resident
    && self->pages_shared_now_private == v5->pages_shared_now_private
    && self->pages_swapped_out == v5->pages_swapped_out
    && self->pages_dirtied == v5->pages_dirtied)
  {
    path = self->path;
    if (!path)
    {
      v9 = 1;
      goto LABEL_17;
    }
    v8 = v6->path;
    v9 = 1;
    if (!v8 || path == v8 || -[NSString isEqualToString:](path, "isEqualToString:"))
      goto LABEL_17;
  }
  v9 = 0;
LABEL_17:

LABEL_20:
  return v9;
}

- (BOOL)matchesAddr:(unint64_t)a3 size:(unint64_t)a4 regionInfo:(vm_region_submap_info_64 *)a5
{
  return self->start == a3
      && self->length == a4
      && self->current_prot == a5->protection
      && self->max_prot == a5->max_protection
      && a5->user_tag == self->user_tag
      && self->pages_resident == a5->pages_resident
      && self->pages_shared_now_private == a5->pages_shared_now_private
      && self->pages_swapped_out == a5->pages_swapped_out
      && self->pages_dirtied == a5->pages_dirtied;
}

- (BOOL)regionMatch:(id)a3
{
  char *v4;
  char *v5;
  BOOL v6;

  v4 = (char *)a3;
  v5 = v4;
  v6 = *(_OWORD *)&self->start == *(_OWORD *)(v4 + 8) && -[XRVMRegion typeMatches:](self, "typeMatches:", v4);

  return v6;
}

- (BOOL)typeMatches:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  NSString *type;
  NSString *v7;
  NSString *path;
  NSString *v9;
  BOOL v10;

  v4 = a3;
  v5 = v4;
  v10 = 0;
  if (v4)
  {
    if (self->current_prot == *((_DWORD *)v4 + 6)
      && self->max_prot == *((_DWORD *)v4 + 7)
      && self->user_tag == *((unsigned __int8 *)v4 + 34)
      && self->external_pager == *((unsigned __int8 *)v4 + 32))
    {
      type = self->type;
      if (!type
        || (v7 = (NSString *)v5[6]) == 0
        || type == v7
        || -[NSString isEqualToString:](type, "isEqualToString:"))
      {
        path = self->path;
        if (!path
          || (v9 = (NSString *)v5[5]) == 0
          || path == v9
          || -[NSString isEqualToString:](path, "isEqualToString:"))
        {
          v10 = 1;
        }
      }
    }
  }

  return v10;
}

- (BOOL)isAdjacentTo:(id)a3
{
  unint64_t start;
  uint64_t v4;

  if (!a3)
    return 0;
  start = self->start;
  v4 = *((_QWORD *)a3 + 1);
  return start == *((_QWORD *)a3 + 2) + v4 || self->length + start == v4;
}

- (void)setPath:(id)a3 type:(id)a4
{
  id v6;
  NSString *path;
  NSString *v8;
  NSString *v9;
  NSString *type;
  NSString *v11;
  NSString *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  path = self->path;
  if (!path || !-[NSString isEqualToString:](path, "isEqualToString:", v13))
  {
    v8 = (NSString *)objc_msgSend(v13, "copy");
    v9 = self->path;
    self->path = v8;

  }
  type = self->type;
  if (!type || !-[NSString isEqualToString:](type, "isEqualToString:", v6))
  {
    v11 = (NSString *)objc_msgSend(v6, "copy");
    v12 = self->type;
    self->type = v11;

  }
}

- (void)setAddress:(unint64_t)a3 size:(unint64_t)a4
{
  self->start = a3;
  self->length = a4;
}

- (void)_setResident:(unsigned int)a3 dirty:(unsigned int)a4 swapped:(unsigned int)a5 speculative:(unsigned int)a6
{
  self->pages_resident = a3;
  self->pages_swapped_out = a5;
  self->pages_dirtied = a4;
}

- (BOOL)isSubmapRegion
{
  return self->is_submap;
}

- (unint64_t)location
{
  return self->start;
}

- (unint64_t)virtualSize
{
  uint64_t v2;

  v2 = *MEMORY[0x24BDB0398];
  if (*MEMORY[0x24BDB0398] >= *MEMORY[0x24BDB03B8])
    v2 = *MEMORY[0x24BDB03B8];
  return (v2 + self->length) & ~v2;
}

- (unsigned)virtualPages
{
  uint64_t v2;

  v2 = *MEMORY[0x24BDB0398];
  if (*MEMORY[0x24BDB0398] >= *MEMORY[0x24BDB03B8])
    v2 = *MEMORY[0x24BDB03B8];
  return ((v2 + self->length) & ~v2) / self->_pageSize;
}

- (unint64_t)residentSize
{
  return self->_pageSize * self->pages_resident;
}

- (unint64_t)dirtySize
{
  return self->_pageSize * self->pages_dirtied;
}

- (unint64_t)swappedSize
{
  return self->_pageSize * self->pages_swapped_out;
}

- (unsigned)tag
{
  return self->user_tag;
}

- (id)type
{
  return self->type;
}

- (id)path
{
  return self->path;
}

- (int)currentProtection
{
  int current_prot;

  current_prot = self->current_prot;
  if (current_prot >= 7)
    current_prot = 7;
  return current_prot & ~(current_prot >> 31);
}

- (int)maxProtection
{
  int max_prot;

  max_prot = self->max_prot;
  if (max_prot >= 7)
    max_prot = 7;
  return max_prot & ~(max_prot >> 31);
}

- (id)displayType
{
  NSString *type;

  type = self->type;
  if (type)
    return type;
  VMURegionTypeDescriptionForTagShareProtAndPager();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)displayPath
{
  if (self->path)
    return self->path;
  else
    return &stru_24EB2CF78;
}

- (BOOL)isNullRegion
{
  return !self->user_tag && !self->current_prot && !self->max_prot && self->share_mode == 3;
}

- (unint64_t)pageSize
{
  return self->_pageSize;
}

- (void)setPageSize:(unint64_t)a3
{
  self->_pageSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->type, 0);
  objc_storeStrong((id *)&self->path, 0);
}

@end
