@implementation ENXMLDTD

- (ENXMLDTD)initWithContentsOfFile:(id)a3
{
  id v4;
  ENXMLDTD *v5;
  id v6;
  xmlParserInputBuffer *Filename;
  xmlDtdPtr v8;
  ENXMLDTD *v9;
  xmlErrorPtr LastError;
  void *v11;
  xmlErrorPtr v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ENXMLDTD;
  v5 = -[ENXMLDTD init](&v15, sel_init);
  if (!v5)
    goto LABEL_4;
  v6 = objc_retainAutorelease(v4);
  Filename = xmlParserInputBufferCreateFilename((const char *)objc_msgSend(v6, "fileSystemRepresentation"), XML_CHAR_ENCODING_NONE);
  if (!Filename)
  {
    LastError = xmlGetLastError();
    if (LastError)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", LastError->message, 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    NSLog(CFSTR("xmlParserInputBufferCreateFilename(%@) returned error:%@"), v6, v11);
    xmlResetLastError();

    goto LABEL_13;
  }
  v8 = xmlIOParseDTD(0, Filename, XML_CHAR_ENCODING_NONE);
  v5->_dtd = v8;
  if (!v8)
  {
    v12 = xmlGetLastError();
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12->message, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    NSLog(CFSTR("xmlIOParseDTD() returned error:%@"), v13);
    xmlResetLastError();

LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
LABEL_4:
  v9 = v5;
LABEL_14:

  return v9;
}

- (void)dealloc
{
  _xmlDtd *dtd;
  objc_super v4;

  dtd = self->_dtd;
  if (dtd)
  {
    xmlFreeDtd(dtd);
    self->_dtd = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ENXMLDTD;
  -[ENXMLDTD dealloc](&v4, sel_dealloc);
}

- (_xmlEntity)xmlEntityNamed:(id)a3
{
  xmlHashTable *entities;

  entities = (xmlHashTable *)self->_dtd->entities;
  if (entities)
    return (_xmlEntity *)xmlHashLookup(entities, (const xmlChar *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 4));
  else
    return 0;
}

- (_xmlElement)xmlElementNamed:(id)a3
{
  return (_xmlElement *)xmlHashLookup((xmlHashTablePtr)self->_dtd->elements, (const xmlChar *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 4));
}

- (BOOL)isElementLegal:(id)a3
{
  return -[ENXMLDTD xmlElementNamed:](self, "xmlElementNamed:", a3) != 0;
}

- (id)sanitizedAttributes:(id)a3 forElement:(id)a4
{
  id v6;
  id v7;
  _xmlElement *v8;
  _xmlElement *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  xmlAttributePtr attributes;
  void *v16;
  xmlChar *name;
  void *v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[ENXMLDTD xmlElementNamed:](self, "xmlElementNamed:", v7);
  if (v8)
  {
    v9 = v8;
    v20 = v6;
    v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v6, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          attributes = v9->attributes;
          if (attributes)
          {
            v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            while (1)
            {
              name = (xmlChar *)attributes->name;
              if (name)
              {
                name = (xmlChar *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", name, strlen((const char *)attributes->name), 4);
                if (name)
                {
                  if (!objc_msgSend(v16, "caseInsensitiveCompare:", name))
                    break;
                }
              }
              attributes = attributes->nexth;

              if (!attributes)
                goto LABEL_15;
            }
            objc_msgSend(v20, "objectForKey:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKey:", v18, v16);

          }
LABEL_15:
          ;
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

    v6 = v20;
  }
  else
  {
    NSLog(CFSTR("Error retrieving element:%@ from dtd:%@"), v7, self);
    v21 = 0;
  }

  return v21;
}

- (BOOL)isAttributeLegal:(id)a3 inElement:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = (void *)MEMORY[0x24BDBCEF8];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObject:forKey:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ENXMLDTD sanitizedAttributes:forElement:](self, "sanitizedAttributes:forElement:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = objc_msgSend(v12, "count") == 1;
  return (char)self;
}

- (NSString)docTypeDeclaration
{
  return self->_docTypeDeclaration;
}

- (void)setDocTypeDeclaration:(id)a3
{
  objc_storeStrong((id *)&self->_docTypeDeclaration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_docTypeDeclaration, 0);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    defaultExternalEntityLoader = (uint64_t (*)(_QWORD, _QWORD, _QWORD))xmlGetExternalEntityLoader();
    xmlSetExternalEntityLoader((xmlExternalEntityLoader)enxmlExternalEntityLoader);
  }
}

+ (ENXMLDTD)dtdWithBundleResource:(id)a3 ofType:(id)a4
{
  void *v4;
  ENXMLDTD *v5;

  +[ENSDKResourceLoader pathToResourceNamed:extension:](ENSDKResourceLoader, "pathToResourceNamed:extension:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ENXMLDTD initWithContentsOfFile:]([ENXMLDTD alloc], "initWithContentsOfFile:", v4);

  return v5;
}

+ (ENXMLDTD)enexDTD
{
  if (enexDTD_onceToken != -1)
    dispatch_once(&enexDTD_onceToken, &__block_literal_global_5475);
  return (ENXMLDTD *)(id)enexDTD_dtd;
}

+ (ENXMLDTD)enml2dtd
{
  if (enml2dtd_onceToken != -1)
    dispatch_once(&enml2dtd_onceToken, &__block_literal_global_5);
  return (ENXMLDTD *)(id)enml2dtd_dtd;
}

+ (ENXMLDTD)lat1DTD
{
  if (lat1DTD_onceToken != -1)
    dispatch_once(&lat1DTD_onceToken, &__block_literal_global_10);
  return (ENXMLDTD *)(id)lat1DTD_dtd;
}

+ (ENXMLDTD)symbolDTD
{
  if (symbolDTD_onceToken != -1)
    dispatch_once(&symbolDTD_onceToken, &__block_literal_global_15);
  return (ENXMLDTD *)(id)symbolDTD_dtd;
}

+ (ENXMLDTD)specialDTD
{
  if (specialDTD_onceToken != -1)
    dispatch_once(&specialDTD_onceToken, &__block_literal_global_18);
  return (ENXMLDTD *)(id)specialDTD_dtd;
}

void __22__ENXMLDTD_specialDTD__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[ENXMLDTD dtdWithBundleResource:ofType:](ENXMLDTD, "dtdWithBundleResource:ofType:", CFSTR("xhtml-special"), CFSTR("ent"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)specialDTD_dtd;
  specialDTD_dtd = v0;

}

void __21__ENXMLDTD_symbolDTD__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[ENXMLDTD dtdWithBundleResource:ofType:](ENXMLDTD, "dtdWithBundleResource:ofType:", CFSTR("xhtml-symbol"), CFSTR("ent"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)symbolDTD_dtd;
  symbolDTD_dtd = v0;

}

void __19__ENXMLDTD_lat1DTD__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[ENXMLDTD dtdWithBundleResource:ofType:](ENXMLDTD, "dtdWithBundleResource:ofType:", CFSTR("xhtml-lat1"), CFSTR("ent"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)lat1DTD_dtd;
  lat1DTD_dtd = v0;

}

uint64_t __20__ENXMLDTD_enml2dtd__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[ENXMLDTD dtdWithBundleResource:ofType:](ENXMLDTD, "dtdWithBundleResource:ofType:", CFSTR("enml2"), CFSTR("dtd"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)enml2dtd_dtd;
  enml2dtd_dtd = v0;

  return objc_msgSend((id)enml2dtd_dtd, "setDocTypeDeclaration:", CFSTR("<!DOCTYPE en-note SYSTEM \"http://xml.evernote.com/pub/enml2.dtd\">"));
}

void __19__ENXMLDTD_enexDTD__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[ENXMLDTD dtdWithBundleResource:ofType:](ENXMLDTD, "dtdWithBundleResource:ofType:", CFSTR("evernote-export"), CFSTR("dtd"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)enexDTD_dtd;
  enexDTD_dtd = v0;

}

@end
