@implementation HKUserDomainConceptQueryResult

- (HKUserDomainConceptQueryResult)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKUserDomainConceptQueryResult)initWithUserConcept:(id)a3 rawAnchor:(int64_t)a4
{
  id v6;
  HKUserDomainConceptQueryResult *v7;
  uint64_t v8;
  HKUserDomainConcept *userConcept;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKUserDomainConceptQueryResult;
  v7 = -[HKUserDomainConceptQueryResult init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    userConcept = v7->_userConcept;
    v7->_userConcept = (HKUserDomainConcept *)v8;

    v7->_rawAnchor = a4;
  }

  return v7;
}

- (HKQueryAnchor)anchor
{
  return (HKQueryAnchor *)+[HKQueryAnchor _anchorWithRowid:](HKQueryAnchor, "_anchorWithRowid:", self->_rawAnchor);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKUserDomainConceptQueryResult)initWithCoder:(id)a3
{
  id v4;
  HKUserDomainConceptQueryResult *v5;
  uint64_t v6;
  HKUserDomainConcept *userConcept;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKUserDomainConceptQueryResult;
  v5 = -[HKUserDomainConceptQueryResult init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userConcept"));
    v6 = objc_claimAutoreleasedReturnValue();
    userConcept = v5->_userConcept;
    v5->_userConcept = (HKUserDomainConcept *)v6;

    v5->_rawAnchor = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("anchor"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  HKUserDomainConcept *userConcept;
  id v5;

  userConcept = self->_userConcept;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", userConcept, CFSTR("userConcept"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_rawAnchor, CFSTR("anchor"));

}

- (HKUserDomainConcept)userConcept
{
  return self->_userConcept;
}

- (int64_t)rawAnchor
{
  return self->_rawAnchor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userConcept, 0);
}

@end
