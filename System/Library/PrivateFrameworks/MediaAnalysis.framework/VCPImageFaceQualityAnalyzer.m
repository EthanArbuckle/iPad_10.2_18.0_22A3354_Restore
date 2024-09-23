@implementation VCPImageFaceQualityAnalyzer

- (int)analyzeDetectedFaces:(__CVBuffer *)a3 faceResults:(id)a4 cancel:(id)a5
{
  NSMutableArray *v7;
  NSMutableArray *faceQualityScores;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char v17;
  void *v18;
  BOOL v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  NSMutableArray *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *context;
  void *v36;
  void *v37;
  id v38;
  VCPImageFaceQualityAnalyzer *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v38 = a4;
  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  faceQualityScores = self->_faceQualityScores;
  v39 = self;
  self->_faceQualityScores = v7;

  v34 = (void *)MEMORY[0x1BCCA1B2C]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1BCCA1B2C]();
  v10 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v37 = (void *)objc_msgSend(v10, "initWithCVPixelBuffer:options:", a3, MEMORY[0x1E0C9AA70]);
  if (v37)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CEDE68]);
    v33 = v11;
    if (v11)
    {
      objc_msgSend(v11, "setRevision:", 1);
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v12 = v38;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v46 != v14)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "observation");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v16);

          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        }
        while (v13);
      }

      objc_msgSend(v33, "setInputFaceObservations:", v9);
      v52 = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
      v44 = 0;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v37, "performRequests:error:");
      v32 = 0;
      if ((v17 & 1) != 0)
      {
        objc_msgSend(v33, "results");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18 == 0;

        if (!v19)
        {
          objc_msgSend(v33, "results");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObjectsFromArray:", v20);

        }
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v21 = v36;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v41;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v41 != v23)
                objc_enumerationMutation(v21);
              v25 = v39->_faceQualityScores;
              v26 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "faceCaptureQuality");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "floatValue");
              objc_msgSend(v26, "numberWithFloat:");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObject:](v25, "addObject:", v28);

            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          }
          while (v22);
        }

        v29 = 0;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v32;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to analyzeDetectedFaces - %@", buf, 0xCu);
        }
        v29 = -18;
      }

    }
    else
    {
      v29 = -18;
    }

  }
  else
  {
    v29 = -108;
  }

  objc_autoreleasePoolPop(context);
  objc_autoreleasePoolPop(v34);

  return v29;
}

- (NSMutableArray)faceQualityScores
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFaceQualityScores:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceQualityScores, 0);
}

@end
