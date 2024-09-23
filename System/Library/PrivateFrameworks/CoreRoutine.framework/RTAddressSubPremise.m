@implementation RTAddressSubPremise

- (RTAddressSubPremise)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithSubPremise_subPremiseType_);
}

- (RTAddressSubPremise)initWithSubPremise:(id)a3 subPremiseType:(int64_t)a4
{
  id v6;
  RTAddressSubPremise *v7;
  uint64_t v8;
  NSString *subPremise;
  RTAddressSubPremise *v10;
  NSObject *v11;
  const char *v12;
  objc_super v14;
  uint8_t buf[16];

  v6 = a3;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v10 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: subPremise";
LABEL_12:
    _os_log_error_impl(&dword_1A5E26000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_9;
  }
  if ((unint64_t)a4 >= 5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: SUB_PREMISE_TYPE_VALID(subPremiseType)";
    goto LABEL_12;
  }
  v14.receiver = self;
  v14.super_class = (Class)RTAddressSubPremise;
  v7 = -[RTAddressSubPremise init](&v14, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    subPremise = v7->_subPremise;
    v7->_subPremise = (NSString *)v8;

    v7->_subPremiseType = a4;
  }
  self = v7;
  v10 = self;
LABEL_10:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTAddressSubPremise)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  RTAddressSubPremise *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subPremise"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("subPremiseType"));

  v7 = -[RTAddressSubPremise initWithSubPremise:subPremiseType:](self, "initWithSubPremise:subPremiseType:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *subPremise;
  id v5;

  subPremise = self->_subPremise;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", subPremise, CFSTR("subPremise"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_subPremiseType, CFSTR("subPremiseType"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSubPremise:subPremiseType:", self->_subPremise, self->_subPremiseType);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "stringForSubPremiseType:", self->_subPremiseType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, self->_subPremise);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqualToAddressSubPremise:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  NSString *subPremise;
  NSString *v8;
  void *v9;
  char v10;
  int64_t subPremiseType;
  BOOL v12;

  v5 = a3;
  v6 = v5;
  subPremise = self->_subPremise;
  v8 = subPremise;
  if (subPremise)
  {
LABEL_4:
    objc_msgSend(v6, "subPremise");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSString isEqual:](v8, "isEqual:", v9);

    if (subPremise)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v5, "subPremise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = self->_subPremise;
    goto LABEL_4;
  }
  v10 = 1;
LABEL_7:

LABEL_8:
  subPremiseType = self->_subPremiseType;
  if (subPremiseType == objc_msgSend(v6, "subPremiseType"))
    v12 = v10;
  else
    v12 = 0;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  RTAddressSubPremise *v4;
  RTAddressSubPremise *v5;
  BOOL v6;

  v4 = (RTAddressSubPremise *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTAddressSubPremise isEqualToAddressSubPremise:](self, "isEqualToAddressSubPremise:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_subPremise, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_subPremiseType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

+ (id)stringForSubPremiseType:(int64_t)a3
{
  NSObject *v3;
  uint8_t v5[16];

  if ((unint64_t)a3 < 5)
    return off_1E4FB1768[a3];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1A5E26000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: SUB_PREMISE_TYPE_VALID(subPremiseType)", v5, 2u);
  }

  return 0;
}

- (int64_t)subPremiseType
{
  return self->_subPremiseType;
}

- (NSString)subPremise
{
  return self->_subPremise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subPremise, 0);
}

@end
