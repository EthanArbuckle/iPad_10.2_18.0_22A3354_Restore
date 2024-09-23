@implementation CTSuppServicesNotificationData

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSuppServicesNotificationData callForwardingReason](self, "callForwardingReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTSuppServicesNotificationData callForwardingReason](self, "callForwardingReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", callForwardingReason=%@"), v5);

  }
  -[CTSuppServicesNotificationData callForwardingNumber](self, "callForwardingNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CTSuppServicesNotificationData callForwardingNumber](self, "callForwardingNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", callForwardingNumber=%@"), v7);

  }
  -[CTSuppServicesNotificationData callClass](self, "callClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CTSuppServicesNotificationData callClass](self, "callClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", callClass=%@"), v9);

  }
  -[CTSuppServicesNotificationData enabled](self, "enabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CTSuppServicesNotificationData enabled](self, "enabled");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", enabled=%@"), v11);

  }
  -[CTSuppServicesNotificationData active](self, "active");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CTSuppServicesNotificationData active](self, "active");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", active=%@"), v13);

  }
  -[CTSuppServicesNotificationData callForwardingNoReplyTime](self, "callForwardingNoReplyTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CTSuppServicesNotificationData callForwardingNoReplyTime](self, "callForwardingNoReplyTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", callForwardingNoReplyTime=%@"), v15);

  }
  -[CTSuppServicesNotificationData mmiProcedure](self, "mmiProcedure");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CTSuppServicesNotificationData mmiProcedure](self, "mmiProcedure");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", mmiProcedure=%@"), v17);

  }
  -[CTSuppServicesNotificationData callBarringFacility](self, "callBarringFacility");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[CTSuppServicesNotificationData callBarringFacility](self, "callBarringFacility");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", callBarringFacility=%@"), v19);

  }
  -[CTSuppServicesNotificationData supplementaryServiceType](self, "supplementaryServiceType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CTSuppServicesNotificationData supplementaryServiceType](self, "supplementaryServiceType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", supplementaryServiceType=%@"), v21);

  }
  -[CTSuppServicesNotificationData callingLineIdRestriction](self, "callingLineIdRestriction");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[CTSuppServicesNotificationData callingLineIdRestriction](self, "callingLineIdRestriction");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", callingLineIdRestriction=%@"), v23);

  }
  -[CTSuppServicesNotificationData callingLineIdRestrictionModification](self, "callingLineIdRestrictionModification");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[CTSuppServicesNotificationData callingLineIdRestrictionModification](self, "callingLineIdRestrictionModification");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", callingLineIdRestrictionModification=%@"), v25);

  }
  -[CTSuppServicesNotificationData connectedLineIdRestriction](self, "connectedLineIdRestriction");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[CTSuppServicesNotificationData connectedLineIdRestriction](self, "connectedLineIdRestriction");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", connectedLineIdRestriction=%@"), v27);

  }
  -[CTSuppServicesNotificationData callingNamePresentation](self, "callingNamePresentation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[CTSuppServicesNotificationData callingNamePresentation](self, "callingNamePresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", callingNamePresentation=%@"), v29);

  }
  -[CTSuppServicesNotificationData connectedLinePresentation](self, "connectedLinePresentation");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[CTSuppServicesNotificationData connectedLinePresentation](self, "connectedLinePresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", connectedLinePresentation=%@"), v31);

  }
  -[CTSuppServicesNotificationData callingLinePresentation](self, "callingLinePresentation");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[CTSuppServicesNotificationData callingLinePresentation](self, "callingLinePresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", callingLinePresentation=%@"), v33);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTSuppServicesNotificationData callForwardingReason](self, "callForwardingReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCallForwardingReason:", v6);

  -[CTSuppServicesNotificationData callForwardingNumber](self, "callForwardingNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setCallForwardingNumber:", v8);

  -[CTSuppServicesNotificationData callClass](self, "callClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setCallClass:", v10);

  -[CTSuppServicesNotificationData enabled](self, "enabled");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setEnabled:", v12);

  -[CTSuppServicesNotificationData active](self, "active");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setActive:", v14);

  -[CTSuppServicesNotificationData callForwardingNoReplyTime](self, "callForwardingNoReplyTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setCallForwardingNoReplyTime:", v16);

  -[CTSuppServicesNotificationData mmiProcedure](self, "mmiProcedure");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setMmiProcedure:", v18);

  -[CTSuppServicesNotificationData callBarringFacility](self, "callBarringFacility");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setCallBarringFacility:", v20);

  -[CTSuppServicesNotificationData supplementaryServiceType](self, "supplementaryServiceType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setSupplementaryServiceType:", v22);

  -[CTSuppServicesNotificationData callingLineIdRestriction](self, "callingLineIdRestriction");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setCallingLineIdRestriction:", v24);

  -[CTSuppServicesNotificationData callingLineIdRestrictionModification](self, "callingLineIdRestrictionModification");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setCallingLineIdRestrictionModification:", v26);

  -[CTSuppServicesNotificationData connectedLineIdRestriction](self, "connectedLineIdRestriction");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setConnectedLineIdRestriction:", v28);

  -[CTSuppServicesNotificationData callingNamePresentation](self, "callingNamePresentation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v4, "setCallingNamePresentation:", v30);

  -[CTSuppServicesNotificationData connectedLinePresentation](self, "connectedLinePresentation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v4, "setConnectedLinePresentation:", v32);

  -[CTSuppServicesNotificationData callingLinePresentation](self, "callingLinePresentation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  objc_msgSend(v4, "setCallingLinePresentation:", v34);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  -[CTSuppServicesNotificationData callForwardingReason](self, "callForwardingReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("callForwardingReason"));

  -[CTSuppServicesNotificationData callForwardingNumber](self, "callForwardingNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("callForwardingNumber"));

  -[CTSuppServicesNotificationData callClass](self, "callClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("callClass"));

  -[CTSuppServicesNotificationData enabled](self, "enabled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("enabled"));

  -[CTSuppServicesNotificationData active](self, "active");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("active"));

  -[CTSuppServicesNotificationData callForwardingNoReplyTime](self, "callForwardingNoReplyTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("callForwardingNoReplyTime"));

  -[CTSuppServicesNotificationData mmiProcedure](self, "mmiProcedure");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("mmiProcedure"));

  -[CTSuppServicesNotificationData callBarringFacility](self, "callBarringFacility");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("callBarringFacility"));

  -[CTSuppServicesNotificationData supplementaryServiceType](self, "supplementaryServiceType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("supplementaryServiceType"));

  -[CTSuppServicesNotificationData callingLineIdRestriction](self, "callingLineIdRestriction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("callingLineIdRestriction"));

  -[CTSuppServicesNotificationData callingLineIdRestrictionModification](self, "callingLineIdRestrictionModification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("callingLineIdRestrictionModification"));

  -[CTSuppServicesNotificationData connectedLineIdRestriction](self, "connectedLineIdRestriction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("connectedLineIdRestriction"));

  -[CTSuppServicesNotificationData callingNamePresentation](self, "callingNamePresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("callingNamePresentation"));

  -[CTSuppServicesNotificationData connectedLinePresentation](self, "connectedLinePresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("connectedLinePresentation"));

  -[CTSuppServicesNotificationData callingLinePresentation](self, "callingLinePresentation");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("callingLinePresentation"));

}

- (CTSuppServicesNotificationData)initWithCoder:(id)a3
{
  id v4;
  CTSuppServicesNotificationData *v5;
  uint64_t v6;
  NSNumber *callForwardingReason;
  uint64_t v8;
  NSString *callForwardingNumber;
  uint64_t v10;
  NSNumber *callClass;
  uint64_t v12;
  NSNumber *enabled;
  uint64_t v14;
  NSNumber *active;
  uint64_t v16;
  NSNumber *callForwardingNoReplyTime;
  uint64_t v18;
  NSNumber *mmiProcedure;
  uint64_t v20;
  NSNumber *callBarringFacility;
  uint64_t v22;
  NSNumber *supplementaryServiceType;
  uint64_t v24;
  NSNumber *callingLineIdRestriction;
  uint64_t v26;
  NSNumber *callingLineIdRestrictionModification;
  uint64_t v28;
  NSNumber *connectedLineIdRestriction;
  uint64_t v30;
  NSNumber *callingNamePresentation;
  uint64_t v32;
  NSNumber *connectedLinePresentation;
  uint64_t v34;
  NSNumber *callingLinePresentation;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CTSuppServicesNotificationData;
  v5 = -[CTSuppServicesNotificationData init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callForwardingReason"));
    v6 = objc_claimAutoreleasedReturnValue();
    callForwardingReason = v5->_callForwardingReason;
    v5->_callForwardingReason = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callForwardingNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    callForwardingNumber = v5->_callForwardingNumber;
    v5->_callForwardingNumber = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callClass"));
    v10 = objc_claimAutoreleasedReturnValue();
    callClass = v5->_callClass;
    v5->_callClass = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enabled"));
    v12 = objc_claimAutoreleasedReturnValue();
    enabled = v5->_enabled;
    v5->_enabled = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("active"));
    v14 = objc_claimAutoreleasedReturnValue();
    active = v5->_active;
    v5->_active = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callForwardingNoReplyTime"));
    v16 = objc_claimAutoreleasedReturnValue();
    callForwardingNoReplyTime = v5->_callForwardingNoReplyTime;
    v5->_callForwardingNoReplyTime = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mmiProcedure"));
    v18 = objc_claimAutoreleasedReturnValue();
    mmiProcedure = v5->_mmiProcedure;
    v5->_mmiProcedure = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callBarringFacility"));
    v20 = objc_claimAutoreleasedReturnValue();
    callBarringFacility = v5->_callBarringFacility;
    v5->_callBarringFacility = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supplementaryServiceType"));
    v22 = objc_claimAutoreleasedReturnValue();
    supplementaryServiceType = v5->_supplementaryServiceType;
    v5->_supplementaryServiceType = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callingLineIdRestriction"));
    v24 = objc_claimAutoreleasedReturnValue();
    callingLineIdRestriction = v5->_callingLineIdRestriction;
    v5->_callingLineIdRestriction = (NSNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callingLineIdRestrictionModification"));
    v26 = objc_claimAutoreleasedReturnValue();
    callingLineIdRestrictionModification = v5->_callingLineIdRestrictionModification;
    v5->_callingLineIdRestrictionModification = (NSNumber *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connectedLineIdRestriction"));
    v28 = objc_claimAutoreleasedReturnValue();
    connectedLineIdRestriction = v5->_connectedLineIdRestriction;
    v5->_connectedLineIdRestriction = (NSNumber *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callingNamePresentation"));
    v30 = objc_claimAutoreleasedReturnValue();
    callingNamePresentation = v5->_callingNamePresentation;
    v5->_callingNamePresentation = (NSNumber *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connectedLinePresentation"));
    v32 = objc_claimAutoreleasedReturnValue();
    connectedLinePresentation = v5->_connectedLinePresentation;
    v5->_connectedLinePresentation = (NSNumber *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callingLinePresentation"));
    v34 = objc_claimAutoreleasedReturnValue();
    callingLinePresentation = v5->_callingLinePresentation;
    v5->_callingLinePresentation = (NSNumber *)v34;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)callForwardingReason
{
  return self->_callForwardingReason;
}

- (void)setCallForwardingReason:(id)a3
{
  objc_storeStrong((id *)&self->_callForwardingReason, a3);
}

- (NSNumber)callClass
{
  return self->_callClass;
}

- (void)setCallClass:(id)a3
{
  objc_storeStrong((id *)&self->_callClass, a3);
}

- (NSNumber)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_enabled, a3);
}

- (NSNumber)active
{
  return self->_active;
}

- (void)setActive:(id)a3
{
  objc_storeStrong((id *)&self->_active, a3);
}

- (NSString)callForwardingNumber
{
  return self->_callForwardingNumber;
}

- (void)setCallForwardingNumber:(id)a3
{
  objc_storeStrong((id *)&self->_callForwardingNumber, a3);
}

- (NSNumber)callForwardingNoReplyTime
{
  return self->_callForwardingNoReplyTime;
}

- (void)setCallForwardingNoReplyTime:(id)a3
{
  objc_storeStrong((id *)&self->_callForwardingNoReplyTime, a3);
}

- (NSNumber)mmiProcedure
{
  return self->_mmiProcedure;
}

- (void)setMmiProcedure:(id)a3
{
  objc_storeStrong((id *)&self->_mmiProcedure, a3);
}

- (NSNumber)callBarringFacility
{
  return self->_callBarringFacility;
}

- (void)setCallBarringFacility:(id)a3
{
  objc_storeStrong((id *)&self->_callBarringFacility, a3);
}

- (NSNumber)supplementaryServiceType
{
  return self->_supplementaryServiceType;
}

- (void)setSupplementaryServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryServiceType, a3);
}

- (NSNumber)callingLineIdRestriction
{
  return self->_callingLineIdRestriction;
}

- (void)setCallingLineIdRestriction:(id)a3
{
  objc_storeStrong((id *)&self->_callingLineIdRestriction, a3);
}

- (NSNumber)callingLineIdRestrictionModification
{
  return self->_callingLineIdRestrictionModification;
}

- (void)setCallingLineIdRestrictionModification:(id)a3
{
  objc_storeStrong((id *)&self->_callingLineIdRestrictionModification, a3);
}

- (NSNumber)connectedLineIdRestriction
{
  return self->_connectedLineIdRestriction;
}

- (void)setConnectedLineIdRestriction:(id)a3
{
  objc_storeStrong((id *)&self->_connectedLineIdRestriction, a3);
}

- (NSNumber)callingNamePresentation
{
  return self->_callingNamePresentation;
}

- (void)setCallingNamePresentation:(id)a3
{
  objc_storeStrong((id *)&self->_callingNamePresentation, a3);
}

- (NSNumber)connectedLinePresentation
{
  return self->_connectedLinePresentation;
}

- (void)setConnectedLinePresentation:(id)a3
{
  objc_storeStrong((id *)&self->_connectedLinePresentation, a3);
}

- (NSNumber)callingLinePresentation
{
  return self->_callingLinePresentation;
}

- (void)setCallingLinePresentation:(id)a3
{
  objc_storeStrong((id *)&self->_callingLinePresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callingLinePresentation, 0);
  objc_storeStrong((id *)&self->_connectedLinePresentation, 0);
  objc_storeStrong((id *)&self->_callingNamePresentation, 0);
  objc_storeStrong((id *)&self->_connectedLineIdRestriction, 0);
  objc_storeStrong((id *)&self->_callingLineIdRestrictionModification, 0);
  objc_storeStrong((id *)&self->_callingLineIdRestriction, 0);
  objc_storeStrong((id *)&self->_supplementaryServiceType, 0);
  objc_storeStrong((id *)&self->_callBarringFacility, 0);
  objc_storeStrong((id *)&self->_mmiProcedure, 0);
  objc_storeStrong((id *)&self->_callForwardingNoReplyTime, 0);
  objc_storeStrong((id *)&self->_callForwardingNumber, 0);
  objc_storeStrong((id *)&self->_active, 0);
  objc_storeStrong((id *)&self->_enabled, 0);
  objc_storeStrong((id *)&self->_callClass, 0);
  objc_storeStrong((id *)&self->_callForwardingReason, 0);
}

@end
