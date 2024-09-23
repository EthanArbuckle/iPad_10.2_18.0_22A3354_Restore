@implementation IRMiLoLSLPredictionMO

+ (id)miLoLSLPredictionMOWithMiLoLSLPredictionDO:(id)a3 replayEvent:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  IRMiLoLSLPredictionMO *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[IRMiLoLSLPredictionMO initWithContext:]([IRMiLoLSLPredictionMO alloc], "initWithContext:", v7);
  -[IRMiLoLSLPredictionMO setReplayEvent:](v10, "setReplayEvent:", v8);

  +[IRMiLoLSLPredictionMO setPropertiesOfMiLoLSLPredictionMO:withMiLoLSLPredictionDO:inManagedObjectContext:](IRMiLoLSLPredictionMO, "setPropertiesOfMiLoLSLPredictionMO:withMiLoLSLPredictionDO:inManagedObjectContext:", v10, v9, v7);
  return v10;
}

+ (void)setPropertiesOfMiLoLSLPredictionMO:(id)a3 withMiLoLSLPredictionDO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "predictionId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredictionId:", v10);

  objc_msgSend(v7, "setMiLoServiceQuality:", objc_msgSend(v9, "miLoServiceQuality"));
  objc_msgSend(v7, "setMiLoServiceQualityReasonBitmap:", objc_msgSend(v9, "miLoServiceQualityReasonBitmap"));
  objc_msgSend(v9, "scores");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __107__IRMiLoLSLPredictionMO_setPropertiesOfMiLoLSLPredictionMO_withMiLoLSLPredictionDO_inManagedObjectContext___block_invoke;
  v23[3] = &unk_251044AB8;
  v13 = v7;
  v24 = v13;
  v14 = v8;
  v25 = v14;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v23);

  objc_msgSend(v9, "nearbyDevices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __107__IRMiLoLSLPredictionMO_setPropertiesOfMiLoLSLPredictionMO_withMiLoLSLPredictionDO_inManagedObjectContext___block_invoke_2;
  v20[3] = &unk_251044AE0;
  v21 = v13;
  v22 = v14;
  v16 = v14;
  v19 = v13;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v20);

  objc_msgSend(v9, "predictionTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPredictionTime:", v17);

  objc_msgSend(v19, "setConfidence:", objc_msgSend(v9, "confidence"));
  v18 = objc_msgSend(v9, "confidenceReasonBitmap");

  objc_msgSend(v19, "setConfidenceReasonBitmap:", v18);
}

void __107__IRMiLoLSLPredictionMO_setPropertiesOfMiLoLSLPredictionMO_withMiLoLSLPredictionDO_inManagedObjectContext___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[IRMiLoLSLSingleScoreMO miLoLSLSingleScoreMOWithMiLoLSLSingleScoreDO:miloPrediction:inManagedObjectContext:](IRMiLoLSLSingleScoreMO, "miLoLSLSingleScoreMOWithMiLoLSLSingleScoreDO:miloPrediction:inManagedObjectContext:", a2, v2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addScoresObject:", v3);

}

void __107__IRMiLoLSLPredictionMO_setPropertiesOfMiLoLSLPredictionMO_withMiLoLSLPredictionDO_inManagedObjectContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[IRMiLoNearbyDeviceMO miLoNearbyDeviceMOWithMiLoNearbyDeviceDO:miloPrediction:inManagedObjectContext:](IRMiLoNearbyDeviceMO, "miLoNearbyDeviceMOWithMiLoNearbyDeviceDO:miloPrediction:inManagedObjectContext:", a2, v2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addNearbyDevicesObject:", v3);

}

- (id)convert
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  IRMiloLslPredictionDO *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  IRMiloLslPredictionDO *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[IRMiLoLSLPredictionMO scores](self, "scores");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __32__IRMiLoLSLPredictionMO_convert__block_invoke;
  v24[3] = &unk_251044B08;
  v25 = v3;
  v6 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v24);

  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[IRMiLoLSLPredictionMO nearbyDevices](self, "nearbyDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v5;
  v20 = 3221225472;
  v21 = __32__IRMiLoLSLPredictionMO_convert__block_invoke_2;
  v22 = &unk_251044B30;
  v23 = v7;
  v9 = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v19);

  v10 = [IRMiloLslPredictionDO alloc];
  -[IRMiLoLSLPredictionMO predictionId](self, "predictionId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IRMiLoLSLPredictionMO miLoServiceQuality](self, "miLoServiceQuality");
  v13 = -[IRMiLoLSLPredictionMO miLoServiceQualityReasonBitmap](self, "miLoServiceQualityReasonBitmap");
  -[IRMiLoLSLPredictionMO predictionTime](self, "predictionTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[IRMiLoLSLPredictionMO confidence](self, "confidence");
  v16 = -[IRMiLoLSLPredictionMO confidenceReasonBitmap](self, "confidenceReasonBitmap");
  v17 = -[IRMiloLslPredictionDO initWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:](v10, "initWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:", v11, v12, v13, v6, v9, v14, v15, v16, v19, v20, v21, v22);

  return v17;
}

void __32__IRMiLoLSLPredictionMO_convert__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "convert");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __32__IRMiLoLSLPredictionMO_convert__block_invoke_2(uint64_t a1, void *a2)
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
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRMiLoLSLPredictionMO"));
}

@end
