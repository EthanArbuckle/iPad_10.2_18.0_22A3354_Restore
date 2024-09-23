@implementation CTMmsRegistrationFailureInfoType

- (CTMmsRegistrationFailureInfoType)init
{
  CTMmsRegistrationFailureInfoType *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CTMmsRegistrationFailureInfoType;
  v2 = -[CTMmsRegistrationFailureInfoType init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTMmsRegistrationFailureInfoType setPdpContextId:](v2, "setPdpContextId:", v3);

    -[CTMmsRegistrationFailureInfoType setDataActive:](v2, "setDataActive:", 0);
    -[CTMmsRegistrationFailureInfoType setIsDataAttached:](v2, "setIsDataAttached:", 0);
    -[CTMmsRegistrationFailureInfoType setActivationForMms:](v2, "setActivationForMms:", 1);
  }
  return v2;
}

- (BOOL)isEqualToCTMmsRegistrationFailureInfoType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  _BOOL4 v11;

  v4 = a3;
  if (v4)
  {
    -[CTMmsRegistrationFailureInfoType pdpContextId](self, "pdpContextId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pdpContextId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6
      && (v7 = -[CTMmsRegistrationFailureInfoType dataActive](self, "dataActive"),
          v7 == objc_msgSend(v4, "dataActive"))
      && (v8 = -[CTMmsRegistrationFailureInfoType isDataAttached](self, "isDataAttached"),
          v8 == objc_msgSend(v4, "isDataAttached")))
    {
      v11 = -[CTMmsRegistrationFailureInfoType activationForMms](self, "activationForMms");
      v9 = v11 ^ objc_msgSend(v4, "activationForMms") ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTMmsRegistrationFailureInfoType *v4;
  BOOL v5;

  v4 = (CTMmsRegistrationFailureInfoType *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTMmsRegistrationFailureInfoType isEqualToCTMmsRegistrationFailureInfoType:](self, "isEqualToCTMmsRegistrationFailureInfoType:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTMmsRegistrationFailureInfoType pdpContextId](self, "pdpContextId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPdpContextId:", v5);

  objc_msgSend(v4, "setDataActive:", -[CTMmsRegistrationFailureInfoType dataActive](self, "dataActive"));
  objc_msgSend(v4, "setIsDataAttached:", -[CTMmsRegistrationFailureInfoType isDataAttached](self, "isDataAttached"));
  objc_msgSend(v4, "setActivationForMms:", -[CTMmsRegistrationFailureInfoType activationForMms](self, "activationForMms"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *pdpContextId;
  id v5;

  pdpContextId = self->_pdpContextId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", pdpContextId, CFSTR("pdp_context_id"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_dataActive, CFSTR("data_active"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDataAttached, CFSTR("is_data_attached"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_activationForMms, CFSTR("activation_for_mms"));

}

- (CTMmsRegistrationFailureInfoType)initWithCoder:(id)a3
{
  id v4;
  CTMmsRegistrationFailureInfoType *v5;
  uint64_t v6;
  NSNumber *pdpContextId;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTMmsRegistrationFailureInfoType;
  v5 = -[CTMmsRegistrationFailureInfoType init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pdp_context_id"));
    v6 = objc_claimAutoreleasedReturnValue();
    pdpContextId = v5->_pdpContextId;
    v5->_pdpContextId = (NSNumber *)v6;

    v5->_dataActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("data_active"));
    v5->_isDataAttached = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("is_data_attached"));
    v5->_activationForMms = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("activation_for_mms"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)pdpContextId
{
  return self->_pdpContextId;
}

- (void)setPdpContextId:(id)a3
{
  objc_storeStrong((id *)&self->_pdpContextId, a3);
}

- (BOOL)dataActive
{
  return self->_dataActive;
}

- (void)setDataActive:(BOOL)a3
{
  self->_dataActive = a3;
}

- (BOOL)isDataAttached
{
  return self->_isDataAttached;
}

- (void)setIsDataAttached:(BOOL)a3
{
  self->_isDataAttached = a3;
}

- (BOOL)activationForMms
{
  return self->_activationForMms;
}

- (void)setActivationForMms:(BOOL)a3
{
  self->_activationForMms = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdpContextId, 0);
}

@end
