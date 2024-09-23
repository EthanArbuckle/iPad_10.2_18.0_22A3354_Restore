@implementation SFClipLink

+ (double)iconHeight
{
  return 29.0;
}

+ (id)localizedUppercaseStringForAction:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return &stru_1E21FE780;
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)localizedCaptionForClipNamed:(id)a3 action:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;

  v5 = a3;
  if (a4 == 2)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
  }
  else if (a4 == 1)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
  }
  else
  {
    if (a4)
    {
      v8 = &stru_1E21FE780;
      goto LABEL_9;
    }
    v6 = (void *)MEMORY[0x1E0CB3940];
  }
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v5);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v8;
}

- (SFClipLink)initWithURL:(id)a3 bundleIdentifier:(id)a4 actionTitle:(id)a5
{
  id v9;
  id v10;
  id v11;
  SFClipLink *v12;
  SFClipLink *v13;
  uint64_t v14;
  NSString *actionTitle;
  SFClipLink *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SFClipLink;
  v12 = -[SFClipLink init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a4);
    objc_msgSend(v11, "localizedUppercaseString");
    v14 = objc_claimAutoreleasedReturnValue();
    actionTitle = v13->_actionTitle;
    v13->_actionTitle = (NSString *)v14;

    v16 = v13;
  }

  return v13;
}

- (void)getClipAttributesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  SFClipLink *v12;
  id v13;
  _QWORD block[4];
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  if (v4)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v5 = (void *)getCPSClipMetadataRequestClass_softClass;
    v20 = getCPSClipMetadataRequestClass_softClass;
    v6 = MEMORY[0x1E0C809B0];
    if (!getCPSClipMetadataRequestClass_softClass)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __getCPSClipMetadataRequestClass_block_invoke;
      v16[3] = &unk_1E21E3330;
      v16[4] = &v17;
      __getCPSClipMetadataRequestClass_block_invoke((uint64_t)v16);
      v5 = (void *)v18[3];
    }
    v7 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v17, 8);
    if (-[objc_class instancesRespondToSelector:](v7, "instancesRespondToSelector:", sel_initWithURL_fallbackClipBundleID_)&& (-[objc_class instancesRespondToSelector:](v7, "instancesRespondToSelector:", sel_requestMetadataWithCompletion_) & 1) != 0)
    {
      v8 = (void *)objc_msgSend([v7 alloc], "initWithURL:fallbackClipBundleID:", self->_url, self->_bundleIdentifier);
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke_2;
      v10[3] = &unk_1E21E4738;
      v12 = self;
      v13 = v4;
      v11 = v8;
      v9 = v8;
      objc_msgSend(v9, "requestMetadataWithCompletion:", v10);

    }
    else
    {
      block[0] = v6;
      block[1] = 3221225472;
      block[2] = __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke;
      block[3] = &unk_1E21E4698;
      v15 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v9 = v15;
    }

  }
}

uint64_t __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E21E4710;
  v8 = v3;
  v11 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  uint8_t buf[16];

  v2 = *(void **)(a1 + 32);
  if (!v2 || objc_msgSend(v2, "clipIncompatibleWithCurrentDevice"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "invocationPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEligible") & 1) != 0 || (objc_msgSend(v3, "isRecoverable") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "clipBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "safari_isCaseInsensitiveEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24));

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "fullAppName");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      objc_msgSend(*(id *)(a1 + 32), "clipName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48);
      v11 = v9;
      if (!v9)
        v11 = *(void **)(v10 + 40);
      objc_storeStrong((id *)(v10 + 32), v11);

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = objc_msgSend(*(id *)(a1 + 32), "clipAction");
      else
        v12 = 0;
      objc_msgSend((id)objc_opt_class(), "localizedUppercaseStringForAction:", v12);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 48);
      v20 = *(void **)(v19 + 48);
      *(_QWORD *)(v19 + 48) = v18;

      objc_msgSend((id)objc_opt_class(), "localizedCaptionForClipNamed:action:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40), v12);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 48);
      v23 = *(void **)(v22 + 56);
      *(_QWORD *)(v22 + 56) = v21;

      +[SFClipLink iconHeight](SFClipLink, "iconHeight");
      v25 = v24;
      v27 = *(_QWORD *)(a1 + 32);
      v26 = *(void **)(a1 + 40);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke_21;
      v29[3] = &unk_1E21E46E8;
      v28 = *(id *)(a1 + 56);
      v31 = v25;
      v29[4] = *(_QWORD *)(a1 + 48);
      v30 = v28;
      objc_msgSend(v26, "requestDownloadedIconWithMetadata:completion:", v27, v29);

      goto LABEL_19;
    }
    v13 = WBS_LOG_CHANNEL_PREFIXBanners();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v14 = "Not showing App Clip Banner because the URL corresponds to a different app clip bundle identifier";
      v15 = v13;
      v16 = OS_LOG_TYPE_INFO;
LABEL_15:
      _os_log_impl(&dword_18B7B2000, v15, v16, v14, buf, 2u);
    }
  }
  else
  {
    v17 = WBS_LOG_CHANNEL_PREFIXBanners();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "Not showing App Clip Banner because the app clip cannot be launched";
      v15 = v17;
      v16 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_15;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_19:

}

void __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke_2_22;
  v6[3] = &unk_1E21E46C0;
  v7 = v3;
  v4 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke_2_22(uint64_t a1)
{
  double v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = _SFScreenScale();
    v3 = objc_alloc(MEMORY[0x1E0DC3870]);
    objc_msgSend(*(id *)(a1 + 32), "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithContentsOfFile:", v4);

    v6 = objc_alloc(MEMORY[0x1E0D3A7C0]);
    v7 = objc_retainAutorelease(v5);
    v8 = (void *)objc_msgSend(v6, "initWithCGImage:scale:", objc_msgSend(v7, "CGImage"), v2);
    v9 = objc_alloc(MEMORY[0x1E0D3A820]);
    v18[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithImages:", v10);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", *(double *)(a1 + 56), *(double *)(a1 + 56), v2);
    objc_msgSend(v12, "setShape:", 5);
    objc_msgSend(v11, "imageForDescriptor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = (void *)MEMORY[0x1E0DC3870];
      v16 = objc_msgSend(v13, "CGImage");
      objc_msgSend(v14, "scale");
      objc_msgSend(v15, "imageWithCGImage:scale:orientation:", v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setIcon:", v17);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)clipName
{
  return self->_clipName;
}

- (void)setClipName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)actionCaption
{
  return self->_actionCaption;
}

- (void)setActionCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (BOOL)siteRequestsShowCard
{
  return self->_siteRequestsShowCard;
}

- (void)setSiteRequestsShowCard:(BOOL)a3
{
  self->_siteRequestsShowCard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_actionCaption, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_clipName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
