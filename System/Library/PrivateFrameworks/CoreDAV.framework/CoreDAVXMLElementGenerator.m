@implementation CoreDAVXMLElementGenerator

- (CoreDAVXMLElementGenerator)initWithParser:(id)a3 baseURL:(id)a4 rootElementNameSpace:(id)a5 elementName:(id)a6 parseClass:(Class)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  CoreDAVXMLElementGenerator *v17;
  CoreDAVXMLElementGenerator *v18;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend([a7 alloc], "initWithNameSpace:andName:", v13, v12);

  v17 = -[CoreDAVXMLElementGenerator initWithParser:parentGenerator:parentElementSetter:element:](self, "initWithParser:parentGenerator:parentElementSetter:element:", v15, 0, 0, v16);
  v18 = v17;
  -[CoreDAVXMLElementGenerator setBaseURL:](v18, "setBaseURL:", v14);

  return v18;
}

- (CoreDAVXMLElementGenerator)initWithParser:(id)a3 parentGenerator:(id)a4 parentElementSetter:(SEL)a5 element:(id)a6
{
  id v10;
  id v11;
  id v12;
  CoreDAVXMLElementGenerator *v13;
  CoreDAVXMLElementGenerator *v14;
  uint64_t v15;
  NSURL *baseURL;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CoreDAVXMLElementGenerator;
  v13 = -[CoreDAVXMLElementGenerator init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    *(_WORD *)&v13->_checkedElementValidityIfRootElement = 0;
    v13->_parsingState = 1;
    v13->_parentElementSetter = a5;
    objc_storeStrong((id *)&v13->_element, a6);
    objc_storeWeak((id *)&v14->_parentGenerator, v11);
    objc_msgSend(v11, "baseURL");
    v15 = objc_claimAutoreleasedReturnValue();
    baseURL = v14->_baseURL;
    v14->_baseURL = (NSURL *)v15;

    objc_msgSend(v10, "setDelegate:", v14);
  }

  return v14;
}

- (BOOL)tracksRootElement
{
  void *v2;
  BOOL v3;

  -[CoreDAVXMLElementGenerator parentGenerator](self, "parentGenerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)notifyElement:(id)a3 ofAttributesFound:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  CoreDAVXMLElementAttribute *v14;
  void *v15;
  CoreDAVXMLElementAttribute *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v8)
  {
    v10 = v7;
    goto LABEL_13;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(v7);
      v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
      if (!v10)
        v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v14 = [CoreDAVXMLElementAttribute alloc];
      objc_msgSend(v6, "objectForKey:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CoreDAVXMLElementAttribute initWithNameSpace:name:value:](v14, "initWithNameSpace:name:value:", 0, v13, v15);

      objc_msgSend(v10, "addObject:", v16);
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v9);

  if (v10)
  {
    objc_msgSend(v5, "parserFoundAttributes:", v10);
LABEL_13:

  }
}

- (BOOL)isExpectedNameSpace:(id)a3 andElementName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CoreDAVXMLElementGenerator element](self, "element");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v9) & 1) != 0)
  {
    -[CoreDAVXMLElementGenerator element](self, "element");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nameSpace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "isEqualToString:", v11);

    if ((v12 & 1) != 0)
    {
      v13 = 1;
      goto LABEL_9;
    }
  }
  else
  {

  }
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logHandleForAccountInfoProvider:", 0);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[CoreDAVXMLElementGenerator element](self, "element");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "nameSpace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVXMLElementGenerator element](self, "element");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138413058;
    v23 = v18;
    v24 = 2112;
    v25 = v20;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_209602000, v16, OS_LOG_TYPE_DEFAULT, "The expected namespace / name (%@ / %@) didn't match my namespace / name (%@ / %@", (uint8_t *)&v22, 0x2Au);

  }
  v13 = 0;
LABEL_9:

  return v13;
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
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CoreDAVXMLElementGenerator *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  CoreDAVItem *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  CoreDAVXMLElementGenerator *v41;
  void *v42;
  CoreDAVXMLElementGenerator *v43;
  void *v44;
  id v45;
  BOOL v46;
  CoreDAVXMLElementGenerator *v47;
  CoreDAVXMLElementGenerator *v48;
  void *v49;
  CoreDAVXMLElementGenerator *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  CoreDAVItem *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (-[CoreDAVXMLElementGenerator tracksRootElement](self, "tracksRootElement"))
  {
    -[CoreDAVXMLElementGenerator currentlyParsingSubItem](self, "currentlyParsingSubItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {

    }
    else if (!-[CoreDAVXMLElementGenerator checkedElementValidityIfRootElement](self, "checkedElementValidityIfRootElement"))
    {
      v45 = v16;
      -[CoreDAVXMLElementGenerator setCheckedElementValidityIfRootElement:](self, "setCheckedElementValidityIfRootElement:", 1);
      v46 = -[CoreDAVXMLElementGenerator isExpectedNameSpace:andElementName:](self, "isExpectedNameSpace:andElementName:", v14, v13);
      objc_msgSend(v12, "rootErrorGenerator");
      v47 = (CoreDAVXMLElementGenerator *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      if (v46)
      {

        if (v48 != self)
          objc_msgSend(v12, "setRootErrorGenerator:", 0);
        -[CoreDAVXMLElementGenerator element](self, "element");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v45;
        -[CoreDAVXMLElementGenerator notifyElement:ofAttributesFound:](self, "notifyElement:ofAttributesFound:", v49, v45);

      }
      else
      {
        if (-[CoreDAVXMLElementGenerator isExpectedNameSpace:andElementName:](v47, "isExpectedNameSpace:andElementName:", v14, v13))
        {
          objc_msgSend(v12, "setDelegate:", v48);
          -[CoreDAVXMLElementGenerator parser:didStartElement:namespaceURI:qualifiedName:attributes:](v48, "parser:didStartElement:namespaceURI:qualifiedName:attributes:", v12, v13, v14, v15, v45);
        }
        else
        {
          objc_msgSend(v12, "setRootErrorGenerator:", 0);
          objc_msgSend(v12, "abortParsing");
          -[CoreDAVXMLElementGenerator noteChildCascadingFailure](self, "noteChildCascadingFailure");
        }

        v16 = v45;
      }
      goto LABEL_31;
    }
  }
  -[CoreDAVXMLElementGenerator cachedElementParseRules](self, "cachedElementParseRules");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[CoreDAVXMLElementGenerator element](self, "element");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copyParseRules");

    -[CoreDAVXMLElementGenerator setCachedElementParseRules:](self, "setCachedElementParseRules:", v20);
  }
  v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@:%@"), v14, v13);
  -[CoreDAVXMLElementGenerator cachedElementParseRules](self, "cachedElementParseRules");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)v21;
  objc_msgSend(v22, "objectForKey:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v23, "objectClass")), "initWithNameSpace:andName:", v14, v13);
    -[CoreDAVXMLElementGenerator baseURL](self, "baseURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "parserSuggestsBaseURL:", v25);

    v26 = -[CoreDAVXMLElementGenerator initWithParser:parentGenerator:parentElementSetter:element:]([CoreDAVXMLElementGenerator alloc], "initWithParser:parentGenerator:parentElementSetter:element:", v12, self, objc_msgSend(v23, "setterMethod"), v24);
    -[CoreDAVXMLElementGenerator notifyElement:ofAttributesFound:](self, "notifyElement:ofAttributesFound:", v24, v16);
    -[CoreDAVXMLElementGenerator setCurrentlyParsingSubItem:](self, "setCurrentlyParsingSubItem:", v26);

  }
  else
  {
    v53 = v12;
    v50 = self;
    v51 = v16;
    v52 = v15;
    v27 = v13;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v12, "parseHints");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v56;
LABEL_11:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v56 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v32);
        objc_msgSend(v33, "nameSpace");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqualToString:", v34) & 1) != 0)
        {
          objc_msgSend(v33, "name");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v27, "isEqualToString:", v35);

          if ((v36 & 1) != 0)
          {
            v37 = v33;

            if (!v37)
              goto LABEL_28;
            v13 = v27;
            v15 = v52;
            v12 = v53;
            v16 = v51;
            if (!-[CoreDAVItem parseClass](v37, "parseClass"))
            {
              +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "logHandleForAccountInfoProvider:", 0);
              v39 = objc_claimAutoreleasedReturnValue();
              v40 = v39;
              if (v39 && os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v60 = v37;
                _os_log_impl(&dword_209602000, v40, OS_LOG_TYPE_ERROR, "\n\n\nHEY YOU GUYS! This parse rule is missing a parse class.  This parse will go poorly. Parse rule %@\n\n\n", buf, 0xCu);
              }

            }
            v41 = (CoreDAVXMLElementGenerator *)objc_msgSend(objc_alloc((Class)-[CoreDAVItem parseClass](v37, "parseClass")), "initWithNameSpace:andName:", v14, v13);
            -[CoreDAVXMLElementGenerator baseURL](v50, "baseURL");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVXMLElementGenerator parserSuggestsBaseURL:](v41, "parserSuggestsBaseURL:", v42);

            v43 = -[CoreDAVXMLElementGenerator initWithParser:parentGenerator:parentElementSetter:element:]([CoreDAVXMLElementGenerator alloc], "initWithParser:parentGenerator:parentElementSetter:element:", v53, v50, 0, v41);
            -[CoreDAVXMLElementGenerator setIsUnrecognized:](v43, "setIsUnrecognized:", 1);
            -[CoreDAVXMLElementGenerator notifyElement:ofAttributesFound:](v50, "notifyElement:ofAttributesFound:", v41, v51);
            -[CoreDAVXMLElementGenerator setCurrentlyParsingSubItem:](v50, "setCurrentlyParsingSubItem:", v43);

            goto LABEL_29;
          }
        }
        else
        {

        }
        if (v30 == ++v32)
        {
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
          if (v30)
            goto LABEL_11;
          break;
        }
      }
    }

LABEL_28:
    v13 = v27;
    v37 = -[CoreDAVItem initWithNameSpace:andName:]([CoreDAVItem alloc], "initWithNameSpace:andName:", v14, v27);
    -[CoreDAVXMLElementGenerator baseURL](v50, "baseURL");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVItem parserSuggestsBaseURL:](v37, "parserSuggestsBaseURL:", v44);

    v12 = v53;
    v41 = -[CoreDAVXMLElementGenerator initWithParser:parentGenerator:parentElementSetter:element:]([CoreDAVXMLElementGenerator alloc], "initWithParser:parentGenerator:parentElementSetter:element:", v53, v50, 0, v37);
    -[CoreDAVXMLElementGenerator setIsUnrecognized:](v41, "setIsUnrecognized:", 1);
    v16 = v51;
    -[CoreDAVXMLElementGenerator notifyElement:ofAttributesFound:](v50, "notifyElement:ofAttributesFound:", v37, v51);
    -[CoreDAVXMLElementGenerator setCurrentlyParsingSubItem:](v50, "setCurrentlyParsingSubItem:", v41);
    v15 = v52;
LABEL_29:

    v23 = 0;
  }

LABEL_31:
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void (*v22)(void *, const char *, void *);
  const char *v23;
  void *v24;
  id v25;

  v25 = a3;
  if (!-[CoreDAVXMLElementGenerator isExpectedNameSpace:andElementName:](self, "isExpectedNameSpace:andElementName:", a5, a4))
  {
    objc_msgSend(v25, "abortParsing");
    -[CoreDAVXMLElementGenerator noteChildCascadingFailure](self, "noteChildCascadingFailure");
LABEL_15:
    v15 = v25;
    goto LABEL_16;
  }
  -[CoreDAVXMLElementGenerator setParsingState:](self, "setParsingState:", 2);
  -[CoreDAVXMLElementGenerator cDATA](self, "cDATA");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CoreDAVXMLElementGenerator setParsingState:](self, "setParsingState:", 2);
    -[CoreDAVXMLElementGenerator element](self, "element");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVXMLElementGenerator cDATA](self, "cDATA");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CoreDAVXMLElementGenerator characters](self, "characters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_8;
    -[CoreDAVXMLElementGenerator setParsingState:](self, "setParsingState:", 2);
    -[CoreDAVXMLElementGenerator element](self, "element");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVXMLElementGenerator characters](self, "characters");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v11;
  objc_msgSend(v10, "parserFoundPayload:", v11);

LABEL_8:
  v14 = -[CoreDAVXMLElementGenerator tracksRootElement](self, "tracksRootElement");
  v15 = v25;
  if (!v14)
  {
    v16 = -[CoreDAVXMLElementGenerator isUnrecognized](self, "isUnrecognized");
    -[CoreDAVXMLElementGenerator parentGenerator](self, "parentGenerator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "element");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[CoreDAVXMLElementGenerator element](self, "element");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "parserFoundUnrecognizedElement:", v19);

      v20 = v18;
      v18 = v17;
    }
    else
    {

      v21 = objc_msgSend(v18, "methodForSelector:", -[CoreDAVXMLElementGenerator parentElementSetter](self, "parentElementSetter"));
      if (!v21)
      {
LABEL_14:

        -[CoreDAVXMLElementGenerator parentGenerator](self, "parentGenerator");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setDelegate:", v24);

        goto LABEL_15;
      }
      v22 = (void (*)(void *, const char *, void *))v21;
      v23 = -[CoreDAVXMLElementGenerator parentElementSetter](self, "parentElementSetter");
      -[CoreDAVXMLElementGenerator element](self, "element");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22(v18, v23, v20);
    }

    goto LABEL_14;
  }
LABEL_16:

}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = a4;
  -[CoreDAVXMLElementGenerator characters](self, "characters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    -[CoreDAVXMLElementGenerator setCharacters:](self, "setCharacters:", v7);

  }
  -[CoreDAVXMLElementGenerator characters](self, "characters");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "appendData:", v8);
}

- (void)parser:(id)a3 foundCDATA:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v5 = a4;
  -[CoreDAVXMLElementGenerator cDATA](self, "cDATA");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    -[CoreDAVXMLElementGenerator setCDATA:](self, "setCDATA:", v7);

  }
  -[CoreDAVXMLElementGenerator cDATA](self, "cDATA");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendData:", v5);

}

- (void)parserDidEndDocument:(id)a3
{
  -[CoreDAVXMLElementGenerator setParsingState:](self, "setParsingState:", 2);
}

- (void)noteChildCascadingFailure
{
  id v3;

  -[CoreDAVXMLElementGenerator setParsingState:](self, "setParsingState:", 4);
  -[CoreDAVXMLElementGenerator parentGenerator](self, "parentGenerator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteChildCascadingFailure");

}

- (void)resumeParsingWithParser:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[CoreDAVXMLElementGenerator parsingState](self, "parsingState") == 1)
  {
    -[CoreDAVXMLElementGenerator currentlyParsingSubItem](self, "currentlyParsingSubItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CoreDAVXMLElementGenerator currentlyParsingSubItem](self, "currentlyParsingSubItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resumeParsingWithParser:", v6);

    }
    else
    {
      objc_msgSend(v6, "setDelegate:", self);
    }
  }

}

- (BOOL)isUnrecognized
{
  return self->_isUnrecognized;
}

- (void)setIsUnrecognized:(BOOL)a3
{
  self->_isUnrecognized = a3;
}

- (int)parsingState
{
  return self->_parsingState;
}

- (void)setParsingState:(int)a3
{
  self->_parsingState = a3;
}

- (SEL)parentElementSetter
{
  return self->_parentElementSetter;
}

- (void)setParentElementSetter:(SEL)a3
{
  self->_parentElementSetter = a3;
}

- (NSMutableData)characters
{
  return self->_characters;
}

- (void)setCharacters:(id)a3
{
  objc_storeStrong((id *)&self->_characters, a3);
}

- (NSMutableData)cDATA
{
  return self->_cDATA;
}

- (void)setCDATA:(id)a3
{
  objc_storeStrong((id *)&self->_cDATA, a3);
}

- (CoreDAVXMLElementGenerator)currentlyParsingSubItem
{
  return self->_currentlyParsingSubItem;
}

- (void)setCurrentlyParsingSubItem:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyParsingSubItem, a3);
}

- (CoreDAVItem)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
  objc_storeStrong((id *)&self->_element, a3);
}

- (CoreDAVXMLElementGenerator)parentGenerator
{
  return (CoreDAVXMLElementGenerator *)objc_loadWeakRetained((id *)&self->_parentGenerator);
}

- (void)setParentGenerator:(id)a3
{
  objc_storeWeak((id *)&self->_parentGenerator, a3);
}

- (NSDictionary)cachedElementParseRules
{
  return self->_cachedElementParseRules;
}

- (void)setCachedElementParseRules:(id)a3
{
  objc_storeStrong((id *)&self->_cachedElementParseRules, a3);
}

- (BOOL)checkedElementValidityIfRootElement
{
  return self->_checkedElementValidityIfRootElement;
}

- (void)setCheckedElementValidityIfRootElement:(BOOL)a3
{
  self->_checkedElementValidityIfRootElement = a3;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_cachedElementParseRules, 0);
  objc_storeStrong((id *)&self->_currentlyParsingSubItem, 0);
  objc_storeStrong((id *)&self->_cDATA, 0);
  objc_storeStrong((id *)&self->_characters, 0);
  objc_destroyWeak((id *)&self->_parentGenerator);
  objc_storeStrong((id *)&self->_parentElement, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

@end
