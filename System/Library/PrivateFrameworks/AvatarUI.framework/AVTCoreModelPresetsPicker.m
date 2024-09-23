@implementation AVTCoreModelPresetsPicker

- (AVTCoreModelPresetsPicker)initWithTitle:(id)a3 representedTags:(id)a4 pairing:(id)a5 options:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  AVTCoreModelPresetsPicker *v17;

  v10 = (void *)MEMORY[0x1E0CB3A28];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[AVTCoreModelPresetsPicker initWithTitle:representedTags:pairing:options:identifier:](self, "initWithTitle:representedTags:pairing:options:identifier:", v14, v13, v12, v11, v16);

  return v17;
}

- (AVTCoreModelPresetsPicker)initWithTitle:(id)a3 representedTags:(id)a4 pairing:(id)a5 options:(id)a6 identifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  AVTCoreModelPresetsPicker *v17;
  uint64_t v18;
  NSString *title;
  uint64_t v20;
  NSOrderedSet *representedTags;
  uint64_t v22;
  NSString *identifier;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)AVTCoreModelPresetsPicker;
  v17 = -[AVTCoreModelPresetsPicker init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    title = v17->_title;
    v17->_title = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    representedTags = v17->_representedTags;
    v17->_representedTags = (NSOrderedSet *)v20;

    objc_storeStrong((id *)&v17->_pairing, a5);
    objc_storeStrong((id *)&v17->_options, a6);
    v22 = objc_msgSend(v16, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v22;

  }
  return v17;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVTCoreModelPresetsPicker;
  -[AVTCoreModelPresetsPicker description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTCoreModelPresetsPicker identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" identifier: %@\n"), v5);

  -[AVTCoreModelPresetsPicker title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" title: %@\n"), v6);

  -[AVTCoreModelPresetsPicker representedTags](self, "representedTags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" tags: %@\n"), v7);

  v8 = (void *)objc_msgSend(v4, "copy");
  return (NSString *)v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (AVTCoreModelPickerOptions)options
{
  return self->_options;
}

- (AVTCoreModelPairing)pairing
{
  return self->_pairing;
}

- (NSOrderedSet)representedTags
{
  return self->_representedTags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedTags, 0);
  objc_storeStrong((id *)&self->_pairing, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
