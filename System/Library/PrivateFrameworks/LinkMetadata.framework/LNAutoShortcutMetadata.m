@implementation LNAutoShortcutMetadata

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityAnnotations, 0);
  objc_storeStrong((id *)&self->_parameterPresentation, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_autoShortcutDescription, 0);
  objc_storeStrong((id *)&self->_shortTitle, 0);
  objc_storeStrong((id *)&self->_phraseTemplates, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (LNAutoShortcutMetadata)initWithActionIdentifier:(id)a3 phraseTemplates:(id)a4 shortTitle:(id)a5 autoShortcutDescription:(id)a6 systemImageName:(id)a7 parameterPresentation:(id)a8 availabilityAnnotations:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  LNAutoShortcutMetadata *v23;
  uint64_t v24;
  NSString *actionIdentifier;
  uint64_t v26;
  NSArray *phraseTemplates;
  uint64_t v28;
  LNStaticDeferredLocalizedString *shortTitle;
  uint64_t v30;
  LNStaticDeferredLocalizedString *autoShortcutDescription;
  uint64_t v32;
  NSString *systemImageName;
  uint64_t v34;
  LNAppShortcutParameterPresentationMetadata *parameterPresentation;
  uint64_t v36;
  NSDictionary *availabilityAnnotations;
  LNAutoShortcutMetadata *v38;
  void *v40;
  void *v41;
  objc_super v42;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcutMetadata.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionIdentifier"));

    if (v17)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcutMetadata.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phraseTemplates"));

LABEL_3:
  v42.receiver = self;
  v42.super_class = (Class)LNAutoShortcutMetadata;
  v23 = -[LNAutoShortcutMetadata init](&v42, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    actionIdentifier = v23->_actionIdentifier;
    v23->_actionIdentifier = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    phraseTemplates = v23->_phraseTemplates;
    v23->_phraseTemplates = (NSArray *)v26;

    v28 = objc_msgSend(v18, "copy");
    shortTitle = v23->_shortTitle;
    v23->_shortTitle = (LNStaticDeferredLocalizedString *)v28;

    v30 = objc_msgSend(v19, "copy");
    autoShortcutDescription = v23->_autoShortcutDescription;
    v23->_autoShortcutDescription = (LNStaticDeferredLocalizedString *)v30;

    v32 = objc_msgSend(v20, "copy");
    systemImageName = v23->_systemImageName;
    v23->_systemImageName = (NSString *)v32;

    v34 = objc_msgSend(v21, "copy");
    parameterPresentation = v23->_parameterPresentation;
    v23->_parameterPresentation = (LNAppShortcutParameterPresentationMetadata *)v34;

    v36 = objc_msgSend(v22, "copy");
    availabilityAnnotations = v23->_availabilityAnnotations;
    v23->_availabilityAnnotations = (NSDictionary *)v36;

    v38 = v23;
  }

  return v23;
}

- (LNAutoShortcutMetadata)initWithActionIdentifier:(id)a3 phraseTemplates:(id)a4 shortTitle:(id)a5 autoShortcutDescription:(id)a6 systemImageName:(id)a7 availabilityAnnotations:(id)a8
{
  return -[LNAutoShortcutMetadata initWithActionIdentifier:phraseTemplates:shortTitle:autoShortcutDescription:systemImageName:parameterPresentation:availabilityAnnotations:](self, "initWithActionIdentifier:phraseTemplates:shortTitle:autoShortcutDescription:systemImageName:parameterPresentation:availabilityAnnotations:", a3, a4, a5, a6, a7, 0, a8);
}

- (LNAutoShortcutMetadata)initWithActionIdentifier:(id)a3 phraseTemplates:(id)a4 shortTitle:(id)a5 autoShortcutDescription:(id)a6 systemImageName:(id)a7
{
  return -[LNAutoShortcutMetadata initWithActionIdentifier:phraseTemplates:shortTitle:autoShortcutDescription:systemImageName:parameterPresentation:availabilityAnnotations:](self, "initWithActionIdentifier:phraseTemplates:shortTitle:autoShortcutDescription:systemImageName:parameterPresentation:availabilityAnnotations:", a3, a4, a5, a6, a7, 0, 0);
}

- (LNAutoShortcutMetadata)initWithActionIdentifier:(id)a3 phraseTemplates:(id)a4 shortTitle:(id)a5 autoShortcutDescription:(id)a6 systemImageName:(id)a7 parameterPresentation:(id)a8
{
  return -[LNAutoShortcutMetadata initWithActionIdentifier:phraseTemplates:shortTitle:autoShortcutDescription:systemImageName:parameterPresentation:availabilityAnnotations:](self, "initWithActionIdentifier:phraseTemplates:shortTitle:autoShortcutDescription:systemImageName:parameterPresentation:availabilityAnnotations:", a3, a4, a5, a6, a7, a8, 0);
}

- (LNAutoShortcutMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  LNAutoShortcutMetadata *v20;
  void *v22;
  void *v23;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("phraseTemplates"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortTitle"));
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autoShortcutDescription"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemImageName"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterPresentation"));
          v22 = (void *)v11;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x1E0C99E60];
          v15 = objc_opt_class();
          v16 = objc_opt_class();
          objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("availabilityAnnotations"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = v22;
          v20 = -[LNAutoShortcutMetadata initWithActionIdentifier:phraseTemplates:shortTitle:autoShortcutDescription:systemImageName:parameterPresentation:availabilityAnnotations:]([LNAutoShortcutMetadata alloc], "initWithActionIdentifier:phraseTemplates:shortTitle:autoShortcutDescription:systemImageName:parameterPresentation:availabilityAnnotations:", v5, v9, v22, v23, v12, v13, v18);

        }
        else
        {
          v20 = 0;
          v19 = (void *)v11;
        }

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
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
  void *v11;
  id v12;

  v4 = a3;
  -[LNAutoShortcutMetadata actionIdentifier](self, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actionIdentifier"));

  -[LNAutoShortcutMetadata phraseTemplates](self, "phraseTemplates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("phraseTemplates"));

  -[LNAutoShortcutMetadata title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("title"));

  -[LNAutoShortcutMetadata shortTitle](self, "shortTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("shortTitle"));

  -[LNAutoShortcutMetadata autoShortcutDescription](self, "autoShortcutDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("autoShortcutDescription"));

  -[LNAutoShortcutMetadata systemImageName](self, "systemImageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("systemImageName"));

  -[LNAutoShortcutMetadata parameterPresentation](self, "parameterPresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("parameterPresentation"));

  -[LNAutoShortcutMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("availabilityAnnotations"));

}

- (id)description
{
  objc_class *v3;
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
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcutMetadata actionIdentifier](self, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcutMetadata phraseTemplates](self, "phraseTemplates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcutMetadata title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcutMetadata shortTitle](self, "shortTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcutMetadata autoShortcutDescription](self, "autoShortcutDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcutMetadata systemImageName](self, "systemImageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcutMetadata parameterPresentation](self, "parameterPresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcutMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p, actionIdentifier: %@, phraseTemplates: %@, title: %@, shortTitle: %@, autoShortcutDescription: %@, systemImageName: %@, parameterPresentation: %@, availabilityAnnotation: %@>"), v4, self, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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

  -[LNAutoShortcutMetadata actionIdentifier](self, "actionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNAutoShortcutMetadata phraseTemplates](self, "phraseTemplates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[LNAutoShortcutMetadata title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[LNAutoShortcutMetadata shortTitle](self, "shortTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[LNAutoShortcutMetadata autoShortcutDescription](self, "autoShortcutDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[LNAutoShortcutMetadata systemImageName](self, "systemImageName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[LNAutoShortcutMetadata parameterPresentation](self, "parameterPresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");
  -[LNAutoShortcutMetadata availabilityAnnotations](self, "availabilityAnnotations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  LNAutoShortcutMetadata *v4;
  LNAutoShortcutMetadata *v5;
  LNAutoShortcutMetadata *v6;
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
  int v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  BOOL v53;
  void *v54;
  id v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;

  v4 = (LNAutoShortcutMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_69:

      goto LABEL_70;
    }
    -[LNAutoShortcutMetadata actionIdentifier](self, "actionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAutoShortcutMetadata actionIdentifier](v6, "actionIdentifier");
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
        goto LABEL_67;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_68:

        goto LABEL_69;
      }
    }
    -[LNAutoShortcutMetadata phraseTemplates](self, "phraseTemplates");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAutoShortcutMetadata phraseTemplates](v6, "phraseTemplates");
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
        goto LABEL_66;
      v21 = objc_msgSend(v14, "isEqualToArray:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_67:

        goto LABEL_68;
      }
    }
    -[LNAutoShortcutMetadata title](self, "title");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAutoShortcutMetadata title](v6, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v19 = v24;
    v65 = v20;
    if (v20 == v24)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24)
        goto LABEL_65;
      v12 = objc_msgSend(v20, "isEqual:", v24);

      if (!v12)
        goto LABEL_66;
    }
    v64 = v19;
    -[LNAutoShortcutMetadata shortTitle](self, "shortTitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAutoShortcutMetadata shortTitle](v6, "shortTitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    v62 = v29;
    v63 = v28;
    if (v28 == v29)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v30 = v29;
        v19 = v64;
        goto LABEL_63;
      }
      v30 = v29;
      v19 = v64;
      if (!v29)
      {
LABEL_63:

        goto LABEL_64;
      }
      v31 = objc_msgSend(v28, "isEqual:", v29);

      if (!v31)
      {
        LOBYTE(v12) = 0;
        v19 = v64;
LABEL_64:
        v25 = v62;
        v20 = v63;
LABEL_65:

        v20 = v65;
LABEL_66:

        goto LABEL_67;
      }
    }
    -[LNAutoShortcutMetadata autoShortcutDescription](self, "autoShortcutDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAutoShortcutMetadata autoShortcutDescription](v6, "autoShortcutDescription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v32;
    v34 = v33;
    v60 = v28;
    v61 = v34;
    if (v28 != v34)
    {
      LOBYTE(v12) = 0;
      if (v28)
      {
        v35 = v34;
        v19 = v64;
        if (v34)
        {
          v36 = objc_msgSend(v28, "isEqual:", v34);

          if (!v36)
          {
            LOBYTE(v12) = 0;
            v19 = v64;
            v30 = v61;
            goto LABEL_63;
          }
LABEL_36:
          -[LNAutoShortcutMetadata systemImageName](self, "systemImageName");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNAutoShortcutMetadata systemImageName](v6, "systemImageName");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v37;
          v40 = v38;
          v58 = v40;
          v59 = v39;
          if (v39 == v40)
          {

          }
          else
          {
            LOBYTE(v12) = 0;
            if (!v39)
            {
              v41 = v40;
              v19 = v64;
              goto LABEL_60;
            }
            v41 = v40;
            v19 = v64;
            if (!v40)
            {
LABEL_60:

              goto LABEL_61;
            }
            v42 = objc_msgSend(v39, "isEqualToString:", v40);

            if (!v42)
            {
              LOBYTE(v12) = 0;
              v19 = v64;
LABEL_61:
              v35 = v58;
              v28 = v59;
              goto LABEL_62;
            }
          }
          -[LNAutoShortcutMetadata parameterPresentation](self, "parameterPresentation");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNAutoShortcutMetadata parameterPresentation](v6, "parameterPresentation");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v43;
          v45 = v44;
          v56 = v39;
          v57 = v45;
          if (v39 == v45)
          {

          }
          else
          {
            LOBYTE(v12) = 0;
            if (!v39)
            {
              v46 = v45;
              v19 = v64;
              goto LABEL_59;
            }
            v46 = v45;
            v19 = v64;
            if (!v45)
            {
LABEL_59:

              v39 = v56;
              v41 = v57;
              goto LABEL_60;
            }
            v47 = objc_msgSend(v39, "isEqual:", v45);

            if (!v47)
            {
              LOBYTE(v12) = 0;
              v19 = v64;
              v41 = v57;
              goto LABEL_60;
            }
          }
          -[LNAutoShortcutMetadata availabilityAnnotations](self, "availabilityAnnotations", v39);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNAutoShortcutMetadata availabilityAnnotations](v6, "availabilityAnnotations");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v48;
          v51 = v49;
          v52 = v50;
          v53 = v50 == v51;
          v54 = v51;
          if (v53)
          {
            LOBYTE(v12) = 1;
          }
          else
          {
            LOBYTE(v12) = 0;
            if (v52)
            {
              v19 = v64;
              if (v51)
                LOBYTE(v12) = objc_msgSend(v52, "isEqual:", v51);
              goto LABEL_57;
            }
          }
          v19 = v64;
LABEL_57:

          v46 = v54;
          v39 = v52;
          goto LABEL_59;
        }
      }
      else
      {
        v35 = v34;
        v19 = v64;
      }
LABEL_62:

      v28 = v60;
      v30 = v61;
      goto LABEL_63;
    }

    goto LABEL_36;
  }
  LOBYTE(v12) = 1;
LABEL_70:

  return v12;
}

- (NSArray)phraseTemplates
{
  return self->_phraseTemplates;
}

- (LNStaticDeferredLocalizedString)shortTitle
{
  return self->_shortTitle;
}

- (LNStaticDeferredLocalizedString)autoShortcutDescription
{
  return self->_autoShortcutDescription;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (LNAppShortcutParameterPresentationMetadata)parameterPresentation
{
  return self->_parameterPresentation;
}

- (NSDictionary)availabilityAnnotations
{
  return self->_availabilityAnnotations;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNStaticDeferredLocalizedString)title
{
  return (LNStaticDeferredLocalizedString *)&stru_1E39A2988;
}

- (LNAutoShortcutMetadata)initWithActionIdentifier:(id)a3 phraseTemplates:(id)a4 title:(id)a5 shortTitle:(id)a6 autoShortcutDescription:(id)a7 systemImageName:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  LNAutoShortcutMetadata *v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  v17 = a3;
  if (objc_msgSend(v13, "length"))
    v18 = v13;
  else
    v18 = 0;
  v19 = -[LNAutoShortcutMetadata initWithActionIdentifier:phraseTemplates:shortTitle:autoShortcutDescription:systemImageName:](self, "initWithActionIdentifier:phraseTemplates:shortTitle:autoShortcutDescription:systemImageName:", v17, v16, v15, v14, v18);

  return v19;
}

@end
