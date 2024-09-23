@implementation IREventMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IREventMO"));
}

+ (id)IREventMOWithIREventDO:(id)a3 historyEventMO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  IREventMO *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[IREventMO initWithContext:]([IREventMO alloc], "initWithContext:", v7);

  -[IREventMO setHistoryEvent:](v10, "setHistoryEvent:", v8);
  +[IREventMO setPropertiesOfEventMO:withEventDO:](IREventMO, "setPropertiesOfEventMO:withEventDO:", v10, v9);

  return v10;
}

+ (void)setPropertiesOfEventMO:(id)a3 withEventDO:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a4;
  v10 = a3;
  objc_msgSend(v10, "setEventType:", objc_msgSend(v5, "eventType"));
  objc_msgSend(v10, "setEventSubtype:", objc_msgSend(v5, "eventSubType"));
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setName:", v6);

  objc_msgSend(v5, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBundleID:", v7);

  objc_msgSend(v5, "contextIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContextIdentifier:", v8);

  objc_msgSend(v10, "setIsOutsideApp:", objc_msgSend(v5, "isOutsideApp"));
  v9 = objc_msgSend(v5, "isEligibleApp");

  objc_msgSend(v10, "setIsEligibleApp:", v9);
}

- (id)convert
{
  IREventDO *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  IREventDO *v10;
  uint64_t v12;

  v3 = [IREventDO alloc];
  v4 = -[IREventMO eventType](self, "eventType");
  v5 = -[IREventMO eventSubtype](self, "eventSubtype");
  -[IREventMO name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IREventMO bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IREventMO contextIdentifier](self, "contextIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IREventMO isOutsideApp](self, "isOutsideApp");
  LOBYTE(v12) = -[IREventMO isEligibleApp](self, "isEligibleApp");
  v10 = -[IREventDO initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:](v3, "initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:", v4, v5, v6, v7, v8, v9, v12);

  return v10;
}

@end
