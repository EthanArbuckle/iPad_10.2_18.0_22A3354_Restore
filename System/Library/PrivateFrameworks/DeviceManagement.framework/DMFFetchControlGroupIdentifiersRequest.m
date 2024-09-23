@implementation DMFFetchControlGroupIdentifiersRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchControlGroupIdentifiersRequest)initWithCoder:(id)a3
{
  id v4;
  DMFFetchControlGroupIdentifiersRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *leaderIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFFetchControlGroupIdentifiersRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("includeTemporary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_includeTemporary = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("leaderIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    leaderIdentifier = v5->_leaderIdentifier;
    v5->_leaderIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMFFetchControlGroupIdentifiersRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFFetchControlGroupIdentifiersRequest includeTemporary](self, "includeTemporary", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("includeTemporary"));

  -[DMFFetchControlGroupIdentifiersRequest leaderIdentifier](self, "leaderIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("leaderIdentifier"));

}

- (NSString)leaderIdentifier
{
  return self->_leaderIdentifier;
}

- (void)setLeaderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)includeTemporary
{
  return self->_includeTemporary;
}

- (void)setIncludeTemporary:(BOOL)a3
{
  self->_includeTemporary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderIdentifier, 0);
}

@end
