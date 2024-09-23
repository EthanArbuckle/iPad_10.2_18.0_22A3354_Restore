@implementation SGWalletPassViewManager

- (SGWalletPassViewManager)initWithData:(id)a3
{
  id v4;
  SGWalletPassViewManager *v5;
  uint64_t v6;
  NSData *passData;
  void *v8;
  objc_class *v9;
  id v10;
  NSData *v11;
  uint64_t v12;
  id v13;
  PKPass *pass;
  PKPass *v15;
  id v17;
  objc_super v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SGWalletPassViewManager;
  v5 = -[SGWalletPassViewManager init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    passData = v5->_passData;
    v5->_passData = (NSData *)v6;

    if (v5->_passData)
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2050000000;
      v8 = (void *)getPKPassClass_softClass;
      v23 = getPKPassClass_softClass;
      if (!getPKPassClass_softClass)
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __getPKPassClass_block_invoke;
        v19[3] = &unk_1E62D7128;
        v19[4] = &v20;
        __getPKPassClass_block_invoke((uint64_t)v19);
        v8 = (void *)v21[3];
      }
      v9 = objc_retainAutorelease(v8);
      _Block_object_dispose(&v20, 8);
      v10 = [v9 alloc];
      v11 = v5->_passData;
      v17 = 0;
      v12 = objc_msgSend(v10, "initWithData:error:", v11, &v17);
      v13 = v17;
      pass = v5->_pass;
      v5->_pass = (PKPass *)v12;

      if (v13)
      {
        v15 = v5->_pass;
        v5->_pass = 0;

      }
    }
  }

  return v5;
}

- (id)passes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_pass;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)title
{
  PKPass *pass;
  __CFString *v3;

  pass = self->_pass;
  if (pass)
  {
    -[PKPass localizedDescription](pass, "localizedDescription");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E62D74E0;
  }
  return v3;
}

- (id)organizationName
{
  void *pass;

  pass = self->_pass;
  if (pass)
  {
    objc_msgSend(pass, "organizationName");
    pass = (void *)objc_claimAutoreleasedReturnValue();
  }
  return pass;
}

- (double)passTimeInterval
{
  PKPass *pass;
  void *v4;
  void *v5;
  double v6;
  double v7;

  pass = self->_pass;
  if (!pass)
    return 0.0;
  -[PKPass relevantDate](pass, "relevantDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0.0;
  -[PKPass relevantDate](self->_pass, "relevantDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  return v7;
}

- (id)passStyle
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  switch(-[PKPass style](self->_pass, "style"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SuggestionsWalletPassStyleCoupon");
      break;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SuggestionsWalletPassStyleGiftCard");
      break;
    case 2:
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SuggestionsWalletPassStyleEventTicket");
      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SuggestionsWalletPassStyleBoardingPass");
      break;
    case 6:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SuggestionsWalletPassStylePayment");
      break;
    case 7:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SuggestionsWalletPassStyleAccess");
      break;
    case 8:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SuggestionsWalletPassStyleHealthPass");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SuggestionsWalletPassStyleGeneric");
      break;
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_1E62D74E0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)icon
{
  void *pass;

  pass = self->_pass;
  if (pass)
  {
    objc_msgSend(pass, "icon");
    pass = (void *)objc_claimAutoreleasedReturnValue();
  }
  return pass;
}

- (id)passView
{
  void *v3;
  objc_class *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v3 = (void *)getPKPassViewClass_softClass;
  v10 = getPKPassViewClass_softClass;
  if (!getPKPassViewClass_softClass)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getPKPassViewClass_block_invoke;
    v6[3] = &unk_1E62D7128;
    v6[4] = &v7;
    __getPKPassViewClass_block_invoke((uint64_t)v6);
    v3 = (void *)v8[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v7, 8);
  return (id)objc_msgSend([v4 alloc], "initWithPass:content:suppressedContent:", self->_pass, 5, 6);
}

- (id)addPassViewController
{
  void *v3;
  objc_class *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v3 = (void *)getPKAddPassesViewControllerClass_softClass;
  v10 = getPKAddPassesViewControllerClass_softClass;
  if (!getPKAddPassesViewControllerClass_softClass)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getPKAddPassesViewControllerClass_block_invoke;
    v6[3] = &unk_1E62D7128;
    v6[4] = &v7;
    __getPKAddPassesViewControllerClass_block_invoke((uint64_t)v6);
    v3 = (void *)v8[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v7, 8);
  return (id)objc_msgSend([v4 alloc], "initWithPass:", self->_pass);
}

- (NSData)passData
{
  return self->_passData;
}

- (PKPass)pass
{
  return self->_pass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_passData, 0);
}

@end
