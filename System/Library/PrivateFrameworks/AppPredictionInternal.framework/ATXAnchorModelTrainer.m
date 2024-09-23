@implementation ATXAnchorModelTrainer

- (ATXAnchorModelTrainer)init
{
  void *v3;
  ATXAnchorModelTrainer *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXAnchorModelTrainer initWithXPCActivity:dataStoreWrapper:](self, "initWithXPCActivity:dataStoreWrapper:", 0, v3);

  return v4;
}

- (ATXAnchorModelTrainer)initWithXPCActivity:(id)a3
{
  id v4;
  void *v5;
  ATXAnchorModelTrainer *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[ATXAnchorModelTrainer initWithXPCActivity:dataStoreWrapper:](self, "initWithXPCActivity:dataStoreWrapper:", v4, v5);

  return v6;
}

- (ATXAnchorModelTrainer)initWithXPCActivity:(id)a3 dataStoreWrapper:(id)a4
{
  id v7;
  id v8;
  ATXAnchorModelTrainer *v9;
  ATXAnchorModelTrainer *v10;
  uint64_t v11;
  ATXAnchorModelHyperParameters *hyperparameters;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAnchorModelTrainer;
  v9 = -[ATXAnchorModelTrainer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xpcActivity, a3);
    objc_storeStrong((id *)&v10->_dataStoreWrapper, a4);
    +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    hyperparameters = v10->_hyperparameters;
    v10->_hyperparameters = (ATXAnchorModelHyperParameters *)v11;

  }
  return v10;
}

- (id)anchorsToIncludeInTraining
{
  void *v2;
  void *v3;

  -[ATXAnchorModelHyperParameters enabledAnchors](self->_hyperparameters, "enabledAnchors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __51__ATXAnchorModelTrainer_anchorsToIncludeInTraining__block_invoke(int a1, NSString *aClassName)
{
  NSClassFromString(aClassName);
  return (id)objc_opt_new();
}

- (void)train
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a2;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Anchor Model training has exceeded 15 minutes. Training completed in %.2f seconds.", (uint8_t *)&v2, 0xCu);
}

uint64_t __30__ATXAnchorModelTrainer_train__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "anchorWasRecentlyTrained:", v3);
  if (v4)
  {
    __atxlog_handle_anchor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Skipping training of anchor because it was recently trained. Anchor: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  return v4 ^ 1u;
}

- (BOOL)anchorWasRecentlyTrained:(id)a3
{
  id v4;
  id v5;
  double v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99D68]);
  -[ATXAnchorModelHyperParameters maxTrainingAgeInSecondsToConsiderForRetraining](self->_hyperparameters, "maxTrainingAgeInSecondsToConsiderForRetraining");
  v7 = (void *)objc_msgSend(v5, "initWithTimeIntervalSinceNow:", -v6);
  -[ATXAnchorModelDataStoreWrapperProtocol dateAnchorModelWasLastTrainedForAnchor:](self->_dataStoreWrapper, "dateAnchorModelWasLastTrainedForAnchor:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v13 = 138412546;
    v14 = v4;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "Anchor %@ was last trained on %@", (uint8_t *)&v13, 0x16u);
  }

  objc_msgSend(v8, "laterDate:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == v8;

  return v11;
}

- (id)trainAnchorModel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id obj;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_anchor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v4;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "Starting training for Anchor %@", buf, 0xCu);
  }

  v25 = (void *)objc_opt_new();
  v6 = v4;
  -[ATXAnchorModelDataStoreWrapperProtocol uniqueAnchorEventIdentifiersForAnchor:](self->_dataStoreWrapper, "uniqueAnchorEventIdentifiersForAnchor:", v4);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
        if (-[ATXXPCActivity didDefer](self->_xpcActivity, "didDefer"))
        {
          __atxlog_handle_anchor();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v6;
            _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "Deferring training of additional anchors in the middle of training anchor model for anchor %@ because XPC activity asked for deferral. Not going to process any other anchors for now.", buf, 0xCu);
          }

          v18 = obj;
          v21 = (id)MEMORY[0x1E0C9AA60];
          v20 = v25;
          goto LABEL_17;
        }
        v12 = (void *)objc_msgSend(v6, "copy");
        v13 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(v12, "setAnchorEventIdentifier:", v13);

        v14 = -[ATXAnchorModelPhase1Trainer initForAnchor:anchorModelDataStoreWrapper:]([ATXAnchorModelPhase1Trainer alloc], "initForAnchor:anchorModelDataStoreWrapper:", v12, self->_dataStoreWrapper);
        v15 = -[ATXAnchorModelPhase2Trainer initForAnchor:anchorModelDataStoreWrapper:]([ATXAnchorModelPhase2Trainer alloc], "initForAnchor:anchorModelDataStoreWrapper:", v12, self->_dataStoreWrapper);
        v16 = -[ATXAnchorModelPhase3Trainer initForAnchor:anchorModelDataStoreWrapper:]([ATXAnchorModelPhase3Trainer alloc], "initForAnchor:anchorModelDataStoreWrapper:", v12, self->_dataStoreWrapper);
        -[ATXAnchorModelTrainer trainAnchorModel:phase1Trainer:phase2Trainer:phase3Trainer:](self, "trainAnchorModel:phase1Trainer:phase2Trainer:phase3Trainer:", v12, v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObjectsFromArray:", v17);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v8)
        continue;
      break;
    }
  }
  v18 = obj;

  __atxlog_handle_anchor();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_INFO, "Finished training for Anchor %@.", buf, 0xCu);
  }

  v20 = v25;
  v21 = v25;
LABEL_17:

  return v21;
}

- (id)trainAnchorModel:(id)a3 phase1Trainer:(id)a4 phase2Trainer:(id)a5 phase3Trainer:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  int v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  __atxlog_handle_anchor();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "anchorEventIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412546;
    v25 = (uint64_t)v10;
    v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "Starting training of Anchor Model for anchor: %@, event identifier: %@...", (uint8_t *)&v24, 0x16u);

  }
  if (-[ATXXPCActivity didDefer](self->_xpcActivity, "didDefer"))
  {
    __atxlog_handle_anchor();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = (uint64_t)v10;
      _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "Deferring training of additional anchors in the middle of training anchor model for anchor %@ because XPC activity asked for deferral. Not going to process any other anchors for now.", (uint8_t *)&v24, 0xCu);
    }
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v11, "trainPhase1");
    v16 = objc_claimAutoreleasedReturnValue();
    __atxlog_handle_anchor();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "anchorEventIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[NSObject count](v16, "count");
      v24 = 138412802;
      v25 = (uint64_t)v10;
      v26 = 2112;
      v27 = v19;
      v28 = 2048;
      v29 = v20;
      _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "Finished training Anchor Model Phase 1 for anchor: %@, event identifier: %@. Completing training for each of %lu candidates...", (uint8_t *)&v24, 0x20u);

    }
    -[ATXAnchorModelTrainer trainModelPerCandidateSelectedInPhase1:phase2Trainer:phase3Trainer:phase1Results:](self, "trainModelPerCandidateSelectedInPhase1:phase2Trainer:phase3Trainer:phase1Results:", v10, v12, v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_anchor();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v17, "count");
      v24 = 134217984;
      v25 = v22;
      _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "Done training. Returning %lu training results.", (uint8_t *)&v24, 0xCu);
    }

  }
  return v17;
}

- (id)trainModelPerCandidateSelectedInPhase1:(id)a3 phase2Trainer:(id)a4 phase3Trainer:(id)a5 phase1Results:(id)a6
{
  ATXAnchorModelTrainingResult *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  ATXAnchorModelTrainingResult *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  ATXAnchorModelTrainingResult *v24;
  ATXAnchorModelTrainingResult *v25;
  ATXAnchorModelTrainingResult *v26;
  int v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  ATXAnchorModelTrainingResult *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = (ATXAnchorModelTrainingResult *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[ATXXPCActivity didDefer](self->_xpcActivity, "didDefer"))
  {
    __atxlog_handle_anchor();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v10;
      _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "Deferring training of additional anchors in the middle of training anchor model for anchor %@ because XPC activity asked for deferral. Not going to process any other anchors for now.", buf, 0xCu);
    }

    v15 = (id)objc_opt_new();
  }
  else
  {
    v16 = (void *)objc_opt_new();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v13;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v43)
    {
      v42 = *(_QWORD *)v46;
      v37 = v12;
      v38 = v11;
      v36 = v13;
      v39 = v16;
LABEL_7:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v46 != v42)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x1CAA48B6C]();
        if (-[ATXXPCActivity didDefer](self->_xpcActivity, "didDefer"))
        {
          __atxlog_handle_anchor();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v51 = v10;
            _os_log_impl(&dword_1C9A3B000, v32, OS_LOG_TYPE_DEFAULT, "Deferring training of additional anchors in the middle of training anchor model for anchor %@ because XPC activity asked for deferral. Not going to process any other anchors for now.", buf, 0xCu);
          }

          v15 = (id)objc_opt_new();
          goto LABEL_41;
        }
        objc_msgSend(v18, "candidateId");
        v20 = (ATXAnchorModelTrainingResult *)objc_claimAutoreleasedReturnValue();
        -[ATXAnchorModelTrainer candidateTypeFromCandidateId:](self, "candidateTypeFromCandidateId:", v20);
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = v21;
          if (-[ATXXPCActivity didDefer](self->_xpcActivity, "didDefer"))
          {
            __atxlog_handle_anchor();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v51 = v10;
              _os_log_impl(&dword_1C9A3B000, v33, OS_LOG_TYPE_DEFAULT, "Deferring training of additional anchors in the middle of training anchor model for anchor %@ because XPC activity asked for deferral. Not going to process any other anchors for now.", buf, 0xCu);
            }

            v15 = (id)objc_opt_new();
            goto LABEL_40;
          }
          objc_msgSend(v11, "trainPhase2ForCandidate:candidateType:", v20, v22);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44)
          {
            if (-[ATXXPCActivity didDefer](self->_xpcActivity, "didDefer"))
            {
              __atxlog_handle_anchor();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v51 = v10;
                _os_log_impl(&dword_1C9A3B000, v34, OS_LOG_TYPE_DEFAULT, "Deferring training of additional anchors in the middle of training anchor model for anchor %@ because XPC activity asked for deferral. Not going to process any other anchors for now.", buf, 0xCu);
              }

              v15 = (id)objc_opt_new();
LABEL_40:

LABEL_41:
              objc_autoreleasePoolPop(v19);

              v13 = v36;
              v16 = v39;
              goto LABEL_42;
            }
            objc_msgSend(v12, "trainPhase3ForCandidate:", v20);
            v23 = objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              v24 = v10;
              v40 = (void *)v23;
              v25 = v10;
              v26 = -[ATXAnchorModelTrainingResult initWithAnchor:candidateId:candidateType:phase1TrainingResult:candidateClassifier:candidateClassifierType:offsetFromAnchorToShowPrediction:]([ATXAnchorModelTrainingResult alloc], "initWithAnchor:candidateId:candidateType:phase1TrainingResult:candidateClassifier:candidateClassifierType:offsetFromAnchorToShowPrediction:", v10, v20, v22, v18, v44, objc_msgSend(v44, "classifierType"), v23);
              objc_msgSend(v39, "addObject:", v26);
              v27 = -[ATXXPCActivity didDefer](self->_xpcActivity, "didDefer");
              __atxlog_handle_anchor();
              v28 = objc_claimAutoreleasedReturnValue();
              v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
              if (v27)
              {
                v10 = v24;
                if (v29)
                {
                  *(_DWORD *)buf = 138412290;
                  v51 = v25;
                  _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_DEFAULT, "Deferring training of additional anchors in the middle of training anchor model for anchor %@ because XPC activity asked for deferral. Not going to process any other anchors for now.", buf, 0xCu);
                }

                v15 = (id)objc_opt_new();
                v12 = v37;
                v11 = v38;
                goto LABEL_41;
              }
              if (v29)
              {
                *(_DWORD *)buf = 138412290;
                v51 = v26;
                _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_DEFAULT, "Added training result: %@", buf, 0xCu);
              }

              v10 = v24;
              v12 = v37;
              v11 = v38;
            }
            else
            {
              __atxlog_handle_anchor();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v51 = v20;
                _os_log_error_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_ERROR, "Could not compute the offset seconds from the anchor to show the show the prediction for candidate: %@. Skipping the candidate.", buf, 0xCu);
              }

            }
          }
          else
          {
            __atxlog_handle_anchor();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v51 = v20;
              _os_log_error_impl(&dword_1C9A3B000, v30, OS_LOG_TYPE_ERROR, "Could not train a classifier for candidate: %@. Skipping the candidate.", buf, 0xCu);
            }

          }
        }
        else
        {
          __atxlog_handle_anchor();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v51 = v20;
            _os_log_error_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_ERROR, "Could not fetch the candidateType for candidate: %@. Skipping the candidate.", buf, 0xCu);
          }
        }

        objc_autoreleasePoolPop(v19);
        if (v43 == ++v17)
        {
          v13 = v36;
          v16 = v39;
          v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          if (v43)
            goto LABEL_7;
          break;
        }
      }
    }

    v15 = v16;
LABEL_42:

  }
  return v15;
}

- (id)candidateTypeFromCandidateId:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "candidateTypeForCandidateId:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingStartDate, 0);
  objc_storeStrong((id *)&self->_hyperparameters, 0);
  objc_storeStrong((id *)&self->_dataStoreWrapper, 0);
  objc_storeStrong((id *)&self->_xpcActivity, 0);
}

@end
