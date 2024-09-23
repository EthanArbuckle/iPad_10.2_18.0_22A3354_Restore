@implementation CTLazuliToggleStatusInformation

- (id)description
{
  void *v3;
  int64_t v4;
  int64_t v5;
  int64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTLazuliToggleStatusInformation type](self, "type");
  v7 = -[CTLazuliToggleStatusInformation type](self, "type");
  objc_msgSend(v3, "appendFormat:", CFSTR(", type = [%ld - %s]"), v4, print_CTLazuliToggleStateType(&v7));
  v5 = -[CTLazuliToggleStatusInformation userPreferenceForSwitch](self, "userPreferenceForSwitch");
  v7 = -[CTLazuliToggleStatusInformation userPreferenceForSwitch](self, "userPreferenceForSwitch");
  objc_msgSend(v3, "appendFormat:", CFSTR(", userPreferenceForSwitch = [%ld - %s]"), v5, print_CTLazuliToggleSwitchPreferenceType(&v7));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliToggleStatusInformation:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  BOOL v7;

  v4 = a3;
  v5 = -[CTLazuliToggleStatusInformation type](self, "type");
  if (v5 == objc_msgSend(v4, "type"))
  {
    v6 = -[CTLazuliToggleStatusInformation userPreferenceForSwitch](self, "userPreferenceForSwitch");
    v7 = v6 == objc_msgSend(v4, "userPreferenceForSwitch");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliToggleStatusInformation *v4;
  CTLazuliToggleStatusInformation *v5;
  BOOL v6;

  v4 = (CTLazuliToggleStatusInformation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliToggleStatusInformation isEqualToCTLazuliToggleStatusInformation:](self, "isEqualToCTLazuliToggleStatusInformation:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliToggleStatusInformation *v4;

  v4 = +[CTLazuliToggleStatusInformation allocWithZone:](CTLazuliToggleStatusInformation, "allocWithZone:", a3);
  -[CTLazuliToggleStatusInformation setType:](v4, "setType:", self->_type);
  -[CTLazuliToggleStatusInformation setUserPreferenceForSwitch:](v4, "setUserPreferenceForSwitch:", self->_userPreferenceForSwitch);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("kTypeKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_userPreferenceForSwitch);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("kUserPreferenceForSwitchKey"));

}

- (CTLazuliToggleStatusInformation)initWithCoder:(id)a3
{
  id v4;
  CTLazuliToggleStatusInformation *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliToggleStatusInformation;
  v5 = -[CTLazuliToggleStatusInformation init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTypeKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUserPreferenceForSwitchKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_userPreferenceForSwitch = objc_msgSend(v7, "longValue");

  }
  return v5;
}

- (CTLazuliToggleStatusInformation)initWithReflection:(const ToggleStatusInformation *)a3
{
  CTLazuliToggleStatusInformation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTLazuliToggleStatusInformation;
  v4 = -[CTLazuliToggleStatusInformation init](&v6, sel_init);
  if (v4)
  {
    v4->_type = encode_CTLazuliChatBotCardMediaHeightType((unsigned int *)a3);
    v4->_userPreferenceForSwitch = encode_CTLazuliGroupChatParticipantRoleType(&a3->var1);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)userPreferenceForSwitch
{
  return self->_userPreferenceForSwitch;
}

- (void)setUserPreferenceForSwitch:(int64_t)a3
{
  self->_userPreferenceForSwitch = a3;
}

@end
