@implementation WFShareSheetSafariWebPage

- (WFShareSheetSafariWebPage)initWithURL:(id)a3 pageTitle:(id)a4 selectionText:(id)a5 selectionHTML:(id)a6 documentHTML:(id)a7 javaScriptRunnerIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  WFShareSheetSafariWebPage *v17;
  uint64_t v18;
  NSString *selectionText;
  uint64_t v20;
  NSData *selectionHTML;
  uint64_t v22;
  NSString *javaScriptRunnerIdentifier;
  WFShareSheetSafariWebPage *v24;
  objc_super v26;

  v14 = a5;
  v15 = a6;
  v16 = a8;
  v26.receiver = self;
  v26.super_class = (Class)WFShareSheetSafariWebPage;
  v17 = -[WFSafariWebPage initWithURL:pageTitle:documentHTML:](&v26, sel_initWithURL_pageTitle_documentHTML_, a3, a4, a7);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    selectionText = v17->_selectionText;
    v17->_selectionText = (NSString *)v18;

    v20 = objc_msgSend(v15, "copy");
    selectionHTML = v17->_selectionHTML;
    v17->_selectionHTML = (NSData *)v20;

    v22 = objc_msgSend(v16, "copy");
    javaScriptRunnerIdentifier = v17->_javaScriptRunnerIdentifier;
    v17->_javaScriptRunnerIdentifier = (NSString *)v22;

    v24 = v17;
  }

  return v17;
}

- (WFShareSheetSafariWebPage)initWithCoder:(id)a3
{
  id v4;
  WFShareSheetSafariWebPage *v5;
  uint64_t v6;
  NSString *selectionText;
  uint64_t v8;
  NSData *selectionHTML;
  uint64_t v10;
  NSString *javaScriptRunnerIdentifier;
  WFShareSheetSafariWebPage *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFShareSheetSafariWebPage;
  v5 = -[WFSafariWebPage initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectionText"));
    v6 = objc_claimAutoreleasedReturnValue();
    selectionText = v5->_selectionText;
    v5->_selectionText = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectionHTML"));
    v8 = objc_claimAutoreleasedReturnValue();
    selectionHTML = v5->_selectionHTML;
    v5->_selectionHTML = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("javaScriptRunnerIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    javaScriptRunnerIdentifier = v5->_javaScriptRunnerIdentifier;
    v5->_javaScriptRunnerIdentifier = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFShareSheetSafariWebPage;
  v4 = a3;
  -[WFSafariWebPage encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[WFShareSheetSafariWebPage selectionText](self, "selectionText", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("selectionText"));

  -[WFShareSheetSafariWebPage selectionHTML](self, "selectionHTML");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("selectionHTML"));

  -[WFShareSheetSafariWebPage javaScriptRunnerIdentifier](self, "javaScriptRunnerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("javaScriptRunnerIdentifier"));

}

- (id)selectionText
{
  return self->_selectionText;
}

- (id)selectionHTML
{
  return self->_selectionHTML;
}

- (NSString)javaScriptRunnerIdentifier
{
  return self->_javaScriptRunnerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_javaScriptRunnerIdentifier, 0);
  objc_storeStrong((id *)&self->_selectionHTML, 0);
  objc_storeStrong((id *)&self->_selectionText, 0);
}

+ (id)webPageFromPreprocessingResult:(id)a3 javaScriptRunnerIdentifier:(id)a4
{
  id v7;
  id v8;
  objc_class *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFShareSheetSafariWebPage.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

  }
  v9 = (objc_class *)a1;
  objc_msgSend(v7, "objectForKey:", CFSTR("URL"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("title"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("selectionText"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("selection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("document"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)v10;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(v13, "dataUsingEncoding:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  if (objc_msgSend(v14, "length"))
  {
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  v18 = (void *)objc_msgSend([v9 alloc], "initWithURL:pageTitle:selectionText:selectionHTML:documentHTML:javaScriptRunnerIdentifier:", v15, v11, v12, v16, v17, v8);

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
