@implementation MWFeedParser

- (MWFeedParser)init
{
  MWFeedParser *v2;
  MWFeedParser *v3;
  void *v4;
  NSDateFormatter *v5;
  NSDateFormatter *dateFormatterRFC822;
  NSDateFormatter *v7;
  NSDateFormatter *dateFormatterRFC3339;
  NSDateFormatter *v9;
  void *v10;
  NSDateFormatter *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MWFeedParser;
  v2 = -[MWFeedParser init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->feedParseType = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    dateFormatterRFC822 = v3->dateFormatterRFC822;
    v3->dateFormatterRFC822 = v5;

    v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    dateFormatterRFC3339 = v3->dateFormatterRFC3339;
    v3->dateFormatterRFC3339 = v7;

    -[NSDateFormatter setLocale:](v3->dateFormatterRFC822, "setLocale:", v4);
    -[NSDateFormatter setLocale:](v3->dateFormatterRFC3339, "setLocale:", v4);
    v9 = v3->dateFormatterRFC822;
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v9, "setTimeZone:", v10);

    v11 = v3->dateFormatterRFC3339;
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v11, "setTimeZone:", v12);

  }
  return v3;
}

- (MWFeedParser)initWithFeedURL:(id)a3
{
  id v4;
  MWFeedParser *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = -[MWFeedParser init](self, "init");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v6;
    }
    -[MWFeedParser setUrl:](v5, "setUrl:", v4);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7458]), "initWithURL:cachePolicy:timeoutInterval:", v5->url, 4, 60.0);
    objc_msgSend(v7, "_setNonAppInitiated:", 1);
    objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("MWFeedParser"), CFSTR("User-Agent"));
    -[MWFeedParser setRequest:](v5, "setRequest:", v7);

  }
  return v5;
}

- (MWFeedParser)initWithFeedRequest:(id)a3
{
  id v4;
  MWFeedParser *v5;
  void *v6;

  v4 = a3;
  v5 = -[MWFeedParser init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MWFeedParser setUrl:](v5, "setUrl:", v6);

    -[MWFeedParser setRequest:](v5, "setRequest:", v4);
  }

  return v5;
}

- (void)reset
{
  id v3;

  -[MWFeedParser setUrlTask:](self, "setUrlTask:", 0);
  self->feedType = 0;
  -[MWFeedParser setCurrentPath:](self, "setCurrentPath:", CFSTR("/"));
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  -[MWFeedParser setCurrentText:](self, "setCurrentText:", v3);

  -[MWFeedParser setItem:](self, "setItem:", 0);
  -[MWFeedParser setInfo:](self, "setInfo:", 0);
  -[MWFeedParser setCurrentElementAttributes:](self, "setCurrentElementAttributes:", 0);
  self->parseStructureAsContent = 0;
  -[MWFeedParser setPathOfElementWithXHTMLType:](self, "setPathOfElementWithXHTMLType:", 0);
  self->hasEncounteredItems = 0;
}

- (BOOL)parse
{
  id WeakRetained;
  const __CFString *v4;
  MWFeedParser *v5;
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  NSURLSessionDataTask *v11;
  NSURLSessionDataTask *urlTask;
  _QWORD v13[5];

  -[MWFeedParser reset](self, "reset");
  if (self->url
    && (WeakRetained = objc_loadWeakRetained((id *)&self->delegate), WeakRetained, WeakRetained))
  {
    if (!self->parsing)
    {
      *(_DWORD *)&self->aborted = 256;
      self->parsingComplete = 0;
      objc_msgSend(MEMORY[0x24BDB74B8], "defaultSessionConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setURLCache:", 0);
      objc_msgSend(MEMORY[0x24BDB74B0], "sessionWithConfiguration:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MWFeedParser request](self, "request");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __21__MWFeedParser_parse__block_invoke;
      v13[3] = &unk_24F8B3840;
      v13[4] = self;
      objc_msgSend(v9, "dataTaskWithRequest:completionHandler:", v10, v13);
      v11 = (NSURLSessionDataTask *)objc_claimAutoreleasedReturnValue();
      urlTask = self->urlTask;
      self->urlTask = v11;

      -[NSURLSessionDataTask resume](self->urlTask, "resume");
      return 1;
    }
    v4 = CFSTR("Cannot start parsing as parsing is already in progress");
    v5 = self;
    v6 = 5;
  }
  else
  {
    v4 = CFSTR("Delegate or URL not specified");
    v5 = self;
    v6 = 1;
  }
  -[MWFeedParser parsingFailedWithErrorCode:andDescription:](v5, "parsingFailedWithErrorCode:andDescription:", v6, v4);
  return 0;
}

- (void)startParsingData:(id)a3 textEncodingName:(id)a4
{
  __CFString *v6;
  MWFeedInfo *v7;
  void *v8;
  void *v9;
  char v10;
  CFStringEncoding v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSXMLParser *feedParser;
  uint64_t v23;
  id v24;

  v24 = a3;
  v6 = (__CFString *)a4;
  if (v24)
  {
    if (!self->feedParser)
    {
      v7 = objc_alloc_init(MWFeedInfo);
      -[MWFeedParser url](self, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MWFeedInfo setUrl:](v7, "setUrl:", v8);

      -[MWFeedParser setInfo:](self, "setInfo:", v7);
      -[__CFString lowercaseString](v6, "lowercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("utf-8"));

      if ((v10 & 1) != 0)
      {
LABEL_18:
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1978]), "initWithData:", v24);
        -[MWFeedParser setFeedParser:](self, "setFeedParser:", v21);
        feedParser = self->feedParser;
        if (feedParser)
        {
          -[NSXMLParser setDelegate:](feedParser, "setDelegate:", self);
          -[NSXMLParser setShouldProcessNamespaces:](self->feedParser, "setShouldProcessNamespaces:", 1);
          -[NSXMLParser parse](self->feedParser, "parse");
          -[MWFeedParser setFeedParser:](self, "setFeedParser:", 0);
        }
        else
        {
          -[MWFeedParser parsingFailedWithErrorCode:andDescription:](self, "parsingFailedWithErrorCode:andDescription:", 3, CFSTR("Feed not a valid XML document"));
        }

        goto LABEL_27;
      }
      if (v6
        && (v11 = CFStringConvertIANACharSetNameToEncoding(v6), v11 != -1)
        && (v12 = CFStringConvertEncodingToNSStringEncoding(v11)) != 0
        && (v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v24, v12)) != 0
        || (v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v24, 4)) != 0
        || (v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v24, 5)) != 0)
      {

      }
      else
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v24, 30);

        if (!v13)
          goto LABEL_26;
      }
      if (objc_msgSend(v13, "hasPrefix:", CFSTR("<?xml")))
      {
        v14 = objc_msgSend(v13, "rangeOfString:", CFSTR("?>"));
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v13, "substringToIndex:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "rangeOfString:options:", CFSTR("encoding=\"UTF-8\"), 1) != 0x7FFFFFFFFFFFFFFFLL
            || (v16 = objc_msgSend(v15, "rangeOfString:", CFSTR("encoding=\")), v16 == 0x7FFFFFFFFFFFFFFFLL)
            || (v18 = v16,
                v19 = objc_msgSend(v15, "rangeOfString:options:range:", CFSTR("\"), 0, v16 + v17, objc_msgSend(v15, "length") - (v16 + v17)), v19 == 0x7FFFFFFFFFFFFFFFLL))
          {

          }
          else
          {
            objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", v18, v20 - v18 + v19, CFSTR("encoding=\"UTF-8\"));
            v23 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)v23;
            if (!v23)
              goto LABEL_26;
          }
        }
      }
      objc_msgSend(v13, "dataUsingEncoding:", 4);
      v24 = (id)objc_claimAutoreleasedReturnValue();

      if (v24)
        goto LABEL_18;
LABEL_26:
      -[MWFeedParser parsingFailedWithErrorCode:andDescription:](self, "parsingFailedWithErrorCode:andDescription:", 3, CFSTR("Error with feed encoding"));
      v24 = 0;
LABEL_27:

    }
  }
  else
  {
    v24 = 0;
  }

}

- (void)abortParsingEarly
{
  self->aborted = 1;
  -[NSXMLParser abortParsing](self->feedParser, "abortParsing");
  -[MWFeedParser parsingFinished](self, "parsingFinished");
}

- (void)stopParsing
{
  if (self->parsing && !self->parsingComplete)
  {
    self->stopped = 1;
    -[NSURLSessionDataTask cancel](self->urlTask, "cancel");
    -[MWFeedParser setUrlTask:](self, "setUrlTask:", 0);
    self->aborted = 1;
    -[NSXMLParser abortParsing](self->feedParser, "abortParsing");
    -[MWFeedParser parsingFinished](self, "parsingFinished");
  }
}

- (void)parsingFinished
{
  MWFeedParserDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  if (!self->parsingComplete)
  {
    self->parsing = 0;
    self->parsingComplete = 1;
    p_delegate = &self->delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v6, "feedParserDidFinish:", self);

    }
    -[MWFeedParser reset](self, "reset");
  }
}

- (void)parsingFailedWithErrorCode:(int)a3 andDescription:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSXMLParser *feedParser;
  id WeakRetained;
  char v10;
  void *v11;
  id v12;
  uint64_t v13;

  if (!self->parsingComplete)
  {
    *(_WORD *)&self->failed = 257;
    self->parsing = 0;
    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = a3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a4, *MEMORY[0x24BDD0FC8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("MWFeedParser"), v6, v7);
    v13 = objc_claimAutoreleasedReturnValue();

    feedParser = self->feedParser;
    if (feedParser)
    {
      self->aborted = 1;
      -[NSXMLParser abortParsing](feedParser, "abortParsing");
    }
    -[MWFeedParser reset](self, "reset");
    WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
    v10 = objc_opt_respondsToSelector();

    v11 = (void *)v13;
    if ((v10 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)&self->delegate);
      objc_msgSend(v12, "feedParser:didFailWithError:", self, v13);

      v11 = (void *)v13;
    }

  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  NSMutableString *currentText;
  void *v26;
  void *v27;
  NSMutableString *v28;
  const __CFString *v29;
  void *v30;
  int feedType;
  int v32;
  MWFeedItem *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)MEMORY[0x22E315218]();
  -[NSString stringByAppendingPathComponent:](self->currentPath, "stringByAppendingPathComponent:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MWFeedParser setCurrentPath:](self, "setCurrentPath:", v18);

  -[MWFeedParser setCurrentElementAttributes:](self, "setCurrentElementAttributes:", v16);
  if (self->parseStructureAsContent)
  {
    v37 = v15;
    v38 = v14;
    v39 = v13;
    v40 = v12;
    -[NSMutableString appendFormat:](self->currentText, "appendFormat:", CFSTR("<%@"), v13);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v36 = v16;
    v19 = v16;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v42 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          currentText = self->currentText;
          objc_msgSend(v19, "objectForKey:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringByEncodingHTMLEntities");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableString appendFormat:](currentText, "appendFormat:", CFSTR(" %@=\"%@\"), v24, v27);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v21);
    }

    v13 = v39;
    if ((objc_msgSend(v39, "isEqualToString:", CFSTR("br")) & 1) != 0
      || (objc_msgSend(v39, "isEqualToString:", CFSTR("img")) & 1) != 0
      || (objc_msgSend(v39, "isEqualToString:", CFSTR("input")) & 1) != 0
      || (objc_msgSend(v39, "isEqualToString:", CFSTR("hr")) & 1) != 0
      || (objc_msgSend(v39, "isEqualToString:", CFSTR("link")) & 1) != 0
      || (objc_msgSend(v39, "isEqualToString:", CFSTR("base")) & 1) != 0
      || (objc_msgSend(v39, "isEqualToString:", CFSTR("basefont")) & 1) != 0
      || (objc_msgSend(v39, "isEqualToString:", CFSTR("frame")) & 1) != 0
      || (objc_msgSend(v39, "isEqualToString:", CFSTR("meta")) & 1) != 0
      || (objc_msgSend(v39, "isEqualToString:", CFSTR("area")) & 1) != 0
      || (objc_msgSend(v39, "isEqualToString:", CFSTR("col")) & 1) != 0
      || objc_msgSend(v39, "isEqualToString:", CFSTR("param")))
    {
      v28 = self->currentText;
      v29 = CFSTR(" />");
    }
    else
    {
      v28 = self->currentText;
      v29 = CFSTR(">");
    }
    -[NSMutableString appendString:](v28, "appendString:", v29);
    v12 = v40;
    v15 = v37;
    v14 = v38;
    v16 = v36;
    goto LABEL_23;
  }
  -[MWFeedParser currentText](self, "currentText");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setString:", &stru_24F8BBA48);

  feedType = self->feedType;
  if (!feedType)
  {
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("rss")))
    {
      v32 = 1;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("rdf:RDF")))
    {
      v32 = 2;
    }
    else
    {
      if (!objc_msgSend(v15, "isEqualToString:", CFSTR("feed")))
      {
        -[MWFeedParser parsingFailedWithErrorCode:andDescription:](self, "parsingFailedWithErrorCode:andDescription:", 3, CFSTR("XML document is not a valid web feed document."));
        goto LABEL_23;
      }
      v32 = 3;
    }
    self->feedType = v32;
    goto LABEL_23;
  }
  if (self->feedParseType != 1)
  {
    if (feedType == 1)
    {
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rss/channel")))
        goto LABEL_23;
      feedType = self->feedType;
    }
    if (feedType == 2)
    {
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rdf:RDF/channel")))
        goto LABEL_23;
      feedType = self->feedType;
    }
    if (feedType == 3)
    {
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/feed")))
        goto LABEL_23;
      feedType = self->feedType;
    }
  }
  if (feedType == 1)
  {
    if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rss/channel/item")))
      goto LABEL_43;
    feedType = self->feedType;
  }
  if (feedType == 2)
  {
    if (!-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rdf:RDF/item")))
    {
      feedType = self->feedType;
      goto LABEL_41;
    }
LABEL_43:
    if (self->hasEncounteredItems
      || (self->hasEncounteredItems = 1, self->feedParseType == 1)
      || (-[MWFeedParser dispatchFeedInfoToDelegate](self, "dispatchFeedInfoToDelegate"), self->feedParseType != 2))
    {
      v33 = objc_alloc_init(MWFeedItem);
      -[MWFeedParser setItem:](self, "setItem:", v33);

    }
    else
    {
      -[MWFeedParser abortParsingEarly](self, "abortParsingEarly");
    }
    goto LABEL_23;
  }
LABEL_41:
  if (feedType != 3)
    goto LABEL_23;
  if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/feed/entry")))
    goto LABEL_43;
  if (self->feedType == 3)
  {
    objc_msgSend(v16, "objectForKey:", CFSTR("type"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34 && objc_msgSend(v34, "isEqualToString:", CFSTR("xhtml")))
    {
      self->parseStructureAsContent = 1;
      -[MWFeedParser setPathOfElementWithXHTMLType:](self, "setPathOfElementWithXHTMLType:", self->currentPath);
    }

  }
LABEL_23:
  objc_autoreleasePoolPop(v17);

}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  NSMutableString *currentText;
  void *v16;
  int feedType;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *currentElementAttributes;
  void *v22;
  void *v23;
  void *info;
  void *v25;
  void *item;
  void *v27;
  NSString *currentPath;
  const __CFString *v29;
  void *v30;
  int v31;
  int v32;
  id v33;

  v33 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x22E315218]();
  if (self->parseStructureAsContent)
  {
    v14 = -[NSString length](self->currentPath, "length");
    if (v14 > -[NSString length](self->pathOfElementWithXHTMLType, "length"))
    {
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("br")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("img")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("input")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("hr")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("link")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("base")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("basefont")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("frame")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("meta")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("area")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("col")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("param")) & 1) == 0)
      {
        -[NSMutableString appendFormat:](self->currentText, "appendFormat:", CFSTR("</%@>"), v10, v33);
      }
      goto LABEL_66;
    }
    self->parseStructureAsContent = 0;
    -[MWFeedParser setPathOfElementWithXHTMLType:](self, "setPathOfElementWithXHTMLType:", 0);
  }
  currentText = self->currentText;
  if (currentText)
  {
    -[NSMutableString stringByRemovingNewLinesAndWhitespace](currentText, "stringByRemovingNewLinesAndWhitespace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    feedType = self->feedType;
    if (feedType != 3)
    {
      if (feedType != 2)
      {
        if (feedType != 1)
          goto LABEL_97;
        if (!-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rss/channel/item/title")))
        {
          if (!-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rss/channel/item/link")))
          {
            if (!-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rss/channel/item/author"))
              && !-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rss/channel/item/dc:creator")))
            {
              if (!-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rss/channel/item/guid")))
              {
                if (!-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rss/channel/item/description")))
                {
                  if (!-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rss/channel/item/content:encoded")))
                  {
                    if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rss/channel/item/pubDate")))
                    {
                      if (objc_msgSend(v16, "length"))
                      {
                        v18 = (void *)MEMORY[0x24BDBCE60];
                        v19 = v16;
                        v20 = 1;
LABEL_71:
                        objc_msgSend(v18, "dateFromInternetDateTimeString:formatHint:", v19, v20);
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        -[MWFeedItem setDate:](self->item, "setDate:", v25);
                        goto LABEL_72;
                      }
                      goto LABEL_65;
                    }
                    if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rss/channel/item/enclosure")))
                    {
LABEL_79:
                      -[MWFeedParser createEnclosureFromAttributes:andAddToItem:](self, "createEnclosureFromAttributes:andAddToItem:", self->currentElementAttributes, self->item);
                      goto LABEL_65;
                    }
                    if (!-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rss/channel/item/dc:date")))
                    {
                      if (self->feedParseType != 1)
                      {
                        if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rss/channel/title")))
                        {
                          goto LABEL_88;
                        }
                        if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rss/channel/description")))
                        {
                          goto LABEL_91;
                        }
                        currentPath = self->currentPath;
                        v29 = CFSTR("/rss/channel/link");
LABEL_94:
                        if (-[NSString isEqualToString:](currentPath, "isEqualToString:", v29))
                        {
                          if (!objc_msgSend(v16, "length"))
                            goto LABEL_65;
                          info = self->info;
                          goto LABEL_42;
                        }
                      }
LABEL_97:

                      goto LABEL_98;
                    }
LABEL_69:
                    if (objc_msgSend(v16, "length"))
                    {
                      v18 = (void *)MEMORY[0x24BDBCE60];
                      v19 = v16;
                      v20 = 2;
                      goto LABEL_71;
                    }
LABEL_65:

LABEL_66:
                    -[NSString stringByDeletingLastPathComponent](self->currentPath, "stringByDeletingLastPathComponent");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    -[MWFeedParser setCurrentPath:](self, "setCurrentPath:", v27);

                    goto LABEL_67;
                  }
LABEL_57:
                  if (objc_msgSend(v16, "length"))
                    -[MWFeedItem setContent:](self->item, "setContent:", v16);
                  goto LABEL_65;
                }
LABEL_53:
                if (!objc_msgSend(v16, "length"))
                  goto LABEL_65;
                item = self->item;
LABEL_55:
                objc_msgSend(item, "setSummary:", v16);
                goto LABEL_65;
              }
LABEL_60:
              if (objc_msgSend(v16, "length"))
                -[MWFeedItem setIdentifier:](self->item, "setIdentifier:", v16);
              goto LABEL_65;
            }
            goto LABEL_63;
          }
LABEL_40:
          if (!objc_msgSend(v16, "length"))
            goto LABEL_65;
          info = self->item;
LABEL_42:
          objc_msgSend(info, "setLink:", v16);
          goto LABEL_65;
        }
LABEL_36:
        if (!objc_msgSend(v16, "length"))
          goto LABEL_65;
        v23 = self->item;
LABEL_38:
        objc_msgSend(v23, "setTitle:", v16);
        goto LABEL_65;
      }
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rdf:RDF/item/title")))
        goto LABEL_36;
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rdf:RDF/item/link")))
        goto LABEL_40;
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rdf:RDF/item/description")))
        goto LABEL_53;
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rdf:RDF/item/content:encoded")))
        goto LABEL_57;
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rdf:RDF/item/dc:identifier")))
        goto LABEL_60;
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rdf:RDF/item/dc:creator")))
      {
LABEL_63:
        if (objc_msgSend(v16, "length"))
          -[MWFeedItem setAuthor:](self->item, "setAuthor:", v16);
        goto LABEL_65;
      }
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rdf:RDF/item/dc:date")))
        goto LABEL_69;
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rdf:RDF/item/enc:enclosure")))
        goto LABEL_79;
      if (self->feedParseType == 1)
        goto LABEL_97;
      if (!-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rdf:RDF/channel/title")))
      {
        if (!-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/rdf:RDF/channel/description")))
        {
          currentPath = self->currentPath;
          v29 = CFSTR("/rdf:RDF/channel/link");
          goto LABEL_94;
        }
LABEL_91:
        if (!objc_msgSend(v16, "length"))
          goto LABEL_65;
        item = self->info;
        goto LABEL_55;
      }
LABEL_88:
      if (!objc_msgSend(v16, "length"))
        goto LABEL_65;
      v23 = self->info;
      goto LABEL_38;
    }
    if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/feed/entry/title")))
      goto LABEL_36;
    if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/feed/entry/link")))
    {
      currentElementAttributes = self->currentElementAttributes;
      v22 = self->item;
    }
    else
    {
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/feed/entry/id")))
        goto LABEL_60;
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/feed/entry/summary")))
        goto LABEL_53;
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/feed/entry/content")))
        goto LABEL_57;
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/feed/entry/author/name"))
        || -[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/feed/entry/dc:creator")))
      {
        goto LABEL_63;
      }
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/feed/entry/published")))
        goto LABEL_69;
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/feed/entry/updated")))
      {
        if (objc_msgSend(v16, "length"))
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "dateFromInternetDateTimeString:formatHint:", v16, 2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[MWFeedItem setUpdated:](self->item, "setUpdated:", v25);
LABEL_72:

          goto LABEL_65;
        }
        goto LABEL_65;
      }
      if (self->feedParseType == 1)
        goto LABEL_97;
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/feed/title")))
        goto LABEL_88;
      if (-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/feed/description")))
        goto LABEL_91;
      if (!-[NSString isEqualToString:](self->currentPath, "isEqualToString:", CFSTR("/feed/link")))
        goto LABEL_97;
      currentElementAttributes = self->currentElementAttributes;
      v22 = self->info;
    }
    -[MWFeedParser processAtomLink:andAddToMWObject:](self, "processAtomLink:andAddToMWObject:", currentElementAttributes, v22);
    goto LABEL_65;
  }
LABEL_98:
  -[NSString stringByDeletingLastPathComponent](self->currentPath, "stringByDeletingLastPathComponent");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MWFeedParser setCurrentPath:](self, "setCurrentPath:", v30);

  v31 = self->feedType;
  if ((v31 - 1) <= 1)
  {
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("item")) & 1) != 0)
    {
LABEL_103:
      -[MWFeedParser dispatchFeedItemToDelegate](self, "dispatchFeedItemToDelegate");
      goto LABEL_104;
    }
    v31 = self->feedType;
  }
  if (v31 == 3 && objc_msgSend(v12, "isEqualToString:", CFSTR("entry")))
    goto LABEL_103;
LABEL_104:
  v32 = self->feedType;
  if (v32 == 1)
  {
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("rss")) & 1) != 0)
      goto LABEL_112;
    v32 = self->feedType;
  }
  if (v32 != 2)
  {
LABEL_110:
    if (v32 != 3 || !objc_msgSend(v12, "isEqualToString:", CFSTR("feed")))
      goto LABEL_67;
    goto LABEL_112;
  }
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("rdf:RDF")) & 1) == 0)
  {
    v32 = self->feedType;
    goto LABEL_110;
  }
LABEL_112:
  if (self->info && self->feedParseType != 1)
    -[MWFeedParser dispatchFeedInfoToDelegate](self, "dispatchFeedInfoToDelegate");
LABEL_67:
  objc_autoreleasePoolPop(v13);

}

- (void)parser:(id)a3 foundCDATA:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
  if (v7 || (v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 5)) != 0)
    -[NSMutableString appendString:](self->currentText, "appendString:", v7);

}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  NSMutableString *currentText;
  id v5;

  currentText = self->currentText;
  if (self->parseStructureAsContent)
  {
    objc_msgSend(a4, "stringByEncodingHTMLEntities", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendString:](currentText, "appendString:", v5);

  }
  else
  {
    -[NSMutableString appendString:](self->currentText, "appendString:", a4);
  }
}

- (void)parserDidStartDocument:(id)a3
{
  MWFeedParserDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "feedParserDidStart:", self);

  }
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v5;

  if (!self->aborted)
  {
    objc_msgSend(a4, "localizedDescription", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[MWFeedParser parsingFailedWithErrorCode:andDescription:](self, "parsingFailedWithErrorCode:andDescription:", 3, v5);

  }
}

- (void)parser:(id)a3 validationErrorOccurred:(id)a4
{
  id v5;

  objc_msgSend(a4, "localizedDescription", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MWFeedParser parsingFailedWithErrorCode:andDescription:](self, "parsingFailedWithErrorCode:andDescription:", 4, v5);

}

- (void)dispatchFeedInfoToDelegate
{
  MWFeedParserDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  if (self->info)
  {
    p_delegate = &self->delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v6, "feedParser:didParseFeedInfo:", self, self->info);

    }
    -[MWFeedParser setInfo:](self, "setInfo:", 0);
  }
}

- (void)dispatchFeedItemToDelegate
{
  MWFeedItem *item;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  char v9;
  id v10;

  item = self->item;
  if (!item)
    return;
  -[MWFeedItem summary](item, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[MWFeedItem content](self->item, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MWFeedItem setSummary:](self->item, "setSummary:", v5);

    -[MWFeedItem setContent:](self->item, "setContent:", 0);
  }
  -[MWFeedItem date](self->item, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_7;
  -[MWFeedItem updated](self->item, "updated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MWFeedItem updated](self->item, "updated");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MWFeedItem setDate:](self->item, "setDate:", v6);
LABEL_7:

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->delegate);
    objc_msgSend(v10, "feedParser:didParseFeedItem:", self, self->item);

  }
  -[MWFeedParser setItem:](self, "setItem:", 0);
}

- (void)setUrl:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  NSURL *v14;
  NSURL *url;
  id v16;
  id v17;

  v16 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v4;
  }
  else
  {
    v5 = v16;
  }
  v17 = v5;
  if (v5)
  {
    objc_msgSend(v5, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("feed"));

    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDBCF48];
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v17, "resourceSpecifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "hasPrefix:", CFSTR("//")))
        v11 = CFSTR("http:");
      else
        v11 = &stru_24F8BBA48;
      objc_msgSend(v17, "resourceSpecifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@"), v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLWithString:", v13);
      v14 = (NSURL *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = (NSURL *)objc_msgSend(v17, "copy");
    }
  }
  else
  {
    v14 = 0;
  }
  url = self->url;
  self->url = v14;

}

- (BOOL)createEnclosureFromAttributes:(id)a3 andAddToItem:(id)a4
{
  id v6;
  id v7;
  int feedType;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_17;
  feedType = self->feedType;
  switch(feedType)
  {
    case 1:
      v9 = CFSTR("length");
      v10 = CFSTR("type");
      v11 = CFSTR("url");
      break;
    case 3:
      objc_msgSend(v6, "objectForKey:", CFSTR("rel"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("enclosure"));

      if (!v13)
        goto LABEL_17;
      v9 = CFSTR("length");
      v10 = CFSTR("type");
      v11 = CFSTR("href");
      break;
    case 2:
      v9 = CFSTR("enc:length");
      v10 = CFSTR("enc:type");
      v11 = CFSTR("rdf:resource");
      break;
    default:
LABEL_17:
      v24 = 0;
      v20 = 0;
      v14 = 0;
      v15 = 0;
      v18 = 0;
      goto LABEL_18;
  }
  objc_msgSend(v6, "objectForKey:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "objectForKey:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithLongLong:", objc_msgSend(v17, "longLongValue"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
    objc_msgSend(v19, "setObject:forKey:", v14, CFSTR("url"));
    if (v15)
      objc_msgSend(v19, "setObject:forKey:", v15, CFSTR("type"));
    if (v18)
      objc_msgSend(v19, "setObject:forKey:", v18, CFSTR("length"));
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v7, "enclosures");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v7, "enclosures");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "arrayByAddingObject:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setEnclosures:", v23);

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setEnclosures:", v22);
      }

      v24 = 1;
    }
    else
    {
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
    v20 = 0;
  }
LABEL_18:

  return v24;
}

- (BOOL)processAtomLink:(id)a3 andAddToMWObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("rel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("rel"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("alternate"));

      if (!v10)
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("rel"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("enclosure"));

        if (v12 && objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
        {
          -[MWFeedParser createEnclosureFromAttributes:andAddToItem:](self, "createEnclosureFromAttributes:andAddToItem:", v6, v7);
LABEL_10:
          LOBYTE(v13) = 1;
          goto LABEL_11;
        }
        goto LABEL_7;
      }
    }
    else
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("href"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_11;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("href"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLink:", v14);

    goto LABEL_10;
  }
LABEL_7:
  LOBYTE(v13) = 0;
LABEL_11:

  return (char)v13;
}

- (NSURL)url
{
  return self->url;
}

- (NSURLRequest)request
{
  return self->request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->request, a3);
}

- (MWFeedParserDelegate)delegate
{
  return (MWFeedParserDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSURLSessionDataTask)urlTask
{
  return self->urlTask;
}

- (void)setUrlTask:(id)a3
{
  objc_storeStrong((id *)&self->urlTask, a3);
}

- (int)feedParseType
{
  return self->feedParseType;
}

- (void)setFeedParseType:(int)a3
{
  self->feedParseType = a3;
}

- (NSXMLParser)feedParser
{
  return self->feedParser;
}

- (void)setFeedParser:(id)a3
{
  objc_storeStrong((id *)&self->feedParser, a3);
}

- (NSString)currentPath
{
  return self->currentPath;
}

- (void)setCurrentPath:(id)a3
{
  objc_storeStrong((id *)&self->currentPath, a3);
}

- (NSMutableString)currentText
{
  return self->currentText;
}

- (void)setCurrentText:(id)a3
{
  objc_storeStrong((id *)&self->currentText, a3);
}

- (NSDictionary)currentElementAttributes
{
  return self->currentElementAttributes;
}

- (void)setCurrentElementAttributes:(id)a3
{
  objc_storeStrong((id *)&self->currentElementAttributes, a3);
}

- (MWFeedItem)item
{
  return self->item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->item, a3);
}

- (MWFeedInfo)info
{
  return self->info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->info, a3);
}

- (NSString)pathOfElementWithXHTMLType
{
  return self->pathOfElementWithXHTMLType;
}

- (void)setPathOfElementWithXHTMLType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isStopped
{
  return self->stopped;
}

- (BOOL)didFail
{
  return self->failed;
}

- (BOOL)isParsing
{
  return self->parsing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->request, 0);
  objc_storeStrong((id *)&self->info, 0);
  objc_storeStrong((id *)&self->item, 0);
  objc_storeStrong((id *)&self->currentElementAttributes, 0);
  objc_storeStrong((id *)&self->currentText, 0);
  objc_storeStrong((id *)&self->currentPath, 0);
  objc_storeStrong((id *)&self->pathOfElementWithXHTMLType, 0);
  objc_storeStrong((id *)&self->url, 0);
  objc_storeStrong((id *)&self->dateFormatterRFC3339, 0);
  objc_storeStrong((id *)&self->dateFormatterRFC822, 0);
  objc_storeStrong((id *)&self->feedParser, 0);
  objc_storeStrong((id *)&self->urlTask, 0);
  objc_destroyWeak((id *)&self->delegate);
}

void __21__MWFeedParser_parse__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _BYTE *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  v9 = *(_BYTE **)(a1 + 32);
  if (!v13 || v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "setUrlTask:", 0);
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v8, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "parsingFailedWithErrorCode:andDescription:", 2, v12);

  }
  else
  {
    if (!v9[74])
    {
      objc_msgSend(v7, "textEncodingName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startParsingData:textEncodingName:", v13, v10);

      v9 = *(_BYTE **)(a1 + 32);
    }
    objc_msgSend(v9, "setUrlTask:", 0);
  }

}

@end
