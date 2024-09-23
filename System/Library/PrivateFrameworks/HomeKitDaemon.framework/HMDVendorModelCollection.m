@implementation HMDVendorModelCollection

- (HMDVendorModelCollection)init
{
  HMDVendorModelCollection *v2;
  uint64_t v3;
  NSMutableSet *entries;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDVendorModelCollection;
  v2 = -[HMDVendorModelCollection init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    entries = v2->_entries;
    v2->_entries = (NSMutableSet *)v3;

  }
  return v2;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDVendorModelCollection entries](self, "entries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Entries"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDVendorModelCollection defaultEntry](self, "defaultEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("DefaultEntry"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)addEntry:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDVendorModelCollection entries](self, "entries");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)lookupModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, _BYTE *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__145763;
  v20 = __Block_byref_object_dispose__145764;
  v21 = 0;
  if (!v4)
    goto LABEL_4;
  -[HMDVendorModelCollection entries](self, "entries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __40__HMDVendorModelCollection_lookupModel___block_invoke;
  v13 = &unk_24E788F38;
  v14 = v4;
  v15 = &v16;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v10);

  v6 = (void *)v17[5];
  if (v6)
  {
    v7 = v6;
  }
  else
  {
LABEL_4:
    -[HMDVendorModelCollection defaultEntry](self, "defaultEntry", v10, v11, v12, v13);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  _Block_object_dispose(&v16, 8);

  return v8;
}

- (id)lookupProductData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__145763;
  v16 = __Block_byref_object_dispose__145764;
  v17 = 0;
  -[HMDVendorModelCollection entries](self, "entries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__HMDVendorModelCollection_lookupProductData___block_invoke;
  v9[3] = &unk_24E788F38;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HMDVendorModelCollection *v4;
  HMDVendorModelCollection *v5;
  HMDVendorModelCollection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HMDVendorModelCollection *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDVendorModelCollection defaultEntry](self, "defaultEntry");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDVendorModelCollection defaultEntry](v6, "defaultEntry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (HMFEqualObjects())
      {
        -[HMDVendorModelCollection entries](self, "entries");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDVendorModelCollection entries](v6, "entries");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToSet:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (HMDVendorModelEntry)defaultEntry
{
  return self->_defaultEntry;
}

- (void)setDefaultEntry:(id)a3
{
  objc_storeStrong((id *)&self->_defaultEntry, a3);
}

- (NSMutableSet)entries
{
  return self->_entries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_defaultEntry, 0);
}

void __46__HMDVendorModelCollection_lookupProductData___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "productData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFAreStringsEqualIgnoringCase();

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __40__HMDVendorModelCollection_lookupModel___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFAreStringsEqualIgnoringCase();

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

@end
