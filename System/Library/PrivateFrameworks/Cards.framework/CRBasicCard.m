@implementation CRBasicCard

- (void)loadCardWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, CRBasicCard *))a3 + 2))(a3, self);
}

- (BOOL)asynchronous
{
  return 0;
}

- (CRBasicCard)init
{
  CRBasicCard *v2;
  void *v3;
  uint64_t v4;
  NSString *cardIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRBasicCard;
  v2 = -[CRBasicCard init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    cardIdentifier = v2->_cardIdentifier;
    v2->_cardIdentifier = (NSString *)v4;

  }
  return v2;
}

- (CRBasicCard)initWithCoder:(id)a3
{
  id v4;
  CRBasicCard *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *cardSections;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSSet *interactions;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CRBasicCard;
  v5 = -[CRBasicCard init](&v19, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_cardSections);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    cardSections = v5->_cardSections;
    v5->_cardSections = (NSArray *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_interactions);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    interactions = v5->_interactions;
    v5->_interactions = (NSSet *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *cardSections;
  id v5;
  void *v6;
  NSSet *interactions;
  id v8;

  cardSections = self->_cardSections;
  v5 = a3;
  NSStringFromSelector(sel_cardSections);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", cardSections, v6);

  interactions = self->_interactions;
  NSStringFromSelector(sel_interactions);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", interactions, v8);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRBasicCard *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(CRBasicCard);
  -[CRBasicCard cardSections](self, "cardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_deepCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRBasicCard setCardSections:](v4, "setCardSections:", v6);

  -[CRBasicCard interactions](self, "interactions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_deepCopy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRBasicCard setInteractions:](v4, "setInteractions:", v8);

  return v4;
}

- (NSString)cardIdentifier
{
  return self->_cardIdentifier;
}

- (unint64_t)cardFormat
{
  return self->cardFormat;
}

- (NSArray)cardSections
{
  return self->_cardSections;
}

- (void)setCardSections:(id)a3
{
  objc_storeStrong((id *)&self->_cardSections, a3);
}

- (NSSet)interactions
{
  return self->_interactions;
}

- (void)setInteractions:(id)a3
{
  objc_storeStrong((id *)&self->_interactions, a3);
}

- (NSArray)dismissalCommands
{
  return self->_dismissalCommands;
}

- (void)setDismissalCommands:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalCommands, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalCommands, 0);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_cardSections, 0);
  objc_storeStrong((id *)&self->_cardIdentifier, 0);
}

@end
