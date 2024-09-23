@implementation CTLazuliOperationStatus

- (id)description
{
  void *v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTLazuliOperationStatus registrationState](self, "registrationState");
  v8 = -[CTLazuliOperationStatus registrationState](self, "registrationState");
  objc_msgSend(v3, "appendFormat:", CFSTR(", registrationState = [%ld - %s]"), v4, print_CTLazuliRegistrationStateType(&v8));
  v5 = -[CTLazuliOperationStatus switchState](self, "switchState");
  v8 = -[CTLazuliOperationStatus switchState](self, "switchState");
  objc_msgSend(v3, "appendFormat:", CFSTR(", switchState = [%ld - %s]"), v5, print_CTLazuliToggleStateType(&v8));
  v6 = -[CTLazuliOperationStatus cellularDataRequirement](self, "cellularDataRequirement");
  v8 = -[CTLazuliOperationStatus cellularDataRequirement](self, "cellularDataRequirement");
  objc_msgSend(v3, "appendFormat:", CFSTR(", cellularDataRequirement = [%ld - %s]"), v6, print_CTLazuliCurrentSimCellularDataRequirementType(&v8));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliOperationStatus:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  BOOL v8;

  v4 = a3;
  v5 = -[CTLazuliOperationStatus registrationState](self, "registrationState");
  if (v5 == objc_msgSend(v4, "registrationState")
    && (v6 = -[CTLazuliOperationStatus switchState](self, "switchState"), v6 == objc_msgSend(v4, "switchState")))
  {
    v7 = -[CTLazuliOperationStatus cellularDataRequirement](self, "cellularDataRequirement");
    v8 = v7 == objc_msgSend(v4, "cellularDataRequirement");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliOperationStatus *v4;
  CTLazuliOperationStatus *v5;
  BOOL v6;

  v4 = (CTLazuliOperationStatus *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliOperationStatus isEqualToCTLazuliOperationStatus:](self, "isEqualToCTLazuliOperationStatus:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliOperationStatus *v4;

  v4 = +[CTLazuliOperationStatus allocWithZone:](CTLazuliOperationStatus, "allocWithZone:", a3);
  -[CTLazuliOperationStatus setRegistrationState:](v4, "setRegistrationState:", self->_registrationState);
  -[CTLazuliOperationStatus setSwitchState:](v4, "setSwitchState:", self->_switchState);
  -[CTLazuliOperationStatus setCellularDataRequirement:](v4, "setCellularDataRequirement:", self->_cellularDataRequirement);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_registrationState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("kRegistrationStateKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_switchState);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("kSwitchStateKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_cellularDataRequirement);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("kCellularDataRequirementKey"));

}

- (CTLazuliOperationStatus)initWithCoder:(id)a3
{
  id v4;
  CTLazuliOperationStatus *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliOperationStatus;
  v5 = -[CTLazuliOperationStatus init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRegistrationStateKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_registrationState = objc_msgSend(v6, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSwitchStateKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_switchState = objc_msgSend(v7, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCellularDataRequirementKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cellularDataRequirement = objc_msgSend(v8, "longValue");

  }
  return v5;
}

- (CTLazuliOperationStatus)initWithReflection:(const OperationStatus *)a3
{
  CTLazuliOperationStatus *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTLazuliOperationStatus;
  v4 = -[CTLazuliOperationStatus init](&v6, sel_init);
  if (v4)
  {
    v4->_registrationState = encode_CTLazuliChatBotCardMediaHeightType((unsigned int *)a3);
    v4->_switchState = encode_CTLazuliChatBotCardMediaHeightType((unsigned int *)&a3->var1);
    v4->_cellularDataRequirement = encode_CTLazuliGroupChatParticipantRoleType(&a3->var2);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)registrationState
{
  return self->_registrationState;
}

- (void)setRegistrationState:(int64_t)a3
{
  self->_registrationState = a3;
}

- (int64_t)switchState
{
  return self->_switchState;
}

- (void)setSwitchState:(int64_t)a3
{
  self->_switchState = a3;
}

- (int64_t)cellularDataRequirement
{
  return self->_cellularDataRequirement;
}

- (void)setCellularDataRequirement:(int64_t)a3
{
  self->_cellularDataRequirement = a3;
}

@end
