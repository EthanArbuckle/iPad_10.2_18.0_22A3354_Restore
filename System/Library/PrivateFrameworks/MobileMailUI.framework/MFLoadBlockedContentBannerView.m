@implementation MFLoadBlockedContentBannerView

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__MFLoadBlockedContentBannerView_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_4 != -1)
    dispatch_once(&log_onceToken_4, block);
  return (id)log_log_4;
}

void __37__MFLoadBlockedContentBannerView_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_4;
  log_log_4 = (uint64_t)v1;

}

- (MFLoadBlockedContentBannerView)initWithFrame:(CGRect)a3 blockedContentTypes:(unint64_t)a4 blockingReason:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  MFLoadBlockedContentBannerView *v12;
  MFLoadBlockedContentBannerView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v21;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFLoadBlockedContentBannerView.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("blockedContentTypes"));

  }
  v25.receiver = self;
  v25.super_class = (Class)MFLoadBlockedContentBannerView;
  v12 = -[MFSuggestionBannerView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    v12->_blockedContentTypes = a4;
    v12->_blockingReason = a5;
    v14 = (void *)objc_opt_new();
    -[MFLoadBlockedContentBannerView title](v13, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v15);

    objc_msgSend(v14, "setAccessoryType:", 0);
    -[MFLoadBlockedContentBannerView actionTitle](v13, "actionTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActionTitle:", v16);

    objc_msgSend(v14, "setActionButtonType:", 1);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v13);
    v17 = (void *)MEMORY[0x1E0D19F18];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __83__MFLoadBlockedContentBannerView_initWithFrame_blockedContentTypes_blockingReason___block_invoke;
    v22[3] = &unk_1E9A031B0;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v17, "actionWithTitle:handler:", &stru_1E9A04480, v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPrimaryAction:", v18);

    -[MFSuggestionBannerView setBanner:](v13, "setBanner:", v14);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  return v13;
}

void __83__MFLoadBlockedContentBannerView_initWithFrame_blockedContentTypes_blockingReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "primaryAction");

}

- (void)setBlockedContentTypes:(unint64_t)a3
{
  if (self->_blockedContentTypes != a3)
  {
    self->_blockedContentTypes = a3;
    -[MFLoadBlockedContentBannerView _updateBannerText](self, "_updateBannerText");
  }
}

- (void)_updateBannerText
{
  int64_t blockingReason;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  blockingReason = self->_blockingReason;
  switch(blockingReason)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("REMOTE_IMAGES_BLOCKED_ENCRYPTION"), &stru_1E9A04480, CFSTR("Main"));
      v15 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LOAD_REMOTE_IMAGES_ENCRYPTION"), &stru_1E9A04480, CFSTR("Main"));
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MESSAGE_HAS_MULTIPLE_SIGNERS"), &stru_1E9A04480, CFSTR("Main"));
      v15 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LOAD_MESSAGE"), &stru_1E9A04480, CFSTR("Main"));
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_VERIFY_MESSAGE_CONTENT"), &stru_1E9A04480, CFSTR("Main"));
      v15 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LOAD_MESSAGE"), &stru_1E9A04480, CFSTR("Main"));
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      if ((self->_blockedContentTypes & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("REMOTE_CONTENT_BLOCKED_TRUST_EVALUATION"), &stru_1E9A04480, CFSTR("Main"));
        v15 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LOAD_REMOTE_CONTENT_TRUST_EVALUATION"), &stru_1E9A04480, CFSTR("Main"));
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (blockingReason == 5)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("REMOTE_IMAGES_BLOCKED_LDM"), &stru_1E9A04480, CFSTR("Main"));
          v15 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DISPLAY_REMOTE_IMAGES_LDM"), &stru_1E9A04480, CFSTR("Main"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("REMOTE_IMAGES_BLOCKED_OTHER"), &stru_1E9A04480, CFSTR("Main"));
          v15 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LOAD_REMOTE_IMAGES_OTHER"), &stru_1E9A04480, CFSTR("Main"));
        }
        v6 = objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  v12 = (void *)v6;

  -[MFSuggestionBannerView banner](self, "banner");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v15);

  -[MFSuggestionBannerView banner](self, "banner");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActionTitle:", v12);

}

- (void)primaryAction
{
  void *v3;

  -[MFLoadBlockedContentBannerView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadBlockedContentBannerDidTriggerLoad:", self);

  -[MFLoadBlockedContentBannerView enablePrivacyProtectionAlertForAccount](self, "enablePrivacyProtectionAlertForAccount");
}

- (void)enablePrivacyProtectionAlertForAccount
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
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "shouldPresentRemoteContentAlert"))
  {
    v4 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ENABLE_MAIL_PRIVACY_PROTECTION"), &stru_1E9A04480, CFSTR("Main"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ENABLE_MAIL_PRIVACY_PROTECTION_DESCRIPTION"), &stru_1E9A04480, CFSTR("Main"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NOT_NOW"), &stru_1E9A04480, CFSTR("Main"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __72__MFLoadBlockedContentBannerView_enablePrivacyProtectionAlertForAccount__block_invoke;
    v26[3] = &unk_1E9A03288;
    v14 = v3;
    v27 = v14;
    objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 1, v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v15);

    v16 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("TURN_ON"), &stru_1E9A04480, CFSTR("Main"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v13;
    v22 = 3221225472;
    v23 = __72__MFLoadBlockedContentBannerView_enablePrivacyProtectionAlertForAccount__block_invoke_58;
    v24 = &unk_1E9A03288;
    v25 = v14;
    objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 0, &v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v19, v21, v22, v23, v24);

    -[MFLoadBlockedContentBannerView delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "presentViewController:", v9);

  }
}

uint64_t __72__MFLoadBlockedContentBannerView_enablePrivacyProtectionAlertForAccount__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  +[MFLoadBlockedContentBannerView log](MFLoadBlockedContentBannerView, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D56AF000, v2, OS_LOG_TYPE_DEFAULT, "Mail Privacy Protection Alert with returnCode dismiss", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", 0, *MEMORY[0x1E0D1E068]);
}

uint64_t __72__MFLoadBlockedContentBannerView_enablePrivacyProtectionAlertForAccount__block_invoke_58(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  +[MFLoadBlockedContentBannerView log](MFLoadBlockedContentBannerView, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D56AF000, v2, OS_LOG_TYPE_DEFAULT, "Turning on Mail Privacy Protection Alert", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", 0, *MEMORY[0x1E0D1E068]);
  return objc_msgSend(*(id *)(a1 + 32), "enableMailTrackingProtection:", 1);
}

- (void)_titleControlTapped:(id)a3
{
  id v4;

  -[MFLoadBlockedContentBannerView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadBlockedContentBannerDidTriggerLoad:", self);

}

- (id)title
{
  int64_t blockingReason;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  blockingReason = self->_blockingReason;
  switch(blockingReason)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("REMOTE_IMAGES_BLOCKED_ENCRYPTION"), &stru_1E9A04480, CFSTR("Main"));
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MESSAGE_HAS_MULTIPLE_SIGNERS"), &stru_1E9A04480, CFSTR("Main"));
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_VERIFY_MESSAGE_CONTENT"), &stru_1E9A04480, CFSTR("Main"));
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      if ((self->_blockedContentTypes & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("REMOTE_CONTENT_BLOCKED_TRUST_EVALUATION"), &stru_1E9A04480, CFSTR("Main"));
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v5;
        if (blockingReason == 5)
          objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("REMOTE_IMAGES_BLOCKED_LDM"), &stru_1E9A04480, CFSTR("Main"));
        else
          objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("REMOTE_IMAGES_BLOCKED_OTHER"), &stru_1E9A04480, CFSTR("Main"));
        v4 = objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  v6 = (void *)v4;

  return v6;
}

- (id)actionTitle
{
  int64_t blockingReason;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  blockingReason = self->_blockingReason;
  if (blockingReason == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LOAD_REMOTE_IMAGES_ENCRYPTION"), &stru_1E9A04480, CFSTR("Main"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (blockingReason == 3 || blockingReason == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LOAD_MESSAGE"), &stru_1E9A04480, CFSTR("Main"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if ((self->_blockedContentTypes & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LOAD_REMOTE_CONTENT_TRUST_EVALUATION"), &stru_1E9A04480, CFSTR("Main"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5;
    if (blockingReason == 5)
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DISPLAY_REMOTE_IMAGES_LDM"), &stru_1E9A04480, CFSTR("Main"));
    else
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LOAD_REMOTE_IMAGES_OTHER"), &stru_1E9A04480, CFSTR("Main"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;

  return v6;
}

- (MFLoadBlockedContentBannerViewDelegate)delegate
{
  return (MFLoadBlockedContentBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)blockedContentTypes
{
  return self->_blockedContentTypes;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
