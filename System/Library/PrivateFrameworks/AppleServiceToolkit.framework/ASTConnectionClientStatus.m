@implementation ASTConnectionClientStatus

- (ASTConnectionClientStatus)initWithClientStatus:(id)a3
{
  id v4;
  ASTConnectionClientStatus *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASTConnectionClientStatus;
  v5 = -[ASTMaterializedConnection init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "payload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "payload");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASTMaterializedConnection addBody:gzip:](v5, "addBody:gzip:", v7, +[ASTConnectionUtilities isGzipEnabled](ASTConnectionUtilities, "isGzipEnabled"));

      objc_msgSend(v4, "base64Signature");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASTMaterializedConnection setSignature:](v5, "setSignature:", v8);

    }
  }

  return v5;
}

- (id)endpoint
{
  return CFSTR("clientstatus");
}

@end
