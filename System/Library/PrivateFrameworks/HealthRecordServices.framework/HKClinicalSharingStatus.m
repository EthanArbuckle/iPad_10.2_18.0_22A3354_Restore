@implementation HKClinicalSharingStatus

- (HKClinicalSharingStatus)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalSharingStatus)initWithFirstSharedDate:(id)a3 lastSharedDate:(id)a4 featureStatus:(int64_t)a5 userStatus:(int64_t)a6 multiDeviceStatus:(int64_t)a7 primaryDeviceName:(id)a8
{
  id v14;
  id v15;
  id v16;
  HKClinicalSharingStatus *v17;
  uint64_t v18;
  NSDate *firstSharedDate;
  uint64_t v20;
  NSDate *lastSharedDate;
  uint64_t v22;
  NSString *primaryDeviceName;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HKClinicalSharingStatus;
  v17 = -[HKClinicalSharingStatus init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    firstSharedDate = v17->_firstSharedDate;
    v17->_firstSharedDate = (NSDate *)v18;

    v20 = objc_msgSend(v15, "copy");
    lastSharedDate = v17->_lastSharedDate;
    v17->_lastSharedDate = (NSDate *)v20;

    v17->_featureStatus = a5;
    v17->_userStatus = a6;
    v17->_multiDeviceStatus = a7;
    v22 = objc_msgSend(v16, "copy");
    primaryDeviceName = v17->_primaryDeviceName;
    v17->_primaryDeviceName = (NSString *)v22;

  }
  return v17;
}

+ (id)unknownStatus
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithFirstSharedDate:lastSharedDate:featureStatus:userStatus:multiDeviceStatus:primaryDeviceName:", 0, 0, 0, 0, 0, 0);
}

+ (int64_t)clinicalSharingFeatureStatusWithAccountState:(int64_t)a3 gatewayFeatureStatus:(int64_t)a4
{
  int64_t result;

  result = 4;
  switch(a3)
  {
    case 0:
      result = 2;
      break;
    case 1:
    case 6:
      if ((unint64_t)a4 >= 5)
        result = 1;
      else
        result = a4;
      break;
    case 2:
    case 4:
      result = 3;
      break;
    case 3:
      if ((unint64_t)a4 >= 5)
        result = 5;
      else
        result = qword_216403530[a4];
      break;
    default:
      return result;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSString *primaryDeviceName;
  int64_t v6;

  v3 = -[NSDate hash](self->_firstSharedDate, "hash");
  v4 = -[NSDate hash](self->_lastSharedDate, "hash") ^ v3;
  primaryDeviceName = self->_primaryDeviceName;
  v6 = v4 ^ self->_featureStatus ^ self->_userStatus ^ self->_multiDeviceStatus;
  return v6 ^ -[NSString hash](primaryDeviceName, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKClinicalSharingStatus *v6;
  HKClinicalSharingStatus *v7;
  HKClinicalSharingStatus *v8;
  NSDate *firstSharedDate;
  NSDate *v10;
  uint64_t v11;
  NSDate *v12;
  char v13;
  NSDate *lastSharedDate;
  NSDate *v15;
  uint64_t v16;
  NSDate *v17;
  uint64_t v18;
  NSDate *v19;
  void *v20;
  int64_t featureStatus;
  int64_t userStatus;
  int64_t multiDeviceStatus;
  NSString *primaryDeviceName;
  uint64_t v25;
  uint64_t v26;
  NSString *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v6 = (HKClinicalSharingStatus *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0;
LABEL_32:

      goto LABEL_33;
    }
    firstSharedDate = self->_firstSharedDate;
    -[HKClinicalSharingStatus firstSharedDate](v8, "firstSharedDate");
    v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (firstSharedDate != v10)
    {
      -[HKClinicalSharingStatus firstSharedDate](v8, "firstSharedDate");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v13 = 0;
        goto LABEL_31;
      }
      v3 = (void *)v11;
      v12 = self->_firstSharedDate;
      -[HKClinicalSharingStatus firstSharedDate](v8, "firstSharedDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSDate isEqual:](v12, "isEqual:", v4))
      {
        v13 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v33 = v4;
    }
    lastSharedDate = self->_lastSharedDate;
    -[HKClinicalSharingStatus lastSharedDate](v8, "lastSharedDate");
    v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (lastSharedDate != v15)
    {
      -[HKClinicalSharingStatus lastSharedDate](v8, "lastSharedDate");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        v13 = 0;
        goto LABEL_29;
      }
      v4 = (void *)v16;
      v17 = self->_lastSharedDate;
      -[HKClinicalSharingStatus lastSharedDate](v8, "lastSharedDate");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v17;
      v20 = (void *)v18;
      if ((-[NSDate isEqual:](v19, "isEqual:", v18) & 1) == 0)
      {

        v13 = 0;
        goto LABEL_35;
      }
      v32 = v20;
    }
    featureStatus = self->_featureStatus;
    if (featureStatus == -[HKClinicalSharingStatus featureStatus](v8, "featureStatus"))
    {
      userStatus = self->_userStatus;
      if (userStatus == -[HKClinicalSharingStatus userStatus](v8, "userStatus"))
      {
        multiDeviceStatus = self->_multiDeviceStatus;
        if (multiDeviceStatus == -[HKClinicalSharingStatus multiDeviceStatus](v8, "multiDeviceStatus"))
        {
          primaryDeviceName = self->_primaryDeviceName;
          -[HKClinicalSharingStatus primaryDeviceName](v8, "primaryDeviceName");
          v25 = objc_claimAutoreleasedReturnValue();
          if (primaryDeviceName == (NSString *)v25)
          {

            v13 = 1;
LABEL_27:
            if (lastSharedDate == v15)
              goto LABEL_34;

LABEL_29:
            v4 = v33;

            if (firstSharedDate != v10)
              goto LABEL_30;
LABEL_31:

            goto LABEL_32;
          }
          v31 = (void *)v25;
          -[HKClinicalSharingStatus primaryDeviceName](v8, "primaryDeviceName");
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = self->_primaryDeviceName;
            v30 = (void *)v26;
            -[HKClinicalSharingStatus primaryDeviceName](v8, "primaryDeviceName");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = -[NSString isEqualToString:](v27, "isEqualToString:", v28);

            if (lastSharedDate == v15)
            {

LABEL_35:
              v4 = v33;
              if (firstSharedDate == v10)
                goto LABEL_31;
              goto LABEL_30;
            }

LABEL_34:
            goto LABEL_35;
          }

        }
      }
    }
    v13 = 0;
    goto LABEL_27;
  }
  v13 = 1;
LABEL_33:

  return v13;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *primaryDeviceName;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v17;

  v17 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKClinicalSharingFeatureStatusToString(self->_featureStatus);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKClinicalSharingUserStatusToString(self->_userStatus);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKClinicalSharingMultiDeviceStatusToString(self->_multiDeviceStatus);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  primaryDeviceName = self->_primaryDeviceName;
  -[NSDate hk_rfc3339String](self->_firstSharedDate, "hk_rfc3339String");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("never");
  -[NSDate hk_rfc3339String](self->_lastSharedDate, "hk_rfc3339String");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("never");
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@ %p\n\tFeature status: %@\n\tUser status:    %@\n\tDevice status:  %@\n\tPrimary device: %@\n\tFirst Share:    %@\n\tLast Share:     %@>"), v4, self, v5, v6, v7, primaryDeviceName, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *firstSharedDate;
  id v5;

  firstSharedDate = self->_firstSharedDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", firstSharedDate, CFSTR("firstSharedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastSharedDate, CFSTR("lastSharedDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_featureStatus, CFSTR("featureStatus"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_userStatus, CFSTR("userStatus"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_multiDeviceStatus, CFSTR("multiDeviceStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryDeviceName, CFSTR("primaryDeviceName"));

}

- (HKClinicalSharingStatus)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  HKClinicalSharingStatus *v11;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("featureStatus"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("userStatus"))
    && (objc_msgSend(v4, "containsValueForKey:", CFSTR("multiDeviceStatus")) & 1) != 0)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstSharedDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastSharedDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("featureStatus"));
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("userStatus"));
    v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("multiDeviceStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryDeviceName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HKClinicalSharingStatus initWithFirstSharedDate:lastSharedDate:featureStatus:userStatus:multiDeviceStatus:primaryDeviceName:](self, "initWithFirstSharedDate:lastSharedDate:featureStatus:userStatus:multiDeviceStatus:primaryDeviceName:", v5, v6, v7, v8, v9, v10);

    v11 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v11 = 0;
  }

  return v11;
}

- (NSDate)firstSharedDate
{
  return self->_firstSharedDate;
}

- (NSDate)lastSharedDate
{
  return self->_lastSharedDate;
}

- (int64_t)featureStatus
{
  return self->_featureStatus;
}

- (int64_t)userStatus
{
  return self->_userStatus;
}

- (int64_t)multiDeviceStatus
{
  return self->_multiDeviceStatus;
}

- (NSString)primaryDeviceName
{
  return self->_primaryDeviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryDeviceName, 0);
  objc_storeStrong((id *)&self->_lastSharedDate, 0);
  objc_storeStrong((id *)&self->_firstSharedDate, 0);
}

@end
