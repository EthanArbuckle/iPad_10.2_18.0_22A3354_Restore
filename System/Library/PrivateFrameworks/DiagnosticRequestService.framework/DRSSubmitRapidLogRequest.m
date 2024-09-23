@implementation DRSSubmitRapidLogRequest

+ (Class)_moClass
{
  return (Class)objc_opt_class();
}

+ (id)entityName
{
  return CFSTR("DRSSubmitRapidLogRequestMO");
}

- (unint64_t)expectedType
{
  return 5;
}

- (id)_initWithSubmitRapidLogRequestMO_ON_MOC_QUEUE:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DRSSubmitRapidLogRequest;
  v5 = -[DRSSubmitLogRequest _initWithSubmitLogRequestMO_ON_MOC_QUEUE:](&v13, sel__initWithSubmitLogRequestMO_ON_MOC_QUEUE_, v4);
  if (v5)
  {
    objc_msgSend(v4, "cfDidSucceed");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v5[18];
    v5[18] = v6;

    objc_msgSend(v4, "cfFailureReason");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v5[19];
    v5[19] = v8;

    objc_msgSend(v4, "cfReplyPayload");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v5[20];
    v5[20] = v10;

  }
  return v5;
}

- (id)requestType
{
  return CFSTR("SubmitRapidLog");
}

- (id)targetContainerName
{
  return 0;
}

- (DRSSubmitRapidLogRequest)initWithXPCDict:(id)a3
{
  DRSSubmitRapidLogRequest *v3;
  DRSSubmitRapidLogRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DRSSubmitRapidLogRequest;
  v3 = -[DRSRequest initWithXPCDict:](&v6, sel_initWithXPCDict_, a3);
  v4 = v3;
  if (v3)
    -[DRSRequest setDecisionServerDecision:](v3, "setDecisionServerDecision:", 2);
  return v4;
}

- (unint64_t)logSizeLimitBytes
{
  return 104857600;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char IsNil;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  char v24;
  char v25;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)DRSSubmitRapidLogRequest;
  if (-[DRSSubmitLogRequest isEqualToRequest:](&v31, sel_isEqualToRequest_, v4))
  {
    v5 = v4;
    -[DRSSubmitRapidLogRequest cfDidSucceed](self, "cfDidSucceed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cfDidSucceed");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    IsNil = _oneIsNil((uint64_t)v6, (uint64_t)v7);

    if ((IsNil & 1) != 0)
      goto LABEL_9;
    -[DRSSubmitRapidLogRequest cfDidSucceed](self, "cfDidSucceed");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[DRSSubmitRapidLogRequest cfDidSucceed](self, "cfDidSucceed");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cfDidSucceed");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToNumber:", v12);

      if (!v13)
        goto LABEL_9;
    }
    -[DRSSubmitRapidLogRequest cfFailureReason](self, "cfFailureReason");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cfFailureReason");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = _oneIsNil((uint64_t)v14, (uint64_t)v15);

    if ((v16 & 1) != 0)
      goto LABEL_9;
    -[DRSSubmitRapidLogRequest cfFailureReason](self, "cfFailureReason");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      -[DRSSubmitRapidLogRequest cfFailureReason](self, "cfFailureReason");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cfFailureReason");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqualToString:", v20);

      if (!v21)
        goto LABEL_9;
    }
    -[DRSSubmitRapidLogRequest cfReplyPayload](self, "cfReplyPayload");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cfReplyPayload");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = _oneIsNil((uint64_t)v22, (uint64_t)v23);

    if ((v24 & 1) != 0)
    {
LABEL_9:
      v25 = 0;
    }
    else
    {
      -[DRSSubmitRapidLogRequest cfReplyPayload](self, "cfReplyPayload");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = (void *)v27;
        -[DRSSubmitRapidLogRequest cfReplyPayload](self, "cfReplyPayload");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "cfReplyPayload");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v29, "isEqualToData:", v30);

      }
      else
      {
        v25 = 1;
      }
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)jsonCompatibleDictionaryRepresentationVerbose:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = a3;
  v5 = (void *)MEMORY[0x1DF0B6DC4](self, a2);
  v15.receiver = self;
  v15.super_class = (Class)DRSSubmitRapidLogRequest;
  -[DRSRequest jsonCompatibleDictionaryRepresentationVerbose:](&v15, sel_jsonCompatibleDictionaryRepresentationVerbose_, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSSubmitRapidLogRequest cfDidSucceed](self, "cfDidSucceed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DRSSubmitRapidLogRequest cfDidSucceed](self, "cfDidSucceed");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("cfDidSucceed"));

    -[DRSSubmitRapidLogRequest cfFailureReason](self, "cfFailureReason");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[DRSSubmitRapidLogRequest cfFailureReason](self, "cfFailureReason");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("cfFailureReason"));

    }
    -[DRSSubmitRapidLogRequest cfReplyPayload](self, "cfReplyPayload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[DRSSubmitRapidLogRequest cfReplyPayload](self, "cfReplyPayload");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("cfReplyPayload"));

    }
  }
  objc_autoreleasePoolPop(v5);
  return v6;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)DRSSubmitRapidLogRequest;
  -[DRSRequest debugDescription](&v13, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSSubmitRapidLogRequest cfDidSucceed](self, "cfDidSucceed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[DRSSubmitRapidLogRequest cfDidSucceed](self, "cfDidSucceed");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("-");
  }
  -[DRSSubmitRapidLogRequest cfFailureReason](self, "cfFailureReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[DRSSubmitRapidLogRequest cfFailureReason](self, "cfFailureReason");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("-");
  }
  -[DRSSubmitRapidLogRequest cfReplyPayload](self, "cfReplyPayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[DRSSubmitRapidLogRequest cfReplyPayload](self, "cfReplyPayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@ %@"), v4, v6, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@ %@"), v4, v6, v8, CFSTR("-"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v7)
  if (v5)

  return v11;
}

- (void)_configureRequestMO:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DRSSubmitRapidLogRequest;
  -[DRSSubmitLogRequest _configureRequestMO:](&v9, sel__configureRequestMO_, v4);
  v5 = v4;
  -[DRSSubmitRapidLogRequest cfDidSucceed](self, "cfDidSucceed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCfDidSucceed:", v6);

  -[DRSSubmitRapidLogRequest cfFailureReason](self, "cfFailureReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCfFailureReason:", v7);

  -[DRSSubmitRapidLogRequest cfReplyPayload](self, "cfReplyPayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCfReplyPayload:", v8);

}

- (NSNumber)cfDidSucceed
{
  return self->_cfDidSucceed;
}

- (void)setCfDidSucceed:(id)a3
{
  objc_storeStrong((id *)&self->_cfDidSucceed, a3);
}

- (NSString)cfFailureReason
{
  return self->_cfFailureReason;
}

- (void)setCfFailureReason:(id)a3
{
  objc_storeStrong((id *)&self->_cfFailureReason, a3);
}

- (NSData)cfReplyPayload
{
  return self->_cfReplyPayload;
}

- (void)setCfReplyPayload:(id)a3
{
  objc_storeStrong((id *)&self->_cfReplyPayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cfReplyPayload, 0);
  objc_storeStrong((id *)&self->_cfFailureReason, 0);
  objc_storeStrong((id *)&self->_cfDidSucceed, 0);
}

@end
