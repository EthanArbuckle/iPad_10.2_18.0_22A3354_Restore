@implementation IKTemplateStyleSheet

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[IKTemplateStyleSheet templateName](self, "templateName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(v4 + 32);
  v27 = (_QWORD *)v4;
  *(_QWORD *)(v4 + 32) = v5;

  v7 = (void *)MEMORY[0x1E0C99E08];
  -[IKTemplateStyleSheet templateTree](self, "templateTree");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[IKTemplateStyleSheet templateTree](self, "templateTree");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v14);
        -[IKTemplateStyleSheet templateTree](self, "templateTree");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(v9, "setObject:forKey:", v18, v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

  v19 = (void *)v27[2];
  v27[2] = v9;
  v20 = v9;

  -[IKTemplateStyleSheet styleFactory](self, "styleFactory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "copy");
  v23 = (void *)v27[1];
  v27[1] = v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v27[3];
  v27[3] = v24;

  return v27;
}

+ (void)registerStyleSheetURL:(id)a3 forTemplateName:(id)a4
{
  objc_msgSend(a1, "registerStyleSheetURL:parentStyleSheets:forTemplateName:", a3, 0, a4);
}

+ (void)registerStyleSheetURL:(id)a3 parentStyleSheets:(id)a4 forTemplateName:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v16 = a1;
  v24 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v7 = a4;
  v8 = a5;
  if (registerStyleSheetURL_parentStyleSheets_forTemplateName__onceToken == -1)
  {
    if (!v7)
      goto LABEL_13;
  }
  else
  {
    dispatch_once(&registerStyleSheetURL_parentStyleSheets_forTemplateName__onceToken, &__block_literal_global_24);
    if (!v7)
      goto LABEL_13;
  }
  if (objc_msgSend(v7, "count", v16))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v20;
LABEL_6:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "scheme");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("file"));

        if (!v15)
          goto LABEL_21;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v10)
            goto LABEL_6;
          break;
        }
      }
    }

  }
LABEL_13:
  if (objc_msgSend(v8, "length", v16))
  {
    v9 = v17;
    objc_sync_enter(v9);
    if (v7)
      objc_msgSend((id)sParentPathMap, "setObject:forKey:", v7, v8);
    else
      objc_msgSend((id)sParentPathMap, "removeObjectForKey:", v8);
    if (v18)
      objc_msgSend((id)sFilePathMap, "setObject:forKey:", v18, v8);
    else
      objc_msgSend((id)sFilePathMap, "removeObjectForKey:", v8);
    objc_msgSend((id)sUnloadedTemplateNames, "addObject:", v8);
    objc_sync_exit(v9);
LABEL_21:

  }
}

void __80__IKTemplateStyleSheet_registerStyleSheetURL_parentStyleSheets_forTemplateName___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sUnloadedTemplateNames;
  sUnloadedTemplateNames = v0;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sParentPathMap;
  sParentPathMap = v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)sFilePathMap;
  sFilePathMap = v4;

}

+ (void)loadStyleSheets
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  objc_sync_enter(v2);
  objc_msgSend((id)sUnloadedTemplateNames, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sUnloadedTemplateNames, "removeAllObjects");
  objc_sync_exit(v2);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        +[IKConcurrentEvaluator idleEvaluator](IKConcurrentEvaluator, "idleEvaluator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = v6;
        v11[1] = 3221225472;
        v11[2] = __39__IKTemplateStyleSheet_loadStyleSheets__block_invoke;
        v11[3] = &unk_1E9F4E700;
        v11[4] = v8;
        v11[5] = v2;
        objc_msgSend(v9, "addEvaluationBlock:forKey:", v11, v8);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

uint64_t __39__IKTemplateStyleSheet_loadStyleSheets__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_styleSheetForTemplateName:", *(_QWORD *)(a1 + 32));
}

+ (id)styleSheetForTemplateName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[IKConcurrentEvaluator idleEvaluator](IKConcurrentEvaluator, "idleEvaluator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

- (id)styleComposerForElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  IKTemplateStyleSheet *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t (**v61)(_QWORD, _QWORD);
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("templateKeyPath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[IKTemplateStyleSheet styleComposersByKeypath](self, "styleComposersByKeypath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        goto LABEL_44;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v5;
    v11 = v5;
    v12 = 0;
    v59 = v11;
    do
    {
      objc_msgSend(v11, "elementName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!+[IKViewElementFactory isDependentByTagName:](IKViewElementFactory, "isDependentByTagName:", v13))
      {
        if (v12)
          v14 = v12;
        else
          v14 = v13;
        v15 = v14;

        objc_msgSend(v10, "addObject:", v13);
        v12 = v15;
      }
      objc_msgSend(v9, "insertObject:atIndex:", v13, 0);
      objc_msgSend(v11, "parentStyleableElement");
      v16 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v16;
    }
    while (v16);
    v57 = v12;
    v58 = v10;
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ik_sharedInstance");
    v18 = objc_claimAutoreleasedReturnValue();

    v54 = (void *)v18;
    objc_msgSend(v59, "setObject:forKeyedSubscript:", v18, CFSTR("templateKeyPath"));
    v19 = objc_msgSend(v9, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKTemplateStyleSheet templateTree](self, "templateTree");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
      goto LABEL_21;
    objc_msgSend(v20, "addObject:", &unk_1E9F8C5D8);
    if (v19 < 2)
      goto LABEL_18;
    for (i = 1; i != v19; ++i)
    {
      objc_msgSend(v9, "objectAtIndex:", i);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "childNodes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKey:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = v27;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v29);

        v23 = v28;
      }

    }
    if (v23)
    {
LABEL_18:
      objc_msgSend(v59, "elementName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __48__IKTemplateStyleSheet_styleComposerForElement___block_invoke;
      v63[3] = &unk_1E9F4E728;
      v64 = v58;
      v31 = v30;
      v65 = v31;
      v66 = v57;
      v61 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1DF092410](v63);
      if (((uint64_t (**)(_QWORD, void *))v61)[2](v61, v23))
      {
        -[IKTemplateStyleSheet _styleComposerForNode:](self, "_styleComposerForNode:", v23);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v55;
      }
      else
      {
        v52 = v31;
        v62 = v23;
        v32 = objc_msgSend(v20, "count");
        v60 = v20;
        v53 = v23;
        v56 = self;
        while (1)
        {
LABEL_23:
          objc_msgSend(v62, "parentNode", v52);
          v33 = (id)objc_claimAutoreleasedReturnValue();

          v62 = v33;
          if (!v33)
            break;
          objc_msgSend(v20, "objectAtIndex:", --v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "integerValue") + 1;

          if (v35 < v19)
          {
            v36 = 1;
            while (1)
            {
              v33 = v62;
              do
              {
                v37 = v33;
                objc_msgSend(v9, "objectAtIndex:", v35);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "childNodes");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "objectForKey:", v38);
                v40 = objc_claimAutoreleasedReturnValue();
                v41 = (void *)v40;
                if (v40)
                  v42 = (void *)v40;
                else
                  v42 = v33;
                v33 = v42;

                ++v35;
              }
              while (v35 < v19);
              if ((((uint64_t (**)(_QWORD, id))v61)[2](v61, v33) & 1) != 0)
                break;
              ++v36;
              v20 = v60;
              objc_msgSend(v60, "objectAtIndex:", v32);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v43, "integerValue") + v36;

              if (v35 >= v19)
              {
                self = v56;
                goto LABEL_23;
              }
            }
            self = v56;
            v20 = v60;
            if (v33)
              break;
          }
        }
        objc_msgSend(v59, "parentStyleableElement");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKTemplateStyleSheet styleComposerForElement:](self, "styleComposerForElement:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (v62)
        {
          -[IKTemplateStyleSheet _styleComposerForNode:](self, "_styleComposerForNode:", v33);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v45, "defaultStyleComposer");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          +[IKViewElementStyleComposer styleComposerWithDefaultStyleComposer:parentStyleComposer:styleList:elementStyleOverrides:](IKViewElementStyleComposer, "styleComposerWithDefaultStyleComposer:parentStyleComposer:styleList:elementStyleOverrides:", 0, v47, 0, 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

        }
        -[IKTemplateStyleSheet styleFactory](self, "styleFactory");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "styleListForClassSelector:", 0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        +[IKViewElementStyleComposer styleComposerWithDefaultStyleComposer:parentStyleComposer:styleList:elementStyleOverrides:](IKViewElementStyleComposer, "styleComposerWithDefaultStyleComposer:parentStyleComposer:styleList:elementStyleOverrides:", v46, v45, v49, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v55;
        v20 = v60;
        v31 = v52;
        v23 = v53;
      }

      if (v8)
      {
        -[IKTemplateStyleSheet styleComposersByKeypath](self, "styleComposersByKeypath");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v54;
        objc_msgSend(v50, "setObject:forKey:", v8, v54);

LABEL_43:
LABEL_44:

        goto LABEL_45;
      }
    }
    else
    {
LABEL_21:
      v8 = 0;
      v5 = v55;
    }
    v6 = v54;
    goto LABEL_43;
  }
  v8 = 0;
LABEL_45:

  return v8;
}

uint64_t __48__IKTemplateStyleSheet_styleComposerForElement___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    while (1)
    {
      v6 = (void *)a1[4];
      objc_msgSend(v5, "nodeName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v6) = objc_msgSend(v6, "containsObject:", v7);

      if ((_DWORD)v6)
        break;
      objc_msgSend(v5, "parentNode");
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v8;
      if (!v8)
        goto LABEL_8;
    }
    v5 = v5;
  }
  else
  {
    v5 = 0;
  }
LABEL_8:
  objc_msgSend(v4, "nodeName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", a1[5]))
  {
    objc_msgSend(v5, "parentNode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v5, "nodeName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", a1[6]);

    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setViewElementStylesDirty
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[IKTemplateStyleSheet styleComposersByKeypath](self, "styleComposersByKeypath", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "setNeedsRecomposition");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[IKTemplateStyleSheet styleFactory](self, "styleFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setViewElementStylesDirty");

}

+ (id)_styleSheetForTemplateName:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  _xmlDoc *v7;
  id v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  const xmlDoc *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _xmlDoc *v24;
  id v25;
  NSObject *v26;
  xmlNodePtr RootElement;
  xmlNodePtr v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  os_signpost_id_t v48;
  __int128 v50;
  xmlDoc *doc;
  id obj;
  id ptr;
  id v54;
  id v55;
  char v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[4];
  id v62;
  uint8_t buf[4];
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  ptr = a3;
  ITMLKitGetLogObject(3);
  v4 = objc_claimAutoreleasedReturnValue();
  ITMLKitGetLogObject(3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, ptr);

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D95F2000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "IKTemplateStyleSheet-Parse", (const char *)&unk_1D96B1A0E, buf, 2u);
  }

  v7 = +[IKTemplateStyleSheet _xmlTreeForTemplateName:](IKTemplateStyleSheet, "_xmlTreeForTemplateName:", ptr);
  doc = v7;
  if (v7)
  {
    +[IKTemplateStyleSheet _resolveEmbeddedTemplatesInXmlTree:](IKTemplateStyleSheet, "_resolveEmbeddedTemplatesInXmlTree:", xmlDocGetRootElement(v7));
    v8 = a1;
    objc_sync_enter(v8);
    objc_msgSend((id)sParentPathMap, "objectForKey:", ptr);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v8);

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (v10)
    {
      v12 = 0;
      v13 = *(_QWORD *)v58;
      *(_QWORD *)&v11 = 138412290;
      v50 = v11;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v58 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          v56 = 0;
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v50);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "path");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "fileExistsAtPath:isDirectory:", v17, &v56);
          if (v56)
            v19 = 0;
          else
            v19 = v18;

          if ((v19 & 1) == 0)
          {
            ITMLKitGetLogObject(0);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              +[IKTemplateStyleSheet _styleSheetForTemplateName:].cold.3(v29, v30, v31, v32, v33, v34, v35, v36);

            v37 = 0;
            v38 = obj;
            goto LABEL_41;
          }
          v20 = (void *)MEMORY[0x1E0C99D50];
          objc_msgSend(v15, "path");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "dataWithContentsOfFile:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          ITMLKitGetLogObject(0);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            +[IKTemplateStyleSheet _styleSheetForTemplateName:].cold.2(buf, v15, &v64, v23);

          v55 = 0;
          v24 = +[IKTemplateStyleSheet _xmlTreeWithData:error:](IKTemplateStyleSheet, "_xmlTreeWithData:error:", v22, &v55);
          v25 = v55;
          if (v25)
          {
            ITMLKitGetLogObject(0);
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v61 = v50;
              v62 = v25;
              _os_log_error_impl(&dword_1D95F2000, v26, OS_LOG_TYPE_ERROR, "%@", v61, 0xCu);
            }

          }
          if (v12 && v24)
          {
            RootElement = xmlDocGetRootElement(v12);
            +[IKTemplateStyleSheet _coalesceTrees:overridingTree:forcedTemplateName:](IKTemplateStyleSheet, "_coalesceTrees:overridingTree:forcedTemplateName:", RootElement, xmlDocGetRootElement(v24), ptr);
            xmlFreeDoc(v24);
          }
          else
          {
            v12 = v24;
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        if (v10)
          continue;
        break;
      }

      if (v12)
      {
        v28 = xmlDocGetRootElement(v12);
        +[IKTemplateStyleSheet _coalesceTrees:overridingTree:forcedTemplateName:](IKTemplateStyleSheet, "_coalesceTrees:overridingTree:forcedTemplateName:", v28, xmlDocGetRootElement(doc), ptr);
        xmlFreeDoc(doc);
        doc = (xmlDoc *)v12;
      }
    }
    else
    {

    }
    v54 = 0;
    v37 = -[IKTemplateStyleSheet _initWithXMLDoc:templateName:error:]([IKTemplateStyleSheet alloc], "_initWithXMLDoc:templateName:error:", doc, ptr, &v54);
    v38 = v54;
    if (v38)
    {
      ITMLKitGetLogObject(0);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[IKDOMDocument getElementById:].cold.1((uint64_t)v38, v39, v40, v41, v42, v43, v44, v45);

    }
    xmlFreeDoc(doc);
    ITMLKitGetLogObject(3);
    v46 = objc_claimAutoreleasedReturnValue();
    ITMLKitGetLogObject(3);
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = os_signpost_id_make_with_pointer(v47, ptr);

    if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)v61 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D95F2000, v46, OS_SIGNPOST_INTERVAL_END, v48, "IKTemplateStyleSheet-Parse", (const char *)&unk_1D96B1A0E, v61, 2u);
    }

LABEL_41:
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

+ (void)_coalesceTrees:(_xmlNode *)a3 overridingTree:(_xmlNode *)a4 forcedTemplateName:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  _xmlNode *i;
  void *v12;
  void *v13;
  void *v14;
  xmlNodePtr v15;
  xmlNode *v16;

  v8 = a5;
  v9 = (void *)MEMORY[0x1DF092260]();
  objc_msgSend(a1, "_coalesceNode:overridingNode:forcedTemplateName:", a3, a4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v9);
  for (i = a4->children; i; i = i->next)
  {
    if (i->type == XML_ELEMENT_NODE)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", i->name);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v16 = 0;
      if (v13)
      {
        objc_msgSend(v13, "getValue:", &v16);
        v15 = v16;
      }
      else
      {
        v15 = xmlNewChild(a3, 0, (const xmlChar *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), 0);
        v16 = v15;
      }
      +[IKTemplateStyleSheet _coalesceTrees:overridingTree:forcedTemplateName:](IKTemplateStyleSheet, "_coalesceTrees:overridingTree:forcedTemplateName:", v15, i, v8);

    }
  }

}

+ (id)_coalesceNode:(_xmlNode *)a3 overridingNode:(_xmlNode *)a4 forcedTemplateName:(id)a5
{
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _xmlNode *children;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  __CFString *v20;
  void *v21;
  int v22;
  xmlChar *Content;
  void *v24;
  const __CFString *v25;
  xmlChar *Prop;
  xmlChar *v27;
  void *v28;
  xmlChar *v29;
  xmlChar *v30;
  void *v31;
  xmlChar *v32;
  xmlChar *v33;
  void *v34;
  xmlChar *v35;
  xmlChar *v36;
  void *v37;
  _xmlNode *v38;
  __CFString *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  int v43;
  id v44;
  id v45;
  __CFString *v46;
  void *v47;
  int v48;
  xmlChar *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  xmlChar *v58;
  xmlChar *v59;
  __CFString *v60;
  void *v61;
  const xmlChar *v62;
  id v63;
  xmlChar *v64;
  xmlChar *v65;
  __CFString *v66;
  void *v67;
  const xmlChar *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t i;
  id v76;
  xmlNode *v77;
  void *v78;
  void *v79;
  int v80;
  __CFString *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v87;
  __CFString *v88;
  void *v89;
  id v90;
  __CFString *v91;
  id obj;
  uint64_t v93;
  _xmlNode *parent;
  void *v95;
  int v96;
  uint64_t v97;
  int v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v90 = a5;
  v7 = 0;
  parent = a3;
  if (a3 && a4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->name);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v10, "isEqualToString:", CFSTR("head"));

    v89 = v9;
    objc_msgSend(v9, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v11, "isEqualToString:", CFSTR("document"));

    children = a4->children;
    if (children)
    {
      v13 = &stru_1E9F50578;
      v14 = &stru_1E9F50578;
      while (children->type != XML_ELEMENT_NODE)
      {
        v25 = v14;
        v20 = v13;
LABEL_34:
        children = children->next;
        if (!children)
          goto LABEL_39;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", children->name);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v96)
      {
        -[__CFString lowercaseString](v13, "lowercaseString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("head"));

        if (v17)
        {
          v18 = objc_retainAutorelease(v90);
          xmlNodeSetName(children, (const xmlChar *)objc_msgSend(v18, "UTF8String"));
          v19 = v18;

          v15 = v19;
        }
      }
      v20 = v15;

      if (v98
        && (-[__CFString lowercaseString](v20, "lowercaseString"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("style")),
            v21,
            v22))
      {
        Content = xmlNodeGetContent(children);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Content);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", v24);
        v25 = (const __CFString *)objc_claimAutoreleasedReturnValue();

        if (Content)
          ((void (*)(xmlChar *))*MEMORY[0x1E0DE8D30])(Content);
      }
      else
      {
        v25 = v14;
      }
      Prop = xmlGetProp(children, (const xmlChar *)objc_msgSend(CFSTR("class"), "UTF8String"));
      if (Prop)
      {
        v27 = Prop;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Prop);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(xmlChar *))*MEMORY[0x1E0DE8D30])(v27);
      }
      else
      {
        v28 = 0;
      }
      v29 = xmlGetProp(children, (const xmlChar *)objc_msgSend(CFSTR("style"), "UTF8String"));
      if (v29)
      {
        v30 = v29;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(xmlChar *))*MEMORY[0x1E0DE8D30])(v30);
        if (!v28)
          goto LABEL_21;
      }
      else
      {
        v31 = 0;
        if (!v28)
        {
LABEL_21:
          if (v31)
            objc_msgSend(v100, "setObject:forKey:", v31, v20);

          v32 = xmlGetProp(children, (const xmlChar *)"overrideclass");
          if (v32)
          {
            v33 = v32;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (*)(xmlChar *))*MEMORY[0x1E0DE8D30])(v33);
          }
          else
          {
            v34 = 0;
          }
          v35 = xmlGetProp(children, (const xmlChar *)"overridestyle");
          if (v35)
          {
            v36 = v35;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v35);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (*)(xmlChar *))*MEMORY[0x1E0DE8D30])(v36);
            if (!v34)
            {
LABEL_31:
              if (v37)
                objc_msgSend(v99, "setObject:forKey:", v37, v20);

              v13 = v20;
              v14 = (__CFString *)v25;
              goto LABEL_34;
            }
          }
          else
          {
            v37 = 0;
            if (!v34)
              goto LABEL_31;
          }
          objc_msgSend(v101, "setObject:forKey:", v34, v20);
          goto LABEL_31;
        }
      }
      objc_msgSend(v102, "setObject:forKey:", v28, v20);
      goto LABEL_21;
    }
    v20 = &stru_1E9F50578;
    v25 = &stru_1E9F50578;
LABEL_39:

    v38 = parent->children;
    if (v38)
    {
      v39 = &stru_1E9F50578;
      v40 = (__CFString *)v25;
      while (v38->type != XML_ELEMENT_NODE)
      {
        v46 = v39;
LABEL_64:
        v38 = v38->next;
        if (!v38)
          goto LABEL_69;
      }
      objc_msgSend(*(id *)(v8 + 2368), "stringWithUTF8String:", v38->name);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v96)
      {
        -[__CFString lowercaseString](v39, "lowercaseString");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("head"));

        if (v43)
        {
          v44 = objc_retainAutorelease(v90);
          xmlNodeSetName(v38, (const xmlChar *)objc_msgSend(v44, "UTF8String"));
          v45 = v44;

          v41 = v45;
        }
      }
      v46 = v41;

      if (v98)
      {
        -[__CFString lowercaseString](v46, "lowercaseString");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("style"));

        if (v48)
        {
          if ((-[__CFString isEqualToString:](v40, "isEqualToString:", &stru_1E9F50578) & 1) == 0)
          {
            v49 = xmlNodeGetContent(v38);
            objc_msgSend(*(id *)(v8 + 2368), "stringWithUTF8String:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (v49)
              ((void (*)(xmlChar *))*MEMORY[0x1E0DE8D30])(v49);
            objc_msgSend(v50, "stringByAppendingString:", v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            v52 = objc_retainAutorelease(v51);
            xmlNodeSetContent(v38, (const xmlChar *)objc_msgSend(v52, "UTF8String"));

            v40 = &stru_1E9F50578;
          }
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v38);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "setObject:forKey:", v53, v46);

      objc_msgSend(v100, "valueForKey:", v46);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "valueForKey:", v46);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "valueForKey:", v46);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "valueForKey:", v46);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54)
      {
        objc_msgSend(v100, "removeObjectForKey:", v46);
        v58 = xmlGetProp(v38, (const xmlChar *)objc_msgSend(CFSTR("style"), "UTF8String"));
        if (v58)
        {
          v59 = v58;
          objc_msgSend(*(id *)(v8 + 2368), "stringWithUTF8String:", v58);
          v60 = v46;
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (*)(xmlChar *))*MEMORY[0x1E0DE8D30])(v59);
          v62 = (const xmlChar *)objc_msgSend(CFSTR("style"), "UTF8String");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@;%@"), v61, v54);
          v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          xmlSetProp(v38, v62, (const xmlChar *)objc_msgSend(v63, "UTF8String"));

          v46 = v60;
          v8 = 0x1E0CB3000;
        }
        else
        {
          xmlSetProp(v38, (const xmlChar *)objc_msgSend(CFSTR("style"), "UTF8String"), (const xmlChar *)objc_msgSend(objc_retainAutorelease(v54), "UTF8String"));
        }
      }
      if (v55)
      {
        objc_msgSend(v102, "removeObjectForKey:", v46);
        v64 = xmlGetProp(v38, (const xmlChar *)objc_msgSend(CFSTR("class"), "UTF8String"));
        if (!v64)
        {
          xmlSetProp(v38, (const xmlChar *)objc_msgSend(CFSTR("class"), "UTF8String"), (const xmlChar *)objc_msgSend(objc_retainAutorelease(v55), "UTF8String"));
          if (!v56)
            goto LABEL_61;
          goto LABEL_60;
        }
        v65 = v64;
        objc_msgSend(*(id *)(v8 + 2368), "stringWithUTF8String:", v64);
        v66 = v46;
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(xmlChar *))*MEMORY[0x1E0DE8D30])(v65);
        v68 = (const xmlChar *)objc_msgSend(CFSTR("class"), "UTF8String");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v67, v55);
        v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        xmlSetProp(v38, v68, (const xmlChar *)objc_msgSend(v69, "UTF8String"));

        v46 = v66;
        v8 = 0x1E0CB3000;
      }
      if (!v56)
      {
LABEL_61:
        if (v57)
        {
          objc_msgSend(v101, "removeObjectForKey:", v46);
          xmlSetProp(v38, (const xmlChar *)objc_msgSend(CFSTR("class"), "UTF8String"), (const xmlChar *)objc_msgSend(objc_retainAutorelease(v57), "UTF8String"));
        }

        v39 = v46;
        goto LABEL_64;
      }
LABEL_60:
      objc_msgSend(v99, "removeObjectForKey:", v46);
      xmlSetProp(v38, (const xmlChar *)objc_msgSend(CFSTR("style"), "UTF8String"), (const xmlChar *)objc_msgSend(objc_retainAutorelease(v56), "UTF8String"));
      goto LABEL_61;
    }
    v46 = &stru_1E9F50578;
    v40 = (__CFString *)v25;
LABEL_69:
    v88 = v46;
    v91 = v40;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "allKeys");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addObjectsFromArray:", v71);

    objc_msgSend(v102, "allKeys");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addObjectsFromArray:", v72);

    objc_msgSend(v99, "allKeys");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addObjectsFromArray:", v73);

    objc_msgSend(v101, "allKeys");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addObjectsFromArray:", v74);

    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    objc_msgSend(v70, "allObjects");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
    v87 = v70;
    if (v97)
    {
      v93 = *(_QWORD *)v104;
      do
      {
        for (i = 0; i != v97; ++i)
        {
          if (*(_QWORD *)v104 != v93)
            objc_enumerationMutation(obj);
          v76 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v103 + 1) + 8 * i));
          v77 = xmlNewChild(parent, 0, (const xmlChar *)objc_msgSend(v76, "UTF8String"), 0);
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "setObject:forKey:", v78, v76);

          if (v98)
          {
            objc_msgSend(v76, "lowercaseString");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = objc_msgSend(v79, "isEqualToString:", CFSTR("style"));

            if (v80)
            {
              if ((-[__CFString isEqualToString:](v91, "isEqualToString:", &stru_1E9F50578) & 1) == 0)
              {
                v81 = objc_retainAutorelease(v91);
                xmlNodeSetContent(0, (const xmlChar *)-[__CFString UTF8String](v81, "UTF8String"));

                v91 = &stru_1E9F50578;
              }
            }
          }
          objc_msgSend(v100, "objectForKey:", v76);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          if (v82)
            xmlSetProp(v77, (const xmlChar *)objc_msgSend(CFSTR("style"), "UTF8String"), (const xmlChar *)objc_msgSend(objc_retainAutorelease(v82), "UTF8String"));
          objc_msgSend(v102, "objectForKey:", v76);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          if (v83)
            xmlSetProp(v77, (const xmlChar *)objc_msgSend(CFSTR("class"), "UTF8String"), (const xmlChar *)objc_msgSend(objc_retainAutorelease(v83), "UTF8String"));
          objc_msgSend(v99, "objectForKey:", v76);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          if (v84)
            xmlSetProp(v77, (const xmlChar *)objc_msgSend(CFSTR("style"), "UTF8String"), (const xmlChar *)objc_msgSend(objc_retainAutorelease(v84), "UTF8String"));
          objc_msgSend(v101, "objectForKey:", v76);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          if (v85)
            xmlSetProp(v77, (const xmlChar *)objc_msgSend(CFSTR("class"), "UTF8String"), (const xmlChar *)objc_msgSend(objc_retainAutorelease(v85), "UTF8String"));

        }
        v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
      }
      while (v97);
    }

    v7 = (void *)objc_msgSend(v95, "copy");
  }

  return v7;
}

+ (_xmlDoc)_xmlTreeForTemplateName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _xmlDoc *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  unsigned __int8 v24;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  objc_msgSend((id)sFilePathMap, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (v6)
  {
    v24 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, &v24);
    v10 = v24;

    if (!v9 || v10)
    {
      ITMLKitGetLogObject(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[IKTemplateStyleSheet _styleSheetForTemplateName:].cold.3(v13, v15, v16, v17, v18, v19, v20, v21);
      v14 = 0;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v6, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dataWithContentsOfFile:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v23 = 0;
      v14 = +[IKTemplateStyleSheet _xmlTreeWithData:error:](IKTemplateStyleSheet, "_xmlTreeWithData:error:", v13, &v23);
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (_xmlDoc)_xmlTreeWithData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  id v7;
  const char *v8;
  int v9;
  _xmlDoc *Memory;
  void *v11;

  v5 = (void *)*MEMORY[0x1E0C80C10];
  v6 = a3;
  xmlSetGenericErrorFunc(v5, MEMORY[0x1E0C83478]);
  v7 = objc_retainAutorelease(v6);
  v8 = (const char *)objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");

  Memory = xmlReadMemory(v8, v9, 0, 0, 4096);
  xmlSetGenericErrorFunc(0, 0);
  v11 = 0;
  if (!Memory)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 200, 0);
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v11);
LABEL_4:

  return Memory;
}

+ (void)_resolveEmbeddedTemplatesInXmlTree:(_xmlNode *)a3
{
  _xmlDoc *doc;
  unint64_t v5;
  _xmlNode *children;
  unint64_t v7;
  void (**v8)(xmlChar *);
  const xmlChar *v9;
  xmlAttrPtr v10;
  xmlAttr *v11;
  xmlChar *Prop;
  xmlChar *v13;
  void *v14;
  uint64_t v15;
  xmlDoc *v16;
  xmlChar *Content;
  xmlChar *v18;
  __CFString *v19;
  xmlChar *v20;
  xmlChar *v21;
  unint64_t v22;
  uint64_t v23;
  void (**v24)(xmlChar *);
  xmlNode *v25;
  void *v26;
  const xmlChar *v27;
  xmlNode *v28;
  uint64_t i;
  xmlNode *v30;
  void *v31;
  uint64_t v32;
  xmlNode *v33;
  xmlNode *cur;

  doc = a3->doc;
  cur = 0;
  v5 = 0x1E9F4A000uLL;
  +[IKTemplateStyleSheet _findNodesInXmlTree:styleNode:templateNode:](IKTemplateStyleSheet, "_findNodesInXmlTree:styleNode:templateNode:", doc, &cur, 0);
  children = a3->children;
  if (children)
  {
    v7 = 0x1E0CB3000uLL;
    v8 = (void (**)(xmlChar *))MEMORY[0x1E0DE8D30];
    do
    {
      if (children->type == XML_ELEMENT_NODE)
      {
        v9 = (const xmlChar *)objc_msgSend(CFSTR("embedStyleSheetForTemplate"), "UTF8String");
        v10 = xmlHasProp(children, v9);
        if (v10)
        {
          v11 = v10;
          Prop = xmlGetProp(children, v9);
          if (Prop)
          {
            v13 = Prop;
            objc_msgSend(*(id *)(v7 + 2368), "stringWithUTF8String:", Prop);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            (*v8)(v13);
          }
          else
          {
            v14 = 0;
          }
          xmlRemoveProp(v11);
        }
        else
        {
          v14 = 0;
        }
        if (objc_msgSend(v14, "length"))
        {
          v15 = objc_msgSend(*(id *)(v5 + 3168), "_xmlTreeForTemplateName:", v14);
          if (v15)
          {
            v16 = (xmlDoc *)v15;
            v32 = 0;
            v33 = 0;
            objc_msgSend(*(id *)(v5 + 3168), "_findNodesInXmlTree:styleNode:templateNode:", v15, &v33, &v32);
            if (cur && v33)
            {
              Content = xmlNodeGetContent(cur);
              if (Content)
              {
                v18 = Content;
                objc_msgSend(*(id *)(v7 + 2368), "stringWithUTF8String:", Content);
                v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
                (*v8)(v18);
              }
              else
              {
                v19 = &stru_1E9F50578;
              }
              v20 = xmlNodeGetContent(v33);
              if (v20)
              {
                v21 = v20;
                objc_msgSend(*(id *)(v7 + 2368), "stringWithUTF8String:", v20);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", v31);
                v22 = v7;
                v23 = objc_claimAutoreleasedReturnValue();

                v24 = v8;
                v25 = cur;
                v26 = (void *)v23;
                v7 = v22;
                v19 = objc_retainAutorelease(v26);
                v27 = (const xmlChar *)-[__CFString UTF8String](v19, "UTF8String");
                v28 = v25;
                v8 = v24;
                xmlNodeSetContent(v28, v27);
                (*v24)(v21);

                v5 = 0x1E9F4A000;
              }

            }
            if (v32)
            {
              for (i = *(_QWORD *)(v32 + 24); i; i = *(_QWORD *)(i + 48))
              {
                if (*(_DWORD *)(i + 8) == 1)
                {
                  v30 = xmlDocCopyNode((xmlNodePtr)i, doc, 1);
                  xmlAddChild(children, v30);
                }
              }
            }
            xmlFreeDoc(v16);
          }
        }
        else if (children->children)
        {
          objc_msgSend(*(id *)(v5 + 3168), "_resolveEmbeddedTemplatesInXmlTree:", children);
        }

      }
      children = children->next;
    }
    while (children);
  }
}

+ (void)_findNodesInXmlTree:(_xmlDoc *)a3 styleNode:(_xmlNode *)a4 templateNode:(_xmlNode *)a5
{
  xmlNodePtr RootElement;
  _xmlNode *children;
  _xmlNode *v9;
  _xmlNode *v10;
  BOOL v11;
  _xmlNode *v12;
  _xmlNode *v13;
  BOOL v14;

  RootElement = xmlDocGetRootElement(a3);
  if (!xmlStrcmp(RootElement->name, (const xmlChar *)"document"))
  {
    children = RootElement->children;
    if (children)
    {
      v9 = 0;
      v10 = 0;
      do
      {
        if (v10 && v9)
          break;
        if (children->type == XML_ELEMENT_NODE)
        {
          if (v10 || xmlStrcmp(children->name, (const xmlChar *)"head"))
          {
            if (v9)
              v11 = 1;
            else
              v11 = v10 == 0;
            if (!v11)
              v9 = children;
          }
          else
          {
            v10 = children;
          }
        }
        children = children->next;
      }
      while (children);
    }
    else
    {
      v10 = 0;
      v9 = 0;
    }
    if (a5)
      *a5 = v9;
    if (a4 && v10)
    {
      v12 = v10->children;
      if (v12)
      {
        do
        {
          if (v12->type == XML_ELEMENT_NODE)
          {
            if (xmlStrcmp(v12->name, (const xmlChar *)"style"))
              v13 = 0;
            else
              v13 = v12;
          }
          else
          {
            v13 = 0;
          }
          v12 = v12->next;
          if (v12)
            v14 = v13 == 0;
          else
            v14 = 0;
        }
        while (v14);
      }
      else
      {
        v13 = 0;
      }
      *a4 = v13;
    }
  }
}

- (id)_initWithXMLDoc:(_xmlDoc *)a3 templateName:(id)a4 error:(id *)a5
{
  id v8;
  IKTemplateStyleSheet *v9;
  void *v10;
  xmlNodePtr RootElement;
  _QWORD *p_private;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *styleComposersByKeypath;
  uint64_t v21;
  NSDictionary *templateTree;
  uint64_t v23;
  NSString *templateName;
  uint64_t v25;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[4];
  id v35;
  IKTemplateStyleSheet *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  objc_super v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v42.receiver = self;
  v42.super_class = (Class)IKTemplateStyleSheet;
  v9 = -[IKTemplateStyleSheet init](&v42, sel_init);
  if (!v9)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    RootElement = xmlDocGetRootElement(a3);
    p_private = &RootElement->_private;
    if (!RootElement)
    {
LABEL_14:
      objc_storeStrong((id *)&v9->_styleFactory, p_private);
      v21 = objc_msgSend(v10, "copy");
      templateTree = v9->_templateTree;
      v9->_templateTree = (NSDictionary *)v21;

      v23 = objc_msgSend(v8, "copy");
      templateName = v9->_templateName;
      v9->_templateName = (NSString *)v23;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v25 = objc_claimAutoreleasedReturnValue();
      v17 = 0;
      styleComposersByKeypath = v9->_styleComposersByKeypath;
      v9->_styleComposersByKeypath = (NSMutableDictionary *)v25;
      goto LABEL_15;
    }
    IKXMLStripSpaces((uint64_t)RootElement);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_private[2]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("document")) & 1) != 0)
    {
      v38 = 0;
      v39 = &v38;
      v40 = 0x2020000000;
      v14 = MEMORY[0x1E0C809B0];
      v41 = 0;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __59__IKTemplateStyleSheet__initWithXMLDoc_templateName_error___block_invoke;
      v34[3] = &unk_1E9F4E750;
      v37 = &v38;
      v35 = v10;
      v36 = v9;
      IKXMLEnumerateChildElements((uint64_t)p_private, v34);
      v28 = 0;
      v29 = &v28;
      v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__22;
      v32 = __Block_byref_object_dispose__22;
      v33 = 0;
      v15 = v39[3];
      if (v15)
      {
        v27[0] = v14;
        v27[1] = 3221225472;
        v27[2] = __59__IKTemplateStyleSheet__initWithXMLDoc_templateName_error___block_invoke_81;
        v27[3] = &unk_1E9F4E778;
        v27[4] = &v28;
        IKXMLEnumerateChildElements(v15, v27);
        v16 = v29[5];
      }
      else
      {
        v16 = 0;
      }
      +[IKStyleFactory styleFactoryWithMarkup:filterBlockedStyles:](IKStyleFactory, "styleFactoryWithMarkup:filterBlockedStyles:", v16, 0);
      p_private = (_QWORD *)objc_claimAutoreleasedReturnValue();
      _Block_object_dispose(&v28, 8);

      _Block_object_dispose(&v38, 8);
      v17 = 0;
    }
    else
    {
      v43 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not a style sheet document (must be document): %@"), v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 203, v19);
      p_private = 0;
    }

  }
  else
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 200, 0);
    p_private = 0;
  }
  if (!v17)
    goto LABEL_14;
  styleComposersByKeypath = v9;
  v9 = 0;
LABEL_15:

  if (a5)
    *a5 = objc_retainAutorelease(v17);

LABEL_18:
  return v9;
}

void __59__IKTemplateStyleSheet__initWithXMLDoc_templateName_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = v5;
  v11 = v5;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || (v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("head")), v6 = v11, !v7))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend((id)objc_opt_class(), "_templateTreeWithXMLTree:parentNode:", a2, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v10, v11);

    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  }

}

xmlChar *__59__IKTemplateStyleSheet__initWithXMLDoc_templateName_error___block_invoke_81(uint64_t a1, const xmlNode *a2, void *a3, _BYTE *a4)
{
  xmlChar *result;
  xmlChar *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  result = (xmlChar *)objc_msgSend(a3, "isEqualToString:", CFSTR("style"));
  if ((_DWORD)result)
  {
    result = xmlNodeGetContent(a2);
    if (result)
    {
      v8 = result;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", result);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      result = (xmlChar *)((uint64_t (*)(xmlChar *))*MEMORY[0x1E0DE8D30])(v8);
    }
    *a4 = 1;
  }
  return result;
}

+ (id)_templateTreeWithXMLTree:(_xmlNode *)a3 parentNode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a4;
  v7 = (void *)MEMORY[0x1DF092260]();
  objc_msgSend(a1, "_templateNodeWithXMLNode:parentNode:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v7);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__IKTemplateStyleSheet__templateTreeWithXMLTree_parentNode___block_invoke;
  v15[3] = &unk_1E9F4E7A0;
  v16 = v9;
  v18 = a1;
  v10 = v8;
  v17 = v10;
  v11 = v9;
  IKXMLEnumerateChildElements((uint64_t)a3, v15);
  objc_msgSend(v10, "setChildNodes:", v11);
  v12 = v17;
  v13 = v10;

  return v13;
}

void __60__IKTemplateStyleSheet__templateTreeWithXMLTree_parentNode___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = a1[5];
  v4 = (void *)a1[6];
  v6 = (void *)a1[4];
  v7 = a3;
  objc_msgSend(v4, "_templateTreeWithXMLTree:parentNode:", a2, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ik_sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v9, v8);
}

+ (id)_templateNodeWithXMLNode:(_xmlNode *)a3 parentNode:(id)a4
{
  void *v5;
  const xmlChar *name;
  id v7;
  void *v8;
  xmlChar *Prop;
  void (**v10)(xmlChar *);
  xmlChar *v11;
  void *v12;
  xmlChar *v13;
  xmlChar *v14;
  void *v15;
  IKTemplateTreeNode *v16;
  void *v17;
  IKTemplateTreeNode *v18;

  v5 = (void *)MEMORY[0x1E0CB3940];
  name = a3->name;
  v7 = a4;
  objc_msgSend(v5, "stringWithUTF8String:", name);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  Prop = xmlGetProp(a3, (const xmlChar *)objc_msgSend(CFSTR("class"), "UTF8String"));
  v10 = (void (**)(xmlChar *))MEMORY[0x1E0DE8D30];
  if (Prop)
  {
    v11 = Prop;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Prop);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*v10)(v11);
  }
  else
  {
    v12 = 0;
  }
  v13 = xmlGetProp(a3, (const xmlChar *)objc_msgSend(CFSTR("style"), "UTF8String"));
  if (v13)
  {
    v14 = v13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*v10)(v14);
  }
  else
  {
    v15 = 0;
  }
  v16 = [IKTemplateTreeNode alloc];
  +[IKViewElementStyle elementStyleWithSelector:inlineStyleString:filterBlockedStyles:](IKViewElementStyle, "elementStyleWithSelector:inlineStyleString:filterBlockedStyles:", v12, v15, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[IKTemplateTreeNode initWithNodeName:styleOverrides:parentNode:](v16, "initWithNodeName:styleOverrides:parentNode:", v8, v17, v7);

  return v18;
}

- (id)_styleComposerForNode:(id)a3
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
  void *v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "styleComposer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(v5, "parentNode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKTemplateStyleSheet _styleComposerForNode:](self, "_styleComposerForNode:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "styleOverrides");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "classDescriptorString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKTemplateStyleSheet styleFactory](self, "styleFactory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "styleListForClassSelector:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[IKViewElementStyleComposer styleComposerWithDefaultStyleComposer:parentStyleComposer:styleList:elementStyleOverrides:](IKViewElementStyleComposer, "styleComposerWithDefaultStyleComposer:parentStyleComposer:styleList:elementStyleOverrides:", 0, v8, v12, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setStyleComposer:", v13);

    }
  }
  objc_msgSend(v5, "styleComposer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (IKStyleFactory)styleFactory
{
  return self->_styleFactory;
}

- (NSDictionary)templateTree
{
  return self->_templateTree;
}

- (NSMutableDictionary)styleComposersByKeypath
{
  return self->_styleComposersByKeypath;
}

- (NSString)templateName
{
  return self->_templateName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateName, 0);
  objc_storeStrong((id *)&self->_styleComposersByKeypath, 0);
  objc_storeStrong((id *)&self->_templateTree, 0);
  objc_storeStrong((id *)&self->_styleFactory, 0);
}

+ (void)_styleSheetForTemplateName:(_QWORD *)a3 .cold.2(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1D95F2000, a4, OS_LOG_TYPE_DEBUG, "Getting data for: %@", a1, 0xCu);

}

+ (void)_styleSheetForTemplateName:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D95F2000, a1, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
