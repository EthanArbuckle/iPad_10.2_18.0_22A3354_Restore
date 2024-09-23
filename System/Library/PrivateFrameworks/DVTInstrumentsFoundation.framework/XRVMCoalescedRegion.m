@implementation XRVMCoalescedRegion

- (XRVMCoalescedRegion)initWithRegions:(id)a3 groupName:(id)a4
{
  id v6;
  id v7;
  XRVMCoalescedRegion *v8;
  NSMutableArray *v9;
  NSMutableArray *subRegions;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)XRVMCoalescedRegion;
  v8 = -[XRVMCoalescedRegion init](&v30, sel_init);
  if (v8)
  {
    if (objc_msgSend(v6, "count"))
    {
      objc_storeStrong((id *)&v8->_groupName, a4);
      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      subRegions = v8->_subRegions;
      v8->_subRegions = v9;

      objc_msgSend(v6, "objectAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend((id)v11, "location");
      v13 = (uint64_t *)MEMORY[0x24BDB0398];
      v14 = (uint64_t *)MEMORY[0x24BDB03B8];
      v15 = *MEMORY[0x24BDB0398];
      if (*MEMORY[0x24BDB0398] >= *MEMORY[0x24BDB03B8])
        v15 = *MEMORY[0x24BDB03B8];
      v8->super.start = v12 & ~v15;
      objc_msgSend(v6, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "location");
      v18 = objc_msgSend(v16, "virtualSize");
      v19 = *v13;
      if (*v13 >= (unint64_t)*v14)
        v19 = *v14;
      v8->super.length = (v18 + v17 - v8->super.start + v19) & ~v19;
      -[XRVMRegion setPageSize:](v8, "setPageSize:", objc_msgSend((id)v11, "pageSize"));
      v8->super.current_prot = *(_DWORD *)(v11 + 24);
      v8->super.max_prot = *(_DWORD *)(v11 + 28);
      v8->super.external_pager = *(_BYTE *)(v11 + 32);
      v8->super.share_mode = *(_BYTE *)(v11 + 33);
      v8->super.user_tag = *(_BYTE *)(v11 + 34);
      objc_storeStrong((id *)&v8->super.path, *(id *)(v11 + 40));
      objc_storeStrong((id *)&v8->super.type, *(id *)(v11 + 48));
      v8->super.region_page_shift = *(_DWORD *)(v11 + 76);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v20 = v6;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v27;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v27 != v23)
              objc_enumerationMutation(v20);
            -[XRVMCoalescedRegion addRegion:](v8, "addRegion:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v24++), (_QWORD)v26);
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v22);
      }

    }
    else
    {
      v11 = (uint64_t)v8;
      v8 = 0;
    }

  }
  return v8;
}

- (void)addRegion:(id)a3
{
  unsigned __int8 *v4;
  char v5;
  int share_mode;
  NSString *path;
  NSString **p_path;
  NSString *v9;
  BOOL v10;
  void *v11;
  NSString *type;
  NSString **p_type;
  NSString *v14;
  BOOL v15;
  void *v16;
  unsigned int pages_shared_now_private;
  unsigned int pages_dirtied;
  unsigned __int8 *v19;

  v4 = (unsigned __int8 *)a3;
  if (!v4[35])
  {
    v19 = v4;
    -[NSMutableArray addObject:](self->_subRegions, "addObject:", v4);
    v5 = objc_msgSend(v19, "isNullRegion");
    v4 = v19;
    if ((v5 & 1) == 0)
    {
      self->_virtualSize += *((_QWORD *)v19 + 2);
      if (self->super.current_prot != *((_DWORD *)v19 + 6))
        self->_multiplicityFlags |= 1u;
      if (self->super.max_prot != *((_DWORD *)v19 + 7))
        self->_multiplicityFlags |= 2u;
      if (self->super.external_pager != v19[32])
        self->_multiplicityFlags |= 4u;
      share_mode = self->super.share_mode;
      if (share_mode != v19[33])
      {
        self->_multiplicityFlags |= 8u;
        share_mode = v19[33];
      }
      if (self->super.user_tag != share_mode)
        self->_multiplicityFlags |= 0x10u;
      p_path = &self->super.path;
      path = self->super.path;
      if (path
        || (v11 = (void *)*((_QWORD *)v19 + 5)) != 0
        && (objc_storeStrong((id *)&self->super.path, v11), v4 = v19, (path = *p_path) != 0))
      {
        v9 = (NSString *)*((_QWORD *)v4 + 5);
        if (v9)
        {
          if (path != v9)
          {
            v10 = -[NSString isEqualToString:](path, "isEqualToString:");
            v4 = v19;
            if (!v10)
              self->_multiplicityFlags |= 0x20u;
          }
        }
      }
      p_type = &self->super.type;
      type = self->super.type;
      if (type
        || (v16 = (void *)*((_QWORD *)v4 + 6)) != 0
        && (objc_storeStrong((id *)&self->super.type, v16), v4 = v19, (type = *p_type) != 0))
      {
        v14 = (NSString *)*((_QWORD *)v4 + 6);
        if (v14)
        {
          if (type != v14)
          {
            v15 = -[NSString isEqualToString:](type, "isEqualToString:");
            v4 = v19;
            if (!v15)
              self->_multiplicityFlags |= 0x40u;
          }
        }
      }
      pages_shared_now_private = self->super.pages_shared_now_private;
      self->super.pages_resident += *((_DWORD *)v4 + 14);
      self->super.pages_shared_now_private = pages_shared_now_private + *((_DWORD *)v4 + 15);
      pages_dirtied = self->super.pages_dirtied;
      self->super.pages_swapped_out += *((_DWORD *)v4 + 16);
      self->super.pages_dirtied = pages_dirtied + *((_DWORD *)v4 + 17);
    }
  }

}

- (unint64_t)virtualSize
{
  return self->_virtualSize;
}

- (id)subRegions
{
  return self->_subRegions;
}

- (BOOL)isFakeAggregate
{
  return -[NSString isEqualToString:](self->_groupName, "isEqualToString:", XRVMDirtyRegionAggregateName)
      || -[NSString isEqualToString:](self->_groupName, "isEqualToString:", XRVMAllRegionAggregateName);
}

- (void)sortSubregionsWithComparator:(id)a3
{
  -[NSMutableArray sortUsingComparator:](self->_subRegions, "sortUsingComparator:", a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *v4;
  const char *Name;
  id v6;

  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  Name = sel_getName(a2);
  NSLog(CFSTR("-[%@ %s] called. Don't."), v6, Name);

}

- (XRVMCoalescedRegion)initWithCoder:(id)a3
{
  id v5;
  objc_class *v6;
  void *v7;
  const char *Name;
  XRVMCoalescedRegion *v9;
  objc_super v11;

  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  Name = sel_getName(a2);
  NSLog(CFSTR("-[%@ %s] called. Don't."), v7, Name);

  v11.receiver = self;
  v11.super_class = (Class)XRVMCoalescedRegion;
  v9 = -[XRVMRegion initWithCoder:](&v11, sel_initWithCoder_, v5);

  return v9;
}

- (id)displayType
{
  NSString *groupName;
  __CFString *v4;
  objc_super v5;

  groupName = self->_groupName;
  if (groupName)
    return groupName;
  if ((self->_multiplicityFlags & 0x40) != 0)
  {
    v4 = CFSTR("< multiple >");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)XRVMCoalescedRegion;
    -[XRVMRegion displayType](&v5, sel_displayType);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)displayPath
{
  __CFString *v2;
  objc_super v4;

  if ((self->_multiplicityFlags & 0x20) != 0)
  {
    v2 = CFSTR("< multiple >");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)XRVMCoalescedRegion;
    -[XRVMRegion displayPath](&v4, sel_displayPath);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_subRegions, 0);
}

@end
