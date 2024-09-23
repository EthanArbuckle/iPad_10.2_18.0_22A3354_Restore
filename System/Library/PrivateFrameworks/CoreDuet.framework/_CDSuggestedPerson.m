@implementation _CDSuggestedPerson

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@:%p {\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDSuggestedPerson contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("              contact: %@\n"), v4);

  -[_CDSuggestedPerson interactionBundleID](self, "interactionBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  interactionBundleID: %@\n"), v5);

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[_CDSuggestedPerson rank](self, "rank");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                 rank: %@\n"), v7);

  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  return v3;
}

- (_CDContact)contact
{
  return (_CDContact *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContact:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)interactionBundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInteractionBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (double)rank
{
  return self->_rank;
}

- (void)setRank:(double)a3
{
  self->_rank = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSArray)interactions
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInteractions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_interactionBundleID, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
