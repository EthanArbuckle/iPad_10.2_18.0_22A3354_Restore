@implementation FCPersonalizationFavorabilityScores

void __68__FCPersonalizationFavorabilityScores_initWithPBFavorabilityScores___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  objc_msgSend(v4, "score");
  objc_msgSend(v3, "numberWithFloat:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tagId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "fc_safelySetObject:forKey:", v6, v5);
}

void __68__FCPersonalizationFavorabilityScores_initWithPBFavorabilityScores___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "scores");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__FCPersonalizationFavorabilityScores_initWithPBFavorabilityScores___block_invoke_2;
  v6[3] = &unk_1E463EAC8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

- (FCPersonalizationFavorabilityScores)initWithPBFavorabilityScores:(id)a3
{
  id v5;
  FCPersonalizationFavorabilityScores *v6;
  FCPersonalizationFavorabilityScores *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *tagIDToScores;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCPersonalizationFavorabilityScores;
  v6 = -[FCPersonalizationFavorabilityScores init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pbFavorabilityScores, a3);
    v8 = (void *)MEMORY[0x1E0C99D80];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__FCPersonalizationFavorabilityScores_initWithPBFavorabilityScores___block_invoke;
    v12[3] = &unk_1E463AA78;
    v13 = v5;
    objc_msgSend(v8, "fc_dictionary:", v12);
    v9 = objc_claimAutoreleasedReturnValue();
    tagIDToScores = v7->_tagIDToScores;
    v7->_tagIDToScores = (NSDictionary *)v9;

  }
  return v7;
}

- (FCPersonalizationFavorabilityScores)init
{
  return -[FCPersonalizationFavorabilityScores initWithPBFavorabilityScores:](self, "initWithPBFavorabilityScores:", 0);
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[FCPersonalizationFavorabilityScores tagIDToScores](self, "tagIDToScores");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)scoreForTagID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[FCPersonalizationFavorabilityScores tagIDToScores](self, "tagIDToScores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FCPersonalizationFavorabilityScores tagIDToScores](self, "tagIDToScores");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationFavorabilityScores)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  FCPersonalizationFavorabilityScores *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("favorabilityScores"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[FCPersonalizationFavorabilityScores initWithPBFavorabilityScores:](self, "initWithPBFavorabilityScores:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NTPBPublisherFavorabilityScores *pbFavorabilityScores;

  pbFavorabilityScores = self->_pbFavorabilityScores;
  if (pbFavorabilityScores)
    objc_msgSend(a3, "encodeObject:forKey:", pbFavorabilityScores, CFSTR("favorabilityScores"));
}

- (NSDictionary)tagIDToScores
{
  return self->_tagIDToScores;
}

- (void)setTagIDToScores:(id)a3
{
  objc_storeStrong((id *)&self->_tagIDToScores, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagIDToScores, 0);
  objc_storeStrong((id *)&self->_pbFavorabilityScores, 0);
}

@end
