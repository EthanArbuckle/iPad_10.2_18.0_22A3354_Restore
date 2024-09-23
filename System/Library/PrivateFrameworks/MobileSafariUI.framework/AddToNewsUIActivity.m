@implementation AddToNewsUIActivity

+ (int64_t)activityCategory
{
  return 1;
}

+ (id)activityWithTabDocument:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  AddToNewsUIActivity *v10;
  uint64_t v12;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", CFSTR("com.apple.news.openinnews"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "_plugIn");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userElection");

    if (!v9)
    {
      v12 = 0;
      if ((objc_msgSend(v7, "attemptOptIn:", &v12) & 1) == 0)
        NSLog((NSString *)CFSTR("Extension optIn failed"));
    }
    v10 = -[AddToNewsUIActivity initWithApplicationExtension:tabDocument:]([AddToNewsUIActivity alloc], "initWithApplicationExtension:tabDocument:", v7, v5);
  }
  else if (a4 && !*a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, 0);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (AddToNewsUIActivity)initWithApplicationExtension:(id)a3 tabDocument:(id)a4
{
  id v7;
  AddToNewsUIActivity *v8;
  AddToNewsUIActivity *v9;
  AddToNewsUIActivity *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AddToNewsUIActivity;
  v8 = -[UIApplicationExtensionActivity initWithApplicationExtension:](&v12, sel_initWithApplicationExtension_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_tabDocument, a4);
    v10 = v9;
  }

  return v9;
}

- (AddToNewsUIActivity)init
{

  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  _BOOL4 v5;

  -[TabDocument URL](self->_tabDocument, "URL", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "safari_isHTTPFamilyURL")
    || -[TabDocument isPDFDocument](self->_tabDocument, "isPDFDocument")
    || -[TabDocument isDisplayingStandaloneImage](self->_tabDocument, "isDisplayingStandaloneImage"))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = !-[TabDocument isDisplayingStandaloneMedia](self->_tabDocument, "isDisplayingStandaloneMedia");
  }

  return v5;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  objc_super v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TabDocument titleForSharing](self->_tabDocument, "titleForSharing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocument URL](self->_tabDocument, "URL");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
    goto LABEL_7;
  v9 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
  v10 = *MEMORY[0x1E0CB2A10];
  v22[0] = CFSTR("FRItemHasRSSFeed");
  v22[1] = v10;
  v23[0] = MEMORY[0x1E0C9AAA0];
  v11 = objc_alloc(MEMORY[0x1E0CB36C8]);
  v12 = (void *)objc_msgSend(v11, "initWithItem:typeIdentifier:", v5, *MEMORY[0x1E0CA5C20]);
  v21[0] = v12;
  v13 = objc_alloc(MEMORY[0x1E0CB36C8]);
  v14 = (void *)objc_msgSend(v13, "initWithItem:typeIdentifier:", v7, *MEMORY[0x1E0CA5C90]);
  v21[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInfo:", v16);

  if (!v9)
  {
LABEL_7:
    v18.receiver = self;
    v18.super_class = (Class)AddToNewsUIActivity;
    -[UIApplicationExtensionActivity prepareWithActivityItems:](&v18, sel_prepareWithActivityItems_, v4);
  }
  else
  {
    v20 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19.receiver = self;
    v19.super_class = (Class)AddToNewsUIActivity;
    -[UIApplicationExtensionActivity prepareWithActivityItems:](&v19, sel_prepareWithActivityItems_, v17);

  }
}

- (TabDocument)tabDocument
{
  return self->_tabDocument;
}

- (void)setTabDocument:(id)a3
{
  objc_storeStrong((id *)&self->_tabDocument, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabDocument, 0);
}

@end
