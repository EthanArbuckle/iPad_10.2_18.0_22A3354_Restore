@implementation ENMLWriter

- (ENMLWriter)init
{
  ENMLWriter *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ENMLWriter;
  v2 = -[ENXMLWriter init](&v5, sel_init);
  if (v2)
  {
    +[ENXMLDTD enml2dtd](ENXMLDTD, "enml2dtd");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENXMLWriter setDtd:](v2, "setDtd:", v3);

  }
  return v2;
}

- (void)startDocumentWithAttributes:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ENMLWriter;
  v4 = a3;
  -[ENXMLWriter startDocument](&v5, sel_startDocument);
  -[ENMLWriter startElement:attributes:](self, "startElement:attributes:", CFSTR("en-note"), v4, v5.receiver, v5.super_class);

}

- (void)startDocument
{
  -[ENMLWriter startDocumentWithAttributes:](self, "startDocumentWithAttributes:", 0);
}

- (void)endDocument
{
  objc_super v3;

  -[ENXMLWriter endElement](self, "endElement");
  v3.receiver = self;
  v3.super_class = (Class)ENMLWriter;
  -[ENXMLWriter endDocument](&v3, sel_endDocument);
}

- (id)validateURLAttribute:(id)a3 inAttributes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (+[ENMLWriter validateURLComponents:](ENMLWriter, "validateURLComponents:", v8))
    {
      objc_msgSend(v8, "absoluteString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v10, v5);

    }
    else
    {
      NSLog(CFSTR("Unable to validate URL:%@ in attributes:%@"), v7, v6);
      objc_msgSend(v9, "removeObjectForKey:", v5);
    }

  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (BOOL)startElement:(id)a3 attributes:(id)a4
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
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("a")))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v14, "hasPrefix:", CFSTR("x-apple-")))
            objc_msgSend(v8, "removeObjectForKey:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }
    -[ENMLWriter validateURLAttribute:inAttributes:](self, "validateURLAttribute:inAttributes:", CFSTR("href"), v8);
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v15;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("img")))
  {
    -[ENMLWriter validateURLAttribute:inAttributes:](self, "validateURLAttribute:inAttributes:", CFSTR("src"), v7);
    v16 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v16;
  }
  v19.receiver = self;
  v19.super_class = (Class)ENMLWriter;
  v17 = -[ENXMLWriter startElement:attributes:](&v19, sel_startElement_attributes_, v6, v7);

  return v17;
}

- (void)writeResourceWithDataHash:(id)a3 mime:(id)a4 attributes:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;

  v13 = (__CFString *)a4;
  v8 = (void *)MEMORY[0x24BDBCED8];
  v9 = a3;
  objc_msgSend(v8, "dictionaryWithDictionary:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = CFSTR("application/octet-stream");
    v11 = CFSTR("application/octet-stream");
  }
  objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("type"));
  objc_msgSend(v9, "enlowercaseHexDigits");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("hash"));
  -[ENXMLWriter writeElement:attributes:content:](self, "writeElement:attributes:content:", CFSTR("en-media"), v10, 0);

}

- (void)writeResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "data");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bodyHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ENMLWriter writeResourceWithDataHash:mime:attributes:](self, "writeResourceWithDataHash:mime:attributes:", v5, v6, 0);
}

- (void)writeEncryptedInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cipher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("cipher"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "keyLength"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("length"));
  objc_msgSend(v10, "hint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("hint"));
  objc_msgSend(v10, "cipherText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENXMLWriter writeElement:attributes:content:](self, "writeElement:attributes:content:", CFSTR("en-crypt"), v4, v9);

}

- (void)writeTodoWithCheckedState:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("true"), CFSTR("checked"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[ENXMLWriter writeElement:attributes:content:](self, "writeElement:attributes:content:", CFSTR("en-todo"), v4, 0);

}

+ (BOOL)validateURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "rangeOfString:", CFSTR("script")) != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_7;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("file")) & 1) != 0)
    {
LABEL_4:
      v6 = 1;
LABEL_8:

      goto LABEL_9;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("x-apple-data-detectors")) & 1) != 0)
    {
LABEL_7:
      v6 = 0;
      goto LABEL_8;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("tel")) & 1) != 0)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x24BDD1798], "enRegexWithPattern:", CFSTR("^(([^:/?#]+):)?(//([^/?#]*))?([^?#]*)(\\?([^#]*))?(#(.*))?"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enCapturedSubstringsOfString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10 || objc_msgSend(v10, "count") != 10)
    {
      v6 = 0;
LABEL_45:

      goto LABEL_8;
    }
    objc_msgSend(v10, "objectAtIndex:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "scheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v11, "enIsEqualToStringOrNil:", v12);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(v4, "scheme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Scheme '%@' does not match scheme '%@'"), v11, v13);

    }
    objc_msgSend(v10, "objectAtIndex:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "user");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {

    }
    else
    {
      objc_msgSend(v4, "password");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        goto LABEL_24;
    }
    objc_msgSend(v4, "user");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "user");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appendString:", v19);

    }
    objc_msgSend(v4, "password");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v15, "appendString:", CFSTR(":"));
      objc_msgSend(v4, "password");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appendString:", v21);

    }
    objc_msgSend(v15, "appendString:", CFSTR("@"));
LABEL_24:
    objc_msgSend(v4, "host");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "host");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appendString:", v23);

    }
    objc_msgSend(v4, "port");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v15, "appendString:", CFSTR(":"));
      objc_msgSend(v4, "port");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appendFormat:", CFSTR("%@"), v25);

    }
    if ((objc_msgSend(v14, "enIsEqualToStringOrNil:", v15) & 1) == 0)
    {
      NSLog(CFSTR("Authority '%@' does not match authority '%@'"), v14, v15);
      v6 = 0;
    }
    objc_msgSend(v10, "objectAtIndex:", 5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringByReplacingPercentEscapesUsingEncoding:", 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "path");
    v28 = objc_claimAutoreleasedReturnValue();
    v42 = v14;
    v43 = v11;
    v41 = (void *)v28;
    if ((objc_msgSend(v27, "enIsEqualToStringOrNil:", v28) & 1) != 0)
      goto LABEL_40;
    if (objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("mailto")))
    {
      if (objc_msgSend(v27, "hasSuffix:", CFSTR("/")))
      {
        objc_msgSend(v27, "substringToIndex:", objc_msgSend(v27, "length") - 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v29, "enIsEqualToStringOrNil:", v28) & 1) == 0)
        {
          NSLog(CFSTR("Path '%@' does not match path '%@'"), v29, v28);
          v6 = 0;
        }
        v27 = v29;
        goto LABEL_40;
      }
      NSLog(CFSTR("Path '%@' does not match path '%@'"), v27, v28);
    }
    else
    {
      objc_msgSend(v4, "resourceSpecifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v27, "enIsEqualToStringOrNil:", v30);

      if ((v31 & 1) != 0)
      {
LABEL_40:
        objc_msgSend(v10, "objectAtIndex:", 7);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "query");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v33, "enIsEqualToStringOrNil:", v34);

        if ((v35 & 1) == 0)
        {
          objc_msgSend(v4, "query");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("Query '%@' does not match query '%@'"), v33, v36);

          v6 = 0;
        }
        objc_msgSend(v10, "objectAtIndex:", 9);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fragment");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v37, "enIsEqualToStringOrNil:", v38);

        if ((v39 & 1) == 0)
        {
          objc_msgSend(v4, "fragment");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("Fragment '%@' does not match fragment '%@'"), v37, v40);

          v6 = 0;
        }

        v5 = v43;
        goto LABEL_45;
      }
      objc_msgSend(v4, "resourceSpecifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Path '%@' does not match resource specifier '%@'"), v27, v32);

    }
    v6 = 0;
    goto LABEL_40;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

+ (id)emptyNote
{
  ENMLWriter *v2;
  void *v3;

  v2 = objc_alloc_init(ENMLWriter);
  -[ENMLWriter startDocument](v2, "startDocument");
  -[ENMLWriter endDocument](v2, "endDocument");
  -[ENXMLWriter contents](v2, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
