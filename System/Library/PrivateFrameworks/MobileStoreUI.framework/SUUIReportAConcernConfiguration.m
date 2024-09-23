@implementation SUUIReportAConcernConfiguration

+ (id)configurationWithTemplateElement:(id)a3
{
  id v4;
  id v5;
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
  id v22;
  _QWORD v24[4];
  id v25;

  if (!a3)
    return 0;
  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "reportConcernURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReportConcernURL:", v6);

  objc_msgSend(v5, "setItemIdentifier:", objc_msgSend(v4, "itemIdentifier"));
  objc_msgSend(v4, "reportConcernExplanation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReportConcernExplanation:", v7);

  objc_msgSend(v4, "firstChildForElementName:", CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectReasonTitle:", v11);

  objc_msgSend(v4, "firstChildForElementName:", CFSTR("subtitle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectReasonSubtitle:", v15);

  objc_msgSend(v4, "firstChildForElementName:", CFSTR("text"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "attributedString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "string");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrivacyNote:", v19);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reasonElements");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __68__SUUIReportAConcernConfiguration_configurationWithTemplateElement___block_invoke;
  v24[3] = &unk_2511F4B68;
  v25 = v20;
  v22 = v20;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v24);

  objc_msgSend(v5, "setReasons:", v22);
  return v5;
}

void __68__SUUIReportAConcernConfiguration_configurationWithTemplateElement___block_invoke(uint64_t a1, void *a2)
{
  SUUIReportAConcernReason *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = objc_alloc_init(SUUIReportAConcernReason);
  objc_msgSend(v9, "reasonID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReportAConcernReason setReasonID:](v3, "setReasonID:", v4);

  objc_msgSend(v9, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReportAConcernReason setName:](v3, "setName:", v5);

  objc_msgSend(v9, "uppercaseName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SUUIReportAConcernReason setUppercaseName:](v3, "setUppercaseName:", v6);
  }
  else
  {
    objc_msgSend(v9, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uppercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIReportAConcernReason setUppercaseName:](v3, "setUppercaseName:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SUUIReportAConcernConfiguration reportConcernURL](self, "reportConcernURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReportConcernURL:", v5);

  objc_msgSend(v4, "setItemIdentifier:", -[SUUIReportAConcernConfiguration itemIdentifier](self, "itemIdentifier"));
  -[SUUIReportAConcernConfiguration reportConcernExplanation](self, "reportConcernExplanation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReportConcernExplanation:", v6);

  -[SUUIReportAConcernConfiguration selectReasonTitle](self, "selectReasonTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectReasonTitle:", v7);

  -[SUUIReportAConcernConfiguration selectReasonSubtitle](self, "selectReasonSubtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectReasonSubtitle:", v8);

  -[SUUIReportAConcernConfiguration privacyNote](self, "privacyNote");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrivacyNote:", v9);

  -[SUUIReportAConcernConfiguration reasons](self, "reasons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReasons:", v10);

  return v4;
}

- (NSURL)reportConcernURL
{
  return self->_reportConcernURL;
}

- (void)setReportConcernURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(int64_t)a3
{
  self->_itemIdentifier = a3;
}

- (NSString)reportConcernExplanation
{
  return self->_reportConcernExplanation;
}

- (void)setReportConcernExplanation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)selectReasonTitle
{
  return self->_selectReasonTitle;
}

- (void)setSelectReasonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)selectReasonSubtitle
{
  return self->_selectReasonSubtitle;
}

- (void)setSelectReasonSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)privacyNote
{
  return self->_privacyNote;
}

- (void)setPrivacyNote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_privacyNote, 0);
  objc_storeStrong((id *)&self->_selectReasonSubtitle, 0);
  objc_storeStrong((id *)&self->_selectReasonTitle, 0);
  objc_storeStrong((id *)&self->_reportConcernExplanation, 0);
  objc_storeStrong((id *)&self->_reportConcernURL, 0);
}

@end
