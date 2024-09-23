@implementation FBKXMLDocument

- (FBKXMLDocument)initWithXMLString:(id)a3
{
  void *v4;
  FBKXMLDocument *v5;

  objc_msgSend(a3, "dataUsingEncoding:allowLossyConversion:", 4, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FBKXMLDocument initWithXMLData:](self, "initWithXMLData:", v4);

  return v5;
}

- (FBKXMLDocument)initWithXMLData:(id)a3
{
  id v4;
  FBKXMLDocument *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBKXMLDocument;
  v5 = -[FBKXMLDocument init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    v5->_document = xmlReadMemory((const char *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), ", 0, 18529);
  }

  return v5;
}

- (FBKXMLDocument)initWithHTMLString:(id)a3
{
  void *v4;
  FBKXMLDocument *v5;

  objc_msgSend(a3, "dataUsingEncoding:allowLossyConversion:", 4, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FBKXMLDocument initWithHTMLData:](self, "initWithHTMLData:", v4);

  return v5;
}

- (FBKXMLDocument)initWithHTMLData:(id)a3
{
  id v4;
  FBKXMLDocument *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBKXMLDocument;
  v5 = -[FBKXMLDocument init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    v5->_document = htmlReadMemory((const char *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), ", 0, 10337);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  xmlFreeDoc(self->_document);
  v3.receiver = self;
  v3.super_class = (Class)FBKXMLDocument;
  -[FBKXMLDocument dealloc](&v3, sel_dealloc);
}

- (id)performXPathQuery:(id)a3
{
  id v4;
  _xmlDoc *document;
  xmlXPathContext *v6;
  xmlChar *v7;
  xmlChar *v8;
  uint64_t v9;
  xmlXPathObject *v10;
  int *v11;
  void *v12;
  uint64_t v13;
  FBKXMLNode *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];

  v4 = a3;
  document = self->_document;
  if (document)
  {
    v6 = xmlXPathNewContext(document);
    v7 = xmlCharStrdup((const char *)objc_msgSend(objc_retainAutorelease(v4), "cStringUsingEncoding:", 4));
    v8 = v7;
    if (v6 && v7)
    {
      v9 = MEMORY[0x220799180](v7, v6);
      v10 = (xmlXPathObject *)v9;
      if (v9)
      {
        v11 = *(int **)(v9 + 8);
        if (v11)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *v11);
          if (*v11 >= 1)
          {
            v13 = 0;
            do
            {
              v14 = -[FBKXMLNode initWithXMLNodePtr:]([FBKXMLNode alloc], "initWithXMLNodePtr:", *(_QWORD *)(*((_QWORD *)v11 + 1) + 8 * v13));
              objc_msgSend(v12, "addObject:", v14);

              ++v13;
            }
            while (v13 < *v11);
          }
          v15 = (void *)objc_msgSend(v12, "copy");

          goto LABEL_20;
        }
      }
      +[FBKLog appHandle](FBKLog, "appHandle");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_21D9A9000, v18, OS_LOG_TYPE_DEFAULT, "Failed to evaluate XPath", v20, 2u);
      }

    }
    else
    {
      +[FBKLog appHandle](FBKLog, "appHandle");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_21D9A9000, v17, OS_LOG_TYPE_DEFAULT, "Failed to create XPath context, or parse provided query", v21, 2u);
      }

      v10 = 0;
    }
    v15 = 0;
LABEL_20:
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v8);
    xmlXPathFreeContext(v6);
    xmlXPathFreeObject(v10);
    goto LABEL_21;
  }
  +[FBKLog appHandle](FBKLog, "appHandle");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v16, OS_LOG_TYPE_DEFAULT, "Attempted to XPath query an empty/null document", buf, 2u);
  }

  v15 = 0;
LABEL_21:

  return v15;
}

@end
