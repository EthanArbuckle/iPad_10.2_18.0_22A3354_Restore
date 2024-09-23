@implementation VCPFaceIDModel

+ (id)personVIPModelFileName
{
  return CFSTR("vnpersonsmodel.bin");
}

+ (id)petVIPModelFileName
{
  return CFSTR("vnpetsmodel.bin");
}

+ (id)faceObservationFromFaceprintData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEDEE8]), "initWithState:error:", v3, &v9);
  v5 = v9;
  if (v4)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CEDEE0]);
    objc_msgSend(v6, "setFaceTorsoprint:", v4);
    objc_msgSend(v4, "faceprint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFaceprint:", v7);

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID: Failed to create faceprint from data : %@", buf, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

+ (id)animalObservationFromAnimalprintData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  double v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEDDA0]), "initWithState:error:", v3, &v10);
  v5 = v10;
  if (v4)
  {
    v6 = objc_alloc(MEMORY[0x1E0CEDD98]);
    LODWORD(v7) = 1065336439;
    v8 = (void *)objc_msgSend(v6, "initWithAnimalprint:confidence:", v4, v7);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID: Failed to create animalprint from data : %@", buf, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

+ (id)newMutablePersonsModel
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CEDFA8]);
  objc_msgSend(v2, "setMaximumIdentities:", 1000);
  objc_msgSend(v2, "setMaximumTrainingFaceprintsPerIdentity:", 10);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEDF90]), "initWithConfiguration:", v2);

  return v3;
}

+ (float)petClassificationThreshold
{
  return 0.5;
}

+ (id)classifyFaceObservation:(id)a3 withModel:(id)a4 error:(id *)a5
{
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  int v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "predictPersonFromFaceObservation:limit:canceller:error:", a3, 1, 0, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "confidence");
    v9 = v8;
    if (v8 <= VCPPersonFaceVIPMatchingThreshold())
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v12 = 134217984;
        v13 = v9;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "QuickFaceID: Failed passing classify face confidence: %f", (uint8_t *)&v12, 0xCu);
      }
      v10 = 0;
    }
    else
    {
      objc_msgSend(v7, "predictedPersonUniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v12 = 134217984;
        v13 = v9;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "QuickFaceID: Passing classify face confidence: %f", (uint8_t *)&v12, 0xCu);
      }
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID: Failed to predict at all", (uint8_t *)&v12, 2u);
    }
    v10 = 0;
  }

  return v10;
}

+ (id)classifyAnimalObservation:(id)a3 withModel:(id)a4 error:(id *)a5
{
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  void *v11;
  int v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "entityPredictionsForObservation:limit:canceller:error:", a3, 1, 0, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "confidence");
    v9 = v8;
    objc_msgSend((id)objc_opt_class(), "petClassificationThreshold");
    if (v9 <= v10)
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v13 = 134217984;
        v14 = v9;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "QuickFaceID Pet: Failed passing classify pet confidence: %f", (uint8_t *)&v13, 0xCu);
      }
      v11 = 0;
    }
    else
    {
      objc_msgSend(v7, "entityUniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v13 = 134217984;
        v14 = v9;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "QuickFaceID Pet: Passing classify pet confidence: %f", (uint8_t *)&v13, 0xCu);
      }
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID Pet: Failed to predict pet at all", (uint8_t *)&v13, 2u);
    }
    v11 = 0;
  }

  return v11;
}

+ (id)_loadModelAtPath:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CEDFA0], "modelFromURL:options:error:", v5, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_loadPetsModelAtPath:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CEDED0]);
  objc_msgSend(MEMORY[0x1E0CEDEC0], "modelFromURL:options:error:", v5, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)loadVIPModelAtPath:(id)a3 withVIPType:(unint64_t)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      VCPMAVIPTypeDescription(a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v10;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "QuickFaceID %@ Model path is nil; skip loading",
        (uint8_t *)&v14,
        0xCu);

    }
    goto LABEL_13;
  }
  if (a4 == 1)
  {
    objc_msgSend(a1, "_loadPetsModelAtPath:error:", v8, a5);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (a4)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      VCPMAVIPTypeDescription(a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to load VIP %@ Model", (uint8_t *)&v14, 0xCu);

    }
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  objc_msgSend(a1, "_loadModelAtPath:error:", v8, a5);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v11 = (void *)v9;
LABEL_14:

  return v11;
}

+ (BOOL)persistModel:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CEDFB8]);
  objc_msgSend(v9, "setReadOnly:", 1);
  LOBYTE(a5) = objc_msgSend(v7, "writeToURL:options:error:", v8, v9, a5);

  return (char)a5;
}

+ (BOOL)persistPetsModel:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CEDED8]);
  objc_msgSend(v9, "setReadOnly:", 1);
  LOBYTE(a5) = objc_msgSend(v7, "writeToURL:options:error:", v8, v9, a5);

  return (char)a5;
}

+ (BOOL)addFaceObservations:(id)a3 forPersonIdentifier:(id)a4 toModel:(id)a5 error:(id *)a6
{
  return objc_msgSend(a5, "addFaceObservations:toPersonWithUniqueIdentifier:error:", a3, a4, a6);
}

@end
