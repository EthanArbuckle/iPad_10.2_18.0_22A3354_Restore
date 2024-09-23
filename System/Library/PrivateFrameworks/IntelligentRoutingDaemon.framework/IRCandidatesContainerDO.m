@implementation IRCandidatesContainerDO

- (unint64_t)hash
{
  return -[NSSet hash](self->_candidates, "hash");
}

- (id)airplayOrUnknownCandidates
{
  void *v2;
  void *v3;

  -[IRCandidatesContainerDO candidates](self, "candidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allWhere:", &__block_literal_global_23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSSet)candidates
{
  return self->_candidates;
}

- (id)exportAsDictionary
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[IRCandidatesContainerDO candidates](self, "candidates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "exportAsDictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "candidateIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)candidateNameForCandidateIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[IRCandidatesContainerDO candidateForCandidateIdentifier:](self, "candidateForCandidateIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)candidateForCandidateIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[IRCandidatesContainerDO candidates](self, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __70__IRCandidatesContainerDO_Extension__candidateForCandidateIdentifier___block_invoke;
  v9[3] = &unk_251043CB8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "firstWhere:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __70__IRCandidatesContainerDO_Extension__candidateForCandidateIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "candidateIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __64__IRCandidatesContainerDO_Extension__airplayOrUnknownCandidates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsNonAirplayTarget") ^ 1;
}

- (IRCandidatesContainerDO)initWithCandidates:(id)a3
{
  id v5;
  IRCandidatesContainerDO *v6;
  IRCandidatesContainerDO *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRCandidatesContainerDO;
  v6 = -[IRCandidatesContainerDO init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_candidates, a3);

  return v7;
}

+ (IRCandidatesContainerDO)candidatesContainerDOWithCandidates:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCandidates:", v4);

  return (IRCandidatesContainerDO *)v5;
}

- (id)copyWithReplacementCandidates:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCandidates:", v3);

  return v4;
}

- (BOOL)isEqualToCandidatesContainerDO:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSSet *candidates;
  void *v10;
  char v11;

  v4 = a3;
  v5 = v4;
  if (!v4
    || (v6 = self->_candidates != 0,
        objc_msgSend(v4, "candidates"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = v7 == 0,
        v7,
        v6 == v8))
  {
    v11 = 0;
  }
  else
  {
    candidates = self->_candidates;
    if (candidates)
    {
      objc_msgSend(v5, "candidates");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSSet isEqual:](candidates, "isEqual:", v10);

    }
    else
    {
      v11 = 1;
    }
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  IRCandidatesContainerDO *v4;
  IRCandidatesContainerDO *v5;
  BOOL v6;

  v4 = (IRCandidatesContainerDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRCandidatesContainerDO isEqualToCandidatesContainerDO:](self, "isEqualToCandidatesContainerDO:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRCandidatesContainerDO)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  IRCandidatesContainerDO *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCF20]);
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("candidates"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 || (objc_msgSend(v4, "error"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    self = -[IRCandidatesContainerDO initWithCandidates:](self, "initWithCandidates:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *candidates;

  candidates = self->_candidates;
  if (candidates)
    objc_msgSend(a3, "encodeObject:forKey:", candidates, CFSTR("candidates"));
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<IRCandidatesContainerDO | candidates:%@>"), self->_candidates);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);
}

@end
