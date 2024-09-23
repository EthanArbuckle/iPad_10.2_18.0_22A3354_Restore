@implementation WFPhoneNumber

- (WFPhoneNumber)initWithPhoneNumberString:(id)a3 contactName:(id)a4 label:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSString *v11;
  NSString *string;
  NSString *v13;
  NSString *contactName;
  NSString *v15;
  NSString *label;
  WFPhoneNumber *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "length") && (self = -[WFPhoneNumber init](self, "init")) != 0)
  {
    v11 = (NSString *)objc_msgSend(v8, "copy");
    string = self->_string;
    self->_string = v11;

    v13 = (NSString *)objc_msgSend(v9, "copy");
    contactName = self->_contactName;
    self->_contactName = v13;

    v15 = (NSString *)objc_msgSend(v10, "copy");
    label = self->_label;
    self->_label = v15;

    self = self;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[WFPhoneNumber normalizedPhoneNumber](self, "normalizedPhoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedPhoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSString)formattedPhoneNumber
{
  id CNPhoneNumberClass;
  void *v4;
  void *v5;
  void *v6;

  CNPhoneNumberClass = getCNPhoneNumberClass();
  -[WFPhoneNumber string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CNPhoneNumberClass, "phoneNumberWithStringValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formattedStringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)normalizedPhoneNumber
{
  id CNPhoneNumberClass;
  void *v4;
  void *v5;
  void *v6;

  CNPhoneNumberClass = getCNPhoneNumberClass();
  -[WFPhoneNumber string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CNPhoneNumberClass, "phoneNumberWithStringValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unformattedInternationalStringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)wfName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  -[WFPhoneNumber contactName](self, "contactName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WFPhoneNumber formattedPhoneNumber](self, "formattedPhoneNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[WFPhoneNumber string](self, "string");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  return (NSString *)v5;
}

- (NSString)localizedLabel
{
  void *v2;
  void *v3;

  -[WFPhoneNumber label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[WFContactLabeledValue localizedStringForLabel:](WFContactLabeledValue, "localizedStringForLabel:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (WFPhoneNumber)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFPhoneNumber *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("string"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFPhoneNumber initWithPhoneNumberString:contactName:label:](self, "initWithPhoneNumberString:contactName:label:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *label;
  NSString *contactName;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_string, CFSTR("string"));
  label = self->_label;
  if (label)
    objc_msgSend(v6, "encodeObject:forKey:", label, CFSTR("phoneLabel"));
  contactName = self->_contactName;
  if (contactName)
    objc_msgSend(v6, "encodeObject:forKey:", contactName, CFSTR("contactName"));

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  WFPhoneNumber *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;

  v6 = (WFPhoneNumber *)a3;
  if (v6 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFPhoneNumber string](v6, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFPhoneNumber string](self, "string");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "isEqualToString:", v8))
      {
        v11 = 0;
LABEL_21:

        goto LABEL_22;
      }
      -[WFPhoneNumber label](v6, "label");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 || (-[WFPhoneNumber label](self, "label"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[WFPhoneNumber label](v6, "label");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFPhoneNumber label](self, "label");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) == 0)
        {

          v11 = 0;
          goto LABEL_18;
        }
        v10 = 1;
      }
      else
      {
        v18 = 0;
        v10 = 0;
      }
      -[WFPhoneNumber contactName](v6, "contactName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 || (-[WFPhoneNumber contactName](self, "contactName"), (v17 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v19 = v10;
        -[WFPhoneNumber contactName](v6, "contactName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFPhoneNumber contactName](self, "contactName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v13, "isEqualToString:", v14);

        if (v12)
        {

          if (v19)
          {
LABEL_17:

          }
LABEL_18:
          if (!v9)

          goto LABEL_21;
        }
        LOBYTE(v10) = v19;
        v16 = (void *)v17;
      }
      else
      {
        v16 = 0;
        v11 = 1;
      }

      if ((v10 & 1) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
    v11 = 0;
  }
LABEL_22:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[WFPhoneNumber string](self, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFPhoneNumber label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[WFPhoneNumber contactName](self, "contactName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4 ^ v6 ^ objc_msgSend(v7, "hash") ^ 0x9811FA8CLL;

  return v8;
}

- (id)wfSerializedRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[WFPhoneNumber string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("link.contentkit.phonenumber"));

  objc_msgSend(v3, "setValue:forKey:", self->_contactName, CFSTR("link.contentkit.phonenumber.contactname"));
  objc_msgSend(v3, "setValue:forKey:", self->_label, CFSTR("link.contentkit.phonelabel"));
  return v3;
}

- (NSString)string
{
  return self->_string;
}

- (NSString)contactName
{
  return self->_contactName;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_contactName, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

+ (id)phoneNumbersInString:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  +[WFDataDetector resultsForString:ofTypes:error:](WFDataDetector, "resultsForString:ofTypes:error:", a3, 2048, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)stringContainsPhoneNumbers:(id)a3
{
  return +[WFDataDetector hasResultForString:ofTypes:](WFDataDetector, "hasResultForString:ofTypes:", a3, 2048);
}

+ (WFPhoneNumber)phoneNumberWithTextCheckingResult:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "phoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "phoneNumberWithPhoneNumberString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFPhoneNumber *)v5;
}

+ (WFPhoneNumber)phoneNumberWithPhoneNumberString:(id)a3
{
  return (WFPhoneNumber *)objc_msgSend(a1, "phoneNumberWithPhoneNumberString:contactName:label:", a3, 0, 0);
}

+ (WFPhoneNumber)phoneNumberWithPhoneNumberString:(id)a3 contactName:(id)a4 label:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPhoneNumberString:contactName:label:", v10, v9, v8);

  return (WFPhoneNumber *)v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.phonenumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.phonenumber.contactname"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.phonelabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPhoneNumberString:contactName:label:", v5, v6, v7);
  return v8;
}

@end
