@implementation BMFeedbackLearningTupleInteractionTupleInteraction

- (BMFeedbackLearningTupleInteractionTupleInteraction)initWithCandidates:(id)a3 userAlignment:(id)a4
{
  id v7;
  id v8;
  BMFeedbackLearningTupleInteractionTupleInteraction *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMFeedbackLearningTupleInteractionTupleInteraction;
  v9 = -[BMEventBase init](&v11, sel_init);
  if (v9)
  {
    v9->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v9->_candidates, a3);
    objc_storeStrong((id *)&v9->_userAlignment, a4);
  }

  return v9;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMFeedbackLearningTupleInteractionTupleInteraction candidates](self, "candidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFeedbackLearningTupleInteractionTupleInteraction userAlignment](self, "userAlignment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMFeedbackLearningTupleInteractionTupleInteraction with candidates: %@, userAlignment: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMFeedbackLearningTupleInteractionTupleInteraction *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  int v19;
  id v21;
  void *v22;
  BMIntelligenceFlowUserAlignment *v23;
  BMIntelligenceFlowUserAlignment *userAlignment;
  uint64_t v25;
  NSArray *candidates;
  int v27;
  BMFeedbackLearningTupleInteractionTupleInteraction *v28;
  objc_super v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BMFeedbackLearningTupleInteractionTupleInteraction;
  v5 = -[BMEventBase init](&v30, sel_init);
  if (!v5)
    goto LABEL_30;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v7;
        v15 = *(_QWORD *)&v4[v14];
        v16 = v15 + 1;
        if (v15 == -1 || v16 > *(_QWORD *)&v4[*v8])
          break;
        v17 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        if (v12++ >= 9)
        {
          v13 = 0;
          v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v19 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v19 || (v13 & 7) == 4)
        break;
      if ((v13 >> 3) == 2)
      {
        v31 = 0;
        v32 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (v23 = -[BMIntelligenceFlowUserAlignment initByReadFrom:]([BMIntelligenceFlowUserAlignment alloc], "initByReadFrom:", v4)) == 0)
        {
LABEL_31:

          goto LABEL_32;
        }
        userAlignment = v5->_userAlignment;
        v5->_userAlignment = v23;

        PBReaderRecallMark();
      }
      else if ((v13 >> 3) == 1)
      {
        v31 = 0;
        v32 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_31;
        v21 = -[BMFeedbackLearningTupleInteractionCandidateIdentifier initByReadFrom:]([BMFeedbackLearningTupleInteractionCandidateIdentifier alloc], "initByReadFrom:", v4);
        if (!v21)
          goto LABEL_31;
        v22 = v21;
        objc_msgSend(v6, "addObject:", v21);
        PBReaderRecallMark();

      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_31;
      }
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v25 = objc_msgSend(v6, "copy");
  candidates = v5->_candidates;
  v5->_candidates = (NSArray *)v25;

  v27 = v4[*v9];
  if (v27)
LABEL_32:
    v28 = 0;
  else
LABEL_30:
    v28 = v5;

  return v28;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_candidates;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self->_userAlignment)
  {
    PBDataWriterPlaceMark();
    -[BMIntelligenceFlowUserAlignment writeTo:](self->_userAlignment, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMFeedbackLearningTupleInteractionTupleInteraction writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMFeedbackLearningTupleInteractionTupleInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BMIntelligenceFlowUserAlignment *v14;
  BMFeedbackLearningTupleInteractionCandidateIdentifier *v15;
  BMFeedbackLearningTupleInteractionCandidateIdentifier *v16;
  id v17;
  void *v18;
  id *v19;
  id v20;
  uint64_t v21;
  void *v22;
  BMIntelligenceFlowUserAlignment **v23;
  uint64_t *v24;
  void *v25;
  BMFeedbackLearningTupleInteractionTupleInteraction *v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  id v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  BMFeedbackLearningTupleInteractionTupleInteraction *v38;
  void *v39;
  void *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  BMIntelligenceFlowUserAlignment *v49;
  uint64_t v50;
  BMIntelligenceFlowUserAlignment *v51;
  uint64_t v52;
  BMIntelligenceFlowUserAlignment *v53;
  _BYTE v54[128];
  uint64_t v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("candidates"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    v38 = self;
    v39 = v5;

    v6 = 0;
  }
  else
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v29 = *MEMORY[0x1E0D025B8];
          v55 = *MEMORY[0x1E0CB2D50];
          v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("candidates"));
          v56[0] = v41;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2, v18);
          v26 = 0;
          *a4 = v30;
          goto LABEL_33;
        }
        v26 = 0;
        goto LABEL_34;
      }
    }
    v38 = self;
    v39 = v5;
  }
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v6 = v6;
  v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (!v9)
    goto LABEL_16;
  v10 = v9;
  v11 = *(_QWORD *)v45;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v45 != v11)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = a4;
        if (a4)
        {
          v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v21 = *MEMORY[0x1E0D025B8];
          v52 = *MEMORY[0x1E0CB2D50];
          v14 = (BMIntelligenceFlowUserAlignment *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("candidates"));
          v53 = v14;
          v22 = (void *)MEMORY[0x1E0C99D80];
          v23 = &v53;
          v24 = &v52;
LABEL_23:
          objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *v19 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 2, v25);

          v26 = 0;
          v18 = v6;
          self = v38;
          v5 = v39;
          goto LABEL_32;
        }
LABEL_29:
        v26 = 0;
        v18 = v6;
        self = v38;
        v5 = v39;
        goto LABEL_33;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = a4;
        if (a4)
        {
          v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v21 = *MEMORY[0x1E0D025B8];
          v50 = *MEMORY[0x1E0CB2D50];
          v14 = (BMIntelligenceFlowUserAlignment *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("candidates"));
          v51 = v14;
          v22 = (void *)MEMORY[0x1E0C99D80];
          v23 = &v51;
          v24 = &v50;
          goto LABEL_23;
        }
        goto LABEL_29;
      }
      v14 = v13;
      v15 = [BMFeedbackLearningTupleInteractionCandidateIdentifier alloc];
      v43 = 0;
      v16 = -[BMFeedbackLearningTupleInteractionCandidateIdentifier initWithJSONDictionary:error:](v15, "initWithJSONDictionary:error:", v14, &v43);
      v17 = v43;
      if (v17)
      {
        v27 = v17;
        v5 = v39;
        if (a4)
          *a4 = objc_retainAutorelease(v17);

        v26 = 0;
        v18 = v6;
        self = v38;
LABEL_32:

        goto LABEL_33;
      }
      objc_msgSend(v41, "addObject:", v16);

    }
    v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    if (v10)
      continue;
    break;
  }
LABEL_16:

  v5 = v39;
  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("userAlignment"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v14 = 0;
    self = v38;
    goto LABEL_31;
  }
  objc_opt_class();
  self = v38;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0;
    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = v18;
    v42 = 0;
    v14 = -[BMIntelligenceFlowUserAlignment initWithJSONDictionary:error:]([BMIntelligenceFlowUserAlignment alloc], "initWithJSONDictionary:error:", v32, &v42);
    v33 = v42;
    if (v33)
    {
      v34 = v33;
      if (a4)
        *a4 = objc_retainAutorelease(v33);

      v26 = 0;
      v18 = v32;
      goto LABEL_32;
    }

LABEL_31:
    self = -[BMFeedbackLearningTupleInteractionTupleInteraction initWithCandidates:userAlignment:](self, "initWithCandidates:userAlignment:", v41, v14);
    v26 = self;
    goto LABEL_32;
  }
  if (a4)
  {
    v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v36 = *MEMORY[0x1E0D025B8];
    v48 = *MEMORY[0x1E0CB2D50];
    v14 = (BMIntelligenceFlowUserAlignment *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("userAlignment"));
    v49 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v36, 2, v37);

    v26 = 0;
    goto LABEL_32;
  }
  v26 = 0;
LABEL_33:

LABEL_34:
  return v26;
}

- (id)_candidatesJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMFeedbackLearningTupleInteractionTupleInteraction candidates](self, "candidates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[BMFeedbackLearningTupleInteractionTupleInteraction _candidatesJSONArray](self, "_candidatesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFeedbackLearningTupleInteractionTupleInteraction userAlignment](self, "userAlignment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jsonDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = CFSTR("candidates");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("userAlignment");
  v11[0] = v6;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    if (v3)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v3)
    goto LABEL_9;
LABEL_7:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMFeedbackLearningTupleInteractionTupleInteraction candidates](self, "candidates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidates");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMFeedbackLearningTupleInteractionTupleInteraction candidates](self, "candidates");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "candidates");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    -[BMFeedbackLearningTupleInteractionTupleInteraction userAlignment](self, "userAlignment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userAlignment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v12 = 1;
    }
    else
    {
      -[BMFeedbackLearningTupleInteractionTupleInteraction userAlignment](self, "userAlignment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userAlignment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "isEqual:", v16);

    }
    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (BMIntelligenceFlowUserAlignment)userAlignment
{
  return self->_userAlignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAlignment, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
}

+ (unsigned)latestDataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  _DWORD *v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0D82B90];
    v6 = a3;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

    v4 = -[BMFeedbackLearningTupleInteractionTupleInteraction initByReadFrom:]([BMFeedbackLearningTupleInteractionTupleInteraction alloc], "initByReadFrom:", v7);
    v4[4] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("candidates_json"), 5, 1, &__block_literal_global_141);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("userAlignment_json"), 5, 1, &__block_literal_global_142_59980);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1E9D0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("candidates"), 1, 14, objc_opt_class());
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userAlignment"), 2, 14, objc_opt_class());
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __61__BMFeedbackLearningTupleInteractionTupleInteraction_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userAlignment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __61__BMFeedbackLearningTupleInteractionTupleInteraction_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_candidatesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
