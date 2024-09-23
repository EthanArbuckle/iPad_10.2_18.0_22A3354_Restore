@implementation IRMiLoPredictionEventMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRMiLoPredictionEventMO"));
}

+ (id)miloPredictionEventMOWithmiloPredictionEventDO:(id)a3 historyEventMO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  IRMiLoPredictionEventMO *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[IRMiLoPredictionEventMO initWithContext:]([IRMiLoPredictionEventMO alloc], "initWithContext:", v7);

  -[IRMiLoPredictionEventMO setHistoryEvent:](v10, "setHistoryEvent:", v8);
  +[IRMiLoPredictionEventMO setPropertiesOfMiloPredictionEventMO:withMiloPredictionEventDO:](IRMiLoPredictionEventMO, "setPropertiesOfMiloPredictionEventMO:withMiloPredictionEventDO:", v10, v9);

  return v10;
}

+ (void)setPropertiesOfMiloPredictionEventMO:(id)a3 withMiloPredictionEventDO:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLabel:", v7);

  objc_msgSend(v5, "predictionId");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPredictionId:", v8);
}

- (id)convert
{
  void *v3;
  void *v4;
  void *v5;

  -[IRMiLoPredictionEventMO label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRMiLoPredictionEventMO predictionId](self, "predictionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRMiLoPredictionEventDO miLoPredictionEventDOWithLabel:predictionId:](IRMiLoPredictionEventDO, "miLoPredictionEventDOWithLabel:predictionId:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
