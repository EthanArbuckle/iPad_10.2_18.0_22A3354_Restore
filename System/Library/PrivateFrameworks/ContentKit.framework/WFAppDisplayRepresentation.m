@implementation WFAppDisplayRepresentation

- (WFAppDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 altText:(id)a5 imageData:(id)a6 snippetPluginModelData:(id)a7 snippetPluginModelBundleIdentifier:(id)a8 synonyms:(id)a9
{
  id v16;
  id v17;
  WFAppDisplayRepresentation *v18;
  WFAppDisplayRepresentation *v19;
  WFAppDisplayRepresentation *v20;
  void *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v16 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v17 = a9;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFApp.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  }
  v29.receiver = self;
  v29.super_class = (Class)WFAppDisplayRepresentation;
  v18 = -[WFAppDisplayRepresentation init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_title, a3);
    objc_storeStrong((id *)&v19->_subtitle, a4);
    objc_storeStrong((id *)&v19->_altText, a5);
    objc_storeStrong((id *)&v19->_imageData, a6);
    objc_storeStrong((id *)&v19->_snippetPluginModelData, a7);
    objc_storeStrong((id *)&v19->_snippetPluginModelBundleIdentifier, a8);
    objc_storeStrong((id *)&v19->_synonyms, a9);
    v20 = v19;
  }

  return v19;
}

- (WFAppDisplayRepresentation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WFAppDisplayRepresentation *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altText"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("snippetPluginModelData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("snippetPluginModelBundleIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("synonyms"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WFAppDisplayRepresentation initWithTitle:subtitle:altText:imageData:snippetPluginModelData:snippetPluginModelBundleIdentifier:synonyms:](self, "initWithTitle:subtitle:altText:imageData:snippetPluginModelData:snippetPluginModelBundleIdentifier:synonyms:", v5, v6, v7, v8, v9, v10, v11);

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[WFAppDisplayRepresentation title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[WFAppDisplayRepresentation subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("subtitle"));

  -[WFAppDisplayRepresentation altText](self, "altText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("altText"));

  -[WFAppDisplayRepresentation imageData](self, "imageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("imageData"));

  -[WFAppDisplayRepresentation snippetPluginModelData](self, "snippetPluginModelData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("snippetPluginModelData"));

  -[WFAppDisplayRepresentation snippetPluginModelBundleIdentifier](self, "snippetPluginModelBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("snippetPluginModelBundleIdentifier"));

  -[WFAppDisplayRepresentation synonyms](self, "synonyms");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("synonyms"));

}

- (BOOL)isEqual:(id)a3
{
  WFAppDisplayRepresentation *v4;
  WFAppDisplayRepresentation *v5;
  WFAppDisplayRepresentation *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  objc_super v56;

  v4 = (WFAppDisplayRepresentation *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    v56.receiver = self;
    v56.super_class = (Class)WFAppDisplayRepresentation;
    if (!-[WFAppDisplayRepresentation isEqual:](&v56, sel_isEqual_, v6))
    {
      LOBYTE(v12) = 0;
LABEL_60:

      goto LABEL_61;
    }
    -[WFAppDisplayRepresentation title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppDisplayRepresentation title](v6, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_58;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_59:

        goto LABEL_60;
      }
    }
    -[WFAppDisplayRepresentation subtitle](self, "subtitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppDisplayRepresentation subtitle](v6, "subtitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
        goto LABEL_57;
      v21 = objc_msgSend(v14, "isEqualToString:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_58:

        goto LABEL_59;
      }
    }
    -[WFAppDisplayRepresentation altText](self, "altText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppDisplayRepresentation altText](v6, "altText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v19 = v24;
    v55 = v20;
    if (v20 == v24)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24)
        goto LABEL_56;
      v12 = objc_msgSend(v20, "isEqualToString:", v24);

      if (!v12)
        goto LABEL_57;
    }
    v54 = v19;
    -[WFAppDisplayRepresentation imageData](self, "imageData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppDisplayRepresentation imageData](v6, "imageData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    v52 = v29;
    v53 = v28;
    if (v28 == v29)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v30 = v29;
        v19 = v54;
        goto LABEL_54;
      }
      v30 = v29;
      v19 = v54;
      if (!v29)
      {
LABEL_54:

        goto LABEL_55;
      }
      v31 = objc_msgSend(v28, "isEqual:", v29);

      if (!v31)
      {
        LOBYTE(v12) = 0;
        v19 = v54;
LABEL_55:
        v25 = v52;
        v20 = v53;
LABEL_56:

        v20 = v55;
LABEL_57:

        goto LABEL_58;
      }
    }
    -[WFAppDisplayRepresentation snippetPluginModelData](self, "snippetPluginModelData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppDisplayRepresentation snippetPluginModelData](v6, "snippetPluginModelData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v32;
    v34 = v33;
    v50 = v28;
    v51 = v34;
    if (v28 != v34)
    {
      LOBYTE(v12) = 0;
      if (v28)
      {
        v35 = v34;
        v19 = v54;
        if (v34)
        {
          v36 = objc_msgSend(v28, "isEqual:", v34);

          if (!v36)
          {
            LOBYTE(v12) = 0;
            v19 = v54;
            v30 = v51;
            goto LABEL_54;
          }
LABEL_35:
          -[WFAppDisplayRepresentation snippetPluginModelBundleIdentifier](self, "snippetPluginModelBundleIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFAppDisplayRepresentation snippetPluginModelBundleIdentifier](v6, "snippetPluginModelBundleIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v37;
          v40 = v38;
          v48 = v40;
          v49 = v39;
          if (v39 == v40)
          {

          }
          else
          {
            LOBYTE(v12) = 0;
            if (!v39)
            {
              v41 = v40;
              v19 = v54;
              goto LABEL_51;
            }
            v41 = v40;
            v19 = v54;
            if (!v40)
            {
LABEL_51:

              goto LABEL_52;
            }
            v42 = objc_msgSend(v39, "isEqualToString:", v40);

            if (!v42)
            {
              LOBYTE(v12) = 0;
              v19 = v54;
LABEL_52:
              v35 = v48;
              v28 = v49;
              goto LABEL_53;
            }
          }
          -[WFAppDisplayRepresentation synonyms](self, "synonyms", v48, v39);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFAppDisplayRepresentation synonyms](v6, "synonyms");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v43;
          v45 = v44;
          v46 = v45;
          if (v39 == v45)
          {
            LOBYTE(v12) = 1;
          }
          else
          {
            LOBYTE(v12) = 0;
            if (v39)
            {
              v19 = v54;
              if (v45)
                LOBYTE(v12) = objc_msgSend(v39, "isEqual:", v45);
              goto LABEL_49;
            }
          }
          v19 = v54;
LABEL_49:

          v41 = v46;
          goto LABEL_51;
        }
      }
      else
      {
        v35 = v34;
        v19 = v54;
      }
LABEL_53:

      v28 = v50;
      v30 = v51;
      goto LABEL_54;
    }

    goto LABEL_35;
  }
  LOBYTE(v12) = 1;
LABEL_61:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)WFAppDisplayRepresentation;
  v3 = -[WFAppDisplayRepresentation hash](&v22, sel_hash);
  -[WFAppDisplayRepresentation title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[WFAppDisplayRepresentation subtitle](self, "subtitle");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = &stru_24C4E3948;
  v8 = v5 ^ -[__CFString hash](v6, "hash");
  -[WFAppDisplayRepresentation altText](self, "altText");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_24C4E3948;
  v11 = v8 ^ -[__CFString hash](v9, "hash") ^ v3;
  -[WFAppDisplayRepresentation imageData](self, "imageData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  -[WFAppDisplayRepresentation snippetPluginModelData](self, "snippetPluginModelData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  -[WFAppDisplayRepresentation snippetPluginModelBundleIdentifier](self, "snippetPluginModelBundleIdentifier");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = &stru_24C4E3948;
  v18 = v15 ^ -[__CFString hash](v16, "hash");
  -[WFAppDisplayRepresentation synonyms](self, "synonyms");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v11 ^ v18 ^ objc_msgSend(v19, "hash");

  return v20;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)altText
{
  return self->_altText;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSData)snippetPluginModelData
{
  return self->_snippetPluginModelData;
}

- (NSString)snippetPluginModelBundleIdentifier
{
  return self->_snippetPluginModelBundleIdentifier;
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_snippetPluginModelBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_snippetPluginModelData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_altText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)withTitle:(id)a3
{
  id v3;
  WFAppDisplayRepresentation *v4;
  WFAppDisplayRepresentation *v5;

  v3 = a3;
  v4 = [WFAppDisplayRepresentation alloc];
  v5 = -[WFAppDisplayRepresentation initWithTitle:subtitle:altText:imageData:snippetPluginModelData:snippetPluginModelBundleIdentifier:synonyms:](v4, "initWithTitle:subtitle:altText:imageData:snippetPluginModelData:snippetPluginModelBundleIdentifier:synonyms:", v3, 0, 0, 0, 0, 0, MEMORY[0x24BDBD1A8]);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
