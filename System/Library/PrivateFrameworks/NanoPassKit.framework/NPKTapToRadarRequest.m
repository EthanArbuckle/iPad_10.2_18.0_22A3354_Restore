@implementation NPKTapToRadarRequest

- (NPKTapToRadarRequest)initWithTitle:(id)a3 body:(id)a4
{
  return -[NPKTapToRadarRequest initWithTitle:body:attachmentPaths:](self, "initWithTitle:body:attachmentPaths:", a3, a4, 0);
}

- (NPKTapToRadarRequest)initWithTitle:(id)a3 body:(id)a4 attachmentPaths:(id)a5
{
  id v8;
  id v9;
  id v10;
  NPKTapToRadarRequest *v11;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  NSString *body;
  uint64_t v16;
  NSSet *attachmentsPaths;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NPKTapToRadarRequest;
  v11 = -[NPKTapToRadarRequest init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    body = v11->_body;
    v11->_body = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    attachmentsPaths = v11->_attachmentsPaths;
    v11->_attachmentsPaths = (NSSet *)v16;

  }
  return v11;
}

- (NPKTapToRadarRequest)initWithDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  NPKTapToRadarRequest *v15;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NPKTapToRadarTitleUserNotificationKey"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("Wallet issue detected automatically");
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NPKTapToRadarBodyUserNotificationKey"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("Requested to file a rdar.");
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NPKTapToRadarAttachmentsPathsNotificationKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v13);
  else
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[NPKTapToRadarRequest initWithTitle:body:attachmentPaths:]([NPKTapToRadarRequest alloc], "initWithTitle:body:attachmentPaths:", v8, v12, v14);

  return v15;
}

- (NPKTapToRadarRequest)initWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NPKTapToRadarRequest *v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__20;
  v30 = __Block_byref_object_dispose__20;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__20;
  v24 = __Block_byref_object_dispose__20;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__20;
  v18 = __Block_byref_object_dispose__20;
  v19 = 0;
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("tap-to-radar"));

  if (v7)
  {
    objc_msgSend(v5, "queryItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __36__NPKTapToRadarRequest_initWithURL___block_invoke;
    v13[3] = &unk_24CFEC788;
    v13[4] = &v26;
    v13[5] = &v20;
    v13[6] = &v14;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

  }
  if (!v15[5])
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v15[5];
    v15[5] = v9;

  }
  if (v27[5] && v21[5])
  {
    v11 = -[NPKTapToRadarRequest initWithTitle:body:attachmentPaths:](self, "initWithTitle:body:attachmentPaths:");
  }
  else
  {

    v11 = 0;
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v11;
}

void __36__NPKTapToRadarRequest_initWithURL___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a2;
  objc_msgSend(v22, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Title"));

  if (v7)
  {
    objc_msgSend(v22, "value");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = a1[4];
LABEL_5:
    v12 = *(_QWORD *)(v9 + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v8;
    goto LABEL_6;
  }
  objc_msgSend(v22, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Description"));

  if (v11)
  {
    objc_msgSend(v22, "value");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = a1[5];
    goto LABEL_5;
  }
  objc_msgSend(v22, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Attachments"));

  if (!v16)
    goto LABEL_7;
  v17 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v22, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(","));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(a1[6] + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

LABEL_6:
LABEL_7:
  v14 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40);
  if (v14)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
    if (v14)
      LOBYTE(v14) = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
  }
  *a4 = v14;

}

+ (BOOL)canPostRequest
{
  return PKIsInternalInstall() != 0;
}

- (NSURL)tapToRadarURL
{
  NSURL *tapToRadarURL;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSURL *v19;
  NSURL *v20;

  tapToRadarURL = self->_tapToRadarURL;
  if (!tapToRadarURL)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", CFSTR("tap-to-radar://new"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("Wallet"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("watchOS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("547743"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Title"), self->_title);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

    if (-[NSString containsString:](self->_body, "containsString:", CFSTR("IMPORTANT:\nThe attached logging may contain the time and location of recent transactions you've made with Apple Pay. These logs greatly assist diagnosing and resolving issues.")))
    {
      v10 = self->_body;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\n%@"), self->_body, CFSTR("IMPORTANT:\nThe attached logging may contain the time and location of recent transactions you've made with Apple Pay. These logs greatly assist diagnosing and resolving issues."));
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Description"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("phone,watch"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Serious Bug"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Reproducibility"), CFSTR("I Didn't Try"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

    -[NSSet allObjects](self->_attachmentsPaths, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR(","));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Attachments"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v18);

    objc_msgSend(v4, "setQueryItems:", v5);
    objc_msgSend(v4, "URL");
    v19 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v20 = self->_tapToRadarURL;
    self->_tapToRadarURL = v19;

    tapToRadarURL = self->_tapToRadarURL;
  }
  return tapToRadarURL;
}

- (void)post
{
  NSString *body;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  if (PKIsInternalInstall())
  {
    v8[0] = CFSTR("NPKTapToRadarTitleUserNotificationKey");
    v8[1] = CFSTR("NPKTapToRadarBodyUserNotificationKey");
    body = self->_body;
    v9[0] = self->_title;
    v9[1] = body;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSSet count](self->_attachmentsPaths, "count"))
    {
      v5 = (void *)objc_msgSend(v4, "mutableCopy");
      -[NSSet allObjects](self->_attachmentsPaths, "allObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("NPKTapToRadarAttachmentsPathsNotificationKey"));

      v4 = v5;
    }
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("com.apple.nanoPassKit.presentTapToRadarDistributedNotification"), 0, v4);

  }
}

+ (void)postWithTitle:(id)a3 body:(id)a4
{
  id v5;
  id v6;
  NPKTapToRadarRequest *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NPKTapToRadarRequest initWithTitle:body:]([NPKTapToRadarRequest alloc], "initWithTitle:body:", v6, v5);

  -[NPKTapToRadarRequest post](v7, "post");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p> title:%@ body:%@"), objc_opt_class(), self, self->_title, self->_body);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (NSSet)attachmentsPaths
{
  return self->_attachmentsPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentsPaths, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_tapToRadarURL, 0);
}

@end
