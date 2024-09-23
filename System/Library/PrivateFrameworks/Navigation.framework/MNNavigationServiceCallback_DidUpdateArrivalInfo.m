@implementation MNNavigationServiceCallback_DidUpdateArrivalInfo

- (unint64_t)type
{
  return 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_arrivalInfo, CFSTR("_arrivalInfo"));
}

- (MNNavigationServiceCallback_DidUpdateArrivalInfo)initWithCoder:(id)a3
{
  id v4;
  MNNavigationServiceCallback_DidUpdateArrivalInfo *v5;
  uint64_t v6;
  MNArrivalInfo *arrivalInfo;
  MNNavigationServiceCallback_DidUpdateArrivalInfo *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNNavigationServiceCallback_DidUpdateArrivalInfo;
  v5 = -[MNNavigationServiceCallbackParameters initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_arrivalInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    arrivalInfo = v5->_arrivalInfo;
    v5->_arrivalInfo = (MNArrivalInfo *)v6;

    v8 = v5;
  }

  return v5;
}

- (MNArrivalInfo)arrivalInfo
{
  return self->_arrivalInfo;
}

- (void)setArrivalInfo:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalInfo, 0);
}

@end
