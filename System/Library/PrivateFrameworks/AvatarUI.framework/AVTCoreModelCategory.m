@implementation AVTCoreModelCategory

- (AVTCoreModelCategory)initWithPresetCategory:(int64_t)a3 presets:(id)a4 tags:(id)a5 rows:(id)a6 pairing:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  AVTCoreModelCategory *v16;
  AVTCoreModelCategory *v17;
  uint64_t v18;
  NSArray *presets;
  uint64_t v20;
  NSArray *pickers;
  uint64_t v22;
  NSDictionary *tags;
  objc_super v25;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)AVTCoreModelCategory;
  v16 = -[AVTCoreModelCategory init](&v25, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_presetCategory = a3;
    v18 = objc_msgSend(v12, "copy");
    presets = v17->_presets;
    v17->_presets = (NSArray *)v18;

    v20 = objc_msgSend(v14, "copy");
    pickers = v17->_pickers;
    v17->_pickers = (NSArray *)v20;

    v22 = objc_msgSend(v13, "copy");
    tags = v17->_tags;
    v17->_tags = (NSDictionary *)v22;

    objc_storeStrong((id *)&v17->_pairing, a7);
  }

  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVTCoreModelCategory;
  -[AVTCoreModelCategory description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTCoreModelCategory presetCategory](self, "presetCategory");
  AVTPresetCategoryToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" AVTPresetCategory: %@\n"), v5);

  -[AVTCoreModelCategory pairing](self, "pairing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AVTCoreModelCategory pairing](self, "pairing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pairedCategory");
    AVTPresetCategoryToString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" paired with: %@\n"), v8);

  }
  -[AVTCoreModelCategory pickers](self, "pickers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "avt_description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" rows: %@\n"), v10);

  -[AVTCoreModelCategory presets](self, "presets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "avt_description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" presets: %@\n"), v12);

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (NSArray)presets
{
  return self->_presets;
}

- (NSDictionary)tags
{
  return self->_tags;
}

- (NSArray)pickers
{
  return self->_pickers;
}

- (int64_t)presetCategory
{
  return self->_presetCategory;
}

- (AVTCoreModelPairing)pairing
{
  return self->_pairing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairing, 0);
  objc_storeStrong((id *)&self->_pickers, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_presets, 0);
}

@end
