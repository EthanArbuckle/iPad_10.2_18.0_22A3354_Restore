@implementation MOEventPortrait

+ (void)defineClassCollections
{
  if (defineClassCollections_onceToken_0 != -1)
    dispatch_once(&defineClassCollections_onceToken_0, &__block_literal_global_9);
}

void __41__MOEventPortrait_defineClassCollections__block_invoke()
{
  void *v0;

  v0 = (void *)kTopicIdNames;
  kTopicIdNames = (uint64_t)&unk_1E855E008;

}

- (MOEventPortrait)init
{
  MOEventPortrait *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MOEventPortrait;
  v2 = -[MOEventPortrait init](&v4, sel_init);
  if (v2)
    +[MOEventPortrait defineClassCollections](MOEventPortrait, "defineClassCollections");
  return v2;
}

+ (id)displayNameOfScoredTopics:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__MOEventPortrait_displayNameOfScoredTopics___block_invoke;
  v7[3] = &unk_1E8543970;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __45__MOEventPortrait_displayNameOfScoredTopics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v5 = (void *)kTopicIdNames;
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend((id)kTopicIdNames, "objectForKeyedSubscript:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v6);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *scoredTopics;
  id v4;
  id v5;

  scoredTopics = self->_scoredTopics;
  v4 = a3;
  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", scoredTopics);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("scoredTopics"));

}

- (MOEventPortrait)initWithCoder:(id)a3
{
  id v4;
  MOEventPortrait *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *scoredTopics;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MOEventPortrait;
  v5 = -[MOEventPortrait init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scoredTopics"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    scoredTopics = v5->_scoredTopics;
    v5->_scoredTopics = (NSDictionary *)v7;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventPortrait *v4;

  v4 = objc_alloc_init(MOEventPortrait);
  objc_storeStrong((id *)&v4->_scoredTopics, self->_scoredTopics);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[MOEventPortrait displayNameOfScoredTopics:](MOEventPortrait, "displayNameOfScoredTopics:", self->_scoredTopics);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("scoredTopics, %@"), v4);

  return v5;
}

- (NSDictionary)scoredTopics
{
  return self->_scoredTopics;
}

- (void)setScoredTopics:(id)a3
{
  objc_storeStrong((id *)&self->_scoredTopics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoredTopics, 0);
}

@end
