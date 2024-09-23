@implementation AFMultiUserStateSnapshot

- (AFMultiUserStateSnapshot)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFMultiUserStateSnapshotMutation *);
  AFMultiUserStateSnapshot *v5;
  AFMultiUserStateSnapshot *v6;
  _AFMultiUserStateSnapshotMutation *v7;
  void *v8;
  uint64_t v9;
  NSNumber *vtSatScore;
  void *v11;
  uint64_t v12;
  NSArray *confidenceScores;
  objc_super v15;

  v4 = (void (**)(id, _AFMultiUserStateSnapshotMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFMultiUserStateSnapshot;
  v5 = -[AFMultiUserStateSnapshot init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFMultiUserStateSnapshotMutation initWithBase:]([_AFMultiUserStateSnapshotMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFMultiUserStateSnapshotMutation isDirty](v7, "isDirty"))
    {
      -[_AFMultiUserStateSnapshotMutation getVtSatScore](v7, "getVtSatScore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      vtSatScore = v6->_vtSatScore;
      v6->_vtSatScore = (NSNumber *)v9;

      -[_AFMultiUserStateSnapshotMutation getConfidenceScores](v7, "getConfidenceScores");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      confidenceScores = v6->_confidenceScores;
      v6->_confidenceScores = (NSArray *)v12;

    }
  }

  return v6;
}

- (AFMultiUserStateSnapshot)init
{
  return -[AFMultiUserStateSnapshot initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFMultiUserStateSnapshot)initWithVtSatScore:(id)a3 confidenceScores:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  AFMultiUserStateSnapshot *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__AFMultiUserStateSnapshot_initWithVtSatScore_confidenceScores___block_invoke;
  v12[3] = &unk_1E3A2DA70;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = -[AFMultiUserStateSnapshot initWithBuilder:](self, "initWithBuilder:", v12);

  return v10;
}

- (NSString)description
{
  return (NSString *)-[AFMultiUserStateSnapshot _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFMultiUserStateSnapshot;
  -[AFMultiUserStateSnapshot description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {vtSatScore = %@, confidenceScores = %@}"), v5, self->_vtSatScore, self->_confidenceScores);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSNumber hash](self->_vtSatScore, "hash");
  return -[NSArray hash](self->_confidenceScores, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  AFMultiUserStateSnapshot *v4;
  AFMultiUserStateSnapshot *v5;
  NSNumber *v6;
  NSNumber *vtSatScore;
  NSArray *v8;
  NSArray *confidenceScores;
  BOOL v10;

  v4 = (AFMultiUserStateSnapshot *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AFMultiUserStateSnapshot vtSatScore](v5, "vtSatScore");
      v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      vtSatScore = self->_vtSatScore;
      if (vtSatScore == v6 || -[NSNumber isEqual:](vtSatScore, "isEqual:", v6))
      {
        -[AFMultiUserStateSnapshot confidenceScores](v5, "confidenceScores");
        v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
        confidenceScores = self->_confidenceScores;
        v10 = confidenceScores == v8 || -[NSArray isEqual:](confidenceScores, "isEqual:", v8);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (AFMultiUserStateSnapshot)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  AFMultiUserStateSnapshot *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMultiUserStateSnapshot::vtSatScore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("AFMultiUserStateSnapshot::confidenceScores"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AFMultiUserStateSnapshot initWithVtSatScore:confidenceScores:](self, "initWithVtSatScore:confidenceScores:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *vtSatScore;
  id v5;

  vtSatScore = self->_vtSatScore;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", vtSatScore, CFSTR("AFMultiUserStateSnapshot::vtSatScore"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_confidenceScores, CFSTR("AFMultiUserStateSnapshot::confidenceScores"));

}

- (AFMultiUserStateSnapshot)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  AFMultiUserStateSnapshot *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  AFSharedConfidenceScore *v17;
  void *v18;
  AFMultiUserStateSnapshot *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("vtSatScore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("confidenceScores"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = self;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v11);
            v16 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = -[AFSharedConfidenceScore initWithDictionaryRepresentation:]([AFSharedConfidenceScore alloc], "initWithDictionaryRepresentation:", v16);

              if (v17)
                objc_msgSend(v10, "addObject:", v17);
            }
            else
            {

              v17 = 0;
            }

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v13);
      }

      v18 = (void *)objc_msgSend(v10, "copy");
      self = v20;
    }
    else
    {
      v18 = 0;
    }

    self = -[AFMultiUserStateSnapshot initWithVtSatScore:confidenceScores:](self, "initWithVtSatScore:confidenceScores:", v7, v18);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSNumber *vtSatScore;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  vtSatScore = self->_vtSatScore;
  if (vtSatScore)
    objc_msgSend(v3, "setObject:forKey:", vtSatScore, CFSTR("vtSatScore"));
  if (self->_confidenceScores)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_confidenceScores, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = self->_confidenceScores;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "buildDictionaryRepresentation", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    v13 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("confidenceScores"));

  }
  v14 = (void *)objc_msgSend(v4, "copy", (_QWORD)v16);

  return v14;
}

- (NSNumber)vtSatScore
{
  return self->_vtSatScore;
}

- (NSArray)confidenceScores
{
  return self->_confidenceScores;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceScores, 0);
  objc_storeStrong((id *)&self->_vtSatScore, 0);
}

void __64__AFMultiUserStateSnapshot_initWithVtSatScore_confidenceScores___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setVtSatScore:", v3);
  objc_msgSend(v4, "setConfidenceScores:", *(_QWORD *)(a1 + 40));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFMultiUserStateSnapshotMutation *);
  _AFMultiUserStateSnapshotMutation *v5;
  AFMultiUserStateSnapshot *v6;
  void *v7;
  uint64_t v8;
  NSNumber *vtSatScore;
  void *v10;
  uint64_t v11;
  NSArray *confidenceScores;

  v4 = (void (**)(id, _AFMultiUserStateSnapshotMutation *))a3;
  if (v4)
  {
    v5 = -[_AFMultiUserStateSnapshotMutation initWithBase:]([_AFMultiUserStateSnapshotMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFMultiUserStateSnapshotMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFMultiUserStateSnapshot);
      -[_AFMultiUserStateSnapshotMutation getVtSatScore](v5, "getVtSatScore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      vtSatScore = v6->_vtSatScore;
      v6->_vtSatScore = (NSNumber *)v8;

      -[_AFMultiUserStateSnapshotMutation getConfidenceScores](v5, "getConfidenceScores");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      confidenceScores = v6->_confidenceScores;
      v6->_confidenceScores = (NSArray *)v11;

    }
    else
    {
      v6 = (AFMultiUserStateSnapshot *)-[AFMultiUserStateSnapshot copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFMultiUserStateSnapshot *)-[AFMultiUserStateSnapshot copy](self, "copy");
  }

  return v6;
}

- (AFMultiUserStateSnapshot)initWithVtSatScore:(id)a3
{
  return -[AFMultiUserStateSnapshot initWithVtSatScore:confidenceScores:](self, "initWithVtSatScore:confidenceScores:", a3, 0);
}

- (AFMultiUserStateSnapshot)initWithConfidenceScores:(id)a3
{
  return -[AFMultiUserStateSnapshot initWithVtSatScore:confidenceScores:](self, "initWithVtSatScore:confidenceScores:", 0, a3);
}

- (id)ad_shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AFMultiUserStateSnapshot vtSatScore](self, "vtSatScore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFMultiUserStateSnapshot confidenceScores](self, "confidenceScores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = CFSTR("YES");
  if (!v6)
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(vtSatScore = %@, hasConfidenceScores = %@)"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (AFMultiUserStateSnapshot)initWithSerializedBackingStore:(id)a3
{
  id v4;
  AFMultiUserStateSnapshot *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self = -[AFMultiUserStateSnapshot initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
