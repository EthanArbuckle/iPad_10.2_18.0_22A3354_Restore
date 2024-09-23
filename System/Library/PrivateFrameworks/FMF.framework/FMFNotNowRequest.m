@implementation FMFNotNowRequest

- (FMFNotNowRequest)initWithFromHandle:(id)a3 toHandle:(id)a4 requestId:(id)a5
{
  id v8;
  id v9;
  id v10;
  FMFNotNowRequest *v11;
  void *v12;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (FMFNotNowRequest *)objc_alloc_init((Class)objc_opt_class());

  -[FMFNotNowRequest setFromHandle:](v11, "setFromHandle:", v10);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFNotNowRequest setToHandles:](v11, "setToHandles:", v12);

  }
  -[FMFNotNowRequest setRequestId:](v11, "setRequestId:", v9);

  return v11;
}

+ (id)notNowRequestToHandles:(id)a3 fromHandle:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v7, "setToHandles:", v6);

  objc_msgSend(v7, "setFromHandle:", v5);
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[FMFNotNowRequest requestId](self, "requestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestId:", v5);

  -[FMFNotNowRequest fromHandle](self, "fromHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromHandle:", v6);

  -[FMFNotNowRequest toHandles](self, "toHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToHandles:", v7);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[FMFNotNowRequest requestId](self, "requestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("requestId"));

  -[FMFNotNowRequest fromHandle](self, "fromHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("fromHandle"));

  -[FMFNotNowRequest toHandles](self, "toHandles");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("toHandles"));

}

- (FMFNotNowRequest)initWithCoder:(id)a3
{
  id v4;
  FMFNotNowRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (FMFNotNowRequest *)objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNotNowRequest setRequestId:](v5, "setRequestId:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fromHandle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNotNowRequest setFromHandle:](v5, "setFromHandle:", v7);

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("toHandles"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[FMFNotNowRequest setToHandles:](v5, "setToHandles:", v11);
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FMFNotNowRequest fromHandle](self, "fromHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p [%@]>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (FMFHandle)fromHandle
{
  return self->_fromHandle;
}

- (void)setFromHandle:(id)a3
{
  objc_storeStrong((id *)&self->_fromHandle, a3);
}

- (NSSet)toHandles
{
  return self->_toHandles;
}

- (void)setToHandles:(id)a3
{
  objc_storeStrong((id *)&self->_toHandles, a3);
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);
  objc_storeStrong((id *)&self->_fromHandle, 0);
}

@end
