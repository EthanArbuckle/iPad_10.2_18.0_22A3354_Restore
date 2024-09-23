@implementation SHMatcherRequest

+ (id)requestSignatureGenerationOnce
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requestSignatureGenerationOnceForRequestID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)requestSignatureGenerationOnceForRequestID:(id)a3
{
  id v3;
  SHMatcherRequest *v4;

  v3 = a3;
  v4 = -[SHMatcherRequest initWithSignature:deadline:sendNotifications:stopCondition:requestType:requestID:]([SHMatcherRequest alloc], "initWithSignature:deadline:sendNotifications:stopCondition:requestType:requestID:", 0, 0, 0, 0, 1, v3);

  return v4;
}

+ (id)requestSignatureGenerationUntilDeadline:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD1880];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requestSignatureGenerationUntilDeadline:forRequestID:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)requestSignatureGenerationUntilDeadline:(id)a3 forRequestID:(id)a4
{
  id v5;
  id v6;
  SHMatcherRequest *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SHMatcherRequest initWithSignature:deadline:sendNotifications:stopCondition:requestType:requestID:]([SHMatcherRequest alloc], "initWithSignature:deadline:sendNotifications:stopCondition:requestType:requestID:", 0, v6, 0, 3, 1, v5);

  return v7;
}

+ (id)requestToMatchSignature:(id)a3 installationID:(id)a4 sendNotifications:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v5 = a5;
  v8 = (void *)MEMORY[0x24BDD1880];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requestToMatchSignature:installationID:sendNotifications:forRequestID:", v10, v9, v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)requestToMatchSignature:(id)a3 installationID:(id)a4 sendNotifications:(BOOL)a5 forRequestID:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  SHMatcherRequest *v12;

  v6 = a5;
  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = -[SHMatcherRequest initWithSignature:deadline:installationID:sendNotifications:stopCondition:requestType:requestID:]([SHMatcherRequest alloc], "initWithSignature:deadline:installationID:sendNotifications:stopCondition:requestType:requestID:", v11, 0, v10, v6, 1, 0, v9);

  return v12;
}

+ (id)requestToMatchUntilDeadline:(id)a3 sendNotifications:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDD1880];
  v7 = a3;
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requestToMatchUntilDeadline:sendNotifications:forRequestID:", v7, v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)requestToMatchUntilDeadline:(id)a3 sendNotifications:(BOOL)a4 forRequestID:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  SHMatcherRequest *v9;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  v9 = -[SHMatcherRequest initWithSignature:deadline:sendNotifications:stopCondition:requestType:requestID:]([SHMatcherRequest alloc], "initWithSignature:deadline:sendNotifications:stopCondition:requestType:requestID:", 0, v8, v5, 3, 2, v7);

  return v9;
}

+ (id)requestOnceWithNotifications:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requestOnceWithNotifications:forRequestID:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)requestOnceWithNotifications:(BOOL)a3 forRequestID:(id)a4
{
  _BOOL8 v4;
  id v5;
  SHMatcherRequest *v6;

  v4 = a3;
  v5 = a4;
  v6 = -[SHMatcherRequest initWithSignature:deadline:sendNotifications:stopCondition:requestType:requestID:]([SHMatcherRequest alloc], "initWithSignature:deadline:sendNotifications:stopCondition:requestType:requestID:", 0, 0, v4, 0, 2, v5);

  return v6;
}

+ (id)requestUntilMatchWithNotifications:(BOOL)a3 forRequestID:(id)a4
{
  _BOOL8 v4;
  id v5;
  SHMatcherRequest *v6;

  v4 = a3;
  v5 = a4;
  v6 = -[SHMatcherRequest initWithSignature:deadline:sendNotifications:stopCondition:requestType:requestID:]([SHMatcherRequest alloc], "initWithSignature:deadline:sendNotifications:stopCondition:requestType:requestID:", 0, 0, v4, 2, 2, v5);

  return v6;
}

+ (id)requestUntilMatchWithNotifications:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requestUntilMatchWithNotifications:forRequestID:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)requestOnceWithAppIntentForRequestID:(id)a3
{
  id v3;
  SHMatcherRequest *v4;

  v3 = a3;
  v4 = -[SHMatcherRequest initWithSignature:deadline:sendNotifications:stopCondition:requestType:requestID:]([SHMatcherRequest alloc], "initWithSignature:deadline:sendNotifications:stopCondition:requestType:requestID:", 0, 0, 0, 2, 3, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHMatcherRequest)initWithSignature:(id)a3 deadline:(id)a4 sendNotifications:(BOOL)a5 stopCondition:(int64_t)a6 requestType:(int64_t)a7 requestID:(id)a8
{
  id v15;
  id v16;
  id v17;
  SHMatcherRequest *v18;
  SHMatcherRequest *v19;
  objc_super v21;

  v15 = a3;
  v16 = a4;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)SHMatcherRequest;
  v18 = -[SHMatcherRequest init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_signature, a3);
    objc_storeStrong((id *)&v19->_deadline, a4);
    v19->_sendNotifications = a5;
    v19->_stopCondition = a6;
    v19->_type = a7;
    objc_storeStrong((id *)&v19->_requestID, a8);
  }

  return v19;
}

- (SHMatcherRequest)initWithSignature:(id)a3 deadline:(id)a4 installationID:(id)a5 sendNotifications:(BOOL)a6 stopCondition:(int64_t)a7 requestType:(int64_t)a8 requestID:(id)a9
{
  _BOOL8 v11;
  id v16;
  SHMatcherRequest *v17;
  SHMatcherRequest *v18;

  v11 = a6;
  v16 = a5;
  v17 = -[SHMatcherRequest initWithSignature:deadline:sendNotifications:stopCondition:requestType:requestID:](self, "initWithSignature:deadline:sendNotifications:stopCondition:requestType:requestID:", a3, a4, v11, a7, a8, a9);
  v18 = v17;
  if (v17)
    objc_storeStrong((id *)&v17->_installationID, a5);

  return v18;
}

- (SHMatcherRequest)initWithCoder:(id)a3
{
  id v4;
  SHMatcherRequest *v5;
  uint64_t v6;
  SHSignature *signature;
  uint64_t v8;
  NSDate *deadline;
  uint64_t v10;
  NSString *installationID;
  uint64_t v12;
  NSUUID *requestID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SHMatcherRequest;
  v5 = -[SHMatcherRequest init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
    v6 = objc_claimAutoreleasedReturnValue();
    signature = v5->_signature;
    v5->_signature = (SHSignature *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deadline"));
    v8 = objc_claimAutoreleasedReturnValue();
    deadline = v5->_deadline;
    v5->_deadline = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installationID"));
    v10 = objc_claimAutoreleasedReturnValue();
    installationID = v5->_installationID;
    v5->_installationID = (NSString *)v10;

    v5->_sendNotifications = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sendNotifications"));
    v5->_stopCondition = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stopCondition"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestID"));
    v12 = objc_claimAutoreleasedReturnValue();
    requestID = v5->_requestID;
    v5->_requestID = (NSUUID *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *requestID;
  id v5;

  requestID = self->_requestID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requestID, CFSTR("requestID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signature, CFSTR("signature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deadline, CFSTR("deadline"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installationID, CFSTR("installationID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_sendNotifications, CFSTR("sendNotifications"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stopCondition, CFSTR("stopCondition"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("requestType"));

}

- (NSString)installationID
{
  NSString *installationID;

  installationID = self->_installationID;
  if (installationID)
    return installationID;
  +[SHRotatingInstallationID cachedInstallationForDays:](SHRotatingInstallationID, "cachedInstallationForDays:", 31);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasHitDeadline
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[SHMatcherRequest deadline](self, "deadline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMatcherRequest deadline](self, "deadline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "laterDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == v4;

  return v7;
}

- (double)watchdogTimeout
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[SHMatcherRequest deadline](self, "deadline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SHMatcherRequest deadline](self, "deadline");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = v5;

  }
  else
  {
    v6 = 45.0;
  }

  return v6;
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (SHSignature)signature
{
  return self->_signature;
}

- (NSDate)deadline
{
  return self->_deadline;
}

- (BOOL)sendNotifications
{
  return self->_sendNotifications;
}

- (int64_t)stopCondition
{
  return self->_stopCondition;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deadline, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_installationID, 0);
}

@end
