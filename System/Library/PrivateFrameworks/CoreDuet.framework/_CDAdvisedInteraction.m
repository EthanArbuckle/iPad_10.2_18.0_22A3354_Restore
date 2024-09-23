@implementation _CDAdvisedInteraction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CDAdvisedInteraction)initWithCoder:(id)a3
{
  id v4;
  _CDAdvisedInteraction *v5;
  uint64_t v6;
  _CDContact *contact;
  double v8;
  uint64_t v9;
  NSString *bundleId;
  uint64_t v11;
  NSString *account;
  uint64_t v13;
  NSMutableSet *reasons;
  _CDAdvisedInteraction *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_CDAdvisedInteraction;
  v5 = -[_CDAdvisedInteraction init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contact"));
    v6 = objc_claimAutoreleasedReturnValue();
    contact = v5->_contact;
    v5->_contact = (_CDContact *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("score"));
    v5->_score = v8;
    v5->_mechanism = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("mechanism"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
    v9 = objc_claimAutoreleasedReturnValue();
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account"));
    v11 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("reasons"));
    v13 = objc_claimAutoreleasedReturnValue();
    reasons = v5->_reasons;
    v5->_reasons = (NSMutableSet *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _CDContact *contact;
  id v5;

  contact = self->_contact;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contact, CFSTR("contact"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("score"), self->_score);
  objc_msgSend(v5, "encodeInt64:forKey:", self->_mechanism, CFSTR("mechanism"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleId, CFSTR("bundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_account, CFSTR("account"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reasons, CFSTR("reasons"));

}

- (id)descriptionOfReasons:(id)a3
{
  void *v3;
  __CFString *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (a3)
  {
    objc_msgSend(a3, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("["));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v5 = 0;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "integerValue");

        reasonToString(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("%@(%ld)"), v8, v7);

        if (v5 != objc_msgSend(v3, "count") - 1)
          -[__CFString appendString:](v4, "appendString:", CFSTR(","));
        ++v5;
      }
      while (objc_msgSend(v3, "count") > v5);
    }
    -[__CFString appendString:](v4, "appendString:", CFSTR("]"));

  }
  else
  {
    v4 = CFSTR("nil");
  }
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendString:", CFSTR("Advice { \n"));
  -[_CDAdvisedInteraction contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    contact: %@\n"), v4);

  -[_CDAdvisedInteraction score](self, "score");
  objc_msgSend(v3, "appendFormat:", CFSTR("      score: %f\n"), v5);
  mechanismToString(-[_CDAdvisedInteraction mechanism](self, "mechanism"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  mechanism: %@(%ld)\n"), v6, -[_CDAdvisedInteraction mechanism](self, "mechanism"));

  -[_CDAdvisedInteraction reasons](self, "reasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDAdvisedInteraction descriptionOfReasons:](self, "descriptionOfReasons:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    reasons: %@\n"), v8);

  -[_CDAdvisedInteraction bundleId](self, "bundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("   bundleId: %@\n"), v9);

  -[_CDAdvisedInteraction account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    account: %@\n"), v10);

  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _CDAdvisedInteraction *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_alloc_init(_CDAdvisedInteraction);
  -[_CDAdvisedInteraction contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[_CDAdvisedInteraction setContact:](v4, "setContact:", v6);

  -[_CDAdvisedInteraction score](self, "score");
  -[_CDAdvisedInteraction setScore:](v4, "setScore:");
  -[_CDAdvisedInteraction setMechanism:](v4, "setMechanism:", -[_CDAdvisedInteraction mechanism](self, "mechanism"));
  -[_CDAdvisedInteraction reasons](self, "reasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[_CDAdvisedInteraction setReasons:](v4, "setReasons:", v8);

  -[_CDAdvisedInteraction bundleId](self, "bundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDAdvisedInteraction setBundleId:](v4, "setBundleId:", v9);

  -[_CDAdvisedInteraction account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDAdvisedInteraction setAccount:](v4, "setAccount:", v10);

  return v4;
}

- (NSSet)reasons
{
  _CDAdvisedInteraction *v2;
  NSMutableSet *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_reasons;
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)setReasons:(id)a3
{
  _CDAdvisedInteraction *v4;
  uint64_t v5;
  NSMutableSet *reasons;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "mutableCopy");
  reasons = v4->_reasons;
  v4->_reasons = (NSMutableSet *)v5;

  objc_sync_exit(v4);
}

- (void)addReason:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDAdvisedInteraction addReasons:](self, "addReasons:", v5);

}

- (void)addReasons:(id)a3
{
  _CDAdvisedInteraction *v4;
  NSMutableSet *reasons;
  uint64_t v6;
  NSMutableSet *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v4 = self;
    objc_sync_enter(v4);
    reasons = v4->_reasons;
    if (reasons)
    {
      -[NSMutableSet unionSet:](reasons, "unionSet:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v8);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v4->_reasons;
      v4->_reasons = (NSMutableSet *)v6;

    }
    objc_sync_exit(v4);

  }
}

- (_CDContact)contact
{
  return (_CDContact *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContact:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)account
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int64_t)mechanism
{
  return self->_mechanism;
}

- (void)setMechanism:(int64_t)a3
{
  self->_mechanism = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (int64_t)similarOutgoingInteractionsCount
{
  return self->_similarOutgoingInteractionsCount;
}

- (void)setSimilarOutgoingInteractionsCount:(int64_t)a3
{
  self->_similarOutgoingInteractionsCount = a3;
}

- (int64_t)similarIncomingInteractionsCount
{
  return self->_similarIncomingInteractionsCount;
}

- (void)setSimilarIncomingInteractionsCount:(int64_t)a3
{
  self->_similarIncomingInteractionsCount = a3;
}

- (int64_t)similarBidirectionalInteractionsCount
{
  return self->_similarBidirectionalInteractionsCount;
}

- (void)setSimilarBidirectionalInteractionsCount:(int64_t)a3
{
  self->_similarBidirectionalInteractionsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_reasons, 0);
}

@end
