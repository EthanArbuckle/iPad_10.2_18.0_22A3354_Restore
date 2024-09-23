@implementation IKDOMElement

- (void)domib_setAppDataSet:(id)a3
{
  objc_setAssociatedObject(self, "domib_appDataSet", a3, (void *)0x301);
}

- (id)domib_appDataSet
{
  return objc_getAssociatedObject(self, "domib_appDataSet");
}

- (void)domib_setItemsChangeSet:(id)a3
{
  objc_setAssociatedObject(self, "domib_itemsChangeSet", a3, (void *)0x301);
}

- (id)domib_itemsChangeSet
{
  return objc_getAssociatedObject(self, "domib_itemsChangeSet");
}

- (void)domib_setVisibleIndexRange:(_NSRange)a3
{
  void *v4;
  _NSRange v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &v5, "{_NSRange=QQ}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, "domib_visibleIndexRange", v4, (void *)0x301);

}

- (_NSRange)domib_visibleIndexRange
{
  void *v2;
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v5 = 0;
  v6 = 0;
  objc_getAssociatedObject(self, "domib_visibleIndexRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:", &v5);

  v3 = v5;
  v4 = v6;
  result.length = v4;
  result.location = v3;
  return result;
}

- (id)asPrivateIKJSDOMElement
{
  IKDOMElement *v3;

  if (-[IKDOMElement conformsToProtocol:](self, "conformsToProtocol:", &unk_1F01EBEB8))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (void)setAttributeValue:(id)a3 withName:(id)a4
{
  id v6;
  NSDictionary *cachedAttributes;
  _xmlNode *v8;
  xmlNode *v9;
  id v10;
  xmlNode *v11;
  void *v12;
  const xmlChar *v13;
  xmlNode *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  cachedAttributes = self->_cachedAttributes;
  self->_cachedAttributes = 0;

  v8 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v8)
  {
    v9 = v8;
    if (objc_msgSend(v6, "length"))
    {
      v10 = objc_retainAutorelease(v6);
      v11 = (xmlNode *)xmlHasProp(v9, (const xmlChar *)objc_msgSend(v10, "UTF8String"));
      +[IKDOMNode nodeForNodePtr:](IKDOMNode, "nodeForNodePtr:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        xmlUnlinkNode(v11);
        +[IKDOMNode handleNodeParentDidChange:](IKDOMNode, "handleNodeParentDidChange:", v11);
      }
      v13 = (const xmlChar *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      if (v15)
      {
        v14 = (xmlNode *)xmlSetProp(v9, v13, (const xmlChar *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
        xmlSetTreeDoc(v14, v9->doc);
      }
      else
      {
        xmlUnsetProp(v9, v13);
      }

    }
  }

}

- (NSString)tagName
{
  __CFString *v2;
  uint64_t length;
  void *v4;
  uint64_t info;
  uint64_t v6;

  v2 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v2)
  {
    if (LODWORD(v2->info) == 18)
    {
      length = v2->length;
      if (!length)
      {
        v2 = &stru_1E9F50578;
        return (NSString *)v2;
      }
      v4 = (void *)MEMORY[0x1E0CB3940];
      goto LABEL_9;
    }
    info = v2[2].info;
    if (!info || (v6 = *(_QWORD *)(info + 24)) == 0)
    {
      length = (uint64_t)v2->data;
      v4 = (void *)MEMORY[0x1E0CB3940];
LABEL_9:
      objc_msgSend(v4, "stringWithUTF8String:", length);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return (NSString *)v2;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%s"), v6, v2->data);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v2;
}

- (id)getAttribute:(id)a3
{
  id v4;
  _xmlNode *v5;
  xmlChar *Prop;
  xmlChar *v7;
  __CFString *v8;
  __CFString *v9;

  v4 = a3;
  v5 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v5)
  {
    if (objc_msgSend(v4, "length")
      && (Prop = xmlGetProp(v5, (const xmlChar *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"))) != 0)
    {
      v7 = Prop;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Prop);
      v5 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
      ((void (*)(xmlChar *))*MEMORY[0x1E0DE8D30])(v7);
    }
    else
    {
      v5 = 0;
    }
  }
  if (v5)
    v8 = (__CFString *)v5;
  else
    v8 = &stru_1E9F50578;
  v9 = v8;

  return v9;
}

- (void)setAttribute:(id)a3 :(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("autoHighlight"));
  v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("binding"));
  -[IKDOMElement _attributes](self, "_attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[IKDOMElement setAttributeValue:withName:](self, "setAttributeValue:withName:", v6, v7);
  -[IKDOMElement _markUpdatedForChangeInAttribute:fromValue:toValue:](self, "_markUpdatedForChangeInAttribute:fromValue:toValue:", v7, v12, v6);

  if (v8)
  {
    -[IKDOMNode jsNodeData](self, "jsNodeData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAutoHighlightRead:", 0);
LABEL_5:

    goto LABEL_6;
  }
  if (v9)
  {
    -[IKDOMNode jsNodeData](self, "jsNodeData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBindingParsed:", 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)removeAttribute:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "isEqualToString:", CFSTR("autoHighlight"));
  if (-[IKDOMNode nodePtr](self, "nodePtr") && objc_msgSend(v8, "length"))
  {
    -[IKDOMElement _attributes](self, "_attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKDOMElement setAttributeValue:withName:](self, "setAttributeValue:withName:", 0, v8);
    -[IKDOMElement _markUpdatedForChangeInAttribute:fromValue:toValue:](self, "_markUpdatedForChangeInAttribute:fromValue:toValue:", v8, v6, 0);
    if (v4)
    {
      -[IKDOMNode jsNodeData](self, "jsNodeData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAutoHighlightRead:", 0);

    }
  }

}

- (id)getElementsByTagName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR(".//"), "stringByAppendingString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[IKDOMNodeList nodeListWithAppContext:contextNode:xpath:](IKDOMNodeList, "nodeListWithAppContext:contextNode:xpath:", v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasAttribute:(id)a3
{
  id v4;
  _xmlNode *v5;

  v4 = a3;
  v5 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v5)
  {
    if (objc_msgSend(v4, "length"))
      LOBYTE(v5) = xmlHasProp(v5, (const xmlChar *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String")) != 0;
    else
      LOBYTE(v5) = 0;
  }

  return (char)v5;
}

- (BOOL)hasAttributes
{
  uint64_t v2;

  v2 = (uint64_t)-[IKDOMNode nodePtr](self, "nodePtr")[88];
  return v2 && *(_QWORD *)(v2 + 48) != 0;
}

- (IKDOMNamedNodeMap)attributes
{
  IKDOMNamedNodeMap *v3;
  void *v4;
  IKDOMNamedNodeMap *v5;
  _QWORD v7[5];

  v3 = [IKDOMNamedNodeMap alloc];
  -[IKJSObject appContext](self, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__IKDOMElement_attributes__block_invoke;
  v7[3] = &unk_1E9F4CE98;
  v7[4] = self;
  v5 = -[IKDOMNodeList initWithAppContext:contextNode:evaluationBlock:](v3, "initWithAppContext:contextNode:evaluationBlock:", v4, self, v7);

  return v5;
}

id __26__IKDOMElement_attributes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *i;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "nodePtr");
  if (v2)
    v3 = *(_QWORD *)(v2 + 88);
  else
    v3 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v3; v3 = *(_QWORD *)(v3 + 48))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend((id)objc_opt_class(), "_filteredAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
LABEL_7:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        if (xmlStrEqual(*(const xmlChar **)(v3 + 16), (const xmlChar *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9)), "UTF8String")))
        {
          break;
        }
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v7)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:

      objc_msgSend(*(id *)(a1 + 32), "appContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v10, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(i, "addObject:", v5);
    }

  }
  if (!objc_msgSend(i, "count"))
  {

    i = 0;
  }
  v11 = (void *)objc_msgSend(i, "copy");

  return v11;
}

- (id)childElements
{
  NSArray *cachedChildElements;
  _xmlNode *v4;
  _xmlNode *children;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;

  cachedChildElements = self->_cachedChildElements;
  if (!cachedChildElements)
  {
    v4 = -[IKDOMNode nodePtr](self, "nodePtr");
    if (v4)
      children = v4->children;
    else
      children = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    while (children)
    {
      -[IKJSObject appContext](self, "appContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v7, children);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "addObject:", v8);
      children = children->next;

    }
    v9 = (NSArray *)objc_msgSend(v6, "copy");
    v10 = self->_cachedChildElements;
    self->_cachedChildElements = v9;

    cachedChildElements = self->_cachedChildElements;
  }
  v11 = -[NSArray count](cachedChildElements, "count");
  if (v11)
    v11 = self->_cachedChildElements;
  return v11;
}

- (id)childElementByTagName:(id)a3
{
  id v4;
  _xmlNode *v5;
  _xmlNode *children;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  v5 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v5 && (children = v5->children) != 0)
  {
    while (1)
    {
      -[IKJSObject appContext](self, "appContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v7, children);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "tagName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v4);

        if ((v10 & 1) != 0)
          break;
      }
      children = children->next;

      if (!children)
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v8 = 0;
  }

  return v8;
}

- (id)childElementsByTagName:(id)a3
{
  id v4;
  _xmlNode *v5;
  _xmlNode *children;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v5)
    children = v5->children;
  else
    children = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  while (children)
  {
    -[IKJSObject appContext](self, "appContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v8, children);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "tagName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v4);

      if (v11)
        objc_msgSend(v7, "addObject:", v9);
    }
    children = children->next;

  }
  if (objc_msgSend(v7, "count"))
    v12 = v7;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (IKDOMHTMLCollection)children
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IKDOMElement;
  -[IKDOMNode children](&v3, sel_children);
  return (IKDOMHTMLCollection *)(id)objc_claimAutoreleasedReturnValue();
}

- (IKDOMElement)firstElementChild
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IKDOMElement;
  -[IKDOMNode firstElementChild](&v3, sel_firstElementChild);
  return (IKDOMElement *)(id)objc_claimAutoreleasedReturnValue();
}

- (IKDOMElement)lastElementChild
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IKDOMElement;
  -[IKDOMNode lastElementChild](&v3, sel_lastElementChild);
  return (IKDOMElement *)(id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)childElementCount
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IKDOMElement;
  return -[IKDOMNode childElementCount](&v3, sel_childElementCount);
}

- (BOOL)_isPrototypeElement
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  -[IKDOMNode parentNode](self, "parentNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[IKDOMNode parentNode](self, "parentNode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  objc_msgSend(v4, "elementName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("prototypes")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[IKDOMElement _aliasOf](self, "_aliasOf");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "_isPrototypeElement");

  }
  return v6;
}

- (BOOL)_isPartOfPrototypeElement
{
  char v3;
  void *v4;
  void *v5;

  if (-[IKDOMElement _isPrototypeElement](self, "_isPrototypeElement"))
    return 1;
  -[IKDOMNode parentNode](self, "parentNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[IKDOMNode parentNode](self, "parentNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "_isPartOfPrototypeElement");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_attributes
{
  NSDictionary *cachedAttributes;
  _xmlNode *v4;
  void *v5;
  _xmlAttr *properties;
  void (**v7)(xmlChar *);
  xmlChar *String;
  void *v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *v13;

  cachedAttributes = self->_cachedAttributes;
  if (!cachedAttributes)
  {
    v4 = -[IKDOMNode nodePtr](self, "nodePtr");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      properties = v4->properties;
      if (properties)
      {
        v7 = (void (**)(xmlChar *))MEMORY[0x1E0DE8D30];
        do
        {
          String = xmlNodeListGetString(v4->doc, properties->children, 1);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", properties->name);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "ik_sharedInstance");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", String);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v11, v10);
          (*v7)(String);

          properties = properties->next;
        }
        while (properties);
      }
    }
    v12 = (NSDictionary *)objc_msgSend(v5, "copy");
    v13 = self->_cachedAttributes;
    self->_cachedAttributes = v12;

    cachedAttributes = self->_cachedAttributes;
  }
  return cachedAttributes;
}

- (void)_markUpdatedForChangeInAttribute:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  uint64_t v12;
  IKDOMElement *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  -[IKDOMElement nodeName](self, "nodeName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[IKViewElementFactory elementClassByTagName:](IKViewElementFactory, "elementClassByTagName:", v10);

  if (!v11)
    goto LABEL_6;
  v12 = -[objc_class updateTypeForChangeInAttribute:fromValue:toValue:](v11, "updateTypeForChangeInAttribute:fromValue:toValue:", v15, v8, v9);
  if (v12)
  {
    if (v12 == 1)
    {
      v13 = self;
      v14 = 0;
      goto LABEL_8;
    }
    if (v12 == 3)
    {
      -[IKDOMElement childrenUpdatedWithUpdatedChildNodes:notify:](self, "childrenUpdatedWithUpdatedChildNodes:notify:", 0, 1);
      goto LABEL_9;
    }
LABEL_6:
    v13 = self;
    v14 = 1;
LABEL_8:
    -[IKDOMNode updatedAndMark:notify:](v13, "updatedAndMark:notify:", v14, 1);
  }
LABEL_9:

}

- (int64_t)nodeType
{
  return 1;
}

- (id)textContent
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[IKDOMNode nodePtr](self, "nodePtr"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[IKDOMNode childNodesAsArray](self, "childNodesAsArray", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v9, "nodeType") != 8 && objc_msgSend(v9, "nodeType") != 7)
          {
            objc_msgSend(v9, "textContent");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v10, "length"))
              objc_msgSend(v3, "appendString:", v10);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setTextContent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IKDOMNode nodePtr](self, "nodePtr"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[IKDOMNode childNodesAsArray](self, "childNodesAsArray", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      v7 = v6;
      if (v6)
      {
        v8 = *(_QWORD *)v17;
        v9 = v6;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v17 != v8)
              objc_enumerationMutation(v5);
            v11 = -[IKDOMNode performDOMOperation:newNode:refNode:](self, "performDOMOperation:newNode:refNode:", 2, 0, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10++));
          }
          while (v9 != v10);
          v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v9);
      }

      if (objc_msgSend(v4, "length"))
      {
        -[IKDOMNode ownerDocument](self, "ownerDocument");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "createTextNode:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[IKDOMNode performDOMOperation:newNode:refNode:](self, "performDOMOperation:newNode:refNode:", 0, v13, 0);

        if (v7)
          goto LABEL_15;
      }
      else
      {
        v13 = 0;
        if (v7)
          goto LABEL_15;
      }
      if (!v13)
      {
LABEL_18:

        goto LABEL_19;
      }
LABEL_15:
      if (v13)
      {
        v20 = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKDOMElement childrenUpdatedWithUpdatedChildNodes:notify:](self, "childrenUpdatedWithUpdatedChildNodes:notify:", v15, 1);

      }
      else
      {
        -[IKDOMElement childrenUpdatedWithUpdatedChildNodes:notify:](self, "childrenUpdatedWithUpdatedChildNodes:notify:", 0, 1);
      }
      goto LABEL_18;
    }
  }
LABEL_19:

}

- (void)childrenUpdatedWithUpdatedChildNodes:(id)a3 notify:(BOOL)a4
{
  _BOOL8 v4;
  NSArray *cachedChildElements;
  id v7;
  objc_super v8;

  v4 = a4;
  cachedChildElements = self->_cachedChildElements;
  self->_cachedChildElements = 0;
  v7 = a3;

  v8.receiver = self;
  v8.super_class = (Class)IKDOMElement;
  -[IKDOMNode childrenUpdatedWithUpdatedChildNodes:notify:](&v8, sel_childrenUpdatedWithUpdatedChildNodes_notify_, v7, v4);

}

- (IKStyleableElement)parentStyleableElement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[IKDOMNode parentNode](self, "parentNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[IKDOMNode parentNode](self, "parentNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "nodeType") == 1)
    {
      -[IKDOMNode parentNode](self, "parentNode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nodeName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("document"));

      if ((v8 & 1) == 0)
      {
        -[IKDOMNode parentNode](self, "parentNode");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        return (IKStyleableElement *)v3;
      }
    }
    else
    {

    }
    v3 = 0;
  }
  return (IKStyleableElement *)v3;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_metadataDict, "objectForKey:", a3);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableDictionary *metadataDict;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = v13;
  v8 = v6;
  metadataDict = self->_metadataDict;
  if (v13 && !metadataDict)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v11 = self->_metadataDict;
    self->_metadataDict = v10;

    v7 = v13;
    metadataDict = self->_metadataDict;
LABEL_5:
    -[NSMutableDictionary setObject:forKey:](metadataDict, "setObject:forKey:", v7, v8);
    goto LABEL_6;
  }
  if (v13)
    goto LABEL_5;
  -[NSMutableDictionary removeObjectForKey:](metadataDict, "removeObjectForKey:", v8);
  if (!-[NSMutableDictionary count](self->_metadataDict, "count"))
  {
    v12 = self->_metadataDict;
    self->_metadataDict = 0;

  }
LABEL_6:

}

+ (id)_filteredAttributes
{
  if (_filteredAttributes_onceToken != -1)
    dispatch_once(&_filteredAttributes_onceToken, &__block_literal_global_6);
  return (id)_filteredAttributes_filteredAttributes;
}

void __35__IKDOMElement__filteredAttributes__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("itmlID");
  v2[1] = CFSTR("prototypeID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_filteredAttributes_filteredAttributes;
  _filteredAttributes_filteredAttributes = v0;

}

- (IKViewElementStyleComposer)styleComposer
{
  return self->styleComposer;
}

- (void)setStyleComposer:(id)a3
{
  objc_storeStrong((id *)&self->styleComposer, a3);
}

- (IKDOMElement)_aliasOf
{
  return (IKDOMElement *)objc_loadWeakRetained((id *)&self->__aliasOf);
}

- (void)_setAliasOf:(id)a3
{
  objc_storeWeak((id *)&self->__aliasOf, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__aliasOf);
  objc_storeStrong((id *)&self->styleComposer, 0);
  objc_storeStrong((id *)&self->_cachedAttributes, 0);
  objc_storeStrong((id *)&self->_cachedChildElements, 0);
  objc_storeStrong((id *)&self->_metadataDict, 0);
}

- (void)domp_setPrototype:(id)a3
{
  objc_setAssociatedObject(self, "domp_prototype", a3, (void *)0x301);
}

- (id)domp_prototype
{
  return objc_getAssociatedObject(self, "domp_prototype");
}

- (void)domp_setDerivativeDOMElementsBySelector:(id)a3
{
  objc_setAssociatedObject(self, "domp_derivativeDOMElementsBySelector", a3, (void *)0x301);
}

- (id)domp_derivativeDOMElementsBySelector
{
  return objc_getAssociatedObject(self, "domp_derivativeDOMElementsBySelector");
}

- (NSString)innerHTML
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!-[IKDOMNode nodePtr](self, "nodePtr"))
  {
    v7 = 0;
    v3 = 0;
    goto LABEL_17;
  }
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[IKDOMNode childNodesAsArray](self, "childNodesAsArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
LABEL_4:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v4);
      if (v7)
        break;
      v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
      v16 = 0;
      objc_msgSend(v10, "toStringWithError:", &v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v16;
      objc_msgSend(v3, "appendString:", v11);

      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          goto LABEL_4;

        if (!v7)
          goto LABEL_17;
LABEL_13:
        -[IKJSObject appContext](self, "appContext");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKJSObject appContext](self, "appContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[IKDOMException exceptionWithAppContext:code:](IKDOMException, "exceptionWithAppContext:code:", v12, 11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setException:withErrorMessage:", v13, v14);

        goto LABEL_16;
      }
    }

    goto LABEL_13;
  }
  v7 = 0;
LABEL_16:

LABEL_17:
  return (NSString *)v3;
}

- (void)setInnerHTML:(id)a3
{
  id v4;
  IKDOMLSInput *v5;
  void *v6;
  IKDOMLSParser *v7;
  void *v8;
  IKDOMLSParser *v9;
  id v10;
  IKDOMLSInput *v11;

  v4 = a3;
  v5 = [IKDOMLSInput alloc];
  -[IKJSObject appContext](self, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[IKJSObject initWithAppContext:](v5, "initWithAppContext:", v6);

  -[IKDOMLSInput setStringData:](v11, "setStringData:", v4);
  v7 = [IKDOMLSParser alloc];
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IKJSObject initWithAppContext:](v7, "initWithAppContext:", v8);

  v10 = -[IKDOMLSParser parseWithContext:::](v9, "parseWithContext:::", v11, self, 2);
}

- (NSString)outerHTML
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;

  if (-[IKDOMNode nodePtr](self, "nodePtr"))
  {
    v10 = 0;
    -[IKDOMNode toStringWithError:](self, "toStringWithError:", &v10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v10;
    if (v4)
    {
      -[IKJSObject appContext](self, "appContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKJSObject appContext](self, "appContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[IKDOMException exceptionWithAppContext:code:](IKDOMException, "exceptionWithAppContext:code:", v6, 11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setException:withErrorMessage:", v7, v8);

    }
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setOuterHTML:(id)a3
{
  id v4;
  IKDOMLSInput *v5;
  void *v6;
  IKDOMLSParser *v7;
  void *v8;
  IKDOMLSParser *v9;
  id v10;
  IKDOMLSInput *v11;

  v4 = a3;
  v5 = [IKDOMLSInput alloc];
  -[IKJSObject appContext](self, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[IKJSObject initWithAppContext:](v5, "initWithAppContext:", v6);

  -[IKDOMLSInput setStringData:](v11, "setStringData:", v4);
  v7 = [IKDOMLSParser alloc];
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IKJSObject initWithAppContext:](v7, "initWithAppContext:", v8);

  v10 = -[IKDOMLSParser parseWithContext:::](v9, "parseWithContext:::", v11, self, 5);
}

- (void)insertAdjacentHTML:(id)a3 :(id)a4
{
  id v6;
  IKDOMLSInput *v7;
  void *v8;
  IKDOMLSInput *v9;
  IKDOMLSParser *v10;
  void *v11;
  IKDOMLSParser *v12;
  void *v13;
  void *v14;
  void *v15;
  IKDOMLSParser *v16;
  IKDOMLSInput *v17;
  IKDOMElement *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;

  v24 = a3;
  v6 = a4;
  v7 = [IKDOMLSInput alloc];
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IKJSObject initWithAppContext:](v7, "initWithAppContext:", v8);

  v10 = [IKDOMLSParser alloc];
  -[IKJSObject appContext](self, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IKJSObject initWithAppContext:](v10, "initWithAppContext:", v11);

  if (!objc_msgSend(v24, "compare:options:", CFSTR("beforebegin"), 1))
  {
    -[IKDOMLSInput setStringData:](v9, "setStringData:", v6);
    v16 = v12;
    v17 = v9;
    v18 = self;
    v19 = 3;
LABEL_12:
    v23 = -[IKDOMLSParser parseWithContext:::](v16, "parseWithContext:::", v17, v18, v19);
    goto LABEL_13;
  }
  if (!objc_msgSend(v24, "compare:options:", CFSTR("afterbegin"), 1))
  {
    -[IKDOMLSInput setStringData:](v9, "setStringData:", v6);
    -[IKDOMNode firstChild](self, "firstChild");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[IKDOMNode firstChild](self, "firstChild");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[IKDOMLSParser parseWithContext:::](v12, "parseWithContext:::", v9, v21, 3);

      goto LABEL_13;
    }
    goto LABEL_10;
  }
  if (!objc_msgSend(v24, "compare:options:", CFSTR("beforeend"), 1))
  {
    -[IKDOMLSInput setStringData:](v9, "setStringData:", v6);
LABEL_10:
    v16 = v12;
    v17 = v9;
    v18 = self;
    v19 = 1;
    goto LABEL_12;
  }
  if (!objc_msgSend(v24, "compare:options:", CFSTR("afterend"), 1))
  {
    -[IKDOMLSInput setStringData:](v9, "setStringData:", v6);
    v16 = v12;
    v17 = v9;
    v18 = self;
    v19 = 4;
    goto LABEL_12;
  }
  -[IKJSObject appContext](self, "appContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSObject appContext](self, "appContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKDOMException exceptionWithAppContext:code:](IKDOMException, "exceptionWithAppContext:code:", v14, 12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setException:withErrorMessage:", v15, CFSTR("Invalid position"));

LABEL_13:
}

- (id)ik_templateName
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[IKDOMElement tagName](self, "tagName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("document")))
  {
    v23 = v3;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[IKDOMElement childElements](self, "childElements");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (!v4)
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      goto LABEL_23;
    }
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v26;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (v6
          || (objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "tagName"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("head")),
              v13,
              (v14 & 1) == 0))
        {
          if (v8
            || (objc_msgSend(v12, "tagName"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("navigationBar")),
                v16,
                (v17 & 1) == 0))
          {
            if (v9
              || (objc_msgSend(v12, "tagName"),
                  v18 = (void *)objc_claimAutoreleasedReturnValue(),
                  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("toolbar")),
                  v18,
                  (v19 & 1) == 0))
            {
              v15 = v12;
              if (v7)
                continue;
            }
            else
            {
              v15 = v7;
              v9 = v12;
            }
          }
          else
          {
            v15 = v7;
            v8 = v12;
          }
        }
        else
        {
          v6 = v12;
          v15 = v7;
        }
        v20 = v12;
        v7 = v15;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (!v5)
      {
LABEL_23:

        objc_msgSend(v7, "tagName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = v23;
        goto LABEL_24;
      }
    }
  }
  v21 = 0;
LABEL_24:

  return v21;
}

- (id)ik_templateElementCSSSelectorList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DD95C0];
  -[IKDOMElement elementName](self, "elementName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safe_initWithText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DD95C8];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDOMElement elementName](self, "elementName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safe_initWithSelectors:text:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)domb_boundCSSRule
{
  return objc_getAssociatedObject(self, "domb_boundCSSRule");
}

- (void)domb_setDOMBindingController:(id)a3
{
  objc_setAssociatedObject(self, "domb_domBindingController", a3, (void *)1);
}

- (id)domb_domBindingController
{
  return objc_getAssociatedObject(self, "domb_domBindingController");
}

- (void)domb_setDataBinding:(id)a3
{
  objc_setAssociatedObject(self, "domb_dataBinding", a3, (void *)1);
}

- (id)domb_dataBinding
{
  return objc_getAssociatedObject(self, "domb_dataBinding");
}

- (void)domb_setMutationRuleSet:(id)a3
{
  objc_setAssociatedObject(self, "domb_mutationRuleSet", a3, (void *)1);
}

- (id)domb_mutationRuleSet
{
  return objc_getAssociatedObject(self, "domb_mutationRuleSet");
}

- (void)domb_setBoundCSSRule:(id)a3
{
  objc_setAssociatedObject(self, "domb_boundCSSRule", a3, (void *)1);
}

- (void)ikve_setPrototypesID:(id)a3
{
  objc_setAssociatedObject(self, "ikve_prototypesID", a3, (void *)0x301);
}

- (id)ikve_prototypesID
{
  return objc_getAssociatedObject(self, "ikve_prototypesID");
}

- (void)ikve_setRulesID:(id)a3
{
  objc_setAssociatedObject(self, "ikve_rulesID", a3, (void *)0x301);
}

- (id)ikve_rulesID
{
  return objc_getAssociatedObject(self, "ikve_rulesID");
}

- (void)dombs_setItems:(id)a3
{
  objc_setAssociatedObject(self, "dombs_items", a3, (void *)0x303);
}

- (id)dombs_items
{
  return objc_getAssociatedObject(self, "dombs_items");
}

@end
