@implementation CRKFetchMeCardResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchMeCardResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFetchMeCardResultObject *v5;
  uint64_t v6;
  NSDictionary *cardInfo;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKFetchMeCardResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("cardInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    cardInfo = v5->_cardInfo;
    v5->_cardInfo = (NSDictionary *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKFetchMeCardResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CRKFetchMeCardResultObject cardInfo](self, "cardInfo", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("cardInfo"));

}

- (NSDictionary)cardInfo
{
  return self->_cardInfo;
}

- (void)setCardInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardInfo, 0);
}

@end
