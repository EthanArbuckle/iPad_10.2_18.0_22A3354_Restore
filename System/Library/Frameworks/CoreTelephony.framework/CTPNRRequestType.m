@implementation CTPNRRequestType

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTPNRRequestType pushToken](self, "pushToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", pushToken=%@"), v4);

  -[CTPNRRequestType attemptCount](self, "attemptCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", attempt=%@"), v5);

  -[CTPNRRequestType pnrReqList](self, "pnrReqList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", requestList=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CTPNRRequestType)init
{
  CTPNRRequestType *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CTPNRRequestType;
  v2 = -[CTPNRRequestType init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTPNRRequestType setAttemptCount:](v2, "setAttemptCount:", v3);

  }
  return v2;
}

- (BOOL)isEqualToCTPNRRequestType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  int v23;

  v8 = a3;
  if (!v8)
  {
    v11 = 0;
    goto LABEL_21;
  }
  -[CTPNRRequestType pushToken](self, "pushToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend(v8, "pushToken"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTPNRRequestType pushToken](self, "pushToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pushToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToData:", v4) & 1) == 0)
    {

      v11 = 0;
      goto LABEL_18;
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  -[CTPNRRequestType attemptCount](self, "attemptCount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v8, "attemptCount");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v22 = 0;
      v23 = 0;
      goto LABEL_23;
    }
  }
  -[CTPNRRequestType attemptCount](self, "attemptCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attemptCount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v13)
  {
    v23 = 1;
LABEL_23:
    -[CTPNRRequestType pnrReqList](self, "pnrReqList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 || (objc_msgSend(v8, "pnrReqList"), (v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v20 = v10;
      v21 = v5;
      -[CTPNRRequestType pnrReqList](self, "pnrReqList");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pnrReqList");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v16, "isEqualToArray:", v17);

      if (v15)
      {

        v5 = v21;
        v10 = v20;
        if (!v23)
          goto LABEL_28;
        goto LABEL_27;
      }
      v5 = v21;
      v10 = v20;
      v18 = (void *)v19;
    }
    else
    {
      v18 = 0;
      v11 = 1;
    }

    if ((v23 & 1) == 0)
    {
LABEL_28:
      if (!v12)

      if (!v10)
        goto LABEL_18;
      goto LABEL_17;
    }
LABEL_27:

    goto LABEL_28;
  }

  if (v12)
  else

  v11 = 0;
  if ((v10 & 1) != 0)
  {
LABEL_17:

  }
LABEL_18:
  if (!v9)

LABEL_21:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTPNRRequestType *v4;
  BOOL v5;

  v4 = (CTPNRRequestType *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTPNRRequestType isEqualToCTPNRRequestType:](self, "isEqualToCTPNRRequestType:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTPNRRequestType *v4;

  v4 = +[CTPNRRequestType allocWithZone:](CTPNRRequestType, "allocWithZone:", a3);
  -[CTPNRRequestType setAttemptCount:](v4, "setAttemptCount:", self->_attemptCount);
  -[CTPNRRequestType setPushToken:](v4, "setPushToken:", self->_pushToken);
  -[CTPNRRequestType setPnrReqList:](v4, "setPnrReqList:", self->_pnrReqList);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *attemptCount;
  id v5;

  attemptCount = self->_attemptCount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", attemptCount, CFSTR("attempt_count"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pushToken, CFSTR("push_token"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pnrReqList, CFSTR("pnr_req"));

}

- (CTPNRRequestType)initWithCoder:(id)a3
{
  id v4;
  CTPNRRequestType *v5;
  uint64_t v6;
  NSNumber *attemptCount;
  uint64_t v8;
  NSData *pushToken;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *pnrReqList;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTPNRRequestType;
  v5 = -[CTPNRRequestType init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attempt_count"));
    v6 = objc_claimAutoreleasedReturnValue();
    attemptCount = v5->_attemptCount;
    v5->_attemptCount = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("push_token"));
    v8 = objc_claimAutoreleasedReturnValue();
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSData *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("pnr_req"));
    v13 = objc_claimAutoreleasedReturnValue();
    pnrReqList = v5->_pnrReqList;
    v5->_pnrReqList = (NSArray *)v13;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushToken, a3);
}

- (NSNumber)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(id)a3
{
  objc_storeStrong((id *)&self->_attemptCount, a3);
}

- (NSArray)pnrReqList
{
  return self->_pnrReqList;
}

- (void)setPnrReqList:(id)a3
{
  objc_storeStrong((id *)&self->_pnrReqList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pnrReqList, 0);
  objc_storeStrong((id *)&self->_attemptCount, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
}

@end
