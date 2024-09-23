@implementation _BKSCombinedTouchDeliveryPolicy

- (id)matchSharingTouchesPolicy:(id)a3 orCancelTouchesPolicy:(id)a4 orCombinedPolicy:(id)a5
{
  return (id)(*((uint64_t (**)(id, NSArray *))a5 + 2))(a5, self->_policies);
}

- (_BKSCombinedTouchDeliveryPolicy)initWithPolicies:(id)a3
{
  id v5;
  _BKSCombinedTouchDeliveryPolicy *v6;
  _BKSCombinedTouchDeliveryPolicy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_BKSCombinedTouchDeliveryPolicy;
  v6 = -[_BKSCombinedTouchDeliveryPolicy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_policies, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
}

- (_BKSCombinedTouchDeliveryPolicy)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BKSCombinedTouchDeliveryPolicy *v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("<%@: %p> may only be decoded by an NSXPCCoder."), objc_opt_class(), self);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("BKSTouchDeliveryPolicy"), "stringByAppendingString:", CFSTR("Policies"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_BKSCombinedTouchDeliveryPolicy initWithPolicies:](self, "initWithPolicies:", v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("<%@: %p> may only be encoded by an NSXPCCoder."), objc_opt_class(), self);
  -[_BKSCombinedTouchDeliveryPolicy policies](self, "policies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("BKSTouchDeliveryPolicy"), "stringByAppendingString:", CFSTR("Policies"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, v5);

}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BKSCombinedTouchDeliveryPolicy policies](self, "policies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  v6 = objc_msgSend(v3, "hash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _BKSCombinedTouchDeliveryPolicy *v4;
  _BKSCombinedTouchDeliveryPolicy *v5;
  BOOL v6;

  v4 = (_BKSCombinedTouchDeliveryPolicy *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[NSArray isEqualToArray:](self->_policies, "isEqualToArray:", v5->_policies);

  return v6;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[_BKSCombinedTouchDeliveryPolicy policies](self, "policies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "appendObject:withName:", v4, CFSTR("combination"));

}

- (id)assertionEndpoint
{
  return 0;
}

- (void)setAssertionEndpoint:(id)a3
{
  -[NSArray makeObjectsPerformSelector:withObject:](self->_policies, "makeObjectsPerformSelector:withObject:", sel_setAssertionEndpoint_, a3);
}

- (NSArray)policies
{
  return self->_policies;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
