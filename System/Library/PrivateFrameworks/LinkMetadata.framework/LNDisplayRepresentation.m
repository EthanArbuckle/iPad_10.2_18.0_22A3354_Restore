@implementation LNDisplayRepresentation

- (LNDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 synonyms:(id)a6
{
  return -[LNDisplayRepresentation initWithTitle:subtitle:image:synonyms:descriptionText:snippetPluginModel:](self, "initWithTitle:subtitle:image:synonyms:descriptionText:snippetPluginModel:", a3, a4, a5, a6, 0, 0);
}

- (LNStaticDeferredLocalizedString)title
{
  return self->_title;
}

- (LNStaticDeferredLocalizedString)subtitle
{
  return self->_subtitle;
}

- (LNImage)image
{
  return self->_image;
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetPluginModel, 0);
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[LNDisplayRepresentation title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[LNDisplayRepresentation subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("subtitle"));

  -[LNDisplayRepresentation image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("image"));

  -[LNDisplayRepresentation synonyms](self, "synonyms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("synonyms"));

  -[LNDisplayRepresentation descriptionText](self, "descriptionText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("descriptionText"));

  -[LNDisplayRepresentation snippetPluginModel](self, "snippetPluginModel");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("snippetPluginModel"));

}

- (LNDisplayRepresentation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  LNDisplayRepresentation *v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("image"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("synonyms"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("snippetPluginModel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptionText"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[LNDisplayRepresentation initWithTitle:subtitle:image:synonyms:descriptionText:snippetPluginModel:](self, "initWithTitle:subtitle:image:synonyms:descriptionText:snippetPluginModel:", v5, v6, v11, v15, v17, v16);

    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5
{
  return -[LNDisplayRepresentation initWithTitle:subtitle:image:synonyms:](self, "initWithTitle:subtitle:image:synonyms:", a3, a4, a5, 0);
}

- (LNDisplayRepresentation)initWithTitle:(id)a3 snippetPluginModel:(id)a4
{
  return -[LNDisplayRepresentation initWithTitle:subtitle:image:synonyms:descriptionText:snippetPluginModel:](self, "initWithTitle:subtitle:image:synonyms:descriptionText:snippetPluginModel:", a3, 0, 0, 0, 0, a4);
}

- (LNDisplayRepresentation)initWithTitle:(id)a3 snippetPluginModelData:(id)a4
{
  id v7;
  id v8;
  LNDisplayRepresentation *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDisplayRepresentation.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  }
  v9 = -[LNDisplayRepresentation initWithTitle:subtitle:image:synonyms:descriptionText:snippetPluginModel:](self, "initWithTitle:subtitle:image:synonyms:descriptionText:snippetPluginModel:", v7, 0, 0, 0, 0, v8);

  return v9;
}

- (LNDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 synonyms:(id)a6 descriptionText:(id)a7
{
  return -[LNDisplayRepresentation initWithTitle:subtitle:image:synonyms:descriptionText:snippetPluginModel:](self, "initWithTitle:subtitle:image:synonyms:descriptionText:snippetPluginModel:", a3, a4, a5, a6, a7, 0);
}

- (LNDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 synonyms:(id)a6 descriptionText:(id)a7 snippetPluginModel:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  LNDisplayRepresentation *v19;
  LNDisplayRepresentation *v20;
  uint64_t v21;
  NSArray *synonyms;
  LNDisplayRepresentation *v23;
  void *v25;
  id v27;
  id v28;
  objc_super v29;

  v15 = a3;
  v28 = a4;
  v27 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDisplayRepresentation.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  }
  v29.receiver = self;
  v29.super_class = (Class)LNDisplayRepresentation;
  v19 = -[LNDisplayRepresentation init](&v29, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_title, a3);
    objc_storeStrong((id *)&v20->_subtitle, a4);
    objc_storeStrong((id *)&v20->_image, a5);
    v21 = objc_msgSend(v16, "copy");
    synonyms = v20->_synonyms;
    v20->_synonyms = (NSArray *)v21;

    objc_storeStrong((id *)&v20->_descriptionText, a7);
    objc_storeStrong((id *)&v20->_snippetPluginModel, a8);
    v23 = v20;
  }

  return v20;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDisplayRepresentation title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDisplayRepresentation subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDisplayRepresentation image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDisplayRepresentation synonyms](self, "synonyms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDisplayRepresentation descriptionText](self, "descriptionText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDisplayRepresentation snippetPluginModel](self, "snippetPluginModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, title: %@, subtitle: %@, image: %@, synonyms: %@, descriptionText: %@, snippetPluginModel: %@>"), v5, self, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  LNDisplayRepresentation *v4;
  LNDisplayRepresentation *v5;
  LNDisplayRepresentation *v6;
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
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;

  v4 = (LNDisplayRepresentation *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_52:

      goto LABEL_53;
    }
    -[LNDisplayRepresentation title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNDisplayRepresentation title](v6, "title");
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
        goto LABEL_50;
      v15 = objc_msgSend(v9, "isEqual:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_51:

        goto LABEL_52;
      }
    }
    -[LNDisplayRepresentation subtitle](self, "subtitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNDisplayRepresentation subtitle](v6, "subtitle");
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
        goto LABEL_49;
      v21 = objc_msgSend(v14, "isEqual:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_50:

        goto LABEL_51;
      }
    }
    -[LNDisplayRepresentation image](self, "image");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNDisplayRepresentation image](v6, "image");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v19 = v24;
    v48 = v20;
    if (v20 == v24)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24)
        goto LABEL_48;
      v12 = objc_msgSend(v20, "isEqual:", v24);

      if (!v12)
        goto LABEL_49;
    }
    v47 = v19;
    -[LNDisplayRepresentation synonyms](self, "synonyms");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNDisplayRepresentation synonyms](v6, "synonyms");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    v45 = v29;
    v46 = v28;
    if (v28 == v29)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v30 = v29;
        v19 = v47;
        goto LABEL_46;
      }
      v30 = v29;
      v19 = v47;
      if (!v29)
      {
LABEL_46:

        goto LABEL_47;
      }
      v31 = objc_msgSend(v28, "isEqual:", v29);

      if (!v31)
      {
        LOBYTE(v12) = 0;
        v19 = v47;
LABEL_47:
        v25 = v45;
        v20 = v46;
LABEL_48:

        v20 = v48;
LABEL_49:

        goto LABEL_50;
      }
    }
    -[LNDisplayRepresentation descriptionText](self, "descriptionText");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNDisplayRepresentation descriptionText](v6, "descriptionText");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v32;
    v34 = v33;
    v43 = v28;
    v44 = v34;
    if (v28 == v34)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v35 = v34;
        v19 = v47;
        goto LABEL_45;
      }
      v35 = v34;
      v19 = v47;
      if (!v34)
      {
LABEL_45:

        v28 = v43;
        v30 = v44;
        goto LABEL_46;
      }
      v36 = objc_msgSend(v28, "isEqual:", v34);

      if (!v36)
      {
        LOBYTE(v12) = 0;
        v19 = v47;
        v30 = v44;
        goto LABEL_46;
      }
    }
    -[LNDisplayRepresentation snippetPluginModel](self, "snippetPluginModel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNDisplayRepresentation snippetPluginModel](v6, "snippetPluginModel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v37;
    v40 = v38;
    v42 = v40;
    if (v39 == v40)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v39)
      {
        v19 = v47;
        if (v40)
          LOBYTE(v12) = objc_msgSend(v39, "isEqual:", v40);
        goto LABEL_43;
      }
    }
    v19 = v47;
LABEL_43:

    v35 = v42;
    v28 = v39;
    goto LABEL_45;
  }
  LOBYTE(v12) = 1;
LABEL_53:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNDisplayRepresentation title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNDisplayRepresentation subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (LNStaticDeferredLocalizedString)descriptionText
{
  return self->_descriptionText;
}

- (LNUIPluginModel)snippetPluginModel
{
  return self->_snippetPluginModel;
}

@end
