@implementation WFWordPressSessionManager

- (WFWordPressSessionManager)init
{
  return -[WFWordPressSessionManager initWithSessionConfiguration:](self, "initWithSessionConfiguration:", 0);
}

- (WFWordPressSessionManager)initWithSessionConfiguration:(id)a3
{
  id v4;
  WFWordPressSessionManager *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURLSession *session;
  WFWordPressSessionManager *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFWordPressSessionManager;
  v5 = -[WFWordPressSessionManager init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDB74B0];
    v7 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDB74B8], "wf_defaultSessionConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "sessionWithConfiguration:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    session = v5->_session;
    v5->_session = (NSURLSession *)v8;

    if (!v4)
    v10 = v5;
  }

  return v5;
}

- (void)getBlogsWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFWordPressSessionManager username](self, "username");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_24F8BBA48;
  v15[0] = v7;
  -[WFWordPressSessionManager password](self, "password");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_24F8BBA48;
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__WFWordPressSessionManager_getBlogsWithCompletionHandler___block_invoke;
  v13[3] = &unk_24F8B5E18;
  v14 = v4;
  v12 = v4;
  -[WFWordPressSessionManager sendRequestWithMethod:parameters:completionHandler:](self, "sendRequestWithMethod:parameters:completionHandler:", CFSTR("wp.getUsersBlogs"), v11, v13);

}

- (void)getTermsForTaxonomy:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[WFWordPressSessionManager blogId](self, "blogId");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &unk_24F939A70;
  if (v8)
    v10 = (void *)v8;
  v21[0] = v10;
  -[WFWordPressSessionManager username](self, "username");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_24F8BBA48;
  v21[1] = v13;
  -[WFWordPressSessionManager password](self, "password");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = &stru_24F8BBA48;
  v21[2] = v16;
  v21[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __67__WFWordPressSessionManager_getTermsForTaxonomy_completionHandler___block_invoke;
  v19[3] = &unk_24F8B5E18;
  v20 = v6;
  v18 = v6;
  -[WFWordPressSessionManager sendRequestWithMethod:parameters:completionHandler:](self, "sendRequestWithMethod:parameters:completionHandler:", CFSTR("wp.getTerms"), v17, v19);

}

- (void)getPostTypesWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFWordPressSessionManager blogId](self, "blogId");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &unk_24F939A70;
  if (v5)
    v7 = (void *)v5;
  v18[0] = v7;
  -[WFWordPressSessionManager username](self, "username");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_24F8BBA48;
  v18[1] = v10;
  -[WFWordPressSessionManager password](self, "password");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_24F8BBA48;
  v18[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __63__WFWordPressSessionManager_getPostTypesWithCompletionHandler___block_invoke;
  v16[3] = &unk_24F8B5E18;
  v17 = v4;
  v15 = v4;
  -[WFWordPressSessionManager sendRequestWithMethod:parameters:completionHandler:](self, "sendRequestWithMethod:parameters:completionHandler:", CFSTR("wp.getPostTypes"), v14, v16);

}

- (void)getPostFormatsWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFWordPressSessionManager blogId](self, "blogId");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &unk_24F939A70;
  if (v5)
    v7 = (void *)v5;
  -[WFWordPressSessionManager username](self, "username", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_24F8BBA48;
  v15[1] = v10;
  -[WFWordPressSessionManager password](self, "password");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_24F8BBA48;
  v15[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWordPressSessionManager sendRequestWithMethod:parameters:completionHandler:](self, "sendRequestWithMethod:parameters:completionHandler:", CFSTR("wp.getPostFormats"), v14, v4);
}

- (void)getPostStatusesWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFWordPressSessionManager blogId](self, "blogId");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &unk_24F939A70;
  if (v5)
    v7 = (void *)v5;
  -[WFWordPressSessionManager username](self, "username", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_24F8BBA48;
  v15[1] = v10;
  -[WFWordPressSessionManager password](self, "password");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_24F8BBA48;
  v15[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWordPressSessionManager sendRequestWithMethod:parameters:completionHandler:](self, "sendRequestWithMethod:parameters:completionHandler:", CFSTR("wp.getPostStatusList"), v14, v4);
}

- (void)getPageTemplatesWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFWordPressSessionManager blogId](self, "blogId");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &unk_24F939A70;
  if (v5)
    v7 = (void *)v5;
  -[WFWordPressSessionManager username](self, "username", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_24F8BBA48;
  v15[1] = v10;
  -[WFWordPressSessionManager password](self, "password");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_24F8BBA48;
  v15[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWordPressSessionManager sendRequestWithMethod:parameters:completionHandler:](self, "sendRequestWithMethod:parameters:completionHandler:", CFSTR("wp.getPageTemplates"), v14, v4);
}

- (void)createPostWithTitle:(id)a3 content:(id)a4 type:(id)a5 date:(id)a6 format:(id)a7 status:(id)a8 allowingComments:(BOOL)a9 name:(id)a10 excerpt:(id)a11 template:(id)a12 tags:(id)a13 categories:(id)a14 thumbnailId:(id)a15 customFields:(id)a16 completionHandler:(id)a17
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v46;
  _QWORD v47[4];
  id v48;

  v43 = a17;
  v37 = a16;
  v42 = a15;
  v21 = a14;
  v41 = a12;
  v40 = a11;
  v39 = a10;
  v38 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v26 = a3;
  objc_msgSend(a13, "if_compactMap:", &__block_literal_global_6860);
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "if_compactMap:", &__block_literal_global_138);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)objc_opt_new();
  if (objc_msgSend(v46, "count"))
    v29 = v46;
  else
    v29 = 0;
  objc_msgSend(v28, "setValue:forKey:", v29, CFSTR("post_tag"));
  if (objc_msgSend(v27, "count"))
    v30 = v27;
  else
    v30 = 0;
  objc_msgSend(v28, "setValue:forKey:", v30, CFSTR("category"));
  v31 = (void *)objc_opt_new();
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __179__WFWordPressSessionManager_createPostWithTitle_content_type_date_format_status_allowingComments_name_excerpt_template_tags_categories_thumbnailId_customFields_completionHandler___block_invoke_3;
  v47[3] = &unk_24F8B2600;
  v48 = v31;
  v32 = v31;
  objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v47);

  v33 = (void *)objc_opt_new();
  objc_msgSend(v33, "setValue:forKey:", v26, CFSTR("post_title"));

  objc_msgSend(v33, "setValue:forKey:", v25, CFSTR("post_content"));
  objc_msgSend(v24, "name");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "setValue:forKey:", v34, CFSTR("post_type"));
  objc_msgSend(v33, "setValue:forKey:", v23, CFSTR("post_date_gmt"));

  objc_msgSend(v33, "setValue:forKey:", v22, CFSTR("post_format"));
  objc_msgSend(v33, "setValue:forKey:", v38, CFSTR("post_status"));

  objc_msgSend(v33, "setValue:forKey:", v39, CFSTR("post_name"));
  objc_msgSend(v33, "setValue:forKey:", v40, CFSTR("post_excerpt"));

  objc_msgSend(v33, "setValue:forKey:", v41, CFSTR("post_template"));
  objc_msgSend(v33, "setValue:forKey:", v28, CFSTR("terms_names"));
  objc_msgSend(v33, "setValue:forKey:", v42, CFSTR("post_thumbnail"));

  objc_msgSend(v33, "setValue:forKey:", v32, CFSTR("custom_fields"));
  if (a9)
    v35 = CFSTR("open");
  else
    v35 = CFSTR("closed");
  objc_msgSend(v33, "setValue:forKey:", v35, CFSTR("comment_status"));
  -[WFWordPressSessionManager createPostWithContent:completionHandler:](self, "createPostWithContent:completionHandler:", v33, v43);

}

- (void)createPostWithContent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[WFWordPressSessionManager blogId](self, "blogId");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &unk_24F939A70;
  if (v8)
    v10 = (void *)v8;
  v22[0] = v10;
  -[WFWordPressSessionManager username](self, "username");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_24F8BBA48;
  v22[1] = v13;
  -[WFWordPressSessionManager password](self, "password");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = &stru_24F8BBA48;
  v17 = (id)MEMORY[0x24BDBD1B8];
  if (v7)
    v17 = v7;
  v22[2] = v16;
  v22[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __69__WFWordPressSessionManager_createPostWithContent_completionHandler___block_invoke;
  v20[3] = &unk_24F8B5E18;
  v21 = v6;
  v19 = v6;
  -[WFWordPressSessionManager sendRequestWithMethod:parameters:completionHandler:](self, "sendRequestWithMethod:parameters:completionHandler:", CFSTR("wp.newPost"), v18, v20);

}

- (void)getPost:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[WFWordPressSessionManager blogId](self, "blogId");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = &unk_24F939A70;
  v22[0] = v10;
  -[WFWordPressSessionManager username](self, "username");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_24F8BBA48;
  v22[1] = v13;
  -[WFWordPressSessionManager password](self, "password");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = &stru_24F8BBA48;
  if (v7)
    v17 = v7;
  else
    v17 = &unk_24F939A70;
  v22[2] = v16;
  v22[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __55__WFWordPressSessionManager_getPost_completionHandler___block_invoke;
  v20[3] = &unk_24F8B5E18;
  v21 = v6;
  v19 = v6;
  -[WFWordPressSessionManager sendRequestWithMethod:parameters:completionHandler:](self, "sendRequestWithMethod:parameters:completionHandler:", CFSTR("wp.getPost"), v18, v20);

}

- (void)uploadFile:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, id);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  WPXMLRPCEncoder *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  void (**v42)(id, _QWORD, id);
  id v43;
  id v44;
  _QWORD v45[4];
  _QWORD v46[3];
  _QWORD v47[5];

  v47[3] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD, id))a4;
  v7 = a3;
  objc_msgSend(v7, "inputStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = CFSTR("name");
  objc_msgSend(v7, "filename");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v9;
  v46[1] = CFSTR("type");
  objc_msgSend(v7, "wfType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "MIMEType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = CFSTR("bits");
  v47[1] = v11;
  v47[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWordPressSessionManager blogId](self, "blogId");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = &unk_24F939A70;
  if (v13)
    v15 = (void *)v13;
  v45[0] = v15;
  -[WFWordPressSessionManager username](self, "username");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = &stru_24F8BBA48;
  v45[1] = v18;
  -[WFWordPressSessionManager password](self, "password");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = &stru_24F8BBA48;
  v45[2] = v21;
  v45[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[WPXMLRPCEncoder initWithMethod:andParameters:]([WPXMLRPCEncoder alloc], "initWithMethod:andParameters:", CFSTR("wp.uploadFile"), v22);
  v24 = (void *)MEMORY[0x24BE19628];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "UUIDString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "createTemporaryFileWithFilename:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "path");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  -[WPXMLRPCEncoder encodeToFile:error:](v23, "encodeToFile:error:", v28, &v44);
  v29 = v44;

  if (v29)
  {
    v6[2](v6, 0, v29);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "path");
    v40 = v8;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    objc_msgSend(v30, "attributesOfItemAtPath:error:", v31, &v43);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v43;
    objc_msgSend(v32, "objectForKey:", *MEMORY[0x24BDD0D08]);
    v39 = v12;
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithURL:", v27);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)MEMORY[0x24BDB7458];
    -[WFWordPressSessionManager endpointURL](self, "endpointURL");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "requestWithURL:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "_setNonAppInitiated:", 1);
    objc_msgSend(v37, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v37, "setHTTPBodyStream:", v34);
    objc_msgSend(v37, "setValue:forHTTPHeaderField:", CFSTR("text/xml"), CFSTR("Content-Type"));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v33, "unsignedLongLongValue"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setValue:forHTTPHeaderField:", v38, CFSTR("Content-Length"));

    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __58__WFWordPressSessionManager_uploadFile_completionHandler___block_invoke;
    v41[3] = &unk_24F8B5E18;
    v42 = v6;
    -[WFWordPressSessionManager sendRequest:completionHandler:](self, "sendRequest:completionHandler:", v37, v41);

    v8 = v40;
    v12 = v39;
  }

}

- (void)sendRequestWithMethod:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
  void (**v8)(id, _QWORD, id);
  id v9;
  id v10;
  WPXMLRPCEncoder *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v8 = (void (**)(id, _QWORD, id))a5;
  v9 = a4;
  v10 = a3;
  v11 = -[WPXMLRPCEncoder initWithMethod:andParameters:]([WPXMLRPCEncoder alloc], "initWithMethod:andParameters:", v10, v9);

  v17 = 0;
  -[WPXMLRPCEncoder dataEncodedWithError:](v11, "dataEncodedWithError:", &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v17;
  if (v13)
  {
    if (v8)
      v8[2](v8, 0, v13);
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDB7458];
    -[WFWordPressSessionManager endpointURL](self, "endpointURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestWithURL:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "_setNonAppInitiated:", 1);
    objc_msgSend(v16, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v16, "setHTTPBody:", v12);
    objc_msgSend(v16, "setValue:forHTTPHeaderField:", CFSTR("text/xml"), CFSTR("Content-Type"));
    -[WFWordPressSessionManager sendRequest:completionHandler:](self, "sendRequest:completionHandler:", v16, v8);

  }
}

- (void)sendRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[WFWordPressSessionManager session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__WFWordPressSessionManager_sendRequest_completionHandler___block_invoke;
  v11[3] = &unk_24F8BB3E0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v7, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "resume");
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)endpointURL
{
  return self->_endpointURL;
}

- (void)setEndpointURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)blogId
{
  return self->_blogId;
}

- (void)setBlogId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURLSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_blogId, 0);
  objc_storeStrong((id *)&self->_endpointURL, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

void __59__WFWordPressSessionManager_sendRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
  WPXMLRPCDecoder *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 200, 100);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "statusCode");
  if (objc_msgSend(v7, "length") && (v12 = objc_msgSend(v10, "containsIndex:", v11), !v9) && (v12 & 1) != 0)
  {
    v13 = -[WPXMLRPCDecoder initWithData:]([WPXMLRPCDecoder alloc], "initWithData:", v7);
    -[WPXMLRPCDecoder object](v13, "object");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPXMLRPCDecoder error](v13, "error");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[WPXMLRPCDecoder error](v13, "error");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v14;
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("faultCode"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = (void *)objc_opt_new();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("faultString"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setValue:forKey:", v18, *MEMORY[0x24BDD0FC8]);

        v19 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("faultCode"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("WFWordPressErrorDomain"), objc_msgSend(v20, "integerValue"), v17);
        v21 = objc_claimAutoreleasedReturnValue();

        v14 = 0;
        v9 = (id)v21;
      }
      else
      {
        v14 = v15;
      }

    }
    v31 = *(_QWORD *)(a1 + 32);
    if (v31)
      (*(void (**)(uint64_t, void *, id))(v31 + 16))(v31, v14, v9);

  }
  else
  {
    if (!v9)
    {
      v22 = objc_msgSend(v8, "statusCode");
      v23 = (void *)MEMORY[0x24BDD1540];
      if (v22 == 404)
      {
        v34 = *MEMORY[0x24BDD0FC8];
        WFLocalizedString(CFSTR("The specified blog URL was invalid."));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v24;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("WFWordPressErrorDomain"), 1, v25);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = *MEMORY[0x24BDD1308];
        v32 = *MEMORY[0x24BDD0FC8];
        v27 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("The WordPress request failed (%@)."));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDB7450], "localizedStringForStatusCode:", v11);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", v24, v25, v32);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v28;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", v26, -1, v29);
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v30 = *(_QWORD *)(a1 + 32);
    if (v30)
      (*(void (**)(uint64_t, _QWORD, id))(v30 + 16))(v30, 0, v9);
  }

}

void __58__WFWordPressSessionManager_uploadFile_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BEC3A08], "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v5, &v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __55__WFWordPressSessionManager_getPost_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BEC3A08], "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v5, &v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __69__WFWordPressSessionManager_createPostWithContent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "integerValue"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __179__WFWordPressSessionManager_createPostWithTitle_content_type_date_format_status_allowingComments_name_excerpt_template_tags_categories_thumbnailId_customFields_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  v9[0] = CFSTR("key");
  v9[1] = CFSTR("value");
  v10[0] = a2;
  v10[1] = a3;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

}

id __179__WFWordPressSessionManager_createPostWithTitle_content_type_date_format_status_allowingComments_name_excerpt_template_tags_categories_thumbnailId_customFields_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("&"), CFSTR("&amp;"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __179__WFWordPressSessionManager_createPostWithTitle_content_type_date_format_status_allowingComments_name_excerpt_template_tags_categories_thumbnailId_customFields_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("&"), CFSTR("&amp;"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __63__WFWordPressSessionManager_getPostTypesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = a1;
    v7 = v5;
    v8 = (void *)objc_opt_new();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        v14 = v6;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13);
          v16 = (void *)MEMORY[0x24BEC3A08];
          v17 = objc_opt_class();
          objc_msgSend(v9, "objectForKeyedSubscript:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v14;
          objc_msgSend(v16, "modelOfClass:fromJSONDictionary:error:", v17, v18, &v23);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v23;

          objc_msgSend(v8, "setValue:forKey:", v19, v15);
          ++v13;
          v14 = v6;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

    v20 = (void *)objc_msgSend(v8, "copy");
    a1 = v22;
  }
  else
  {

    v20 = 0;
  }
  v21 = *(_QWORD *)(a1 + 32);
  if (v21)
    (*(void (**)(uint64_t, void *, id))(v21 + 16))(v21, v20, v6);

}

void __67__WFWordPressSessionManager_getTermsForTaxonomy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BEC3A08], "modelsOfClass:fromJSONArray:error:", objc_opt_class(), v5, &v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __59__WFWordPressSessionManager_getBlogsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BEC3A08], "modelsOfClass:fromJSONArray:error:", objc_opt_class(), v5, &v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

@end
