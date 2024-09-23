@implementation INGetIntentParameterDefaultValueForwardingActionResponse

- (INGetIntentParameterDefaultValueForwardingActionResponse)initWithArchivedDefaultValue:(id)a3 error:(id)a4
{
  id v7;
  INGetIntentParameterDefaultValueForwardingActionResponse *v8;
  INGetIntentParameterDefaultValueForwardingActionResponse *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INGetIntentParameterDefaultValueForwardingActionResponse;
  v8 = -[INIntentForwardingActionResponse initWithError:](&v11, sel_initWithError_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_archivedDefaultValue, a3);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetIntentParameterDefaultValueForwardingActionResponse;
  v4 = a3;
  -[INIntentForwardingActionResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_archivedDefaultValue, CFSTR("archivedDefaultValue"), v5.receiver, v5.super_class);

}

- (INGetIntentParameterDefaultValueForwardingActionResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  INGetIntentParameterDefaultValueForwardingActionResponse *v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("archivedDefaultValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("error"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[INGetIntentParameterDefaultValueForwardingActionResponse initWithArchivedDefaultValue:error:](self, "initWithArchivedDefaultValue:error:", v5, v14);
  return v15;
}

- (NSData)archivedDefaultValue
{
  return self->_archivedDefaultValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivedDefaultValue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
