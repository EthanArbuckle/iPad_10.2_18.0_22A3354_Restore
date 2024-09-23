@implementation MICandidateAppContainer

- (NSURL)appURL
{
  NSURL *appURL;
  id v4;
  void *v5;
  void *v6;
  uint64_t *v7;
  NSURL *v8;
  NSURL *v9;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  appURL = self->_appURL;
  if (!appURL)
  {
    -[MICandidateContainer rootURL](self, "rootURL");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = ___AppURLInContainer_block_invoke;
    v12[3] = &unk_1E6163768;
    v12[4] = &v13;
    objc_msgSend(v5, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v4, 1, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (v6 && !v14[5] && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      objc_msgSend(v4, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

      v7 = v14;
    }
    v8 = (NSURL *)(id)v7[5];

    _Block_object_dispose(&v13, 8);
    v9 = self->_appURL;
    self->_appURL = v8;

    appURL = self->_appURL;
  }
  return appURL;
}

- (BOOL)isPlaceholder
{
  void *v2;
  void *v3;
  char v4;

  -[MICandidateAppContainer appURL](self, "appURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "bundleAtURLIsPlaceholder:", v2);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAppURL:(id)a3
{
  objc_storeStrong((id *)&self->_appURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appURL, 0);
}

@end
