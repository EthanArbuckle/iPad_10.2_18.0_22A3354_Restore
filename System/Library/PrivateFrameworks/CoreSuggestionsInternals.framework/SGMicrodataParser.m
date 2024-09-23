@implementation SGMicrodataParser

- (SGMicrodataParser)initWithDocument:(id)a3
{
  id v4;
  SGMicrodataParser *v5;
  SGMicrodataParserStackItem *v6;
  SGMicrodataParserStackItem *stackItem;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGMicrodataParser;
  v5 = -[SGMicrodataParser init](&v9, sel_init);
  if (v5)
  {
    v6 = -[SGMicrodataParserStackItem initWithDocument:]([SGMicrodataParserStackItem alloc], "initWithDocument:", v4);
    stackItem = v5->_stackItem;
    v5->_stackItem = v6;

  }
  return v5;
}

- (void)startElement:(id)a3 withAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
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
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  __CFString *v29;
  SGMicrodataItem *v30;
  const __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  SGMicrodataItemProp *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  SGMicrodataParserStackItem *v48;
  SGMicrodataParserStackItem *stackItem;
  void *v50;
  SGMicrodataParserStackItem *v51;
  SGMicrodataParserStackItem *v52;
  void *v53;
  int v54;
  void *v55;
  __CFString *v56;
  SGMicrodataItem *v57;
  void *v58;
  void *context;
  void *v60;
  void *v61;
  id obj;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  context = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v6, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v6;
  LOBYTE(v6) = objc_msgSend(v6, "isEqualToString:", v8);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMicrodataParser.m"), 65, CFSTR("libxml tag names should always be lowercase during HTML parsing"));

  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v61 = v7;
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v73 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(v14, "lowercaseString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v14) = objc_msgSend(v14, "isEqualToString:", v15);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMicrodataParser.m"), 68, CFSTR("libxml attribute names should always be lowercase during HTML parsing"));

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
    }
    while (v11);
  }

  -[SGMicrodataParserStackItem document](self->_stackItem, "document");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("itemprop"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMicrodataParser whitespaceSplit:](SGMicrodataParser, "whitespaceSplit:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("itemscope"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = v17;
  if (!v20)
  {
    if (!v19)
    {
      v29 = 0;
      goto LABEL_37;
    }
    objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("content"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = CFSTR("content");
      v28 = v61;
LABEL_18:
      objc_msgSend(v28, "objectForKeyedSubscript:", v27);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_37:
      v56 = 0;
      v57 = 0;
      goto LABEL_38;
    }
    if ((objc_msgSend(v60, "isEqualToString:", CFSTR("audio")) & 1) != 0
      || (objc_msgSend(v60, "isEqualToString:", CFSTR("embed")) & 1) != 0
      || (objc_msgSend(v60, "isEqualToString:", CFSTR("iframe")) & 1) != 0
      || (objc_msgSend(v60, "isEqualToString:", CFSTR("img")) & 1) != 0
      || (objc_msgSend(v60, "isEqualToString:", CFSTR("source")) & 1) != 0
      || (objc_msgSend(v60, "isEqualToString:", CFSTR("track")) & 1) != 0
      || objc_msgSend(v60, "isEqualToString:", CFSTR("video")))
    {
      v31 = CFSTR("src");
    }
    else if ((objc_msgSend(v60, "isEqualToString:", CFSTR("a")) & 1) != 0
           || (objc_msgSend(v60, "isEqualToString:", CFSTR("area")) & 1) != 0
           || objc_msgSend(v60, "isEqualToString:", CFSTR("link")))
    {
      v31 = CFSTR("href");
    }
    else
    {
      v54 = objc_msgSend(v60, "isEqualToString:", CFSTR("object"));
      v31 = CFSTR("data");
      if (!v54)
      {
        if ((objc_msgSend(v60, "isEqualToString:", CFSTR("data")) & 1) == 0
          && !objc_msgSend(v60, "isEqualToString:", CFSTR("meter")))
        {
          if (!objc_msgSend(v60, "isEqualToString:", CFSTR("time"))
            || (objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("datetime")),
                v55 = (void *)objc_claimAutoreleasedReturnValue(),
                v55,
                !v55))
          {
            v29 = (__CFString *)(id)objc_opt_new();
            v56 = v29;
            v57 = 0;
            goto LABEL_38;
          }
          v27 = CFSTR("datetime");
          v28 = v61;
          goto LABEL_18;
        }
        v31 = CFSTR("value");
        v32 = v61;
LABEL_34:
        objc_msgSend(v32, "objectForKeyedSubscript:", v31);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v33;
        v35 = &stru_1E7DB83A8;
        if (v33)
          v35 = (__CFString *)v33;
        v29 = v35;

        goto LABEL_37;
      }
    }
    v32 = v61;
    goto LABEL_34;
  }
  objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("itemref"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMicrodataParser whitespaceSplit:](SGMicrodataParser, "whitespaceSplit:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("itemtype"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMicrodataParser whitespaceSplit:](SGMicrodataParser, "whitespaceSplit:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v24);
  else
    v25 = 0;
  v30 = -[SGMicrodataItem initWithItemType:itemRef:]([SGMicrodataItem alloc], "initWithItemType:itemRef:", v25, v22);
  v57 = v30;
  if (v19)
  {
    v29 = v30;
  }
  else
  {
    objc_msgSend(v17, "addItem:", v30);
    v29 = 0;
  }

  v56 = 0;
LABEL_38:
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v19;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v69 != v38)
          objc_enumerationMutation(obj);
        v40 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j);
        v41 = (void *)MEMORY[0x1C3BD4F6C]();
        v42 = -[SGMicrodataItemProp initWithName:value:]([SGMicrodataItemProp alloc], "initWithName:value:", v40, v29);
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        -[SGMicrodataParserStackItem itemScopes](self->_stackItem, "itemScopes");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
        if (v44)
        {
          v45 = v44;
          v46 = *(_QWORD *)v65;
          do
          {
            for (k = 0; k != v45; ++k)
            {
              if (*(_QWORD *)v65 != v46)
                objc_enumerationMutation(v43);
              objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * k), "addItemProp:", v42, v56);
            }
            v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
          }
          while (v45);
        }

        objc_autoreleasePoolPop(v41);
      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    }
    while (v37);
  }

  v48 = [SGMicrodataParserStackItem alloc];
  stackItem = self->_stackItem;
  objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("id"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[SGMicrodataParserStackItem initWithParent:item:htmlId:textConsumer:](v48, "initWithParent:item:htmlId:textConsumer:", stackItem, v57, v50, v56);
  v52 = self->_stackItem;
  self->_stackItem = v51;

  objc_autoreleasePoolPop(context);
}

- (void)endElement
{
  SGMicrodataParserStackItem *stackItem;
  SGMicrodataParserStackItem *v4;
  SGMicrodataParserStackItem *v5;

  stackItem = self->_stackItem;
  if (stackItem)
  {
    -[SGMicrodataParserStackItem parent](stackItem, "parent");
    v4 = (SGMicrodataParserStackItem *)objc_claimAutoreleasedReturnValue();
    v5 = self->_stackItem;
    self->_stackItem = v4;

  }
}

- (void)textContent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SGMicrodataParserStackItem textConsumers](self->_stackItem, "textConsumers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "appendString:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (SGMicrodataParserStackItem)stackItem
{
  return self->_stackItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackItem, 0);
}

+ (id)whitespaceSplit:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "length", (_QWORD)v15))
            objc_msgSend(v6, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v6, "count"))
      v13 = v6;
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)parse:(id)a3
{
  id v3;
  void *v4;
  SGMicrodataParser *v5;
  xmlParserCtxt *PushParserCtxt;
  id v7;
  uint64_t v8;
  const __CFCharacterSet *Predefined;
  uint64_t v10;
  int v11;
  int v12;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = -[SGMicrodataParser initWithDocument:]([SGMicrodataParser alloc], "initWithDocument:", v4);
  PushParserCtxt = htmlCreatePushParserCtxt(&microdataSAXHandlerStruct, v5, 0, 0, 0, XML_CHAR_ENCODING_UTF8);
  htmlCtxtUseOptions(PushParserCtxt, 2099201);
  v7 = objc_retainAutorelease(v3);
  v8 = objc_msgSend(v7, "UTF8String");
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  v10 = 0;
  v11 = 0;
  while (*(_BYTE *)(v8 + v10) == 47)
  {
    if (v10 > v11 && *(_BYTE *)(v8 + (v10 + 1)) == 62)
    {
      v12 = *(unsigned __int8 *)(v8 + v10 - 1);
      if (v12 == 34 || v12 == 39 || CFCharacterSetIsCharacterMember(Predefined, (char)v12))
      {
        htmlParseChunk(PushParserCtxt, (const char *)(v8 + v11), v10 - v11, 0);
        htmlParseChunk(PushParserCtxt, "&#47;", 5, 0);
        v11 = v10 + 1;
      }
    }
LABEL_11:
    ++v10;
  }
  if (*(_BYTE *)(v8 + v10))
    goto LABEL_11;
  htmlParseChunk(PushParserCtxt, (const char *)(v8 + v11), v10 - v11, 1);
  MEMORY[0x1C3BD4E1C](PushParserCtxt);

  return v4;
}

@end
