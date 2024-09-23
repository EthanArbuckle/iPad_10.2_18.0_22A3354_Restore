@implementation HDHRSSignedClinicalDataProcessingContextCollection

- (HDHRSSignedClinicalDataProcessingContextCollection)init
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

- (HDHRSSignedClinicalDataProcessingContextCollection)initWithReceivedDate:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 contextItems:(id)a6
{
  id v10;
  id v11;
  id v12;
  HDHRSSignedClinicalDataProcessingContextCollection *v13;
  uint64_t v14;
  NSDate *receivedDate;
  uint64_t v16;
  NSString *countryCode;
  uint64_t v18;
  NSArray *contextItems;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HDHRSSignedClinicalDataProcessingContextCollection;
  v13 = -[HDHRSSignedClinicalDataProcessingContextCollection init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    receivedDate = v13->_receivedDate;
    v13->_receivedDate = (NSDate *)v14;

    v16 = objc_msgSend(v11, "copy");
    countryCode = v13->_countryCode;
    v13->_countryCode = (NSString *)v16;

    v13->_options = a5;
    v18 = objc_msgSend(v12, "copy");
    contextItems = v13->_contextItems;
    v13->_contextItems = (NSArray *)v18;

  }
  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t options;

  v3 = -[NSDate hash](self->_receivedDate, "hash");
  v4 = -[NSString hash](self->_countryCode, "hash") ^ v3;
  options = self->_options;
  return v4 ^ options ^ -[NSArray hash](self->_contextItems, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HDHRSSignedClinicalDataProcessingContextCollection *v6;
  HDHRSSignedClinicalDataProcessingContextCollection *v7;
  HDHRSSignedClinicalDataProcessingContextCollection *v8;
  NSDate *receivedDate;
  NSDate *v10;
  uint64_t v11;
  NSDate *v12;
  void *v13;
  char v14;
  NSString *countryCode;
  NSString *v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  NSString *v20;
  void *v21;
  unint64_t v22;
  unint64_t options;
  NSArray *contextItems;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSArray *v29;
  BOOL v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v6 = (HDHRSSignedClinicalDataProcessingContextCollection *)a3;
  v7 = v6;
  if (v6 != self)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
LABEL_30:

      goto LABEL_31;
    }
    receivedDate = self->_receivedDate;
    -[HDHRSSignedClinicalDataProcessingContextCollection receivedDate](v8, "receivedDate");
    v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (receivedDate != v10)
    {
      -[HDHRSSignedClinicalDataProcessingContextCollection receivedDate](v8, "receivedDate");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v14 = 0;
        goto LABEL_29;
      }
      v4 = (void *)v11;
      v12 = self->_receivedDate;
      -[HDHRSSignedClinicalDataProcessingContextCollection receivedDate](v8, "receivedDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSDate isEqual:](v12, "isEqual:", v13))
      {
        v14 = 0;
LABEL_28:

        goto LABEL_29;
      }
      v35 = v13;
    }
    countryCode = self->_countryCode;
    -[HDHRSSignedClinicalDataProcessingContextCollection countryCode](v8, "countryCode");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (countryCode == v16)
    {
      options = self->_options;
      if (options == -[HDHRSSignedClinicalDataProcessingContextCollection options](v8, "options"))
        goto LABEL_16;
    }
    else
    {
      -[HDHRSSignedClinicalDataProcessingContextCollection countryCode](v8, "countryCode");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v3 = (void *)v17;
        v18 = self->_countryCode;
        -[HDHRSSignedClinicalDataProcessingContextCollection countryCode](v8, "countryCode");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v18;
        v21 = (void *)v19;
        if (!-[NSString isEqualToString:](v20, "isEqualToString:", v19))
        {

          v14 = 0;
          v30 = receivedDate == v10;
          goto LABEL_34;
        }
        v33 = v21;
        v22 = self->_options;
        if (v22 != -[HDHRSSignedClinicalDataProcessingContextCollection options](v8, "options"))
        {
          v14 = 0;
          v13 = v35;
LABEL_26:

LABEL_27:
          if (receivedDate != v10)
            goto LABEL_28;
LABEL_29:

          goto LABEL_30;
        }
LABEL_16:
        v34 = v4;
        contextItems = self->_contextItems;
        -[HDHRSSignedClinicalDataProcessingContextCollection contextItems](v8, "contextItems");
        v25 = objc_claimAutoreleasedReturnValue();
        if (contextItems == (NSArray *)v25)
        {

          v14 = 1;
        }
        else
        {
          v26 = (void *)v25;
          -[HDHRSSignedClinicalDataProcessingContextCollection contextItems](v8, "contextItems");
          v27 = objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v28 = (void *)v27;
            v29 = self->_contextItems;
            -[HDHRSSignedClinicalDataProcessingContextCollection contextItems](v8, "contextItems");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[NSArray isEqualToArray:](v29, "isEqualToArray:", v32);

            if (countryCode == v16)
            {

            }
            else
            {

            }
            v30 = receivedDate == v10;
            v4 = v34;
LABEL_34:
            v13 = v35;
            if (v30)
              goto LABEL_29;
            goto LABEL_28;
          }

          v14 = 0;
        }
        v30 = countryCode == v16;
        v4 = v34;
        v13 = v35;
        if (v30)
          goto LABEL_27;
        goto LABEL_26;
      }
    }
    v14 = 0;
    v13 = v35;
    goto LABEL_27;
  }
  v14 = 1;
LABEL_31:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *receivedDate;
  id v5;

  receivedDate = self->_receivedDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", receivedDate, CFSTR("ReceivedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryCode, CFSTR("CountryCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_options, CFSTR("Options"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextItems, CFSTR("ContextItems"));

}

- (HDHRSSignedClinicalDataProcessingContextCollection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HDHRSSignedClinicalDataProcessingContextCollection *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReceivedDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CountryCode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("Options")) & 1) != 0)
    {
      v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Options"));
      objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ContextItems"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        self = -[HDHRSSignedClinicalDataProcessingContextCollection initWithReceivedDate:countryCode:options:contextItems:](self, "initWithReceivedDate:countryCode:options:contextItems:", v5, v6, v7, v9);
        v10 = self;
      }
      else
      {
        objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
        v10 = 0;
      }

    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v10 = 0;
    }

  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v10 = 0;
  }

  return v10;
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSArray)contextItems
{
  return self->_contextItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextItems, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_receivedDate, 0);
}

@end
