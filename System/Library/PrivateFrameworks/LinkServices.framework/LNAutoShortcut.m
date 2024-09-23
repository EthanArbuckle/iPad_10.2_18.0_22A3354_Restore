@implementation LNAutoShortcut

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSArray)orderedPhrases
{
  return self->_orderedPhrases;
}

- (NSString)attributionBundleIdentifier
{
  return self->_attributionBundleIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)localizedShortTitle
{
  return self->_localizedShortTitle;
}

- (int64_t)shortcutTileColor
{
  return self->_shortcutTileColor;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (LNAutoShortcut)initWithBundleIdentifier:(id)a3 localeIdentifier:(id)a4 actionIdentifier:(id)a5 orderedPhrases:(id)a6 localizedShortTitle:(id)a7 localizedAutoShortcutDescription:(id)a8 systemImageName:(id)a9 shortcutTileColor:(int64_t)a10 parameterPresentation:(id)a11 attributionBundleIdentifier:(id)a12 basePhraseTemplates:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  LNAutoShortcut *v26;
  uint64_t v27;
  NSString *bundleIdentifier;
  uint64_t v29;
  NSString *localeIdentifier;
  uint64_t v31;
  NSString *actionIdentifier;
  uint64_t v33;
  NSArray *orderedPhrases;
  NSString *localizedTitle;
  uint64_t v36;
  NSString *localizedShortTitle;
  uint64_t v38;
  NSString *localizedAutoShortcutDescription;
  uint64_t v40;
  NSString *systemImageName;
  LNAutoShortcut *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v51;
  id v52;
  void *v53;
  objc_super v54;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v52 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a11;
  v51 = a12;
  v25 = a13;
  v53 = v18;
  if (v18)
  {
    if (v19)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcut.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    if (v19)
    {
LABEL_3:
      if (v20)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcut.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localeIdentifier"));

  if (v20)
  {
LABEL_4:
    if (v21)
      goto LABEL_5;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcut.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("orderedPhrases"));

    if (v23)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcut.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionIdentifier"));

  if (!v21)
    goto LABEL_12;
LABEL_5:
  if (v23)
    goto LABEL_6;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcut.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("systemImageName"));

LABEL_6:
  v54.receiver = self;
  v54.super_class = (Class)LNAutoShortcut;
  v26 = -[LNAutoShortcut init](&v54, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v53, "copy");
    bundleIdentifier = v26->_bundleIdentifier;
    v26->_bundleIdentifier = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    localeIdentifier = v26->_localeIdentifier;
    v26->_localeIdentifier = (NSString *)v29;

    v31 = objc_msgSend(v20, "copy");
    actionIdentifier = v26->_actionIdentifier;
    v26->_actionIdentifier = (NSString *)v31;

    v33 = objc_msgSend(v21, "copy");
    orderedPhrases = v26->_orderedPhrases;
    v26->_orderedPhrases = (NSArray *)v33;

    localizedTitle = v26->_localizedTitle;
    v26->_localizedTitle = (NSString *)CFSTR("DEPRECATED, DO NOT USE");

    v36 = objc_msgSend(v52, "copy");
    localizedShortTitle = v26->_localizedShortTitle;
    v26->_localizedShortTitle = (NSString *)v36;

    v38 = objc_msgSend(v22, "copy");
    localizedAutoShortcutDescription = v26->_localizedAutoShortcutDescription;
    v26->_localizedAutoShortcutDescription = (NSString *)v38;

    v40 = objc_msgSend(v23, "copy");
    systemImageName = v26->_systemImageName;
    v26->_systemImageName = (NSString *)v40;

    v26->_shortcutTileColor = a10;
    objc_storeStrong((id *)&v26->_parameterPresentation, a11);
    objc_storeStrong((id *)&v26->_attributionBundleIdentifier, a12);
    objc_storeStrong((id *)&v26->_basePhraseTemplates, a13);
    v42 = v26;
  }

  return v26;
}

- (LNAutoShortcut)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  LNAutoShortcut *v19;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localeIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)MEMORY[0x1E0C99E60];
        v9 = objc_opt_class();
        objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("orderedPhrases"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedShortTitle"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedAutoShortcutDescription"));
          v25 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemImageName"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v24 = v13;
            v23 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shortcutTileColor"));
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterPresentation"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributionBundleIdentifier"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)MEMORY[0x1E0C99E60];
            v15 = objc_opt_class();
            objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("basePhraseTemplates"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = (void *)v25;
            self = -[LNAutoShortcut initWithBundleIdentifier:localeIdentifier:actionIdentifier:orderedPhrases:localizedShortTitle:localizedAutoShortcutDescription:systemImageName:shortcutTileColor:parameterPresentation:attributionBundleIdentifier:basePhraseTemplates:](self, "initWithBundleIdentifier:localeIdentifier:actionIdentifier:orderedPhrases:localizedShortTitle:localizedAutoShortcutDescription:systemImageName:shortcutTileColor:parameterPresentation:attributionBundleIdentifier:basePhraseTemplates:", v5, v6, v7, v11, v12, v25, v24, v23, v22, v21, v17);

            v13 = v24;
            v19 = self;
          }
          else
          {
            v19 = 0;
            v18 = (void *)v25;
          }

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basePhraseTemplates, 0);
  objc_storeStrong((id *)&self->_attributionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_parameterPresentation, 0);
  objc_storeStrong((id *)&self->_localizedAutoShortcutDescription, 0);
  objc_storeStrong((id *)&self->_localizedActionDescription, 0);
  objc_storeStrong((id *)&self->_localizedShortTitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_orderedPhrases, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (LNAutoShortcut)initWithBundleIdentifier:(id)a3 localeIdentifier:(id)a4 actionIdentifier:(id)a5 orderedPhrases:(id)a6 localizedShortTitle:(id)a7 localizedAutoShortcutDescription:(id)a8 systemImageName:(id)a9 shortcutTileColor:(int64_t)a10 parameterPresentation:(id)a11
{
  return -[LNAutoShortcut initWithBundleIdentifier:localeIdentifier:actionIdentifier:orderedPhrases:localizedShortTitle:localizedAutoShortcutDescription:systemImageName:shortcutTileColor:parameterPresentation:attributionBundleIdentifier:basePhraseTemplates:](self, "initWithBundleIdentifier:localeIdentifier:actionIdentifier:orderedPhrases:localizedShortTitle:localizedAutoShortcutDescription:systemImageName:shortcutTileColor:parameterPresentation:attributionBundleIdentifier:basePhraseTemplates:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, 0);
}

- (NSString)systemImage
{
  return (NSString *)(id)-[NSString copy](self->_systemImageName, "copy");
}

- (NSArray)localizedPhrases
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[LNAutoShortcut localizedPhrasesByBasePhraseTemplate](self, "localizedPhrasesByBasePhraseTemplate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v4, "objectForKeyedSubscript:", v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "localizedPhrase");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSDictionary)localizedPhrasesByBasePhraseTemplate
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[LNAutoShortcut orderedPhrases](self, "orderedPhrases", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "basePhraseTemplate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v11, "addObject:", v9);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "basePhraseTemplate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
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
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[LNAutoShortcut bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  -[LNAutoShortcut localeIdentifier](self, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("localeIdentifier"));

  -[LNAutoShortcut actionIdentifier](self, "actionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("actionIdentifier"));

  -[LNAutoShortcut orderedPhrases](self, "orderedPhrases");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("orderedPhrases"));

  -[LNAutoShortcut localizedShortTitle](self, "localizedShortTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("localizedShortTitle"));

  -[LNAutoShortcut localizedAutoShortcutDescription](self, "localizedAutoShortcutDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("localizedAutoShortcutDescription"));

  -[LNAutoShortcut systemImageName](self, "systemImageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("systemImageName"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNAutoShortcut shortcutTileColor](self, "shortcutTileColor"), CFSTR("shortcutTileColor"));
  -[LNAutoShortcut parameterPresentation](self, "parameterPresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("parameterPresentation"));

  -[LNAutoShortcut attributionBundleIdentifier](self, "attributionBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("attributionBundleIdentifier"));

  -[LNAutoShortcut basePhraseTemplates](self, "basePhraseTemplates");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("basePhraseTemplates"));

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
  void *v14;
  void *v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcut bundleIdentifier](self, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcut localeIdentifier](self, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcut actionIdentifier](self, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcut orderedPhrases](self, "orderedPhrases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcut localizedShortTitle](self, "localizedShortTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcut localizedAutoShortcutDescription](self, "localizedAutoShortcutDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcut systemImageName](self, "systemImageName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcut parameterPresentation](self, "parameterPresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcut attributionBundleIdentifier](self, "attributionBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p, bundleIdentifier: %@, localeIdentifier: %@, actionIdentifier: %@, orderedPhrases:%@, localizedShortTitle: %@, localizedAutoShortcut: %@, systemImageName: %@, parameterPresentation: %@, attributionBundleIdentifier: %@>"), v15, self, v14, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedActionDescription
{
  return self->_localizedActionDescription;
}

- (NSString)localizedAutoShortcutDescription
{
  return self->_localizedAutoShortcutDescription;
}

- (LNAppShortcutParameterPresentation)parameterPresentation
{
  return self->_parameterPresentation;
}

- (NSArray)basePhraseTemplates
{
  return self->_basePhraseTemplates;
}

- (LNAutoShortcut)initWithBundleIdentifier:(id)a3 localeIdentifier:(id)a4 actionIdentifier:(id)a5 orderedPhrases:(id)a6 localizedShortTitle:(id)a7 localizedAutoShortcutDescription:(id)a8 systemImageName:(id)a9 shortcutTileColor:(int64_t)a10
{
  return -[LNAutoShortcut initWithBundleIdentifier:localeIdentifier:actionIdentifier:orderedPhrases:localizedShortTitle:localizedAutoShortcutDescription:systemImageName:shortcutTileColor:parameterPresentation:](self, "initWithBundleIdentifier:localeIdentifier:actionIdentifier:orderedPhrases:localizedShortTitle:localizedAutoShortcutDescription:systemImageName:shortcutTileColor:parameterPresentation:", a3, a4, a5, a6, a7, a8, a9, a10, 0);
}

- (LNAutoShortcut)initWithBundleIdentifier:(id)a3 localeIdentifier:(id)a4 actionIdentifier:(id)a5 orderedPhrases:(id)a6 localizedShortTitle:(id)a7 localizedAutoShortcutDescription:(id)a8 systemImageName:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  LNAutoShortcut *v23;
  uint64_t v24;
  NSString *bundleIdentifier;
  uint64_t v26;
  NSString *localeIdentifier;
  uint64_t v28;
  NSString *actionIdentifier;
  uint64_t v30;
  NSArray *orderedPhrases;
  NSString *localizedTitle;
  uint64_t v33;
  NSString *localizedShortTitle;
  uint64_t v35;
  NSString *localizedAutoShortcutDescription;
  uint64_t v37;
  NSString *systemImageName;
  LNAutoShortcut *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;

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
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcut.m"), 214, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    if (v17)
    {
LABEL_3:
      if (v18)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcut.m"), 215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localeIdentifier"));

  if (v18)
  {
LABEL_4:
    if (v19)
      goto LABEL_5;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcut.m"), 217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("orderedPhrases"));

    if (v22)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcut.m"), 216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionIdentifier"));

  if (!v19)
    goto LABEL_12;
LABEL_5:
  if (v22)
    goto LABEL_6;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcut.m"), 218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("systemImageName"));

LABEL_6:
  v46.receiver = self;
  v46.super_class = (Class)LNAutoShortcut;
  v23 = -[LNAutoShortcut init](&v46, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    bundleIdentifier = v23->_bundleIdentifier;
    v23->_bundleIdentifier = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    localeIdentifier = v23->_localeIdentifier;
    v23->_localeIdentifier = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    actionIdentifier = v23->_actionIdentifier;
    v23->_actionIdentifier = (NSString *)v28;

    v30 = objc_msgSend(v19, "copy");
    orderedPhrases = v23->_orderedPhrases;
    v23->_orderedPhrases = (NSArray *)v30;

    localizedTitle = v23->_localizedTitle;
    v23->_localizedTitle = (NSString *)CFSTR("DEPRECATED, DO NOT USE");

    v33 = objc_msgSend(v20, "copy");
    localizedShortTitle = v23->_localizedShortTitle;
    v23->_localizedShortTitle = (NSString *)v33;

    v35 = objc_msgSend(v21, "copy");
    localizedAutoShortcutDescription = v23->_localizedAutoShortcutDescription;
    v23->_localizedAutoShortcutDescription = (NSString *)v35;

    v37 = objc_msgSend(v22, "copy");
    systemImageName = v23->_systemImageName;
    v23->_systemImageName = (NSString *)v37;

    v23->_shortcutTileColor = 14;
    v39 = v23;
  }

  return v23;
}

- (LNAutoShortcut)initWithBundleIdentifier:(id)a3 actionIdentifier:(id)a4 localizedPhrases:(id)a5 localizedTitle:(id)a6 localizedShortTitle:(id)a7 localizedAutoShortcutDescription:(id)a8 systemImageName:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  LNAutoShortcut *v23;
  uint64_t v24;
  NSString *bundleIdentifier;
  uint64_t v26;
  NSString *actionIdentifier;
  uint64_t v28;
  NSArray *orderedPhrases;
  uint64_t v30;
  NSString *localizedTitle;
  uint64_t v32;
  NSString *localizedShortTitle;
  uint64_t v34;
  NSString *localizedAutoShortcutDescription;
  uint64_t v36;
  NSString *systemImageName;
  LNAutoShortcut *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;

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
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcut.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    if (v17)
    {
LABEL_3:
      if (v18)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcut.m"), 245, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localizedPhrases"));

      if (v22)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcut.m"), 244, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionIdentifier"));

  if (!v18)
    goto LABEL_10;
LABEL_4:
  if (v22)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcut.m"), 246, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("systemImageName"));

LABEL_5:
  v44.receiver = self;
  v44.super_class = (Class)LNAutoShortcut;
  v23 = -[LNAutoShortcut init](&v44, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    bundleIdentifier = v23->_bundleIdentifier;
    v23->_bundleIdentifier = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    actionIdentifier = v23->_actionIdentifier;
    v23->_actionIdentifier = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    orderedPhrases = v23->_orderedPhrases;
    v23->_orderedPhrases = (NSArray *)v28;

    v30 = objc_msgSend(v19, "copy");
    localizedTitle = v23->_localizedTitle;
    v23->_localizedTitle = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    localizedShortTitle = v23->_localizedShortTitle;
    v23->_localizedShortTitle = (NSString *)v32;

    v34 = objc_msgSend(v21, "copy");
    localizedAutoShortcutDescription = v23->_localizedAutoShortcutDescription;
    v23->_localizedAutoShortcutDescription = (NSString *)v34;

    v36 = objc_msgSend(v22, "copy");
    systemImageName = v23->_systemImageName;
    v23->_systemImageName = (NSString *)v36;

    v23->_shortcutTileColor = 14;
    v38 = v23;
  }

  return v23;
}

- (LNAutoShortcut)initWithLocaleIdentifier:(id)a3 localizedApplicationName:(id)a4 basePhraseTemplateSubstitutions:(id)a5 actionIdentifier:(id)a6 phraseTemplates:(id)a7 title:(id)a8 shortTitle:(id)a9 actionDescription:(id)a10 systemImage:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  LNAutoShortcut *v26;
  LNAutoShortcut *v27;
  NSString *bundleIdentifier;
  uint64_t v29;
  NSString *actionIdentifier;
  NSArray *orderedPhrases;
  uint64_t v32;
  NSString *localizedTitle;
  uint64_t v34;
  NSString *localizedShortTitle;
  uint64_t v36;
  NSString *localizedAutoShortcutDescription;
  const __CFString *v38;
  NSString *systemImageName;
  LNAutoShortcut *v40;
  void *v42;
  void *v43;
  id v44;
  objc_super v45;

  v44 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  if (v20)
  {
    if (v21)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcut.m"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionIdentifier"));

    if (v21)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcut.m"), 274, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phraseTemplates"));

LABEL_3:
  v45.receiver = self;
  v45.super_class = (Class)LNAutoShortcut;
  v26 = -[LNAutoShortcut init](&v45, sel_init);
  v27 = v26;
  if (v26)
  {
    bundleIdentifier = v26->_bundleIdentifier;
    v26->_bundleIdentifier = (NSString *)CFSTR("com.apple.unknown");

    v29 = objc_msgSend(v20, "copy");
    actionIdentifier = v27->_actionIdentifier;
    v27->_actionIdentifier = (NSString *)v29;

    orderedPhrases = v27->_orderedPhrases;
    v27->_orderedPhrases = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_msgSend(v22, "key");
    v32 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v27->_localizedTitle;
    v27->_localizedTitle = (NSString *)v32;

    objc_msgSend(v23, "key");
    v34 = objc_claimAutoreleasedReturnValue();
    localizedShortTitle = v27->_localizedShortTitle;
    v27->_localizedShortTitle = (NSString *)v34;

    objc_msgSend(v24, "key");
    v36 = objc_claimAutoreleasedReturnValue();
    localizedAutoShortcutDescription = v27->_localizedAutoShortcutDescription;
    v27->_localizedAutoShortcutDescription = (NSString *)v36;

    if (v25)
      v38 = (const __CFString *)v25;
    else
      v38 = CFSTR("play.circle");
    systemImageName = v27->_systemImageName;
    v27->_systemImageName = &v38->isa;

    v27->_shortcutTileColor = 14;
    v40 = v27;
  }

  return v27;
}

@end
