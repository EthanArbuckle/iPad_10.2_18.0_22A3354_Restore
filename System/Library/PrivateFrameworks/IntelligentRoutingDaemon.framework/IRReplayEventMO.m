@implementation IRReplayEventMO

+ (IRReplayEventMO)replayEventMOWithReplayEventDO:(id)a3 replayEventsContainerMO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  IRReplayEventMO *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[IRReplayEventMO initWithContext:]([IRReplayEventMO alloc], "initWithContext:", v7);
  -[IRReplayEventMO setReplayEventsContainer:](v10, "setReplayEventsContainer:", v8);

  +[IRReplayEventMO setPropertiesOfReplayEventMO:withReplayEventDO:inManagedObjectContext:](IRReplayEventMO, "setPropertiesOfReplayEventMO:withReplayEventDO:inManagedObjectContext:", v10, v9, v7);
  return v10;
}

+ (void)setPropertiesOfReplayEventMO:(id)a3 withReplayEventDO:(id)a4 inManagedObjectContext:(id)a5
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
  void *v18;
  id v19;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDate:", v10);

  objc_msgSend(v8, "contextChangeReason");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContextChangeReason:", v11);

  objc_msgSend(v8, "systemState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRSystemStateMO systemStateMOWithSystemStateDO:replayEventMO:inManagedObjectContext:](IRSystemStateMO, "systemStateMOWithSystemStateDO:replayEventMO:inManagedObjectContext:", v12, v9, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSystemState:", v13);

  objc_msgSend(v8, "miloLslPrediction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRMiLoLSLPredictionMO miLoLSLPredictionMOWithMiLoLSLPredictionDO:replayEvent:inManagedObjectContext:](IRMiLoLSLPredictionMO, "miLoLSLPredictionMOWithMiLoLSLPredictionDO:replayEvent:inManagedObjectContext:", v14, v9, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMiloLslPrediction:", v15);

  objc_msgSend(v8, "nearbyDeviceContainerDO");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRNearbyDeviceContainerMO nearbyDeviceContainerMOWithNearbyDeviceContainerDO:replayEvent:inManagedObjectContext:](IRNearbyDeviceContainerMO, "nearbyDeviceContainerMOWithNearbyDeviceContainerDO:replayEvent:inManagedObjectContext:", v16, v9, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNearbyDeviceContainer:", v17);

  objc_msgSend(v8, "candidatesContainer");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  +[IRCandidatesContainerMO candidatesContainerMOFromCandidatesContainerDO:withReplayEventMO:managedObjectContext:](IRCandidatesContainerMO, "candidatesContainerMOFromCandidatesContainerDO:withReplayEventMO:managedObjectContext:", v19, v9, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCandidatesContainer:", v18);
}

- (id)convert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  IRReplayEventDO *v12;
  void *v14;
  IRReplayEventDO *v15;

  v15 = [IRReplayEventDO alloc];
  -[IRReplayEventMO date](self, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRReplayEventMO contextChangeReason](self, "contextChangeReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRReplayEventMO candidatesContainer](self, "candidatesContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRReplayEventMO miloLslPrediction](self, "miloLslPrediction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convert");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRReplayEventMO systemState](self, "systemState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convert");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRReplayEventMO nearbyDeviceContainer](self, "nearbyDeviceContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convert");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IRReplayEventDO initWithDate:contextChangeReason:candidatesContainer:miloLslPrediction:systemState:nearbyDeviceContainerDO:](v15, "initWithDate:contextChangeReason:candidatesContainer:miloLslPrediction:systemState:nearbyDeviceContainerDO:", v14, v3, v5, v7, v9, v11);

  return v12;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRReplayEventMO"));
}

@end
