@implementation VCPVideoPersonDetector

- (VCPVideoPersonDetector)init
{
  VCPVideoPersonDetector *v2;
  uint64_t v3;
  NSMutableArray *persons;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VCPVideoPersonDetector;
  v2 = -[VCPVideoPersonDetector init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    persons = v2->_persons;
    v2->_persons = (NSMutableArray *)v3;

  }
  return v2;
}

- (int)detectPersons:(__CVBuffer *)a3 persons:(id)a4
{
  id v5;
  size_t Height;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  VCPHuman *v31;
  void *v32;
  void *v34;
  void *v35;
  char v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  BOOL v40;
  void *v41;
  id v42;
  id v43;
  void *context;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint8_t buf[16];
  _BYTE v55[128];
  id v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v7 = MEMORY[0x1BCCA1B2C](Height);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1BCCA1B2C]();
  v9 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v10 = (void *)objc_msgSend(v9, "initWithCVPixelBuffer:options:", a3, MEMORY[0x1E0C9AA70]);
  VCPSignPostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  VCPSignPostLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  context = (void *)v7;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "VCPVideoPersonDetectorHumanDetection", ", buf, 2u);
  }

  v53 = 0;
  v15 = objc_opt_class();
  if (_os_feature_enabled_impl())
    v16 = 15;
  else
    v16 = 11;
  v17 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v53, v15, v16);
  v18 = v53;
  v19 = v18;
  if (v17)
  {
    v20 = 0;
LABEL_16:
    v25 = 4;
    goto LABEL_17;
  }
  v57[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  v22 = objc_msgSend(v10, "performRequests:error:", v21, &v52);
  v20 = v52;

  if ((v22 & 1) == 0)
  {
    v17 = -18;
    goto LABEL_16;
  }
  v51 = 0;
  v23 = objc_opt_class();
  if (_os_feature_enabled_impl())
    v24 = 15;
  else
    v24 = 11;
  v17 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v51, v23, v24);
  v43 = v51;
  if (v17)
  {
    v25 = 4;
  }
  else
  {
    objc_msgSend(v19, "results");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setInputDetectedObjectObservations:", v34);

    v56 = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v20;
    v36 = objc_msgSend(v10, "performRequests:error:", v35, &v50);
    v42 = v50;

    if ((v36 & 1) != 0)
    {
      VCPSignPostLog();
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v38, OS_SIGNPOST_INTERVAL_END, v12, "VCPVideoPersonDetectorHumanDetection", ", buf, 2u);
      }

      objc_msgSend(v43, "results");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39 == 0;

      if (!v40)
      {
        objc_msgSend(v43, "results");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addObjectsFromArray:", v41);

      }
      v25 = 0;
      v17 = 0;
    }
    else
    {
      v17 = -18;
      v25 = 4;
    }
    v20 = v42;
  }

LABEL_17:
  objc_autoreleasePoolPop(v8);
  if (!v25)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v26 = v45;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v47 != v28)
            objc_enumerationMutation(v26);
          v30 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          v31 = objc_alloc_init(VCPHuman);
          objc_msgSend(v30, "boundingBox");
          -[VCPHuman setBounds:](v31, "setBounds:");
          objc_msgSend(v30, "confidence");
          -[VCPHuman setConfidence:](v31, "setConfidence:");
          objc_msgSend(v30, "torsoprint");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPHuman setTorsoprint:](v31, "setTorsoprint:", v32);

          objc_msgSend(v5, "addObject:", v31);
        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      }
      while (v27);
    }

  }
  objc_autoreleasePoolPop(context);

  return v17;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  __CVBuffer *v6;
  void *v8;

  v6 = a3;
  v8 = (void *)MEMORY[0x1BCCA1B2C](-[NSMutableArray removeAllObjects](self->_persons, "removeAllObjects", a3, a4, a5, a6));
  LODWORD(v6) = -[VCPVideoPersonDetector detectPersons:persons:](self, "detectPersons:persons:", v6, self->_persons);
  objc_autoreleasePoolPop(v8);
  return (int)v6;
}

- (id)persons
{
  return self->_persons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persons, 0);
}

@end
