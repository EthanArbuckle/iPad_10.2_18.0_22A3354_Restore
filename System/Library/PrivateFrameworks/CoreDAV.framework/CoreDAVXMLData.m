@implementation CoreDAVXMLData

- (CoreDAVXMLData)init
{
  CoreDAVXMLData *v2;
  uint64_t v3;
  CoreDAVXMLData_Impl *dataImpl;
  uint64_t v5;
  NSMutableDictionary *seenURIsToPrefixes;
  uint64_t v7;
  NSMutableDictionary *seenURIsToDepth;
  uint64_t v9;
  NSMutableArray *elementStack;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CoreDAVXMLData;
  v2 = -[CoreDAVXMLData init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    dataImpl = v2->_dataImpl;
    v2->_dataImpl = (CoreDAVXMLData_Impl *)v3;

    initializeLibXMLParser();
    v2->_dataImpl->_writer = xmlNewTextWriterDoc(&v2->_dataImpl->_doc, 0);
    xmlTextWriterStartDocument(v2->_dataImpl->_writer, cdXMLVersion, cdXMLEncoding, 0);
    v5 = objc_opt_new();
    seenURIsToPrefixes = v2->_seenURIsToPrefixes;
    v2->_seenURIsToPrefixes = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    seenURIsToDepth = v2->_seenURIsToDepth;
    v2->_seenURIsToDepth = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    elementStack = v2->_elementStack;
    v2->_elementStack = (NSMutableArray *)v9;

    -[CoreDAVXMLData setShouldAddFormattingSpaces:](v2, "setShouldAddFormattingSpaces:", 1);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  xmlFreeTextWriter(self->_dataImpl->_writer);
  xmlFreeDoc(self->_dataImpl->_doc);
  v3.receiver = self;
  v3.super_class = (Class)CoreDAVXMLData;
  -[CoreDAVXMLData dealloc](&v3, sel_dealloc);
}

- (const)_prefixForNameSpace:(const char *)a3
{
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  const char *v10;
  _BYTE *v11;
  char v12;
  NSObject *v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  uint64_t *v21;
  _QWORD block[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  if (_prefixForNameSpace__pred != -1)
    dispatch_once(&_prefixForNameSpace__pred, &__block_literal_global_3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = _prefixForNameSpace___sPrefixQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__CoreDAVXMLData__prefixForNameSpace___block_invoke_2;
  block[3] = &unk_24C1DA010;
  v24 = &v25;
  v9 = v6;
  v23 = v9;
  dispatch_sync(v8, block);
  v10 = (const char *)v26[3];
  if (!v10)
  {
    v11 = malloc_type_calloc(2uLL, 1uLL, 0x100004077774924uLL);
    v26[3] = (uint64_t)v11;
    v12 = _prefixForNameSpace__sNextPrefix++;
    *v11 = v12;
    v13 = _prefixForNameSpace___sPrefixQueue;
    v16 = v7;
    v17 = 3221225472;
    v18 = __38__CoreDAVXMLData__prefixForNameSpace___block_invoke_3;
    v19 = &unk_24C1DA038;
    v20 = v9;
    v21 = &v25;
    dispatch_sync(v13, &v16);
    if (_prefixForNameSpace__sNextPrefix >= 0x5Bu)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v16, v17, v18, v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVXMLData.m"), 78, CFSTR("Whoops- we're out of XML namespaces!"));

    }
    v10 = (const char *)v26[3];
  }

  _Block_object_dispose(&v25, 8);
  return v10;
}

void __38__CoreDAVXMLData__prefixForNameSpace___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_queue_create("com.coredav.namespacequeue", 0);
  v1 = (void *)_prefixForNameSpace___sPrefixQueue;
  _prefixForNameSpace___sPrefixQueue = (uint64_t)v0;

  v2 = objc_opt_new();
  v3 = (void *)_prefixForNameSpace___sNamespacePrefixes;
  _prefixForNameSpace___sNamespacePrefixes = v2;

}

void __38__CoreDAVXMLData__prefixForNameSpace___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend((id)_prefixForNameSpace___sNamespacePrefixes, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "pointerValue");

}

void __38__CoreDAVXMLData__prefixForNameSpace___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_prefixForNameSpace___sNamespacePrefixes, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 32));

}

- (void)_startElement:(id)a3 inNamespace:(id)a4
{
  id v6;
  const xmlChar *v7;
  id v8;
  uint64_t v9;
  const xmlChar *v10;
  void *v11;
  const xmlChar *v12;
  const char *v13;
  void *v14;
  NSMutableArray *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSMutableArray *elementStack;
  void *v26;
  int v27;
  const xmlChar *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (const xmlChar *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v8, "UTF8String");
  if (v9)
  {
    v10 = (const xmlChar *)v9;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_seenURIsToPrefixes, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (const xmlChar *)objc_msgSend(v11, "pointerValue");

    if (!v12)
    {
      v13 = -[CoreDAVXMLData _prefixForNameSpace:](self, "_prefixForNameSpace:", v10);
      if (v13)
      {
        v12 = (const xmlChar *)v13;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_seenURIsToPrefixes, "setObject:forKeyedSubscript:", v14, v8);

      }
      else
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logHandleForAccountInfoProvider:", 0);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v27 = 136315138;
          v28 = v10;
          _os_log_impl(&dword_209602000, v19, OS_LOG_TYPE_ERROR, "Unknown namespace being written %s.  This will not go well", (uint8_t *)&v27, 0xCu);
        }

        v12 = 0;
      }
    }
    v20 = -[NSMutableArray count](self->_elementStack, "count");
    -[NSMutableDictionary objectForKey:](self->_seenURIsToDepth, "objectForKey:", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_seenURIsToDepth, "objectForKeyedSubscript:", v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "integerValue");

      if (v20 > v23)
      {
        v10 = 0;
LABEL_15:
        elementStack = self->_elementStack;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v7);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](elementStack, "addObject:", v26);

        xmlTextWriterStartElementNS(self->_dataImpl->_writer, v12, v7, v10);
        goto LABEL_16;
      }
      if (v20 >= v23)
        goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_seenURIsToDepth, "setObject:forKeyedSubscript:", v24, v8);

    goto LABEL_15;
  }
  v15 = self->_elementStack;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v15, "addObject:", v16);

  xmlTextWriterStartElement(self->_dataImpl->_writer, v7);
LABEL_16:

}

- (void)_startElement:(id)a3 inNamespace:(id)a4 withAttributeNamesAndValues:(id)a5 attributes:(char *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _xmlTextWriter *writer;
  id v15;
  id *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _xmlTextWriter *v21;
  id v22;
  _xmlTextWriter *v23;
  id *v24;
  char *v25;
  id *v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25 = a6;
  -[CoreDAVXMLData _startElement:inNamespace:](self, "_startElement:inNamespace:", v10, v11);
  if (v12)
  {
    v13 = *(id *)a6;
    xmlTextWriterStartAttributeNS(self->_dataImpl->_writer, 0, (const xmlChar *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), 0);
    writer = self->_dataImpl->_writer;
    v15 = objc_retainAutorelease(v13);
    xmlTextWriterWriteString(writer, (const xmlChar *)objc_msgSend(v15, "UTF8String"));
    xmlTextWriterEndAttribute(self->_dataImpl->_writer);
    v16 = (id *)(v25 + 8);
    v26 = (id *)(v25 + 16);
    v17 = *v16;
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      do
      {
        v20 = *v26;

        v21 = self->_dataImpl->_writer;
        v22 = objc_retainAutorelease(v18);
        xmlTextWriterStartAttributeNS(v21, 0, (const xmlChar *)objc_msgSend(v22, "UTF8String"), 0);
        v23 = self->_dataImpl->_writer;
        v19 = objc_retainAutorelease(v20);
        xmlTextWriterWriteString(v23, (const xmlChar *)objc_msgSend(v19, "UTF8String"));
        xmlTextWriterEndAttribute(self->_dataImpl->_writer);
        v24 = v26 + 1;
        v26 += 2;
        v18 = *v24;

      }
      while (v18);

    }
  }

}

- (void)startElement:(id)a3 inNamespace:(id)a4 withAttributeNamesAndValues:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (self->_docHasEnded)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVXMLData.m"), 145, CFSTR("You cannot append to %@ after getting its data"), objc_opt_class());

  }
  -[CoreDAVXMLData _startElement:inNamespace:withAttributeNamesAndValues:attributes:](self, "_startElement:inNamespace:withAttributeNamesAndValues:attributes:", v9, v10, v11, &v13);

}

- (void)startElement:(id)a3 inNamespace:(id)a4 withAttributes:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  v12 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_docHasEnded)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVXMLData.m"), 153, CFSTR("You cannot append to %@ after getting its data"), objc_opt_class());

  }
  -[CoreDAVXMLData _startElement:inNamespace:](self, "_startElement:inNamespace:", v12, v9);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__CoreDAVXMLData_startElement_inNamespace_withAttributes___block_invoke;
  v13[3] = &unk_24C1D9CE8;
  v13[4] = self;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v13);

}

uint64_t __58__CoreDAVXMLData_startElement_inNamespace_withAttributes___block_invoke(uint64_t a1, id a2, void *a3)
{
  xmlTextWriter *v5;
  id v6;
  id v7;
  xmlTextWriter *v8;
  id v9;
  const xmlChar *v10;

  v5 = *(xmlTextWriter **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 8);
  v6 = objc_retainAutorelease(a2);
  v7 = a3;
  xmlTextWriterStartAttributeNS(v5, 0, (const xmlChar *)objc_msgSend(v6, "UTF8String"), 0);
  v8 = *(xmlTextWriter **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 8);
  v9 = objc_retainAutorelease(v7);
  v10 = (const xmlChar *)objc_msgSend(v9, "UTF8String");

  xmlTextWriterWriteString(v8, v10);
  return xmlTextWriterEndAttribute(*(xmlTextWriterPtr *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 8));
}

- (void)endElement:(id)a3 inNamespace:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v7 = objc_retainAutorelease(a3);
  v8 = a4;
  v9 = v7;
  v10 = objc_msgSend(v9, "UTF8String");
  v11 = objc_retainAutorelease(v8);
  v12 = objc_msgSend(v11, "UTF8String");

  if (self->_docHasEnded)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVXMLData.m"), 166, CFSTR("You cannot append to %@ after getting its data"), objc_opt_class());

  }
  if (!-[NSMutableArray count](self->_elementStack, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVXMLData.m"), 168, CFSTR("You can't end an element if there aren't any on the stack"));

  }
  -[NSMutableArray lastObject](self->_elementStack, "lastObject");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend((id)v13, "pointerValue");

  LOBYTE(v13) = objc_msgSend((id)objc_opt_class(), "string:isEqualToXmlCharString:", v9, v14);
  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVXMLData.m"), 171, CFSTR("You tried to end element %s, but the last element on the stack was %s."), v10, v14);

  }
  -[NSMutableArray removeLastObject](self->_elementStack, "removeLastObject");
  xmlTextWriterFullEndElement(self->_dataImpl->_writer);
  if (v11 && v12)
  {
    v15 = -[NSMutableArray count](self->_elementStack, "count");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_seenURIsToDepth, "objectForKey:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_seenURIsToDepth, "objectForKeyedSubscript:", v22);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "integerValue");

      if (v18 == v15)
        -[NSMutableDictionary removeObjectForKey:](self->_seenURIsToDepth, "removeObjectForKey:", v22);
    }

  }
}

- (void)appendElement:(id)a3 inNamespace:(id)a4 withStringContent:(id)a5 withAttributeNamesAndValues:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (self->_docHasEnded)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVXMLData.m"), 193, CFSTR("You cannot append to %@ after getting its data"), objc_opt_class());

  }
  -[CoreDAVXMLData _startElement:inNamespace:withAttributeNamesAndValues:attributes:](self, "_startElement:inNamespace:withAttributeNamesAndValues:attributes:", v11, v12, v14, &v16);
  if (objc_msgSend(v13, "length"))
    xmlTextWriterWriteString(self->_dataImpl->_writer, (const xmlChar *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
  -[CoreDAVXMLData endElement:inNamespace:](self, "endElement:inNamespace:", v11, v12);

}

- (void)appendElement:(id)a3 inNamespace:(id)a4 withStringContentAsCDATA:(id)a5 withAttributeNamesAndValues:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  _xmlTextWriter *writer;
  void *v21;
  id v22[2];
  uint64_t v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (self->_docHasEnded)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVXMLData.m"), 207, CFSTR("You cannot append to %@ after getting its data"), objc_opt_class());

  }
  v22[1] = &v23;
  -[CoreDAVXMLData _startElement:inNamespace:withAttributeNamesAndValues:attributes:](self, "_startElement:inNamespace:withAttributeNamesAndValues:attributes:", v11, v12, v14, &v23);
  if (objc_msgSend(v13, "length"))
  {
    if (appendElement_inNamespace_withStringContentAsCDATA_withAttributeNamesAndValues__once != -1)
      dispatch_once(&appendElement_inNamespace_withStringContentAsCDATA_withAttributeNamesAndValues__once, &__block_literal_global_21);
    if (objc_msgSend(v13, "rangeOfCharacterFromSet:", appendElement_inNamespace_withStringContentAsCDATA_withAttributeNamesAndValues__invalidXMLCharacterSet) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCharactersToBeSkipped:", appendElement_inNamespace_withStringContentAsCDATA_withAttributeNamesAndValues__invalidXMLCharacterSet);
      if ((objc_msgSend(v16, "isAtEnd") & 1) == 0)
      {
        v17 = 0;
        do
        {

          v22[0] = 0;
          v18 = objc_msgSend(v16, "scanUpToCharactersFromSet:intoString:", appendElement_inNamespace_withStringContentAsCDATA_withAttributeNamesAndValues__invalidXMLCharacterSet, v22);
          v19 = v22[0];
          v17 = v19;
          if (v18 && objc_msgSend(v19, "length"))
            objc_msgSend(v15, "appendString:", v17);
        }
        while (!objc_msgSend(v16, "isAtEnd"));

      }
    }
    writer = self->_dataImpl->_writer;
    v13 = objc_retainAutorelease(v15);
    xmlTextWriterWriteCDATA(writer, (const xmlChar *)objc_msgSend(v13, "UTF8String"));
  }
  -[CoreDAVXMLData endElement:inNamespace:](self, "endElement:inNamespace:", v11, v12);

}

void __97__CoreDAVXMLData_appendElement_inNamespace_withStringContentAsCDATA_withAttributeNamesAndValues___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithCharactersInString:", CFSTR("\t\n\r"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCharactersInRange:", 32, 55264);
  objc_msgSend(v2, "addCharactersInRange:", 57344, 8190);
  objc_msgSend(v2, "addCharactersInRange:", 0x10000, 0x100000);
  objc_msgSend(v2, "invertedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)appendElement_inNamespace_withStringContentAsCDATA_withAttributeNamesAndValues__invalidXMLCharacterSet;
  appendElement_inNamespace_withStringContentAsCDATA_withAttributeNamesAndValues__invalidXMLCharacterSet = v0;

}

- (NSData)data
{
  void *v3;
  xmlChar *v5;
  int size;

  if (!self->_docHasEnded)
  {
    self->_docHasEnded = 1;
    xmlTextWriterEndDocument(self->_dataImpl->_writer);
  }
  size = 0;
  v5 = 0;
  xmlDocDumpFormatMemory(self->_dataImpl->_doc, &v5, &size, -[CoreDAVXMLData shouldAddFormattingSpaces](self, "shouldAddFormattingSpaces", 0));
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, size);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v5);
  return (NSData *)v3;
}

+ (BOOL)string:(id)a3 isEqualToXmlCharString:(const char *)a4
{
  id v5;
  size_t v6;
  void *v7;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    if (a4)
    {
      v6 = strlen(a4);
      if (v6)
      {
        v7 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a4, v6, 4);
        LOBYTE(a4) = objc_msgSend(v5, "isEqualToString:", v7);

      }
      else
      {
        LOBYTE(a4) = 0;
      }
    }
  }
  else if (a4)
  {
    LOBYTE(a4) = *a4 == 0;
  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (BOOL)shouldAddFormattingSpaces
{
  return self->_shouldAddFormattingSpaces;
}

- (void)setShouldAddFormattingSpaces:(BOOL)a3
{
  self->_shouldAddFormattingSpaces = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementStack, 0);
  objc_storeStrong((id *)&self->_seenURIsToDepth, 0);
  objc_storeStrong((id *)&self->_seenURIsToPrefixes, 0);
  objc_storeStrong((id *)&self->_dataImpl, 0);
}

@end
