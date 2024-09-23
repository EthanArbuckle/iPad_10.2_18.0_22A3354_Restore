@implementation PHSearchQueryMatchDetails

- (PHSearchQueryMatchDetails)initWithQueryText:(id)a3 queryEmbedding:(id)a4 personUUIDS:(id)a5 sceneIdentifiers:(id)a6 audioIdentifiers:(id)a7 humanActionIdentifiers:(id)a8 ocrAssetUUIDS:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  PHSearchQueryMatchDetails *v23;
  uint64_t v24;
  NSAttributedString *queryText;
  uint64_t v26;
  NSArray *sceneIdentifiers;
  uint64_t v28;
  NSArray *audioIdentifiers;
  uint64_t v30;
  NSArray *humanActionIdentifiers;
  uint64_t v32;
  NSArray *personUUIDS;
  uint64_t v34;
  NSArray *ocrAssetUUIDs;
  void *v36;
  uint64_t v37;
  NSArray *ocrQueryTokens;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (v16)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryMatchDetails.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryText"));

    if (v18)
    {
LABEL_3:
      if (v19)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryMatchDetails.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUUIDS"));

  if (v19)
  {
LABEL_4:
    if (v20)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryMatchDetails.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneIdentifiers"));

  if (v20)
  {
LABEL_5:
    if (v21)
      goto LABEL_6;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryMatchDetails.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("humanActionIdentifiers"));

    if (v22)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryMatchDetails.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("audioIdentifiers"));

  if (!v21)
    goto LABEL_14;
LABEL_6:
  if (v22)
    goto LABEL_7;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryMatchDetails.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ocrAssetUUIDs"));

LABEL_7:
  v47.receiver = self;
  v47.super_class = (Class)PHSearchQueryMatchDetails;
  v23 = -[PHSearchQueryMatchDetails init](&v47, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    queryText = v23->_queryText;
    v23->_queryText = (NSAttributedString *)v24;

    objc_storeStrong((id *)&v23->_queryEmbedding, a4);
    v26 = objc_msgSend(v19, "copy");
    sceneIdentifiers = v23->_sceneIdentifiers;
    v23->_sceneIdentifiers = (NSArray *)v26;

    v28 = objc_msgSend(v20, "copy");
    audioIdentifiers = v23->_audioIdentifiers;
    v23->_audioIdentifiers = (NSArray *)v28;

    v30 = objc_msgSend(v21, "copy");
    humanActionIdentifiers = v23->_humanActionIdentifiers;
    v23->_humanActionIdentifiers = (NSArray *)v30;

    v32 = objc_msgSend(v18, "copy");
    personUUIDS = v23->_personUUIDS;
    v23->_personUUIDS = (NSArray *)v32;

    v34 = objc_msgSend(v22, "copy");
    ocrAssetUUIDs = v23->_ocrAssetUUIDs;
    v23->_ocrAssetUUIDs = (NSArray *)v34;

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 6);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHSearchUtility queryTokensFromQueryText:limitToSuggestionCategories:](PHSearchUtility, "queryTokensFromQueryText:limitToSuggestionCategories:", v16, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    ocrQueryTokens = v23->_ocrQueryTokens;
    v23->_ocrQueryTokens = (NSArray *)v37;

    +[PHSearchUtility queryTokensFromQueryText:limitToSuggestionCategories:](PHSearchUtility, "queryTokensFromQueryText:limitToSuggestionCategories:", v16, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v23->_countOfQueryTerms = objc_msgSend(v39, "count");

  }
  return v23;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@:%p\n"), v5, self);

  -[NSAttributedString string](self->_queryText, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("queryText: '%@'\n"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("queryEmbedding: %@\n"), self->_queryEmbedding);
  objc_msgSend(v3, "appendFormat:", CFSTR("sceneIdentifiers: %@\n"), self->_sceneIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("personUUIDS: %@\n"), self->_personUUIDS);
  objc_msgSend(v3, "appendFormat:", CFSTR("ocrAssetUUIDs: %@\n"), self->_ocrAssetUUIDs);
  objc_msgSend(v3, "appendFormat:", CFSTR("humanAction: %@\n"), self->_humanActionIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("audio: %@\n"), self->_audioIdentifiers);
  return v3;
}

- (id)jsonDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[7];
  _QWORD v19[8];

  v19[7] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v18[0] = CFSTR("queryText");
  -[PHSearchQueryMatchDetails queryText](self, "queryText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "string");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  v18[1] = CFSTR("queryEmbedding");
  -[PHSearchQueryMatchDetails queryEmbedding](self, "queryEmbedding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLSearchJSONForCSEmbedding();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[1] = v6;
  v18[2] = CFSTR("sceneIdentifiers");
  -[PHSearchQueryMatchDetails sceneIdentifiers](self, "sceneIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  v18[3] = CFSTR("personUUIDS");
  -[PHSearchQueryMatchDetails personUUIDS](self, "personUUIDS");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v8;
  v18[4] = CFSTR("ocrAssetUUIDs");
  -[PHSearchQueryMatchDetails ocrAssetUUIDs](self, "ocrAssetUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v9;
  v18[5] = CFSTR("humanActionIdentifiers");
  -[PHSearchQueryMatchDetails humanActionIdentifiers](self, "humanActionIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v10;
  v18[6] = CFSTR("audioIdentifiers");
  -[PHSearchQueryMatchDetails audioIdentifiers](self, "audioIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithDictionary:", v12);

  if (!v5)
  v14 = (void *)objc_msgSend(v13, "copy");

  return v14;
}

- (NSAttributedString)queryText
{
  return self->_queryText;
}

- (_CSEmbedding)queryEmbedding
{
  return self->_queryEmbedding;
}

- (NSArray)personUUIDS
{
  return self->_personUUIDS;
}

- (NSArray)sceneIdentifiers
{
  return self->_sceneIdentifiers;
}

- (NSArray)audioIdentifiers
{
  return self->_audioIdentifiers;
}

- (NSArray)humanActionIdentifiers
{
  return self->_humanActionIdentifiers;
}

- (NSArray)ocrAssetUUIDs
{
  return self->_ocrAssetUUIDs;
}

- (NSArray)ocrQueryTokens
{
  return self->_ocrQueryTokens;
}

- (unint64_t)countOfQueryTerms
{
  return self->_countOfQueryTerms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ocrQueryTokens, 0);
  objc_storeStrong((id *)&self->_ocrAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_humanActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_audioIdentifiers, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_personUUIDS, 0);
  objc_storeStrong((id *)&self->_queryEmbedding, 0);
  objc_storeStrong((id *)&self->_queryText, 0);
}

@end
