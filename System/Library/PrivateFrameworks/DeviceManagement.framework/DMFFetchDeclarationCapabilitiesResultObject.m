@implementation DMFFetchDeclarationCapabilitiesResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchDeclarationCapabilitiesResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFFetchDeclarationCapabilitiesResultObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *supportedCommands;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *supportedAssets;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *supportedConfigurations;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *supportedEvents;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *supportedActivations;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSArray *supportedPredicates;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSArray *supportedMessages;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)DMFFetchDeclarationCapabilitiesResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v42, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("supportedCommands"));
    v9 = objc_claimAutoreleasedReturnValue();
    supportedCommands = v5->_supportedCommands;
    v5->_supportedCommands = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("supportedAssets"));
    v14 = objc_claimAutoreleasedReturnValue();
    supportedAssets = v5->_supportedAssets;
    v5->_supportedAssets = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("supportedConfigurations"));
    v19 = objc_claimAutoreleasedReturnValue();
    supportedConfigurations = v5->_supportedConfigurations;
    v5->_supportedConfigurations = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("supportedEvents"));
    v24 = objc_claimAutoreleasedReturnValue();
    supportedEvents = v5->_supportedEvents;
    v5->_supportedEvents = (NSArray *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("supportedActivations"));
    v29 = objc_claimAutoreleasedReturnValue();
    supportedActivations = v5->_supportedActivations;
    v5->_supportedActivations = (NSArray *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("supportedPredicates"));
    v34 = objc_claimAutoreleasedReturnValue();
    supportedPredicates = v5->_supportedPredicates;
    v5->_supportedPredicates = (NSArray *)v34;

    v36 = (void *)MEMORY[0x1E0C99E60];
    v37 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("supportedMessages"));
    v39 = objc_claimAutoreleasedReturnValue();
    supportedMessages = v5->_supportedMessages;
    v5->_supportedMessages = (NSArray *)v39;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DMFFetchDeclarationCapabilitiesResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  -[DMFFetchDeclarationCapabilitiesResultObject supportedCommands](self, "supportedCommands", v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("supportedCommands"));

  -[DMFFetchDeclarationCapabilitiesResultObject supportedAssets](self, "supportedAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("supportedAssets"));

  -[DMFFetchDeclarationCapabilitiesResultObject supportedConfigurations](self, "supportedConfigurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("supportedConfigurations"));

  -[DMFFetchDeclarationCapabilitiesResultObject supportedEvents](self, "supportedEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("supportedEvents"));

  -[DMFFetchDeclarationCapabilitiesResultObject supportedActivations](self, "supportedActivations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("supportedActivations"));

  -[DMFFetchDeclarationCapabilitiesResultObject supportedPredicates](self, "supportedPredicates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("supportedPredicates"));

  -[DMFFetchDeclarationCapabilitiesResultObject supportedMessages](self, "supportedMessages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("supportedMessages"));

}

- (NSArray)supportedCommands
{
  return self->_supportedCommands;
}

- (void)setSupportedCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)supportedAssets
{
  return self->_supportedAssets;
}

- (void)setSupportedAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)supportedConfigurations
{
  return self->_supportedConfigurations;
}

- (void)setSupportedConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)supportedEvents
{
  return self->_supportedEvents;
}

- (void)setSupportedEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)supportedActivations
{
  return self->_supportedActivations;
}

- (void)setSupportedActivations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)supportedPredicates
{
  return self->_supportedPredicates;
}

- (void)setSupportedPredicates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)supportedMessages
{
  return self->_supportedMessages;
}

- (void)setSupportedMessages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedMessages, 0);
  objc_storeStrong((id *)&self->_supportedPredicates, 0);
  objc_storeStrong((id *)&self->_supportedActivations, 0);
  objc_storeStrong((id *)&self->_supportedEvents, 0);
  objc_storeStrong((id *)&self->_supportedConfigurations, 0);
  objc_storeStrong((id *)&self->_supportedAssets, 0);
  objc_storeStrong((id *)&self->_supportedCommands, 0);
}

@end
