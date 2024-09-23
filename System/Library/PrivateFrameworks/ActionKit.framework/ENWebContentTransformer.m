@implementation ENWebContentTransformer

- (ENWebContentTransformer)init
{
  ENWebContentTransformer *v2;
  ENWebContentTransformer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ENWebContentTransformer;
  v2 = -[ENWebContentTransformer init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ENWebContentTransformer setSkipTags:](v2, "setSkipTags:", &unk_24F93C258);
    -[ENWebContentTransformer setIgnorableTags:](v3, "setIgnorableTags:", &unk_24F93C270);
    -[ENWebContentTransformer setIgnorableAttributes:](v3, "setIgnorableAttributes:", &unk_24F93C288);
    -[ENWebContentTransformer setInlineElements:](v3, "setInlineElements:", &unk_24F93C2A0);
  }
  return v3;
}

- (id)transformedValue:(id)a3
{
  id v4;
  ENNote *v5;
  ENMLWriter *v6;
  void *v7;
  ENXMLSaxParser *v8;
  char isKindOfClass;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ENNoteContent *v16;
  void *v17;
  ENNoteContent *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  ENNote *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v4 = a3;
  v5 = objc_alloc_init(ENNote);
  -[ENWebContentTransformer setNote:](self, "setNote:", v5);
  v6 = objc_alloc_init(ENMLWriter);
  -[ENMLWriter startDocument](v6, "startDocument");
  -[ENWebContentTransformer setEnmlWriter:](self, "setEnmlWriter:", v6);
  +[ENXMLDTD enml2dtd](ENXMLDTD, "enml2dtd");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENWebContentTransformer setEnmlDTD:](self, "setEnmlDTD:", v7);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = objc_alloc_init(ENXMLSaxParser);
    -[ENXMLSaxParser setIsHTML:](v8, "setIsHTML:", 1);
    -[ENXMLSaxParser setDelegate:](v8, "setDelegate:", self);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v10 = v4;
    if ((isKindOfClass & 1) != 0)
    {
      -[ENWebContentTransformer htmlFromWebArchive:](self, "htmlFromWebArchive:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mainResource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENWebContentTransformer setBaseURL:](self, "setBaseURL:", v13);

      -[ENWebContentTransformer setWebArchive:](self, "setWebArchive:", v10);
      v10 = (id)v11;
    }
    -[ENWebContentTransformer baseURL](self, "baseURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENWebContentTransformer archiveBaseURLFromURL:](self, "archiveBaseURLFromURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENWebContentTransformer setArchiveBaseURL:](self, "setArchiveBaseURL:", v15);

    -[ENXMLSaxParser parseContents:](v8, "parseContents:", v10);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = 0;
      goto LABEL_10;
    }
    v8 = objc_alloc_init(ENResource);
    -[ENWebContentTransformer baseURL](self, "baseURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "absoluteString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENXMLSaxParser setSourceUrl:](v8, "setSourceUrl:", v29);

    -[ENWebContentTransformer baseURL](self, "baseURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENWebContentTransformer filenameFromURL:](self, "filenameFromURL:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENXMLSaxParser setFilename:](v8, "setFilename:", v31);

    -[ENXMLSaxParser setData:](v8, "setData:", v4);
    -[ENWebContentTransformer mimeType](self, "mimeType");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      -[ENXMLSaxParser filename](v8, "filename");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENWebContentTransformer mimeTypeFromFilename:](self, "mimeTypeFromFilename:", v32);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[ENXMLSaxParser setMimeType:](v8, "setMimeType:", v10);
    -[ENWebContentTransformer note](self, "note");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addResource:", v8);

    -[ENXMLSaxParser dataHash](v8, "dataHash");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENXMLSaxParser mimeType](v8, "mimeType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENMLWriter writeResourceWithDataHash:mime:attributes:](v6, "writeResourceWithDataHash:mime:attributes:", v34, v35, 0);

  }
  -[ENMLWriter endDocument](v6, "endDocument");
  v16 = [ENNoteContent alloc];
  -[ENXMLWriter contents](v6, "contents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[ENNoteContent initWithENML:](v16, "initWithENML:", v17);
  -[ENNote setContent:](v5, "setContent:", v18);

  -[ENWebContentTransformer baseURL](self, "baseURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "absoluteString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENNote setSourceUrl:](v5, "setSourceUrl:", v20);

  -[ENWebContentTransformer title](self, "title");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    -[ENNote sourceUrl](v5, "sourceUrl");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      v22 = (void *)MEMORY[0x24BDD1488];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "pathForResource:ofType:", CFSTR("ENSDKResources"), CFSTR("bundle"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bundleWithPath:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Untitled"), &stru_24F8BBA48, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  -[ENNote setTitle:](v5, "setTitle:", v21);
  v26 = v5;

LABEL_10:
  return v26;
}

- (id)htmlFromWebArchive:(id)a3
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  CFStringEncoding v6;
  unint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "mainResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textEncodingName");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = (__CFString *)v4;
  else
    v5 = CFSTR("UTF-8");
  v6 = CFStringConvertIANACharSetNameToEncoding(v5);
  v7 = CFStringConvertEncodingToNSStringEncoding(v6);
  objc_msgSend(v3, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, v7);
  else
    v9 = 0;

  return v9;
}

- (id)archiveBaseURLFromURL:(id)a3
{
  const __CFURL *v3;
  const __CFURL *v4;
  __CFString *PathComponent;
  void *v6;
  int v7;
  CFURLRef v8;
  CFURLRef v9;

  v3 = (const __CFURL *)a3;
  v4 = v3;
  if (v3)
  {
    PathComponent = (__CFString *)CFURLCopyLastPathComponent(v3);
    -[__CFURL scheme](v4, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(CFSTR("file"), "isEqualToString:", v6))
    {
      v7 = objc_msgSend(CFSTR("/"), "isEqualToString:", PathComponent);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    if (-[__CFString length](PathComponent, "length") && CFURLHasDirectoryPath(v4) != 1)
    {
      v9 = CFURLCreateCopyDeletingLastPathComponent(0, v4);
      goto LABEL_11;
    }
LABEL_9:
    v9 = v4;
LABEL_11:
    v8 = v9;

    goto LABEL_12;
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (id)sanitizeURLAttribute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  char v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "stringByReplacingPercentEscapesUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAddingPercentEscapesUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDBCF48];
    -[ENWebContentTransformer baseURL](self, "baseURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:relativeToURL:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[ENMLWriter validateURLComponents:](ENMLWriter, "validateURLComponents:", v10))
    {
      v11 = v10;
    }
    else
    {
      -[ENWebContentTransformer webArchive](self, "webArchive");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subresources");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v15 = v13;
      v11 = (id)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
      {
        v21 = v6;
        v16 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v23 != v16)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "URL");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqual:", v14);

            if ((v19 & 1) != 0)
            {
              v11 = v14;
              goto LABEL_15;
            }
          }
          v11 = (id)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v11)
            continue;
          break;
        }
LABEL_15:
        v6 = v21;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)filenameFromURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (CFURLHasDirectoryPath((CFURLRef)v3))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)mimeTypeFromFilename:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;

  v3 = a3;
  if (!v3
    || (+[ENMIMEUtils determineMIMETypeForFile:](ENMIMEUtils, "determineMIMETypeForFile:", v3),
        (v4 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = CFSTR("application/octet-stream");
    v5 = CFSTR("application/octet-stream");
  }

  return v4;
}

- (id)resourceFromWebResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ENResource *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    v7 = objc_alloc_init(ENResource);
    objc_msgSend(v4, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENResource setSourceUrl:](v7, "setSourceUrl:", v9);

    -[ENWebContentTransformer filenameFromURL:](self, "filenameFromURL:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENResource setFilename:](v7, "setFilename:", v10);

    -[ENResource setData:](v7, "setData:", v6);
    objc_msgSend(v4, "MIMEType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11 || !objc_msgSend(v11, "length"))
    {
      -[ENResource filename](v7, "filename");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENWebContentTransformer mimeTypeFromFilename:](self, "mimeTypeFromFilename:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }
    -[ENResource setMimeType:](v7, "setMimeType:", v12);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)parser:(id)a3 didStartElement:(id)a4 attributes:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  ENWebContentTransformer *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  int v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __CFString *v56;
  id v57;
  id v58;
  id obj;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[ENWebContentTransformer baseURL](self, "baseURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
LABEL_2:

    goto LABEL_3;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("base")))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("href"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENWebContentTransformer setBaseURL:](self, "setBaseURL:", v11);

    }
    goto LABEL_2;
  }
LABEL_3:
  -[ENWebContentTransformer title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    goto LABEL_10;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("title")))
  {
LABEL_10:
    if (-[ENWebContentTransformer ignoreElementCount](self, "ignoreElementCount"))
    {
      v12 = -[ENWebContentTransformer ignoreElementCount](self, "ignoreElementCount") + 1;
      v13 = self;
LABEL_12:
      -[ENWebContentTransformer setIgnoreElementCount:](v13, "setIgnoreElementCount:", v12);
      goto LABEL_54;
    }
    -[ENWebContentTransformer skipTags](self, "skipTags");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v7);

    if ((v15 & 1) != 0)
      goto LABEL_54;
    -[ENWebContentTransformer ignorableTags](self, "ignorableTags");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v7);

    if (v17)
    {
      v13 = self;
      v12 = 1;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v58 = v8;
    v19 = v8;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v66 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
          -[ENWebContentTransformer ignorableAttributes](self, "ignorableAttributes");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "containsObject:", v24);

          if (v26)
            objc_msgSend(v18, "removeObjectForKey:", v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      }
      while (v21);
    }

    v27 = (__CFString *)v7;
    if (-[__CFString isEqualToString:](v27, "isEqualToString:", CFSTR("img")))
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("src"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENWebContentTransformer sanitizeURLAttribute:](self, "sanitizeURLAttribute:", v28);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v60)
      {
        -[ENWebContentTransformer setIgnoreElementCount:](self, "setIgnoreElementCount:", 1);
        v8 = v58;
LABEL_48:

        goto LABEL_53;
      }
      v55 = v28;
      v56 = v27;
      v57 = v7;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      -[ENWebContentTransformer webArchive](self, "webArchive");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "subresources");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v30;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v62;
        while (2)
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v62 != v33)
              objc_enumerationMutation(obj);
            v35 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
            objc_msgSend(v35, "URL");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "absoluteString");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "absoluteString");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v37, "isEqualToString:", v38);

            if (v39)
            {
              -[ENWebContentTransformer resourceFromWebResource:](self, "resourceFromWebResource:", v35);
              v40 = objc_claimAutoreleasedReturnValue();
              if (v40)
              {
                v50 = (void *)v40;
                -[ENWebContentTransformer note](self, "note");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "addResource:", v50);

                objc_msgSend(v18, "removeObjectForKey:", CFSTR("src"));
                -[ENWebContentTransformer enmlWriter](self, "enmlWriter");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "dataHash");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "mimeType");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "writeResourceWithDataHash:mime:attributes:", v53, v54, v18);

                -[ENWebContentTransformer setIgnoreElementCount:](self, "setIgnoreElementCount:", 1);
                v7 = v57;
                v8 = v58;
                v28 = v55;
                v27 = v56;
                goto LABEL_48;
              }
            }
          }
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
          if (v32)
            continue;
          break;
        }
      }

      objc_msgSend(v60, "absoluteString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v41, CFSTR("src"));

      v7 = v57;
      v8 = v58;
      v27 = v56;
    }
    else if (-[__CFString isEqualToString:](v27, "isEqualToString:", CFSTR("a")))
    {
      objc_msgSend(v19, "objectForKey:", CFSTR("href"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v58;
      if (v42)
      {
        -[ENWebContentTransformer sanitizeURLAttribute:](self, "sanitizeURLAttribute:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v43;
        if (v43)
        {
          objc_msgSend(v43, "absoluteString");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v45, CFSTR("href"));

        }
        else
        {
          objc_msgSend(v18, "removeObjectForKey:", CFSTR("href"));
        }

      }
    }
    else
    {
      -[ENWebContentTransformer enmlDTD](self, "enmlDTD");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "isElementLegal:", v27);

      if ((v47 & 1) == 0)
      {
        -[ENWebContentTransformer inlineElements](self, "inlineElements");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "containsObject:", v27);

        if (v49)
          v27 = CFSTR("span");
        else
          v27 = CFSTR("div");
      }
      v8 = v58;
    }
    -[ENWebContentTransformer enmlWriter](self, "enmlWriter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "startElement:attributes:", v27, v18);
LABEL_53:

    goto LABEL_54;
  }
  -[ENWebContentTransformer setInTitleElement:](self, "setInTitleElement:", 1);
  -[ENWebContentTransformer setTitle:](self, "setTitle:", &stru_24F8BBA48);
LABEL_54:

}

- (void)parser:(id)a3 didEndElement:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  if (-[ENWebContentTransformer inTitleElement](self, "inTitleElement")
    && objc_msgSend(v8, "isEqualToString:", CFSTR("title")))
  {
    -[ENWebContentTransformer setInTitleElement:](self, "setInTitleElement:", 0);
  }
  else if (-[ENWebContentTransformer ignoreElementCount](self, "ignoreElementCount"))
  {
    -[ENWebContentTransformer setIgnoreElementCount:](self, "setIgnoreElementCount:", -[ENWebContentTransformer ignoreElementCount](self, "ignoreElementCount") - 1);
  }
  else
  {
    -[ENWebContentTransformer skipTags](self, "skipTags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v8);

    if ((v6 & 1) == 0)
    {
      -[ENWebContentTransformer enmlWriter](self, "enmlWriter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endElement");

    }
  }

}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  if (-[ENWebContentTransformer inTitleElement](self, "inTitleElement"))
  {
    -[ENWebContentTransformer title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENWebContentTransformer setTitle:](self, "setTitle:", v6);

LABEL_5:
    goto LABEL_6;
  }
  if (!-[ENWebContentTransformer ignoreElementCount](self, "ignoreElementCount"))
  {
    -[ENWebContentTransformer enmlWriter](self, "enmlWriter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeString:", v7);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)parser:(id)a3 didFailWithError:(id)a4
{
  NSLog(CFSTR("%s %@"), a2, a3, "-[ENWebContentTransformer parser:didFailWithError:]", a4);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
  objc_storeStrong((id *)&self->_mimeType, a3);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (ENXMLSaxParser)htmlParser
{
  return self->_htmlParser;
}

- (void)setHtmlParser:(id)a3
{
  objc_storeStrong((id *)&self->_htmlParser, a3);
}

- (ENMLWriter)enmlWriter
{
  return self->_enmlWriter;
}

- (void)setEnmlWriter:(id)a3
{
  objc_storeStrong((id *)&self->_enmlWriter, a3);
}

- (ENXMLDTD)enmlDTD
{
  return self->_enmlDTD;
}

- (void)setEnmlDTD:(id)a3
{
  objc_storeStrong((id *)&self->_enmlDTD, a3);
}

- (NSURL)archiveBaseURL
{
  return self->_archiveBaseURL;
}

- (void)setArchiveBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_archiveBaseURL, a3);
}

- (ENWebArchive)webArchive
{
  return self->_webArchive;
}

- (void)setWebArchive:(id)a3
{
  objc_storeStrong((id *)&self->_webArchive, a3);
}

- (ENNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (NSArray)ignorableTags
{
  return self->_ignorableTags;
}

- (void)setIgnorableTags:(id)a3
{
  objc_storeStrong((id *)&self->_ignorableTags, a3);
}

- (NSArray)ignorableAttributes
{
  return self->_ignorableAttributes;
}

- (void)setIgnorableAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_ignorableAttributes, a3);
}

- (NSArray)skipTags
{
  return self->_skipTags;
}

- (void)setSkipTags:(id)a3
{
  objc_storeStrong((id *)&self->_skipTags, a3);
}

- (NSArray)inlineElements
{
  return self->_inlineElements;
}

- (void)setInlineElements:(id)a3
{
  objc_storeStrong((id *)&self->_inlineElements, a3);
}

- (unint64_t)ignoreElementCount
{
  return self->_ignoreElementCount;
}

- (void)setIgnoreElementCount:(unint64_t)a3
{
  self->_ignoreElementCount = a3;
}

- (BOOL)inTitleElement
{
  return self->_inTitleElement;
}

- (void)setInTitleElement:(BOOL)a3
{
  self->_inTitleElement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineElements, 0);
  objc_storeStrong((id *)&self->_skipTags, 0);
  objc_storeStrong((id *)&self->_ignorableAttributes, 0);
  objc_storeStrong((id *)&self->_ignorableTags, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_webArchive, 0);
  objc_storeStrong((id *)&self->_archiveBaseURL, 0);
  objc_storeStrong((id *)&self->_enmlDTD, 0);
  objc_storeStrong((id *)&self->_enmlWriter, 0);
  objc_storeStrong((id *)&self->_htmlParser, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

@end
