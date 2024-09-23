@implementation HMIVideoFrameAnalyzer

- (HMIVideoFrameAnalyzer)initWithConfiguration:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  HMIVideoFrameAnalyzer *v8;
  MovingAverage *v9;
  MovingAverage *analysisTime;
  HMICameraVideoFrameAnalyzerSignificantActivity *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  HMICameraVideoFrameAnalyzer *cameraVideoFrameAnalyzer;
  void *v17;
  HMIVideoFrameIntervalSampler *v18;
  uint64_t v19;
  HMIVideoFrameSampler *frameSampler;
  void *v21;
  HMIVideoFrameAnalyzer *v22;
  void *v23;
  HMIVideoFrameAnalyzer *v24;
  NSObject *v25;
  void *v26;
  CMTime v28;
  id v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)HMIVideoFrameAnalyzer;
  v8 = -[HMIVideoAnalyzerProcessingNode initWithConfiguration:workQueue:](&v30, sel_initWithConfiguration_workQueue_, v6, v7);
  if (!v8)
    goto LABEL_4;
  v9 = -[MovingAverage initWithWindowSize:]([MovingAverage alloc], "initWithWindowSize:", 8);
  analysisTime = v8->_analysisTime;
  v8->_analysisTime = v9;

  v11 = [HMICameraVideoFrameAnalyzerSignificantActivity alloc];
  +[HMIVideoAnalyzerEvent eventConfidenceThresholdsMedium](HMIVideoAnalyzerEvent, "eventConfidenceThresholdsMedium");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMIVideoAnalyzerEvent eventConfidenceThresholdsHigh](HMIVideoAnalyzerEvent, "eventConfidenceThresholdsHigh");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v14 = -[HMICameraVideoFrameAnalyzerSignificantActivity initWithMediumConfidenceThresholds:highConfidenceThresholds:analyzerConfiguration:error:](v11, "initWithMediumConfidenceThresholds:highConfidenceThresholds:analyzerConfiguration:error:", v12, v13, v6, &v29);
  v15 = v29;
  cameraVideoFrameAnalyzer = v8->_cameraVideoFrameAnalyzer;
  v8->_cameraVideoFrameAnalyzer = (HMICameraVideoFrameAnalyzer *)v14;

  -[HMIVideoFrameAnalyzer cameraVideoFrameAnalyzer](v8, "cameraVideoFrameAnalyzer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = [HMIVideoFrameIntervalSampler alloc];
    CMTimeMake(&v28, 10, 1);
    v19 = -[HMIVideoFrameIntervalSampler initWithInterval:](v18, "initWithInterval:", &v28);
    frameSampler = v8->_frameSampler;
    v8->_frameSampler = (HMIVideoFrameSampler *)v19;

    -[HMIVideoFrameAnalyzer frameSampler](v8, "frameSampler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelegate:", v8);

LABEL_4:
    v22 = v8;
    goto LABEL_8;
  }
  v23 = (void *)MEMORY[0x220735570]();
  v24 = v8;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v26;
    v33 = 2112;
    v34 = v15;
    _os_log_impl(&dword_219D45000, v25, OS_LOG_TYPE_ERROR, "%{public}@Error creating frame analyzer: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v23);

  v22 = 0;
LABEL_8:

  return v22;
}

- (BOOL)handleSampleBuffer:(opaqueCMSampleBuffer *)a3 background:(opaqueCMSampleBuffer *)a4 motionDetections:(id)a5 tracks:(id)a6
{
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  HMIVideoFrame *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  float v48;
  unint64_t v49;
  HMIConfidence *v50;
  HMIVideoAnalyzerEventMotion *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  int v60;
  double v61;
  HMIVideoAnalyzerEventMotion *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  HMIVideoFrameAnalyzer *v67;
  NSObject *v68;
  void *v69;
  uint64_t v70;
  HMIVideoFrame *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  MovingAverage *analysisTime;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  HMIVideoFrameAnalyzerResult *v83;
  HMIVideoFrameAnalyzerResult *v84;
  void *v85;
  void *v86;
  id v88;
  id v89;
  void *v90;
  opaqueCMSampleBuffer *v91;
  HMIVideoFrameAnalyzer *v92;
  void *v93;
  opaqueCMSampleBuffer *v94;
  void *v95;
  void *v96;
  HMIVideoFrame *v97;
  CMTime v98;
  _QWORD v99[3];
  _QWORD v100[4];
  HMIVideoFrame *v101;
  CMTime buf;
  uint64_t v103;
  CGRect v104;

  v103 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  -[HMIVideoAnalyzerProcessingNode dynamicConfiguration](self, "dynamicConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    _HMFPreconditionFailure();
  v13 = 0x24BDBC000uLL;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = -[HMIVideoFrame initWithSampleBuffer:]([HMIVideoFrame alloc], "initWithSampleBuffer:", a3);
  -[HMIVideoAnalyzerProcessingNode dynamicConfiguration](self, "dynamicConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "eventTriggers");

  v94 = a3;
  if ((v16 & 0x1E) != 0)
  {
    v93 = v14;
    v100[0] = MEMORY[0x24BDAC760];
    v100[1] = 3221225472;
    v100[2] = __79__HMIVideoFrameAnalyzer_handleSampleBuffer_background_motionDetections_tracks___block_invoke;
    v100[3] = &unk_24DBEAC68;
    v17 = v97;
    v101 = v17;
    objc_msgSend(v11, "na_map:", v100);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerProcessingNode configuration](self, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "packageClassifierMode");

    v91 = a4;
    v89 = v11;
    if (!v20)
    {
      objc_msgSend(v96, "unionSet:", v18);
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v21 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v21;
    }
    -[HMIVideoFrameAnalyzer cameraVideoFrameAnalyzer](self, "cameraVideoFrameAnalyzer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoFrame size](v17, "size");
    v88 = v10;
    objc_msgSend(v22, "regionOfInterestForMotionDetections:foregroundEvents:frameSize:", v10, v18);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;

    -[HMIVideoFrameAnalyzer cameraVideoFrameAnalyzer](self, "cameraVideoFrameAnalyzer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "analyzeFrame:regionOfInterest:", v17, v24, v26, v28, v30);
    v32 = objc_claimAutoreleasedReturnValue();

    -[HMIVideoFrameAnalyzer cameraVideoFrameAnalyzer](self, "cameraVideoFrameAnalyzer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerProcessingNode dynamicConfiguration](self, "dynamicConfiguration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "recognizeFaces");
    +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = (void *)v32;
    objc_msgSend(v33, "getAnalyzerEvents:eventTriggers:enableFaceClassification:enableTorsoRecognition:", v32, v16 & 0xFFFFFFFFFFFFFFEFLL, v35, objc_msgSend(v36, "shouldEnableTorsoRecognition"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMIVideoAnalyzerProcessingNode dynamicConfiguration](self, "dynamicConfiguration");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v38, "recognizeFaces") & 1) != 0)
    {
      -[HMIVideoAnalyzerProcessingNode configuration](self, "configuration");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "homeUUID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      a4 = v91;
      if (v40)
      {
        -[HMIVideoFrameAnalyzer cameraVideoFrameAnalyzer](self, "cameraVideoFrameAnalyzer");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMIVideoAnalyzerProcessingNode configuration](self, "configuration");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "homeUUID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "recognizeEvents:frame:regionOfInterest:homeUUID:", v37, v17, v43, v24, v26, v28, v30);
        v44 = objc_claimAutoreleasedReturnValue();

        a4 = v91;
        v37 = (void *)v44;
        goto LABEL_22;
      }
    }
    else
    {

      a4 = v91;
    }
    -[HMIVideoAnalyzerProcessingNode dynamicConfiguration](self, "dynamicConfiguration");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v63, "recognizeFaces") & 1) != 0)
    {
      -[HMIVideoAnalyzerProcessingNode configuration](self, "configuration");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "homeUUID");
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v88;
      v14 = v93;
      if (v65)
      {
LABEL_24:
        v13 = 0x24BDBC000;
        if ((v16 & 0x10) != 0)
        {
          v70 = objc_msgSend(v18, "count");
          if (a4)
          {
            if (v70)
            {
              v71 = -[HMIVideoFrame initWithSampleBuffer:]([HMIVideoFrame alloc], "initWithSampleBuffer:", a4);
              -[HMIVideoFrameAnalyzer cameraVideoFrameAnalyzer](self, "cameraVideoFrameAnalyzer");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              if (v71)
                -[HMIVideoFrame presentationTimeStamp](v71, "presentationTimeStamp");
              else
                memset(v99, 0, sizeof(v99));
              objc_msgSend(v72, "getPackageEvents:foregroundEvents:newBackgroundEvents:backgroundTimeStamp:", v90, v18, v95, v99);
              v73 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v73, "count"))
              {
                -[HMIVideoFrameAnalyzer cameraVideoFrameAnalyzer](self, "cameraVideoFrameAnalyzer");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "analyzeBackgroundFrame:packageEvents:newBackgroundEvents:regionOfInterest:", v71, v73, v95, v24, v26, v28, v30);
                v75 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v96, "unionSet:", v75);
                v73 = (void *)v75;
              }
              v13 = 0x24BDBC000uLL;

              v14 = v93;
            }
          }
        }
        objc_msgSend(v96, "unionSet:", v37);

        v11 = v89;
        if ((v16 & 1) == 0)
          goto LABEL_34;
        goto LABEL_9;
      }
      v66 = (void *)MEMORY[0x220735570]();
      v67 = self;
      HMFGetOSLogHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v92 = v67;
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.value) = 138543362;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v69;
        _os_log_impl(&dword_219D45000, v68, OS_LOG_TYPE_ERROR, "%{public}@Face Classification is enabled, but homeUUID is nil, skipping face recognition", (uint8_t *)&buf, 0xCu);

        v67 = v92;
      }

      objc_autoreleasePoolPop(v66);
LABEL_23:
      v14 = v93;
      goto LABEL_24;
    }

LABEL_22:
    v10 = v88;
    goto LABEL_23;
  }
  v24 = *MEMORY[0x24BDBF070];
  v26 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v28 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v30 = *(double *)(MEMORY[0x24BDBF070] + 24);
  if ((v16 & 1) == 0)
  {
LABEL_34:
    v45 = v10;
    goto LABEL_35;
  }
LABEL_9:
  v45 = v10;
  +[HMIMotionDetection firstMotionDetectionInArray:withMode:](HMIMotionDetection, "firstMotionDetectionInArray:withMode:", v10, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v46)
  {
    objc_msgSend(v46, "motionScore");
    if (v48 > 1.0)
    {
      v49 = v13;
      v50 = -[HMIConfidence initWithValue:levelThresholds:]([HMIConfidence alloc], "initWithValue:levelThresholds:", &unk_24DC15140, 1.0);
      v51 = [HMIVideoAnalyzerEventMotion alloc];
      objc_msgSend(v47, "boundingBox");
      v53 = v52;
      v55 = v54;
      v57 = v56;
      v59 = v58;
      objc_msgSend(v47, "motionScore");
      LODWORD(v61) = v60;
      v62 = -[HMIVideoAnalyzerEventMotion initWithConfidence:boundingBox:motionScore:](v51, "initWithConfidence:boundingBox:motionScore:", v50, v53, v55, v57, v59, v61);
      objc_msgSend(v96, "addObject:", v62);

      v104.origin.x = v24;
      v104.origin.y = v26;
      v104.size.width = v28;
      v104.size.height = v30;
      if (CGRectIsNull(v104))
      {
        v30 = 1.0;
        v28 = 1.0;
        v26 = 0.0;
        v24 = 0.0;
      }

      v13 = v49;
    }
  }

LABEL_35:
  analysisTime = self->_analysisTime;
  v77 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(v13 + 3680), "date");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "timeIntervalSinceDate:", v14);
  objc_msgSend(v77, "numberWithDouble:");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[MovingAverage addNumber:](analysisTime, "addNumber:", v79);

  v80 = (void *)MEMORY[0x220735570]();
  -[HMIVideoAnalyzerProcessingNode configuration](self, "configuration");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v78) = objc_msgSend(v81, "redactFrames");

  if ((_DWORD)v78)
  {
    -[HMIVideoFrame redactedCopy](v97, "redactedCopy");
    v82 = objc_claimAutoreleasedReturnValue();

    v97 = (HMIVideoFrame *)v82;
  }
  memset(&buf, 0, sizeof(buf));
  if (a4)
    CMSampleBufferGetPresentationTimeStamp(&buf, a4);
  else
    buf = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  v83 = [HMIVideoFrameAnalyzerResult alloc];
  v98 = buf;
  v84 = -[HMIVideoFrameAnalyzerResult initWithFrame:events:backgroundEvents:backgroundTimeStamp:regionOfInterest:motionDetections:](v83, "initWithFrame:events:backgroundEvents:backgroundTimeStamp:regionOfInterest:motionDetections:", v97, v96, v95, &v98, v45, v24, v26, v28, v30);
  -[HMIVideoFrameAnalyzer delegate](self, "delegate");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "frameAnalyzer:didAnalyzeFrame:", self, v84);

  objc_autoreleasePoolPop(v80);
  -[HMIVideoFrameAnalyzer frameSampler](self, "frameSampler");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "handleSampleBuffer:", v94);

  return 1;
}

id __79__HMIVideoFrameAnalyzer_handleSampleBuffer_background_motionDetections_tracks___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v4, "presentationTimeStamp");
  else
    memset(v7, 0, sizeof(v7));
  objc_msgSend(v3, "createPackageEventAtTimeStamp:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)averageAnalysisTime
{
  double result;

  -[MovingAverage movingAverageForInterval:defaultValue:](self->_analysisTime, "movingAverageForInterval:defaultValue:", 4.0, 0.0);
  return result;
}

- (void)flush
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HMIVideoFrameAnalyzer cameraVideoFrameAnalyzer](self, "cameraVideoFrameAnalyzer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerProcessingNode configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerProcessingNode dynamicConfiguration](self, "dynamicConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flushAndGetAnalysisStateUpdateForHome:enableFaceClassification:", v5, objc_msgSend(v6, "recognizeFaces"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMIVideoFrameAnalyzer delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frameAnalyzer:didProduceAnalysisStateUpdate:", self, v8);

  }
}

- (HMIVideoFrameAnalyzerDelegate)delegate
{
  return (HMIVideoFrameAnalyzerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMICameraVideoFrameAnalyzer)cameraVideoFrameAnalyzer
{
  return (HMICameraVideoFrameAnalyzer *)objc_getProperty(self, a2, 64, 1);
}

- (HMIVideoFrameSampler)frameSampler
{
  return (HMIVideoFrameSampler *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameSampler, 0);
  objc_storeStrong((id *)&self->_cameraVideoFrameAnalyzer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_analysisTime, 0);
}

@end
