@implementation CTSimDeactivationEvent

- (id)description
{
  void *v3;
  unint64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTSimDeactivationEvent sourceType](self, "sourceType");
  v5 = "CTSimDeactivationEventSourceTypeUnknown";
  if (v4 == 1)
    v5 = "CTSimDeactivationEventSourceTypeCellular";
  if (v4 == 2)
    v5 = "CTSimDeactivationEventSourceTypeCarrierEntitlement";
  objc_msgSend(v3, "appendFormat:", CFSTR(", sourceType=%s"), v5);
  -[CTSimDeactivationEvent reasonCode](self, "reasonCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", reasonCode=%@"), v6);

  -[CTSimDeactivationEvent networkPlmn](self, "networkPlmn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", networkPlmn=%@"), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(", isRoaming=%hhd"), -[CTSimDeactivationEvent isRoaming](self, "isRoaming"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", isNetworkInitiated=%hhd"), -[CTSimDeactivationEvent isNetworkInitiated](self, "isNetworkInitiated"));
  -[CTSimDeactivationEvent rat](self, "rat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", rat=%@"), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(", timeOfEvent=%ld"), -[CTSimDeactivationEvent timeOfEvent](self, "timeOfEvent"));
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t sourceType;
  id v5;

  sourceType = self->_sourceType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", sourceType, CFSTR("sourceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reasonCode, CFSTR("reasonCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_networkPlmn, CFSTR("networkPlmn"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isRoaming, CFSTR("isRoaming"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isNetworkInitiated, CFSTR("isNetworkInitiated"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rat, CFSTR("rat"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timeOfEvent"), (double)self->_timeOfEvent);

}

- (CTSimDeactivationEvent)initWithCoder:(id)a3
{
  id v4;
  CTSimDeactivationEvent *v5;
  uint64_t v6;
  NSString *reasonCode;
  uint64_t v8;
  NSString *networkPlmn;
  uint64_t v10;
  NSString *rat;
  double v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTSimDeactivationEvent;
  v5 = -[CTSimDeactivationEvent init](&v14, sel_init);
  if (v5)
  {
    v5->_sourceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sourceType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reasonCode"));
    v6 = objc_claimAutoreleasedReturnValue();
    reasonCode = v5->_reasonCode;
    v5->_reasonCode = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkPlmn"));
    v8 = objc_claimAutoreleasedReturnValue();
    networkPlmn = v5->_networkPlmn;
    v5->_networkPlmn = (NSString *)v8;

    v5->_isRoaming = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRoaming"));
    v5->_isNetworkInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isNetworkInitiated"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rat"));
    v10 = objc_claimAutoreleasedReturnValue();
    rat = v5->_rat;
    v5->_rat = (NSString *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeOfEvent"));
    v5->_timeOfEvent = (uint64_t)v12;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  CTSimDeactivationEvent *v7;
  CTSimDeactivationEvent *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  void *v18;
  int64_t v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v7 = (CTSimDeactivationEvent *)a3;
  v8 = v7;
  if (v7)
  {
    if (v7 == self)
    {
      v12 = 1;
      goto LABEL_30;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[CTSimDeactivationEvent sourceType](self, "sourceType");
      if (v9 == -[CTSimDeactivationEvent sourceType](v8, "sourceType"))
      {
        -[CTSimDeactivationEvent reasonCode](self, "reasonCode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSimDeactivationEvent reasonCode](v8, "reasonCode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 != v11)
        {
          -[CTSimDeactivationEvent reasonCode](self, "reasonCode");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTSimDeactivationEvent reasonCode](v8, "reasonCode");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "isEqualToString:", v4))
          {
            v12 = 0;
            goto LABEL_28;
          }
        }
        -[CTSimDeactivationEvent networkPlmn](self, "networkPlmn");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSimDeactivationEvent networkPlmn](v8, "networkPlmn");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 != v14)
        {
          -[CTSimDeactivationEvent networkPlmn](self, "networkPlmn");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTSimDeactivationEvent networkPlmn](v8, "networkPlmn");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v15, "isEqualToString:", v5))
          {
            v12 = 0;
            goto LABEL_26;
          }
          v26 = v15;
        }
        v16 = -[CTSimDeactivationEvent isRoaming](self, "isRoaming");
        if (v16 != -[CTSimDeactivationEvent isRoaming](v8, "isRoaming")
          || (v17 = -[CTSimDeactivationEvent isNetworkInitiated](self, "isNetworkInitiated"),
              v17 != -[CTSimDeactivationEvent isNetworkInitiated](v8, "isNetworkInitiated")))
        {
          v12 = 0;
          v15 = v26;
          if (v13 == v14)
            goto LABEL_27;
          goto LABEL_26;
        }
        -[CTSimDeactivationEvent rat](self, "rat");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSimDeactivationEvent rat](v8, "rat");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25 == v24)
        {
          v22 = v3;
        }
        else
        {
          -[CTSimDeactivationEvent rat](self, "rat");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTSimDeactivationEvent rat](v8, "rat");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v18;
          if (!objc_msgSend(v18, "isEqualToString:"))
          {
            v12 = 0;
            v15 = v26;
            goto LABEL_25;
          }
          v22 = v3;
        }
        v15 = v26;
        v19 = -[CTSimDeactivationEvent timeOfEvent](self, "timeOfEvent");
        v12 = v19 == -[CTSimDeactivationEvent timeOfEvent](v8, "timeOfEvent");
        if (v25 == v24)
        {

          v3 = v22;
          if (v13 == v14)
          {
LABEL_27:

            if (v10 == v11)
            {
LABEL_29:

              goto LABEL_30;
            }
LABEL_28:

            goto LABEL_29;
          }
LABEL_26:

          goto LABEL_27;
        }
        v3 = v22;
LABEL_25:

        if (v13 == v14)
          goto LABEL_27;
        goto LABEL_26;
      }
    }
  }
  v12 = 0;
LABEL_30:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(unint64_t)a3
{
  self->_sourceType = a3;
}

- (NSString)reasonCode
{
  return self->_reasonCode;
}

- (void)setReasonCode:(id)a3
{
  objc_storeStrong((id *)&self->_reasonCode, a3);
}

- (NSString)networkPlmn
{
  return self->_networkPlmn;
}

- (void)setNetworkPlmn:(id)a3
{
  objc_storeStrong((id *)&self->_networkPlmn, a3);
}

- (BOOL)isRoaming
{
  return self->_isRoaming;
}

- (void)setIsRoaming:(BOOL)a3
{
  self->_isRoaming = a3;
}

- (BOOL)isNetworkInitiated
{
  return self->_isNetworkInitiated;
}

- (void)setIsNetworkInitiated:(BOOL)a3
{
  self->_isNetworkInitiated = a3;
}

- (NSString)rat
{
  return self->_rat;
}

- (void)setRat:(id)a3
{
  objc_storeStrong((id *)&self->_rat, a3);
}

- (int64_t)timeOfEvent
{
  return self->_timeOfEvent;
}

- (void)setTimeOfEvent:(int64_t)a3
{
  self->_timeOfEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rat, 0);
  objc_storeStrong((id *)&self->_networkPlmn, 0);
  objc_storeStrong((id *)&self->_reasonCode, 0);
}

@end
