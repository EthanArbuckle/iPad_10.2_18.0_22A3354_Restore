@implementation DRSSubmitLogRequest

- (void)_configureRequestMO:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DRSSubmitLogRequest;
  -[DRSRequest _configureRequestMO:](&v7, sel__configureRequestMO_, v4);
  v5 = v4;
  -[DRSRequest logType](self, "logType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLogType:", v6);

}

+ (Class)_moClass
{
  return (Class)objc_opt_class();
}

+ (id)entityName
{
  return CFSTR("DRSSubmitLogRequestMO");
}

- (unint64_t)expectedType
{
  return 2;
}

- (id)_initWithSubmitLogRequestMO_ON_MOC_QUEUE:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DRSSubmitLogRequest;
  v5 = -[DRSRequest _initWithRequestMO_ON_MOC_QUEUE:](&v8, sel__initWithRequestMO_ON_MOC_QUEUE_, v4);
  if (v5)
  {
    objc_msgSend(v4, "logType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLogType:", v6);

  }
  return v5;
}

- (id)requestType
{
  return CFSTR("SubmitLog");
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DRSSubmitLogRequest;
  if (-[DRSRequest isEqualToRequest:](&v10, sel_isEqualToRequest_, v4))
  {
    v5 = v4;
    -[DRSRequest logType](self, "logType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)replyForMessage:(id)a3
{
  xpc_object_t reply;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  const char *v11;
  id v12;

  reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    v5 = -[DRSRequest requestState](self, "requestState");
    if (DRSRequestOutcomeForState(v5) == 1 && (v5 == 4357 || v5 == 4352))
    {
      xpc_dictionary_set_BOOL(reply, "SubmitLog_DidSucceed", 0);
      -[DRSRequest errorDescription](self, "errorDescription");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = CFSTR("Unknown");
      if (v6)
        v8 = (__CFString *)v6;
      v9 = v8;

      v10 = objc_retainAutorelease(v9);
      v11 = (const char *)-[__CFString UTF8String](v10, "UTF8String");

      xpc_dictionary_set_string(reply, "SubmitLog_FailureReason", v11);
    }
    else
    {
      xpc_dictionary_set_BOOL(reply, "SubmitLog_DidSucceed", 1);
    }
    v12 = reply;
  }

  return reply;
}

@end
