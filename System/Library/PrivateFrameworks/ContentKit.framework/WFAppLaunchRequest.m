@implementation WFAppLaunchRequest

- (void)performWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (!-[WFAppLaunchRequest requiresUserFacingApp](self, "requiresUserFacingApp")
    || -[WFAppLaunchRequest requiresUserFacingApp](self, "requiresUserFacingApp")
    && -[WFAppLaunchRequest isRequestForUserFacingApp](self, "isRequestForUserFacingApp"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__WFAppLaunchRequest_performWithCompletionHandler___block_invoke;
    v8[3] = &unk_24C4E2960;
    v8[4] = self;
    v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)WFAppLaunchRequest;
    -[INCAppLaunchRequest performWithCompletionHandler:](&v7, sel_performWithCompletionHandler_, v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("FBSOpenApplicationErrorDomain"), 4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppLaunchRequest readableErrorFromError:](self, "readableErrorFromError:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);

  }
}

- (BOOL)isRequestForUserFacingApp
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDC1540]);
  -[INCAppLaunchRequest bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

  LOBYTE(v4) = objc_msgSend(v5, "wf_isAvailableInContext:", 0);
  return (char)v4;
}

- (id)readableErrorFromError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  _QWORD v38[3];
  _QWORD v39[4];

  v39[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("FBSOpenApplicationServiceErrorDomain"));

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    WFLocalizedString(CFSTR("Couldn't Open App"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("The app couldn't be opened because an unknown error occurred."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDC1558];
    -[INCAppLaunchRequest bundleIdentifier](self, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v12, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "localizedName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");

        if (!v15)
        {
          v24 = 0;
LABEL_9:
          -[WFAppLaunchRequest rootCauseErrorFromError:](self, "rootCauseErrorFromError:", v4);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "domain");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "isEqualToString:", CFSTR("FBSOpenApplicationErrorDomain")))
          {
            v27 = objc_msgSend(v25, "code");

            if (v27 != 7)
            {
LABEL_16:
              v31 = (void *)MEMORY[0x24BDD1540];
              objc_msgSend(v4, "domain");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v4, "code");
              v34 = *MEMORY[0x24BDD0FC8];
              v38[0] = *MEMORY[0x24BDD0FD8];
              v38[1] = v34;
              v39[0] = v9;
              v39[1] = v10;
              v38[2] = *MEMORY[0x24BDD1398];
              v39[2] = v4;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, v33, v35);
              v36 = objc_claimAutoreleasedReturnValue();

              v4 = (id)v36;
              return v4;
            }
            v28 = (void *)MEMORY[0x24BDD17C8];
            if (v24)
            {
              WFLocalizedString(CFSTR("“%1$@” couldn't be opened because the %2$@ is locked."));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "localizedName");
              v29 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "localizedStringWithFormat:", v26, v29, v8);
              v30 = objc_claimAutoreleasedReturnValue();

              v10 = (void *)v29;
            }
            else
            {
              WFLocalizedString(CFSTR("The app couldn't be opened because the %@ is locked."));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "localizedStringWithFormat:", v26, v8);
              v30 = objc_claimAutoreleasedReturnValue();
            }

            v10 = (void *)v30;
          }

          goto LABEL_16;
        }
        v16 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("Couldn't Open “%@”"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringWithFormat:", v17, v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("“%@” couldn't be opened because an unknown error occurred."));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringWithFormat:", v21, v22);
        v23 = objc_claimAutoreleasedReturnValue();

        v24 = 1;
        v10 = (void *)v23;
        v9 = (void *)v19;
      }
      else
      {
        v24 = 0;
        v21 = v13;
        v13 = 0;
      }
    }
    else
    {
      v21 = 0;
      v24 = 0;
    }

    goto LABEL_9;
  }
  return v4;
}

- (id)rootCauseErrorFromError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDD1398]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFAppLaunchRequest rootCauseErrorFromError:](self, "rootCauseErrorFromError:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (BOOL)requiresUserFacingApp
{
  return self->_requiresUserFacingApp;
}

- (void)setRequiresUserFacingApp:(BOOL)a3
{
  self->_requiresUserFacingApp = a3;
}

void __51__WFAppLaunchRequest_performWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "readableErrorFromError:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, a2, v4);

  }
}

@end
