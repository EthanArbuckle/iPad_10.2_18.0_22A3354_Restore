@implementation CHGroupingAndRecognitionResults

- (CHGroupingAndRecognitionResults)initWithGroupingResult:(id)a3 recognitionResultsByGroupID:(id)a4 strokeClassificationResult:(id)a5 previousProcessedStrokeGroupingResult:(id)a6 strokeGroupReplacements:(id)a7
{
  id v13;
  id v14;
  id v15;
  CHGroupingAndRecognitionResults *v16;
  CHGroupingAndRecognitionResults *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableSet *intermediateStrokeGroups;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSMutableDictionary *intermediateRecognitionResults;
  id v39;
  id v40;
  objc_super v41;

  v13 = a3;
  v14 = a4;
  v40 = a5;
  v39 = a6;
  v15 = a7;
  v41.receiver = self;
  v41.super_class = (Class)CHGroupingAndRecognitionResults;
  v16 = -[CHGroupingAndRecognitionResults init](&v41, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_strokeGroupingResult, a3);
    objc_storeStrong((id *)&v17->_recognitionResultsByGroupID, a4);
    objc_storeStrong((id *)&v17->_previousProcessedStrokeGroupingResult, a6);
    objc_storeStrong((id *)&v17->_strokeClassificationResult, a5);
    objc_storeStrong((id *)&v17->_strokeGroupReplacements, a7);
    objc_msgSend_strokeGroups(v13, v18, v19, v20, v21, v22, v39, v40);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_mutableCopy(v23, v24, v25, v26, v27, v28);
    intermediateStrokeGroups = v17->__intermediateStrokeGroups;
    v17->__intermediateStrokeGroups = (NSMutableSet *)v29;

    v36 = objc_msgSend_mutableCopy(v14, v31, v32, v33, v34, v35);
    intermediateRecognitionResults = v17->__intermediateRecognitionResults;
    v17->__intermediateRecognitionResults = (NSMutableDictionary *)v36;

  }
  return v17;
}

- (CHStrokeGroupingResult)strokeGroupingResult
{
  return self->_strokeGroupingResult;
}

- (NSDictionary)recognitionResultsByGroupID
{
  return self->_recognitionResultsByGroupID;
}

- (CHStrokeClassificationResult)strokeClassificationResult
{
  return self->_strokeClassificationResult;
}

- (CHStrokeGroupingResult)previousProcessedStrokeGroupingResult
{
  return self->_previousProcessedStrokeGroupingResult;
}

- (NSSet)strokeGroupReplacements
{
  return self->_strokeGroupReplacements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__intermediateRecognitionResults, 0);
  objc_storeStrong((id *)&self->__intermediateStrokeGroups, 0);
  objc_storeStrong((id *)&self->_strokeGroupReplacements, 0);
  objc_storeStrong((id *)&self->_previousProcessedStrokeGroupingResult, 0);
  objc_storeStrong((id *)&self->_strokeClassificationResult, 0);
  objc_storeStrong((id *)&self->_recognitionResultsByGroupID, 0);
  objc_storeStrong((id *)&self->_strokeGroupingResult, 0);
}

@end
