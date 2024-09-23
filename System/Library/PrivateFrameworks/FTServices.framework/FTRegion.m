@implementation FTRegion

- (id)_initWithDictionary:(id)a3
{
  id v5;
  FTRegion *v6;
  void **p_isa;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTRegion *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)FTRegion;
  v6 = -[FTRegion init](&v31, sel_init);
  p_isa = (void **)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend_objectForKey_(p_isa[1], v9, (uint64_t)CFSTR("subregions"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v27, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v10);
          v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v15);
          v17 = [FTRegion alloc];
          v19 = (void *)objc_msgSend__initWithDictionary_(v17, v18, v16);
          v21 = v19;
          if (v19)
          {
            objc_msgSend__setParentRegion_(v19, v20, (uint64_t)p_isa);
            objc_msgSend_addObject_(v8, v22, (uint64_t)v21);
          }

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v23, (uint64_t)&v27, v32, 16);
      }
      while (v13);
    }

    if (objc_msgSend_count(v8, v24, v25))
      objc_storeStrong(p_isa + 2, v8);

  }
  return p_isa;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend_makeObjectsPerformSelector_withObject_(self->_subRegions, a2, (uint64_t)sel__setParentRegion_, 0);
  v3.receiver = self;
  v3.super_class = (Class)FTRegion;
  -[FTRegion dealloc](&v3, sel_dealloc);
}

- (void)_setParentRegion:(id)a3
{
  objc_storeStrong((id *)&self->_parentRegion, a3);
}

- (FTRegion)parentRegion
{
  return self->_parentRegion;
}

- (NSArray)subRegions
{
  return self->_subRegions;
}

- (FTRegion)regionWithID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  int isEqualToString;
  const char *v10;
  uint64_t v11;
  FTRegion *v12;
  void *v13;

  v4 = a3;
  objc_msgSend_regionID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v7, v8, (uint64_t)v4);

  if (isEqualToString)
  {
    v12 = self;
  }
  else
  {
    objc_msgSend_subRegions(self, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1A4CAD7E4(v4, v13);
    v12 = (FTRegion *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (NSString)isoCode
{
  return (NSString *)objc_msgSend_objectForKey_(self->_dictionary, a2, (uint64_t)CFSTR("iso-2"));
}

- (NSString)label
{
  return (NSString *)objc_msgSend_objectForKey_(self->_dictionary, a2, (uint64_t)CFSTR("label"));
}

- (NSString)basePhoneNumber
{
  return (NSString *)objc_msgSend_objectForKey_(self->_dictionary, a2, (uint64_t)CFSTR("base-phone-number"));
}

- (NSString)regionID
{
  return (NSString *)objc_msgSend_objectForKey_(self->_dictionary, a2, (uint64_t)CFSTR("id"));
}

- (id)description
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_label(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_isoCode(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_basePhoneNumber(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_regionID(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v15, (uint64_t)CFSTR("[FTRegion] Label: %@   ISO: %@    BaseNumber: %@  Region ID: %@"), v5, v8, v11, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSDictionary)_dictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)set_dictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (FTRegion)_parentRegion
{
  return (FTRegion *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_parentRegion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentRegion, 0);
  objc_storeStrong((id *)&self->_subRegions, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
