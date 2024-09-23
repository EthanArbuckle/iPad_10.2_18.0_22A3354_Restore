@implementation MFSignatures

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__MFSignatures_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, block);
  return (id)sharedInstance_singleton;
}

void __30__MFSignatures_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v1;

}

- (MFSignatures)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFSignatures;
  return -[MFSignatures init](&v3, sel_init);
}

- (id)_modelSpecificLocalizedStringKeyForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MGCopyAnswer();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasSuffix:", CFSTR("_SIMULATOR")))
  {
    objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "rangeOfString:", CFSTR("_SIMULATOR")));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)defaultSignature
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  -[MFSignatures _modelSpecificLocalizedStringKeyForKey:](self, "_modelSpecificLocalizedStringKeyForKey:", CFSTR("DEFAULT_SIGNATURE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    MFLookupLocalizedString(v2, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (!objc_msgSend(v4, "length"))
  {
    MFLookupLocalizedString(CFSTR("DEFAULT_SIGNATURE_IPHONE"), CFSTR("Sent from my iPhone"), CFSTR("Message"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }

  return v4;
}

- (id)_getValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)signature
{
  void *v3;

  -[MFSignatures _getValue:](self, "_getValue:", CFSTR("SignatureKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MFSignatures defaultSignature](self, "defaultSignature");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setSignature:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v11;

  v11 = a3;
  -[MFSignatures defaultSignature](self, "defaultSignature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", v4))
    v5 = 0;
  else
    v5 = v11;
  v6 = v5;

  -[MFSignatures signature](self, "signature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("SignatureKey"));

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mail.MailAccountSignaturesChanged"), 0, 0, 0);
  }

}

- (void)clearSignature
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", 0, CFSTR("SignatureKey"));

}

- (BOOL)useAccountSignatures
{
  void *v2;
  char v3;

  -[MFSignatures _getValue:](self, "_getValue:", CFSTR("UseAccountSignatures"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setUseAccountSignatures:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("UseAccountSignatures"));

}

- (id)signatureForAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "customSignature");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setSignature:(id)a3 forAccount:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v13;

  v13 = a3;
  v6 = a4;
  -[MFSignatures defaultSignature](self, "defaultSignature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", v7))
    v8 = 0;
  else
    v8 = v13;
  v9 = v8;

  if (v6)
  {
    -[MFSignatures signatureForAccount:](self, "signatureForAccount:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v6, "setCustomSignature:", v9);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mail.MailAccountSignaturesChanged"), 0, 0, 0);
    }
  }

}

- (id)signatureForSendingEmailAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (!objc_msgSend(v4, "length")
    || (+[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", v4),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[MailAccount defaultMailAccountForDelivery](MailAccount, "defaultMailAccountForDelivery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!-[MFSignatures useAccountSignatures](self, "useAccountSignatures")
    || (-[MFSignatures signatureForAccount:](self, "signatureForAccount:", v5),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[MFSignatures signature](self, "signature");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D46098], "plainTextFromHTMLSnippet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {

    v6 = 0;
  }

  return v6;
}

- (void)setSignature:(id)a3 forEmailAddress:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "length")
    || (+[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", v6),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[MailAccount defaultMailAccountForDelivery](MailAccount, "defaultMailAccountForDelivery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MFSignatures setSignature:forAccount:](self, "setSignature:forAccount:", v8, v7);

}

- (id)signatureMarkupForSendingEmailAddress:(id)a3
{
  void *v3;
  void *v4;

  -[MFSignatures signatureForSendingEmailAddress:](self, "signatureForSendingEmailAddress:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFSignatures signatureMarkupFormat:](MFSignatures, "signatureMarkupFormat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)signaturePlainTextForSendingEmailAddress:(id)a3
{
  void *v3;
  void *v4;

  -[MFSignatures signatureForSendingEmailAddress:](self, "signatureForSendingEmailAddress:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFSignatures signaturePlainTextFormat:](MFSignatures, "signaturePlainTextFormat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)signatureMarkupFormat:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(CFSTR("<br/><br/>"), "stringByAppendingString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (v4)
    v5 = v4;
  else
    v5 = v3;
  v6 = v5;

  return v6;
}

+ (id)signaturePlainTextFormat:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D46098], "plainTextFromHTMLSnippet:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("\n\n"), "stringByAppendingString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (v7)
    v8 = v7;
  else
    v8 = v3;
  v9 = v8;

  return v9;
}

@end
