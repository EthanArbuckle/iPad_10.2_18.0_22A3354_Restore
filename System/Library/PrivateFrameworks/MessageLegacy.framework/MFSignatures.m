@implementation MFSignatures

- (id)signatureMarkupForSendingEmailAddress:(id)a3
{
  return +[MFSignatures signatureMarkupFormat:](MFSignatures, "signatureMarkupFormat:", -[MFSignatures signatureForSendingEmailAddress:](self, "signatureForSendingEmailAddress:", a3));
}

+ (id)signatureMarkupFormat:(id)a3
{
  id result;

  result = (id)objc_msgSend(a3, "length");
  if (result)
    result = (id)objc_msgSend(CFSTR("<br/><br/>"), "stringByAppendingString:", a3);
  if (!result)
    return a3;
  return result;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__MFSignatures_sharedInstance__block_invoke;
  block[3] = &unk_1E81C9B98;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, block);
  return (id)sharedInstance_singleton;
}

id __30__MFSignatures_sharedInstance__block_invoke(uint64_t a1)
{
  id result;

  result = objc_alloc_init(*(Class *)(a1 + 32));
  sharedInstance_singleton = (uint64_t)result;
  return result;
}

- (MFSignatures)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFSignatures;
  return -[MFSignatures init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MFSignatures;
  -[MFSignatures dealloc](&v2, sel_dealloc);
}

- (id)_modelSpecificLocalizedStringKeyForKey:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)MGCopyAnswer(), "uppercaseString"), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  if (objc_msgSend(v4, "hasSuffix:", CFSTR("_SIMULATOR")))
    v4 = (void *)objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "rangeOfString:", CFSTR("_SIMULATOR")));
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), a3, v4);
}

- (id)defaultSignature
{
  id v2;
  void *v3;

  v2 = -[MFSignatures _modelSpecificLocalizedStringKeyForKey:](self, "_modelSpecificLocalizedStringKeyForKey:", CFSTR("DEFAULT_SIGNATURE"));
  if (v2)
    v3 = (void *)MFLookupLocalizedString((uint64_t)v2, 0, 0);
  else
    v3 = 0;
  if (objc_msgSend(v3, "length"))
    return v3;
  else
    return (id)MFLookupLocalizedString((uint64_t)CFSTR("DEFAULT_SIGNATURE_IPHONE"), (uint64_t)CFSTR("Sent from my iPhone"), 0);
}

- (id)_getValue:(id)a3
{
  MFMobileMailPreferenceDomain();
  MFMobileMailContainerPath();
  return (id)_CFPreferencesCopyValueWithContainer();
}

- (void)_setValue:(id)a3 value:(void *)a4
{
  MFMobileMailPreferenceDomain();
  MFMobileMailContainerPath();
  _CFPreferencesSetValueWithContainer();
  MFMobileMailContainerPath();
  if (_CFPreferencesSynchronizeWithContainer())
    GSSendAppPreferencesChanged();
}

- (id)signature
{
  id result;

  result = -[MFSignatures _getValue:](self, "_getValue:", CFSTR("SignatureKey"));
  if (!result)
    return -[MFSignatures defaultSignature](self, "defaultSignature");
  return result;
}

- (void)setSignature:(id)a3
{
  id v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = a3;
  if (objc_msgSend(a3, "isEqualToString:", -[MFSignatures defaultSignature](self, "defaultSignature")))
    v3 = 0;
  if ((objc_msgSend(v3, "isEqualToString:", -[MFSignatures signature](self, "signature")) & 1) == 0)
  {
    -[MFSignatures _setValue:value:](self, "_setValue:value:", CFSTR("SignatureKey"), v3);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mail.MailAccountSignaturesChanged"), 0, 0, 0);
  }
}

- (void)clearSignature
{
  -[MFSignatures _setValue:value:](self, "_setValue:value:", CFSTR("SignatureKey"), 0);
}

- (BOOL)useAccountSignatures
{
  return objc_msgSend(-[MFSignatures _getValue:](self, "_getValue:", CFSTR("UseAccountSignatures")), "BOOLValue");
}

- (void)setUseAccountSignatures:(BOOL)a3
{
  -[MFSignatures _setValue:value:](self, "_setValue:value:", CFSTR("UseAccountSignatures"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3));
}

- (id)signatureForAccount:(id)a3
{
  if (a3)
    return (id)objc_msgSend(a3, "customSignature");
  else
    return 0;
}

- (void)setSignature:(id)a3 forAccount:(id)a4
{
  id v5;
  __CFNotificationCenter *DarwinNotifyCenter;

  v5 = a3;
  if (objc_msgSend(a3, "isEqualToString:", -[MFSignatures defaultSignature](self, "defaultSignature")))
    v5 = 0;
  if (a4)
  {
    if ((objc_msgSend(v5, "isEqualToString:", -[MFSignatures signatureForAccount:](self, "signatureForAccount:", a4)) & 1) == 0)
    {
      objc_msgSend(a4, "setCustomSignature:", v5);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mail.MailAccountSignaturesChanged"), 0, 0, 0);
    }
  }
}

- (id)signatureForSendingEmailAddress:(id)a3
{
  id v5;
  id v6;

  if (!objc_msgSend(a3, "length")
    || (v5 = +[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", a3)) == 0)
  {
    v5 = +[MailAccount defaultMailAccountForDelivery](MailAccount, "defaultMailAccountForDelivery");
  }
  if (!-[MFSignatures useAccountSignatures](self, "useAccountSignatures")
    || (v6 = -[MFSignatures signatureForAccount:](self, "signatureForAccount:", v5)) == 0)
  {
    v6 = -[MFSignatures signature](self, "signature");
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D46098], "plainTextFromHTMLSnippet:", v6), "length"))
    return v6;
  else
    return 0;
}

- (void)setSignature:(id)a3 forEmailAddress:(id)a4
{
  id v7;

  if (!objc_msgSend(a4, "length")
    || (v7 = +[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", a4)) == 0)
  {
    v7 = +[MailAccount defaultMailAccountForDelivery](MailAccount, "defaultMailAccountForDelivery");
  }
  -[MFSignatures setSignature:forAccount:](self, "setSignature:forAccount:", a3, v7);
}

- (id)signaturePlainTextForSendingEmailAddress:(id)a3
{
  return +[MFSignatures signaturePlainTextFormat:](MFSignatures, "signaturePlainTextFormat:", -[MFSignatures signatureForSendingEmailAddress:](self, "signatureForSendingEmailAddress:", a3));
}

+ (id)signaturePlainTextFormat:(id)a3
{
  id result;
  void *v5;

  result = (id)objc_msgSend(a3, "length");
  if (result)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0D46098], "plainTextFromHTMLSnippet:", a3);
    result = (id)objc_msgSend(CFSTR("\n\n"), "stringByAppendingString:", objc_msgSend(v5, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet")));
  }
  if (!result)
    return a3;
  return result;
}

+ (id)stripSignatureMarkup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  if (objc_msgSend(a3, "length"))
  {
    v4 = (id)objc_msgSend(a3, "mutableCopy");
    v9 = 0;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(?:<br[/]?>){2}"), 1, &v9);
    if (v5)
    {
      v6 = objc_msgSend(v5, "rangeOfFirstMatchInString:options:range:", v4, 4, 0, objc_msgSend(v4, "length"));
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v4, "deleteCharactersInRange:", v6, v7);
    }
  }
  else
  {
    v4 = 0;
  }
  if (v4)
    return v4;
  else
    return a3;
}

@end
