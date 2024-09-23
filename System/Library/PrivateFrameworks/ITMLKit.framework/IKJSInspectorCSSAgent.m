@implementation IKJSInspectorCSSAgent

- (IKJSInspectorCSSAgent)initWithInspectorController:(id)a3
{
  id v4;
  IKJSInspectorCSSAgent *v5;
  uint64_t v6;
  NSMutableDictionary *inlineStyleMap;
  uint64_t v8;
  NSMapTable *authorStylesheets;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKJSInspectorCSSAgent;
  v5 = -[IKJSInspectorCSSAgent init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    inlineStyleMap = v5->_inlineStyleMap;
    v5->_inlineStyleMap = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    authorStylesheets = v5->_authorStylesheets;
    v5->_authorStylesheets = (NSMapTable *)v8;

    objc_storeWeak((id *)&v5->_controller, v4);
  }

  return v5;
}

- (void)updateStylesheets
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_2(&dword_1D95F2000, a2, a3, "Unable to parse style nodes: %@", (uint8_t *)&v3);
}

- (void)mediaQueryResultDidChange
{
  OUTLINED_FUNCTION_12(&dword_1D95F2000, a1, a3, "Media Query Result Changed", a5, a6, a7, a8, 0);
}

- (void)resetStylesFromNode:(id)a3
{
  id v4;
  NSMutableDictionary *inlineStyleMap;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "setStyleComposer:", 0);
    inlineStyleMap = self->_inlineStyleMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "ITMLID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](inlineStyleMap, "removeObjectForKey:", v6);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v4, "childNodesAsArray", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[IKJSInspectorCSSAgent resetStylesFromNode:](self, "resetStylesFromNode:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4
{
  void (**v4)(id, const __CFString *);
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (void (**)(id, const __CFString *))a3;
  ITMLKitGetLogObject(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[IKJSInspectorCSSAgent disableWithErrorCallback:successCallback:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  v4[2](v4, CFSTR("unsupported"));
}

- (void)getMatchedStylesForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 includePseudo:(BOOL *)a6 includeInherited:(BOOL *)a7
{
  id v10;
  void (**v11)(id, id *, id *, id *);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void (**v29)(id, id *, id *, id *);
  id v30;
  id v31;
  id v32;
  id v33;

  v10 = a3;
  v11 = (void (**)(id, id *, id *, id *))a4;
  if (!self->_styleFactory)
    -[IKJSInspectorCSSAgent updateStylesheets](self, "updateStylesheets");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSInspectorCSSAgent controller](self, "controller");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "nodeById:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[IKJSInspectorCSSAgent _getMatchedStyleRulesForNode:](self, "_getMatchedStyleRulesForNode:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v16);

    -[IKJSInspectorCSSAgent _getMatchedTemplateStylesForNode:](self, "_getMatchedTemplateStylesForNode:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v17);

    v18 = v15;
    objc_msgSend(v18, "parentStyleableElement");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v29 = v11;
    v30 = v10;
    v28 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "parentStyleableElement", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        do
        {
          -[IKJSInspectorCSSAgent _getMatchedStyleRulesForNode:](self, "_getMatchedStyleRulesForNode:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DD9588], "safe_initWithMatchedCSSRules:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v22);
          objc_msgSend(v20, "parentStyleableElement");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v20, "parentStyleableElement");
            v24 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v24 = 0;
          }

          v20 = (void *)v24;
        }
        while (v24);
      }
    }
    else
    {

    }
    v11 = v29;
    v10 = v30;
  }
  v33 = v13;
  v31 = v12;
  v32 = (id)MEMORY[0x1E0C9AA60];
  v11[2](v11, &v33, &v32, &v31);
  v25 = v33;

  v26 = v32;
  v27 = v31;

}

- (void)getInlineStylesForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  uint64_t v5;
  void (**v7)(id, id *, _QWORD);
  void *v8;
  id v9;
  id v10;

  v5 = *(_QWORD *)&a5;
  v7 = (void (**)(id, id *, _QWORD))a4;
  -[IKJSInspectorCSSAgent _updatedInlineStyleForNode:withStyleString:](self, "_updatedInlineStyleForNode:withStyleString:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v7[2](v7, &v10, 0);

  v9 = v10;
}

- (void)getComputedStyleForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void (**v32)(id, void *);
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a4;
  if (!self->_styleFactory)
    -[IKJSInspectorCSSAgent updateStylesheets](self, "updateStylesheets");
  -[IKJSInspectorCSSAgent controller](self, "controller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nodeById:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = v9;
    v33 = v8;
    objc_msgSend(v11, "getAttribute:", CFSTR("style"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getAttribute:", CFSTR("class"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)v12;
    +[IKViewElementStyle elementStyleWithSelector:inlineStyleString:filterBlockedStyles:](IKViewElementStyle, "elementStyleWithSelector:inlineStyleString:filterBlockedStyles:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKViewElementStyleFactory styleComposerForElement:elementStyleOverrides:](self->_styleFactory, "styleComposerForElement:elementStyleOverrides:", v11);
    v13 = objc_claimAutoreleasedReturnValue();
    -[IKJSInspectorCSSAgent controller](self, "controller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)v13;
    objc_msgSend(v14, "styleFromComposer:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v15;
    objc_msgSend(v15, "styleDict");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v16, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v36 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v16, "valueForKey:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = (void *)MEMORY[0x1E0DD9568];
            objc_msgSend(v23, "stringValue");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "safe_initWithName:value:", v22, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v34, "addObject:", v26);
          }

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v19);
    }

    v9 = v32;
    v8 = v33;
  }
  v9[2](v9, v34);

}

- (void)getAllStyleSheetsWithErrorCallback:(id)a3 successCallback:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (!self->_styleFactory)
    -[IKJSInspectorCSSAgent updateStylesheets](self, "updateStylesheets");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (self->_templateStylesheetHeader)
    objc_msgSend(v8, "addObject:");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMapTable keyEnumerator](self->_authorStylesheets, "keyEnumerator", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "addObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

  v7[2](v7, v9);
}

- (void)getStyleSheetWithErrorCallback:(id)a3 successCallback:(id)a4 styleSheetId:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  void (**v10)(id, const __CFString *);

  v10 = (void (**)(id, const __CFString *))a3;
  v8 = (void (**)(id, void *))a4;
  -[IKJSInspectorCSSAgent _stylesheetBodyForStylesheetId:](self, "_stylesheetBodyForStylesheetId:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v8[2](v8, v9);
  else
    v10[2](v10, CFSTR("Unable to find stylesheet"));

}

- (void)getStyleSheetTextWithErrorCallback:(id)a3 successCallback:(id)a4 styleSheetId:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(id, const __CFString *);

  v12 = (void (**)(id, const __CFString *))a3;
  v8 = (void (**)(id, void *))a4;
  -[IKJSInspectorCSSAgent _stylesheetBodyForStylesheetId:](self, "_stylesheetBodyForStylesheetId:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v11);

  }
  else
  {
    v12[2](v12, CFSTR("Unable to find stylesheet"));
  }

}

- (void)setStyleSheetTextWithErrorCallback:(id)a3 successCallback:(id)a4 styleSheetId:(id)a5 text:(id)a6
{
  void (**v10)(_QWORD);
  id v11;
  void *v12;
  void *v13;
  void (**v14)(id, const __CFString *);

  v14 = (void (**)(id, const __CFString *))a3;
  v10 = (void (**)(_QWORD))a4;
  v11 = a6;
  -[IKJSInspectorCSSAgent _styleNodeForStylesheetId:](self, "_styleNodeForStylesheetId:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "setTextContent:", v11);
    v10[2](v10);
  }
  else
  {
    v14[2](v14, CFSTR("Unable to find stylesheet"));
  }

}

- (void)setStyleTextWithErrorCallback:(id)a3 successCallback:(id)a4 styleId:(id)a5 text:(id)a6
{
  void (**v10)(id, void *);
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void (**v49)(id, const __CFString *);

  v49 = (void (**)(id, const __CFString *))a3;
  v10 = (void (**)(id, void *))a4;
  v11 = a6;
  v12 = a5;
  objc_msgSend(v12, "styleSheetId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v13, "isEqualToString:", CFSTR("inline")))
  {
    -[IKJSInspectorCSSAgent _stylesheetBodyForStylesheetId:](self, "_stylesheetBodyForStylesheetId:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v12, "ordinal");

    if (v18)
    {
      objc_msgSend(v18, "rules");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

      if ((v24 & 0x80000000) == 0 && v26 > (int)v24)
      {
        objc_msgSend(v18, "rules");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v24;
        objc_msgSend(v27, "objectAtIndex:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v48 = v28;
        objc_msgSend(v28, "style");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "range");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "ik_textNewLineIndexSet");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "ik_rangeWithNewLineIndexSet:", v31);
        v34 = v33;

        -[IKJSInspectorCSSAgent _styleNodeForStylesheetId:](self, "_styleNodeForStylesheetId:", v13);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v35 && v32 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v35, "textContent");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)objc_msgSend(v37, "mutableCopy");

          objc_msgSend(v46, "replaceCharactersInRange:withString:", v32, v34, v15);
          objc_msgSend(v36, "setTextContent:", v46);
          -[IKJSInspectorCSSAgent updateStylesheets](self, "updateStylesheets");
          objc_msgSend(v18, "rules");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectAtIndex:", v47);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          -[IKJSInspectorCSSAgent controller](self, "controller");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "inspector");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "configuration");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "cssEventDispatcher");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "styleSheetId");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "safe_styleSheetChangedWithStyleSheetId:", v44);

          objc_msgSend(v39, "style");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v10[2](v10, v45);

          goto LABEL_10;
        }

      }
    }
LABEL_12:

    v49[2](v49, CFSTR("Unable to find stylesheet"));
    goto LABEL_13;
  }
  -[IKJSInspectorCSSAgent controller](self, "controller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v12, "ordinal");

  objc_msgSend(v16, "nodeById:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  -[IKJSInspectorCSSAgent _updatedInlineStyleForNode:withStyleString:](self, "_updatedInlineStyleForNode:withStyleString:", objc_msgSend(v18, "ITMLID"), v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAttribute::", CFSTR("style"), v15);
  -[IKJSInspectorCSSAgent controller](self, "controller");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "inspector");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "configuration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "domEventDispatcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "safe_attributeModifiedWithNodeId:name:value:", objc_msgSend(v18, "ITMLID"), CFSTR("style"), v15);
  v10[2](v10, v19);

LABEL_10:
LABEL_13:

}

- (void)getSupportedCSSPropertiesWithErrorCallback:(id)a3 successCallback:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(id, void *);
  id obj;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = (void (**)(id, void *))a4;
  +[IKViewElementStyle registeredStyles](IKViewElementStyle, "registeredStyles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = v4;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v17 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        +[IKViewElementStyle propertiesForStyleName:](IKViewElementStyle, "propertiesForStyleName:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("IKViewElementStyleAliasesKey"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("IKViewElementStyleLonghandKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DD9598], "safe_initWithName:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("IKViewElementStyleInheritedKey"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setInherited:", objc_msgSend(v13, "BOOLValue"));

        if (v10)
          objc_msgSend(v12, "setAliases:", v10);
        if (v11)
          objc_msgSend(v12, "setLonghands:", v11);
        objc_msgSend(v18, "addObject:", v12);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v15[2](v15, v18);
}

- (id)_styleNodeForStylesheetId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IKJSInspectorCSSAgent controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nodesForXPath:error:", CFSTR("/document/head/style"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(v12, "ITMLID", (_QWORD)v15);
        if (v13 == objc_msgSend(v4, "integerValue"))
        {
          v9 = v12;
          goto LABEL_11;
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)_stylesheetBodyForStylesheetId:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMapTable keyEnumerator](self->_authorStylesheets, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "styleSheetId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          -[NSMapTable objectForKey:](self->_authorStylesheets, "objectForKey:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)_updatedInlineStyleForNode:(int)a3 withStyleString:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  NSMutableDictionary *inlineStyleMap;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSMutableDictionary *v26;
  void *v27;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[IKJSInspectorCSSAgent controller](self, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nodeById:", (int)v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  inlineStyleMap = self->_inlineStyleMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](inlineStyleMap, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DD95E0], "ik_cssStyleFromDeclarationList:forStyleMarkup:withNewLineIndexSet:existingStyle:", 0, 0, 0, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DD95F0], "safe_initWithStyleSheetId:ordinal:", CFSTR("inline"), objc_msgSend(v8, "ITMLID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setStyleId:", v15);

    objc_msgSend(MEMORY[0x1E0DD95D8], "ik_emptySourceRange");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRange:", v16);

    if (objc_msgSend(v6, "length"))
    {
      v17 = v6;
    }
    else
    {
      objc_msgSend(v8, "getAttribute:", CFSTR("style"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
    objc_msgSend(MEMORY[0x1E0DD95D8], "ik_newLineIndexSetForStyleMarkup:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 && (objc_msgSend(v18, "isEqualToString:", &stru_1E9F50578) & 1) == 0)
    {
      objc_msgSend(v8, "nodeName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[IKViewElementStyle elementStyleWithSelector:inlineStyleString:filterBlockedStyles:inlineStyleRangeCorrect:](IKViewElementStyle, "elementStyleWithSelector:inlineStyleString:filterBlockedStyles:inlineStyleRangeCorrect:", v20, v18, 0, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0DD95E0];
      objc_msgSend(v21, "cssRule");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "declarationList");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "ik_cssStyleFromDeclarationList:forStyleMarkup:withNewLineIndexSet:existingStyle:", v24, v18, v19, v14);
      v25 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v25;
    }

  }
  v26 = self->_inlineStyleMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "ITMLID"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v14, v27);

  return v14;
}

- (id)_getMatchedTemplateStylesForNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  id v27;
  unsigned int v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id location;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[IKViewElementStyleFactory styleComposerForElement:elementStyleOverrides:](self->_styleFactory, "styleComposerForElement:elementStyleOverrides:", v4, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v38 = 0u;
    v39 = 0u;
    v37 = 0u;
    objc_msgSend(v26, "consolidatedDefaultStyleList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v38 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v10, "styles");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v10, "styles");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObjectsFromArray:", v12);

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ik_templateElementCSSSelectorList");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      -[IKJSInspectorCSSAgent controller](self, "controller");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __58__IKJSInspectorCSSAgent__getMatchedTemplateStylesForNode___block_invoke;
      v29[3] = &unk_1E9F4E328;
      objc_copyWeak(&v35, &location);
      v30 = v5;
      v18 = v16;
      v31 = v18;
      v19 = v13;
      v32 = v19;
      v20 = v14;
      v33 = v20;
      v21 = v15;
      v34 = v21;
      objc_msgSend(v17, "evaluateMediaQuery:", v29);

      v28 = 0;
      __58__IKJSInspectorCSSAgent__getMatchedTemplateStylesForNode___block_invoke_38(v22, v20, &v28);
      __58__IKJSInspectorCSSAgent__getMatchedTemplateStylesForNode___block_invoke_38(v23, v21, &v28);
      __58__IKJSInspectorCSSAgent__getMatchedTemplateStylesForNode___block_invoke_38(v24, v19, &v28);
      objc_msgSend(v27, "addObjectsFromArray:", v20);
      objc_msgSend(v27, "addObjectsFromArray:", v21);
      objc_msgSend(v27, "addObjectsFromArray:", v19);

      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);

    }
  }

  return v27;
}

void __58__IKJSInspectorCSSAgent__getMatchedTemplateStylesForNode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    obj = *(id *)(a1 + 32);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "cssRule");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DD95A8], "ik_cssRuleForRule:withOrdinal:forStyleSheetHeader:forStyleMarkup:withNewLineIndexSet:", v9, 0, WeakRetained[2], 0, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setSelectorList:", *(_QWORD *)(a1 + 40));
          objc_msgSend(v10, "ik_ruleMatchForClassSelectors:andIdSelector:", 0, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setMatchingSelectors:", &unk_1E9F8C3B0);
          objc_msgSend((id)objc_opt_class(), "_evaluator:updateMediaStylesWithActiveStyles:inActiveStyles:defaultStyles:forRule:withMatch:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v9, v11);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
}

void __58__IKJSInspectorCSSAgent__getMatchedTemplateStylesForNode___block_invoke_38(uint64_t a1, void *a2, unsigned int *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
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
        objc_msgSend(v9, "rule");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "style");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "styleId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setOrdinal:", *a3);

        objc_msgSend(v9, "rule");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ruleId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setOrdinal:", *a3);

        ++*a3;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (id)_getMatchedStyleRulesForNode:(id)a3
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
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && -[NSMapTable count](self->_authorStylesheets, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "getAttribute:", CFSTR("class"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "getAttribute:", CFSTR("id"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    objc_initWeak(&location, self);
    -[IKJSInspectorCSSAgent controller](self, "controller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __54__IKJSInspectorCSSAgent__getMatchedStyleRulesForNode___block_invoke;
    v20[3] = &unk_1E9F4E328;
    objc_copyWeak(&v26, &location);
    v14 = v9;
    v21 = v14;
    v15 = v12;
    v22 = v15;
    v16 = v6;
    v23 = v16;
    v17 = v7;
    v24 = v17;
    v18 = v8;
    v25 = v18;
    objc_msgSend(v13, "evaluateMediaQuery:", v20);

    objc_msgSend(v5, "addObjectsFromArray:", v17);
    objc_msgSend(v5, "addObjectsFromArray:", v18);
    objc_msgSend(v5, "addObjectsFromArray:", v16);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  return v5;
}

void __54__IKJSInspectorCSSAgent__getMatchedStyleRulesForNode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  uint64_t i;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(WeakRetained[4], "objectEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v16)
    {
      v15 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v7, "rules");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "count"))
          {
            v9 = 0;
            do
            {
              objc_msgSend(v8, "objectAtIndex:", v9);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "ik_ruleMatchForClassSelectors:andIdSelector:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v7, "ik_ruleList");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "ruleAtIndex:", v9);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend((id)objc_opt_class(), "_evaluator:updateMediaStylesWithActiveStyles:inActiveStyles:defaultStyles:forRule:withMatch:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v13, v11);
              ++v9;
            }
            while (v9 < objc_msgSend(v8, "count"));
          }

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v16);
    }

  }
}

+ (void)_evaluator:(id)a3 updateMediaStylesWithActiveStyles:(id)a4 inActiveStyles:(id)a5 defaultStyles:(id)a6 forRule:(id)a7 withMatch:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v18, "matchingSelectors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "mediaQuery");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[IKStyleMediaQuery mediaQueryListWithCSSMediaQuery:](IKStyleMediaQuery, "mediaQueryListWithCSSMediaQuery:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v13, "evaluateStyleMediaQueryList:", v22);

      if (v23)
      {
        v24 = v14;
      }
      else
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v18, "rule", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "style");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "cssProperties");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v33;
          do
          {
            v31 = 0;
            do
            {
              if (*(_QWORD *)v33 != v30)
                objc_enumerationMutation(v27);
              objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v31++), "setStatus:", 2);
            }
            while (v29 != v31);
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          }
          while (v29);
        }

        v24 = v15;
      }
    }
    else
    {
      v24 = v16;
    }
    objc_msgSend(v24, "addObject:", v18);
  }

}

- (IKJSInspectorController)controller
{
  return (IKJSInspectorController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_authorStylesheets, 0);
  objc_storeStrong((id *)&self->_styleFactory, 0);
  objc_storeStrong((id *)&self->_templateStylesheetHeader, 0);
  objc_storeStrong((id *)&self->_inlineStyleMap, 0);
}

- (void)disableWithErrorCallback:(uint64_t)a3 successCallback:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_1D95F2000, a1, a3, "disableWithErrorCallback", a5, a6, a7, a8, 0);
}

@end
