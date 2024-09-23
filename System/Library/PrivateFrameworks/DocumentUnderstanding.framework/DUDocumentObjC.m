@implementation DUDocumentObjC

- (DUDocumentObjC)init
{
  DUDocumentObjC *v2;
  _TtC21DocumentUnderstanding13DURawDocument *v3;
  _TtC21DocumentUnderstanding13DURawDocument *underlyingDocument;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DUDocumentObjC;
  v2 = -[DUDocumentObjC init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC21DocumentUnderstanding13DURawDocument);
    underlyingDocument = v2->_underlyingDocument;
    v2->_underlyingDocument = v3;

  }
  return v2;
}

- (NSString)headline
{
  return -[DURawDocument headline](self->_underlyingDocument, "headline");
}

- (void)setHeadline:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DURawDocument setHeadline:](self->_underlyingDocument, "setHeadline:", v4);

}

- (NSString)subHeadline
{
  return -[DURawDocument subHeadline](self->_underlyingDocument, "subHeadline");
}

- (void)setSubHeadline:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DURawDocument setSubHeadline:](self->_underlyingDocument, "setSubHeadline:", v4);

}

- (NSString)version
{
  return -[DURawDocument version](self->_underlyingDocument, "version");
}

- (void)setVersion:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DURawDocument setVersion:](self->_underlyingDocument, "setVersion:", v4);

}

- (NSString)creator
{
  return -[DURawDocument creator](self->_underlyingDocument, "creator");
}

- (void)setCreator:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DURawDocument setCreator:](self->_underlyingDocument, "setCreator:", v4);

}

- (NSString)abstract
{
  return -[DURawDocument abstract](self->_underlyingDocument, "abstract");
}

- (void)setAbstract:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DURawDocument setAbstract:](self->_underlyingDocument, "setAbstract:", v4);

}

- (NSString)comment
{
  return -[DURawDocument comment](self->_underlyingDocument, "comment");
}

- (void)setComment:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DURawDocument setComment:](self->_underlyingDocument, "setComment:", v4);

}

- (NSString)text
{
  return -[DURawDocument text](self->_underlyingDocument, "text");
}

- (void)setText:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DURawDocument setText:](self->_underlyingDocument, "setText:", v4);

}

- (NSString)inLanguage
{
  return -[DURawDocument inLanguage](self->_underlyingDocument, "inLanguage");
}

- (void)setInLanguage:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DURawDocument setInLanguage:](self->_underlyingDocument, "setInLanguage:", v4);

}

- (NSArray)keywords
{
  return -[DURawDocument keywords](self->_underlyingDocument, "keywords");
}

- (void)setKeywords:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DURawDocument setKeywords:](self->_underlyingDocument, "setKeywords:", v4);

}

- (NSString)identifier
{
  return -[DURawDocument identifier](self->_underlyingDocument, "identifier");
}

- (void)setIdentifier:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DURawDocument setIdentifier:](self->_underlyingDocument, "setIdentifier:", v4);

}

- (NSURL)url
{
  return -[DURawDocument url](self->_underlyingDocument, "url");
}

- (void)setUrl:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DURawDocument setUrl:](self->_underlyingDocument, "setUrl:", v4);

}

- (NSURL)thumbnailUrl
{
  return -[DURawDocument thumbnailUrl](self->_underlyingDocument, "thumbnailUrl");
}

- (void)setThumbnailUrl:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DURawDocument setThumbnailUrl:](self->_underlyingDocument, "setThumbnailUrl:", v4);

}

- (NSURL)significantLink
{
  return -[DURawDocument significantLink](self->_underlyingDocument, "significantLink");
}

- (void)setSignificantLink:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DURawDocument setSignificantLink:](self->_underlyingDocument, "setSignificantLink:", v4);

}

- (NSDate)dateCreated
{
  return -[DURawDocument dateCreated](self->_underlyingDocument, "dateCreated");
}

- (void)setDateCreated:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DURawDocument setDateCreated:](self->_underlyingDocument, "setDateCreated:", v4);

}

- (NSDate)dateModified
{
  return -[DURawDocument dateModified](self->_underlyingDocument, "dateModified");
}

- (void)setDateModified:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DURawDocument setDateModified:](self->_underlyingDocument, "setDateModified:", v4);

}

- (NSArray)documentUIElements
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[DURawDocument documentUIElements](self->_underlyingDocument, "documentUIElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          +[DUObjCCompatibilityUtils objCUIElementForUIElement:](DUObjCCompatibilityUtils, "objCUIElementForUIElement:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (void)setDocumentUIElements:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        +[DUObjCCompatibilityUtils uiElementForObjCUIElement:](DUObjCCompatibilityUtils, "uiElementForObjCUIElement:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[DURawDocument setDocumentUIElements:](self->_underlyingDocument, "setDocumentUIElements:", v5);
}

- (DUDocumentHTMLDataObjC)documentHTMLData
{
  void *v3;
  void *v4;
  void *v5;

  -[DURawDocument documentHTMLData](self->_underlyingDocument, "documentHTMLData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DURawDocument documentHTMLData](self->_underlyingDocument, "documentHTMLData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils objCHTMLDataForHTMLData:](DUObjCCompatibilityUtils, "objCHTMLDataForHTMLData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (DUDocumentHTMLDataObjC *)v5;
}

- (void)setDocumentHTMLData:(id)a3
{
  id v4;

  +[DUObjCCompatibilityUtils htmlDataForObjCHTMLData:](DUObjCCompatibilityUtils, "htmlDataForObjCHTMLData:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DURawDocument setDocumentHTMLData:](self->_underlyingDocument, "setDocumentHTMLData:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDocument, 0);
}

@end
