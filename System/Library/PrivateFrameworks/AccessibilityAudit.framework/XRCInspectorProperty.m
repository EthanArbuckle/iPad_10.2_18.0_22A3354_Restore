@implementation XRCInspectorProperty

+ (void)_continueFetchingProperties:(id)a3 fetchedProperties:(id)a4 fetchedValues:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    v11 = (id)objc_opt_new();
    if (v12)
      goto LABEL_3;
  }
  v12 = (id)objc_opt_new();
LABEL_3:
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __100__XRCInspectorProperty__continueFetchingProperties_fetchedProperties_fetchedValues_completionBlock___block_invoke;
  v20[3] = &unk_25071B040;
  v14 = v11;
  v21 = v14;
  v15 = v12;
  v22 = v15;
  v25 = a1;
  v16 = v10;
  v23 = v16;
  v17 = v13;
  v24 = v17;
  v18 = (void *)MEMORY[0x23B7DF090](v20);
  objc_msgSend(v16, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v16, "removeObject:", v19);
    objc_msgSend(v19, "fetchValueWithCompletionBlock:", v18);
  }
  else
  {
    (*((void (**)(id, id, id))v17 + 2))(v17, v14, v15);
  }

}

uint64_t __100__XRCInspectorProperty__continueFetchingProperties_fetchedProperties_fetchedValues_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  if (a3)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a3;
    objc_msgSend(v5, "addObject:", a2);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  }
  return objc_msgSend(*(id *)(a1 + 64), "_continueFetchingProperties:fetchedProperties:fetchedValues:completionBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
}

+ (void)fetchValuesForProperties:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(a1, "_continueFetchingProperties:fetchedProperties:fetchedValues:completionBlock:", v7, 0, 0, v6);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)XRCInspectorProperty;
  -[XRCInspectorProperty description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[XRCInspectorProperty elementAttribute](self, "elementAttribute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[XRCInspectorProperty title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("Attribute:%@ Title:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_spacedStringFromCamelCase:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_opt_new();
  v6 = (void *)v5;
  if (v4 >= 1)
  {
    v26 = (void *)v5;
    v7 = 0;
    v8 = 1;
    v9 = -1;
    do
    {
      v10 = objc_msgSend(v3, "characterAtIndex:", v7);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "rangeOfCharacterFromSet:", v12);

      v14 = (v13 == 0x7FFFFFFFFFFFFFFFLL) | v8;
      if (v13 != 0x7FFFFFFFFFFFFFFFLL && (v8 & 1) != 0)
      {
        if (v9 != -1)
        {
          objc_msgSend(v3, "substringWithRange:", v9, v7 - v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v15);

        }
        v14 = 0;
        v9 = v7;
      }

      ++v7;
      v8 = v14;
    }
    while (v4 != v7);
    v6 = v26;
    if (v9 != -1)
    {
      objc_msgSend(v3, "substringWithRange:", v9, objc_msgSend(v3, "length") - v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v16);

    }
  }
  v17 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = v6;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v17, "length"))
        {
          objc_msgSend(v17, "appendString:", CFSTR(" "));
          objc_msgSend(v23, "lowercaseString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "appendString:", v24);

        }
        else
        {
          objc_msgSend(v17, "appendString:", v23);
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v20);
  }

  return v17;
}

- (id)_OSXConstantsToSelectorsDict
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("OSX-ConstantsToSelectors"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_OSXSelectorForAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[XRCInspectorProperty _OSXConstantsToSelectorsDict](self, "_OSXConstantsToSelectorsDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("actions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("cocoa_protocol_selector"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_OSXSelectorForAttribute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[XRCInspectorProperty _OSXConstantsToSelectorsDict](self, "_OSXConstantsToSelectorsDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("attributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("cocoa_protocol_selector"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[XRCInspectorProperty elementAttribute](self, "elementAttribute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "humanReadableName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)fetchValueWithCompletionBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[XRCInspectorProperty delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchValueForProperty:completionBlock:", self, v4);

}

- (void)setNewValue:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[XRCInspectorProperty delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateProperty:withNewValue:", self, v5);

  -[XRCInspectorProperty setValue:](self, "setValue:", v5);
}

- (void)performAction
{
  id v3;

  -[XRCInspectorProperty delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performAction:", self);

}

- (void)previewElement:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[XRCInspectorProperty delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewOnElement:", v4);

}

- (void)focusOnElement:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[XRCInspectorProperty delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusOnElement:", v4);

}

- (BOOL)showElementClassName
{
  void *v2;
  char v3;

  -[XRCInspectorProperty delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showElementClassName");

  return v3;
}

- (BOOL)showIgnoredElements
{
  void *v2;
  char v3;

  -[XRCInspectorProperty delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showIgnoredElements");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  XRCInspectorProperty *v4;
  XRCInspectorProperty *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (XRCInspectorProperty *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[XRCInspectorProperty elementAttribute](v5, "elementAttribute");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[XRCInspectorProperty elementAttribute](self, "elementAttribute");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[XRCInspectorProperty element](v5, "element");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[XRCInspectorProperty element](self, "element");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (AXAuditElementAttribute)elementAttribute
{
  return self->_elementAttribute;
}

- (void)setElementAttribute:(id)a3
{
  objc_storeStrong((id *)&self->_elementAttribute, a3);
}

- (AXAuditElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
  objc_storeStrong((id *)&self->_element, a3);
}

- (XRCInspectorPropertyDelegate)delegate
{
  return (XRCInspectorPropertyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)valueKnown
{
  return self->_valueKnown;
}

- (void)setValueKnown:(BOOL)a3
{
  self->_valueKnown = a3;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (id)valueForDisplayOverride
{
  return self->_valueForDisplayOverride;
}

- (void)setValueForDisplayOverride:(id)a3
{
  objc_storeStrong(&self->_valueForDisplayOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueForDisplayOverride, 0);
  objc_storeStrong(&self->_value, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_element, 0);
  objc_storeStrong((id *)&self->_elementAttribute, 0);
}

@end
