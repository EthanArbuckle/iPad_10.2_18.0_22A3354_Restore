@implementation SGMIWarningsDetectionRegexes

- (SGMIWarningsDetectionRegexes)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  SGMIWarningsDetectionRegexes *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[SGMIWarningsDetectionRegexes initWithDictionary:compiledRegexCache:](self, "initWithDictionary:compiledRegexCache:", v4, v5);

  return v6;
}

- (SGMIWarningsDetectionRegexes)initWithDictionary:(id)a3 compiledRegexCache:(id)a4
{
  id v6;
  id v7;
  SGMIWarningsDetectionRegexes *v8;
  void *v9;
  SGMIWarningsDetectionRegex *v10;
  void *v11;
  uint64_t v12;
  SGMIWarningsDetectionRegex *subject;
  void *v14;
  SGMIWarningsDetectionRegex *v15;
  void *v16;
  uint64_t v17;
  SGMIWarningsDetectionRegex *body;
  void *v19;
  uint64_t v20;
  NSDictionary *dataDetectorMappedAdditions;
  void *v22;
  uint64_t v23;
  NSDictionary *dataDetectorAdditions;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SGMIWarningsDetectionRegexes;
  v8 = -[SGMIWarningsDetectionRegexes init](&v26, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = [SGMIWarningsDetectionRegex alloc];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subject"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SGMIWarningsDetectionRegex initWithPattern:compiledRegexCache:](v10, "initWithPattern:compiledRegexCache:", v11, v7);
      subject = v8->_subject;
      v8->_subject = (SGMIWarningsDetectionRegex *)v12;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("body"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [SGMIWarningsDetectionRegex alloc];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("body"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SGMIWarningsDetectionRegex initWithPattern:compiledRegexCache:](v15, "initWithPattern:compiledRegexCache:", v16, v7);
      body = v8->_body;
      v8->_body = (SGMIWarningsDetectionRegex *)v17;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dataDetectorMappedAdditions"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGMIWarningsDetectionRegexes _loadDataDetectorAdditionDict:compiledRegexCache:](SGMIWarningsDetectionRegexes, "_loadDataDetectorAdditionDict:compiledRegexCache:", v19, v7);
    v20 = objc_claimAutoreleasedReturnValue();
    dataDetectorMappedAdditions = v8->_dataDetectorMappedAdditions;
    v8->_dataDetectorMappedAdditions = (NSDictionary *)v20;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dataDetectorAdditions"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGMIWarningsDetectionRegexes _loadDataDetectorAdditionDict:compiledRegexCache:](SGMIWarningsDetectionRegexes, "_loadDataDetectorAdditionDict:compiledRegexCache:", v22, v7);
    v23 = objc_claimAutoreleasedReturnValue();
    dataDetectorAdditions = v8->_dataDetectorAdditions;
    v8->_dataDetectorAdditions = (NSDictionary *)v23;

  }
  return v8;
}

- (id)description
{
  void *v2;
  void *v3;
  id v5;
  SGMIWarningsDetectionRegex *subject;
  SGMIWarningsDetectionRegex *body;
  NSDictionary *dataDetectorMappedAdditions;
  __CFString *v9;
  NSDictionary *dataDetectorAdditions;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_subject)
    subject = self->_subject;
  else
    subject = (SGMIWarningsDetectionRegex *)CFSTR("(null)");
  if (self->_body)
    body = self->_body;
  else
    body = (SGMIWarningsDetectionRegex *)CFSTR("(null)");
  dataDetectorMappedAdditions = self->_dataDetectorMappedAdditions;
  if (dataDetectorMappedAdditions)
  {
    -[NSDictionary allKeys](self->_dataDetectorMappedAdditions, "allKeys");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_29445);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("(null)");
  }
  dataDetectorAdditions = self->_dataDetectorAdditions;
  if (!dataDetectorAdditions)
  {
    v14 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("<SGMIWarningsDetectionRegexes>\n  subject:%@\n  body:%@\n  dataDetectorMappedAdditions:'%@'\n  dataDetectorAdditions:'%@'\n"), subject, body, v9, CFSTR("(null)"));
    if (!dataDetectorMappedAdditions)
      return v14;
    goto LABEL_12;
  }
  -[NSDictionary allKeys](dataDetectorAdditions, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_33_29448);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(","));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("<SGMIWarningsDetectionRegexes>\n  subject:%@\n  body:%@\n  dataDetectorMappedAdditions:'%@'\n  dataDetectorAdditions:'%@'\n"), subject, body, v9, v13);

  if (dataDetectorMappedAdditions)
  {
LABEL_12:

  }
  return v14;
}

- (SGMIWarningsDetectionRegex)subject
{
  return self->_subject;
}

- (SGMIWarningsDetectionRegex)body
{
  return self->_body;
}

- (NSDictionary)dataDetectorMappedAdditions
{
  return self->_dataDetectorMappedAdditions;
}

- (NSDictionary)dataDetectorAdditions
{
  return self->_dataDetectorAdditions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDetectorAdditions, 0);
  objc_storeStrong((id *)&self->_dataDetectorMappedAdditions, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subject, 0);
}

uint64_t __43__SGMIWarningsDetectionRegexes_description__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pattern");
}

uint64_t __43__SGMIWarningsDetectionRegexes_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pattern");
}

+ (id)_loadDataDetectorAdditionDict:(id)a3 compiledRegexCache:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__SGMIWarningsDetectionRegexes__loadDataDetectorAdditionDict_compiledRegexCache___block_invoke;
  v13[3] = &unk_1E7DB6018;
  v14 = v5;
  v8 = v7;
  v15 = v8;
  v9 = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);

  v10 = v15;
  v11 = v8;

  return v11;
}

void __81__SGMIWarningsDetectionRegexes__loadDataDetectorAdditionDict_compiledRegexCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(CFSTR("dataDetectorAddition-"), "stringByAppendingString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = 0;
LABEL_4:
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v9);

    goto LABEL_5;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB38E8]);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("\\b%@\\b"), v5);
  v13 = 0;
  v9 = (void *)objc_msgSend(v11, "initWithPattern:options:error:", v12, 1, &v13);
  v10 = v13;

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);
  if (v9)
    goto LABEL_4;
LABEL_5:

}

@end
