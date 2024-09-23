@implementation _EXItemProviderExtensionVendorLoadOperator

- (_EXItemProviderExtensionVendorLoadOperator)initWithExtensionContextIdentifier:(id)a3
{
  id v4;
  _EXItemProviderExtensionVendorLoadOperator *v5;
  void *v6;
  _EXItemProviderExtensionVendorLoadOperator *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EXItemProviderExtensionVendorLoadOperator;
  v5 = -[_EXItemProviderExtensionVendorLoadOperator init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EXItemProviderExtensionVendorLoadOperator setIdentifier:](v5, "setIdentifier:", v6);

    -[_EXItemProviderExtensionVendorLoadOperator setExtensionContextIdentifier:](v5, "setExtensionContextIdentifier:", v4);
    v7 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[_EXItemProviderExtensionVendorLoadOperator setExtensionContextIdentifier:](self, "setExtensionContextIdentifier:", 0);
  -[_EXItemProviderExtensionVendorLoadOperator setIdentifier:](self, "setIdentifier:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_EXItemProviderExtensionVendorLoadOperator;
  -[_EXItemProviderExtensionVendorLoadOperator dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXItemProviderExtensionVendorLoadOperator)initWithCoder:(id)a3
{
  id v4;
  _EXItemProviderExtensionVendorLoadOperator *v5;
  void *v6;
  void *v7;
  _EXItemProviderExtensionVendorLoadOperator *v8;

  v4 = a3;
  v5 = -[_EXItemProviderExtensionVendorLoadOperator init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EXItemProviderExtensionVendorLoadOperator setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionContextIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EXItemProviderExtensionVendorLoadOperator setExtensionContextIdentifier:](v5, "setExtensionContextIdentifier:", v7);

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_EXItemProviderExtensionVendorLoadOperator identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[_EXItemProviderExtensionVendorLoadOperator extensionContextIdentifier](self, "extensionContextIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("extensionContextIdentifier"));

}

- (void)loadItemForTypeIdentifier:(id)a3 completionHandler:(id)a4 expectedValueClass:(Class)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v10 = a4;
  v11 = a6;
  v12 = a3;
  -[_EXItemProviderExtensionVendorLoadOperator extensionContextIdentifier](self, "extensionContextIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[EXExtensionContextImplementation _extensionContextForIdentifier:](EXExtensionContextImplementation, "_extensionContextForIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, 0x1E2D00B18);

  -[_EXItemProviderExtensionVendorLoadOperator identifier](self, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, 0x1E2D00AF8);

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", class_getName(a5), 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, 0x1E2D00B38);

  }
  if (v11)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, 0x1E2D00B58);
  objc_msgSend(v14, "internalImplementation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __117___EXItemProviderExtensionVendorLoadOperator_loadItemForTypeIdentifier_completionHandler_expectedValueClass_options___block_invoke;
  v20[3] = &unk_1E2CFC890;
  v21 = v10;
  v19 = v10;
  objc_msgSend(v18, "_loadItemForPayload:completionHandler:", v15, v20);

}

- (void)loadPreviewImageWithCompletionHandler:(id)a3 expectedValueClass:(Class)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a3;
  v9 = a5;
  -[_EXItemProviderExtensionVendorLoadOperator extensionContextIdentifier](self, "extensionContextIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[EXExtensionContextImplementation _extensionContextForIdentifier:](EXExtensionContextImplementation, "_extensionContextForIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXItemProviderExtensionVendorLoadOperator identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, 0x1E2D00AF8);

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", class_getName(a4), 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, 0x1E2D00B38);

  }
  if (v9)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, 0x1E2D00B58);
  objc_msgSend(v11, "internalImplementation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __111___EXItemProviderExtensionVendorLoadOperator_loadPreviewImageWithCompletionHandler_expectedValueClass_options___block_invoke;
  v17[3] = &unk_1E2CFC890;
  v18 = v8;
  v16 = v8;
  objc_msgSend(v15, "_loadPreviewImageForPayload:completionHandler:", v12, v17);

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSUUID)extensionContextIdentifier
{
  return self->_extensionContextIdentifier;
}

- (void)setExtensionContextIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionContextIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
