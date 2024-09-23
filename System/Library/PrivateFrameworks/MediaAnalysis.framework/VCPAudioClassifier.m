@implementation VCPAudioClassifier

+ (void)purgeCachedModels
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[9];

  v17[8] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CD75A0];
  v17[0] = *MEMORY[0x1E0CD7598];
  v17[1] = v2;
  v3 = *MEMORY[0x1E0CD75B0];
  v17[2] = *MEMORY[0x1E0CD75A8];
  v17[3] = v3;
  v4 = *MEMORY[0x1E0CD75C0];
  v17[4] = *MEMORY[0x1E0CD75B8];
  v17[5] = v4;
  v5 = *MEMORY[0x1E0CD7590];
  v17[6] = *MEMORY[0x1E0CD7588];
  v17[7] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 8);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "resetSharedInstanceWithIdentifier:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (VCPAudioClassifier)initWithTypes:(unint64_t)a3
{
  VCPAudioClassifier *v4;
  VCPAudioClassifier *v5;
  uint64_t v6;
  NSMutableArray *detectors;
  uint64_t v8;
  NSMutableArray *classifiers;
  uint64_t v10;
  NSMutableArray *classifiers300;
  uint64_t v12;
  NSMutableArray *embeddingGenerators;
  VCPAudioClassifier *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VCPAudioClassifier;
  v4 = -[VCPAudioClassifier init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_analysisTypes = a3;
    v4->_framePosition = 0;
    v4->_sampleRate = 16000.0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    detectors = v5->_detectors;
    v5->_detectors = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    classifiers = v5->_classifiers;
    v5->_classifiers = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    classifiers300 = v5->_classifiers300;
    v5->_classifiers300 = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    embeddingGenerators = v5->_embeddingGenerators;
    v5->_embeddingGenerators = (NSMutableArray *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)cacheModelsForDetectSoundRequest:(id)a3 requestIdentifier:(id)a4
{
  id v5;
  id v6;
  int HasANE;
  int v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  HasANE = DeviceHasANE();
  if (v5)
    v8 = HasANE;
  else
    v8 = 0;
  if (v6 && v8)
  {
    +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__VCPAudioClassifier_cacheModelsForDetectSoundRequest_requestIdentifier___block_invoke;
    v14[3] = &unk_1E6B19910;
    v15 = v5;
    objc_msgSend(v9, "sharedInstanceWithIdentifier:andCreationBlock:", v6, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    if (v11 && (int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v17 = v12;
      v18 = 2112;
      v19 = v6;
      v13 = v12;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] failed to retain models for %@", buf, 0x16u);

    }
  }

}

uint64_t __73__VCPAudioClassifier_cacheModelsForDetectSoundRequest_requestIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD7558], "eagerlyAllocateModelsForRequest:error:", *(_QWORD *)(a1 + 32), 0);
}

- (void)cacheModelsForClassifySoundRequest:(id)a3 requestIdentifier:(id)a4
{
  id v5;
  id v6;
  int HasANE;
  int v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  HasANE = DeviceHasANE();
  if (v5)
    v8 = HasANE;
  else
    v8 = 0;
  if (v6 && v8)
  {
    +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75__VCPAudioClassifier_cacheModelsForClassifySoundRequest_requestIdentifier___block_invoke;
    v14[3] = &unk_1E6B19910;
    v15 = v5;
    objc_msgSend(v9, "sharedInstanceWithIdentifier:andCreationBlock:", v6, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    if (v11 && (int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v17 = v12;
      v18 = 2112;
      v19 = v6;
      v13 = v12;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] failed to retain models for %@", buf, 0x16u);

    }
  }

}

uint64_t __75__VCPAudioClassifier_cacheModelsForClassifySoundRequest_requestIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD7548], "eagerlyAllocateModelsForRequest:error:", *(_QWORD *)(a1 + 32), 0);
}

- (int)setupWithSample:(opaqueCMSampleBuffer *)a3 trackDuration:(id *)a4 andSampleBatchSize:(int)a5
{
  uint64_t v5;
  const opaqueCMFormatDescription *FormatDescription;
  const AudioStreamBasicDescription *StreamBasicDescription;
  double *p_mSampleRate;
  SNAudioStreamAnalyzer *v11;
  SNAudioStreamAnalyzer *SNAnalyzer;
  float v13;
  AVAudioPCMBuffer *v14;
  AVAudioPCMBuffer *pcmBuffer;
  AVAudioPCMBuffer *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  void *v24;
  uint64_t v25;
  unint64_t analysisTypes;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  VCPSoundDetector *v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  double v37;
  VCPSoundDetector *v38;
  int v39;
  VCPSoundDetector *v40;
  void *v41;
  int v42;
  int v43;
  void *v44;
  double v45;
  VCPSoundDetector *v46;
  float v47;
  VCPSoundClassifier *v48;
  void *v49;
  int v50;
  int v51;
  void *v52;
  double v53;
  VCPSoundClassifier *v54;
  VCPSoundClassifier300 *v55;
  void *v56;
  VCPSoundClassifier300 *v57;
  uint64_t v58;
  void *v59;
  double v60;
  VCPAudioEmbeddingGenerator *v61;
  double v62;
  VCPAudioEmbeddingGenerator *v63;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id obj;
  void *v72;
  void *v73;
  void *v74;
  CMTime v75;
  CMTime v76;
  CMTime v77;
  id v78;
  CMTime v79;
  CMTime v80;
  CMTime v81;
  CMTime v82;
  CMTime v83;
  CMTime v84;
  CMTime time;
  CMTime v86;
  CMTime v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  CMTime v92;
  uint8_t buf[4];
  uint64_t v94;
  _QWORD v95[5];
  _BYTE v96[128];
  _QWORD v97[8];
  _QWORD v98[8];
  _QWORD v99[2];
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD v105[10];

  v5 = *(_QWORD *)&a5;
  v105[7] = *MEMORY[0x1E0C80C00];
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
  if (StreamBasicDescription)
  {
    p_mSampleRate = &StreamBasicDescription->mSampleRate;
    v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initStandardFormatWithSampleRate:channels:", 1, StreamBasicDescription->mSampleRate);
    v11 = (SNAudioStreamAnalyzer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD7538]), "initWithFormat:", v74);
    SNAnalyzer = self->_SNAnalyzer;
    self->_SNAnalyzer = v11;

    if (!self->_SNAnalyzer
      || (v13 = *p_mSampleRate,
          self->_sampleRate = v13,
          v14 = (AVAudioPCMBuffer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC0]), "initWithPCMFormat:frameCapacity:", v74, v5), pcmBuffer = self->_pcmBuffer, self->_pcmBuffer = v14, pcmBuffer, (v16 = self->_pcmBuffer) == 0))
    {
      v39 = -18;
LABEL_47:

      return v39;
    }
    -[AVAudioPCMBuffer setFrameLength:](v16, "setFrameLength:", v5);
    memset(&v92, 0, sizeof(v92));
    CMSampleBufferGetPresentationTimeStamp(&v92, a3);
    v18 = *MEMORY[0x1E0CD75A0];
    v99[0] = *MEMORY[0x1E0CD7598];
    v17 = v99[0];
    v99[1] = v18;
    v105[0] = &unk_1E6B71F20;
    v105[1] = &unk_1E6B71F30;
    v20 = *MEMORY[0x1E0CD75B0];
    v100 = *MEMORY[0x1E0CD75A8];
    v19 = v100;
    v101 = v20;
    v105[2] = &unk_1E6B71F40;
    v105[3] = &unk_1E6B71F50;
    v22 = *MEMORY[0x1E0CD75C0];
    v102 = *MEMORY[0x1E0CD75B8];
    v21 = v102;
    v103 = v22;
    v68 = v22;
    v105[4] = &unk_1E6B71F60;
    v105[5] = &unk_1E6B71F70;
    v104 = *MEMORY[0x1E0CD7588];
    v69 = v104;
    LODWORD(v23) = 1061997773;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v105[6] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v99, 7);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v97[0] = v17;
    v97[1] = v18;
    v98[0] = CFSTR("ApplauseResults");
    v98[1] = CFSTR("BabbleResults");
    v97[2] = v19;
    v97[3] = v20;
    v98[2] = CFSTR("CheeringResults");
    v98[3] = CFSTR("LaughterResults");
    v97[4] = v21;
    v97[5] = v68;
    v98[4] = CFSTR("MusicResults");
    v98[5] = CFSTR("VoiceResults");
    v25 = *MEMORY[0x1E0CD7590];
    v97[6] = v69;
    v67 = v25;
    v97[7] = v25;
    v98[6] = CFSTR("AudioQualityResults");
    v98[7] = CFSTR("SoundClassificationResults");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 8);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    analysisTypes = self->_analysisTypes;
    if ((analysisTypes & 0x200000) != 0)
    {
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v95[0] = v17;
      v95[1] = v18;
      v95[2] = v19;
      v95[3] = v20;
      v95[4] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 5);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v89;
        while (2)
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v89 != v28)
              objc_enumerationMutation(obj);
            v30 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i);
            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD7558]), "initWithSoundIdentifier:", v30);
            -[VCPAudioClassifier cacheModelsForDetectSoundRequest:requestIdentifier:](self, "cacheModelsForDetectSoundRequest:requestIdentifier:", v31, v30);
            v32 = [VCPSoundDetector alloc];
            v87 = v92;
            objc_msgSend(v72, "objectForKeyedSubscript:", v30);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "floatValue");
            v35 = v34;
            objc_msgSend(v73, "objectForKeyedSubscript:", v30);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v37) = v35;
            v38 = -[VCPSoundDetector initWithTrackStart:threshold:resultsKey:](v32, "initWithTrackStart:threshold:resultsKey:", &v87, v36, v37);

            if (!v31
              || !v38
              || !-[SNAudioStreamAnalyzer addRequest:withObserver:error:](self->_SNAnalyzer, "addRequest:withObserver:error:", v31, v38, 0))
            {

              goto LABEL_44;
            }
            -[NSMutableArray addObject:](self->_detectors, "addObject:", v38);

          }
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
          if (v27)
            continue;
          break;
        }
      }

      analysisTypes = self->_analysisTypes;
    }
    if ((analysisTypes & 0x10) != 0)
    {
      obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD7558]), "initWithSoundIdentifier:", v68);
      -[VCPAudioClassifier cacheModelsForDetectSoundRequest:requestIdentifier:](self, "cacheModelsForDetectSoundRequest:requestIdentifier:");
      v40 = [VCPSoundDetector alloc];
      v86 = v92;
      objc_msgSend(v72, "objectForKeyedSubscript:", v68);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "floatValue");
      v43 = v42;
      objc_msgSend(v73, "objectForKeyedSubscript:", v68);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v45) = v43;
      v46 = -[VCPSoundDetector initWithTrackStart:threshold:resultsKey:](v40, "initWithTrackStart:threshold:resultsKey:", &v86, v44, v45);

      if (!obj
        || !v46
        || !-[SNAudioStreamAnalyzer addRequest:withObserver:error:](self->_SNAnalyzer, "addRequest:withObserver:error:", obj, v46, 0))
      {

        goto LABEL_44;
      }
      -[NSMutableArray addObject:](self->_detectors, "addObject:", v46);

      analysisTypes = self->_analysisTypes;
    }
    if ((analysisTypes & 0x400000000) != 0)
    {
      obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD7548]), "initWithClassifierIdentifier:error:", v69, 0);
      -[VCPAudioClassifier cacheModelsForClassifySoundRequest:requestIdentifier:](self, "cacheModelsForClassifySoundRequest:requestIdentifier:");
      time = (CMTime)*a4;
      v47 = fmin(CMTimeGetSeconds(&time) * 0.949999988, 3.0);
      CMTimeMake(&v84, (uint64_t)(float)(v47 * 1000.0), 1000);
      v83 = v84;
      objc_msgSend(obj, "setWindowDuration:", &v83);
      v48 = [VCPSoundClassifier alloc];
      v82 = v92;
      objc_msgSend(v72, "objectForKeyedSubscript:", v69);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "floatValue");
      v51 = v50;
      objc_msgSend(v73, "objectForKeyedSubscript:", v69);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v53) = v51;
      v54 = -[VCPSoundClassifier initWithTrackStart:threshold:resultsKey:](v48, "initWithTrackStart:threshold:resultsKey:", &v82, v52, v53);

      if (!obj
        || !v54
        || !-[SNAudioStreamAnalyzer addRequest:withObserver:error:](self->_SNAnalyzer, "addRequest:withObserver:error:", obj, v54, 0))
      {

        goto LABEL_44;
      }
      -[NSMutableArray addObject:](self->_classifiers, "addObject:", v54);

      analysisTypes = self->_analysisTypes;
      if ((analysisTypes & 0x20000000000) == 0)
        goto LABEL_19;
    }
    else if ((analysisTypes & 0x20000000000) == 0)
    {
LABEL_19:
      if ((analysisTypes & 0x800000000000) == 0)
      {
LABEL_20:
        v39 = 0;
LABEL_46:

        goto LABEL_47;
      }
LABEL_37:
      if (_os_feature_enabled_impl())
        v58 = 5;
      else
        v58 = 4;
      v78 = 0;
      v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD7550]), "initWithFeaturePrintType:version:error:", 6, v58, &v78);
      obj = v78;
      if (v59)
      {
        CMTimeMake(&v77, 2, 1);
        v76 = v77;
        objc_msgSend(v59, "setWindowDuration:", &v76);
        LODWORD(v60) = 0;
        objc_msgSend(v59, "setOverlapFactor:", v60);
        v61 = [VCPAudioEmbeddingGenerator alloc];
        HIDWORD(v62) = HIDWORD(v92.value);
        v75 = v92;
        LODWORD(v62) = 0;
        v63 = -[VCPAudioEmbeddingGenerator initWithTrackStart:threshold:resultsKey:version:](v61, "initWithTrackStart:threshold:resultsKey:version:", &v75, CFSTR("AudioEmbeddingResults"), v58, v62);
        -[SNAudioStreamAnalyzer addRequest:withObserver:error:](self->_SNAnalyzer, "addRequest:withObserver:error:", v59, v63, 0);
        -[NSMutableArray addObject:](self->_embeddingGenerators, "addObject:", v63);

        v39 = 0;
LABEL_45:

        goto LABEL_46;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(obj, "description");
        v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v66 = objc_msgSend(v65, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v94 = v66;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create FeaturePrintRequest %s", buf, 0xCu);

      }
LABEL_44:
      v39 = -18;
      goto LABEL_45;
    }
    obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD7548]), "initWithClassifierIdentifier:error:", v67, 0);
    -[VCPAudioClassifier cacheModelsForClassifySoundRequest:requestIdentifier:](self, "cacheModelsForClassifySoundRequest:requestIdentifier:");
    CMTimeMake(&v81, 2, 1);
    v80 = v81;
    objc_msgSend(obj, "setWindowDuration:", &v80);
    objc_msgSend(obj, "setOverlapFactor:", 0.0);
    v55 = [VCPSoundClassifier300 alloc];
    v79 = v92;
    objc_msgSend(v73, "objectForKeyedSubscript:", v67);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[VCPSoundClassifier300 initWithTrackStart:resultsKey:](v55, "initWithTrackStart:resultsKey:", &v79, v56);

    if (!obj
      || !v57
      || !-[SNAudioStreamAnalyzer addRequest:withObserver:error:](self->_SNAnalyzer, "addRequest:withObserver:error:", obj, v57, 0))
    {

      goto LABEL_44;
    }
    -[NSMutableArray addObject:](self->_classifiers300, "addObject:", v57);

    if ((self->_analysisTypes & 0x800000000000) == 0)
      goto LABEL_20;
    goto LABEL_37;
  }
  return -50;
}

- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4
{
  void *mData;
  uint64_t mDataByteSize;
  AVAudioFrameCount v7;
  int result;

  mData = a3->mBuffers[0].mData;
  mDataByteSize = (int)a3->mBuffers[0].mDataByteSize;
  if (mDataByteSize != 4 * -[AVAudioPCMBuffer frameLength](self->_pcmBuffer, "frameLength"))
    return -50;
  memcpy(*(void **)(-[AVAudioPCMBuffer mutableAudioBufferList](self->_pcmBuffer, "mutableAudioBufferList") + 16), mData, 4 * -[AVAudioPCMBuffer frameLength](self->_pcmBuffer, "frameLength"));
  -[SNAudioStreamAnalyzer analyzeAudioBuffer:atAudioFramePosition:](self->_SNAnalyzer, "analyzeAudioBuffer:atAudioFramePosition:", self->_pcmBuffer, self->_framePosition);
  v7 = -[AVAudioPCMBuffer frameLength](self->_pcmBuffer, "frameLength");
  result = 0;
  self->_framePosition += v7;
  return result;
}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = self->_detectors;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v33;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v7)
        objc_enumerationMutation(v5);
      v9 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v8), "finalizeAnalysisAtTime:", a3);
      if (v9)
        break;
      if (v6 == ++v8)
      {
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v5 = self->_classifiers;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v29;
LABEL_11:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v5);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12), "finalizeAnalysisAtTime:", a3);
        if (v9)
          break;
        if (v10 == ++v12)
        {
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
          if (v10)
            goto LABEL_11;
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v5 = self->_classifiers300;
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v25;
LABEL_19:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v5);
          v9 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15), "finalizeAnalysisAtTime:", a3);
          if (v9)
            break;
          if (v13 == ++v15)
          {
            v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
            if (v13)
              goto LABEL_19;
            goto LABEL_25;
          }
        }
      }
      else
      {
LABEL_25:

        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v5 = self->_embeddingGenerators;
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v36, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v21;
LABEL_27:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v21 != v17)
              objc_enumerationMutation(v5);
            v9 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18), "finalizeAnalysisAtTime:", a3, (_QWORD)v20);
            if (v9)
              break;
            if (v16 == ++v18)
            {
              v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v36, 16);
              if (v16)
                goto LABEL_27;
              goto LABEL_33;
            }
          }
        }
        else
        {
LABEL_33:
          v9 = 0;
        }
      }
    }
  }

  return v9;
}

- (id)results
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v4 = self->_detectors;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v38;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v7), "results");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addEntriesFromDictionary:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v5);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = self->_classifiers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v34;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v12), "results");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addEntriesFromDictionary:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v10);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = self->_classifiers300;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v30;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v17), "results");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addEntriesFromDictionary:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v15);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = self->_embeddingGenerators;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v22), "results", (_QWORD)v25);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addEntriesFromDictionary:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v20);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingGenerators, 0);
  objc_storeStrong((id *)&self->_classifiers300, 0);
  objc_storeStrong((id *)&self->_classifiers, 0);
  objc_storeStrong((id *)&self->_detectors, 0);
  objc_storeStrong((id *)&self->_pcmBuffer, 0);
  objc_storeStrong((id *)&self->_SNAnalyzer, 0);
}

@end
