@implementation _LTTranslationSense

- (id)jsonRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationSense senseID](self, "senseID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_LTTranslationSense senseID](self, "senseID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("syn"));

  }
  -[_LTTranslationSense definition](self, "definition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_LTTranslationSense definition](self, "definition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("def"));

  }
  -[_LTTranslationSense sourceMatch](self, "sourceMatch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_LTTranslationSense sourceMatch](self, "sourceMatch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("sourceMatch"));

  }
  -[_LTTranslationSense targetMatch](self, "targetMatch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_LTTranslationSense targetMatch](self, "targetMatch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("targetMatch"));

  }
  return v3;
}

+ (id)sensesFromArray:(id)a3
{
  return (id)objc_msgSend(a3, "_ltCompactMap:", &__block_literal_global_12);
}

+ (id)senseWithPhrasebookMatchMeta:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[_LTTranslationSense senseFromDictionary:](_LTTranslationSense, "senseFromDictionary:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)senseFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _LTTranslationSense *v12;
  void *v13;
  _BOOL4 v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("syn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sense ID"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("def"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("definition"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v12 = 0;
  if (v7 && v11)
  {
    v12 = objc_alloc_init(_LTTranslationSense);
    -[_LTTranslationSense setSenseID:](v12, "setSenseID:", v7);
    -[_LTTranslationSense setDefinition:](v12, "setDefinition:", v11);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("status"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTTranslationSense setPhrasebookMatch:](v12, "setPhrasebookMatch:", objc_msgSend(v13, "isEqualToString:", CFSTR("phrasebook_exact")));

    v14 = -[_LTTranslationSense isPhrasebookMatch](v12, "isPhrasebookMatch");
    if (v14)
      v15 = CFSTR("input");
    else
      v15 = CFSTR("source match");
    if (v14)
      v16 = CFSTR("output");
    else
      v16 = CFSTR("target match");
    objc_msgSend(v3, "objectForKeyedSubscript:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTTranslationSense setSourceMatch:](v12, "setSourceMatch:", v17);

    objc_msgSend(v3, "objectForKeyedSubscript:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTTranslationSense setTargetMatch:](v12, "setTargetMatch:", v18);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("gender"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("gender"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v21);

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("formality"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("formality"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v23);

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pos"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pos"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v25);

    }
    -[_LTTranslationSense setLabels:](v12, "setLabels:", v19);

  }
  return v12;
}

- (_LTTranslationSense)initWithCoder:(id)a3
{
  id v4;
  _LTTranslationSense *v5;
  uint64_t v6;
  NSString *senseID;
  uint64_t v8;
  NSString *definition;
  uint64_t v10;
  NSString *sourceMatch;
  uint64_t v12;
  NSString *targetMatch;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _LTTranslationSense *v20;
  objc_super v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_LTTranslationSense;
  v5 = -[_LTTranslationSense init](&v22, sel_init);
  if (v5)
  {
    v5->_phrasebookMatch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pbMatch"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("syn"));
    v6 = objc_claimAutoreleasedReturnValue();
    senseID = v5->_senseID;
    v5->_senseID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("def"));
    v8 = objc_claimAutoreleasedReturnValue();
    definition = v5->_definition;
    v5->_definition = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceMatch"));
    v10 = objc_claimAutoreleasedReturnValue();
    sourceMatch = v5->_sourceMatch;
    v5->_sourceMatch = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetMatch"));
    v12 = objc_claimAutoreleasedReturnValue();
    targetMatch = v5->_targetMatch;
    v5->_targetMatch = (NSString *)v12;

    v14 = (void *)MEMORY[0x24BDBCF20];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("labels"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (void *)v17;
    else
      v19 = (void *)MEMORY[0x24BDBD1A8];
    objc_storeStrong((id *)&v5->_labels, v19);

    v20 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 phrasebookMatch;
  id v5;

  phrasebookMatch = self->_phrasebookMatch;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", phrasebookMatch, CFSTR("pbMatch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senseID, CFSTR("syn"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_definition, CFSTR("def"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceMatch, CFSTR("sourceMatch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targetMatch, CFSTR("targetMatch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_labels, CFSTR("labels"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isPhrasebookMatch
{
  return self->_phrasebookMatch;
}

- (void)setPhrasebookMatch:(BOOL)a3
{
  self->_phrasebookMatch = a3;
}

- (NSString)senseID
{
  return self->_senseID;
}

- (void)setSenseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)definition
{
  return self->_definition;
}

- (void)setDefinition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sourceMatch
{
  return self->_sourceMatch;
}

- (void)setSourceMatch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)targetMatch
{
  return self->_targetMatch;
}

- (void)setTargetMatch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_targetMatch, 0);
  objc_storeStrong((id *)&self->_sourceMatch, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_senseID, 0);
}

@end
