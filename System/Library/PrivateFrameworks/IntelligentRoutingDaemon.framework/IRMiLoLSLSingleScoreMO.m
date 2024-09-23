@implementation IRMiLoLSLSingleScoreMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRMiLoLSLSingleScoreMO"));
}

+ (id)miLoLSLSingleScoreMOWithMiLoLSLSingleScoreDO:(id)a3 miloPrediction:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  IRMiLoLSLSingleScoreMO *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[IRMiLoLSLSingleScoreMO initWithContext:]([IRMiLoLSLSingleScoreMO alloc], "initWithContext:", v7);

  -[IRMiLoLSLSingleScoreMO setPrediction:](v10, "setPrediction:", v8);
  +[IRMiLoLSLSingleScoreMO setPropertiesOfMiLoLSLSingleScoreMO:IRMiLoLSLSingleScoreDO:](IRMiLoLSLSingleScoreMO, "setPropertiesOfMiLoLSLSingleScoreMO:IRMiLoLSLSingleScoreDO:", v10, v9);

  return v10;
}

+ (void)setPropertiesOfMiLoLSLSingleScoreMO:(id)a3 IRMiLoLSLSingleScoreDO:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v5 = a4;
  v9 = a3;
  objc_msgSend(v5, "eventID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEventId:", v6);

  objc_msgSend(v5, "score");
  v8 = v7;

  objc_msgSend(v9, "setScore:", v8);
}

- (id)convert
{
  IRMiloLslSingleScoreDO *v3;
  double v4;
  double v5;
  void *v6;
  IRMiloLslSingleScoreDO *v7;

  v3 = [IRMiloLslSingleScoreDO alloc];
  -[IRMiLoLSLSingleScoreMO score](self, "score");
  v5 = v4;
  -[IRMiLoLSLSingleScoreMO eventId](self, "eventId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IRMiloLslSingleScoreDO initWithScore:eventID:](v3, "initWithScore:eventID:", v6, v5);

  return v7;
}

@end
