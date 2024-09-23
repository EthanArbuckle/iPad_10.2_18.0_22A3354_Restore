@implementation _HKXMLTranslator

- (_HKXMLTranslator)initWithXSL:(id)a3 localizationTableName:(id)a4 localizationOverride:(id)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  _HKXMLTranslator *v11;
  _HKXMLTranslator *v12;
  id v13;
  id v14;
  xmlDoc *Memory;
  xmlDoc *v16;
  xsltStylesheetPtr v17;
  objc_super v19;

  v8 = a3;
  v9 = (unint64_t)a4;
  v10 = (unint64_t)a5;
  v19.receiver = self;
  v19.super_class = (Class)_HKXMLTranslator;
  v11 = -[_HKXMLTranslator init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    if (v9 | v10)
    {
      -[_HKXMLTranslator _localizeXSL:localizationTableName:localizationOverride:](v11, "_localizeXSL:localizationTableName:localizationOverride:", v8, v9, v10);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = v8;
    }
    v14 = objc_retainAutorelease(v13);
    Memory = xmlReadMemory((const char *)objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), 0, 0, 0);
    if (Memory)
    {
      v16 = Memory;
      v17 = xsltParseStylesheetDoc(Memory);
      v12->_stylesheet = v17;
      if (!v17)
        xmlFreeDoc(v16);
    }
    else
    {
      v12->_stylesheet = 0;

      v12 = 0;
    }

  }
  return v12;
}

- (void)dealloc
{
  _xsltStylesheet *stylesheet;
  objc_super v4;

  stylesheet = self->_stylesheet;
  if (stylesheet)
  {
    xsltFreeStylesheet(stylesheet);
    self->_stylesheet = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_HKXMLTranslator;
  -[_HKXMLTranslator dealloc](&v4, sel_dealloc);
}

- (id)convertToHTMLFromXML:(id)a3
{
  id v4;
  const char *v5;
  int v6;
  xmlDoc *Memory;
  xmlDoc *v8;
  xmlDoc *v9;
  xmlDoc *v10;
  id v11;
  void *v12;
  int size;
  xmlChar *mem;

  v4 = objc_retainAutorelease(a3);
  v5 = (const char *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  Memory = xmlReadMemory(v5, v6, "content.xml", 0, 0);
  if (!Memory)
    return 0;
  v8 = Memory;
  v9 = xsltApplyStylesheet(self->_stylesheet, Memory, 0);
  if (v9)
  {
    v10 = v9;
    mem = 0;
    size = 0;
    xmlDocDumpFormatMemory(v9, &mem, &size, 1);
    if (mem)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3940]);
      v12 = (void *)objc_msgSend(v11, "initWithBytes:length:encoding:", mem, size, 5);
      ((void (*)(xmlChar *))*MEMORY[0x1E0DE8D30])(mem);
    }
    else
    {
      v12 = 0;
    }
    xmlFreeDoc(v10);
  }
  else
  {
    v12 = 0;
  }
  xmlFreeDoc(v8);
  return v12;
}

- (id)_localizeXSL:(id)a3 localizationTableName:(id)a4 localizationOverride:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;

  v7 = a3;
  v36 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("@@"), "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v10 = objc_msgSend(v7, "length");
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v34 = v7;
    v35 = v9;
    while (1)
    {
      v13 = objc_msgSend(v7, "rangeOfData:options:range:", v9, 0, v12, v11);
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v7, "subdataWithRange:", v12, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "appendData:", v17);
        goto LABEL_13;
      }
      v15 = v13;
      v16 = v14;
      objc_msgSend(v7, "subdataWithRange:", v12, v13 - v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "appendData:", v17);
      v18 = v15 + v16;
      v19 = objc_msgSend(v7, "length");
      v20 = v19 - (v15 + v16);
      v21 = objc_msgSend(v7, "rangeOfData:options:range:", v9, 0, v18, v19 - v18);
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v23 = v21;
      v24 = v22;
      objc_msgSend(v7, "subdataWithRange:", v18, v21 - v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v25, 4);
      objc_msgSend(v37, "localizedStringForKey:value:table:", v26, &stru_1E37FD4C0, v36);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v8, "objectForKey:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28)
        {
          v30 = v28;

          v27 = v30;
          v7 = v34;
        }

      }
      objc_msgSend(v27, "dataUsingEncoding:", 4);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "appendData:", v31);
      v12 = v23 + v24;
      v11 = objc_msgSend(v7, "length") - v12;

      v9 = v35;
      if (!v11)
        goto LABEL_14;
    }
    objc_msgSend(v7, "subdataWithRange:", v15, v20);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "appendData:", v32);

LABEL_13:
  }
LABEL_14:

  return v38;
}

@end
