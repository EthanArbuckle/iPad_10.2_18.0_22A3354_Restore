@implementation CRKASMAtomicRosterConstraint

- (CRKASMAtomicRosterConstraint)initWithIdentifier:(id)a3 rosterEvaluator:(id)a4
{
  id v7;
  id v8;
  CRKASMAtomicRosterConstraint *v9;
  CRKASMAtomicRosterConstraint *v10;
  uint64_t v11;
  id rosterEvaluator;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKASMAtomicRosterConstraint;
  v9 = -[CRKASMAtomicRosterConstraint init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v11 = MEMORY[0x219A226E8](v8);
    rosterEvaluator = v10->_rosterEvaluator;
    v10->_rosterEvaluator = (id)v11;

  }
  return v10;
}

+ (id)constraintWithRosterEvaluator:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:rosterEvaluator:", v6, v4);

  return v7;
}

- (BOOL)isFulfilledByRoster:(id)a3
{
  id v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  char v6;

  v4 = a3;
  -[CRKASMAtomicRosterConstraint rosterEvaluator](self, "rosterEvaluator");
  v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = ((uint64_t (**)(_QWORD, id))v5)[2](v5, v4);

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CRKASMAtomicRosterConstraint identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  CRKASMAtomicRosterConstraint *v8;
  CRKASMAtomicRosterConstraint *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  CRKASMAtomicRosterConstraint *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(CFSTR("identifier"), "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_13;
  v28[3] = &unk_24D9C7230;
  v7 = v6;
  v29 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  v8 = self;
  v9 = (CRKASMAtomicRosterConstraint *)v4;
  v10 = v7;
  if (v8 == v9)
  {
    v21 = 1;
  }
  else if (-[CRKASMAtomicRosterConstraint isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class()))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v23 = v10;
      v14 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v17 = v9;
          -[CRKASMAtomicRosterConstraint valueForKey:](v8, "valueForKey:", v16);
          v18 = objc_claimAutoreleasedReturnValue();
          -[CRKASMAtomicRosterConstraint valueForKey:](v17, "valueForKey:", v16);
          v19 = objc_claimAutoreleasedReturnValue();

          if (v18 | v19)
          {
            v20 = objc_msgSend((id)v18, "isEqual:", v19);

            if (!v20)
            {
              v21 = 0;
              goto LABEL_16;
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
          continue;
        break;
      }
      v21 = 1;
LABEL_16:
      v10 = v23;
    }
    else
    {
      v21 = 1;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)rosterEvaluator
{
  return self->_rosterEvaluator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rosterEvaluator, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
