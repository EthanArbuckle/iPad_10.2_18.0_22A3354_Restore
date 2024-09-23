@implementation HKClinicalDocumentIndexingUtilities

+ (id)contentStringFromHTMLData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  xmlDoc *v7;
  xmlDoc *v8;
  xmlXPathContextPtr v9;
  xmlXPathContext *v10;
  uint64_t v11;
  xmlXPathObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  xmlNode *v16;
  const xmlNode *RootElement;
  xmlChar *Content;
  void *v19;
  const __CFString *v20;

  v5 = a3;
  v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4));
  v7 = htmlParseDoc((const xmlChar *)objc_msgSend(v6, "cStringUsingEncoding:", 4), "UTF-8");
  if (!v7)
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = CFSTR("Failed to construct html document from the given data");
LABEL_13:
    objc_msgSend(v19, "hk_assignError:code:format:", a4, 100, v20);
    Content = 0;
    goto LABEL_14;
  }
  v8 = v7;
  v9 = xmlXPathNewContext(v7);
  if (!v9)
  {
    xmlFreeDoc(v8);
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = CFSTR("Failed to construct xpath context from the given doc");
    goto LABEL_13;
  }
  v10 = v9;
  v11 = MEMORY[0x22768EEE0]("//script | //style", v9);
  if (!v11)
  {
    xmlXPathFreeContext(v10);
    xmlFreeDoc(v8);
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = CFSTR("Failed to evaluation xpath expression with the given doc");
    goto LABEL_13;
  }
  v12 = (xmlXPathObject *)v11;
  v13 = *(_QWORD *)(v11 + 8);
  if (v13 && *(int *)v13 >= 1)
  {
    v14 = 8 * (*(_DWORD *)v13 - 1);
    do
    {
      v15 = *(_QWORD *)(v13 + 8);
      v16 = *(xmlNode **)(v15 + v14);
      *(_QWORD *)(v15 + v14) = 0;
      xmlUnlinkNode(v16);
      xmlFreeNode(v16);
      v14 -= 8;
    }
    while (v14 != -8);
  }
  RootElement = xmlDocGetRootElement(v8);
  Content = xmlNodeGetContent(RootElement);
  xmlXPathFreeObject(v12);
  xmlXPathFreeContext(v10);
  xmlFreeDoc(v8);
  if (Content)
    Content = (xmlChar *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", Content, strlen((const char *)Content), 4);
LABEL_14:

  return Content;
}

+ (id)contentStringFromDOCXData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  xmlDoc *v14;
  xmlDoc *v15;
  xmlXPathContext *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  id v20;
  unint64_t v21;
  xmlChar *Content;
  void *v23;
  id v25;
  xmlXPathObject *v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  id obj;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD4268]), "initWithData:", v5);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__4;
  v35 = __Block_byref_object_dispose__4;
  v36 = 0;
  obj = 0;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __71__HKClinicalDocumentIndexingUtilities_contentStringFromDOCXData_error___block_invoke;
  v27[3] = &unk_24ECF58D8;
  v8 = v7;
  v28 = v8;
  v29 = &v31;
  objc_msgSend(v6, "enumerateEntriesWithError:block:", &obj, v27);
  objc_storeStrong(&v36, obj);
  v9 = (void *)v32[5];
  if (!v9)
  {
    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 100, CFSTR("Failed to extract xml data from docx file"));
      goto LABEL_12;
    }
    v13 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v11, 4));
    v14 = xmlParseDoc((const xmlChar *)objc_msgSend(v13, "cStringUsingEncoding:", 4));
    v15 = v14;
    if (v14)
    {
      v16 = xmlXPathNewContext(v14);
      if (v16)
      {
        v17 = MEMORY[0x22768EEE0]("//*[local-name()='t']", v16);
        if (v17)
        {
          v25 = v13;
          v26 = (xmlXPathObject *)v17;
          v18 = *(_QWORD *)(v17 + 8);
          if (v18)
            v19 = *(_DWORD *)v18;
          else
            v19 = 0;
          v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          if (v19 >= 1)
          {
            v21 = v19 + 1;
            do
            {
              Content = xmlNodeGetContent(*(const xmlNode **)(*(_QWORD *)(v18 + 8) + 8 * (v21 - 2)));
              if (Content)
              {
                v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", Content);
                objc_msgSend(v20, "insertObject:atIndex:", v23, 0);

              }
              --v21;
            }
            while (v21 > 1);
          }
          xmlXPathFreeObject(v26);
          xmlXPathFreeContext(v16);
          xmlFreeDoc(v15);
          if (objc_msgSend(v20, "count"))
          {
            objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v12 = 0;
          }

          v13 = v25;
          goto LABEL_27;
        }
        xmlXPathFreeContext(v16);
        xmlFreeDoc(v15);
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 100, CFSTR("Failed to evaluation xpath expression with the given doc"));
      }
      else
      {
        xmlFreeDoc(v15);
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 100, CFSTR("Failed to construct xpath context from the given doc"));
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 100, CFSTR("Failed to construct html document from the given data"));
    }
    v12 = 0;
LABEL_27:

    goto LABEL_28;
  }
  v10 = v9;
  v11 = v10;
  if (!a4)
  {
    _HKLogDroppedError();
LABEL_12:
    v12 = 0;
    goto LABEL_28;
  }
  v12 = 0;
  *a4 = objc_retainAutorelease(v10);
LABEL_28:

  _Block_object_dispose(&v31, 8);
  return v12;
}

void __71__HKClinicalDocumentIndexingUtilities_contentStringFromDOCXData_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id obj;

  v5 = a2;
  objc_msgSend(v5, "pathname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasSuffix:", CFSTR("document.xml"));

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v9 + 40);
    objc_msgSend(v5, "dataWithError:", &obj);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v9 + 40), obj);
    objc_msgSend(v8, "addObject:", v10);

    *a3 = 1;
  }

}

@end
