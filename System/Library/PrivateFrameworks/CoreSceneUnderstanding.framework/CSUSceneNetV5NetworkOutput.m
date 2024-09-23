@implementation CSUSceneNetV5NetworkOutput

- (CSUSceneNetV5NetworkOutput)initWithScenePrint:(id)a3 sceneClassificationLikelihoods:(id)a4 aestheticsAttributeScores:(id)a5 aestheticsGlobalScores:(id)a6 detectionScoreHeatMap:(id)a7 detectionCoordinateOffsetMap:(id)a8 saliencyAttentionMap:(id)a9 saliencyObjectnessMap:(id)a10 fingerprintEmbedding:(id)a11 entityNetClassificationLikelihoods:(id)a12
{
  id v18;
  id v19;
  id v20;
  CSUSceneNetV5NetworkOutput *v21;
  CSUSceneNetV5NetworkOutput *v22;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v32 = a3;
  v31 = a4;
  v30 = a5;
  v25 = a6;
  v29 = a6;
  v28 = a7;
  v27 = a8;
  v26 = a9;
  v18 = a10;
  v19 = a11;
  v20 = a12;
  v33.receiver = self;
  v33.super_class = (Class)CSUSceneNetV5NetworkOutput;
  v21 = -[CSUSceneNetV5NetworkOutput init](&v33, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_scenePrint, a3);
    objc_storeStrong((id *)&v22->_sceneClassificationLikelihoods, a4);
    objc_storeStrong((id *)&v22->_aestheticsAttributeScores, a5);
    objc_storeStrong((id *)&v22->_aestheticsGlobalScores, v25);
    objc_storeStrong((id *)&v22->_detectionScoreHeatMap, a7);
    objc_storeStrong((id *)&v22->_detectionCoordinateOffsetMap, a8);
    objc_storeStrong((id *)&v22->_saliencyAttentionMap, a9);
    objc_storeStrong((id *)&v22->_saliencyObjectnessMap, a10);
    objc_storeStrong((id *)&v22->_fingerprintEmbedding, a11);
    objc_storeStrong((id *)&v22->_entityNetClassificationLikelihoods, a12);
  }

  return v22;
}

- (CSUBuffer)scenePrint
{
  return (CSUBuffer *)objc_getProperty(self, a2, 8, 1);
}

- (CSUBuffer)sceneClassificationLikelihoods
{
  return (CSUBuffer *)objc_getProperty(self, a2, 16, 1);
}

- (CSUBuffer)aestheticsAttributeScores
{
  return (CSUBuffer *)objc_getProperty(self, a2, 24, 1);
}

- (CSUBuffer)aestheticsGlobalScores
{
  return (CSUBuffer *)objc_getProperty(self, a2, 32, 1);
}

- (CSUBuffer)detectionScoreHeatMap
{
  return (CSUBuffer *)objc_getProperty(self, a2, 40, 1);
}

- (CSUBuffer)detectionCoordinateOffsetMap
{
  return (CSUBuffer *)objc_getProperty(self, a2, 48, 1);
}

- (CSUBuffer)saliencyAttentionMap
{
  return (CSUBuffer *)objc_getProperty(self, a2, 56, 1);
}

- (CSUBuffer)saliencyObjectnessMap
{
  return (CSUBuffer *)objc_getProperty(self, a2, 64, 1);
}

- (CSUBuffer)fingerprintEmbedding
{
  return (CSUBuffer *)objc_getProperty(self, a2, 72, 1);
}

- (CSUBuffer)entityNetClassificationLikelihoods
{
  return (CSUBuffer *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityNetClassificationLikelihoods, 0);
  objc_storeStrong((id *)&self->_fingerprintEmbedding, 0);
  objc_storeStrong((id *)&self->_saliencyObjectnessMap, 0);
  objc_storeStrong((id *)&self->_saliencyAttentionMap, 0);
  objc_storeStrong((id *)&self->_detectionCoordinateOffsetMap, 0);
  objc_storeStrong((id *)&self->_detectionScoreHeatMap, 0);
  objc_storeStrong((id *)&self->_aestheticsGlobalScores, 0);
  objc_storeStrong((id *)&self->_aestheticsAttributeScores, 0);
  objc_storeStrong((id *)&self->_sceneClassificationLikelihoods, 0);
  objc_storeStrong((id *)&self->_scenePrint, 0);
}

@end
