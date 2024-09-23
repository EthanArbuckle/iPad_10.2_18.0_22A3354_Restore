@implementation ONOXMLElement

- (NSString)namespace
{
  void *v3;

  if (!self->_namespace
    && (_QWORD)-[ONOXMLElement xmlNode](self, "xmlNode")[72]
    && *(_QWORD *)((_QWORD)-[ONOXMLElement xmlNode](self, "xmlNode")[72] + 24))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)((_QWORD)-[ONOXMLElement xmlNode](self, "xmlNode")[72] + 24));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ONOXMLElement setNamespace:](self, "setNamespace:", v3);

  }
  return self->_namespace;
}

- (NSString)tag
{
  void *v3;

  if (!self->_tag && (_QWORD)-[ONOXMLElement xmlNode](self, "xmlNode")[16])
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", (_QWORD)-[ONOXMLElement xmlNode](self, "xmlNode")[16]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ONOXMLElement setTag:](self, "setTag:", v3);

  }
  return self->_tag;
}

- (unint64_t)lineNumber
{
  unint64_t result;

  result = self->_lineNumber;
  if (!result)
  {
    -[ONOXMLElement setLineNumber:](self, "setLineNumber:", xmlGetLineNo(-[ONOXMLElement xmlNode](self, "xmlNode")));
    return self->_lineNumber;
  }
  return result;
}

- (NSDictionary)attributes
{
  NSDictionary *attributes;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;

  attributes = self->_attributes;
  if (!attributes)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = (uint64_t)-[ONOXMLElement xmlNode](self, "xmlNode")[88]; i; i = *(_QWORD *)(i + 48))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)(i + 16));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ONOXMLElement valueForAttribute:](self, "valueForAttribute:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, v6);

    }
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ONOXMLElement setAttributes:](self, "setAttributes:", v8);

    attributes = self->_attributes;
  }
  return attributes;
}

- (id)valueForAttribute:(id)a3
{
  id v4;
  _xmlNode *v5;
  id v6;
  const xmlChar *v7;
  xmlChar *Prop;
  xmlChar *v9;
  void *v10;

  v4 = a3;
  v5 = -[ONOXMLElement xmlNode](self, "xmlNode");
  v6 = objc_retainAutorelease(v4);
  v7 = (const xmlChar *)objc_msgSend(v6, "UTF8String");

  Prop = xmlGetProp(v5, v7);
  if (Prop)
  {
    v9 = Prop;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Prop);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)valueForAttribute:(id)a3 inNamespace:(id)a4
{
  id v6;
  id v7;
  _xmlNode *v8;
  id v9;
  const xmlChar *v10;
  id v11;
  const xmlChar *v12;
  xmlChar *NsProp;
  xmlChar *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  v8 = -[ONOXMLElement xmlNode](self, "xmlNode");
  v9 = objc_retainAutorelease(v7);
  v10 = (const xmlChar *)objc_msgSend(v9, "UTF8String");

  v11 = objc_retainAutorelease(v6);
  v12 = (const xmlChar *)objc_msgSend(v11, "UTF8String");

  NsProp = xmlGetNsProp(v8, v10, v12);
  if (NsProp)
  {
    v14 = NsProp;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", NsProp);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v14);
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (ONOXMLElement)parent
{
  ONOXMLElement *parent;
  void *v4;
  void *v5;

  parent = self->_parent;
  if (!parent)
  {
    -[ONOXMLElement document](self, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "elementWithNode:", (_QWORD)-[ONOXMLElement xmlNode](self, "xmlNode")[40]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ONOXMLElement setParent:](self, "setParent:", v5);

    parent = self->_parent;
  }
  return parent;
}

- (NSArray)children
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, 0x7FFFFFFFFFFFFFFFLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ONOXMLElement childrenAtIndexes:](self, "childrenAtIndexes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)firstChildWithTag:(id)a3
{
  return -[ONOXMLElement firstChildWithTag:inNamespace:](self, "firstChildWithTag:inNamespace:", a3, 0);
}

- (id)firstChildWithTag:(id)a3 inNamespace:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, _BYTE *);
  void *v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __47__ONOXMLElement_firstChildWithTag_inNamespace___block_invoke;
  v17 = &unk_24F8B4570;
  v18 = v6;
  v19 = v7;
  v8 = v7;
  v9 = v6;
  -[ONOXMLElement indexesOfChildrenPassingTest:](self, "indexesOfChildrenPassingTest:", &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ONOXMLElement childrenAtIndexes:](self, "childrenAtIndexes:", v10, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)childrenWithTag:(id)a3
{
  return -[ONOXMLElement childrenWithTag:inNamespace:](self, "childrenWithTag:inNamespace:", a3, 0);
}

- (id)childrenWithTag:(id)a3 inNamespace:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __45__ONOXMLElement_childrenWithTag_inNamespace___block_invoke;
  v16 = &unk_24F8B4570;
  v17 = v6;
  v18 = v7;
  v8 = v7;
  v9 = v6;
  -[ONOXMLElement indexesOfChildrenPassingTest:](self, "indexesOfChildrenPassingTest:", &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ONOXMLElement childrenAtIndexes:](self, "childrenAtIndexes:", v10, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)childrenAtIndexes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (uint64_t)-[ONOXMLElement xmlNode](self, "xmlNode")[24];
  if (v6)
  {
    v7 = 0;
    do
    {
      if (objc_msgSend(v4, "containsIndex:", v7) && *(_DWORD *)(v6 + 8) == 1)
      {
        -[ONOXMLElement document](self, "document");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "elementWithNode:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(v5, "addObject:", v9);

      }
      ++v7;
      v6 = *(_QWORD *)(v6 + 48);
    }
    while (v6);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)indexesOfChildrenPassingTest:(id)a3
{
  unsigned int (**v4)(id, uint64_t, char *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char v10;

  v4 = (unsigned int (**)(id, uint64_t, char *))a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (uint64_t)-[ONOXMLElement xmlNode](self, "xmlNode")[24];
    v10 = 0;
    if (v6)
    {
      v7 = 0;
      do
      {
        if (v4[2](v4, v6, &v10))
          objc_msgSend(v5, "addIndex:", v7);
        v6 = *(_QWORD *)(v6 + 48);
        ++v7;
        if (v6)
          v8 = v10 == 0;
        else
          v8 = 0;
      }
      while (v8);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (ONOXMLElement)previousSibling
{
  ONOXMLElement *previousSibling;
  void *v4;
  void *v5;

  previousSibling = self->_previousSibling;
  if (!previousSibling)
  {
    -[ONOXMLElement document](self, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "elementWithNode:", (_QWORD)-[ONOXMLElement xmlNode](self, "xmlNode")[56]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ONOXMLElement setPreviousSibling:](self, "setPreviousSibling:", v5);

    previousSibling = self->_previousSibling;
  }
  return previousSibling;
}

- (ONOXMLElement)nextSibling
{
  ONOXMLElement *nextSibling;
  void *v4;
  void *v5;

  nextSibling = self->_nextSibling;
  if (!nextSibling)
  {
    -[ONOXMLElement document](self, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "elementWithNode:", (_QWORD)-[ONOXMLElement xmlNode](self, "xmlNode")[48]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ONOXMLElement setNextSibling:](self, "setNextSibling:", v5);

    nextSibling = self->_nextSibling;
  }
  return nextSibling;
}

- (BOOL)isBlank
{
  void *v2;
  BOOL v3;

  -[ONOXMLElement stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") == 0;

  return v3;
}

- (NSString)stringValue
{
  NSString *stringValue;
  xmlChar *Content;
  void *v5;

  stringValue = self->_stringValue;
  if (!stringValue)
  {
    Content = xmlNodeGetContent(-[ONOXMLElement xmlNode](self, "xmlNode"));
    if (Content)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", Content, 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ONOXMLElement setStringValue:](self, "setStringValue:", v5);

    }
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(Content);
    stringValue = self->_stringValue;
  }
  return stringValue;
}

- (NSNumber)numberValue
{
  NSNumber *numberValue;
  NSNumber *v4;
  NSNumber *v5;
  void *v6;
  void *v7;
  void *v8;

  numberValue = self->_numberValue;
  if (numberValue)
    goto LABEL_4;
  -[ONOXMLElement stringValue](self, "stringValue");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[ONOXMLElement document](self, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberFromString:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ONOXMLElement setNumberValue:](self, "setNumberValue:", v8);

    numberValue = self->_numberValue;
LABEL_4:
    v4 = numberValue;
  }
  return v4;
}

- (NSDate)dateValue
{
  NSDate *dateValue;
  NSDate *v4;
  NSDate *v5;
  void *v6;
  void *v7;
  void *v8;

  dateValue = self->_dateValue;
  if (dateValue)
    goto LABEL_4;
  -[ONOXMLElement stringValue](self, "stringValue");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[ONOXMLElement document](self, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromString:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ONOXMLElement setDateValue:](self, "setDateValue:", v8);

    dateValue = self->_dateValue;
LABEL_4:
    v4 = dateValue;
  }
  return v4;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[ONOXMLElement children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  xmlBufferPtr v3;
  void *v4;

  v3 = xmlBufferCreate();
  xmlNodeDump(v3, (xmlDocPtr)-[ONOXMLElement xmlNode](self, "xmlNode")[64], -[ONOXMLElement xmlNode](self, "xmlNode"), 0, 0);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xmlBufferContent(v3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  xmlBufferFree(v3);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ONOXMLElement *v4;
  unint64_t v5;
  BOOL v6;

  v4 = (ONOXMLElement *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[ONOXMLElement hash](self, "hash");
      v6 = v5 == -[ONOXMLElement hash](v4, "hash");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)XPath:(id)a3
{
  id v4;
  _xmlXPathObject *v5;
  _xmlXPathObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  if (v4 && (v5 = -[ONOXMLElement xmlXPathObjectPtrWithXPath:](self, "xmlXPathObjectPtrWithXPath:", v4)) != 0)
  {
    v6 = v5;
    -[ONOXMLElement document](self, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enumeratorWithXPathObject:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectEnumerator");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)functionResultByEvaluatingXPath:(id)a3
{
  _xmlXPathObject *v3;
  _xmlXPathObject *v4;
  ONOXPathFunctionResult *v5;

  v3 = -[ONOXMLElement xmlXPathObjectPtrWithXPath:](self, "xmlXPathObjectPtrWithXPath:", a3);
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init(ONOXPathFunctionResult);
    -[ONOXPathFunctionResult setXmlXPath:](v5, "setXmlXPath:", v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)enumerateElementsWithXPath:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __50__ONOXMLElement_enumerateElementsWithXPath_block___block_invoke;
    v8[3] = &unk_24F8B4548;
    v9 = v6;
    -[ONOXMLElement enumerateElementsWithXPath:usingBlock:](self, "enumerateElementsWithXPath:usingBlock:", a3, v8);

  }
}

- (void)enumerateElementsWithXPath:(id)a3 usingBlock:(id)a4
{
  void (**v6)(id, _QWORD, uint64_t, char *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD, uint64_t, char *))a4;
  if (v6)
  {
    v17 = 0;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[ONOXMLElement XPath:](self, "XPath:", a3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v14;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v7);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12), v10 + v12, &v17);
        if (v17)
          break;
        if (v9 == ++v12)
        {
          v10 += v12;
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (id)firstChildWithXPath:(id)a3
{
  void *v3;
  id v4;
  _OWORD v6[4];
  _BYTE v7[128];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  memset(v6, 0, sizeof(v6));
  -[ONOXMLElement XPath:](self, "XPath:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v6, v7, 16))
    v4 = **((id **)&v6[0] + 1);
  else
    v4 = 0;

  return v4;
}

- (id)CSS:(id)a3
{
  void *v4;
  void *v5;

  ONOXPathFromCSS(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ONOXMLElement XPath:](self, "XPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enumerateElementsWithCSS:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  if (v6)
  {
    ONOXPathFromCSS(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __48__ONOXMLElement_enumerateElementsWithCSS_block___block_invoke;
    v8[3] = &unk_24F8B4548;
    v9 = v6;
    -[ONOXMLElement enumerateElementsWithCSS:usingBlock:](self, "enumerateElementsWithCSS:usingBlock:", v7, v8);

  }
}

- (void)enumerateElementsWithCSS:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  ONOXPathFromCSS(a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ONOXMLElement enumerateElementsWithXPath:usingBlock:](self, "enumerateElementsWithXPath:usingBlock:", v7, v6);

}

- (id)firstChildWithCSS:(id)a3
{
  void *v3;
  id v4;
  _OWORD v6[4];
  _BYTE v7[128];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  memset(v6, 0, sizeof(v6));
  -[ONOXMLElement CSS:](self, "CSS:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v6, v7, 16))
    v4 = **((id **)&v6[0] + 1);
  else
    v4 = 0;

  return v4;
}

- (_xmlXPathObject)xmlXPathObjectPtrWithXPath:(id)a3
{
  id v4;
  xmlXPathContextPtr v5;
  xmlXPathContext *v6;
  _xmlNode *v7;
  _xmlNode *parent;
  _xmlNode **p_parent;
  xmlNs *nsDef;
  const xmlChar *prefix;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _xmlXPathObject *v19;

  v4 = a3;
  v5 = xmlXPathNewContext((xmlDocPtr)-[ONOXMLElement xmlNode](self, "xmlNode")[64]);
  if (!v5)
  {
    v19 = 0;
    goto LABEL_16;
  }
  v6 = v5;
  v5->node = -[ONOXMLElement xmlNode](self, "xmlNode");
  v7 = -[ONOXMLElement xmlNode](self, "xmlNode");
  p_parent = &v7->parent;
  parent = v7->parent;
  if (!parent)
    goto LABEL_14;
  do
  {
    nsDef = v7->nsDef;
    if (!nsDef)
      goto LABEL_13;
    do
    {
      prefix = nsDef->prefix;
      if (prefix)
      {
LABEL_5:
        xmlXPathRegisterNs(v6, prefix, nsDef->href);
        goto LABEL_6;
      }
      -[ONOXMLElement document](self, "document");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "defaultNamespaces");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", nsDef->href);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[ONOXMLElement document](self, "document");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "defaultNamespaces");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = objc_retainAutorelease(v17);
          prefix = (const xmlChar *)objc_msgSend(v18, "UTF8String");

          if (prefix)
            goto LABEL_5;
        }
        else
        {

        }
      }
LABEL_6:
      nsDef = nsDef->next;
    }
    while (nsDef);
    parent = *p_parent;
LABEL_13:
    v7 = parent;
    p_parent = &parent->parent;
    parent = parent->parent;
  }
  while (parent);
LABEL_14:
  v19 = (_xmlXPathObject *)MEMORY[0x22E315E0C](objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), v6);
  xmlXPathFreeContext(v6);
LABEL_16:

  return v19;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;

  -[ONOXMLElement stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "methodSignatureForSelector:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ONOXMLElement stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "invokeWithTarget:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setXmlNode:", -[ONOXMLElement xmlNode](self, "xmlNode"));
  -[ONOXMLElement document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDocument:", v5);

  return v4;
}

- (ONOXMLElement)initWithCoder:(id)a3
{
  id v4;
  ONOXMLElement *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ONOXMLElement *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ONOXMLElement;
  v5 = -[ONOXMLElement init](&v16, sel_init);
  if (v5)
  {
    NSStringFromSelector("tag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    NSStringFromSelector(sel_attributes);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    NSStringFromSelector(sel_stringValue);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    NSStringFromSelector(sel_children);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    if (v7 && v9 && v11 && v13)
    {
      -[ONOXMLElement setTag:](v5, "setTag:", v7);
      -[ONOXMLElement setAttributes:](v5, "setAttributes:", v9);
      -[ONOXMLElement setStringValue:](v5, "setStringValue:", v11);
      -[ONOXMLElement setChildren:](v5, "setChildren:", v13);
      v14 = v5;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
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
  -[ONOXMLElement tag](self, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector("tag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[ONOXMLElement attributes](self, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_attributes);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[ONOXMLElement stringValue](self, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_stringValue);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[ONOXMLElement children](self, "children");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_children);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, v11);

}

- (ONOXMLDocument)document
{
  return (ONOXMLDocument *)objc_loadWeakRetained((id *)&self->_document);
}

- (void)setDocument:(id)a3
{
  objc_storeWeak((id *)&self->_document, a3);
}

- (void)setNamespace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setLineNumber:(unint64_t)a3
{
  self->_lineNumber = a3;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (void)setParent:(id)a3
{
  objc_storeStrong((id *)&self->_parent, a3);
}

- (void)setPreviousSibling:(id)a3
{
  objc_storeStrong((id *)&self->_previousSibling, a3);
}

- (void)setNextSibling:(id)a3
{
  objc_storeStrong((id *)&self->_nextSibling, a3);
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setNumberValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setDateValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)rawXMLString
{
  return self->_rawXMLString;
}

- (void)setRawXMLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (_xmlNode)xmlNode
{
  return self->_xmlNode;
}

- (void)setXmlNode:(_xmlNode *)a3
{
  self->_xmlNode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawXMLString, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_nextSibling, 0);
  objc_storeStrong((id *)&self->_previousSibling, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_namespace, 0);
  objc_destroyWeak((id *)&self->_document);
}

uint64_t __48__ONOXMLElement_enumerateElementsWithCSS_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__ONOXMLElement_enumerateElementsWithXPath_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__ONOXMLElement_childrenWithTag_inNamespace___block_invoke(uint64_t a1, uint64_t a2)
{
  return ONOXMLNodeMatchesTagInNamespace(a2, *(void **)(a1 + 32), *(void **)(a1 + 40));
}

uint64_t __47__ONOXMLElement_firstChildWithTag_inNamespace___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = ONOXMLNodeMatchesTagInNamespace(a2, *(void **)(a1 + 32), *(void **)(a1 + 40));
  *a3 = result;
  return result;
}

@end
