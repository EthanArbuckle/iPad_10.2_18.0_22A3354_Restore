@implementation WFArticle

- (WFArticle)initWithTitle:(id)a3 author:(id)a4 publishedDate:(id)a5 body:(id)a6 excerpt:(id)a7 numberOfWords:(unint64_t)a8 mainImageURL:(id)a9 URL:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  WFArticle *v23;
  uint64_t v24;
  NSString *title;
  uint64_t v26;
  NSString *author;
  uint64_t v28;
  NSDate *publishedDate;
  uint64_t v30;
  NSString *body;
  uint64_t v32;
  NSString *excerpt;
  uint64_t v34;
  NSURL *mainImageURL;
  uint64_t v36;
  NSURL *URL;
  objc_super v39;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a10;
  v39.receiver = self;
  v39.super_class = (Class)WFArticle;
  v23 = -[WFArticle init](&v39, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    title = v23->_title;
    v23->_title = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    author = v23->_author;
    v23->_author = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    publishedDate = v23->_publishedDate;
    v23->_publishedDate = (NSDate *)v28;

    v30 = objc_msgSend(v19, "copy");
    body = v23->_body;
    v23->_body = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    excerpt = v23->_excerpt;
    v23->_excerpt = (NSString *)v32;

    v23->_numberOfWords = a8;
    v34 = objc_msgSend(v21, "copy");
    mainImageURL = v23->_mainImageURL;
    v23->_mainImageURL = (NSURL *)v34;

    v36 = objc_msgSend(v22, "copy");
    URL = v23->_URL;
    v23->_URL = (NSURL *)v36;

  }
  return v23;
}

- (BOOL)isEqual:(id)a3
{
  WFArticle *v4;
  WFArticle *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  char v43;
  int v44;
  void *v45;
  unint64_t v46;
  char v47;
  char v49;
  int v50;
  int v51;
  int v52;

  v4 = (WFArticle *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WFArticle title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFArticle title](v5, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v11 = 0;
      }
      else
      {
        -[WFArticle title](self, "title");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFArticle title](v5, "title");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

        v11 = v10 ^ 1;
      }

      -[WFArticle author](self, "author");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFArticle author](v5, "author");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == v14)
      {
        v52 = 0;
      }
      else
      {
        -[WFArticle author](self, "author");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFArticle author](v5, "author");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqualToString:", v16);

        v52 = v17 ^ 1;
      }

      -[WFArticle publishedDate](self, "publishedDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFArticle publishedDate](v5, "publishedDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 == v19)
      {
        v51 = 0;
      }
      else
      {
        -[WFArticle publishedDate](self, "publishedDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFArticle publishedDate](v5, "publishedDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isEqualToDate:", v21);

        v51 = v22 ^ 1;
      }

      -[WFArticle body](self, "body");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFArticle body](v5, "body");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23 == v24)
      {
        v50 = 0;
      }
      else
      {
        -[WFArticle body](self, "body");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFArticle body](v5, "body");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "isEqualToString:", v26);

        v50 = v27 ^ 1;
      }

      -[WFArticle excerpt](self, "excerpt");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFArticle excerpt](v5, "excerpt");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28 == v29)
      {
        v33 = 0;
      }
      else
      {
        -[WFArticle excerpt](self, "excerpt");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFArticle excerpt](v5, "excerpt");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqualToString:", v31);

        v33 = v32 ^ 1;
      }

      -[WFArticle mainImageURL](self, "mainImageURL");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFArticle mainImageURL](v5, "mainImageURL");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34 == v35)
      {
        v38 = 1;
      }
      else
      {
        -[WFArticle mainImageURL](self, "mainImageURL");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFArticle mainImageURL](v5, "mainImageURL");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v36, "isEqual:", v37);

      }
      -[WFArticle URL](self, "URL");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFArticle URL](v5, "URL");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39 == v40)
      {
        v49 = 1;
      }
      else
      {
        -[WFArticle URL](self, "URL");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFArticle URL](v5, "URL");
        v42 = v33;
        v43 = v38;
        v44 = v11;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v41, "isEqual:", v45);

        v11 = v44;
        v38 = v43;
        v33 = v42;

      }
      if (((v11 | v52 | v51 | v50 | v33) & 1) != 0)
      {
        v12 = 0;
      }
      else
      {
        v46 = -[WFArticle numberOfWords](self, "numberOfWords");
        if (v46 == -[WFArticle numberOfWords](v5, "numberOfWords"))
          v47 = v38;
        else
          v47 = 0;
        v12 = v47 & v49;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WFArticle URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFArticle title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)wfSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[WFArticle title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFArticle title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("title"));

  }
  -[WFArticle author](self, "author");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFArticle author](self, "author");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("author"));

  }
  -[WFArticle publishedDate](self, "publishedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFArticle publishedDate](self, "publishedDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("publishedDate"));

  }
  -[WFArticle body](self, "body");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WFArticle body](self, "body");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("body"));

  }
  -[WFArticle excerpt](self, "excerpt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[WFArticle excerpt](self, "excerpt");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("excerpt"));

  }
  if (-[WFArticle numberOfWords](self, "numberOfWords"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WFArticle numberOfWords](self, "numberOfWords"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("numberOfWords"));

  }
  -[WFArticle mainImageURL](self, "mainImageURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[WFArticle mainImageURL](self, "mainImageURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("mainImageURL"));

  }
  -[WFArticle URL](self, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[WFArticle URL](self, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "absoluteString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("URL"));

  }
  v23 = CFSTR("link.contentkit.article");
  v24[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (WFArticle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  WFArticle *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("author"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publishedDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("excerpt"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfWords"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mainImageURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[WFArticle initWithTitle:author:publishedDate:body:excerpt:numberOfWords:mainImageURL:URL:](self, "initWithTitle:author:publishedDate:body:excerpt:numberOfWords:mainImageURL:URL:", v5, v6, v7, v8, v9, v11, v12, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[WFArticle title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[WFArticle author](self, "author");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("author"));

  -[WFArticle publishedDate](self, "publishedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("publishedDate"));

  -[WFArticle body](self, "body");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("body"));

  -[WFArticle excerpt](self, "excerpt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("excerpt"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WFArticle numberOfWords](self, "numberOfWords"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("numberOfWords"));

  -[WFArticle mainImageURL](self, "mainImageURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("mainImageURL"));

  -[WFArticle URL](self, "URL");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("URL"));

}

- (NSString)title
{
  return self->_title;
}

- (NSString)author
{
  return self->_author;
}

- (NSDate)publishedDate
{
  return self->_publishedDate;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)excerpt
{
  return self->_excerpt;
}

- (unint64_t)numberOfWords
{
  return self->_numberOfWords;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSURL)mainImageURL
{
  return self->_mainImageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainImageURL, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_excerpt, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_publishedDate, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (void)fetchArticleFromURL:(id)a3 pageHTML:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFArticle.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__WFArticle_fetchArticleFromURL_pageHTML_completionHandler___block_invoke;
  block[3] = &unk_24C4E1A88;
  v19 = v11;
  v20 = a1;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

+ (unint64_t)numberOfWordsInString:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = objc_msgSend(v3, "length");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__WFArticle_numberOfWordsInString___block_invoke;
  v7[3] = &unk_24C4E1AB0;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 3, v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (id)summaryOfParagraph:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[4];

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v5 = objc_msgSend(v3, "length");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __32__WFArticle_summaryOfParagraph___block_invoke;
  v11[3] = &unk_24C4E1AD8;
  v6 = v4;
  v12 = v6;
  v7 = v3;
  v13 = v7;
  v14 = v15;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 4, v11);
  v8 = v13;
  v9 = v6;

  _Block_object_dispose(v15, 8);
  return v9;
}

+ (id)mainImageURLFromHTML:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  htmlDocPtr Memory;
  xmlXPathContext *v7;
  xmlNode *RootElement;
  xmlXPathObjectPtr v9;
  xmlXPathObject *v10;
  int *p_nodeNr;
  uint64_t v12;
  void (**v13)(xmlChar *);
  xmlChar *Prop;
  xmlChar *v15;
  void *v16;
  void *v17;
  void *v18;

  +[WFRichTextContentItem normalizedHTMLDocumentFromHTML:](WFRichTextContentItem, "normalizedHTMLDocumentFromHTML:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_retainAutorelease(v4);
  Memory = htmlReadMemory((const char *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"), 0, 0, 2049);
  v7 = xmlXPathNewContext(Memory);
  RootElement = xmlDocGetRootElement(Memory);
  v9 = xmlXPathNodeEval(RootElement, (const xmlChar *)"//img", v7);
  if (v9)
  {
    v10 = v9;
    p_nodeNr = &v9->nodesetval->nodeNr;
    if (p_nodeNr)
    {
      v12 = 0;
      v13 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
      do
      {
        if (v12 >= *p_nodeNr)
          break;
        Prop = xmlGetProp(*(const xmlNode **)(*((_QWORD *)p_nodeNr + 1) + 8 * v12), (const xmlChar *)"src");
        if (Prop)
        {
          v15 = Prop;
          v16 = (void *)MEMORY[0x24BDBCF48];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Prop);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "URLWithString:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          (*v13)(v15);
          if (v18)
            goto LABEL_12;
        }
        ++v12;
        p_nodeNr = &v10->nodesetval->nodeNr;
      }
      while (p_nodeNr);
      v18 = 0;
    }
    else
    {
      v18 = 0;
    }
LABEL_12:
    xmlXPathFreeObject(v10);
    xmlXPathFreeContext(v7);
    xmlFreeDoc(Memory);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (WFArticle)articleWithTitle:(id)a3 author:(id)a4 publishedDate:(id)a5 body:(id)a6 excerpt:(id)a7 numberOfWords:(unint64_t)a8 mainImageURL:(id)a9 URL:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;

  v17 = a10;
  v18 = a9;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:author:publishedDate:body:excerpt:numberOfWords:mainImageURL:URL:", v23, v22, v21, v20, v19, a8, v18, v17);

  return (WFArticle *)v24;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.article"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("author"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("publishedDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("excerpt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfWords"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("mainImageURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(a1, "articleWithTitle:author:publishedDate:body:excerpt:numberOfWords:mainImageURL:URL:", v19, v5, v6, v7, v8, v10, v14, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_5;
    goto LABEL_4;
  }
  v14 = 0;
  if (!v12)
    goto LABEL_7;
LABEL_3:
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "articleWithTitle:author:publishedDate:body:excerpt:numberOfWords:mainImageURL:URL:", v19, v5, v6, v7, v8, v10, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
LABEL_4:

LABEL_5:
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __32__WFArticle_summaryOfParagraph___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v11;
  void *v12;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") <= 0xC7)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a5, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendString:", v12);

  }
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 3)
    *a7 = 1;
}

uint64_t __35__WFArticle_numberOfWordsInString___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __60__WFArticle_fetchArticleFromURL_pageHTML_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v2 = (void *)get_SFReaderExtractorClass_softClass;
  v23 = get_SFReaderExtractorClass_softClass;
  v3 = MEMORY[0x24BDAC760];
  if (!get_SFReaderExtractorClass_softClass)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __get_SFReaderExtractorClass_block_invoke;
    v19[3] = &unk_24C4E3118;
    v19[4] = &v20;
    __get_SFReaderExtractorClass_block_invoke((uint64_t)v19);
    v2 = (void *)v21[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v20, 8);
  v5 = objc_alloc_init(v4);
  v12 = v3;
  v13 = 3221225472;
  v14 = __60__WFArticle_fetchArticleFromURL_pageHTML_completionHandler___block_invoke_2;
  v15 = &unk_24C4E1A60;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v17 = v6;
  v18 = v7;
  v8 = v5;
  v16 = v8;
  v9 = _Block_copy(&v12);
  v11 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  if (v11)
    objc_msgSend(v8, "getExtractedDataForURL:withData:withCompletion:", v10, v11, v9, v12, v13, v14, v15);
  else
    objc_msgSend(v8, "getExtractedDataForURL:withCompletion:", v10, v9, v12, v13, v14, v15);

}

void __60__WFArticle_fetchArticleFromURL_pageHTML_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  id *v18;
  void *v19;
  id v20;
  id *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  _QWORD v60[2];
  uint64_t v61;
  _QWORD v62[3];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v53 = a3;
  objc_msgSend(v53, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  get_SFReaderExtractorErrorDomain();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", v6))
  {

    goto LABEL_5;
  }
  v7 = objc_msgSend(v53, "code");

  if (v7 != 1)
  {
LABEL_5:
    v14 = v53;
    if (!v4 || v53)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_19;
    }
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v15 = (id *)getNSDocumentTypeDocumentOptionSymbolLoc_ptr;
    v57 = getNSDocumentTypeDocumentOptionSymbolLoc_ptr;
    if (!getNSDocumentTypeDocumentOptionSymbolLoc_ptr)
    {
      v16 = UIFoundationLibrary_18457();
      v15 = (id *)dlsym(v16, "NSDocumentTypeDocumentOption");
      v55[3] = (uint64_t)v15;
      getNSDocumentTypeDocumentOptionSymbolLoc_ptr = (uint64_t)v15;
    }
    _Block_object_dispose(&v54, 8);
    if (v15)
    {
      v17 = *v15;
      v58 = v17;
      v54 = 0;
      v55 = &v54;
      v56 = 0x2020000000;
      v18 = (id *)getNSHTMLTextDocumentTypeSymbolLoc_ptr_18460;
      v57 = getNSHTMLTextDocumentTypeSymbolLoc_ptr_18460;
      if (!getNSHTMLTextDocumentTypeSymbolLoc_ptr_18460)
      {
        v19 = UIFoundationLibrary_18457();
        v18 = (id *)dlsym(v19, "NSHTMLTextDocumentType");
        v55[3] = (uint64_t)v18;
        getNSHTMLTextDocumentTypeSymbolLoc_ptr_18460 = (uint64_t)v18;
      }
      _Block_object_dispose(&v54, 8);
      if (v18)
      {
        v20 = *v18;
        v60[0] = v20;
        v54 = 0;
        v55 = &v54;
        v56 = 0x2020000000;
        v21 = (id *)getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr_18463;
        v57 = getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr_18463;
        if (!getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr_18463)
        {
          v22 = UIFoundationLibrary_18457();
          v21 = (id *)dlsym(v22, "NSCharacterEncodingDocumentAttribute");
          v55[3] = (uint64_t)v21;
          getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr_18463 = (uint64_t)v21;
        }
        _Block_object_dispose(&v54, 8);
        if (v21)
        {
          v59 = *v21;
          v60[1] = &unk_24C50F590;
          v23 = (void *)MEMORY[0x24BDBCE70];
          v24 = v59;
          objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v60, &v58, 2);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = objc_alloc(MEMORY[0x24BDD1458]);
          objc_msgSend(v4, "body");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (void *)objc_msgSend(v25, "initWithData:options:documentAttributes:error:", v26, v50, 0, 0);

          v27 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v4, "body");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = (void *)objc_msgSend(v27, "initWithData:encoding:", v28, 4);

          objc_msgSend(v4, "publishedDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFDateDetector datesInString:error:](WFDateDetector, "datesInString:error:", v29, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "firstObject");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "title");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "author");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = *(void **)(a1 + 48);
          objc_msgSend(v51, "string");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "summaryOfParagraph:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = *(void **)(a1 + 48);
          objc_msgSend(v51, "string");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v36, "numberOfWordsInString:", v37);
          objc_msgSend(v4, "mainImageURL");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "url");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFArticle articleWithTitle:author:publishedDate:body:excerpt:numberOfWords:mainImageURL:URL:](WFArticle, "articleWithTitle:author:publishedDate:body:excerpt:numberOfWords:mainImageURL:URL:", v31, v32, v48, v49, v35, v38, v39, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          goto LABEL_17;
        }
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSAttributedStringDocumentAttributeKey getNSCharacterEncodingDocumentAttribute(void)");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, CFSTR("WFArticle.m"), 27, CFSTR("%s"), dlerror());

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSAttributedStringDocumentAttributeKey getNSHTMLTextDocumentType(void)");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("WFArticle.m"), 26, CFSTR("%s"), dlerror());

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSAttributedStringDocumentReadingOptionKey getNSDocumentTypeDocumentOption(void)");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("WFArticle.m"), 28, CFSTR("%s"), dlerror());

    }
    __break(1u);
  }
  v8 = *(_QWORD *)(a1 + 40);
  v9 = (void *)MEMORY[0x24BDD1540];
  get_SFReaderExtractorErrorDomain();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("An article could not be extracted from the given information."));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v13);

LABEL_17:
  v14 = v53;
LABEL_19:

}

@end
