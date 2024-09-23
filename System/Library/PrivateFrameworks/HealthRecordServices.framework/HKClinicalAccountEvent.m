@implementation HKClinicalAccountEvent

- (HKClinicalAccountEvent)init
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

- (HKClinicalAccountEvent)initWithAccountIdentifier:(id)a3 type:(int64_t)a4 caller:(id)a5 timestamp:(id)a6 eventDescription:(id)a7 credentialStateBefore:(int64_t)a8 credentialStateAfter:(int64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  HKClinicalAccountEvent *v19;
  uint64_t v20;
  NSUUID *accountIdentifier;
  uint64_t v22;
  NSString *caller;
  uint64_t v24;
  NSDate *timestamp;
  uint64_t v26;
  NSString *eventDescription;
  objc_super v29;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKClinicalAccountEvent;
  v19 = -[HKClinicalAccountEvent init](&v29, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    accountIdentifier = v19->_accountIdentifier;
    v19->_accountIdentifier = (NSUUID *)v20;

    v19->_type = a4;
    v22 = objc_msgSend(v16, "copy");
    caller = v19->_caller;
    v19->_caller = (NSString *)v22;

    v24 = objc_msgSend(v17, "copy");
    timestamp = v19->_timestamp;
    v19->_timestamp = (NSDate *)v24;

    v26 = objc_msgSend(v18, "copy");
    eventDescription = v19->_eventDescription;
    v19->_eventDescription = (NSString *)v26;

    v19->_credentialStateBefore = a8;
    v19->_credentialStateAfter = a9;
  }

  return v19;
}

- (HKClinicalAccountEvent)initWithAccountIdentifier:(id)a3 type:(int64_t)a4 caller:(id)a5 timestamp:(id)a6 eventDescription:(id)a7
{
  return -[HKClinicalAccountEvent initWithAccountIdentifier:type:caller:timestamp:eventDescription:credentialStateBefore:credentialStateAfter:](self, "initWithAccountIdentifier:type:caller:timestamp:eventDescription:credentialStateBefore:credentialStateAfter:", a3, a4, a5, a6, a7, 0, 0);
}

- (HKClinicalAccountEvent)initWithAccountIdentifier:(id)a3 type:(int64_t)a4 caller:(id)a5 timestamp:(id)a6 eventDescription:(id)a7 incomingToken:(id)a8 currentToken:(id)a9
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  HKClinicalAccountEvent *v25;

  v16 = (void *)MEMORY[0x24BDD17C8];
  v17 = a9;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  objc_msgSend(a8, "hk_SHA256Hash");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hk_SHA256Hash");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ - %@: %@ - %@: %@"), v18, CFSTR("Incoming Token"), v22, CFSTR("Current Token"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[HKClinicalAccountEvent initWithAccountIdentifier:type:caller:timestamp:eventDescription:credentialStateBefore:credentialStateAfter:](self, "initWithAccountIdentifier:type:caller:timestamp:eventDescription:credentialStateBefore:credentialStateAfter:", v21, a4, v20, v19, v24, 0, 0);
  return v25;
}

- (HKClinicalAccountEvent)eventWithAppendedEventDescription:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[HKClinicalAccountEvent accountIdentifier](self, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKClinicalAccountEvent type](self, "type");
  -[HKClinicalAccountEvent caller](self, "caller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAccountEvent timestamp](self, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[HKClinicalAccountEvent eventDescription](self, "eventDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ - %@"), v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v5, "initWithAccountIdentifier:type:caller:timestamp:eventDescription:credentialStateBefore:credentialStateAfter:", v6, v7, v8, v9, v12, -[HKClinicalAccountEvent credentialStateBefore](self, "credentialStateBefore"), -[HKClinicalAccountEvent credentialStateAfter](self, "credentialStateAfter"));
  return (HKClinicalAccountEvent *)v13;
}

- (HKClinicalAccountEvent)eventWithAppendedRefreshToken:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  v6 = a4;
  v7 = a3;
  v18 = objc_alloc((Class)objc_opt_class());
  -[HKClinicalAccountEvent accountIdentifier](self, "accountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKClinicalAccountEvent type](self, "type");
  -[HKClinicalAccountEvent caller](self, "caller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAccountEvent timestamp](self, "timestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD17C8];
  -[HKClinicalAccountEvent eventDescription](self, "eventDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_SHA256Hash");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ - %@: %@"), v13, v6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v18, "initWithAccountIdentifier:type:caller:timestamp:eventDescription:credentialStateBefore:credentialStateAfter:", v8, v9, v10, v11, v15, -[HKClinicalAccountEvent credentialStateBefore](self, "credentialStateBefore"), -[HKClinicalAccountEvent credentialStateAfter](self, "credentialStateAfter"));
  return (HKClinicalAccountEvent *)v16;
}

- (HKClinicalAccountEvent)eventWithUpdatedCredentialStateBefore:(int64_t)a3
{
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = objc_alloc((Class)objc_opt_class());
  -[HKClinicalAccountEvent accountIdentifier](self, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKClinicalAccountEvent type](self, "type");
  -[HKClinicalAccountEvent caller](self, "caller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAccountEvent timestamp](self, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAccountEvent eventDescription](self, "eventDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithAccountIdentifier:type:caller:timestamp:eventDescription:credentialStateBefore:credentialStateAfter:", v6, v7, v8, v9, v10, a3, -[HKClinicalAccountEvent credentialStateAfter](self, "credentialStateAfter"));

  return (HKClinicalAccountEvent *)v11;
}

- (HKClinicalAccountEvent)eventWithUpdatedCredentialStateAfter:(int64_t)a3
{
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = objc_alloc((Class)objc_opt_class());
  -[HKClinicalAccountEvent accountIdentifier](self, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKClinicalAccountEvent type](self, "type");
  -[HKClinicalAccountEvent caller](self, "caller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAccountEvent timestamp](self, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAccountEvent eventDescription](self, "eventDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithAccountIdentifier:type:caller:timestamp:eventDescription:credentialStateBefore:credentialStateAfter:", v6, v7, v8, v9, v10, -[HKClinicalAccountEvent credentialStateBefore](self, "credentialStateBefore"), a3);

  return (HKClinicalAccountEvent *)v11;
}

- (id)eventMarkedAsFailedWithError:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[HKClinicalAccountEvent accountIdentifier](self, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKClinicalAccountEvent type](self, "type");
  -[HKClinicalAccountEvent caller](self, "caller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAccountEvent timestamp](self, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[HKClinicalAccountEvent eventDescription](self, "eventDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hrs_completeDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringWithFormat:", CFSTR("Action: (%@) failed: (%@)"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v5, "initWithAccountIdentifier:type:caller:timestamp:eventDescription:credentialStateBefore:credentialStateAfter:", v6, v7, v8, v9, v13, -[HKClinicalAccountEvent credentialStateBefore](self, "credentialStateBefore"), -[HKClinicalAccountEvent credentialStateAfter](self, "credentialStateAfter"));

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  HKClinicalAccountEvent *v4;
  HKClinicalAccountEvent *v5;
  BOOL v6;

  v4 = (HKClinicalAccountEvent *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[HKClinicalAccountEvent isEqualToClinicalAccountEvent:](self, "isEqualToClinicalAccountEvent:", v5);

  return v6;
}

- (BOOL)isEqualToClinicalAccountEvent:(id)a3
{
  void *v3;
  void *v4;
  HKClinicalAccountEvent *v6;
  HKClinicalAccountEvent *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  int64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int64_t v26;
  int64_t v27;
  BOOL v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v6 = (HKClinicalAccountEvent *)a3;
  v7 = v6;
  if (self == v6)
  {
    v13 = 1;
  }
  else
  {
    if (v6)
    {
      -[HKClinicalAccountEvent accountIdentifier](self, "accountIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKClinicalAccountEvent accountIdentifier](v7, "accountIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[HKClinicalAccountEvent accountIdentifier](v7, "accountIdentifier");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
          goto LABEL_43;
        }
        v3 = (void *)v10;
        -[HKClinicalAccountEvent accountIdentifier](self, "accountIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKClinicalAccountEvent accountIdentifier](v7, "accountIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = 0;
LABEL_42:

          goto LABEL_43;
        }
        v41 = v12;
        v42 = v11;
      }
      v14 = -[HKClinicalAccountEvent type](self, "type");
      if (v14 != -[HKClinicalAccountEvent type](v7, "type"))
        goto LABEL_40;
      -[HKClinicalAccountEvent caller](self, "caller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKClinicalAccountEvent caller](v7, "caller");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 != v16)
      {
        -[HKClinicalAccountEvent caller](v7, "caller");
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
LABEL_38:

LABEL_39:
LABEL_40:
          v13 = 0;
          goto LABEL_41;
        }
        v38 = (void *)v17;
        -[HKClinicalAccountEvent caller](self, "caller");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKClinicalAccountEvent caller](v7, "caller");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "isEqualToString:", v18) & 1) == 0)
        {

LABEL_37:
          goto LABEL_38;
        }
        v35 = v18;
      }
      -[HKClinicalAccountEvent timestamp](self, "timestamp");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKClinicalAccountEvent timestamp](v7, "timestamp");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v19;
      if (v19 == v39)
      {
        v36 = v4;
        v37 = v15;
LABEL_21:
        -[HKClinicalAccountEvent eventDescription](self, "eventDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKClinicalAccountEvent eventDescription](v7, "eventDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 != v23)
        {
          -[HKClinicalAccountEvent eventDescription](v7, "eventDescription");
          v24 = objc_claimAutoreleasedReturnValue();
          if (!v24)
            goto LABEL_47;
          v25 = (void *)v24;
          -[HKClinicalAccountEvent eventDescription](self, "eventDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKClinicalAccountEvent eventDescription](v7, "eventDescription");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v25;
          if (!objc_msgSend(v19, "isEqualToString:"))
          {
            v13 = 0;
LABEL_29:

            if (v40 == v39)
            {

              v4 = v36;
              v15 = v37;
              goto LABEL_32;
            }

            v4 = v36;
            v15 = v37;
LABEL_31:

LABEL_32:
            if (v15 != v16)
            {

            }
            goto LABEL_41;
          }
        }
        v26 = -[HKClinicalAccountEvent credentialStateBefore](self, "credentialStateBefore");
        if (v26 == -[HKClinicalAccountEvent credentialStateBefore](v7, "credentialStateBefore"))
        {
          v27 = -[HKClinicalAccountEvent credentialStateAfter](self, "credentialStateAfter");
          v13 = v27 == -[HKClinicalAccountEvent credentialStateAfter](v7, "credentialStateAfter");
          v28 = v13;
          if (v22 != v23)
            goto LABEL_29;
          goto LABEL_51;
        }
        if (v22 == v23)
        {
          v28 = 0;
          v13 = 0;
LABEL_51:

          goto LABEL_52;
        }

LABEL_47:
        v28 = 0;
        v13 = 0;
LABEL_52:
        if (v40 != v39)
        {

          v13 = v28;
        }

        if (v37 != v16)
        {

        }
LABEL_41:
        v11 = v42;
        v12 = v41;
        if (v8 != v9)
          goto LABEL_42;
LABEL_43:

        goto LABEL_44;
      }
      -[HKClinicalAccountEvent timestamp](v7, "timestamp");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        v13 = 0;
        goto LABEL_31;
      }
      v34 = (void *)v20;
      -[HKClinicalAccountEvent timestamp](self, "timestamp");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKClinicalAccountEvent timestamp](v7, "timestamp");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isEqualToDate:", v19) & 1) != 0)
      {
        v31 = v21;
        v36 = v4;
        v37 = v15;
        v33 = v19;
        goto LABEL_21;
      }

      if (v15 == v16)
      {

        goto LABEL_39;
      }

      goto LABEL_37;
    }
    v13 = 0;
  }
LABEL_44:

  return v13;
}

- (unint64_t)hash
{
  int64_t v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = self->_type ^ -[NSUUID hash](self->_accountIdentifier, "hash");
  v4 = -[NSString hash](self->_caller, "hash");
  v5 = v3 ^ v4 ^ -[NSDate hash](self->_timestamp, "hash");
  return v5 ^ -[NSString hash](self->_eventDescription, "hash") ^ self->_credentialStateBefore ^ self->_credentialStateAfter;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HKClinicalAccountEvent accountIdentifier](self, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("accountIdentifier"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[HKClinicalAccountEvent type](self, "type"), CFSTR("type"));
  -[HKClinicalAccountEvent caller](self, "caller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("caller"));

  -[HKClinicalAccountEvent timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("timestamp"));

  -[HKClinicalAccountEvent eventDescription](self, "eventDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("eventDescription"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[HKClinicalAccountEvent credentialStateBefore](self, "credentialStateBefore"), CFSTR("credentialStateBefore"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[HKClinicalAccountEvent credentialStateAfter](self, "credentialStateAfter"), CFSTR("credentialStateAfter"));

}

- (HKClinicalAccountEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  HKClinicalAccountEvent *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("caller"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventDescription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("credentialStateBefore"));
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("credentialStateAfter"));
  if (!v5 || !v7 || !v8 || !v9)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  if (v6 > 2 || v10 > 3 || v11 >= 4)
  {
    objc_msgSend(v4, "hrs_failWithCocoaInvalidValueError");
    goto LABEL_11;
  }
  self = -[HKClinicalAccountEvent initWithAccountIdentifier:type:caller:timestamp:eventDescription:credentialStateBefore:credentialStateAfter:](self, "initWithAccountIdentifier:type:caller:timestamp:eventDescription:credentialStateBefore:credentialStateAfter:", v5, v6, v7, v8, v9, v10, v11);
  v12 = self;
LABEL_12:

  return v12;
}

- (NSString)typeDescription
{
  int64_t v2;
  __CFString *v3;

  v2 = -[HKClinicalAccountEvent type](self, "type");
  v3 = CFSTR("unknown");
  if (v2 == 1)
    v3 = CFSTR("credential state change");
  if (v2 == 2)
    return (NSString *)CFSTR("ignore incoming credential from sync");
  else
    return (NSString *)v3;
}

- (NSString)credentialStateBeforeDescription
{
  int64_t v2;

  v2 = -[HKClinicalAccountEvent credentialStateBefore](self, "credentialStateBefore");
  if ((unint64_t)(v2 - 1) > 2)
    return (NSString *)CFSTR("unknown");
  else
    return &off_24D549B78[v2 - 1]->isa;
}

- (NSString)credentialStateAfterDescription
{
  int64_t v2;

  v2 = -[HKClinicalAccountEvent credentialStateAfter](self, "credentialStateAfter");
  if ((unint64_t)(v2 - 1) > 2)
    return (NSString *)CFSTR("unknown");
  else
    return &off_24D549B78[v2 - 1]->isa;
}

- (NSUUID)accountIdentifier
{
  return self->_accountIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)caller
{
  return self->_caller;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)eventDescription
{
  return self->_eventDescription;
}

- (int64_t)credentialStateBefore
{
  return self->_credentialStateBefore;
}

- (int64_t)credentialStateAfter
{
  return self->_credentialStateAfter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDescription, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
