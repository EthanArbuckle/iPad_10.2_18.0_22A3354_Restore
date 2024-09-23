@implementation COMutableBallot

- (id)copyWithZone:(_NSZone *)a3
{
  return -[COBallot initWithBallot:]([COBallot alloc], "initWithBallot:", self);
}

- (void)addCandidate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[COBallot candidates](self, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addObject:", v4);
  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_12);
  -[COBallot setCandidates:](self, "setCandidates:", v6);

}

uint64_t __32__COMutableBallot_addCandidate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)removeCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[COBallot candidates](self, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v8, "removeObject:", v4);
  -[COBallot setCandidates:](self, "setCandidates:", v8);
  -[COBallot discovery](self, "discovery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeObjectForKey:", v4);
  -[COBallot setDiscovery:](self, "setDiscovery:", v7);

}

- (void)mergeBallot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CODiscoveryRecord *v20;
  void *v21;
  void *v22;
  COMutableBallot *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COBallot candidates](self, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "candidates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionOrderedSet:", v7);

  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_54);
  v21 = v6;
  -[COBallot setCandidates:](self, "setCandidates:", v6);
  v23 = self;
  -[COBallot discovery](self, "discovery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v22 = v4;
  objc_msgSend(v4, "discovery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[COBallot discovery](v23, "discovery");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = (void *)objc_msgSend(v18, "mutableCopy");
          objc_msgSend(v19, "addDestinationsFromDiscoveryRecord:", v16);
          v20 = -[CODiscoveryRecord initWithDiscoveryRecord:]([CODiscoveryRecord alloc], "initWithDiscoveryRecord:", v19);

        }
        else
        {
          v20 = v16;
        }
        objc_msgSend(v9, "setObject:forKey:", v20, v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }
  -[COBallot setDiscovery:](v23, "setDiscovery:", v9);

}

uint64_t __31__COMutableBallot_mergeBallot___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)addDiscoveryRecord:(id)a3
{
  CODiscoveryRecord *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  CODiscoveryRecord *v12;

  v4 = (CODiscoveryRecord *)a3;
  -[CODiscoveryRecord constituent](v4, "constituent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COBallot discovery](self, "discovery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_5;
  if ((objc_msgSend(v8, "isEqualToDiscoveryRecord:", v4) & 1) == 0)
  {
    v11 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v11, "addDestinationsFromDiscoveryRecord:", v4);
    v12 = -[CODiscoveryRecord initWithDiscoveryRecord:]([CODiscoveryRecord alloc], "initWithDiscoveryRecord:", v11);

    v4 = v12;
LABEL_5:
    objc_msgSend(v7, "setObject:forKey:", v4, v5);
    -[COBallot setDiscovery:](self, "setDiscovery:", v7);
    v10 = 1;
    goto LABEL_6;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (void)clearInsignificantCandidates
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[COBallot candidates](self, "candidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithObject:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[COBallot setCandidates:](self, "setCandidates:", v5);

    v4 = v6;
  }

}

@end
