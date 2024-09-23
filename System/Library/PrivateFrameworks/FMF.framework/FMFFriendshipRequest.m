@implementation FMFFriendshipRequest

- (FMFFriendshipRequest)initWithFromHandle:(id)a3 toHandle:(id)a4 ofType:(int64_t)a5 groupId:(id)a6 endDate:(id)a7 requestId:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  FMFFriendshipRequest *v19;
  void *v20;

  v14 = a4;
  v15 = a7;
  v16 = a8;
  v17 = a6;
  v18 = a3;
  v19 = (FMFFriendshipRequest *)objc_alloc_init((Class)objc_opt_class());

  -[FMFFriendshipRequest setRequestType:](v19, "setRequestType:", a5);
  -[FMFFriendshipRequest setFromHandle:](v19, "setFromHandle:", v18);

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFFriendshipRequest setToHandles:](v19, "setToHandles:", v20);

  }
  -[FMFFriendshipRequest setEndDate:](v19, "setEndDate:", v15);
  -[FMFFriendshipRequest setRequestId:](v19, "setRequestId:", v16);

  -[FMFFriendshipRequest setGroupId:](v19, "setGroupId:", v17);
  return v19;
}

+ (id)friendshipRequestToHandles:(id)a3 fromHandle:(id)a4 withType:(int64_t)a5 groupId:(id)a6 withEndDate:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v15, "setToHandles:", v14);

  objc_msgSend(v15, "setRequestType:", a5);
  objc_msgSend(v15, "setEndDate:", v11);

  objc_msgSend(v15, "setGroupId:", v12);
  objc_msgSend(v15, "setFromHandle:", v13);

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setRequestType:", -[FMFFriendshipRequest requestType](self, "requestType"));
  -[FMFFriendshipRequest requestId](self, "requestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestId:", v5);

  -[FMFFriendshipRequest fromHandle](self, "fromHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromHandle:", v6);

  -[FMFFriendshipRequest toHandles](self, "toHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToHandles:", v7);

  -[FMFFriendshipRequest endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndDate:", v8);

  -[FMFFriendshipRequest groupId](self, "groupId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroupId:", v9);

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
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[FMFFriendshipRequest requestType](self, "requestType"), CFSTR("requestType"));
  -[FMFFriendshipRequest requestId](self, "requestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("requestId"));

  -[FMFFriendshipRequest fromHandle](self, "fromHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("fromHandle"));

  -[FMFFriendshipRequest toHandles](self, "toHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("toHandles"));

  -[FMFFriendshipRequest endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("endDate"));

  -[FMFFriendshipRequest groupId](self, "groupId");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("groupId"));

}

- (FMFFriendshipRequest)initWithCoder:(id)a3
{
  id v4;
  FMFFriendshipRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = (FMFFriendshipRequest *)objc_alloc_init((Class)objc_opt_class());
  -[FMFFriendshipRequest setRequestType:](v5, "setRequestType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestType")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFriendshipRequest setRequestId:](v5, "setRequestId:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fromHandle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFriendshipRequest setFromHandle:](v5, "setFromHandle:", v7);

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("toHandles"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFriendshipRequest setToHandles:](v5, "setToHandles:", v11);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFFriendshipRequest setEndDate:](v5, "setEndDate:", v12);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[FMFFriendshipRequest setGroupId:](v5, "setGroupId:", v13);
  return v5;
}

- (id)description
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = -[FMFFriendshipRequest requestType](self, "requestType");
  if (v3)
  {
    if (v3 != 1)
    {
      v10 = 0;
      return v10;
    }
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = objc_opt_class();
    -[FMFFriendshipRequest fromHandle](self, "fromHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFFriendshipRequest endDate](self, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p [%@ :Type => FMFFriendshipRequestTypeAsk, Expires: %@]>"), v5, self, v6, v7);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    -[FMFFriendshipRequest toHandles](self, "toHandles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFFriendshipRequest endDate](self, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@ %p [%@ :Type => FMFFriendshipRequestTypeOffer, Expires: %@]>"), v9, self, v6, v7);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
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

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSString)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_groupId, a3);
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
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);
  objc_storeStrong((id *)&self->_fromHandle, 0);
}

@end
