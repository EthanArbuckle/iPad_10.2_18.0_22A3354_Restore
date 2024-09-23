@implementation ATXCandidateRelevanceModelDataStoreTrainingResult

- (ATXCandidateRelevanceModelDataStoreTrainingResult)initWithModel:(id)a3 candidate:(id)a4 featurizationManager:(id)a5 modelUUID:(id)a6 datasetMetadata:(id)a7 clientModelName:(id)a8 trainDate:(id)a9 isVerified:(BOOL)a10
{
  id v17;
  id v18;
  ATXCandidateRelevanceModelDataStoreTrainingResult *v19;
  ATXCandidateRelevanceModelDataStoreTrainingResult *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v17 = a8;
  v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)ATXCandidateRelevanceModelDataStoreTrainingResult;
  v19 = -[ATXCandidateRelevanceModelDataStoreTrainingResult init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_model, a3);
    objc_storeStrong((id *)&v20->_candidate, a4);
    objc_storeStrong((id *)&v20->_featurizationManager, a5);
    objc_storeStrong((id *)&v20->_modelUUID, a6);
    objc_storeStrong((id *)&v20->_datasetMetadata, a7);
    objc_storeStrong((id *)&v20->_clientModelName, a8);
    objc_storeStrong((id *)&v20->_trainDate, a9);
    v20->_isVerified = a10;
  }

  return v20;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v4, "setDateStyle:", 4);
  objc_msgSend(v4, "setTimeStyle:", 4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
  objc_msgSend(v4, "setLocale:", v5);

  -[ATXCandidate identifier](self->_candidate, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Candidate Identifier: %@\n"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("Client Model Name: %@\n"), self->_clientModelName);
  objc_msgSend(v3, "appendFormat:", CFSTR("Model UUID: %@\n"), self->_modelUUID);
  if (self->_isVerified)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Verified: %@\n"), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), self->_datasetMetadata);
  objc_msgSend(v4, "stringFromDate:", self->_trainDate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Date Trained: %@\n"), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), self->_model);
  -[ATXCandidateRelevanceModel featureImportanceDescriptionForFeaturizationManager:](self->_model, "featureImportanceDescriptionForFeaturizationManager:", self->_featurizationManager);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Feature Importances: \n%@\n"), v9);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXCandidateRelevanceModelDataStoreTrainingResult *v4;
  ATXCandidateRelevanceModelDataStoreTrainingResult *v5;
  BOOL v6;

  v4 = (ATXCandidateRelevanceModelDataStoreTrainingResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXCandidateRelevanceModelDataStoreTrainingResult isEqualToATXCandidateRelevanceModelDataStoreTrainingResult:](self, "isEqualToATXCandidateRelevanceModelDataStoreTrainingResult:", v5);

  return v6;
}

- (BOOL)isEqualToATXCandidateRelevanceModelDataStoreTrainingResult:(id)a3
{
  id *v4;
  ATXCandidateRelevanceModel *model;
  ATXCandidateRelevanceModel *v6;
  ATXCandidateRelevanceModel *v7;
  ATXCandidateRelevanceModel *v8;
  char v9;
  ATXCandidate *candidate;
  ATXCandidate *v11;
  ATXCandidate *v12;
  ATXCandidate *v13;
  BOOL v14;
  ATXCandidateRelevanceModelFeaturizationManager *featurizationManager;
  ATXCandidateRelevanceModelFeaturizationManager *v16;
  ATXCandidateRelevanceModelFeaturizationManager *v17;
  ATXCandidateRelevanceModelFeaturizationManager *v18;
  BOOL v19;
  NSUUID *modelUUID;
  NSUUID *v21;
  NSUUID *v22;
  NSUUID *v23;
  char v24;
  ATXCandidateRelevanceModelDataStoreDatasetMetadata *datasetMetadata;
  ATXCandidateRelevanceModelDataStoreDatasetMetadata *v26;
  ATXCandidateRelevanceModelDataStoreDatasetMetadata *v27;
  ATXCandidateRelevanceModelDataStoreDatasetMetadata *v28;
  BOOL v29;
  NSString *clientModelName;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  char v34;
  char v35;
  NSDate *v37;
  NSDate *v38;

  v4 = (id *)a3;
  model = self->_model;
  v6 = (ATXCandidateRelevanceModel *)v4[2];
  if (model == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = model;
    v9 = -[ATXCandidateRelevanceModel isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_23;
  }
  candidate = self->_candidate;
  v11 = (ATXCandidate *)v4[3];
  if (candidate == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = candidate;
    v14 = -[ATXCandidate isEqual:](v13, "isEqual:", v12);

    if (!v14)
      goto LABEL_23;
  }
  featurizationManager = self->_featurizationManager;
  v16 = (ATXCandidateRelevanceModelFeaturizationManager *)v4[4];
  if (featurizationManager == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = featurizationManager;
    v19 = -[ATXCandidateRelevanceModelFeaturizationManager isEqual:](v18, "isEqual:", v17);

    if (!v19)
      goto LABEL_23;
  }
  modelUUID = self->_modelUUID;
  v21 = (NSUUID *)v4[5];
  if (modelUUID == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = modelUUID;
    v24 = -[NSUUID isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_23;
  }
  datasetMetadata = self->_datasetMetadata;
  v26 = (ATXCandidateRelevanceModelDataStoreDatasetMetadata *)v4[6];
  if (datasetMetadata == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = datasetMetadata;
    v29 = -[ATXCandidateRelevanceModelDataStoreDatasetMetadata isEqual:](v28, "isEqual:", v27);

    if (!v29)
      goto LABEL_23;
  }
  clientModelName = self->_clientModelName;
  v31 = (NSString *)v4[7];
  if (clientModelName == v31)
  {

  }
  else
  {
    v32 = v31;
    v33 = clientModelName;
    v34 = -[NSString isEqual:](v33, "isEqual:", v32);

    if ((v34 & 1) == 0)
    {
LABEL_23:
      v35 = 0;
      goto LABEL_24;
    }
  }
  v37 = self->_trainDate;
  v38 = v37;
  if (v37 == v4[8])
    v35 = 1;
  else
    v35 = -[NSDate isEqual:](v37, "isEqual:");

LABEL_24:
  return v35;
}

- (ATXCandidateRelevanceModel)model
{
  return self->_model;
}

- (ATXCandidate)candidate
{
  return self->_candidate;
}

- (ATXCandidateRelevanceModelFeaturizationManager)featurizationManager
{
  return self->_featurizationManager;
}

- (NSUUID)modelUUID
{
  return self->_modelUUID;
}

- (ATXCandidateRelevanceModelDataStoreDatasetMetadata)datasetMetadata
{
  return self->_datasetMetadata;
}

- (NSString)clientModelName
{
  return self->_clientModelName;
}

- (NSDate)trainDate
{
  return self->_trainDate;
}

- (BOOL)isVerified
{
  return self->_isVerified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainDate, 0);
  objc_storeStrong((id *)&self->_clientModelName, 0);
  objc_storeStrong((id *)&self->_datasetMetadata, 0);
  objc_storeStrong((id *)&self->_modelUUID, 0);
  objc_storeStrong((id *)&self->_featurizationManager, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
