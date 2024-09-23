@implementation HKClinicalIngestionContext

- (HKClinicalIngestionContext)init
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

- (HKClinicalIngestionContext)initWithAccountConnectionInformation:(id)a3 queryMode:(int64_t)a4 options:(unint64_t)a5 lastFetchDate:(id)a6
{
  id v10;
  id v11;
  HKClinicalIngestionContext *v12;
  uint64_t v13;
  HKClinicalAccountConnectionInformation *accountInformation;
  uint64_t v15;
  NSDate *lastFetchDate;
  objc_super v18;

  v10 = a3;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HKClinicalIngestionContext;
  v12 = -[HKClinicalIngestionContext init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    accountInformation = v12->_accountInformation;
    v12->_accountInformation = (HKClinicalAccountConnectionInformation *)v13;

    v12->_queryMode = a4;
    v12->_options = a5;
    v15 = objc_msgSend(v11, "copy");
    lastFetchDate = v12->_lastFetchDate;
    v12->_lastFetchDate = (NSDate *)v15;

  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKClinicalAccountConnectionInformation *accountInformation;
  id v5;

  accountInformation = self->_accountInformation;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountInformation, CFSTR("AccountInformation"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_queryMode, CFSTR("QueryMode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_options, CFSTR("Options"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastFetchDate, CFSTR("LastFetchDate"));

}

- (HKClinicalIngestionContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HKClinicalIngestionContext *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AccountInformation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("QueryMode"))
    && (objc_msgSend(v4, "containsValueForKey:", CFSTR("Options")) & 1) != 0)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("QueryMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastFetchDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HKClinicalIngestionContext initWithAccountConnectionInformation:queryMode:options:lastFetchDate:](self, "initWithAccountConnectionInformation:queryMode:options:lastFetchDate:", v5, v6, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Options")), v7);

    v8 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = self->_queryMode ^ -[HKClinicalAccountConnectionInformation hash](self->_accountInformation, "hash");
  return v3 ^ -[NSDate hash](self->_lastFetchDate, "hash") ^ self->_options;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKClinicalIngestionContext *v6;
  HKClinicalIngestionContext *v7;
  HKClinicalIngestionContext *v8;
  HKClinicalAccountConnectionInformation *accountInformation;
  HKClinicalAccountConnectionInformation *v10;
  uint64_t v11;
  HKClinicalAccountConnectionInformation *v12;
  int64_t v13;
  BOOL v14;
  int64_t queryMode;
  NSDate *lastFetchDate;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSDate *v21;
  uint64_t v22;
  NSDate *v23;
  void *v24;
  unint64_t v25;
  unint64_t options;

  v6 = (HKClinicalIngestionContext *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
LABEL_22:

      goto LABEL_23;
    }
    accountInformation = self->_accountInformation;
    -[HKClinicalIngestionContext accountInformation](v8, "accountInformation");
    v10 = (HKClinicalAccountConnectionInformation *)objc_claimAutoreleasedReturnValue();
    if (accountInformation == v10)
    {
      queryMode = self->_queryMode;
      if (queryMode == -[HKClinicalIngestionContext queryMode](v8, "queryMode"))
        goto LABEL_11;
    }
    else
    {
      -[HKClinicalIngestionContext accountInformation](v8, "accountInformation");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v3 = (void *)v11;
        v12 = self->_accountInformation;
        -[HKClinicalIngestionContext accountInformation](v8, "accountInformation");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[HKClinicalAccountConnectionInformation isEqual:](v12, "isEqual:", v4)
          || (v13 = self->_queryMode, v13 != -[HKClinicalIngestionContext queryMode](v8, "queryMode")))
        {
          v14 = 0;
LABEL_20:

          goto LABEL_21;
        }
LABEL_11:
        lastFetchDate = self->_lastFetchDate;
        -[HKClinicalIngestionContext lastFetchDate](v8, "lastFetchDate");
        v17 = objc_claimAutoreleasedReturnValue();
        if (lastFetchDate == (NSDate *)v17)
        {
          options = self->_options;
          v14 = options == -[HKClinicalIngestionContext options](v8, "options");

        }
        else
        {
          v18 = (void *)v17;
          -[HKClinicalIngestionContext lastFetchDate](v8, "lastFetchDate");
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = (void *)v19;
            v21 = self->_lastFetchDate;
            -[HKClinicalIngestionContext lastFetchDate](v8, "lastFetchDate");
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = v21;
            v24 = (void *)v22;
            if (-[NSDate isEqual:](v23, "isEqual:", v22))
            {
              v25 = self->_options;
              v14 = v25 == -[HKClinicalIngestionContext options](v8, "options");

              goto LABEL_19;
            }

          }
          v14 = 0;
        }
LABEL_19:
        if (accountInformation != v10)
          goto LABEL_20;
LABEL_21:

        goto LABEL_22;
      }
    }
    v14 = 0;
    goto LABEL_21;
  }
  v14 = 1;
LABEL_23:

  return v14;
}

- (HKClinicalAccountConnectionInformation)accountInformation
{
  return self->_accountInformation;
}

- (int64_t)queryMode
{
  return self->_queryMode;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSDate)lastFetchDate
{
  return self->_lastFetchDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetchDate, 0);
  objc_storeStrong((id *)&self->_accountInformation, 0);
}

@end
