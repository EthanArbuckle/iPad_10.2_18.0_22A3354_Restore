@implementation CRBasicCardSection

- (CRBasicCardSection)init
{
  CRBasicCardSection *v2;
  void *v3;
  uint64_t v4;
  NSString *cardSectionIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRBasicCardSection;
  v2 = -[CRBasicCardSection init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    cardSectionIdentifier = v2->_cardSectionIdentifier;
    v2->_cardSectionIdentifier = (NSString *)v4;

  }
  return v2;
}

- (CRBasicCardSection)initWithCoder:(id)a3
{
  id v4;
  CRBasicCardSection *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  SFCardSection *backingCardSection;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *cardSectionIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRBasicCardSection;
  v5 = -[CRBasicCardSection init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_backingCardSection);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    backingCardSection = v5->_backingCardSection;
    v5->_backingCardSection = (SFCardSection *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_cardSectionIdentifier);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    cardSectionIdentifier = v5->_cardSectionIdentifier;
    v5->_cardSectionIdentifier = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  SFCardSection *backingCardSection;
  id v5;
  void *v6;
  NSString *cardSectionIdentifier;
  id v8;

  backingCardSection = self->_backingCardSection;
  v5 = a3;
  NSStringFromSelector(sel_backingCardSection);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", backingCardSection, v6);

  cardSectionIdentifier = self->_cardSectionIdentifier;
  NSStringFromSelector(sel_cardSectionIdentifier);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", cardSectionIdentifier, v8);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRBasicCardSection *v4;

  v4 = objc_alloc_init(CRBasicCardSection);
  -[CRBasicCardSection setBackingCardSection:](v4, "setBackingCardSection:", self->_backingCardSection);
  return v4;
}

+ (id)basicCardSectionWithBackingCardSection:(id)a3
{
  id v3;
  CRBasicCardSection *v4;

  v3 = a3;
  v4 = objc_alloc_init(CRBasicCardSection);
  -[CRBasicCardSection setBackingCardSection:](v4, "setBackingCardSection:", v3);

  return v4;
}

- (NSString)cardSectionIdentifier
{
  return self->_cardSectionIdentifier;
}

- (SFCardSection)backingCardSection
{
  return self->_backingCardSection;
}

- (void)setBackingCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_backingCardSection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingCardSection, 0);
  objc_storeStrong((id *)&self->_cardSectionIdentifier, 0);
}

@end
