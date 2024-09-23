@implementation HMDVendorModelEntry

- (HMDVendorModelEntry)initWithManufacturer:(id)a3 model:(id)a4 appBundleID:(id)a5 appStoreID:(id)a6 firmwareVersion:(id)a7 productData:(id)a8 productDataAlternates:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HMDVendorModelEntry *v22;
  uint64_t v23;
  NSString *manufacturer;
  uint64_t v25;
  NSString *model;
  uint64_t v27;
  NSString *appBundleID;
  uint64_t v29;
  NSString *appStoreID;
  HMDAccessoryVersion *v31;
  HMDAccessoryVersion *firmwareVersion;
  uint64_t v33;
  NSString *productData;
  uint64_t v35;
  NSArray *productDataAlternates;
  objc_super v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)HMDVendorModelEntry;
  v22 = -[HMDVendorModelEntry init](&v38, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    manufacturer = v22->_manufacturer;
    v22->_manufacturer = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    model = v22->_model;
    v22->_model = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    appBundleID = v22->_appBundleID;
    v22->_appBundleID = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    appStoreID = v22->_appStoreID;
    v22->_appStoreID = (NSString *)v29;

    if (v19)
    {
      v31 = -[HMDAccessoryVersion initWithVersionString:]([HMDAccessoryVersion alloc], "initWithVersionString:", v19);
      firmwareVersion = v22->_firmwareVersion;
      v22->_firmwareVersion = v31;

    }
    v33 = objc_msgSend(v20, "copy");
    productData = v22->_productData;
    v22->_productData = (NSString *)v33;

    v35 = objc_msgSend(v21, "copy");
    productDataAlternates = v22->_productDataAlternates;
    v22->_productDataAlternates = (NSArray *)v35;

  }
  return v22;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[8];

  v26[7] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDVendorModelEntry manufacturer](self, "manufacturer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Manufacturer"), v25);
  v26[0] = v24;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDVendorModelEntry model](self, "model");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Model"), v23);
  v26[1] = v22;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDVendorModelEntry appBundleID](self, "appBundleID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("AppBundleID"), v21);
  v26[2] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDVendorModelEntry appStoreID](self, "appStoreID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("AppStoreID"), v8);
  v26[3] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDVendorModelEntry firmwareVersion](self, "firmwareVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("FirmwareVersion"), v11);
  v26[4] = v12;
  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDVendorModelEntry productData](self, "productData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("ProductData"), v14);
  v26[5] = v15;
  v16 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDVendorModelEntry productDataAlternates](self, "productDataAlternates");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("ProductDataAlternates"), v17);
  v26[6] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  HMDVendorModelEntry *v4;
  HMDVendorModelEntry *v5;
  HMDVendorModelEntry *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = (HMDVendorModelEntry *)a3;
  if (v4 == self)
  {
    v17 = 1;
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
      -[HMDVendorModelEntry manufacturer](self, "manufacturer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDVendorModelEntry manufacturer](v6, "manufacturer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        -[HMDVendorModelEntry model](self, "model");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDVendorModelEntry model](v6, "model");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", v10))
        {
          -[HMDVendorModelEntry appBundleID](self, "appBundleID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDVendorModelEntry appBundleID](v6, "appBundleID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (HMFEqualObjects())
          {
            -[HMDVendorModelEntry appStoreID](self, "appStoreID");
            v13 = objc_claimAutoreleasedReturnValue();
            -[HMDVendorModelEntry appStoreID](v6, "appStoreID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)v13;
            if (HMFEqualObjects())
            {
              -[HMDVendorModelEntry firmwareVersion](self, "firmwareVersion");
              v14 = objc_claimAutoreleasedReturnValue();
              -[HMDVendorModelEntry firmwareVersion](v6, "firmwareVersion");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (void *)v14;
              if (HMFEqualObjects())
              {
                -[HMDVendorModelEntry productData](self, "productData");
                v15 = objc_claimAutoreleasedReturnValue();
                -[HMDVendorModelEntry productData](v6, "productData");
                v21 = (void *)v15;
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (HMFEqualObjects())
                {
                  -[HMDVendorModelEntry productDataAlternates](self, "productDataAlternates");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HMDVendorModelEntry productDataAlternates](v6, "productDataAlternates");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v17 = HMFEqualObjects();

                }
                else
                {
                  v17 = 0;
                }

              }
              else
              {
                v17 = 0;
              }

            }
            else
            {
              v17 = 0;
            }

          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  return v17;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HMDVendorModelEntry manufacturer](self, "manufacturer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manufacturer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (!v7)
  {
    -[HMDVendorModelEntry model](self, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "compare:", v9);

  }
  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[HMDVendorModelEntry manufacturer](self, "manufacturer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v24 = v4;
  -[HMDVendorModelEntry model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v22[3] ^= v6;

  -[HMDVendorModelEntry appBundleID](self, "appBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v22[3] ^= v8;

  -[HMDVendorModelEntry appBundleID](self, "appBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  v22[3] ^= v10;

  -[HMDVendorModelEntry appStoreID](self, "appStoreID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v22[3] ^= v12;

  -[HMDVendorModelEntry firmwareVersion](self, "firmwareVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");
  v22[3] ^= v14;

  -[HMDVendorModelEntry productData](self, "productData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");
  v22[3] ^= v16;

  -[HMDVendorModelEntry productDataAlternates](self, "productDataAlternates");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __27__HMDVendorModelEntry_hash__block_invoke;
  v20[3] = &unk_1E89BEA18;
  v20[4] = &v21;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);

  v18 = v22[3];
  _Block_object_dispose(&v21, 8);
  return v18;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)appStoreID
{
  return self->_appStoreID;
}

- (HMDAccessoryVersion)firmwareVersion
{
  return self->_firmwareVersion;
}

- (NSString)productData
{
  return self->_productData;
}

- (NSArray)productDataAlternates
{
  return self->_productDataAlternates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productDataAlternates, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_appStoreID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

uint64_t __27__HMDVendorModelEntry_hash__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "hash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^= result;
  return result;
}

@end
