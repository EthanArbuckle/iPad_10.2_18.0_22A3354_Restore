@implementation VCPHandPoseImageRequest

- (VCPHandPoseImageRequest)init
{
  uint8_t v4[16];

  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Not implemented, please use initWithOptions", v4, 2u);
  }

  return 0;
}

- (VCPHandPoseImageRequest)initWithOptions:(id)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  VCPHandPoseImageRequest *v8;
  double v9;
  VCPHandPoseImageRequest *v10;
  int *v11;
  int width;
  int height;
  int maxNumHands;
  __CFString *v15;
  __CFString *v16;
  unsigned int revision;
  _BOOL4 enableHandDetection;
  VCPImageHandsAnalyzer *v19;
  uint64_t v20;
  VCPImageHandsAnalyzer *analyzer;
  VCPImageHandsAnalyzer *v22;
  NSObject *v23;
  NSObject *v24;
  VCPHandPoseImageRequest *v25;
  VCPHandPoseImageRequest *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  objc_super v33;
  uint8_t buf[4];
  unsigned int v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "VCPHandPoseImageRequest_initWithOptions", ", buf, 2u);
  }

  v33.receiver = self;
  v33.super_class = (Class)VCPHandPoseImageRequest;
  v8 = -[VCPRequest initWithOptions:](&v33, sel_initWithOptions_, v32);
  v10 = v8;
  v11 = &OBJC_IVAR___VCPRequest__minHandSize;
  if (v8)
  {
    width = v8->super._width;
    if (width < 1 || (height = v8->super._height, height < 1))
    {
      v31 = 0;
    }
    else
    {
      *(float *)&v9 = (float)width / (float)height;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    maxNumHands = v10->super._maxNumHands;
    if (maxNumHands <= 0)
      maxNumHands = 6;
    v10->super._maxNumHands = maxNumHands;
    if (v10->super._enableHandPoseLite)
      v15 = CFSTR("hand_keypoint_detector_lite.espresso.net");
    else
      v15 = CFSTR("hand_keypoint_detector_acc.espresso.net");
    v16 = v15;
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      revision = v10->super._revision;
      enableHandDetection = v10->super._enableHandDetection;
      *(_DWORD *)buf = 67109634;
      v35 = revision;
      v36 = 1024;
      v37 = enableHandDetection;
      v38 = 2112;
      v39 = v16;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPHandPoseImageRequest options: _revision = %d, enable detection = %d, model name = %@", buf, 0x18u);
    }
    v19 = [VCPImageHandsAnalyzer alloc];
    LODWORD(v30) = v10->super._revision;
    HIDWORD(v28) = v10->super._width;
    LODWORD(v29) = v10->super._height;
    LOBYTE(v28) = v10->super._enableHandPoseLite;
    v20 = -[VCPImageHandsAnalyzer initWithKeypointsOption:forceCPU:sharedModel:enableHandDetection:enableANSTHandDetection:enableRejectHandsNearBoundaries:enableHandObject:sourceWidth:sourceHeight:modelName:revision:options:](v19, "initWithKeypointsOption:forceCPU:sharedModel:enableHandDetection:enableANSTHandDetection:enableRejectHandsNearBoundaries:enableHandObject:sourceWidth:sourceHeight:modelName:revision:options:", v10->super._maxNumHands, v10->super._useCPUOnly, 0, v10->super._enableHandDetection, v10->super._enableANSTHandDetection, v10->super._enableRejectHandsNearBoundaries, v28, v29, v16, v30, v32);
    analyzer = v10->_analyzer;
    v10->_analyzer = (VCPImageHandsAnalyzer *)v20;

    v22 = v10->_analyzer;
    if (v22)
    {
      -[VCPImageHandsAnalyzer setOptimizeForDistance:](v22, "setOptimizeForDistance:", v10->super._optimizeForDistance);
      -[VCPImageHandsAnalyzer preferredInputFormat:height:format:](v10->_analyzer, "preferredInputFormat:height:format:", &v10->_preferredWidth, &v10->_preferredHeight, &v10->_preferredFormat);
    }

    v11 = &OBJC_IVAR___VCPRequest__minHandSize;
  }
  VCPSignPostLog();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v24, OS_SIGNPOST_INTERVAL_END, v5, "VCPHandPoseImageRequest_initWithOptions", ", buf, 2u);
  }

  if (*(Class *)((char *)&v10->super.super.isa + v11[195]))
    v25 = v10;
  else
    v25 = 0;
  v26 = v25;

  return v26;
}

- (int)parseResults:(id)a3 observations:(id)a4
{
  id v6;
  void *v7;
  VCPHandObservation *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  VCPKeypoint *v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSString *v30;
  int v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  id obj;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;
  NSRect v53;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v38 = v6;
  v39 = a4;
  if (v39)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v6;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v47 != v34)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("attributes"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("handsKeypoints"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v40, "count") != 21)
          {
LABEL_29:

            v31 = -18;
            goto LABEL_31;
          }
          v8 = objc_alloc_init(VCPHandObservation);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          v41 = v40;
          v10 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          if (v10)
          {
            v11 = *(_QWORD *)v43;
            while (2)
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v43 != v11)
                  objc_enumerationMutation(v41);
                v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
                if (objc_msgSend(v13, "count") != 4)
                {

                  goto LABEL_29;
                }
                v14 = objc_alloc_init(VCPKeypoint);
                objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "floatValue");
                v17 = v16;
                objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "floatValue");
                -[VCPKeypoint setLocation:](v14, "setLocation:", v17, v19);

                objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "floatValue");
                -[VCPKeypoint setConfidence:](v14, "setConfidence:");

                objc_msgSend(v9, "addObject:", v14);
                if (self->super._revision == 2 && !-[VCPHandObservation chirality](v8, "chirality"))
                {
                  objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  -[VCPHandObservation setChirality:](v8, "setChirality:", objc_msgSend(v21, "intValue"));

                }
                else if (-[VCPHandObservation chirality](v8, "chirality"))
                {
                  -[VCPHandObservation setChirality:](v8, "setChirality:", 0);
                }

              }
              v10 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
              if (v10)
                continue;
              break;
            }
          }

          -[VCPHandObservation setKeypoints:](v8, "setKeypoints:", v9);
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("attributes"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("handsGroupID"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPHandObservation setGroupID:](v8, "setGroupID:", objc_msgSend(v23, "intValue"));

          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("attributes"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("handsTrackingID"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPHandObservation setHandID:](v8, "setHandID:", objc_msgSend(v25, "intValue"));

          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("attributes"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("handsHoldObject"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "floatValue");
          -[VCPHandObservation setHoldObject:](v8, "setHoldObject:");

          if (self->super._revision == 1)
            v28 = 1;
          else
            v28 = 2;
          -[VCPHandObservation setRevision:](v8, "setRevision:", v28);
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("attributes"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("handsBounds"));
          v30 = (NSString *)objc_claimAutoreleasedReturnValue();
          v53 = NSRectFromString(v30);
          -[VCPHandObservation setBounds:](v8, "setBounds:", v53.origin.x, v53.origin.y, v53.size.width, v53.size.height);

          objc_msgSend(v39, "addObject:", v8);
        }
        v31 = 0;
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (v33)
          continue;
        break;
      }
    }
    else
    {
      v31 = 0;
    }
LABEL_31:

  }
  else
  {
    v31 = -50;
  }

  return v31;
}

- (id)processImage:(__CVBuffer *)a3 withOptions:(id)a4 error:(id *)a5
{
  NSDictionary *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  VCPImageHandsAnalyzer *analyzer;
  VCPImageHandsAnalyzer *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  uint8_t v28[8];
  id v29;
  uint8_t buf[16];

  v7 = (NSDictionary *)a4;
  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPHandPoseImageRequest_processImage", ", buf, 2u);
  }

  -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("handObjects"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("handObjects"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("rotationInDegrees"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getRotationInDegrees(v7));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  analyzer = self->_analyzer;
  if (!analyzer)
  {
    v20 = 0;
    v18 = -18;
LABEL_18:
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v18, 0);
      v25 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    goto LABEL_21;
  }
  -[VCPImageHandsAnalyzer setHandObjects:](analyzer, "setHandObjects:", v13);
  v17 = self->_analyzer;
  v29 = 0;
  v18 = -[VCPImageHandsAnalyzer analyzePixelBuffer:rotationInDegrees:flags:results:cancel:](v17, "analyzePixelBuffer:rotationInDegrees:flags:results:cancel:", a3, v14, buf, &v29, &__block_literal_global_79);
  v19 = v29;
  v20 = v19;
  if (v18)
    goto LABEL_18;
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("HandsResults"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("HandsResults"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[VCPHandPoseImageRequest parseResults:observations:](self, "parseResults:observations:", v22, v15);

    if (v18)
      goto LABEL_18;
  }
  VCPSignPostLog();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)v28 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v24, OS_SIGNPOST_INTERVAL_END, v9, "VCPHandPoseImageRequest_processImage", ", v28, 2u);
  }

  v25 = v15;
LABEL_21:

  return v25;
}

uint64_t __58__VCPHandPoseImageRequest_processImage_withOptions_error___block_invoke()
{
  return 0;
}

- (BOOL)updateWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  int width;
  int height;
  int v9;
  int v10;
  int v12;
  VCPImageHandsAnalyzer *analyzer;
  void *v14;
  BOOL v15;
  objc_super v17;

  v6 = a3;
  width = self->super._width;
  height = self->super._height;
  v17.receiver = self;
  v17.super_class = (Class)VCPHandPoseImageRequest;
  -[VCPRequest updateWithOptions:error:](&v17, sel_updateWithOptions_error_, v6, a4);
  v9 = self->super._width;
  if (width == v9)
  {
    v10 = self->super._height;
    if (width < 1 || height == v10)
      goto LABEL_13;
  }
  else
  {
    if (v9 < 1)
    {
LABEL_13:
      analyzer = self->_analyzer;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("maxNumberHands"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPImageHandsAnalyzer updateMaxNumHands:](analyzer, "updateMaxNumHands:", v14);

      v12 = 0;
      goto LABEL_14;
    }
    v10 = self->super._height;
  }
  if (v10 < 1)
    goto LABEL_13;
  v12 = -[VCPImageHandsAnalyzer updateModelForSourceWidth:sourceHeight:](self->_analyzer, "updateModelForSourceWidth:sourceHeight:");
  if (!v12)
  {
    -[VCPImageHandsAnalyzer preferredInputFormat:height:format:](self->_analyzer, "preferredInputFormat:height:format:", &self->_preferredWidth, &self->_preferredHeight, &self->_preferredFormat);
    goto LABEL_13;
  }
LABEL_14:
  v15 = v12 == 0;

  return v15;
}

- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4
{
  double preferredWidth;
  double preferredHeight;
  CGSize result;

  preferredWidth = (double)self->_preferredWidth;
  preferredHeight = (double)self->_preferredHeight;
  result.height = preferredHeight;
  result.width = preferredWidth;
  return result;
}

- (unsigned)preferredPixelFormat
{
  return self->_preferredFormat;
}

- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4
{
  VCPImageHandsAnalyzer *analyzer;

  analyzer = self->_analyzer;
  self->_analyzer = 0;

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzer, 0);
}

@end
