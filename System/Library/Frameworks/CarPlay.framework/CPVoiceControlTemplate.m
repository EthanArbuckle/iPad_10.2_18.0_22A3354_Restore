@implementation CPVoiceControlTemplate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPVoiceControlTemplate)initWithVoiceControlStates:(NSArray *)voiceControlStates
{
  NSArray *v4;
  CPVoiceControlTemplate *v5;
  void *v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *v9;
  void *v10;
  uint64_t v11;
  NSString *activeStateIdentifier;
  objc_super v14;

  v4 = voiceControlStates;
  v14.receiver = self;
  v14.super_class = (Class)CPVoiceControlTemplate;
  v5 = -[CPTemplate init](&v14, sel_init);
  if (v5)
  {
    if (-[NSArray count](v4, "count") < 6)
    {
      v9 = v4;
      v6 = v5->_voiceControlStates;
      v5->_voiceControlStates = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, 5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectsAtIndexes:](v4, "objectsAtIndexes:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v5->_voiceControlStates;
      v5->_voiceControlStates = (NSArray *)v7;

    }
    -[NSArray firstObject](v4, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();
    activeStateIdentifier = v5->_activeStateIdentifier;
    v5->_activeStateIdentifier = (NSString *)v11;

  }
  return v5;
}

- (CPVoiceControlTemplate)initWithCoder:(id)a3
{
  id v4;
  CPVoiceControlTemplate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *voiceControlStates;
  uint64_t v11;
  NSArray *v12;
  NSArray *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *activeStateIdentifier;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CPVoiceControlTemplate;
  v5 = -[CPTemplate initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kCPVoiceControlStatesKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v9, "count") < 6)
    {
      v13 = v9;
      voiceControlStates = v5->_voiceControlStates;
      v5->_voiceControlStates = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, 5);
      voiceControlStates = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectsAtIndexes:", voiceControlStates);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v5->_voiceControlStates;
      v5->_voiceControlStates = (NSArray *)v11;

    }
    -[CPVoiceControlTemplate voiceControlStates](v5, "voiceControlStates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = objc_claimAutoreleasedReturnValue();
    activeStateIdentifier = v5->_activeStateIdentifier;
    v5->_activeStateIdentifier = (NSString *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPVoiceControlTemplate;
  v4 = a3;
  -[CPTemplate encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CPVoiceControlTemplate voiceControlStates](self, "voiceControlStates", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPVoiceControlStatesKey"));

}

- (void)activateVoiceControlStateWithIdentifier:(NSString *)identifier
{
  NSString *v5;
  void *v6;
  NSString *v7;
  id v8;
  _QWORD v9[4];
  NSString *v10;

  v5 = identifier;
  objc_storeStrong((id *)&self->_activeStateIdentifier, identifier);
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__CPVoiceControlTemplate_activateVoiceControlStateWithIdentifier___block_invoke;
  v9[3] = &unk_24C77D3A0;
  v10 = v5;
  v7 = v5;
  v8 = (id)objc_msgSend(v6, "addSuccessBlock:", v9);

}

uint64_t __66__CPVoiceControlTemplate_activateVoiceControlStateWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_activateStateWithIdentifier:", *(_QWORD *)(a1 + 32));
}

- (id)leadingNavigationBarButtons
{
  -[CPVoiceControlTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setLeadingNavigationBarButtons:(id)a3
{
  -[CPVoiceControlTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)trailingNavigationBarButtons
{
  -[CPVoiceControlTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setTrailingNavigationBarButtons:(id)a3
{
  -[CPVoiceControlTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (NSArray)voiceControlStates
{
  return self->_voiceControlStates;
}

- (NSString)activeStateIdentifier
{
  return self->_activeStateIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeStateIdentifier, 0);
  objc_storeStrong((id *)&self->_voiceControlStates, 0);
}

@end
