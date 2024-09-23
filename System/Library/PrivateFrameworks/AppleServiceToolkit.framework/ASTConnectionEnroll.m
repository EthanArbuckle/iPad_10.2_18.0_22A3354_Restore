@implementation ASTConnectionEnroll

- (ASTConnectionEnroll)initWithIdentity:(id)a3
{
  id v4;
  ASTConnectionEnroll *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASTConnectionEnroll;
  v5 = -[ASTMaterializedConnection init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "json");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v11 = CFSTR("identifiers");
      objc_msgSend(v4, "json");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASTMaterializedConnection addBody:](v5, "addBody:", v8);

    }
  }

  return v5;
}

- (id)endpoint
{
  return CFSTR("enroll");
}

@end
