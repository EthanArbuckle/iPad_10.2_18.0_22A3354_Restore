@implementation HMFMessage

- (id)dateForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMFMessage messagePayload](self, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_dateForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMFMessage messagePayload](self, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMFMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 userInfo:(id)a6 headers:(id)a7 payload:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HMFMessageInternal *v19;
  void *v20;
  HMFMessage *v21;
  HMFMessage *v22;
  HMFMessage *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!v14)
  {
    v24 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v26;
      v27 = "%{public}@Name is a required argument";
LABEL_10:
      _os_log_impl(&dword_19B546000, v25, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);

    }
LABEL_11:

    objc_autoreleasePoolPop(v24);
    v23 = 0;
    goto LABEL_12;
  }
  if (!v15)
  {
    v24 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v26;
      v27 = "%{public}@Destination is a required argument";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v19 = objc_alloc_init(HMFMessageInternal);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessageInternal setIdentifier:](v19, "setIdentifier:", v20);

  -[HMFMessageInternal setName:](v19, "setName:", v14);
  -[HMFMessageInternal setQualityOfService:](v19, "setQualityOfService:", a4);
  -[HMFMessageInternal setDestination:](v19, "setDestination:", v15);
  -[HMFMessageInternal setUserInfo:](v19, "setUserInfo:", v16);
  -[HMFMessageInternal setHeaders:](v19, "setHeaders:", v17);
  -[HMFMessageInternal setMessagePayload:](v19, "setMessagePayload:", v18);
  v29.receiver = self;
  v29.super_class = (Class)HMFMessage;
  v21 = -[HMFMessage init](&v29, sel_init);
  v22 = v21;
  if (v21)
    -[HMFMessage __initWithInternalMessage:](v21, "__initWithInternalMessage:", v19);
  self = v22;

  v23 = self;
LABEL_12:

  return v23;
}

- (HMFMessage)initWithCoder:(id)a3
{
  id v4;
  HMFMessageInternal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  HMFMessage *v17;

  v4 = a3;
  v5 = objc_alloc_init(HMFMessageInternal);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMF.identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessageInternal setIdentifier:](v5, "setIdentifier:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMF.name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessageInternal setName:](v5, "setName:", v7);

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HMF.timeout"));
  -[HMFMessageInternal setTimeout:](v5, "setTimeout:");
  -[HMFMessageInternal setQualityOfService:](v5, "setQualityOfService:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMF.qos")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMF.destination"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessageInternal setDestination:](v5, "setDestination:", v8);

  +[HMFMessage allowedClassesForXPC](HMFMessage, "allowedClassesForXPC");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("HMF.headers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  -[HMFMessageInternal setHeaders:](v5, "setHeaders:", v12);
  +[HMFMessage allowedClassesForXPC](HMFMessage, "allowedClassesForXPC");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("HMF.payload"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  -[HMFMessageInternal setMessagePayload:](v5, "setMessagePayload:", v16);
  v17 = -[HMFMessage initWithInternalMessage:](self, "initWithInternalMessage:", v5);

  return v17;
}

+ (NSSet)allowedClassesForXPC
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[15];

  v6[14] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  v6[8] = objc_opt_class();
  v6[9] = objc_opt_class();
  v6[10] = objc_opt_class();
  v6[11] = objc_opt_class();
  v6[12] = objc_opt_class();
  v6[13] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  HMFMutableMessage *v6;

  -[HMFMessage internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyWithZone:", a3);

  v6 = -[HMFMessage initWithInternalMessage:](+[HMFMutableMessage allocWithZone:](HMFMutableMessage, "allocWithZone:", a3), "initWithInternalMessage:", v5);
  return v6;
}

- (id)copy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMFMessage;
  return -[HMFMessage copy](&v3, sel_copy);
}

- (HMFMessage)initWithInternalMessage:(id)a3
{
  id v4;
  HMFMessage *v5;
  HMFMessage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMFMessage;
  v5 = -[HMFMessage init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HMFMessage __initWithInternalMessage:](v5, "__initWithInternalMessage:", v4);

  return v6;
}

- (void)__initWithInternalMessage:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_internal, a3);
    v5 = v6;
  }

}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessage name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessage identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@(%@)"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (HMFMessageDestination)destination
{
  void *v2;
  void *v3;

  -[HMFMessage internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFMessageDestination *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMFMessage identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMF.identifier"));

  -[HMFMessage name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMF.name"));

  -[HMFMessage timeout](self, "timeout");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HMF.timeout"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFMessage qualityOfService](self, "qualityOfService"), CFSTR("HMF.qos"));
  -[HMFMessage destination](self, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMF.destination"));

  -[HMFMessage headers](self, "headers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMF.headers"));

  -[HMFMessage messagePayload](self, "messagePayload");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HMF.payload"));

}

- (NSUUID)identifier
{
  void *v2;
  void *v3;

  -[HMFMessage internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (HMFMessageTransport)transport
{
  void *v2;
  void *v3;

  -[HMFMessage internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFMessageTransport *)v3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[HMFMessage internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)qualityOfService
{
  void *v2;
  int64_t v3;

  -[HMFMessage internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "qualityOfService");

  return v3;
}

- (NSDictionary)headers
{
  void *v2;
  void *v3;
  void *v4;
  NSDictionary *v5;

  -[HMFMessage internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = (void *)MEMORY[0x1E0C9AA70];
  v5 = v4;

  return v5;
}

- (NSDictionary)messagePayload
{
  void *v2;
  void *v3;

  -[HMFMessage internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messagePayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (double)timeout
{
  double result;

  -[HMFMessageInternal timeout](self->_internal, "timeout");
  return result;
}

- (NSDictionary)userInfo
{
  void *v2;
  void *v3;
  void *v4;
  NSDictionary *v5;

  -[HMFMessage internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = (void *)MEMORY[0x1E0C9AA70];
  v5 = v4;

  return v5;
}

- (HMFMessageInternal)internal
{
  return self->_internal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

- (id)mutableCopy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMFMessage;
  return -[HMFMessage mutableCopy](&v3, sel_mutableCopy);
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMFMessage messagePayload](self, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_dictionaryForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setIdentifier:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[HMFMessage internal](self, "internal");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", v4);

  }
}

- (id)numberForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMFMessage messagePayload](self, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_numberForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)BOOLForKey:(id)a3 keyPresent:(BOOL *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[HMFMessage messagePayload](self, "messagePayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "hmf_BOOLForKey:isPresent:", v6, a4);

  return (char)a4;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMFMessage messagePayload](self, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hmf_BOOLForKey:", v4);

  return v6;
}

- (void)setMessagePayload:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMFMessage internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessagePayload:", v4);

}

- (BOOL)respondWithPayload:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[HMFMessage responseHandler](self, "responseHandler");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v7, v6);

  return v9 != 0;
}

+ (id)messageWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:qualityOfService:destination:payload:", v12, a4, v11, v10);

  return v13;
}

- (BOOL)respondWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  -[HMFMessage responseHandler](self, "responseHandler");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v4);

  return v6 != 0;
}

+ (id)messageWithName:(id)a3 messagePayload:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:identifier:messagePayload:responseHandler:", v7, 0, v6, 0);

  return v8;
}

- (HMFMessage)initWithName:(id)a3 identifier:(id)a4 messagePayload:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMFMessage *v15;
  void *v16;
  void *v17;

  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  +[HMFMessageDestination allMessageDestinations](HMFMessageDestination, "allMessageDestinations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMFMessage initWithName:destination:payload:](self, "initWithName:destination:payload:", v13, v14, v12);

  if (v15)
  {
    if (v10)
    {
      -[HMFMessage internal](v15, "internal");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setIdentifier:", v10);

    }
    -[HMFMessage internal](v15, "internal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setResponseHandler:", v11);

  }
  return v15;
}

+ (id)messageWithName:(id)a3 destination:(id)a4 payload:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:destination:payload:", v10, v9, v8);

  return v11;
}

- (HMFMessage)initWithName:(id)a3 qualityOfService:(int64_t)a4 destination:(id)a5 payload:(id)a6
{
  return -[HMFMessage initWithName:qualityOfService:destination:userInfo:headers:payload:](self, "initWithName:qualityOfService:destination:userInfo:headers:payload:", a3, a4, a5, 0, 0, a6);
}

- (HMFMessage)initWithName:(id)a3 destination:(id)a4 payload:(id)a5
{
  return -[HMFMessage initWithName:qualityOfService:destination:payload:](self, "initWithName:qualityOfService:destination:payload:", a3, -1, a4, a5);
}

- (id)responseHandler
{
  void *v2;
  void *v3;

  -[HMFMessage internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "responseHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setResponseHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMFMessage internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResponseHandler:", v4);

}

- (void)setDestination:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[HMFMessage internal](self, "internal");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDestination:", v4);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFActivity)activity
{
  void *v2;
  void *v3;

  -[HMFMessage internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFActivity *)v3;
}

+ (id)activityNameWithMessageName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("Message:"), a3);
}

- (id)setForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMFMessage messagePayload](self, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_setForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)respondWithError:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;

  v4 = a3;
  -[HMFMessage responseHandler](self, "responseHandler");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))v5;
  if (v5)
  {
    if (v4)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v5 + 16))(v5, v4, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v6)[2](v6, v7, 0);

    }
  }

  return v6 != 0;
}

- (BOOL)respondWithOutcomeOf:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[HMFMessage responseHandler](self, "responseHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__HMFMessage_HMFFuture__respondWithOutcomeOf___block_invoke;
    v8[3] = &unk_1E3B37B20;
    v9 = v5;
    objc_msgSend(v4, "getResultWithCompletion:", v8);

  }
  return v6 != 0;
}

uint64_t __46__HMFMessage_HMFFuture__respondWithOutcomeOf___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (HMFMessage)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _BOOL4 v19;

  v3 = a3;
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E3B39EC0;
  }
  -[HMFMessage identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessage name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMFMessage qualityOfService](self, "qualityOfService");
  if (v10 <= 16)
  {
    if (v10 == -1)
    {
      v11 = CFSTR("Default");
      goto LABEL_16;
    }
    if (v10 == 9)
    {
      v11 = CFSTR("Background");
      goto LABEL_16;
    }
  }
  else
  {
    switch(v10)
    {
      case 17:
        v11 = CFSTR("Utility");
        goto LABEL_16;
      case 25:
        v11 = CFSTR("User Initiated");
        goto LABEL_16;
      case 33:
        v11 = CFSTR("User Interactive");
        goto LABEL_16;
    }
  }
  v11 = CFSTR("Unknown");
LABEL_16:
  -[HMFMessage destination](self, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessage activity](self, "activity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessage userInfo](self, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessage headers](self, "headers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@%@, Identifier = %@, Name = %@, QoS = %@, Destination = %@, Activity = %@, \nUser Info = %@,\nHeaders = %@>"), v5, v6, v8, v9, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  return v16;
}

- (id)debugDescription
{
  return -[HMFMessage descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HMFMessage descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (NSString)untrustedClientIdentifier
{
  void *v2;
  void *v3;

  -[HMFMessage headers](self, "headers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_stringForKey:", CFSTR("HMF.untrustedClientIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)logEventSession
{
  void *v2;
  void *v3;

  -[HMFMessage internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logEventSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLogEventSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMFMessage internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLogEventSession:", v4);

}

- (BOOL)respondWithSuccess
{
  return -[HMFMessage respondWithPayload:](self, "respondWithPayload:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HMFMessage internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyWithZone:", a3);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v6);

  v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithInternalMessage:", v5);
  return v7;
}

+ (id)messageWithName:(id)a3 messagePayload:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:identifier:messagePayload:responseHandler:", v10, 0, v9, v8);

  return v11;
}

+ (id)messageWithName:(id)a3 identifier:(id)a4 messagePayload:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:identifier:messagePayload:responseHandler:", v10, v9, v8, 0);

  return v11;
}

+ (id)messageWithMessage:(id)a3 messagePayload:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v8, "setMessagePayload:", v6);
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInternalMessage:", v8);

  return v9;
}

+ (id)messageWithMessage:(id)a3 messagePayload:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  objc_msgSend(v11, "setMessagePayload:", v9);
  if (v8)
    objc_msgSend(v11, "setResponseHandler:", v8);
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInternalMessage:", v11);

  return v12;
}

- (id)uuidForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMFMessage messagePayload](self, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_UUIDForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMFFlow)flow
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  HMFMessage *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HMFMessage messagePayload](self, "messagePayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_flowForKey:", CFSTR("HMFMessageFlowKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    +[HMFFlow internalOnlyInitializer](HMFFlow, "internalOnlyInitializer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Incorrect Flow Usage: Expected, but did not find, flow for message: %@", (uint8_t *)&v11, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
  }

  return (HMFFlow *)v5;
}

- (id)arrayForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMFMessage messagePayload](self, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_arrayForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dataForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMFMessage messagePayload](self, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_dataForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)nullForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMFMessage messagePayload](self, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_nullForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)timeZoneForKey:(id)a3
{
  void *v3;
  void *v4;

  -[HMFMessage dataForKey:](self, "dataForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "hmf_unarchiveFromData:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dateComponentsForKey:(id)a3
{
  void *v3;
  void *v4;

  -[HMFMessage dataForKey:](self, "dataForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D78], "hmf_unarchiveFromData:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)URLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMFMessage messagePayload](self, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_URLForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)errorForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMFMessage messagePayload](self, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_errorForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v10[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFMessage unarchivedObjectForKey:ofClasses:](self, "unarchivedObjectForKey:ofClasses:", v4, v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)calendarForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessage unarchivedObjectForKey:ofClasses:](self, "unarchivedObjectForKey:ofClasses:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)predicateForKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[HMFMessage dataForKey:](self, "dataForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = (void *)MEMORY[0x1E0C99E60];
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v7, v3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v9 = v8;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)arrayOfDateComponentsForKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[HMFMessage dataForKey:](self, "dataForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = (void *)MEMORY[0x1E0C99E60];
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v7, v3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v9 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v8, "hmf_objectsAreKindOfClass:", objc_opt_class()))
        v9 = v8;
      else
        v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)unarchivedObjectForKey:(id)a3 ofClasses:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[HMFMessage messagePayload](self, "messagePayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmf_unarchivedObjectForKey:ofClasses:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fileHandleForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMFMessage messagePayload](self, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_fileHandleForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
