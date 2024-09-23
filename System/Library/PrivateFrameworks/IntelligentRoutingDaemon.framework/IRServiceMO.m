@implementation IRServiceMO

- (id)convert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[IRServiceMO lastSeenDate](self, "lastSeenDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRServiceMO clientIdentifier](self, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRServiceMO serviceIdentifier](self, "serviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRServiceDO serviceDOWithLastSeenDate:clientIdentifier:serviceIdentifier:servicePackage:](IRServiceDO, "serviceDOWithLastSeenDate:clientIdentifier:serviceIdentifier:servicePackage:", v3, v4, v5, -[IRServiceMO servicePackage](self, "servicePackage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)setPropertiesOfServiceMO:(id)a3 withServiceDO:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a4;
  v10 = a3;
  objc_msgSend(v5, "lastSeenDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLastSeenDate:", v6);

  objc_msgSend(v5, "serviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setServiceIdentifier:", v7);

  objc_msgSend(v5, "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClientIdentifier:", v8);

  v9 = objc_msgSend(v5, "servicePackage");
  objc_msgSend(v10, "setServicePackage:", v9);

}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRServiceMO"));
}

+ (id)MOService:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  IRServiceMO *v7;
  IRCandidatesContainerMO *v8;
  void *v9;
  IRHistoryEventsContainerMO *v10;
  void *v11;
  IRMiLoServiceMO *v12;
  void *v13;
  IRReplayEventsContainerMO *v14;
  void *v15;
  IRStatisticsMO *v16;
  void *v17;

  v5 = a4;
  v6 = a3;
  v7 = -[IRServiceMO initWithContext:]([IRServiceMO alloc], "initWithContext:", v5);
  v8 = -[IRCandidatesContainerMO initWithContext:]([IRCandidatesContainerMO alloc], "initWithContext:", v5);
  -[IRServiceMO setCandidatesContainer:](v7, "setCandidatesContainer:", v8);

  -[IRServiceMO candidatesContainer](v7, "candidatesContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setService:", v7);

  v10 = -[IRHistoryEventsContainerMO initWithContext:]([IRHistoryEventsContainerMO alloc], "initWithContext:", v5);
  -[IRServiceMO setHistoryContainer:](v7, "setHistoryContainer:", v10);

  -[IRServiceMO historyContainer](v7, "historyContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setService:", v7);

  v12 = -[IRMiLoServiceMO initWithContext:]([IRMiLoServiceMO alloc], "initWithContext:", v5);
  -[IRServiceMO setMiloService:](v7, "setMiloService:", v12);

  -[IRServiceMO miloService](v7, "miloService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setService:", v7);

  v14 = -[IRReplayEventsContainerMO initWithContext:]([IRReplayEventsContainerMO alloc], "initWithContext:", v5);
  -[IRServiceMO setReplayEventContainer:](v7, "setReplayEventContainer:", v14);

  -[IRServiceMO replayEventContainer](v7, "replayEventContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setService:", v7);

  v16 = -[IRStatisticsMO initWithContext:]([IRStatisticsMO alloc], "initWithContext:", v5);
  -[IRServiceMO setStatistics:](v7, "setStatistics:", v16);

  -[IRServiceMO statistics](v7, "statistics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setService:", v7);

  +[IRServiceMO setPropertiesOfServiceMO:withServiceDO:](IRServiceMO, "setPropertiesOfServiceMO:withServiceDO:", v7, v6);
  return v7;
}

@end
