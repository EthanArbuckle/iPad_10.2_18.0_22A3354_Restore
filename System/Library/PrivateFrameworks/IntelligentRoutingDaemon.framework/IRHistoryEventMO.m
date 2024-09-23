@implementation IRHistoryEventMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRHistoryEventMO"));
}

+ (IRHistoryEventMO)historyEventMOWithhistoryEventDO:(id)a3 historyEventsContainerMO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  IRHistoryEventMO *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[IRHistoryEventMO initWithContext:]([IRHistoryEventMO alloc], "initWithContext:", v7);
  -[IRHistoryEventMO setHistoryEventsContainer:](v10, "setHistoryEventsContainer:", v8);

  +[IRHistoryEventMO setPropertiesOfhistoryEventMO:withhistoryEventDO:inManagedObjectContext:](IRHistoryEventMO, "setPropertiesOfhistoryEventMO:withhistoryEventDO:inManagedObjectContext:", v10, v9, v7);
  return v10;
}

+ (void)setPropertiesOfhistoryEventMO:(id)a3 withhistoryEventDO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDate:", v10);

  objc_msgSend(v8, "event");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[IREventMO IREventMOWithIREventDO:historyEventMO:inManagedObjectContext:](IREventMO, "IREventMOWithIREventDO:historyEventMO:inManagedObjectContext:", v11, v9, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEvent:", v12);

  objc_msgSend(v8, "miloPredictionEvent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRMiLoPredictionEventMO miloPredictionEventMOWithmiloPredictionEventDO:historyEventMO:inManagedObjectContext:](IRMiLoPredictionEventMO, "miloPredictionEventMOWithmiloPredictionEventDO:historyEventMO:inManagedObjectContext:", v13, v9, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMiloPredictionEvent:", v14);

  objc_msgSend(v8, "candidateIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCandidateIdenfifier:", v15);

  objc_msgSend(v8, "systemState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRSystemStateMO systemStateMOWithSystemStateDO:historyEventMO:inManagedObjectContext:](IRSystemStateMO, "systemStateMOWithSystemStateDO:historyEventMO:inManagedObjectContext:", v16, v9, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSystemState:", v17);
  objc_msgSend(v8, "sharingPolicy");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSharingPolicy:", v18);
}

- (id)convert
{
  IRHistoryEventDO *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  IRHistoryEventDO *v13;

  v3 = [IRHistoryEventDO alloc];
  -[IRHistoryEventMO date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRHistoryEventMO candidateIdenfifier](self, "candidateIdenfifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRHistoryEventMO event](self, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convert");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRHistoryEventMO miloPredictionEvent](self, "miloPredictionEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convert");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRHistoryEventMO systemState](self, "systemState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convert");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRHistoryEventMO sharingPolicy](self, "sharingPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IRHistoryEventDO initWithDate:candidateIdentifier:event:miloPredictionEvent:systemState:sharingPolicy:](v3, "initWithDate:candidateIdentifier:event:miloPredictionEvent:systemState:sharingPolicy:", v4, v5, v7, v9, v11, v12);

  return v13;
}

@end
