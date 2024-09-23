@implementation SGMatchedDetails

- (SGMatchedDetails)initWithContact:(id)a3 matchinfoData:(id)a4 tokens:(id)a5
{
  id v8;
  id v9;
  id v10;
  SGMatchedDetails *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SGMatchedDetails;
  v11 = -[SGMatchedDetails init](&v23, sel_init);
  if (v11)
  {
    v12 = (void *)objc_opt_new();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          -[SGMatchedDetails _processRawData:tokens:contact:tokenDetailMap:](v11, "_processRawData:tokens:contact:tokenDetailMap:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17++), v10, v8, v12, (_QWORD)v19);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v15);
    }

    -[SGMatchedDetails _initilizeDictionariesFromTokenDetailMap:](v11, "_initilizeDictionariesFromTokenDetailMap:", v12);
  }

  return v11;
}

- (void)_initilizeDictionariesFromTokenDetailMap:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *detailTokenMap;
  NSDictionary *v8;
  NSDictionary *tokenDetailMap;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__SGMatchedDetails__initilizeDictionariesFromTokenDetailMap___block_invoke;
  v11[3] = &unk_1E47619B8;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v11);
  v6 = (NSDictionary *)objc_msgSend(v10, "copy");
  detailTokenMap = self->_detailTokenMap;
  self->_detailTokenMap = v6;

  v8 = (NSDictionary *)objc_msgSend(v4, "copy");
  tokenDetailMap = self->_tokenDetailMap;
  self->_tokenDetailMap = v8;

}

- (id)matchedDetailsForToken:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_tokenDetailMap, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tokensForDetail:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_detailTokenMap, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_addToTokenDetailMap:(id)a3 token:(id)a4 detail:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (a5)
  {
    v8 = a5;
    objc_msgSend(v12, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v7);

    }
    objc_msgSend(v12, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v8);

  }
}

- (void)_processRawData:(id)a3 tokens:(id)a4 contact:(id)a5 tokenDetailMap:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  SGMatchedDetailsReader *v15;
  void *v16;
  SGMatchedDetailsReader *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v37 = v11;
  v38 = a6;
  if (objc_msgSend(v11, "count") == 1
    && (objc_msgSend(v10, "matchinfoData"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "length"),
        v13,
        !v14))
  {
    objc_msgSend(v10, "detailEntityId");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGRecordId recordIdWithNumericValue:](SGRecordId, "recordIdWithNumericValue:", objc_msgSend(v33, "longLongValue"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "detailForRecordId:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMatchedDetails _addToTokenDetailMap:token:detail:](self, "_addToTokenDetailMap:token:detail:", v38, v36, v35);

  }
  else
  {
    v15 = [SGMatchedDetailsReader alloc];
    objc_msgSend(v10, "matchinfoData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SGMatchedDetailsReader initWithMatchedDetails:](v15, "initWithMatchedDetails:", v16);

    if (-[SGMatchedDetailsReader phraseCount](v17, "phraseCount") >= 1)
    {
      v18 = objc_msgSend(v11, "count");
      if (v18 == -[SGMatchedDetailsReader phraseCount](v17, "phraseCount"))
      {
        if (-[SGMatchedDetailsReader phraseCount](v17, "phraseCount") >= 1)
        {
          v19 = 0;
          v20 = 1;
          do
          {
            objc_msgSend(v37, "objectAtIndexedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)objc_opt_class();
            objc_msgSend(v10, "entityId");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "detailEntityId");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v22, "tokenMatchedDetailTypeForContact:contactEntityId:detailEntityId:matchedDetailReader:phraseNumber:token:", v12, v23, v24, v17, v20 - 1, v21);

            if (v25 == 1
              || (objc_msgSend(v12, "name"),
                  v26 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[SGMatchedDetails _addToTokenDetailMap:token:detail:](self, "_addToTokenDetailMap:token:detail:", v38, v21, v26), v26, v25))
            {
              objc_msgSend(v10, "detailEntityId");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              +[SGRecordId recordIdWithInternalEntityId:](SGRecordId, "recordIdWithInternalEntityId:", objc_msgSend(v27, "longLongValue"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v12, "detailForRecordId:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGMatchedDetails _addToTokenDetailMap:token:detail:](self, "_addToTokenDetailMap:token:detail:", v38, v21, v29);

            }
            v19 = v20;
          }
          while (-[SGMatchedDetailsReader phraseCount](v17, "phraseCount") > v20++);
        }
      }
      else
      {
        sgPrivateLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v11;
          _os_log_debug_impl(&dword_1A2267000, v31, OS_LOG_TYPE_DEBUG, "tokens.count != phraseCount: %@", buf, 0xCu);
        }

        sgLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1A2267000, v32, OS_LOG_TYPE_FAULT, "tokens.count != phraseCount", buf, 2u);
        }

        if (_PASEvaluateLogFaultAndProbCrashCriteria())
          abort();
      }
    }

  }
}

- (BOOL)isEqualToMatchedDetails:(id)a3
{
  return -[NSDictionary isEqual:](self->_tokenDetailMap, "isEqual:", *((_QWORD *)a3 + 1));
}

- (BOOL)isEqual:(id)a3
{
  SGMatchedDetails *v4;
  SGMatchedDetails *v5;
  BOOL v6;

  v4 = (SGMatchedDetails *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGMatchedDetails isEqualToMatchedDetails:](self, "isEqualToMatchedDetails:", v5);

  return v6;
}

- (SGMatchedDetails)initWithCoder:(id)a3
{
  id v5;
  SGMatchedDetails *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  SEL v19;
  uint64_t v20;
  id v21;
  void *context;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SGMatchedDetails;
  v6 = -[SGMatchedDetails init](&v23, sel_init);
  if (v6)
  {
    v19 = a2;
    context = (void *)MEMORY[0x1A8583A40]();
    v21 = objc_alloc(MEMORY[0x1E0C99E60]);
    v20 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = (void *)objc_msgSend(v21, "initWithObjects:", v20, v7, v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
    objc_autoreleasePoolPop(context);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, CFSTR("tokenDetailMap"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", v19, v6, CFSTR("SGMatchedDetails.m"), 342, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tokenDetailMap"));

    }
    -[SGMatchedDetails _initilizeDictionariesFromTokenDetailMap:](v6, "_initilizeDictionariesFromTokenDetailMap:", v16);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_tokenDetailMap, CFSTR("tokenDetailMap"));
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_tokenDetailMap, "hash");
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGMatchedDetails map=%@>"), self->_tokenDetailMap);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailTokenMap, 0);
  objc_storeStrong((id *)&self->_tokenDetailMap, 0);
}

void __61__SGMatchedDetails__initilizeDictionariesFromTokenDetailMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v13 = (void *)objc_opt_new();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, v11);

        }
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v5);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)matchedDetailsWithContact:(id)a3 matchinfoData:(id)a4 tokens:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContact:matchinfoData:tokens:", v10, v9, v8);

  return v11;
}

+ (int64_t)tokensMatchedDetailTypeForContact:(id)a3 contactEntityId:(id)a4 detailEntityId:(id)a5 matchinfoData:(id)a6 tokens:(id)a7
{
  id v13;
  id v14;
  id v15;
  SGMatchedDetailsReader *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  char v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  int v28;
  int64_t v29;
  uint64_t v30;
  void *v32;
  id v33;
  int v34;
  int v35;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(a4, "isEqual:", a5))
  {
    v16 = -[SGMatchedDetailsReader initWithMatchedDetails:]([SGMatchedDetailsReader alloc], "initWithMatchedDetails:", v14);
    if (-[SGMatchedDetailsReader phraseCount](v16, "phraseCount"))
    {
      v17 = objc_msgSend(v15, "count");
      if (v17 != -[SGMatchedDetailsReader phraseCount](v16, "phraseCount"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGMatchedDetails.m"), 226, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tokens.count == matchedDetailReader.phraseCount"));

      }
      if (-[SGMatchedDetailsReader phraseCount](v16, "phraseCount") >= 1)
      {
        v33 = v14;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        v21 = 0;
        v22 = 1;
        v23 = 1;
        do
        {
          v34 = v21;
          v35 = v22;
          while (1)
          {
            v24 = (void *)objc_opt_class();
            objc_msgSend(v15, "objectAtIndexedSubscript:", v18);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v24, "tokenMatchedDetailTypeForContact:matchedDetailReader:phraseNumber:token:", v13, v16, v19, v25);

            if (v26 != 1)
              break;
            v18 = (v19 + 1);
            v23 = 0;
            v20 = 1;
            v19 = v18;
            if (-[SGMatchedDetailsReader phraseCount](v16, "phraseCount") <= v18)
            {
              LOBYTE(v21) = v34;
              LOBYTE(v22) = v35;
LABEL_31:
              v30 = 4;
              if ((v21 & 1) == 0)
                v30 = 1;
              if ((v22 & 1) != 0)
                v29 = v30;
              else
                v29 = 5;
              v14 = v33;
              goto LABEL_37;
            }
          }
          v22 = v35;
          if (v26 == 2)
            v27 = 1;
          else
            v27 = v34;
          if (v26 == 2)
            v28 = 1;
          else
            v28 = v20;
          if (v26)
          {
            v21 = v27;
          }
          else
          {
            v22 = 0;
            v21 = 1;
          }
          if (v26)
            v20 = v28;
          v18 = (v19 + 1);
          v19 = v18;
        }
        while (-[SGMatchedDetailsReader phraseCount](v16, "phraseCount") > v18);
        if ((v23 & 1) == 0)
          goto LABEL_31;
        if ((v20 & 1) != 0)
          v29 = 3;
        else
          v29 = 0;
        v14 = v33;
        if ((v22 & 1) == 0)
          goto LABEL_37;
      }
      v29 = 2;
    }
    else
    {
      v29 = 1;
    }
LABEL_37:

  }
  else
  {
    v29 = 1;
  }

  return v29;
}

+ (int64_t)tokenMatchedDetailTypeForContact:(id)a3 matchedDetailReader:(id)a4 phraseNumber:(unsigned int)a5 token:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  int v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = objc_msgSend(v12, "matchAtPhraseIndex:columnIndex:", a5, 2);
  v14 = 1;
  LODWORD(v11) = objc_msgSend(v12, "matchAtPhraseIndex:columnIndex:", v11, 1);

  if ((_DWORD)v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789+-()"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "invertedSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "rangeOfCharacterFromSet:", v16) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789+-"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fullName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "rangeOfCharacterFromSet:", v17);

      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        LOBYTE(v13) = 1;

      if ((v13 & 1) == 0)
        goto LABEL_6;
    }
    else
    {

      if (!v13)
      {
LABEL_6:
        v14 = 0;
        goto LABEL_9;
      }
    }
    v14 = 2;
  }
LABEL_9:

  return v14;
}

+ (int64_t)tokenMatchedDetailTypeForContact:(id)a3 contactEntityId:(id)a4 detailEntityId:(id)a5 matchedDetailReader:(id)a6 phraseNumber:(unsigned int)a7 token:(id)a8
{
  uint64_t v9;
  id v13;
  id v14;
  id v15;
  int64_t v16;

  v9 = *(_QWORD *)&a7;
  v13 = a3;
  v14 = a6;
  v15 = a8;
  if (objc_msgSend(a4, "isEqual:", a5))
    v16 = objc_msgSend((id)objc_opt_class(), "tokenMatchedDetailTypeForContact:matchedDetailReader:phraseNumber:token:", v13, v14, v9, v15);
  else
    v16 = 1;

  return v16;
}

@end
