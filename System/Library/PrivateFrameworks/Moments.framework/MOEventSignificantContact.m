@implementation MOEventSignificantContact

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *interactionContactScore;
  id v5;

  interactionContactScore = self->_interactionContactScore;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", interactionContactScore, CFSTR("interactionContactScore"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactionScoredContact, CFSTR("interactionScoredContact"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactionGroupName, CFSTR("interactionGroupName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactionContacts, CFSTR("interactionContacts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactionMechanisms, CFSTR("interactionMechanisms"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactions, CFSTR("interactions"));

}

- (MOEventSignificantContact)initWithCoder:(id)a3
{
  id v4;
  MOEventSignificantContact *v5;
  uint64_t v6;
  NSNumber *interactionContactScore;
  uint64_t v8;
  PPScoredContact *interactionScoredContact;
  uint64_t v10;
  NSString *interactionGroupName;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *interactionContacts;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSSet *interactionMechanisms;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *interactions;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MOEventSignificantContact;
  v5 = -[MOEventSignificantContact init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interactionContactScore"));
    v6 = objc_claimAutoreleasedReturnValue();
    interactionContactScore = v5->_interactionContactScore;
    v5->_interactionContactScore = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interactionScoredContact"));
    v8 = objc_claimAutoreleasedReturnValue();
    interactionScoredContact = v5->_interactionScoredContact;
    v5->_interactionScoredContact = (PPScoredContact *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interactionGroupName"));
    v10 = objc_claimAutoreleasedReturnValue();
    interactionGroupName = v5->_interactionGroupName;
    v5->_interactionGroupName = (NSString *)v10;

    v12 = (void *)MEMORY[0x1D1798EEC]();
    v13 = objc_alloc(MEMORY[0x1E0C99E60]);
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = (void *)objc_msgSend(v13, "initWithObjects:", v14, v15, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("interactionContacts"));
    v17 = objc_claimAutoreleasedReturnValue();
    interactionContacts = v5->_interactionContacts;
    v5->_interactionContacts = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1D1798EEC]();
    v20 = objc_alloc(MEMORY[0x1E0C99E60]);
    v21 = objc_opt_class();
    v22 = (void *)objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v19);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("interactionMechanisms"));
    v23 = objc_claimAutoreleasedReturnValue();
    interactionMechanisms = v5->_interactionMechanisms;
    v5->_interactionMechanisms = (NSSet *)v23;

    v25 = (void *)MEMORY[0x1D1798EEC]();
    v26 = objc_alloc(MEMORY[0x1E0C99E60]);
    v27 = objc_opt_class();
    v28 = (void *)objc_msgSend(v26, "initWithObjects:", v27, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v25);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("interactions"));
    v29 = objc_claimAutoreleasedReturnValue();
    interactions = v5->_interactions;
    v5->_interactions = (NSArray *)v29;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventSignificantContact *v4;

  v4 = objc_alloc_init(MOEventSignificantContact);
  objc_storeStrong((id *)&v4->_interactions, self->_interactions);
  objc_storeStrong((id *)&v4->_interactionContacts, self->_interactionContacts);
  objc_storeStrong((id *)&v4->_interactionMechanisms, self->_interactionMechanisms);
  objc_storeStrong((id *)&v4->_interactionGroupName, self->_interactionGroupName);
  objc_storeStrong((id *)&v4->_interactionContactScore, self->_interactionContactScore);
  objc_storeStrong((id *)&v4->_interactionScoredContact, self->_interactionScoredContact);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPScoredContact contact](self->_interactionScoredContact, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString mask](self->_interactionGroupName, "mask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("interactionScoredContact identifier, %@, interactionGroupName, %@, interactionContact count, %lu, interaction count, %lu, interactionMechanisms, %@"), v5, v6, -[NSArray count](self->_interactionContacts, "count"), -[NSArray count](self->_interactions, "count"), self->_interactionMechanisms);

  return v7;
}

- (NSNumber)interactionContactScore
{
  return self->_interactionContactScore;
}

- (void)setInteractionContactScore:(id)a3
{
  objc_storeStrong((id *)&self->_interactionContactScore, a3);
}

- (PPScoredContact)interactionScoredContact
{
  return self->_interactionScoredContact;
}

- (void)setInteractionScoredContact:(id)a3
{
  objc_storeStrong((id *)&self->_interactionScoredContact, a3);
}

- (NSString)interactionGroupName
{
  return self->_interactionGroupName;
}

- (void)setInteractionGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_interactionGroupName, a3);
}

- (NSArray)interactionContacts
{
  return self->_interactionContacts;
}

- (void)setInteractionContacts:(id)a3
{
  objc_storeStrong((id *)&self->_interactionContacts, a3);
}

- (NSDictionary)contactClassificationMap
{
  return self->_contactClassificationMap;
}

- (void)setContactClassificationMap:(id)a3
{
  objc_storeStrong((id *)&self->_contactClassificationMap, a3);
}

- (NSSet)interactionMechanisms
{
  return self->_interactionMechanisms;
}

- (void)setInteractionMechanisms:(id)a3
{
  objc_storeStrong((id *)&self->_interactionMechanisms, a3);
}

- (NSArray)interactions
{
  return self->_interactions;
}

- (void)setInteractions:(id)a3
{
  objc_storeStrong((id *)&self->_interactions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_interactionMechanisms, 0);
  objc_storeStrong((id *)&self->_contactClassificationMap, 0);
  objc_storeStrong((id *)&self->_interactionContacts, 0);
  objc_storeStrong((id *)&self->_interactionGroupName, 0);
  objc_storeStrong((id *)&self->_interactionScoredContact, 0);
  objc_storeStrong((id *)&self->_interactionContactScore, 0);
}

@end
