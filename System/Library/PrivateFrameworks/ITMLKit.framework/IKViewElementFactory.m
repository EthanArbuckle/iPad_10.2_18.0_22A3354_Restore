@implementation IKViewElementFactory

+ (void)initialize
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = (void *)sClassMap;
    sClassMap = (uint64_t)v2;

    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = (void *)sTypeMap_0;
    sTypeMap_0 = (uint64_t)v4;

    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (void *)sDependentMap;
    sDependentMap = (uint64_t)v6;

    +[IKViewElementFactory registerClass:forElementName:elementType:](IKViewElementFactory, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("head"), 47);
    +[IKViewElementFactory registerClass:forElementName:elementType:](IKViewElementFactory, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("img"), 49);
    +[IKViewElementFactory registerClass:forElementName:elementType:](IKViewElementFactory, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("text"), 138);
    +[IKViewElementFactory registerClass:forElementName:elementType:](IKViewElementFactory, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("span"), 138);
  }
}

+ (void)registerClass:(Class)a3 forElementName:(id)a4 elementType:(unint64_t)a5 dependent:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a6;
  v9 = a4;
  v10 = v9;
  if (a3)
  {
    v16 = v9;
    v11 = objc_msgSend(v9, "length");
    v10 = v16;
    if (a5)
    {
      if (v11)
      {
        objc_msgSend((id)sClassMap, "setObject:forKey:", a3, v16);
        v12 = (void *)sTypeMap_0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v13, v16);

        v14 = (void *)sDependentMap;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v15, v16);

        v10 = v16;
      }
    }
  }

}

+ (void)registerClass:(Class)a3 forElementName:(id)a4 elementType:(unint64_t)a5
{
  objc_msgSend(a1, "registerClass:forElementName:elementType:dependent:", a3, a4, a5, 0);
}

- (IKViewElementFactory)initWithElementRegistry:(id)a3
{
  id v5;
  IKViewElementFactory *v6;
  IKViewElementFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKViewElementFactory;
  v6 = -[IKViewElementFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_elementRegistry, a3);

  return v7;
}

+ (Class)elementClassByTagName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewElementRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(v5, "elementClassByTagName:", v3);

    v7 = v6;
  }
  else
  {
    objc_msgSend((id)sClassMap, "objectForKeyedSubscript:", v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (Class)v7;
}

+ (BOOL)isDependentByTagName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  v3 = a3;
  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewElementRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "isDependentByTagName:", v3);
  }
  else
  {
    objc_msgSend((id)sDependentMap, "objectForKeyedSubscript:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v7, "BOOLValue");
    v3 = v7;
  }

  return v6;
}

- (Class)elementClassByTagName:(id)a3
{
  IKViewElementRegistry *elementRegistry;

  elementRegistry = self->_elementRegistry;
  if (elementRegistry)
    return -[IKViewElementRegistry elementClassByTagName:](elementRegistry, "elementClassByTagName:", a3);
  objc_msgSend((id)sClassMap, "objectForKeyedSubscript:", a3);
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)elementTypeByTagName:(id)a3
{
  IKViewElementRegistry *elementRegistry;
  void *v5;
  unint64_t v6;

  elementRegistry = self->_elementRegistry;
  if (elementRegistry)
    return -[IKViewElementRegistry elementTypeByTagName:](elementRegistry, "elementTypeByTagName:", a3);
  objc_msgSend((id)sTypeMap_0, "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  return v6;
}

+ (BOOL)elementsForDocumentElement:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  IKViewElementFactory *v53;
  void *v54;
  void *v55;
  IKViewElementFactory *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  NSObject *v68;
  os_signpost_id_t v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  os_signpost_id_t v73;
  uint64_t v74;
  uint64_t v75;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  BOOL v81;
  void *v82;
  void *v83;
  unint64_t v84;
  _BOOL4 v85;
  void *v86;
  void *v87;
  void *v88;
  uint8_t buf[16];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "tagName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("document"));
  v9 = v8;
  if (!v8)
    goto LABEL_90;
  v80 = v7;
  v81 = v8;
  v82 = v6;
  v83 = v5;
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  objc_msgSend(v5, "childElements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
  if (v11)
  {
    v12 = v11;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v95;
    while (1)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v95 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
        if (v13
          || (objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i), "tagName"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("head")),
              v17,
              (v18 & 1) == 0))
        {
          if (v87
            || (objc_msgSend(v16, "tagName"),
                v20 = (void *)objc_claimAutoreleasedReturnValue(),
                v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("navigationBar")),
                v20,
                (v21 & 1) == 0))
          {
            if (v86
              || (objc_msgSend(v16, "tagName"),
                  v22 = (void *)objc_claimAutoreleasedReturnValue(),
                  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("toolbar")),
                  v22,
                  (v23 & 1) == 0))
            {
              v19 = v16;
              if (v88)
                continue;
              goto LABEL_18;
            }
            v86 = v16;
          }
          else
          {
            v87 = v16;
          }
          v19 = v88;
        }
        else
        {
          v19 = v88;
          v13 = v16;
        }
LABEL_18:
        v24 = v16;
        v88 = v19;
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
      if (!v12)
        goto LABEL_23;
    }
  }
  v86 = 0;
  v87 = 0;
  v88 = 0;
  v13 = 0;
LABEL_23:

  v5 = v83;
  objc_msgSend(v83, "jsNodeData");
  v25 = objc_claimAutoreleasedReturnValue();
  v84 = +[IKViewElement evaluateElementUpdateType:](IKViewElement, "evaluateElementUpdateType:", v25);
  v85 = v84 != 0;
  v26 = v13;
  objc_msgSend(v13, "jsNodeData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v82;
  objc_msgSend(v82, "headViewElement");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = (void *)v25;
  if (v28 || !v13)
  {
    objc_msgSend(v82, "headViewElement");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      v31 = v13 == 0;
    else
      v31 = 0;
    v29 = v31;
    if (v13)
    {
      if ((objc_msgSend(v27, "isSubtreeUpdated") & 1) != 0 || (objc_msgSend(v27, "isChildrenUpdated") & 1) != 0)
        v29 = 1;
      else
        v29 = objc_msgSend(v27, "isUpdated");
    }

  }
  else
  {
    v29 = 1;
  }

  objc_msgSend(v82, "templateViewElement");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "elementName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "tagName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v33, "isEqualToString:", v34);

  v78 = v27;
  v77 = v35;
  if ((v84 | 4) == 4)
    goto LABEL_39;
  if ((v29 | v35 ^ 1) == 1)
  {
    v85 = 1;
LABEL_39:
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    objc_msgSend(v13, "childElements");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
    if (v37)
    {
      v38 = v37;
      v39 = 0;
      v40 = *(_QWORD *)v91;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v91 != v40)
            objc_enumerationMutation(v36);
          v42 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
          objc_msgSend(v42, "tagName");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("style"));

          if (v44)
          {
            objc_msgSend(v42, "textContent");
            v45 = objc_claimAutoreleasedReturnValue();
            v46 = (void *)v45;
            if (v39)
            {
              objc_msgSend(v39, "stringByAppendingString:", v45);
              v47 = objc_claimAutoreleasedReturnValue();

              v39 = (void *)v47;
            }
            else
            {
              v39 = (void *)v45;
            }
          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
      }
      while (v38);
    }
    else
    {
      v39 = 0;
    }

    +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v48, "appUsesDefaultStyleSheets"))
    {
      objc_msgSend(v88, "tagName");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[IKTemplateStyleSheet styleSheetForTemplateName:](IKTemplateStyleSheet, "styleSheetForTemplateName:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v50 = 0;
    }
    v6 = v82;
    v5 = v83;
    v26 = v13;

    +[IKViewElementStyleFactory styleFactoryWithMarkup:styleSheet:](IKViewElementStyleFactory, "styleFactoryWithMarkup:styleSheet:", v39, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setStyleFactory:", v51);

    goto LABEL_58;
  }
  v85 = 0;
LABEL_58:
  objc_msgSend(v6, "styleFactory");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = [IKViewElementFactory alloc];
  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "viewElementRegistry");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[IKViewElementFactory initWithElementRegistry:](v53, "initWithElementRegistry:", v55);

  -[IKViewElementFactory setSparse:](v56, "setSparse:", v84 != 0);
  -[IKViewElementFactory setStyleFactory:](v56, "setStyleFactory:", v52);
  if (v26)
  {
    if (v85)
    {
      objc_msgSend(v26, "jsNodeData");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setUpdated:", 1);

    }
    -[IKViewElementFactory elementForDOMElement:parent:](v56, "elementForDOMElement:parent:", v26, 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHeadViewElement:", v58);

  }
  if (v87)
  {
    if (v85)
    {
      objc_msgSend(v87, "jsNodeData");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setUpdated:", 1);

      -[IKViewElementFactory elementForDOMElement:parent:](v56, "elementForDOMElement:parent:", v87, 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "disperseUpdateType:", 2);
    }
    else
    {
      -[IKViewElementFactory elementForDOMElement:parent:](v56, "elementForDOMElement:parent:", v87, 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "setNavigationBarViewElement:", v60);

  }
  if (v86)
  {
    if (v85)
    {
      objc_msgSend(v86, "jsNodeData");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setUpdated:", 1);

      -[IKViewElementFactory elementForDOMElement:parent:](v56, "elementForDOMElement:parent:", v86, 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "disperseUpdateType:", 2);
    }
    else
    {
      -[IKViewElementFactory elementForDOMElement:parent:](v56, "elementForDOMElement:parent:", v86, 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "setToolBarViewElement:", v62);

  }
  if (v85)
  {
    objc_msgSend(v88, "jsNodeData");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setUpdated:", 1);

  }
  if (!v84)
  {
    objc_msgSend(v88, "jsNodeData");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setDataResolved:", 0);

    objc_msgSend(v88, "jsNodeData");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setPrototypesResolved:", 0);

    objc_msgSend(v88, "jsNodeData");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setRulesParsed:", 0);

  }
  ITMLKitGetLogObject(3);
  v67 = objc_claimAutoreleasedReturnValue();
  ITMLKitGetLogObject(3);
  v68 = objc_claimAutoreleasedReturnValue();
  v69 = os_signpost_id_make_with_pointer(v68, &stru_1E9F50578);

  if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D95F2000, v67, OS_SIGNPOST_INTERVAL_BEGIN, v69, "DOMParsing", (const char *)&unk_1D96B1A0E, buf, 2u);
  }

  -[IKViewElementFactory elementForDOMElement:parent:](v56, "elementForDOMElement:parent:", v88, 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  ITMLKitGetLogObject(3);
  v71 = objc_claimAutoreleasedReturnValue();
  ITMLKitGetLogObject(3);
  v72 = objc_claimAutoreleasedReturnValue();
  v73 = os_signpost_id_make_with_pointer(v72, &stru_1E9F50578);

  if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D95F2000, v71, OS_SIGNPOST_INTERVAL_END, v73, "DOMParsing", (const char *)&unk_1D96B1A0E, buf, 2u);
  }

  if (v85)
    objc_msgSend(v70, "disperseUpdateType:", 2);
  objc_msgSend(v6, "setTemplateViewElement:", v70);
  v74 = 4;
  if (v77)
    v74 = 1;
  if (v84)
    v75 = v74;
  else
    v75 = 0;
  objc_msgSend(v6, "setUpdateType:", v75);

  v9 = v81;
  v7 = v80;
LABEL_90:

  return v9;
}

- (void)setSparse:(BOOL)a3
{
  *(_BYTE *)&self->_parsingFlags = *(_BYTE *)&self->_parsingFlags & 0xFE | a3;
}

- (BOOL)isSparse
{
  return *(_BYTE *)&self->_parsingFlags & 1;
}

- (id)elementForDOMElement:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  char v13;
  char parsingFlags;
  char v15;
  int v16;
  char v17;
  char v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  objc_class *v24;
  objc_class *v25;
  void *v26;
  char v27;
  char v28;
  char v29;
  char v30;
  NSObject *v31;
  char v32;
  char v33;
  char v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  char v44;
  char v45;
  void *v46;
  char v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_6;
  objc_msgSend(v6, "tagName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("placeholder")))
    goto LABEL_5;
  objc_msgSend(v6, "tagName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("prototypes")))
  {

LABEL_5:
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v6, "tagName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("rules"));

  if ((v13 & 1) != 0)
    goto LABEL_6;
  parsingFlags = (char)self->_parsingFlags;
  v15 = parsingFlags;
  if ((parsingFlags & 8) != 0 || (v16 = objc_msgSend(v6, "_isPrototypeElement"), v15 = (char)self->_parsingFlags, v16))
  {
    v17 = 8;
    v18 = 1;
  }
  else
  {
    v18 = 0;
    v17 = 0;
  }
  *(_BYTE *)&self->_parsingFlags = v17 | v15 & 0xF7;
  if ((v15 & 1) != 0)
    v19 = v18;
  else
    v19 = 1;
  objc_msgSend(v6, "jsNodeData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if ((v19 & 1) != 0 || (objc_msgSend(v20, "containsUpdates") & 1) != 0 || (*(_BYTE *)&self->_parsingFlags & 6) != 0)
  {
    v22 = parsingFlags & 8;
    objc_msgSend(v6, "tagName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[IKViewElementFactory elementClassByTagName:](self, "elementClassByTagName:", v23);
    if (v24)
    {
      v25 = v24;
      if ((*(_BYTE *)&self->_parsingFlags & 0xA) == 2)
        v24 = (objc_class *)objc_msgSend(v21, "setUpdated:", 1);
      v26 = (void *)MEMORY[0x1DF092260](v24);
      -[objc_class willParseDOMElement:](v25, "willParseDOMElement:", v6);
      objc_autoreleasePoolPop(v26);
      v27 = (char)self->_parsingFlags;
      v28 = v27 & 2;
      if ((v19 & 1) != 0)
      {
        v29 = 0;
        v30 = v27 & 0xFD;
      }
      else
      {
        v33 = objc_msgSend(v21, "isUpdated");
        v34 = 2;
        if ((v33 & 1) == 0 && (v27 & 2) == 0)
        {
          if (-[objc_class shouldParseChildDOMElements](v25, "shouldParseChildDOMElements"))
            v34 = 0;
          else
            v34 = 2;
        }
        v27 = (char)self->_parsingFlags;
        *(_BYTE *)&self->_parsingFlags = v27 & 0xFD | v34;
        if (objc_msgSend(v21, "isChildrenUpdated"))
          v29 = 4;
        else
          v29 = 0;
        v30 = (char)self->_parsingFlags;
      }
      v35 = v27 & 4;
      *(_BYTE *)&self->_parsingFlags = v30 & 0xFB | v29;
      v36 = (void *)objc_msgSend([v25 alloc], "initWithDOMElement:parent:elementFactory:", v6, v7, self);
      v10 = v36;
      if ((v19 & 1) != 0 || (v37 = (char)self->_parsingFlags, (v37 & 2) != 0))
      {
        v44 = v35;
        v45 = v28;
        v46 = v23;
        v47 = v22;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        objc_msgSend(v36, "features");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v49 != v41)
                objc_enumerationMutation(v38);
              v43 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v43, "migrateToViewElement:", v10);
            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
          }
          while (v40);
        }

        v37 = (char)self->_parsingFlags;
        v22 = v47;
        v23 = v46;
        v35 = v44;
        v28 = v45;
      }
      v32 = v35 | v28 | v37 & 0xF9;
    }
    else
    {
      ITMLKitGetLogObject(0);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[IKViewElementFactory elementForDOMElement:parent:].cold.1((uint64_t)v23, v31);

      v10 = 0;
      v32 = (char)self->_parsingFlags;
    }
    *(_BYTE *)&self->_parsingFlags = v32 & 0xF7 | v22;

  }
  else
  {
    v10 = 0;
  }

LABEL_7:
  return v10;
}

- (IKViewElementStyleFactory)styleFactory
{
  return self->_styleFactory;
}

- (void)setStyleFactory:(id)a3
{
  objc_storeStrong((id *)&self->_styleFactory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleFactory, 0);
  objc_storeStrong((id *)&self->_elementRegistry, 0);
}

- (void)elementForDOMElement:(uint64_t)a1 parent:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_ERROR, "Unsupported tag [%@]", (uint8_t *)&v2, 0xCu);
}

@end
