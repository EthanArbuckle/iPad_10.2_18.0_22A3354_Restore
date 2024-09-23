@implementation BLLibraryUtility

+ (id)p_opfPathFromContainerXmlPath:(id)a3 epubPath:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  xmlDocPtr Memory;
  void *v12;

  v6 = (objc_class *)MEMORY[0x24BDBCE50];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithContentsOfFile:", v8);

  v10 = objc_retainAutorelease(v9);
  Memory = xmlReadMemory((const char *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 0, "UTF-8", 2049);

  objc_msgSend(a1, "p_opfPathFromContainerXmlDoc:epubPath:", Memory, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)p_opfPathFromContainerXmlDoc:(_xmlDoc *)a3 epubPath:(id)a4
{
  id v5;
  xmlXPathContext *v6;
  int v7;
  int v8;
  NSObject *v9;
  xmlXPathObject *v10;
  int *p_nodeNr;
  uint64_t v12;
  xmlChar *Prop;
  xmlChar *v14;
  void *v15;
  _DWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (a3)
  {
    v6 = xmlXPathNewContext(a3);
    v7 = xmlXPathRegisterNs(v6, (const xmlChar *)"a", (const xmlChar *)"urn:oasis:names:tc:opendocument:xmlns:container");
    if (v7)
    {
      v8 = v7;
      BLDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v17[0] = 67109120;
        v17[1] = v8;
        _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_ERROR, "Error xmlXPathRegisterNs: %d", (uint8_t *)v17, 8u);
      }

    }
    if (v6)
    {
      v10 = (xmlXPathObject *)MEMORY[0x2199A472C]("/a:container/a:rootfiles/a:rootfile[@media-type='application/oebps-package+xml']", v6);
      xmlXPathFreeContext(v6);
      if (v10)
      {
        p_nodeNr = &v10->nodesetval->nodeNr;
        if (p_nodeNr && *p_nodeNr && *((_QWORD *)p_nodeNr + 1))
        {
          if (*p_nodeNr < 1)
          {
LABEL_15:
            v6 = 0;
          }
          else
          {
            v12 = 0;
            while (1)
            {
              Prop = xmlGetProp(*(const xmlNode **)(*((_QWORD *)p_nodeNr + 1) + 8 * v12), (const xmlChar *)"full-path");
              if (Prop)
                break;
              if (++v12 >= *p_nodeNr)
                goto LABEL_15;
            }
            v14 = Prop;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", Prop, 4);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "stringByAppendingPathComponent:", v15);
            v6 = (xmlXPathContext *)objc_claimAutoreleasedReturnValue();
            ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v14);

          }
          xmlXPathFreeObject(v10);
          v10 = 0;
        }
        else
        {
          v6 = 0;
        }
        xmlXPathFreeObject(v10);
      }
      else
      {
        v6 = 0;
      }
    }
    xmlFreeDoc(a3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)opfPathFromFullOpfContainerPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("META-INF/container.xml"), &stru_24CE8D258);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "p_opfPathFromContainerXmlPath:epubPath:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)opfPathFromEpubPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("META-INF/container.xml"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "p_opfPathFromContainerXmlPath:epubPath:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_dcIdentifierFromOpfPath:(id)a3 isEPUB:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  xmlTextReader *v6;
  xmlTextReader *v7;
  int v8;
  xmlChar *Attribute;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  const xmlChar *v19;
  uint64_t v20;
  int v21;
  int v22;
  const xmlChar *v23;
  const xmlChar *v24;
  xmlChar *v25;
  xmlChar *v26;
  xmlChar *v27;
  xmlChar *v28;

  v4 = a4;
  v5 = objc_retainAutorelease(a3);
  v6 = xmlNewTextReaderFilename((const char *)objc_msgSend(v5, "UTF8String"));
  if (v6)
  {
    v7 = v6;
    v8 = xmlTextReaderDepth(v6);
    if (xmlTextReaderRead(v7) == 1)
    {
      Attribute = 0;
      v10 = v8;
      v11 = v8 + 1;
      while (1)
      {
        v12 = xmlTextReaderDepth(v7);
        v13 = xmlTextReaderNodeType(v7);
        if (v12 != (_DWORD)v10 || v13 != 1)
          break;
        Attribute = xmlTextReaderGetAttribute(v7, (const xmlChar *)UNIQUE_IDENTIFIER_ATTR);
LABEL_9:
        if (xmlTextReaderRead(v7) != 1)
          goto LABEL_10;
      }
      if (v11 != v12 || v13 != 1)
        goto LABEL_9;
      v19 = xmlTextReaderConstLocalName(v7);
      if (xmlStrEqual((const xmlChar *)METADATA_ELEMENT, v19) && xmlTextReaderRead(v7) == 1)
      {
        v15 = 0;
        v14 = 0;
        v20 = v10 + 2;
        while (1)
        {
          v21 = xmlTextReaderDepth(v7);
          v22 = xmlTextReaderNodeType(v7);
          if (v21 == v12 && v22 == 15)
            goto LABEL_11;
          if (v20 == v21 && v22 == 1)
          {
            v23 = xmlTextReaderConstNamespaceUri(v7);
            if (xmlStrEqual(v23, (const xmlChar *)DC_TERMS_NAMESPACE))
            {
              v24 = xmlTextReaderConstLocalName(v7);
              if (v14 || !xmlStrEqual((const xmlChar *)IDENTIFIER_ELEMENT, v24))
              {
                if (!v15)
                {
                  if (!xmlStrEqual((const xmlChar *)CONTRIBUTOR_ELEMENT, v24)
                    || (v25 = xmlTextReaderGetAttribute(v7, (const xmlChar *)ID_ATTR)) == 0)
                  {
                    v15 = 0;
                    goto LABEL_49;
                  }
                  v26 = v25;
                  if (xmlStrEqual(v25, (const xmlChar *)BOOK_PRODUCER))
                  {
                    sub_212CA4564(v7);
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v15 = 0;
                  }
                  ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v26);
                }
              }
              else
              {
                v27 = xmlTextReaderGetAttribute(v7, (const xmlChar *)ID_ATTR);
                if (!v27)
                {
                  v14 = 0;
                  goto LABEL_49;
                }
                v28 = v27;
                if (Attribute && xmlStrEqual(v27, Attribute))
                {
                  sub_212CA4564(v7);
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v14 = 0;
                }
                ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v28);
                if (!v4)
                  goto LABEL_11;
              }
              if (v14 && v15)
                goto LABEL_11;
            }
          }
LABEL_49:
          if (xmlTextReaderRead(v7) != 1)
            goto LABEL_11;
        }
      }
LABEL_10:
      v14 = 0;
      v15 = 0;
LABEL_11:
      if (Attribute)
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(Attribute);
    }
    else
    {
      v15 = 0;
      v14 = 0;
    }
    xmlFreeTextReader(v7);
    if (!v4)
      goto LABEL_18;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    if (!v4)
      goto LABEL_18;
  }
  if (!objc_msgSend(v15, "hasPrefix:", CFSTR("iBooks Author")))
  {
    v16 = 0;
    goto LABEL_20;
  }
LABEL_18:
  v16 = v14;
LABEL_20:
  v17 = v16;

  return v17;
}

+ (id)dcIdentifierFromBookPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(CFSTR("epub"), "isEqualToString:", v5);

  objc_msgSend(v3, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(CFSTR("ibooks"), "isEqualToString:", v8);

  if ((v6 & 1) != 0 || v9)
  {
    +[BLLibraryUtility opfPathFromEpubPath:](BLLibraryUtility, "opfPathFromEpubPath:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLLibraryUtility _dcIdentifierFromOpfPath:isEPUB:](BLLibraryUtility, "_dcIdentifierFromOpfPath:isEPUB:", v11, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)md5FromPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v8 = 0;
    IMStreamingHashStringWithFilePathSync(v3, 0, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (!v4)
    {
      BLDefaultLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v10 = v3;
        v11 = 2112;
        v12 = v5;
        _os_log_impl(&dword_212C78000, v6, OS_LOG_TYPE_ERROR, "Error hashing file: %@ --  %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)uniqueIdFromPdfPath:(id)a3
{
  return +[BLLibraryUtility md5FromPath:](BLLibraryUtility, "md5FromPath:", a3);
}

+ (id)uniqueIdFromEpubPath:(id)a3
{
  void *v3;
  void *v4;

  +[BLLibraryUtility opfPathFromEpubPath:](BLLibraryUtility, "opfPathFromEpubPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLLibraryUtility md5FromPath:](BLLibraryUtility, "md5FromPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)generateFileUniqueIdFromPath:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "pathExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = BLBookTypeFromPathExtension(v4);

    if (v5 > 1)
      +[BLLibraryUtility uniqueIdFromPdfPath:](BLLibraryUtility, "uniqueIdFromPdfPath:", v3);
    else
      +[BLLibraryUtility uniqueIdFromEpubPath:](BLLibraryUtility, "uniqueIdFromEpubPath:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if ((unint64_t)objc_msgSend(v6, "length") <= 1)
  {

    v6 = 0;
  }

  return v6;
}

+ (id)_iTunesMetadataPathForEpubPath:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("iTunesMetadata.plist"));
}

+ (id)_storeIdFromiTunesMetadataPath:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x24BDBCE50];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataWithContentsOfURL:options:error:", v6, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v7, 0, 0, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", STORE_ID_KEY);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)identifierFromBookZipArchive:(id)a3 allowHash:(BOOL)a4 allowStoreID:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  id v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v38;
  _BOOL4 v39;
  id v40;
  _QWORD v41[4];
  id v42;
  NSObject *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v6 = a5;
  v39 = a4;
  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_212CA4F9C;
  v49 = sub_212CA4FAC;
  v50 = 0;
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  dispatch_get_global_queue(-2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BE0FC18];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = sub_212CA4FB4;
  v41[3] = &unk_24CE8B900;
  v42 = v8;
  v44 = &v45;
  v13 = v9;
  v43 = v13;
  objc_msgSend(v11, "readArchiveFromURL:options:queue:completion:", v12, 4, v10, v41);

  dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  v14 = (void *)v46[5];
  if (v14)
  {
    objc_msgSend(v14, "entryForName:", CFSTR("iTunesMetadata.plist"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v6)
      goto LABEL_5;
    if (!v15)
      goto LABEL_5;
    objc_msgSend(v15, "plistFromArchive:", v46[5]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v17, "objectForKeyedSubscript:", STORE_ID_KEY);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
LABEL_5:
      objc_msgSend((id)v46[5], "entryForName:", CFSTR("META-INF/container.xml"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        objc_msgSend(a1, "p_opfPathFromContainerXmlDoc:epubPath:", objc_msgSend(v20, "xmlDocumentFromArchive:", v46[5]), &stru_24CE8D258);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v46[5], "entryForName:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          objc_msgSend(v22, "extractFromArchive:", v46[5]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "pathExtension");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "lowercaseString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(CFSTR("epub"), "isEqualToString:", v26);

          objc_msgSend(v24, "path");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[BLLibraryUtility _dcIdentifierFromOpfPath:isEPUB:](BLLibraryUtility, "_dcIdentifierFromOpfPath:isEPUB:", v28, v27);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19 && v39)
          {
            objc_msgSend(v24, "path");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            +[BLLibraryUtility md5FromPath:](BLLibraryUtility, "md5FromPath:", v29);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "path");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0;
          v32 = objc_msgSend(v30, "removeItemAtPath:error:", v31, &v40);
          v33 = v40;

          if ((v32 & 1) == 0)
          {
            BLDefaultLog();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v24, "path");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v52 = v35;
              v53 = 2112;
              v54 = v33;
              _os_log_impl(&dword_212C78000, v34, OS_LOG_TYPE_ERROR, "Failed to remove {%@} file. Error:  %@", buf, 0x16u);

            }
          }

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

      if (!v19 && v39)
      {
        BLDefaultLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_212C78000, v36, OS_LOG_TYPE_ERROR, "Warning: using a completely temporary NSUUID to add the book to the bookshelf", buf, 2u);
        }

        objc_msgSend(v8, "bl_md5Hash");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    v19 = 0;
  }
  _Block_object_dispose(&v45, 8);

  return v19;
}

+ (id)identifierFromBookContainer:(id)a3 allowHash:(BOOL)a4 allowStoreID:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v7 = a5;
  v8 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if (v7)
  {
    +[BLLibraryUtility _iTunesMetadataPathForEpubPath:](BLLibraryUtility, "_iTunesMetadataPathForEpubPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[BLLibraryUtility _storeIdFromiTunesMetadataPath:error:](BLLibraryUtility, "_storeIdFromiTunesMetadataPath:error:", v10, &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v22;

    if (v11)
      v13 = 1;
    else
      v13 = v12 == 0;
    if (v13)
    {
      if (v11)
        goto LABEL_24;
      goto LABEL_19;
    }
    objc_msgSend(v12, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDD1398]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDD1128]))
    {
      v17 = objc_msgSend(v15, "code");

      if (v17 == 2)
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {

    }
    BLDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v12;
      _os_log_impl(&dword_212C78000, v18, OS_LOG_TYPE_ERROR, "Error attempting to read store id. Error:  %@", buf, 0xCu);
    }

    if (a6)
      *a6 = objc_retainAutorelease(v12);
    goto LABEL_18;
  }
  v12 = 0;
LABEL_19:
  +[BLLibraryUtility dcIdentifierFromBookPath:](BLLibraryUtility, "dcIdentifierFromBookPath:", v9);
  v19 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v19;
  if (v8 && !v19)
  {
    +[BLLibraryUtility uniqueIdFromEpubPath:](BLLibraryUtility, "uniqueIdFromEpubPath:", v9);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend(v9, "bl_md5Hash");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v20;
  }
LABEL_24:

  return v11;
}

+ (id)identifierFromBookPath:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x24BEDD108](a1, sel_identifierFromBookPath_allowHash_allowStoreID_error_);
}

+ (id)identifierFromBookPath:(id)a3 allowHash:(BOOL)a4 allowStoreID:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  int v26;
  id v27;
  uint64_t v28;

  v7 = a5;
  v8 = a4;
  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  objc_msgSend(v10, "pathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(CFSTR("pdf"), "isEqualToString:", v12);

  objc_msgSend(v10, "pathExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lowercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(CFSTR("epub"), "isEqualToString:", v15);

  objc_msgSend(v10, "pathExtension");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lowercaseString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(CFSTR("ibooks"), "isEqualToString:", v18);

  if (!v13)
  {
    if ((v16 | v19) == 1)
    {
      LOBYTE(v26) = 0;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "fileExistsAtPath:isDirectory:", v10, &v26);

      if (v23)
      {
        if ((_BYTE)v26)
          objc_msgSend(a1, "identifierFromBookContainer:allowHash:allowStoreID:error:", v10, v8, v7, a6);
        else
          objc_msgSend(a1, "identifierFromBookZipArchive:allowHash:allowStoreID:error:", v10, v8, v7, a6);
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      if (a6)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4, 0);
        v21 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    else
    {
      BLDefaultLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v26 = 138412290;
        v27 = v10;
        _os_log_impl(&dword_212C78000, v24, OS_LOG_TYPE_INFO, "Unsupported file type '%@'.", (uint8_t *)&v26, 0xCu);
      }

    }
    v21 = 0;
    goto LABEL_15;
  }
  +[BLLibraryUtility uniqueIdFromPdfPath:](BLLibraryUtility, "uniqueIdFromPdfPath:", v10);
  v20 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v21 = (void *)v20;
LABEL_15:

  return v21;
}

+ (BOOL)writeBinaryPropertyList:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  v10 = v9;
  if (!v8)
  {
    BLDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl(&dword_212C78000, v14, OS_LOG_TYPE_ERROR, "DownloadInstaller: Could not serialize plist:  %@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  v17 = v9;
  v11 = objc_msgSend(v8, "writeToFile:options:error:", v7, 1, &v17);
  v12 = v17;

  BLDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl(&dword_212C78000, v14, OS_LOG_TYPE_ERROR, "DownloadInstaller: Could not write plist:  %@", buf, 0xCu);
    }
    v10 = v12;
LABEL_11:

    if (a5)
    {
      v12 = objc_retainAutorelease(v10);
      v15 = 0;
      *a5 = v12;
    }
    else
    {
      v15 = 0;
      v12 = v10;
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_212C78000, v14, OS_LOG_TYPE_DEFAULT, "DownloadInstaller: Wrote plist to: %@", buf, 0xCu);
  }

  v15 = 1;
LABEL_14:

  return v15;
}

+ (BOOL)_isMultiUser
{
  int v2;
  void *v3;
  void *v4;
  BOOL result;
  void *v6;
  char v7;

  if (qword_253DB20B0 != -1)
    dispatch_once(&qword_253DB20B0, &unk_24CE8B920);
  v2 = byte_253DB1F18;
  if ((BUIsRunningTests() & 1) == 0)
    return v2 != 0;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("BLLibrarySimulateMultiUser"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  result = v2 != 0;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("BLLibrarySimulateMultiUser"));

    return v7;
  }
  return result;
}

@end
