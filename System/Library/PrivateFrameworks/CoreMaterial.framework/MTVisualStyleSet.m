@implementation MTVisualStyleSet

- (MTVisualStyleSet)initWithName:(id)a3 visualStyleSetDescription:(id)a4 andDescendantDescriptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTVisualStyleSet *v11;
  uint64_t v12;
  NSString *visualStyleSetName;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *visualStylesToStyleNames;
  NSMutableDictionary *v17;
  NSMutableDictionary *styleNamesToVisualStylings;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  MTCoreMaterialVisualStyling *v36;
  MTCoreMaterialVisualStyling *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  void *v51;
  void *v52;
  id v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  id obj;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  objc_super v78;
  id v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v78.receiver = self;
  v78.super_class = (Class)MTVisualStyleSet;
  v11 = -[MTVisualStyleSet init](&v78, sel_init);
  if (v11)
  {
    v54 = v8;
    v12 = objc_msgSend(v8, "copy");
    visualStyleSetName = v11->_visualStyleSetName;
    v11->_visualStyleSetName = (NSString *)v12;

    objc_msgSend(v9, "objectForKey:", CFSTR("visualStyleSetVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_visualStyleSetVersion = objc_msgSend(v14, "integerValue");

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    visualStylesToStyleNames = v11->_visualStylesToStyleNames;
    v11->_visualStylesToStyleNames = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    styleNamesToVisualStylings = v11->_styleNamesToVisualStylings;
    v11->_styleNamesToVisualStylings = v17;

    v60 = v9;
    objc_msgSend(v9, "objectForKey:", CFSTR("styles"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0C99E20]);
    v55 = v19;
    objc_msgSend(v19, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithArray:", v21);

    v59 = v10;
    objc_msgSend(v10, "valueForKey:", CFSTR("styles"));
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v75 != v25)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "allKeys");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObjectsFromArray:", v27);

        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
      }
      while (v24);
    }
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v57 = v22;
    v28 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v71;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v71 != v30)
            objc_enumerationMutation(v57);
          v32 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j);
          objc_msgSend(v55, "objectForKey:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "valueForKey:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          if (v33 || objc_msgSend(v34, "count"))
          {
            v36 = -[MTCoreMaterialVisualStyling initWithVisualStyleSet:styleName:description:andDescendantDescriptions:]([MTCoreMaterialVisualStyling alloc], "initWithVisualStyleSet:styleName:description:andDescendantDescriptions:", v11, v32, v33, v35);
            if (v36)
            {
              v37 = v36;
              -[NSMutableDictionary setObject:forKey:](v11->_styleNamesToVisualStylings, "setObject:forKey:", v36, v32);

            }
          }

        }
        v29 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
      }
      while (v29);
    }

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    MTAllOrdinalVisualStyles();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    MTAllPlatformColorVisualStyles();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "arrayByAddingObjectsFromArray:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = v40;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
    v10 = v59;
    v9 = v60;
    if (v41)
    {
      v42 = v41;
      v58 = *(_QWORD *)v67;
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v67 != v58)
            objc_enumerationMutation(v56);
          v44 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k);
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v79 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "arrayByAddingObjectsFromArray:", v10);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v62, v80, 16);
          if (v47)
          {
            v48 = v47;
            v49 = *(_QWORD *)v63;
            do
            {
              for (m = 0; m != v48; ++m)
              {
                if (*(_QWORD *)v63 != v49)
                  objc_enumerationMutation(v46);
                objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * m), "objectForKey:", v44);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                if (v51)
                {
                  -[NSMutableDictionary objectForKey:](v11->_styleNamesToVisualStylings, "objectForKey:", v51);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v52)
                    -[NSMutableDictionary setObject:forKey:](v11->_visualStylesToStyleNames, "setObject:forKey:", v51, v44);
                }

              }
              v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v62, v80, 16);
            }
            while (v48);
          }

          v10 = v59;
          v9 = v60;
        }
        v42 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
      }
      while (v42);
    }

    v8 = v54;
  }

  return v11;
}

- (NSString)visualStyleSetName
{
  return self->_visualStyleSetName;
}

- (id)visualStylingForStyle:(id)a3
{
  NSMutableDictionary *visualStylesToStyleNames;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  visualStylesToStyleNames = self->_visualStylesToStyleNames;
  v5 = a3;
  -[NSMutableDictionary objectForKey:](visualStylesToStyleNames, "objectForKey:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v5;
  v9 = v8;

  -[NSMutableDictionary objectForKey:](self->_styleNamesToVisualStylings, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)recipeNameForRecipeFromStyle:(id)a3 fromStyleSetWithName:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTVisualStyleSet.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("visualStyle"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTVisualStyleSet.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("styleSetName"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.generatedRecipe"), v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_materialDescriptionForStyle:(id)a3 withProvidedStyles:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;

  v6 = a4;
  -[MTVisualStyleSet visualStylingForStyle:](self, "visualStylingForStyle:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7
    && ((objc_msgSend(v7, "tintColorDescription"), v9 = (void *)objc_claimAutoreleasedReturnValue(),
                                                   v9,
                                                   v9)
     || _CanGenerateMaterialDescriptionForFilteringFromVisualStyling(v8)))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("baseMaterial"));
    objc_msgSend(v8, "tintColorDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v8, "tintColorDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("tinting"));

    }
    if (_CanGenerateMaterialDescriptionForFilteringFromVisualStyling(v8))
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("materialFiltering"));
      objc_msgSend(v8, "filterType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CD2F08]);

      if (v16)
      {
        objc_msgSend(v8, "filterProperties");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", CFSTR("inputColorMatrix"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("colorMatrix"));

      }
    }
    objc_msgSend(v10, "setObject:forKey:", &unk_1E587FD40, CFSTR("materialSettingsVersion"));
    if (v6)
      objc_msgSend(v10, "setObject:forKey:", v6, CFSTR("styles"));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_newMaterialSettingsForStyle:(id)a3 withProvidedStyles:(id)a4
{
  id v6;
  void *v7;
  MTRecipeMaterialSettings *v8;
  void *v9;
  void *v10;
  void *v11;
  MTRecipeMaterialSettings *v12;

  v6 = a3;
  -[MTVisualStyleSet _materialDescriptionForStyle:withProvidedStyles:](self, "_materialDescriptionForStyle:withProvidedStyles:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = [MTRecipeMaterialSettings alloc];
    v9 = (void *)objc_opt_class();
    -[MTVisualStyleSet visualStyleSetName](self, "visualStyleSetName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recipeNameForRecipeFromStyle:fromStyleSetWithName:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MTRecipeMaterialSettings initWithRecipeName:andDescription:descendantDescriptions:bundle:](v8, "initWithRecipeName:andDescription:descendantDescriptions:bundle:", v11, v7, 0, 0);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)description
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; styleName: %@; visualStyleSetVersion: %ld"),
    objc_opt_class(),
    self,
    self->_visualStyleSetName,
    self->_visualStyleSetVersion);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_styleNamesToVisualStylings;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_styleNamesToVisualStylings, "objectForKey:", v9);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          objc_msgSend(v3, "appendFormat:", CFSTR("; %@: %@"), v9, v10);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (int64_t)visualStyleSetVersion
{
  return self->_visualStyleSetVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyleSetName, 0);
  objc_storeStrong((id *)&self->_styleNamesToVisualStylings, 0);
  objc_storeStrong((id *)&self->_visualStylesToStyleNames, 0);
}

@end
