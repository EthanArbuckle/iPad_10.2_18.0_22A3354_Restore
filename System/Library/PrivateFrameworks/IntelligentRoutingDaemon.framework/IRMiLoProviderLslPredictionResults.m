@implementation IRMiLoProviderLslPredictionResults

- (IRMiLoProviderLslPredictionResults)initWithMiloPrediction:(id)a3 withMiLoServiceQuality:(int64_t)a4 withMiLoServiceQualityReasonBitmap:(int64_t)a5
{
  id v8;
  IRMiLoProviderLslPredictionResults *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IRMiLoProviderLslPredictionResults;
  v9 = -[IRMiLoProviderLslPredictionResults init](&v16, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "requestIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRMiLoProviderLslPredictionResults setPredictionId:](v9, "setPredictionId:", v10);

    objc_msgSend(v8, "places");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "compactMap:", &__block_literal_global_12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRMiLoProviderLslPredictionResults setPredictedEvents:](v9, "setPredictedEvents:", v12);

    -[IRMiLoProviderLslPredictionResults setMiLoServiceQuality:](v9, "setMiLoServiceQuality:", a4);
    -[IRMiLoProviderLslPredictionResults setMiLoServiceQualityReasonBitmap:](v9, "setMiLoServiceQualityReasonBitmap:", a5);
    objc_msgSend(v8, "time");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRMiLoProviderLslPredictionResults setPredictionTime:](v9, "setPredictionTime:", v13);

    -[IRMiLoProviderLslPredictionResults setConfidence:](v9, "setConfidence:", objc_msgSend(v8, "confidence"));
    objc_msgSend(v8, "confidenceReasons");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRMiLoProviderLslPredictionResults setConfidenceReasonBitmap:](v9, "setConfidenceReasonBitmap:", -[IRMiLoProviderLslPredictionResults _bitmapFromConfidenceReasonArray:](v9, "_bitmapFromConfidenceReasonArray:", v14));

  }
  return v9;
}

IRMiLoProviderLslSingleEventScore *__119__IRMiLoProviderLslPredictionResults_initWithMiloPrediction_withMiLoServiceQuality_withMiLoServiceQualityReasonBitmap___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  IRMiLoProviderLslSingleEventScore *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = objc_alloc_init(IRMiLoProviderLslSingleEventScore);
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRMiLoProviderLslSingleEventScore setEventId:](v3, "setEventId:", v4);

  objc_msgSend(v2, "score");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[IRMiLoProviderLslSingleEventScore setScore:](v3, "setScore:", v5);
  return v3;
}

- (int64_t)_bitmapFromConfidenceReasonArray:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "confidenceReasonEnum");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSUUID)predictionId
{
  return self->_predictionId;
}

- (void)setPredictionId:(id)a3
{
  objc_storeStrong((id *)&self->_predictionId, a3);
}

- (int64_t)miLoServiceQuality
{
  return self->_miLoServiceQuality;
}

- (void)setMiLoServiceQuality:(int64_t)a3
{
  self->_miLoServiceQuality = a3;
}

- (int64_t)miLoServiceQualityReasonBitmap
{
  return self->_miLoServiceQualityReasonBitmap;
}

- (void)setMiLoServiceQualityReasonBitmap:(int64_t)a3
{
  self->_miLoServiceQualityReasonBitmap = a3;
}

- (NSArray)predictedEvents
{
  return self->_predictedEvents;
}

- (void)setPredictedEvents:(id)a3
{
  objc_storeStrong((id *)&self->_predictedEvents, a3);
}

- (NSDate)predictionTime
{
  return self->_predictionTime;
}

- (void)setPredictionTime:(id)a3
{
  objc_storeStrong((id *)&self->_predictionTime, a3);
}

- (int64_t)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(int64_t)a3
{
  self->_confidence = a3;
}

- (int64_t)confidenceReasonBitmap
{
  return self->_confidenceReasonBitmap;
}

- (void)setConfidenceReasonBitmap:(int64_t)a3
{
  self->_confidenceReasonBitmap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionTime, 0);
  objc_storeStrong((id *)&self->_predictedEvents, 0);
  objc_storeStrong((id *)&self->_predictionId, 0);
}

@end
