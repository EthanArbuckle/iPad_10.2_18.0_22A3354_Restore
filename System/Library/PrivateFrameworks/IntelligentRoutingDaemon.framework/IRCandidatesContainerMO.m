@implementation IRCandidatesContainerMO

+ (id)candidatesContainerMOFromCandidatesContainerDO:(id)a3 withReplayEventMO:(id)a4 managedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  IRCandidatesContainerMO *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[IRCandidatesContainerMO initWithContext:]([IRCandidatesContainerMO alloc], "initWithContext:", v7);
  -[IRCandidatesContainerMO setReplayEvent:](v10, "setReplayEvent:", v8);

  +[IRCandidatesContainerMO setPropertiesOfCandidatesContainerMO:withCandidatesContainerDO:inManagedObjectContext:](IRCandidatesContainerMO, "setPropertiesOfCandidatesContainerMO:withCandidatesContainerDO:inManagedObjectContext:", v10, v9, v7);
  return v10;
}

+ (void)setPropertiesOfCandidatesContainerMO:(id)a3 withCandidatesContainerDO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "candidates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __113__IRCandidatesContainerMO_setPropertiesOfCandidatesContainerMO_withCandidatesContainerDO_inManagedObjectContext___block_invoke;
  v12[3] = &unk_2510449F0;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRCandidatesContainerMO"));
}

void __113__IRCandidatesContainerMO_setPropertiesOfCandidatesContainerMO_withCandidatesContainerDO_inManagedObjectContext___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[IRCandidateMO MOCandidate:candidatesContainerMO:inManagedObjectContext:](IRCandidateMO, "MOCandidate:candidatesContainerMO:inManagedObjectContext:", a2, v2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCandidatesObject:", v3);

}

- (id)convert
{
  id v3;
  void *v4;
  id v5;
  IRCandidatesContainerDO *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[IRCandidatesContainerMO candidates](self, "candidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__IRCandidatesContainerMO_convert__block_invoke;
  v8[3] = &unk_251045640;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  v6 = -[IRCandidatesContainerDO initWithCandidates:]([IRCandidatesContainerDO alloc], "initWithCandidates:", v5);
  return v6;
}

void __34__IRCandidatesContainerMO_convert__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "convert");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
