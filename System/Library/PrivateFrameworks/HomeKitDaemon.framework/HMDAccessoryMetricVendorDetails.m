@implementation HMDAccessoryMetricVendorDetails

- (HMDAccessoryMetricVendorDetails)initWithAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  HMDAccessoryMetricVendorDetails *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HMDAccessoryMetricVendorDetails *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  HMDAccessoryMetricVendorDetails *v49;
  id v51;
  void *v52;
  HMDAccessoryMetricVendorDetails *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = v8;
  if (objc_msgSend(v6, "communicationProtocol") == 2)
  {
    v9 = self;
    objc_msgSend(v8, "chipDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "vendorMetadataStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "matterVendorID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "vendorWithID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v6;
    objc_msgSend(v6, "matterProductID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "productWithID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v17;
    objc_msgSend(v17, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "matterVendorID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 && !v14)
    {
      objc_msgSend(v15, "matterVendorID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringValue");
      v22 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v22;
    }
    objc_msgSend(v15, "matterProductID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = v14;
    if (!v23 || v55)
    {
      v59 = v19;
    }
    else
    {
      objc_msgSend(v15, "matterProductID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringValue");
      v25 = objc_claimAutoreleasedReturnValue();

      v59 = (void *)v25;
    }
    objc_msgSend(v4, "firmwareVersion");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "versionString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "category");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "categoryType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "uuid");
    v34 = v15;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v4;
    objc_msgSend(v33, "numberWithUnsignedInteger:", objc_msgSend(v35, "hash") % (unint64_t)objc_msgSend((id)objc_opt_class(), "maximumDifferentiationNumber"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[HMDAccessoryMetricVendorDetails initWithProductData:manufacturer:model:firmwareVersion:category:differentiationNumber:](v9, "initWithProductData:manufacturer:model:firmwareVersion:category:differentiationNumber:", 0, v18, v59, v30, v32, v37);
    v39 = v55;
  }
  else
  {
    objc_msgSend(v4, "vendorInfo");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "productData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v51 = v6;
    v53 = self;
    if (v26)
    {
      if (v27)
      {
        v29 = v27;
      }
      else
      {
        objc_msgSend(v26, "productData");
        v29 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      anonymizeUnknownVendorString(v27);
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    v40 = v29;

    v41 = v4;
    v54 = v4;
    v57 = v26;
    if (v26)
    {
      objc_msgSend(v26, "manufacturer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "model");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[HMDVendorDataManager sharedVendorDataManager](HMDVendorDataManager, "sharedVendorDataManager");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "manufacturer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "databaseContainsManufacturer:", v43);

      objc_msgSend(v41, "manufacturer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v45;
      if ((v44 & 1) == 0)
      {
        anonymizeUnknownVendorString(v45);
        v46 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v46;
      }

      objc_msgSend(v41, "model");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      anonymizeUnknownVendorString(v47);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v39 = v40;
    objc_msgSend(v41, "firmwareVersion", v51);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "versionString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "category");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "categoryType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v41, "uuid");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "numberWithUnsignedInteger:", objc_msgSend(v35, "hash") % (unint64_t)objc_msgSend((id)objc_opt_class(), "maximumDifferentiationNumber"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[HMDAccessoryMetricVendorDetails initWithProductData:manufacturer:model:firmwareVersion:category:differentiationNumber:](v53, "initWithProductData:manufacturer:model:firmwareVersion:category:differentiationNumber:", v40, v18, v59, v30, v32, v37);
    v36 = v54;
    v34 = v52;
  }
  v49 = v38;

  return v49;
}

- (HMDAccessoryMetricVendorDetails)initWithProductData:(id)a3 manufacturer:(id)a4 model:(id)a5 firmwareVersion:(id)a6 category:(id)a7 differentiationNumber:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMDAccessoryMetricVendorDetails *v18;
  HMDAccessoryMetricVendorDetails *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDAccessoryMetricVendorDetails;
  v18 = -[HMDAccessoryMetricVendorDetails init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_productData, a3);
    objc_storeStrong((id *)&v19->_manufacturer, a4);
    objc_storeStrong((id *)&v19->_model, a5);
    objc_storeStrong((id *)&v19->_firmwareVersion, a6);
    objc_storeStrong((id *)&v19->_category, a7);
    objc_storeStrong((id *)&v19->_differentiationNumber, a8);
  }

  return v19;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryMetricVendorDetails manufacturer](self, "manufacturer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("manufacturer"), v19);
  v20[0] = v4;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryMetricVendorDetails model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("model"), v6);
  v20[1] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryMetricVendorDetails firmwareVersion](self, "firmwareVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("firmwareVersion"), v9);
  v20[2] = v10;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryMetricVendorDetails category](self, "category");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("category"), v12);
  v20[3] = v13;
  v14 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryMetricVendorDetails differentiationNumber](self, "differentiationNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("differentiationNumber"), v15);
  v20[4] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)productData
{
  return self->_productData;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (NSString)category
{
  return self->_category;
}

- (NSNumber)differentiationNumber
{
  return self->_differentiationNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_differentiationNumber, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_productData, 0);
}

+ (unint64_t)maximumDifferentiationNumber
{
  return 64;
}

@end
