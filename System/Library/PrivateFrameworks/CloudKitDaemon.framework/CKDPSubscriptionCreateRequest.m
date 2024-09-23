@implementation CKDPSubscriptionCreateRequest

+ (id)options
{
  if (qword_1ED7028C0 != -1)
    dispatch_once(&qword_1ED7028C0, &unk_1E7833E90);
  return (id)qword_1ED7028B8;
}

- (BOOL)hasSubscription
{
  return self->_subscription != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPSubscriptionCreateRequest;
  -[CKDPSubscriptionCreateRequest description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  CKDPSubscription *subscription;
  void *v8;
  const char *v9;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  subscription = self->_subscription;
  if (subscription)
  {
    objc_msgSend_dictionaryRepresentation(subscription, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("subscription"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB2BB68((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_subscription)
    PBDataWriterWriteSubmessage();
}

- (unsigned)requestTypeCode
{
  return 36;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  CKDPSubscription *subscription;

  subscription = self->_subscription;
  if (subscription)
    objc_msgSend_setSubscription_(a3, a2, (uint64_t)subscription);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_subscription, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPSubscription *subscription;
  uint64_t v9;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5))
  {
    subscription = self->_subscription;
    v9 = v4[1];
    if ((unint64_t)subscription | v9)
      isEqual = objc_msgSend_isEqual_(subscription, v7, v9);
    else
      isEqual = 1;
  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;

  return objc_msgSend_hash(self->_subscription, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CKDPSubscription *subscription;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  subscription = self->_subscription;
  v6 = v4[1];
  if (subscription)
  {
    if (v6)
    {
      v7 = v4;
      objc_msgSend_mergeFrom_(subscription, (const char *)v4, v6);
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    objc_msgSend_setSubscription_(self, (const char *)v4, v6);
    goto LABEL_6;
  }

}

- (CKDPSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
}

@end
