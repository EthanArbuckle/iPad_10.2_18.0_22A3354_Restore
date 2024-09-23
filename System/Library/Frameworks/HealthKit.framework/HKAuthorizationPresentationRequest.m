@implementation HKAuthorizationPresentationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKAuthorizationPresentationRequest)initWithCoder:(id)a3
{
  id v4;
  HKAuthorizationPresentationRequest *v5;
  uint64_t v6;
  NSString *readUsageDescription;
  uint64_t v8;
  NSString *shareUsageDescription;
  uint64_t v10;
  NSString *researchStudyUsageDescription;
  void *v12;
  uint64_t v13;
  NSSet *typesRequiringReadAuthorization;
  void *v15;
  uint64_t v16;
  NSSet *typesRequiringShareAuthorization;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKAuthorizationPresentationRequest;
  v5 = -[HKAuthorizationPresentationRequest init](&v19, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_Type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ReadUsageDescription"));
    v6 = objc_claimAutoreleasedReturnValue();
    readUsageDescription = v5->_readUsageDescription;
    v5->_readUsageDescription = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ShareUsageDescription"));
    v8 = objc_claimAutoreleasedReturnValue();
    shareUsageDescription = v5->_shareUsageDescription;
    v5->_shareUsageDescription = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ResearchStudyUsageDescription"));
    v10 = objc_claimAutoreleasedReturnValue();
    researchStudyUsageDescription = v5->_researchStudyUsageDescription;
    v5->_researchStudyUsageDescription = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForSetOf:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_TypesRequiringReadAuthorization"));
    v13 = objc_claimAutoreleasedReturnValue();
    typesRequiringReadAuthorization = v5->_typesRequiringReadAuthorization;
    v5->_typesRequiringReadAuthorization = (NSSet *)v13;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForSetOf:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("_TypesRequiringShareAuthorization"));
    v16 = objc_claimAutoreleasedReturnValue();
    typesRequiringShareAuthorization = v5->_typesRequiringShareAuthorization;
    v5->_typesRequiringShareAuthorization = (NSSet *)v16;

    v5->_dismissWhenBackgrounded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_ShouldDismissWhenBackgrounded"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("_Type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_readUsageDescription, CFSTR("_ReadUsageDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shareUsageDescription, CFSTR("_ShareUsageDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_researchStudyUsageDescription, CFSTR("_ResearchStudyUsageDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_typesRequiringReadAuthorization, CFSTR("_TypesRequiringReadAuthorization"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_typesRequiringShareAuthorization, CFSTR("_TypesRequiringShareAuthorization"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_dismissWhenBackgrounded, CFSTR("_ShouldDismissWhenBackgrounded"));

}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)readUsageDescription
{
  return self->_readUsageDescription;
}

- (void)setReadUsageDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)shareUsageDescription
{
  return self->_shareUsageDescription;
}

- (void)setShareUsageDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)researchStudyUsageDescription
{
  return self->_researchStudyUsageDescription;
}

- (void)setResearchStudyUsageDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)typesRequiringReadAuthorization
{
  return self->_typesRequiringReadAuthorization;
}

- (void)setTypesRequiringReadAuthorization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSSet)typesRequiringShareAuthorization
{
  return self->_typesRequiringShareAuthorization;
}

- (void)setTypesRequiringShareAuthorization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)shouldDismissWhenBackgrounded
{
  return self->_dismissWhenBackgrounded;
}

- (void)setDismissWhenBackgrounded:(BOOL)a3
{
  self->_dismissWhenBackgrounded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typesRequiringShareAuthorization, 0);
  objc_storeStrong((id *)&self->_typesRequiringReadAuthorization, 0);
  objc_storeStrong((id *)&self->_researchStudyUsageDescription, 0);
  objc_storeStrong((id *)&self->_shareUsageDescription, 0);
  objc_storeStrong((id *)&self->_readUsageDescription, 0);
}

@end
