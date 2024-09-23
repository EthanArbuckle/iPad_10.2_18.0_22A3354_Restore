@implementation ATXAppPredictorPredictionChunks

- (ATXAppPredictorPredictionChunks)initWithPredictionSetChunk:(id)a3 feedbackStateChunk:(id)a4
{
  id v7;
  id v8;
  void *v9;
  ATXAppPredictorPredictionChunks *v10;
  ATXAppPredictorPredictionChunks *v11;
  id *p_isa;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)ATXAppPredictorPredictionChunks;
    v11 = -[ATXAppPredictorPredictionChunks init](&v14, sel_init);
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_predictionSetChunk, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v10 = self;
  }

  return v10;
}

- (id)chunkArray
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self->_predictionSetChunk);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_feedbackStateChunk)
    objc_msgSend(v3, "addObject:");
  return v4;
}

- (id)joinChunks
{
  void *v2;
  void *v3;

  -[ATXAppPredictorPredictionChunks chunkArray](self, "chunkArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ATXCacheFileJoinChunks();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSData)predictionSetChunk
{
  return self->_predictionSetChunk;
}

- (void)setPredictionSetChunk:(id)a3
{
  objc_storeStrong((id *)&self->_predictionSetChunk, a3);
}

- (NSData)feedbackStateChunk
{
  return self->_feedbackStateChunk;
}

- (void)setFeedbackStateChunk:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackStateChunk, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackStateChunk, 0);
  objc_storeStrong((id *)&self->_predictionSetChunk, 0);
}

@end
