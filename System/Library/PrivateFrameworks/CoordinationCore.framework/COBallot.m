@implementation COBallot

- (COBallot)init
{
  COBallot *v2;
  NSOrderedSet *v3;
  NSOrderedSet *candidates;
  NSDictionary *v5;
  NSDictionary *discovery;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)COBallot;
  v2 = -[COBallot init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCF00]);
    candidates = v2->_candidates;
    v2->_candidates = v3;

    v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    discovery = v2->_discovery;
    v2->_discovery = v5;

  }
  return v2;
}

- (COBallot)initWithBallot:(id)a3
{
  id v4;
  COBallot *v5;
  void *v6;
  uint64_t v7;
  NSOrderedSet *candidates;
  void *v9;
  uint64_t v10;
  NSDictionary *discovery;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)COBallot;
  v5 = -[COBallot init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "candidates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    candidates = v5->_candidates;
    v5->_candidates = (NSOrderedSet *)v7;

    objc_msgSend(v4, "discovery");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    discovery = v5->_discovery;
    v5->_discovery = (NSDictionary *)v10;

  }
  return v5;
}

- (COBallot)initWithCandidate:(id)a3
{
  id v4;
  COMutableBallot *v5;
  COBallot *v6;

  v4 = a3;
  v5 = objc_alloc_init(COMutableBallot);
  -[COMutableBallot addCandidate:](v5, "addCandidate:", v4);

  v6 = -[COBallot initWithBallot:](self, "initWithBallot:", v5);
  return v6;
}

- (COBallot)initWithCoder:(id)a3
{
  id v4;
  COBallot *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSOrderedSet *candidates;
  NSOrderedSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSDictionary *discovery;
  NSDictionary *v22;
  NSDictionary *v23;
  NSDictionary *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")) != 1)
  {

    v5 = 0;
    goto LABEL_31;
  }
  v5 = -[COBallot init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("candidates"));
    v9 = objc_claimAutoreleasedReturnValue();
    candidates = v5->_candidates;
    v5->_candidates = (NSOrderedSet *)v9;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v11 = v5->_candidates;
      v12 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (!v12)
        goto LABEL_12;
      v13 = v12;
      v14 = *(_QWORD *)v37;
LABEL_6:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(v11);
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        if (v13 == ++v15)
        {
          v13 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
          if (!v13)
          {
LABEL_12:

            v16 = (void *)MEMORY[0x24BDBCF20];
            v17 = objc_opt_class();
            v18 = objc_opt_class();
            objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("discovery"));
            v20 = objc_claimAutoreleasedReturnValue();
            discovery = v5->_discovery;
            v5->_discovery = (NSDictionary *)v20;

            if (!v5->_discovery && (objc_msgSend(v4, "containsValueForKey:", CFSTR("discovery")) & 1) == 0)
            {
              v22 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
              v23 = v5->_discovery;
              v5->_discovery = v22;

            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v5 = 0;
              goto LABEL_30;
            }
            objc_opt_class();
            objc_opt_class();
            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            v24 = v5->_discovery;
            v25 = -[NSDictionary countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            if (!v25)
              goto LABEL_36;
            v26 = v25;
            v27 = *(_QWORD *)v33;
LABEL_18:
            v28 = 0;
            while (1)
            {
              if (*(_QWORD *)v33 != v27)
                objc_enumerationMutation(v24);
              v29 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v28);
              if ((objc_opt_isKindOfClass() & 1) == 0)
                break;
              -[NSDictionary objectForKey:](v5->_discovery, "objectForKey:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

                goto LABEL_35;
              }

              if (v26 == ++v28)
              {
                v26 = -[NSDictionary countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
                if (v26)
                  goto LABEL_18;
LABEL_36:

LABEL_30:
                goto LABEL_31;
              }
            }
            v30 = v5;
LABEL_35:

            v5 = 0;
            goto LABEL_36;
          }
          goto LABEL_6;
        }
      }

    }
    else
    {

    }
    v5 = 0;
    v19 = v8;
    goto LABEL_30;
  }
LABEL_31:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("version"));
  -[COBallot candidates](self, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("candidates"));

  -[COBallot discovery](self, "discovery");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("discovery"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COBallot candidates](self, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, candidates = %@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[COBallot initWithBallot:]([COMutableBallot alloc], "initWithBallot:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[COBallot candidates](self, "candidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  COBallot *v4;
  BOOL v5;

  v4 = (COBallot *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[COBallot isEqualToBallot:](self, "isEqualToBallot:", v4);
  }

  return v5;
}

- (BOOL)isEqualToBallot:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[COBallot candidates](self, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToOrderedSet:", v6);
  return (char)v4;
}

- (NSOrderedSet)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
}

@end
