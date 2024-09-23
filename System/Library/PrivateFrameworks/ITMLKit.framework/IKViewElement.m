@implementation IKViewElement

+ (void)willParseDOMElement:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "jsNodeData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __37__IKViewElement_willParseDOMElement___block_invoke;
  v48[3] = &unk_1E9F4EEE0;
  v6 = v3;
  v49 = v6;
  v7 = MEMORY[0x1DF092410](v48);
  v46[0] = v5;
  v46[1] = 3221225472;
  v46[2] = __37__IKViewElement_willParseDOMElement___block_invoke_2;
  v46[3] = &unk_1E9F4EF08;
  v47 = v6;
  v44[0] = v5;
  v44[1] = 3221225472;
  v44[2] = __37__IKViewElement_willParseDOMElement___block_invoke_3;
  v44[3] = &unk_1E9F4E5B0;
  v8 = v47;
  v45 = v8;
  if ((*(unsigned int (**)(uint64_t, const __CFString *, _QWORD *, _QWORD *))(v7 + 16))(v7, CFSTR("prototypes"), v46, v44))
  {
    objc_msgSend(v4, "setPrototypesResolved:", 0);
    objc_msgSend(v4, "setUpdated:", objc_msgSend(v4, "containsUpdates"));
  }
  v42[0] = v5;
  v42[1] = 3221225472;
  v42[2] = __37__IKViewElement_willParseDOMElement___block_invoke_4;
  v42[3] = &unk_1E9F4EF08;
  v43 = v8;
  v40[0] = v5;
  v40[1] = 3221225472;
  v40[2] = __37__IKViewElement_willParseDOMElement___block_invoke_5;
  v40[3] = &unk_1E9F4E5B0;
  v31 = v43;
  v41 = v31;
  if ((*(unsigned int (**)(uint64_t, const __CFString *, _QWORD *, _QWORD *))(v7 + 16))(v7, CFSTR("rules"), v42, v40))
  {
    objc_msgSend(v4, "setRulesParsed:", 0);
    objc_msgSend(v4, "setUpdated:", objc_msgSend(v4, "containsUpdates"));
  }
  if (!objc_msgSend(v4, "isDataResolved")
    || !objc_msgSend(v4, "arePrototypesResolved")
    || (objc_msgSend(v4, "areRulesParsed") & 1) == 0)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v31, "childElements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v37 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if ((objc_msgSend(v4, "isDataResolved") & 1) == 0)
          {
            objc_msgSend(v14, "jsNodeData");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setDataResolved:", 0);

          }
          if ((objc_msgSend(v4, "arePrototypesResolved") & 1) == 0)
          {
            objc_msgSend(v14, "jsNodeData");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setPrototypesResolved:", 0);

          }
          if ((objc_msgSend(v4, "areRulesParsed") & 1) == 0)
          {
            objc_msgSend(v14, "jsNodeData");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setRulesParsed:", 0);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
      }
      while (v11);
    }

  }
  +[IKDOMBindingController prepareForDOMElement:](IKDOMBindingController, "prepareForDOMElement:", v31, v7);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v31, "childElements");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v50, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(v23, "elementName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("fragment"));

        if (v25)
        {
          +[IKViewElement willParseDOMElement:](IKViewElement, "willParseDOMElement:", v23);
          objc_msgSend(v23, "jsNodeData");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "isUpdated"))
          {

          }
          else
          {
            objc_msgSend(v23, "jsNodeData");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isChildrenUpdated");

            if (!v28)
              continue;
          }
          objc_msgSend(v31, "jsNodeData");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setChildrenUpdated:", 1);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v50, 16);
    }
    while (v20);
  }

}

uint64_t __37__IKViewElement_willParseDOMElement___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(_QWORD);
  void (**v9)(id, id);
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "childElements", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "elementName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v7);

        if (v16)
        {
          v11 = v14;
          goto LABEL_11;
        }
      }
      v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  v8[2](v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getAttribute:", CFSTR("itmlID"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = &stru_1E9F50578;
  if (v18)
    v20 = (__CFString *)v18;
  v21 = v20;

  if (v17)
  {
    if (objc_msgSend(v17, "isEqualToString:", v21))
    {
      objc_msgSend(v11, "jsNodeData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "containsUpdates");

    }
    else
    {
      v23 = 1;
    }
  }
  else
  {
    v23 = 0;
  }
  v9[2](v9, v21);

  return v23;
}

uint64_t __37__IKViewElement_willParseDOMElement___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ikve_prototypesID");
}

uint64_t __37__IKViewElement_willParseDOMElement___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "ikve_setPrototypesID:", a2);
}

uint64_t __37__IKViewElement_willParseDOMElement___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ikve_rulesID");
}

uint64_t __37__IKViewElement_willParseDOMElement___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "ikve_setRulesID:", a2);
}

+ (id)effectiveChildDOMElementsForDOMElement:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "childElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "elementName", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("fragment"));

        if (v13)
        {
          objc_msgSend(a1, "effectiveChildDOMElementsForDOMElement:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v14);

        }
        else
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_msgSend(v5, "copy");
  return v15;
}

+ (BOOL)shouldParseChildDOMElements
{
  return 1;
}

+ (id)supportedFeatures
{
  return 0;
}

+ (id)supportedFeaturesForElementName:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "supportedFeatures");
}

+ (unint64_t)updateTypeForChangeInAttribute:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("autoHighlight"), a4, a5))
    return 1;
  else
    return 4;
}

- (IKViewElement)init
{

  return 0;
}

- (IKViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  IKViewElement *v10;
  IKViewElement *v11;
  uint64_t v12;
  IKDOMBindingController *bindingController;
  uint64_t v14;
  IKDataBinding *binding;
  void *v16;
  uint64_t v17;
  NSDictionary *dataDictionary;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *classSelector;
  uint64_t v25;
  NSString *autoHighlightIdentifier;
  uint64_t v27;
  NSString *elementID;
  uint64_t v29;
  NSString *itmlID;
  uint64_t v31;
  NSString *accessibilityText;
  void *v33;
  void *v34;
  char v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  uint64_t v43;
  NSDictionary *impressionableAttributes;
  uint64_t v45;
  NSDictionary *attributes;
  void *v47;
  uint64_t v48;
  NSString *elementName;
  void *v50;
  id v51;
  void *v52;
  NSObject *v53;
  NSString *v54;
  void *v55;
  void *v56;
  NSString *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  IKViewElementStyleComposer *styleComposer;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  NSArray *unfilteredChildren;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t k;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  NSArray *features;
  uint64_t v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  objc_super v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _QWORD v112[2];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v94 = a5;
  v109.receiver = self;
  v109.super_class = (Class)IKViewElement;
  v10 = -[IKViewElement init](&v109, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_parent, v9);
    +[IKDOMBindingController domBindingControllerForDOMElement:](IKDOMBindingController, "domBindingControllerForDOMElement:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    bindingController = v11->_bindingController;
    v11->_bindingController = (IKDOMBindingController *)v12;

    -[IKDOMBindingController binding](v11->_bindingController, "binding");
    v14 = objc_claimAutoreleasedReturnValue();
    binding = v11->_binding;
    v11->_binding = (IKDataBinding *)v14;

    -[IKDOMBindingController dataItem](v11->_bindingController, "dataItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataDictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    dataDictionary = v11->_dataDictionary;
    v11->_dataDictionary = (NSDictionary *)v17;

    v11->_isPartOfPrototypeElement = objc_msgSend(v8, "_isPartOfPrototypeElement");
    objc_msgSend(v8, "jsNodeData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_updateType = +[IKViewElement evaluateElementUpdateType:](IKViewElement, "evaluateElementUpdateType:", v19);
    objc_msgSend(v8, "_attributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    objc_msgSend(v21, "objectForKeyedSubscript:");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v8;
    objc_msgSend(v8, "getAttribute:", CFSTR("class"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    classSelector = v11->_classSelector;
    v11->_classSelector = (NSString *)v23;

    if (!-[IKViewElement isPartOfPrototypeElement](v11, "isPartOfPrototypeElement")
      && (objc_msgSend(v19, "isAutoHighlightRead") & 1) == 0)
    {
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("autoHighlight"));
      v25 = objc_claimAutoreleasedReturnValue();
      autoHighlightIdentifier = v11->_autoHighlightIdentifier;
      v11->_autoHighlightIdentifier = (NSString *)v25;

      v11->_didUpdateAutoHighlightIdentifier = 1;
      objc_msgSend(v19, "setAutoHighlightRead:", 1);
    }
    v96 = v19;
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("id"));
    v27 = objc_claimAutoreleasedReturnValue();
    elementID = v11->_elementID;
    v11->_elementID = (NSString *)v27;

    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("itmlID"));
    v29 = objc_claimAutoreleasedReturnValue();
    itmlID = v11->_itmlID;
    v11->_itmlID = (NSString *)v29;

    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("accessibilityText"));
    v31 = objc_claimAutoreleasedReturnValue();
    accessibilityText = v11->_accessibilityText;
    v11->_accessibilityText = (NSString *)v31;

    if (!-[IKViewElement isPartOfPrototypeElement](v11, "isPartOfPrototypeElement"))
    {
      objc_msgSend(v21, "objectForKey:", CFSTR("disabled"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v33)
        v35 = objc_msgSend(v33, "BOOLValue");
      else
        v35 = objc_msgSend(v9, "isDisabled");
      v11->_disabled = v35;
      objc_msgSend(v21, "removeObjectForKey:", CFSTR("disabled"));

    }
    v91 = v9;
    v11->_impressionable = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v36 = v21;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v106;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v106 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
          if (objc_msgSend(v41, "hasPrefix:", CFSTR("data-metrics")))
          {
            v11->_impressionable = 1;
            objc_msgSend(v36, "objectForKeyedSubscript:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "setObject:forKey:", v42, v41);

          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
      }
      while (v38);
    }

    v43 = objc_msgSend(v95, "copy");
    impressionableAttributes = v11->_impressionableAttributes;
    v11->_impressionableAttributes = (NSDictionary *)v43;

    objc_msgSend(v36, "removeObjectForKey:", v89);
    objc_msgSend(v36, "removeObjectForKey:", CFSTR("itmlID"));
    objc_msgSend(v36, "removeObjectForKey:", CFSTR("autoHighlight"));
    objc_msgSend(v36, "removeObjectForKey:", CFSTR("style"));
    if (objc_msgSend(v36, "count"))
    {
      v45 = objc_msgSend(v36, "copy");
      attributes = v11->_attributes;
      v11->_attributes = (NSDictionary *)v45;

    }
    v8 = v93;
    objc_msgSend(v93, "nodeName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "ik_sharedInstance");
    v48 = objc_claimAutoreleasedReturnValue();
    elementName = v11->_elementName;
    v11->_elementName = (NSString *)v48;

    v11->_elementType = objc_msgSend(v94, "elementTypeByTagName:", v11->_elementName);
    v50 = (void *)MEMORY[0x1DF092260]();
    +[IKViewElementStyle elementStyleWithSelector:inlineStyleString:filterBlockedStyles:](IKViewElementStyle, "elementStyleWithSelector:inlineStyleString:filterBlockedStyles:", v11->_classSelector, v92, 1);
    v51 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "domb_boundCSSRule");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      ITMLKitGetLogObject(0);
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        -[IKViewElement initWithDOMElement:parent:elementFactory:].cold.1(v11, (uint64_t)v93, v53);

      v54 = v11->_classSelector;
      objc_msgSend(v93, "domb_boundCSSRule");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      +[IKViewElementStyle elementStyleWithSelector:cssRule:filterBlockedStyles:](IKViewElementStyle, "elementStyleWithSelector:cssRule:filterBlockedStyles:", v54, v55, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        v57 = v11->_classSelector;
        v112[0] = v51;
        v112[1] = v56;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 2);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        +[IKViewElementStyle elementStyleWithSelector:aggregatingStyles:](IKViewElementStyle, "elementStyleWithSelector:aggregatingStyles:", v57, v58);
        v59 = objc_claimAutoreleasedReturnValue();

        v51 = (id)v59;
      }
      else
      {
        v51 = v56;
      }

    }
    objc_msgSend(v94, "styleFactory");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "styleComposerForElement:elementStyleOverrides:", v11, v51);
    v61 = objc_claimAutoreleasedReturnValue();
    styleComposer = v11->_styleComposer;
    v11->_styleComposer = (IKViewElementStyleComposer *)v61;

    objc_autoreleasePoolPop(v50);
    if (objc_msgSend((id)objc_opt_class(), "shouldParseChildDOMElements"))
    {
      +[IKViewElement effectiveChildDOMElementsForDOMElement:](IKViewElement, "effectiveChildDOMElementsForDOMElement:", v93);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v63, "count"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v104 = 0u;
      v65 = v63;
      v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
      if (v66)
      {
        v67 = v66;
        v68 = *(_QWORD *)v102;
        do
        {
          for (j = 0; j != v67; ++j)
          {
            if (*(_QWORD *)v102 != v68)
              objc_enumerationMutation(v65);
            v70 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * j);
            if (objc_msgSend((id)objc_opt_class(), "shouldParseChildDOMElement:", v70))
            {
              objc_msgSend(v94, "elementForDOMElement:parent:", v70, v11);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              if (v71)
                objc_msgSend(v64, "addObject:", v71);

            }
          }
          v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
        }
        while (v67);
      }

      if (objc_msgSend(v64, "count"))
      {
        v72 = objc_msgSend(v64, "copy");
        unfilteredChildren = v11->_unfilteredChildren;
        v11->_unfilteredChildren = (NSArray *)v72;
      }
      else
      {
        unfilteredChildren = v11->_unfilteredChildren;
        v11->_unfilteredChildren = 0;
      }

    }
    v74 = (void *)objc_opt_class();
    -[IKViewElement elementName](v11, "elementName");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "supportedFeaturesForElementName:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v76, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v76, "count"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      v100 = 0u;
      v90 = v76;
      v78 = v76;
      v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
      if (!v79)
        goto LABEL_56;
      v80 = v79;
      v81 = *(_QWORD *)v98;
      while (1)
      {
        for (k = 0; k != v80; ++k)
        {
          if (*(_QWORD *)v98 != v81)
            objc_enumerationMutation(v78);
          v83 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * k);
          objc_msgSend(v96, "featureForName:", v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v84)
          {
            +[IKDOMFeatureFactory featureForName:withDOMNode:](IKDOMFeatureFactory, "featureForName:withDOMNode:", v83, v93);
            v85 = objc_claimAutoreleasedReturnValue();
            if (!v85)
              continue;
            v84 = (void *)v85;
            objc_msgSend(v96, "setFeature:forName:", v85, v83);
          }
          objc_msgSend(v77, "addObject:", v84);

        }
        v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
        if (!v80)
        {
LABEL_56:

          v8 = v93;
          v76 = v90;
          goto LABEL_58;
        }
      }
    }
    v77 = 0;
LABEL_58:
    v86 = objc_msgSend(v77, "copy");
    features = v11->_features;
    v11->_features = (NSArray *)v86;

    v9 = v91;
  }

  return v11;
}

- (IKViewElement)initWithPrototypeElement:(id)a3 parent:(id)a4 appDataItem:(id)a5
{
  id v8;
  id v9;
  IKAppDataItem *v10;
  IKViewElement *v11;
  IKViewElement *v12;
  void *v13;
  uint64_t v14;
  NSString *classSelector;
  IKDOMBindingController *bindingController;
  uint64_t v17;
  IKDataBinding *binding;
  uint64_t v19;
  NSDictionary *dataDictionary;
  NSString *elementID;
  NSString *itmlID;
  uint64_t v23;
  NSString *accessibilityText;
  uint64_t v25;
  NSString *elementName;
  NSArray *features;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  NSString *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  uint64_t v71;
  NSString *autoHighlightIdentifier;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t k;
  void *v78;
  void *v79;
  uint64_t v80;
  NSDictionary *impressionableAttributes;
  uint64_t v82;
  NSDictionary *attributes;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t m;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  void *v99;
  void *v100;
  IKAppDataItem *v101;
  void *v102;
  IKAppDataItem *v103;
  id v104;
  IKAppDataItem *v105;
  void *v106;
  uint64_t v107;
  NSArray *unfilteredChildren;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  id obj;
  void *v119;
  uint64_t v120;
  IKViewElement *v121;
  IKAppDataItem *v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  objc_super v139;
  _BYTE v140[128];
  _BYTE v141[128];
  _QWORD v142[2];
  _BYTE v143[128];
  _BYTE v144[128];
  uint64_t v145;

  v145 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (IKAppDataItem *)a5;
  v139.receiver = self;
  v139.super_class = (Class)IKViewElement;
  v11 = -[IKViewElement init](&v139, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_isProxyElement = 1;
    objc_storeWeak((id *)&v11->_parent, v9);
    objc_msgSend(v8, "classSelector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    classSelector = v12->_classSelector;
    v12->_classSelector = (NSString *)v14;

    bindingController = v12->_bindingController;
    v12->_bindingController = 0;

    objc_msgSend(v8, "binding");
    v17 = objc_claimAutoreleasedReturnValue();
    binding = v12->_binding;
    v12->_binding = (IKDataBinding *)v17;

    v122 = v10;
    -[IKAppDataItem dataDictionary](v10, "dataDictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    dataDictionary = v12->_dataDictionary;
    v12->_dataDictionary = (NSDictionary *)v19;

    elementID = v12->_elementID;
    v12->_elementID = 0;

    itmlID = v12->_itmlID;
    v12->_itmlID = 0;

    objc_msgSend(v8, "accessibilityText");
    v23 = objc_claimAutoreleasedReturnValue();
    accessibilityText = v12->_accessibilityText;
    v12->_accessibilityText = (NSString *)v23;

    objc_msgSend(v8, "elementName");
    v25 = objc_claimAutoreleasedReturnValue();
    elementName = v12->_elementName;
    v12->_elementName = (NSString *)v25;

    v12->_elementType = objc_msgSend(v8, "elementType");
    features = v12->_features;
    v12->_features = 0;

    objc_msgSend(v8, "attributes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "mutableCopy");
    v30 = v29;
    v114 = v8;
    v111 = v9;
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    v119 = v31;

    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    -[IKDataBinding keyValues](v12->_binding, "keyValues");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "allKeys");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v135, v144, 16);
    v121 = v12;
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v136;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v136 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
          if (objc_msgSend(v38, "characterAtIndex:", 0) == 64)
          {
            -[IKDataBinding keyValues](v12->_binding, "keyValues");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectForKeyedSubscript:", v38);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[IKAppDataItem valueForPropertyPath:](v122, "valueForPropertyPath:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v41, "stringValue");
                v42 = objc_claimAutoreleasedReturnValue();

                v41 = (void *)v42;
                v12 = v121;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v38, "substringFromIndex:", 1);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "setObject:forKeyedSubscript:", v41, v43);

              }
            }

          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v135, v144, 16);
      }
      while (v35);
    }

    objc_msgSend(v8, "styleComposer");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = (void *)objc_opt_new();
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    v134 = 0u;
    -[IKDataBinding keyValues](v12->_binding, "keyValues");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "allKeys");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v131, v143, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v132;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v132 != v48)
            objc_enumerationMutation(v45);
          v50 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * j);
          if (objc_msgSend(v50, "characterAtIndex:", 0) == 35)
          {
            objc_msgSend(v50, "substringFromIndex:", 1);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            -[IKDataBinding keyValues](v12->_binding, "keyValues");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "objectForKeyedSubscript:", v50);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[IKAppDataItem valueForPropertyPath:](v122, "valueForPropertyPath:", v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              +[IKCSSFactory createDeclarationForName:withObject:](IKCSSFactory, "createDeclarationForName:withObject:", v51, v54);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              if (v55)
                objc_msgSend(v115, "addDeclaration:", v55);

              v12 = v121;
            }

          }
        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v131, v143, 16);
      }
      while (v47);
    }

    if (objc_msgSend(v115, "count"))
    {
      v56 = (void *)objc_opt_new();
      objc_msgSend(v56, "setDeclarationList:", v115);
      +[IKViewElementStyle elementStyleWithSelector:cssRule:filterBlockedStyles:](IKViewElementStyle, "elementStyleWithSelector:cssRule:filterBlockedStyles:", v12->_classSelector, v56, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "elementStyleOverrides");
      v58 = objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        v59 = (void *)v58;
        v60 = v12->_classSelector;
        v142[0] = v58;
        v142[1] = v57;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 2);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        +[IKViewElementStyle elementStyleWithSelector:aggregatingStyles:](IKViewElementStyle, "elementStyleWithSelector:aggregatingStyles:", v60, v61);
        v62 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v62 = v57;
      }
      objc_msgSend(v112, "defaultStyleComposer");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "parentStyleComposer");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "styleList");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      +[IKViewElementStyleComposer styleComposerWithDefaultStyleComposer:parentStyleComposer:styleList:elementStyleOverrides:](IKViewElementStyleComposer, "styleComposerWithDefaultStyleComposer:parentStyleComposer:styleList:elementStyleOverrides:", v65, v66, v67, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = v111;
      v12 = v121;
    }
    else
    {
      v64 = v111;
      v63 = v112;
    }
    objc_storeStrong((id *)&v12->_styleComposer, v63);
    if ((objc_msgSend(v64, "isProxyElement") & 1) == 0)
    {
      -[IKAppDataItem identifier](v122, "identifier");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "setObject:forKeyedSubscript:", v68, CFSTR("itemID"));

    }
    objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("disabled"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v69;
    if (v69)
      v70 = objc_msgSend(v69, "BOOLValue");
    else
      v70 = objc_msgSend(v64, "isDisabled");
    v113 = v63;
    v12->_disabled = v70;
    objc_msgSend(v119, "removeObjectForKey:", CFSTR("disabled"));
    objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("autoHighlight"));
    v71 = objc_claimAutoreleasedReturnValue();
    autoHighlightIdentifier = v12->_autoHighlightIdentifier;
    v12->_autoHighlightIdentifier = (NSString *)v71;

    if (v71)
      v12->_didUpdateAutoHighlightIdentifier = 1;
    objc_msgSend(v119, "removeObjectForKey:", CFSTR("autoHighlight"));
    v12->_impressionable = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = 0u;
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    v73 = v119;
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v127, v141, 16);
    v116 = v73;
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v128;
      do
      {
        for (k = 0; k != v75; ++k)
        {
          if (*(_QWORD *)v128 != v76)
            objc_enumerationMutation(v73);
          v78 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * k);
          if (objc_msgSend(v78, "hasPrefix:", CFSTR("data-metrics")))
          {
            v12->_impressionable = 1;
            objc_msgSend(v73, "objectForKeyedSubscript:", v78);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "setObject:forKey:", v79, v78);

            v73 = v116;
          }
        }
        v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v127, v141, 16);
      }
      while (v75);
    }

    v80 = objc_msgSend(v117, "copy");
    impressionableAttributes = v12->_impressionableAttributes;
    v12->_impressionableAttributes = (NSDictionary *)v80;

    if (objc_msgSend(v73, "count"))
    {
      v82 = objc_msgSend(v73, "copy");
      attributes = v12->_attributes;
      v12->_attributes = (NSDictionary *)v82;
    }
    else
    {
      attributes = v12->_attributes;
      v12->_attributes = 0;
    }

    -[IKViewElement appDocument](v12, "appDocument");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v84, "markImplicitlyUpdated");

    if (v85)
    {
      -[IKViewElement _elevateToImplicitUpdateType:](v12, "_elevateToImplicitUpdateType:", 4);
      if (objc_msgSend(v64, "_elevateToImplicitUpdateType:", 3))
      {
        objc_msgSend(v64, "parent");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v86, "_elevateToImplicitUpdateType:", 1))
        {
          do
          {
            objc_msgSend(v86, "parent");
            v87 = (void *)objc_claimAutoreleasedReturnValue();

            v86 = v87;
          }
          while ((objc_msgSend(v87, "_elevateToImplicitUpdateType:", 1) & 1) != 0);
        }
        else
        {
          v87 = v86;
        }

      }
    }
    v88 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v8, "unfilteredChildren");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "arrayWithCapacity:", objc_msgSend(v89, "count"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    objc_msgSend(v8, "unfilteredChildren");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v140, 16);
    if (v91)
    {
      v92 = v91;
      v120 = *(_QWORD *)v124;
      do
      {
        for (m = 0; m != v92; ++m)
        {
          if (*(_QWORD *)v124 != v120)
            objc_enumerationMutation(obj);
          v94 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * m);
          objc_msgSend(v94, "bindingController");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "binding");
          v96 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v96, "dataBoundKeys");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = objc_msgSend(v97, "containsObject:", CFSTR("dataItem"));

          if (v98)
          {
            objc_msgSend(v96, "keyValues");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("dataItem"));
            v100 = (void *)objc_claimAutoreleasedReturnValue();

            v101 = v122;
            -[IKAppDataItem valueForPropertyPath:](v122, "valueForPropertyPath:", v100);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = -[IKAppDataItem initWithType:identifier:prototypeIdentifier:dataDictionary:]([IKAppDataItem alloc], "initWithType:identifier:prototypeIdentifier:dataDictionary:", 0, 0, 0, v102);

          }
          else
          {
            v103 = 0;
            v101 = v122;
          }
          v104 = objc_alloc((Class)objc_opt_class());
          if (v103)
            v105 = v103;
          else
            v105 = v101;
          v106 = (void *)objc_msgSend(v104, "initWithPrototypeElement:parent:appDataItem:", v94, v121, v105);
          objc_msgSend(v90, "addObject:", v106);

        }
        v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v140, 16);
      }
      while (v92);
    }

    if (objc_msgSend(v90, "count"))
    {
      v107 = objc_msgSend(v90, "copy");
      v12 = v121;
      unfilteredChildren = v121->_unfilteredChildren;
      v121->_unfilteredChildren = (NSArray *)v107;
    }
    else
    {
      v12 = v121;
      unfilteredChildren = v121->_unfilteredChildren;
      v121->_unfilteredChildren = 0;
    }
    v10 = v122;

    v8 = v114;
    v9 = v111;
  }

  return v12;
}

- (IKViewElement)initWithOriginalElement:(id)a3
{
  id *v4;
  IKViewElement *v5;
  IKViewElement *v6;
  void *v7;
  IKDOMBindingController *bindingController;
  IKDataBinding *binding;
  uint64_t v10;
  NSDictionary *dataDictionary;
  NSString *elementID;
  NSString *itmlID;
  uint64_t v14;
  NSString *accessibilityText;
  uint64_t v16;
  NSString *elementName;
  uint64_t v18;
  IKViewElementStyleComposer *styleComposer;
  NSArray *features;
  uint64_t v21;
  NSDictionary *impressionableAttributes;
  uint64_t v23;
  NSDictionary *attributes;
  void *v25;
  int v26;
  id WeakRetained;
  int v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  uint64_t v41;
  NSArray *unfilteredChildren;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  id v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v54.receiver = self;
  v54.super_class = (Class)IKViewElement;
  v5 = -[IKViewElement init](&v54, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_isProxyElement = 1;
    objc_msgSend(v4, "parent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_parent, v7);

    bindingController = v6->_bindingController;
    v6->_bindingController = 0;

    binding = v6->_binding;
    v6->_binding = 0;

    objc_msgSend(v4, "dataDictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    dataDictionary = v6->_dataDictionary;
    v6->_dataDictionary = (NSDictionary *)v10;

    elementID = v6->_elementID;
    v6->_elementID = 0;

    itmlID = v6->_itmlID;
    v6->_itmlID = 0;

    objc_msgSend(v4, "accessibilityText");
    v14 = objc_claimAutoreleasedReturnValue();
    accessibilityText = v6->_accessibilityText;
    v6->_accessibilityText = (NSString *)v14;

    objc_msgSend(v4, "elementName");
    v16 = objc_claimAutoreleasedReturnValue();
    elementName = v6->_elementName;
    v6->_elementName = (NSString *)v16;

    v6->_elementType = objc_msgSend(v4, "elementType");
    objc_msgSend(v4, "styleComposer");
    v18 = objc_claimAutoreleasedReturnValue();
    styleComposer = v6->_styleComposer;
    v6->_styleComposer = (IKViewElementStyleComposer *)v18;

    features = v6->_features;
    v6->_features = 0;

    v6->_impressionable = objc_msgSend(v4, "isImpressionable");
    objc_msgSend(v4, "impressionableAttributes");
    v21 = objc_claimAutoreleasedReturnValue();
    impressionableAttributes = v6->_impressionableAttributes;
    v6->_impressionableAttributes = (NSDictionary *)v21;

    objc_msgSend(v4, "attributes");
    v23 = objc_claimAutoreleasedReturnValue();
    attributes = v6->_attributes;
    v6->_attributes = (NSDictionary *)v23;

    -[IKViewElement appDocument](v6, "appDocument");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "markImplicitlyUpdated");

    if (v26)
    {
      -[IKViewElement _elevateToImplicitUpdateType:](v6, "_elevateToImplicitUpdateType:", 4);
      WeakRetained = objc_loadWeakRetained((id *)&v6->_parent);
      v28 = objc_msgSend(WeakRetained, "_elevateToImplicitUpdateType:", 3);

      if (v28)
      {
        v29 = objc_loadWeakRetained((id *)&v6->_parent);
        objc_msgSend(v29, "parent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v30, "_elevateToImplicitUpdateType:", 1))
        {
          do
          {
            objc_msgSend(v30, "parent");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v30 = v31;
          }
          while ((objc_msgSend(v31, "_elevateToImplicitUpdateType:", 1) & 1) != 0);
        }
        else
        {
          v31 = v30;
        }

      }
    }
    v32 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v4, "unfilteredChildren");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "arrayWithCapacity:", objc_msgSend(v33, "count"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v4, "unfilteredChildren", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v51 != v38)
            objc_enumerationMutation(v35);
          v40 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOriginalElement:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
          objc_msgSend(v34, "addObject:", v40);

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v37);
    }

    if (objc_msgSend(v34, "count"))
    {
      v41 = objc_msgSend(v34, "copy");
      unfilteredChildren = v6->_unfilteredChildren;
      v6->_unfilteredChildren = (NSArray *)v41;
    }
    else
    {
      unfilteredChildren = v6->_unfilteredChildren;
      v6->_unfilteredChildren = 0;
    }

    v43 = (void *)objc_msgSend(v4[26], "mutableCopy");
    v44 = v43;
    if (v43)
    {
      v45 = v43;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v45 = (id)objc_claimAutoreleasedReturnValue();
    }
    v46 = v45;

    objc_msgSend(v46, "addObject:", v6);
    v47 = objc_msgSend(v46, "copy");
    v48 = v4[26];
    v4[26] = (id)v47;

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)IKViewElement;
  -[IKViewElement dealloc](&v4, sel_dealloc);
}

- (void)configureUpdatesWithElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  IKDiffEvaluator *v7;
  void *v8;
  id v9;
  IKChangeSet *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  IKChangeSet *v16;
  IKChangeSet *unfilteredChildrenChangeSet;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  IKChangeSet *v24;
  uint64_t v25;
  void *v26;
  IKChangeSet *v27;
  IKChangeSet *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;

  v4 = a3;
  -[IKViewElement unfilteredChildren](self, "unfilteredChildren");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unfilteredChildren");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[IKViewElement updateType](self, "updateType")
    || -[IKViewElement updateType](self, "updateType") == 3
    || -[IKViewElement updateType](self, "updateType") == 4)
  {
    v29 = v5;
    v7 = -[IKDiffEvaluator initWithObjects:oldObjects:hashing:]([IKDiffEvaluator alloc], "initWithObjects:oldObjects:hashing:", v5, v6, &__block_literal_global_27);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __45__IKViewElement_configureUpdatesWithElement___block_invoke_2;
    v33[3] = &unk_1E9F4D988;
    v9 = v8;
    v34 = v9;
    -[IKDiffEvaluator enumerateCommonObjectsUsingBlock:](v7, "enumerateCommonObjectsUsingBlock:", v33);
    v10 = [IKChangeSet alloc];
    -[IKDiffEvaluator addedIndexes](v7, "addedIndexes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDiffEvaluator removedIndexes](v7, "removedIndexes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDiffEvaluator movedIndexesByNewIndex](v7, "movedIndexesByNewIndex");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "count");
    if (v14)
      v15 = (void *)objc_msgSend(v9, "copy");
    else
      v15 = 0;
    v16 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v10, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", v11, v12, v13, v15);
    unfilteredChildrenChangeSet = self->_unfilteredChildrenChangeSet;
    self->_unfilteredChildrenChangeSet = v16;

    if (v14)
    v5 = v29;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v5, "valueForKey:", CFSTR("itmlID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:", v5, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __45__IKViewElement_configureUpdatesWithElement___block_invoke_3;
    v30[3] = &unk_1E9F4EF50;
    v22 = v20;
    v31 = v22;
    v23 = v21;
    v32 = v23;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v30);
    v24 = [IKChangeSet alloc];
    v25 = objc_msgSend(v23, "count");
    if (v25)
      v26 = (void *)objc_msgSend(v23, "copy");
    else
      v26 = 0;
    v27 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v24, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", 0, 0, 0, v26);
    v28 = self->_unfilteredChildrenChangeSet;
    self->_unfilteredChildrenChangeSet = v27;

    if (v25)
  }

}

id __45__IKViewElement_configureUpdatesWithElement___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  id v10;
  void *v11;

  v2 = a2;
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("itemID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v2, "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("searchResultIdentifier"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v2, "itmlID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = CFSTR("itemID_");
    v10 = v6;
  }
  else
  {
    v9 = CFSTR("ITMLID_");
    v10 = v8;
  }
  -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __45__IKViewElement_configureUpdatesWithElement___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a5;
  objc_msgSend(v16, "itmlID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itmlID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", v11))
  {
    v12 = objc_msgSend(v16, "updateType");

    if (!v12)
      goto LABEL_6;
  }
  else
  {

  }
  v13 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v14, v15);

  objc_msgSend(v16, "configureUpdatesWithElement:", v9);
LABEL_6:

}

void __45__IKViewElement_configureUpdatesWithElement___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v12 = v5;
  objc_msgSend(v5, "itmlID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

    objc_msgSend(v8, "configureUpdatesWithElement:", v12);
  }

}

- (id)applyUpdatesWithElement:(id)a3
{
  IKViewElement *v4;
  IKViewElement *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  IKViewElementStyle *style;
  void *v14;
  void *v15;
  IKViewElement *v16;
  void *v17;
  void *v18;
  IKViewElement *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  IKViewElement *v25;
  IKViewElement *v26;

  v4 = (IKViewElement *)a3;
  v5 = self;
  if (v4 && v4 != self)
  {
    v6 = -[IKViewElement updateType](v4, "updateType");
    if (v6 == 4 || (v7 = v6, (objc_msgSend((id)objc_opt_class(), "shouldParseChildDOMElements") & 1) == 0))
    {
      -[IKViewElement unfilteredChildrenChangeSet](v4, "unfilteredChildrenChangeSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updatedIndexesByNewIndex");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __41__IKViewElement_applyUpdatesWithElement___block_invoke;
      v24 = &unk_1E9F4E220;
      v16 = v4;
      v25 = v16;
      v26 = v5;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", &v21);

      if (!-[IKViewElement didUpdateAutoHighlightIdentifier](v16, "didUpdateAutoHighlightIdentifier", v21, v22, v23, v24)&& -[IKViewElement didUpdateAutoHighlightIdentifier](v5, "didUpdateAutoHighlightIdentifier"))
      {
        -[IKViewElement setDidUpdateAutoHighlightIdentifier:](v16, "setDidUpdateAutoHighlightIdentifier:", 1);
        -[IKViewElement autoHighlightIdentifier](v5, "autoHighlightIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKViewElement setAutoHighlightIdentifier:](v16, "setAutoHighlightIdentifier:", v17);

      }
      -[IKViewElement parent](v5, "parent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        -[IKViewElement setAppDocument:](v5, "setAppDocument:", 0);
      v19 = v16;

      v5 = v19;
    }
    else if ((v7 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      v8 = -[IKViewElement _updateSubtreeWithElement:](v5, "_updateSubtreeWithElement:", v4);
      -[IKViewElement dataDictionary](v5, "dataDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKViewElement dataDictionary](v4, "dataDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v10)
      {
        -[IKViewElement dataDictionary](v4, "dataDictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKViewElement setDataDictionary:](v5, "setDataDictionary:", v11);

        if (v8 <= 1)
          v8 = 1;
      }
      if (-[IKViewElement didUpdateAutoHighlightIdentifier](v4, "didUpdateAutoHighlightIdentifier"))
      {
        -[IKViewElement setDidUpdateAutoHighlightIdentifier:](v5, "setDidUpdateAutoHighlightIdentifier:", 1);
        -[IKViewElement autoHighlightIdentifier](v4, "autoHighlightIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKViewElement setAutoHighlightIdentifier:](v5, "setAutoHighlightIdentifier:", v12);

        if (v8 <= 1)
          v8 = 1;
      }
      if (v8 >= 2)
      {
        style = v5->_style;
        v5->_style = 0;

      }
      -[IKViewElement setUpdateType:](v5, "setUpdateType:", v8);
    }
  }

  return v5;
}

void __41__IKViewElement_applyUpdatesWithElement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "unfilteredChildren");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v11 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applyUpdatesWithElement:", v13);

}

- (void)updateWithActualElement:(id)a3
{
  IKDOMBindingController *v4;
  IKDOMBindingController *bindingController;
  NSString *v6;
  NSString *elementID;
  NSString *v8;
  NSString *itmlID;
  NSArray *features;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;

  v20 = a3;
  self->_isProxyElement = 0;
  objc_msgSend(v20, "bindingController");
  v4 = (IKDOMBindingController *)objc_claimAutoreleasedReturnValue();
  bindingController = self->_bindingController;
  self->_bindingController = v4;

  objc_msgSend(v20, "elementID");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  elementID = self->_elementID;
  self->_elementID = v6;

  objc_msgSend(v20, "itmlID");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  itmlID = self->_itmlID;
  self->_itmlID = v8;

  features = self->_features;
  self->_features = 0;

  -[IKViewElement unfilteredChildren](self, "unfilteredChildren");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = 0;
    do
    {
      -[IKViewElement unfilteredChildren](self, "unfilteredChildren");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "unfilteredChildren");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateWithActualElement:", v17);

      ++v13;
      -[IKViewElement unfilteredChildren](self, "unfilteredChildren");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

    }
    while (v13 < v19);
  }

}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@"), self->_elementName);
  v4 = v3;
  if (self->_disabled)
    objc_msgSend(v3, "appendString:", CFSTR(" disabled=\"true\"));
  if (self->_updateType)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" updateType=\"%@\"), v5);

  }
  -[IKViewElement style](self, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
    objc_msgSend(v4, "appendFormat:", CFSTR(" style=\"%@\"), v7);
  -[IKViewElement attributes](self, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[IKViewElement attributes](self, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __33__IKViewElement_debugDescription__block_invoke;
    v23[3] = &unk_1E9F4DCE8;
    v24 = v4;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v23);

  }
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = self->_unfilteredChildren;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "debugDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v16);

      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v13);
  }

  objc_msgSend(v4, "appendFormat:", CFSTR("</%@>"), self->_elementName);
  v17 = (void *)objc_msgSend(v4, "copy");

  return (NSString *)v17;
}

uint64_t __33__IKViewElement_debugDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(" %@=\"%@\"), a2, a3);
}

- (IKViewElementStyle)style
{
  IKViewElementStyle *style;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  IKViewElementStyle *v8;
  IKViewElementStyle *v9;

  style = self->_style;
  if (!style)
  {
    -[IKViewElement styleComposer](self, "styleComposer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKViewElement appDocument](self, "appDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "composedStyleWithMediaQueryEvaluator:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    if (v7)
      v8 = v7;
    else
      v8 = objc_alloc_init(IKViewElementStyle);
    v9 = self->_style;
    self->_style = v8;

    style = self->_style;
  }
  return style;
}

- (void)setAppDocument:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_storeWeak((id *)&self->_appDocument, a3);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[IKViewElement unfilteredChildren](self, "unfilteredChildren", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setAppDocument:", 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (IKAppDocument)appDocument
{
  IKAppDocument **p_appDocument;
  id WeakRetained;
  void *v5;
  void *v6;

  p_appDocument = &self->_appDocument;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appDocument);

  if (!WeakRetained)
  {
    -[IKViewElement parent](self, "parent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeWeak((id *)p_appDocument, v6);
  }
  return (IKAppDocument *)objc_loadWeakRetained((id *)p_appDocument);
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IKViewElement metadataDict](self, "metadataDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[IKViewElement metadataDict](self, "metadataDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && !v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKViewElement setMetadataDict:](self, "setMetadataDict:", v8);

LABEL_5:
    -[IKViewElement metadataDict](self, "metadataDict");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v13, v6);

    goto LABEL_6;
  }
  if (v13)
    goto LABEL_5;
  -[IKViewElement metadataDict](self, "metadataDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v6);

  -[IKViewElement metadataDict](self, "metadataDict");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
    -[IKViewElement setMetadataDict:](self, "setMetadataDict:", 0);
LABEL_6:

}

- (void)resetProperty:(unint64_t)a3
{
  if (a3 == 2)
  {
    -[IKViewElement setDidUpdateAutoHighlightIdentifier:](self, "setDidUpdateAutoHighlightIdentifier:", 0);
    -[IKViewElement setAutoHighlightIdentifier:](self, "setAutoHighlightIdentifier:", 0);
  }
  else if (a3 == 1)
  {
    -[IKViewElement resetUpdates](self, "resetUpdates");
  }
}

- (void)dispatchEventOfType:(unint64_t)a3 canBubble:(BOOL)a4 isCancelable:(BOOL)a5 extraInfo:(id)a6 completionBlock:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a5;
  v9 = a4;
  v18 = a6;
  v12 = a7;
  objc_msgSend((id)objc_opt_class(), "DOMEventTypeNameMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend((id)objc_opt_class(), "_eventXMLNameMap");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  -[IKViewElement dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:](self, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", v15, v17, v9, v8, v18, v12);

}

- (void)dispatchEvent:(id)a3 eventAttribute:(id)a4 canBubble:(BOOL)a5 isCancelable:(BOOL)a6 extraInfo:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  IKViewElement *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  BOOL v35;
  char v36;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("play")) & 1) == 0
    && (objc_msgSend(v14, "isEqualToString:", CFSTR("select")) & 1) == 0
    && !objc_msgSend(v14, "isEqualToString:", CFSTR("holdselect")))
  {
    v23 = 0;
LABEL_11:
    -[IKViewElement appDocument](self, "appDocument");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke;
    v27[3] = &unk_1E9F4EFF0;
    v28 = v24;
    v29 = self;
    v30 = v14;
    v33 = v17;
    v31 = v15;
    v34 = a5;
    v35 = a6;
    v32 = v16;
    v36 = v23;
    v26 = v24;
    objc_msgSend(v25, "evaluate:completionBlock:", v27, 0);

    goto LABEL_12;
  }
  -[IKViewElement activeSingularEvents](self, "activeSingularEvents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsObject:", v14);

  if (!v19)
  {
    -[IKViewElement activeSingularEvents](self, "activeSingularEvents");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKViewElement setActiveSingularEvents:](self, "setActiveSingularEvents:", v21);

    }
    -[IKViewElement activeSingularEvents](self, "activeSingularEvents");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v14);

    v23 = 1;
    goto LABEL_11;
  }
  if (v17)
    (*((void (**)(id, _QWORD, _QWORD))v17 + 2))(v17, 0, 0);
LABEL_12:

}

void __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  IKDOMEvent *v5;
  void *v6;
  IKDOMEvent *v7;
  char isKindOfClass;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  char v27;
  char v28;
  char v29;
  _QWORD v30[4];
  id v31;
  _QWORD block[4];
  IKDOMEvent *v33;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "retrieveJSElementForViewElement:jsContext:", *(_QWORD *)(a1 + 40), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [IKDOMEvent alloc];
    objc_msgSend(*(id *)(a1 + 32), "appContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[IKDOMEvent initWithAppContext:type:xmlAttribute:canBubble:isCancelable:](v5, "initWithAppContext:type:xmlAttribute:canBubble:isCancelable:", v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81));

    -[IKDOMEvent setTarget:](v7, "setTarget:", v4);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v9 = MEMORY[0x1E0C809B0];
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:", v7, v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 64);
      v30[0] = v9;
      v30[1] = 3221225472;
      v30[2] = __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_2;
      v30[3] = &unk_1E9F4EF78;
      v31 = v10;
      v12 = v10;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v30);

    }
    +[IKDOMEventDispatcher sharedInstance](IKDOMEventDispatcher, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "dispatchEvent:", v7);

    LOBYTE(v13) = -[IKDOMEvent defaultPrevented](v7, "defaultPrevented");
    objc_msgSend(*(id *)(a1 + 32), "appContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_3;
    v22[3] = &unk_1E9F4EFC8;
    v27 = *(_BYTE *)(a1 + 82);
    v16 = *(id *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    v18 = *(void **)(a1 + 48);
    v23 = v16;
    v24 = v17;
    v25 = v18;
    v26 = *(id *)(a1 + 72);
    v28 = v14;
    v29 = (char)v13;
    objc_msgSend(v15, "addPostEvaluateBlock:", v22);

    goto LABEL_9;
  }
  ITMLKitGetLogObject(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_cold_1(a1, v19);

  v20 = *(void **)(a1 + 72);
  if (v20)
  {
    dispatch_get_global_queue(0, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_102;
    block[3] = &unk_1E9F4C318;
    v33 = v20;
    dispatch_async(v21, block);

    v7 = v33;
LABEL_9:

  }
}

uint64_t __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

void __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  __int16 v11;
  _QWORD v12[5];
  id v13;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "appContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_4;
    v12[3] = &unk_1E9F4BA30;
    v6 = *(void **)(a1 + 48);
    v12[4] = *(_QWORD *)(a1 + 40);
    v13 = v6;
    objc_msgSend(v5, "evaluateDelegateBlockSync:", v12);

  }
  v7 = *(void **)(a1 + 56);
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_5;
    v9[3] = &unk_1E9F4EFA0;
    v10 = v7;
    v11 = *(_WORD *)(a1 + 65);
    dispatch_async(v8, v9);

  }
}

void __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "activeSingularEvents");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

uint64_t __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (BOOL)isProxyElement
{
  void *v3;
  char v4;

  if (self->_isProxyElement)
    return 1;
  -[IKViewElement parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProxyElement");

  return v4;
}

- (BOOL)isHidden
{
  void *v2;
  char v3;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hidden");

  return v3;
}

- (NSArray)children
{
  id *p_visibleChildren;
  NSArray *v4;
  void *v5;
  NSArray *v6;
  NSArray *visibleChildren;
  id v8;
  NSArray **p_unfilteredChildren;
  NSArray *unfilteredChildren;

  if (!+[IKViewElementStyle isHiddenStyleRegistered](IKViewElementStyle, "isHiddenStyleRegistered"))
  {
    unfilteredChildren = self->_unfilteredChildren;
    p_unfilteredChildren = &self->_unfilteredChildren;
    v8 = -[NSArray count](unfilteredChildren, "count");
    if (!v8)
      return (NSArray *)v8;
    p_visibleChildren = (id *)p_unfilteredChildren;
LABEL_9:
    v8 = *p_visibleChildren;
    return (NSArray *)v8;
  }
  p_visibleChildren = (id *)&self->_visibleChildren;
  if (!self->_visibleChildren && -[NSArray count](self->_unfilteredChildren, "count"))
  {
    v4 = self->_unfilteredChildren;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_112);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray filteredArrayUsingPredicate:](v4, "filteredArrayUsingPredicate:", v5);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    visibleChildren = self->_visibleChildren;
    self->_visibleChildren = v6;

  }
  v8 = (id)objc_msgSend(*p_visibleChildren, "count");
  if (v8)
    goto LABEL_9;
  return (NSArray *)v8;
}

uint64_t __25__IKViewElement_children__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden") ^ 1;
}

- (id)proxyElementForLoadedChildElement:(id)a3
{
  return 0;
}

- (BOOL)canProxyUnloadedChildElement:(id)a3
{
  return 0;
}

- (id)childElementWithType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[IKViewElement children](self, "children", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "elementType") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)childElementsWithType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[IKViewElement children](self, "children", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "elementType") == a3)
        {
          if (!v7)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v7, "addObject:", v10);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  if (objc_msgSend(v7, "count"))
    v11 = v7;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (id)childTextElementWithStyle:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[IKViewElement children](self, "children", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "elementType") == 138 && objc_msgSend(v9, "textStyle") == a3)
        {
          v10 = v9;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (id)childImageElementWithType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[IKViewElement children](self, "children", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "elementType") == 49 && objc_msgSend(v9, "imageType") == a3)
        {
          v10 = v9;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (void)disperseUpdateType:(unint64_t)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[IKViewElement updateType](self, "updateType") < a3)
    -[IKViewElement setUpdateType:](self, "setUpdateType:", a3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_unfilteredChildren;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "disperseUpdateType:", a3, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)setUpdateType:(unint64_t)a3
{
  self->_updateType = a3;
}

- (void)resetUpdates
{
  IKChangeSet *unfilteredChildrenChangeSet;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[IKViewElement updateType](self, "updateType"))
  {
    unfilteredChildrenChangeSet = self->_unfilteredChildrenChangeSet;
    self->_updateType = 0;
    self->_unfilteredChildrenChangeSet = 0;

    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = self->_unfilteredChildren;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "resetUpdates", (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

+ (unint64_t)evaluateElementUpdateType:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isUpdated") & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isChildrenUpdated") & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    v4 = objc_msgSend(v3, "isSubtreeUpdated");
  }

  return v4;
}

- (void)performImplicitUpdates:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(_QWORD))a3;
  -[IKViewElement appDocument](self, "appDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushTrackingImplictUpdates");

  v4[2](v4);
  -[IKViewElement appDocument](self, "appDocument");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "popTrackingImplictUpdates");

}

- (void)resetImplicitUpdates
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[IKViewElement implicitUpdateType](self, "implicitUpdateType"))
  {
    self->_implicitUpdateType = 0;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = self->_unfilteredChildren;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "resetImplicitUpdates", (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)adoptElement:(id)a3
{
  objc_msgSend(a3, "setParent:", self);
}

- (void)appDocumentDidMarkStylesDirty
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  IKChangeSet *v19;
  uint64_t v20;
  void *v21;
  IKChangeSet *v22;
  IKChangeSet *unfilteredChildrenChangeSet;
  IKChangeSet *v24;
  IKChangeSet *v25;
  unint64_t v26;
  NSArray *visibleChildren;
  IKViewElementStyle *style;
  _QWORD v29[5];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v3 = -[IKViewElement updateType](self, "updateType");
  v4 = 2;
  if (v3 > 2)
    v4 = v3;
  v35 = v4;
  -[IKViewElement styleComposer](self, "styleComposer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "requiresMediaQueryEvaluation");

  if (v6)
  {
    if (+[IKViewElementStyle isHiddenStyleRegistered](IKViewElementStyle, "isHiddenStyleRegistered"))
    {
      v7 = -[IKViewElement isHidden](self, "isHidden");
      -[IKViewElement styleComposer](self, "styleComposer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setNeedsRecomposition");

      if (v7 != -[IKViewElement isHidden](self, "isHidden"))
      {
        v9 = v33[3];
        if (v9 <= 4)
          v9 = 4;
        v33[3] = v9;
      }
    }
    else
    {
      -[IKViewElement styleComposer](self, "styleComposer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNeedsRecomposition");

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKViewElement unfilteredChildren](self, "unfilteredChildren");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __46__IKViewElement_appDocumentDidMarkStylesDirty__block_invoke;
  v29[3] = &unk_1E9F4F038;
  v29[4] = self;
  v31 = &v32;
  v13 = v11;
  v30 = v13;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v29);

  -[IKViewElement aliases](self, "aliases");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", &__block_literal_global_114);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = objc_msgSend(v13, "firstIndex"); i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v13, "indexGreaterThanIndex:", i))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, v18);

  }
  v19 = [IKChangeSet alloc];
  v20 = objc_msgSend(v15, "count");
  if (v20)
    v21 = (void *)objc_msgSend(v15, "copy");
  else
    v21 = 0;
  v22 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v19, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", 0, 0, 0, v21);
  if (v20)

  unfilteredChildrenChangeSet = self->_unfilteredChildrenChangeSet;
  if (unfilteredChildrenChangeSet)
  {
    -[IKChangeSet changeSetByConcatenatingChangeSet:](unfilteredChildrenChangeSet, "changeSetByConcatenatingChangeSet:", v22);
    v24 = (IKChangeSet *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = v22;
  }
  v25 = self->_unfilteredChildrenChangeSet;
  self->_unfilteredChildrenChangeSet = v24;

  v26 = v33[3];
  if (v26 >= 3)
  {
    visibleChildren = self->_visibleChildren;
    self->_visibleChildren = 0;

    v26 = v33[3];
  }
  if (v26 >= 2)
  {
    style = self->_style;
    self->_style = 0;

    v26 = v33[3];
  }
  -[IKViewElement setUpdateType:](self, "setUpdateType:", v26);

  _Block_object_dispose(&v32, 8);
}

void __46__IKViewElement_appDocumentDidMarkStylesDirty__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  char v7;
  int v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "unfilteredChildrenChangeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addedIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsIndex:", a3);

  if ((v7 & 1) == 0)
  {
    if (+[IKViewElementStyle isHiddenStyleRegistered](IKViewElementStyle, "isHiddenStyleRegistered"))
    {
      v8 = objc_msgSend(v15, "isHidden");
      objc_msgSend(v15, "appDocumentDidMarkStylesDirty");
      v9 = v8 == objc_msgSend(v15, "isHidden");
      v10 = v15;
      if (!v9)
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v12 = *(_QWORD *)(v11 + 24);
        if (v12 <= 3)
          v12 = 3;
        *(_QWORD *)(v11 + 24) = v12;
      }
    }
    else
    {
      objc_msgSend(v15, "appDocumentDidMarkStylesDirty");
      v10 = v15;
    }
    if (objc_msgSend(v10, "updateType"))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(_QWORD *)(v13 + 24);
      if (v14 <= 1)
        v14 = 1;
      *(_QWORD *)(v13 + 24) = v14;
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
    }
  }

}

uint64_t __46__IKViewElement_appDocumentDidMarkStylesDirty__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appDocumentDidMarkStylesDirty");
}

- (unint64_t)_updateSubtreeWithElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  uint64_t v38;
  int v39;
  _BOOL4 v40;
  IKViewElement *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  IKChangeSet *v70;
  void *v71;
  void *v72;
  void *v73;
  _BOOL4 v74;
  unint64_t v75;
  uint64_t v76;
  NSArray *unfilteredChildren;
  NSArray *visibleChildren;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  IKViewElement *v85;
  uint64_t v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  _QWORD v95[4];
  id v96;
  id v97;
  IKViewElement *v98;
  id v99;
  id v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v86 = objc_msgSend(v4, "updateType");
  v89 = v4;
  objc_msgSend(v4, "unfilteredChildrenChangeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKViewElement unfilteredChildren](self, "unfilteredChildren");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v93 = v9;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removedIndexes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v5, "removedIndexes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "firstIndex");

    while (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v93, "objectAtIndex:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[IKViewElement canProxyUnloadedChildElement:](self, "canProxyUnloadedChildElement:", v14))
        objc_msgSend(v10, "addIndex:", v13);
      objc_msgSend(v14, "setAppDocument:", 0);
      objc_msgSend(v14, "setParent:", 0);
      objc_msgSend(v5, "removedIndexes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v15, "indexGreaterThanIndex:", v13);

    }
  }
  else
  {

  }
  objc_msgSend(v5, "removedIndexes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  v18 = v17;
  v85 = self;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  objc_msgSend(v5, "movedIndexesByNewIndex");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v110, v116, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v111;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v111 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v20, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * i), "integerValue"));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v110, v116, 16);
    }
    while (v24);
  }

  objc_msgSend(v93, "removeObjectsAtIndexes:", v20);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addedIndexes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    v29 = v27;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v92 = v29;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  objc_msgSend(v5, "movedIndexesByNewIndex");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "allKeys");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v106, v115, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v107;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v107 != v35)
          objc_enumerationMutation(v32);
        objc_msgSend(v30, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * j), "integerValue"));
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v106, v115, 16);
    }
    while (v34);
  }
  v91 = v5;

  v37 = objc_msgSend(v92, "firstIndex");
  v38 = objc_msgSend(v30, "firstIndex");
  v39 = v38 != 0x7FFFFFFFFFFFFFFFLL;
  v40 = v37 != 0x7FFFFFFFFFFFFFFFLL;
  v41 = v85;
  while (v37 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_33:
    if (v40 && (v39 & 1) != 0)
    {
      if (v37 <= v38)
        goto LABEL_36;
    }
    else if ((v40 & ~v39 & 1) != 0)
    {
LABEL_36:
      objc_msgSend(v89, "unfilteredChildren");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectAtIndexedSubscript:", v37);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      -[IKViewElement proxyElementForLoadedChildElement:](v85, "proxyElementForLoadedChildElement:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v44)
      {
        objc_msgSend(v44, "updateWithActualElement:", v43);
        v46 = v45;

        objc_msgSend(v88, "addIndex:", v37);
        v43 = v46;
      }
      else
      {
        -[IKViewElement adoptElement:](v85, "adoptElement:", v43);
      }
      objc_msgSend(v93, "insertObject:atIndex:", v43, v37);
      v37 = objc_msgSend(v92, "indexGreaterThanIndex:", v37);

      goto LABEL_42;
    }
    objc_msgSend(v91, "movedIndexesByNewIndex");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v38);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", v48);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray objectAtIndexedSubscript:](v85->_unfilteredChildren, "objectAtIndexedSubscript:", objc_msgSend(v43, "integerValue"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "insertObject:atIndex:", v49, v38);

    v38 = objc_msgSend(v30, "indexGreaterThanIndex:", v38);
LABEL_42:

    v39 = v38 != 0x7FFFFFFFFFFFFFFFLL;
    v40 = v37 != 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v38 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_33;
  v50 = 0x1E0C99000uLL;
  v83 = v10;
  if (v86 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    objc_msgSend(v91, "updatedIndexesByNewIndex");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "allValues");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v103;
      do
      {
        for (k = 0; k != v55; ++k)
        {
          if (*(_QWORD *)v103 != v56)
            objc_enumerationMutation(v53);
          objc_msgSend(v51, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * k), "integerValue", v83));
        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
      }
      while (v55);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v51, "count"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v51, "firstIndex");
    if (v59 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v60 = v59;
      v61 = 0;
      do
      {
        v62 = v61 + 1;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v83);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v60);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v63, v64);

        v60 = objc_msgSend(v51, "indexGreaterThanIndex:", v60);
        v61 = v62;
      }
      while (v60 != 0x7FFFFFFFFFFFFFFFLL);
    }
    v65 = (void *)objc_msgSend(v58, "copy", v83);

    v10 = v83;
    v41 = v85;
    v50 = 0x1E0C99000;
  }
  else
  {
    v65 = 0;
  }
  objc_msgSend(*(id *)(v50 + 3592), "dictionary", v83);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "updatedIndexesByNewIndex");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 3221225472;
  v95[2] = __43__IKViewElement__updateSubtreeWithElement___block_invoke;
  v95[3] = &unk_1E9F4F0A0;
  v90 = v89;
  v96 = v90;
  v101 = v86;
  v87 = v65;
  v97 = v87;
  v98 = v41;
  v68 = v66;
  v99 = v68;
  v69 = v93;
  v100 = v69;
  objc_msgSend(v67, "enumerateKeysAndObjectsUsingBlock:", v95);

  v70 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:]([IKChangeSet alloc], "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", v88, v10, 0, v68);
  objc_msgSend(v91, "changeSetBySubtractingChangeSet:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v71, "addedIndexes");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v72, "count"))
    goto LABEL_60;
  objc_msgSend(v71, "removedIndexes");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v73, "count"))
  {

LABEL_60:
LABEL_61:
    v74 = 1;
    v75 = 3;
    goto LABEL_62;
  }
  objc_msgSend(v71, "movedIndexesByNewIndex");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(v80, "count");

  if (v94)
    goto LABEL_61;
  objc_msgSend(v71, "updatedIndexesByNewIndex");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "count");

  v74 = v82 != 0;
  v75 = v82 != 0;
LABEL_62:
  if (objc_msgSend(v69, "count"))
  {
    v76 = objc_msgSend(v69, "copy");
    unfilteredChildren = v41->_unfilteredChildren;
    v41->_unfilteredChildren = (NSArray *)v76;
  }
  else
  {
    unfilteredChildren = v41->_unfilteredChildren;
    v41->_unfilteredChildren = 0;
  }

  visibleChildren = v41->_visibleChildren;
  v41->_visibleChildren = 0;

  if (v74)
    objc_storeStrong((id *)&v41->_unfilteredChildrenChangeSet, v71);

  return v75;
}

void __43__IKViewElement__updateSubtreeWithElement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "unfilteredChildren");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 72) == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v7, "integerValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v11, "integerValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "objectAtIndexedSubscript:", objc_msgSend(v5, "integerValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applyUpdatesWithElement:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "updateType"))
    objc_msgSend(*(id *)(a1 + 48), "adoptElement:", v10);
  else
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v5, v11);
  objc_msgSend(*(id *)(a1 + 64), "replaceObjectAtIndex:withObject:", objc_msgSend(v11, "integerValue"), v10);

}

- (BOOL)_elevateToImplicitUpdateType:(unint64_t)a3
{
  unint64_t implicitUpdateType;

  implicitUpdateType = self->_implicitUpdateType;
  if (implicitUpdateType < a3)
    self->_implicitUpdateType = a3;
  return implicitUpdateType < a3;
}

+ (id)DOMEventTypeNameMap
{
  if (DOMEventTypeNameMap_onceToken != -1)
    dispatch_once(&DOMEventTypeNameMap_onceToken, &__block_literal_global_116);
  return (id)DOMEventTypeNameMap_eventTypeNameMap;
}

void __36__IKViewElement_DOMEventTypeNameMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[21];
  _QWORD v3[22];

  v3[21] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E9F8C608;
  v2[1] = &unk_1E9F8C620;
  v3[0] = CFSTR("play");
  v3[1] = CFSTR("select");
  v2[2] = &unk_1E9F8C638;
  v2[3] = &unk_1E9F8C650;
  v3[2] = CFSTR("holdselect");
  v3[3] = CFSTR("highlight");
  v2[4] = &unk_1E9F8C668;
  v2[5] = &unk_1E9F8C680;
  v3[4] = CFSTR("contextmenu");
  v3[5] = CFSTR("action");
  v2[6] = &unk_1E9F8C698;
  v2[7] = &unk_1E9F8C6B0;
  v3[6] = CFSTR("load");
  v3[7] = CFSTR("unload");
  v2[8] = &unk_1E9F8C6C8;
  v2[9] = &unk_1E9F8C6E0;
  v3[8] = CFSTR("appear");
  v3[9] = CFSTR("disappear");
  v2[10] = &unk_1E9F8C6F8;
  v2[11] = &unk_1E9F8C710;
  v3[10] = CFSTR("update");
  v3[11] = CFSTR("didupdate");
  v2[12] = &unk_1E9F8C728;
  v2[13] = &unk_1E9F8C740;
  v3[12] = CFSTR("dataavailable");
  v3[13] = CFSTR("submit");
  v2[14] = &unk_1E9F8C758;
  v2[15] = &unk_1E9F8C770;
  v3[14] = CFSTR("change");
  v3[15] = CFSTR("needsmore");
  v2[16] = &unk_1E9F8C788;
  v2[17] = &unk_1E9F8C7A0;
  v3[16] = CFSTR("needscontent");
  v3[17] = CFSTR("playersessionbegin");
  v2[18] = &unk_1E9F8C7B8;
  v2[19] = &unk_1E9F8C7D0;
  v3[18] = CFSTR("playersessionend");
  v3[19] = CFSTR("playerstatechange");
  v2[20] = &unk_1E9F8C7E8;
  v3[20] = CFSTR("finish");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 21);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)DOMEventTypeNameMap_eventTypeNameMap;
  DOMEventTypeNameMap_eventTypeNameMap = v0;

}

+ (id)_eventXMLNameMap
{
  if (_eventXMLNameMap_onceToken != -1)
    dispatch_once(&_eventXMLNameMap_onceToken, &__block_literal_global_138);
  return (id)_eventXMLNameMap_eventXMLNameMap;
}

void __33__IKViewElement__eventXMLNameMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[21];
  _QWORD v3[22];

  v3[21] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("play");
  v2[1] = CFSTR("select");
  v3[0] = CFSTR("onplay");
  v3[1] = CFSTR("onselect");
  v2[2] = CFSTR("holdselect");
  v2[3] = CFSTR("highlight");
  v3[2] = CFSTR("onholdselect");
  v3[3] = CFSTR("onhighlight");
  v2[4] = CFSTR("contextmenu");
  v2[5] = CFSTR("action");
  v3[4] = CFSTR("oncontextmenu");
  v3[5] = CFSTR("onaction");
  v2[6] = CFSTR("load");
  v2[7] = CFSTR("unload");
  v3[6] = CFSTR("onload");
  v3[7] = CFSTR("onunload");
  v2[8] = CFSTR("appear");
  v2[9] = CFSTR("disappear");
  v3[8] = CFSTR("onappear");
  v3[9] = CFSTR("ondisappear");
  v2[10] = CFSTR("update");
  v2[11] = CFSTR("didupdate");
  v3[10] = CFSTR("onupdate");
  v3[11] = CFSTR("ondidupdate");
  v2[12] = CFSTR("dataavailable");
  v2[13] = CFSTR("submit");
  v3[12] = CFSTR("ondataavailable");
  v3[13] = CFSTR("onsubmit");
  v2[14] = CFSTR("change");
  v2[15] = CFSTR("needsmore");
  v3[14] = CFSTR("onchange");
  v3[15] = CFSTR("onneedsmore");
  v2[16] = CFSTR("needscontent");
  v2[17] = CFSTR("playersessionbegin");
  v3[16] = CFSTR("onneedscontent");
  v3[17] = CFSTR("onplayersessionbegin");
  v2[18] = CFSTR("playersessionend");
  v2[19] = CFSTR("playerstatechange");
  v3[18] = CFSTR("onplayersessionend");
  v3[19] = CFSTR("onplayerstatechange");
  v2[20] = CFSTR("finish");
  v3[20] = CFSTR("onfinish");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 21);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_eventXMLNameMap_eventXMLNameMap;
  _eventXMLNameMap_eventXMLNameMap = v0;

}

- (IKViewElementStyleComposer)styleComposer
{
  return self->_styleComposer;
}

- (void)setStyleComposer:(id)a3
{
  objc_storeStrong((id *)&self->_styleComposer, a3);
}

- (BOOL)isPartOfPrototypeElement
{
  return self->_isPartOfPrototypeElement;
}

- (NSString)elementID
{
  return self->_elementID;
}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (NSString)elementName
{
  return self->_elementName;
}

- (IKViewElement)parent
{
  return (IKViewElement *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (NSArray)unfilteredChildren
{
  return self->_unfilteredChildren;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (NSString)autoHighlightIdentifier
{
  return self->_autoHighlightIdentifier;
}

- (void)setAutoHighlightIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)isImpressionable
{
  return self->_impressionable;
}

- (void)setImpressionable:(BOOL)a3
{
  self->_impressionable = a3;
}

- (NSDictionary)impressionableAttributes
{
  return self->_impressionableAttributes;
}

- (unint64_t)updateType
{
  return self->_updateType;
}

- (IKChangeSet)unfilteredChildrenChangeSet
{
  return self->_unfilteredChildrenChangeSet;
}

- (NSArray)features
{
  return self->_features;
}

- (NSDictionary)dataDictionary
{
  return self->_dataDictionary;
}

- (void)setDataDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dataDictionary, a3);
}

- (NSString)classSelector
{
  return self->_classSelector;
}

- (BOOL)didUpdateAutoHighlightIdentifier
{
  return self->_didUpdateAutoHighlightIdentifier;
}

- (void)setDidUpdateAutoHighlightIdentifier:(BOOL)a3
{
  self->_didUpdateAutoHighlightIdentifier = a3;
}

- (NSMutableDictionary)metadataDict
{
  return self->_metadataDict;
}

- (void)setMetadataDict:(id)a3
{
  objc_storeStrong((id *)&self->_metadataDict, a3);
}

- (NSMutableSet)activeSingularEvents
{
  return self->_activeSingularEvents;
}

- (void)setActiveSingularEvents:(id)a3
{
  objc_storeStrong((id *)&self->_activeSingularEvents, a3);
}

- (NSString)itmlID
{
  return self->_itmlID;
}

- (IKDataBinding)binding
{
  return self->_binding;
}

- (IKDOMBindingController)bindingController
{
  return self->_bindingController;
}

- (BOOL)areChildrenBound
{
  return self->_areChildrenBound;
}

- (BOOL)prototypesUpdated
{
  return self->_prototypesUpdated;
}

- (NSArray)aliases
{
  return self->_aliases;
}

- (unint64_t)implicitUpdateType
{
  return self->_implicitUpdateType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_bindingController, 0);
  objc_storeStrong((id *)&self->_binding, 0);
  objc_storeStrong((id *)&self->_itmlID, 0);
  objc_storeStrong((id *)&self->_activeSingularEvents, 0);
  objc_storeStrong((id *)&self->_metadataDict, 0);
  objc_storeStrong((id *)&self->_classSelector, 0);
  objc_storeStrong((id *)&self->_dataDictionary, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_unfilteredChildrenChangeSet, 0);
  objc_storeStrong((id *)&self->_impressionableAttributes, 0);
  objc_storeStrong((id *)&self->_autoHighlightIdentifier, 0);
  objc_storeStrong((id *)&self->_accessibilityText, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_elementName, 0);
  objc_storeStrong((id *)&self->_elementID, 0);
  objc_destroyWeak((id *)&self->_parentStyleableElement);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_styleComposer, 0);
  objc_destroyWeak((id *)&self->_appDocument);
  objc_storeStrong((id *)&self->_visibleChildren, 0);
  objc_storeStrong((id *)&self->_unfilteredChildren, 0);
}

- (void)initWithDOMElement:(void *)a1 parent:(uint64_t)a2 elementFactory:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "elementName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2048;
  v9 = a2;
  _os_log_debug_impl(&dword_1D95F2000, a3, OS_LOG_TYPE_DEBUG, "bound_css: applied for %@(%p)", (uint8_t *)&v6, 0x16u);

}

void __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_ERROR, "Can't dispatch event: %@ because target DOM element cannot be found", (uint8_t *)&v3, 0xCu);
}

@end
