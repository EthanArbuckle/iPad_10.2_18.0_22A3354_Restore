@implementation WFSafariWebPage

- (WFSafariWebPage)initWithURL:(id)a3 pageTitle:(id)a4 documentHTML:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFSafariWebPage *v12;
  uint64_t v13;
  NSURL *URL;
  uint64_t v15;
  NSString *pageTitle;
  uint64_t v17;
  NSData *documentHTML;
  WFSafariWebPage *v19;
  void *v21;
  void *v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSafariWebPage.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSafariWebPage.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pageTitle"));

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)WFSafariWebPage;
  v12 = -[WFSafariWebPage init](&v23, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    URL = v12->_URL;
    v12->_URL = (NSURL *)v13;

    v15 = objc_msgSend(v10, "copy");
    pageTitle = v12->_pageTitle;
    v12->_pageTitle = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    documentHTML = v12->_documentHTML;
    v12->_documentHTML = (NSData *)v17;

    v19 = v12;
  }

  return v12;
}

- (NSString)selectionText
{
  return 0;
}

- (NSData)selectionHTML
{
  return 0;
}

- (WFSafariWebPage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFSafariWebPage *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pageTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentHTML"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFSafariWebPage initWithURL:pageTitle:documentHTML:](self, "initWithURL:pageTitle:documentHTML:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFSafariWebPage URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("URL"));

  -[WFSafariWebPage pageTitle](self, "pageTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("pageTitle"));

  -[WFSafariWebPage documentHTML](self, "documentHTML");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("documentHTML"));

}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)pageTitle
{
  return self->_pageTitle;
}

- (NSData)documentHTML
{
  return self->_documentHTML;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentHTML, 0);
  objc_storeStrong((id *)&self->_pageTitle, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
