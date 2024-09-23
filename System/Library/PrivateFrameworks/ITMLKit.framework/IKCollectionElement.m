@implementation IKCollectionElement

- (id)applyUpdatesWithElement:(id)a3
{
  NSArray *sections;
  id v5;
  void *v6;
  objc_super v8;

  sections = self->_sections;
  self->_sections = 0;
  v5 = a3;

  v8.receiver = self;
  v8.super_class = (Class)IKCollectionElement;
  -[IKViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (IKHeaderElement)header
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "elementName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("header"));

        if (v9)
        {
          v10 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return (IKHeaderElement *)v10;
}

- (NSArray)sections
{
  NSArray *sections;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id *location;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  sections = self->_sections;
  if (!sections)
  {
    location = (id *)&self->_sections;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[IKViewElement children](self, "children");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v9, "elementName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("section"));

          if (v11)
          {
            if (!v6)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v6 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v6, "addObject:", v9);
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

    if (objc_msgSend(v6, "count"))
      v12 = v6;
    else
      v12 = 0;
    objc_storeStrong(location, v12);

    sections = (NSArray *)*location;
  }
  return sections;
}

- (void)appDocumentDidMarkStylesDirty
{
  NSArray *sections;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IKCollectionElement;
  -[IKViewElement appDocumentDidMarkStylesDirty](&v4, sel_appDocumentDidMarkStylesDirty);
  if (-[IKViewElement updateType](self, "updateType") >= 3)
  {
    sections = self->_sections;
    self->_sections = 0;

  }
}

+ (id)supportedFeaturesForElementName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("shelf")) & 1) != 0)
  {
    v9[0] = CFSTR("Browser");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___IKCollectionElement;
    objc_msgSendSuper2(&v8, sel_supportedFeaturesForElementName_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (IKCollectionElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  IKCollectionElement *v5;
  IKCollectionElement *v6;
  void *v7;
  uint64_t v8;
  IKAppBrowserBridge *browserBridge;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IKCollectionElement;
  v5 = -[IKViewElement initWithDOMElement:parent:elementFactory:](&v11, sel_initWithDOMElement_parent_elementFactory_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[IKViewElement features](v5, "features");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();
    browserBridge = v6->_browserBridge;
    v6->_browserBridge = (IKAppBrowserBridge *)v8;

  }
  return v6;
}

- (IKAppBrowserBridge)browserBridge
{
  return self->_browserBridge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserBridge, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
