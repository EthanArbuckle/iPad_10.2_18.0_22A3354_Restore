@implementation IRCandidateMO

+ (id)MOCandidate:(id)a3 candidatesContainerMO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  IRCandidateMO *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[IRCandidateMO initWithContext:]([IRCandidateMO alloc], "initWithContext:", v7);
  -[IRCandidateMO setCandidatesContainer:](v10, "setCandidatesContainer:", v8);

  +[IRCandidateMO setPropertiesOfCandidateMO:withCandidate:managedObjectContext:](IRCandidateMO, "setPropertiesOfCandidateMO:withCandidate:managedObjectContext:", v10, v9, v7);
  return v10;
}

+ (void)setPropertiesOfCandidateMO:(id)a3 withCandidate:(id)a4 managedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "lastSeenDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLastSeenDate:", v10);

  objc_msgSend(v9, "lastUsedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLastUsedDate:", v11);

  objc_msgSend(v9, "firstSeenDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFirstSeenDate:", v12);

  objc_msgSend(v9, "candidateIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCandidateIdentifier:", v13);

  objc_msgSend(v7, "nodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __79__IRCandidateMO_setPropertiesOfCandidateMO_withCandidate_managedObjectContext___block_invoke;
  v24[3] = &unk_251044810;
  v16 = v8;
  v25 = v16;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v24);

  objc_msgSend(v7, "nodes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeNodes:", v17);

  objc_msgSend(v9, "nodes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __79__IRCandidateMO_setPropertiesOfCandidateMO_withCandidate_managedObjectContext___block_invoke_2;
  v21[3] = &unk_251044580;
  v22 = v7;
  v23 = v16;
  v19 = v16;
  v20 = v7;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v21);

}

uint64_t __79__IRCandidateMO_setPropertiesOfCandidateMO_withCandidate_managedObjectContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
}

void __79__IRCandidateMO_setPropertiesOfCandidateMO_withCandidate_managedObjectContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[IRNodeMO nodeMOFromNodeDO:forCandidate:inManagedObjectContext:](IRNodeMO, "nodeMOFromNodeDO:forCandidate:inManagedObjectContext:", a2, v2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addNodesObject:", v3);

}

- (id)convert
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = (void *)objc_opt_new();
  -[IRCandidateMO nodes](self, "nodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __24__IRCandidateMO_convert__block_invoke;
  v12[3] = &unk_251044810;
  v13 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);

  -[IRCandidateMO lastSeenDate](self, "lastSeenDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRCandidateMO lastUsedDate](self, "lastUsedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRCandidateMO firstSeenDate](self, "firstSeenDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRCandidateMO candidateIdentifier](self, "candidateIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRCandidateDO candidateDOWithLastSeenDate:lastUsedDate:firstSeenDate:candidateIdentifier:nodes:](IRCandidateDO, "candidateDOWithLastSeenDate:lastUsedDate:firstSeenDate:candidateIdentifier:nodes:", v6, v7, v8, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __24__IRCandidateMO_convert__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "convert");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRCandidateMO"));
}

@end
