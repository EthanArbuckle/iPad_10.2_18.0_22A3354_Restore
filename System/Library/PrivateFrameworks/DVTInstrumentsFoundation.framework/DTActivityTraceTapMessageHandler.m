@implementation DTActivityTraceTapMessageHandler

- (id)messageReceived:(id)a3
{
  id v4;
  uint64_t v5;
  DTActivityTraceTapMemo *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  DTActivityTraceTapMemo *v11;
  void *v12;
  DTActivityTraceTapMemo *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DTActivityTraceTapMessageHandler;
  -[DTTapMessageHandler messageReceived:](&v15, sel_messageReceived_, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (DTActivityTraceTapMemo *)v5;
  if (v4 && !v5)
  {
    v7 = objc_retainAutorelease(v4);
    if (objc_msgSend(v7, "getBufferWithReturnedLength:", 0))
    {
      v6 = -[DTActivityTraceTapMemo initWithMessage:]([DTActivityTraceTapMemo alloc], "initWithMessage:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectWithAllowedClasses:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ((v10 = objc_msgSend(v9, "kind"), v10 == 8) || v10 == 5))
      {
        v11 = [DTActivityTraceTapMemo alloc];
        v12 = (void *)objc_opt_new();
        v13 = -[DTActivityTraceTapMemo initWithData:](v11, "initWithData:", v12);

        -[DTTapDataMemo setFinalMemo:](v13, "setFinalMemo:", 1);
      }
      else
      {
        v13 = 0;
      }
      v6 = v13;

    }
  }

  return v6;
}

@end
