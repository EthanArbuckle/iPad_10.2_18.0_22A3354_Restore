@implementation MFMailSignatureController

- (id)_signatureStringForSender:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (MFIsMobileMail())
  {
    objc_msgSend(MEMORY[0x1E0D4D600], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "signatureForSendingEmailAddress:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D46AA8], "customSignatureForSendingEmailAddress:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)isDefaultSignatureForSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D4D600], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultSignature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMailSignatureController _signatureStringForSender:](self, "_signatureStringForSender:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "isEqualToString:", v6);

  return (char)v5;
}

- (void)addSignatureForSender:(id)a3 bodyField:(id)a4 prepend:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  id v10;

  v5 = a5;
  v10 = a3;
  objc_msgSend(a4, "signatureControllerProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailSignatureController _getSignatureStringForSender:](self, "_getSignatureStringForSender:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSignature:prepend:", v9, v5);

}

- (void)removeSignatureForSender:(id)a3 bodyField:(id)a4
{
  id v4;

  objc_msgSend(a4, "signatureControllerProxy", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeSignature");

}

- (void)updateSignatureForSender:(id)a3 bodyField:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a4, "signatureControllerProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailSignatureController _getSignatureStringForSender:](self, "_getSignatureStringForSender:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateSignature:", v7);

}

- (void)finalizeSignatureForBodyField:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  objc_msgSend(a3, "signatureControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finalizeSignature:", v6);

}

- (id)_getSignatureStringForSender:(id)a3
{
  void *v3;
  void *v4;

  -[MFMailSignatureController _signatureStringForSender:](self, "_signatureStringForSender:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "ef_emptyStringIfNil:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasCustomSigntureForSender:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[MFMailSignatureController _signatureStringForSender:](self, "_signatureStringForSender:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D4D600], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultSignature");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v3, "isEqualToString:", v5) ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

@end
