@implementation ATXAnchorModelModePredictionPostProcessor

- (ATXAnchorModelModePredictionPostProcessor)initWithAnchorModelPrediction:(id)a3
{
  id v5;
  ATXAnchorModelModePredictionPostProcessor *v6;
  ATXAnchorModelModePredictionPostProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXAnchorModelModePredictionPostProcessor;
  v6 = -[ATXAnchorModelModePredictionPostProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_anchorModelPrediction, a3);

  return v7;
}

- (BOOL)shouldPredictAnchorModelModePrediction
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BMStream *v9;
  BMStream *modeStream;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;

  -[ATXAnchorModelPrediction candidateType](self->_anchorModelPrediction, "candidateType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("mode"));

  if (v4)
  {
    -[ATXAnchorModelPrediction candidateId](self->_anchorModelPrediction, "candidateId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXAnchorModelDataStoreWrapper modeDetailsFromModeCandidateId:](ATXAnchorModelDataStoreWrapper, "modeDetailsFromModeCandidateId:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!self->_modeStream)
    {
      BiomeLibrary();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UserFocus");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ComputedMode");
      v9 = (BMStream *)objc_claimAutoreleasedReturnValue();
      modeStream = self->_modeStream;
      self->_modeStream = v9;

    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80E48]), "initWithStream:", self->_modeStream);
    objc_msgSend(v11, "currentModeUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isStart"))
    {
      if (v13)
      {
        objc_msgSend(v6, "modeUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v13);

        if ((v15 & 1) != 0)
        {
LABEL_11:
          LOBYTE(v4) = 0;
          goto LABEL_12;
        }
      }
    }
    else if (v13)
    {
      objc_msgSend(v6, "modeUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v13);

      if (!v17)
        goto LABEL_11;
    }
    LOBYTE(v4) = 1;
LABEL_12:

  }
  return v4;
}

- (NSArray)serializedTriggers
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[ATXAnchorModelPrediction candidateClassifier](self->_anchorModelPrediction, "candidateClassifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "classifierType");

  if (v4 == 3)
  {
    -[ATXAnchorModelPrediction candidateClassifier](self->_anchorModelPrediction, "candidateClassifier");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject tree](v5, "tree");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      __atxlog_handle_modes();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "ATXAnchorModelModePredictionPostProcessor: GamePlayKitDecisionTree is not empty, not creating any triggers";
LABEL_11:
        _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
      }
    }
    else
    {
      -[ATXAnchorModelPrediction offsetFromAnchorToShowPrediction](self->_anchorModelPrediction, "offsetFromAnchorToShowPrediction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "startSecondsAfterAnchor");
      v12 = v11;

      if (v12 <= 900.0)
      {
        -[ATXAnchorModelModePredictionPostProcessor _triggerForAnchorType](self, "_triggerForAnchorType");
        v14 = objc_claimAutoreleasedReturnValue();
        v7 = v14;
        if (v14)
        {
          v17 = v14;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
          v15 = objc_claimAutoreleasedReturnValue();
          ATXSerializeTriggers();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          __atxlog_handle_modes();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            -[ATXAnchorModelPrediction anchorType](self->_anchorModelPrediction, "anchorType");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v19 = v16;
            _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "ATXAnchorModelModePredictionPostProcessor: No valid trigger for anchor type: %@", buf, 0xCu);

          }
          v9 = 0;
        }

        goto LABEL_13;
      }
      __atxlog_handle_modes();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "ATXAnchorModelModePredictionPostProcessor: AnchorModelPrediction offset startSecondsAfterAnchor is too long"
             " after anchor, not creating any triggers";
        goto LABEL_11;
      }
    }
    v9 = 0;
LABEL_13:

    goto LABEL_14;
  }
  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXAnchorModelModePredictionPostProcessor: classifier is not of type GamePlayKitDecisionTree, not creating any triggers", buf, 2u);
  }
  v9 = 0;
LABEL_14:

  return (NSArray *)v9;
}

- (id)_triggerForAnchorType
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  id v13;
  uint64_t v14;
  objc_class *v15;
  id v16;
  id v17;

  -[ATXAnchorModelPrediction anchorType](self->_anchorModelPrediction, "anchorType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[ATXAnchor stringToAnchorType:](ATXAnchor, "stringToAnchorType:", v3);

  v5 = 0;
  switch(v4)
  {
    case 1:
      -[ATXAnchorModelPrediction anchorEvent](self->_anchorModelPrediction, "anchorEvent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)MEMORY[0x1E0D80D60];
      goto LABEL_4;
    case 2:
      -[ATXAnchorModelPrediction anchorEvent](self->_anchorModelPrediction, "anchorEvent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)MEMORY[0x1E0D80D68];
LABEL_4:
      v8 = [v7 alloc];
      objc_msgSend(v6, "deviceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deviceName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "initWithDeviceIdentifier:deviceName:", v9, v10);
      goto LABEL_14;
    case 3:
    case 4:
    case 5:
    case 6:
    case 9:
    case 18:
      v5 = (void *)objc_opt_new();
      return v5;
    case 7:
      -[ATXAnchorModelPrediction anchorEvent](self->_anchorModelPrediction, "anchorEvent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)MEMORY[0x1E0D80DB8];
      goto LABEL_7;
    case 8:
      -[ATXAnchorModelPrediction anchorEvent](self->_anchorModelPrediction, "anchorEvent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)MEMORY[0x1E0D80DC0];
LABEL_7:
      v13 = [v12 alloc];
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "initWithLocationIdentifier:namedLOI:", v9, 0);
      goto LABEL_11;
    case 16:
      -[ATXAnchorModelPrediction anchorEvent](self->_anchorModelPrediction, "anchorEvent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)MEMORY[0x1E0D80E60];
      goto LABEL_10;
    case 17:
      -[ATXAnchorModelPrediction anchorEvent](self->_anchorModelPrediction, "anchorEvent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)MEMORY[0x1E0D80E68];
LABEL_10:
      v16 = [v15 alloc];
      objc_msgSend(v6, "deviceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v16, "initWithDeviceIdentifier:", v9);
LABEL_11:
      v5 = (void *)v14;
      goto LABEL_15;
    case 19:
      -[ATXAnchorModelPrediction anchorEvent](self->_anchorModelPrediction, "anchorEvent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc(MEMORY[0x1E0D80DF0]);
      objc_msgSend(v6, "dominantMicrolocationUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v17, "initWithLocationUUID:", v10);
LABEL_14:
      v5 = (void *)v11;

LABEL_15:
      break;
    default:
      return v5;
  }
  return v5;
}

- (void)setSerializedTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_serializedTriggers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedTriggers, 0);
  objc_storeStrong((id *)&self->_modeStream, 0);
  objc_storeStrong((id *)&self->_anchorModelPrediction, 0);
}

@end
