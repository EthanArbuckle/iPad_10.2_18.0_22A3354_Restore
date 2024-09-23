@implementation TKSmartCardTokenSession

- (TKSmartCardTokenSession)initWithToken:(id)a3
{
  TKSmartCardTokenSession *v3;
  TKSmartCardTokenSession *v4;
  void *v5;
  uint64_t v6;
  TKSmartCard *smartCard;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TKSmartCardTokenSession;
  v3 = -[TKTokenSession initWithToken:](&v9, sel_initWithToken_, a3);
  v4 = v3;
  if (v3)
  {
    -[TKTokenSession token](v3, "token");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "smartCard");
    v6 = objc_claimAutoreleasedReturnValue();
    smartCard = v4->_smartCard;
    v4->_smartCard = (TKSmartCard *)v6;

  }
  return v4;
}

- (void)beginRequest
{
  TKSmartCard *errorCard;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TKSmartCardTokenSession;
  -[TKTokenSession beginRequest](&v4, sel_beginRequest);
  errorCard = self->_errorCard;
  self->_errorCard = 0;

}

- (TKSmartCard)smartCard
{
  void *v3;
  TKSmartCard *errorCard;
  void *v5;
  _BOOL4 hasSession;
  TKSmartCard *smartCard;
  _BOOL4 v8;
  id v9;
  void *v10;
  TKSmartCard *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  TKSmartCardWithError *v15;
  TKSmartCard *v16;
  TKSmartCard *v17;
  id v19;
  id v20;

  -[TKTokenSession token](self, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  errorCard = self->_errorCard;
  if (errorCard)
    goto LABEL_14;
  objc_msgSend(v3, "AID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    hasSession = self->_hasSession;

    if (!hasSession)
    {
      smartCard = self->_smartCard;
      v20 = 0;
      v8 = -[TKSmartCard beginSessionWithError:](smartCard, "beginSessionWithError:", &v20);
      v9 = v20;
      v10 = v9;
      if (v8)
      {
        v11 = self->_smartCard;
        objc_msgSend(v3, "AID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v10;
        v13 = -[TKSmartCard selectApplication:error:](v11, "selectApplication:error:", v12, &v19);
        v14 = v19;

        if (v13)
        {
          self->_hasSession = 1;
LABEL_11:

          goto LABEL_12;
        }
        -[TKSmartCard endSession](self->_smartCard, "endSession");
        if (!v14)
          goto LABEL_12;
LABEL_10:
        v15 = -[TKSmartCardWithError initWithCard:error:]([TKSmartCardWithError alloc], "initWithCard:error:", self->_smartCard, v14);
        v16 = self->_errorCard;
        self->_errorCard = &v15->super;

        goto LABEL_11;
      }
      v14 = v9;
      if (v9)
        goto LABEL_10;
    }
  }
LABEL_12:
  errorCard = self->_errorCard;
  if (!errorCard)
    errorCard = self->_smartCard;
LABEL_14:
  v17 = errorCard;

  return v17;
}

- (void)endRequest
{
  TKSmartCard *errorCard;
  objc_super v4;

  if (self->_hasSession)
  {
    -[TKSmartCard endSession](self->_smartCard, "endSession");
    self->_hasSession = 0;
  }
  errorCard = self->_errorCard;
  self->_errorCard = 0;

  v4.receiver = self;
  v4.super_class = (Class)TKSmartCardTokenSession;
  -[TKTokenSession endRequest](&v4, sel_endRequest);
}

- (id)name
{
  void *v2;
  void *v3;

  -[TKSmartCard slot](self->_smartCard, "slot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCard, 0);
  objc_storeStrong((id *)&self->_smartCard, 0);
}

@end
