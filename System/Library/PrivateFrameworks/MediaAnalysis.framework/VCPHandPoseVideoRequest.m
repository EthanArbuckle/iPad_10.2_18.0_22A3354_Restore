@implementation VCPHandPoseVideoRequest

- (VCPHandPoseVideoRequest)init
{
  uint8_t v4[16];

  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Not implemented, please use initWithOptions", v4, 2u);
  }

  return 0;
}

- (VCPHandPoseVideoRequest)initWithOptions:(id)a3
{
  id v4;
  VCPHandPoseVideoRequest *v5;
  VCPHandPoseVideoRequest *v6;
  int maxNumHands;
  VCPImageHandsAnalyzer *v8;
  uint64_t v9;
  VCPImageHandsAnalyzer *analyzer;
  VCPImageHandsAnalyzer *v11;
  VCPHandPoseVideoRequest *v12;
  VCPHandPoseVideoRequest *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VCPHandPoseVideoRequest;
  v5 = -[VCPRequest initWithOptions:](&v18, sel_initWithOptions_, v4);
  v6 = v5;
  if (v5)
  {
    maxNumHands = v5->super._maxNumHands;
    if (maxNumHands <= 0)
      maxNumHands = 6;
    v5->super._maxNumHands = maxNumHands;
    v8 = [VCPImageHandsAnalyzer alloc];
    LODWORD(v17) = v6->super._revision;
    HIDWORD(v15) = v6->super._width;
    LODWORD(v16) = v6->super._height;
    LOBYTE(v15) = 1;
    v9 = -[VCPImageHandsAnalyzer initWithKeypointsOption:forceCPU:sharedModel:enableHandDetection:enableANSTHandDetection:enableRejectHandsNearBoundaries:enableHandObject:sourceWidth:sourceHeight:modelName:revision:options:](v8, "initWithKeypointsOption:forceCPU:sharedModel:enableHandDetection:enableANSTHandDetection:enableRejectHandsNearBoundaries:enableHandObject:sourceWidth:sourceHeight:modelName:revision:options:", v6->super._maxNumHands, v6->super._useCPUOnly, 0, v6->super._enableHandDetection, v6->super._enableANSTHandDetection, v6->super._enableRejectHandsNearBoundaries, v15, v16, CFSTR("hand_keypoint_detector_lite.espresso.net"), v17, v4);
    analyzer = v6->_analyzer;
    v6->_analyzer = (VCPImageHandsAnalyzer *)v9;

    v11 = v6->_analyzer;
    if (v11)
      -[VCPImageHandsAnalyzer preferredInputFormat:height:format:](v11, "preferredInputFormat:height:format:", &v6->_handID, &v6->_preferredWidth, &v6->_preferredHeight);
    *((_DWORD *)&v6->super._minHandSize + 1) = 0;
  }
  if (v6->_analyzer)
    v12 = v6;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (float)handDistance:(id)a3 withhandB:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  float v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  float v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v8)
  {

    v11 = 0.0;
LABEL_14:
    v27 = (float)(21.0 - v11) * 100.0;
    goto LABEL_15;
  }
  v9 = 0;
  v10 = *(_QWORD *)v30;
  v11 = 0.0;
  v12 = 0.0;
  do
  {
    v13 = 0;
    v14 = v9;
    do
    {
      if (*(_QWORD *)v30 != v10)
        objc_enumerationMutation(v7);
      v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v13);
      objc_msgSend(v6, "objectAtIndexedSubscript:", v14 + v13, (_QWORD)v29);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "confidence");
      if (v17 > 0.1)
      {
        objc_msgSend(v16, "confidence");
        if (v18 > 0.1)
        {
          objc_msgSend(v15, "location");
          v20 = v19;
          objc_msgSend(v16, "location");
          v22 = v21;
          objc_msgSend(v15, "location");
          v24 = v23;
          objc_msgSend(v16, "location");
          v26 = vabdd_f64(v20, v22) + vabdd_f64(v24, v25);
          v12 = v12 + v26;
          v11 = v11 + 1.0;
        }
      }

      ++v13;
    }
    while (v8 != v13);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v9 = v14 + v13;
  }
  while (v8);

  if (v11 <= 10.0)
    goto LABEL_14;
  v27 = v12 / v11;
LABEL_15:

  return v27;
}

- (id)processSampleBuffer:(opaqueCMSampleBuffer *)a3 withOptions:(id)a4 error:(id *)a5
{
  void *v8;
  CVImageBufferRef ImageBuffer;
  VCPImageHandsAnalyzer *analyzer;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *existingHands;
  id v18;
  id v20;
  uint64_t v21;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  if (!self->_analyzer)
    goto LABEL_10;
  if (!a3)
  {
    v13 = 0;
    v11 = -50;
    if (a5)
      goto LABEL_12;
    goto LABEL_14;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
LABEL_10:
    v13 = 0;
    v11 = -18;
    goto LABEL_11;
  }
  analyzer = self->_analyzer;
  v20 = 0;
  v11 = -[VCPImageHandsAnalyzer analyzePixelBuffer:flags:results:cancel:](analyzer, "analyzePixelBuffer:flags:results:cancel:", ImageBuffer, &v21, &v20, &__block_literal_global_25);
  v12 = v20;
  v13 = v12;
  if (v11)
    goto LABEL_11;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("HandsResults"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("HandsResults"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[VCPHandPoseImageRequest parseResults:observations:](VCPHandPoseImageRequest, "parseResults:observations:", v15, v8);

    if (v11
      || objc_msgSend(v8, "count")
      && (v11 = -[VCPHandPoseVideoRequest associateHands:withExisingHands:](self, "associateHands:withExisingHands:", v8, self->_existingHands)) != 0)
    {
LABEL_11:
      if (a5)
      {
LABEL_12:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, 0);
        v18 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
LABEL_14:
      v18 = 0;
      goto LABEL_15;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v8);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  existingHands = self->_existingHands;
  self->_existingHands = v16;

  v18 = v8;
LABEL_15:

  return v18;
}

uint64_t __65__VCPHandPoseVideoRequest_processSampleBuffer_withOptions_error___block_invoke()
{
  return 0;
}

- (int)associateHands:(id)a3 withExisingHands:(id)a4
{
  unint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  uint64_t v25;
  uint64_t m;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  uint64_t j;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  id v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  id obj;
  id obja;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v48 = a4;
  if (objc_msgSend(v48, "count"))
  {
    v6 = objc_msgSend(v48, "count");
    if (v6 >= objc_msgSend(v53, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v48);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v7 = v53;
      v41 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
      if (v41)
      {
        v43 = *(_QWORD *)v72;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v72 != v43)
              objc_enumerationMutation(v7);
            v27 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
            v67 = 0u;
            v68 = 0u;
            v69 = 0u;
            v70 = 0u;
            obja = v9;
            v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
            if (v28)
            {
              v54 = 0;
              v29 = 0;
              v52 = *(_QWORD *)v68;
              v30 = 3.4028e38;
              while (2)
              {
                v50 = v28;
                for (j = 0; j != v50; ++j)
                {
                  if (*(_QWORD *)v68 != v52)
                    objc_enumerationMutation(obja);
                  v32 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
                  objc_msgSend(v27, "keypoints");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v14, "count") != 21)
                  {
                    v9 = obja;
                    goto LABEL_61;
                  }
                  objc_msgSend(v32, "keypoints");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v33, "count") == 21;

                  if (!v34)
                  {
                    v9 = obja;
                    goto LABEL_63;
                  }
                  objc_msgSend(v27, "keypoints");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "keypoints");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  -[VCPHandPoseVideoRequest handDistance:withhandB:](self, "handDistance:withhandB:", v35, v36);
                  v38 = v37;

                  if (v38 < v30)
                  {
                    v29 = objc_msgSend(v32, "handID");
                    v39 = v32;

                    v54 = v39;
                    v30 = v38;
                  }
                }
                v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
                if (v28)
                  continue;
                break;
              }
            }
            else
            {
              v54 = 0;
              v29 = 0;
            }

            objc_msgSend(v27, "setHandID:", v29);
            objc_msgSend(obja, "removeObject:", v54);

          }
          v41 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
        }
        while (v41);
        LODWORD(v22) = 0;
        v9 = obja;
      }
      else
      {
        LODWORD(v22) = 0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v53);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v7 = v48;
      v42 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
      if (v42)
      {
        v44 = *(_QWORD *)v64;
LABEL_5:
        obj = 0;
LABEL_6:
        if (*(_QWORD *)v64 != v44)
          objc_enumerationMutation(v7);
        v8 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)obj);
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v9 = v49;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v80, 16);
        if (v10)
        {
          v54 = 0;
          v51 = *(_QWORD *)v60;
          v11 = 3.4028e38;
LABEL_10:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v60 != v51)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v12);
            objc_msgSend(v8, "keypoints");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "count") != 21)
              break;
            objc_msgSend(v13, "keypoints");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "count") == 21;

            if (!v16)
              goto LABEL_63;
            objc_msgSend(v8, "keypoints");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "keypoints");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCPHandPoseVideoRequest handDistance:withhandB:](self, "handDistance:withhandB:", v17, v18);
            v20 = v19;

            if (v20 < v11)
            {
              v21 = v13;

              v11 = v20;
              v54 = v21;
            }
            if (v10 == ++v12)
            {
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v80, 16);
              if (v10)
                goto LABEL_10;

              if (!v54)
                goto LABEL_64;
              objc_msgSend(v54, "setHandID:", objc_msgSend(v8, "handID"));
              objc_msgSend(v9, "removeObject:", v54);

              obj = (char *)obj + 1;
              if (obj != (id)v42)
                goto LABEL_6;
              v42 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
              if (v42)
                goto LABEL_5;
              goto LABEL_22;
            }
          }
LABEL_61:

        }
        else
        {
          v54 = 0;
        }
LABEL_63:

LABEL_64:
        LODWORD(v22) = -18;
      }
      else
      {
LABEL_22:

        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v7 = v49;
        v22 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v79, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v56;
          do
          {
            for (k = 0; k != v22; ++k)
            {
              if (*(_QWORD *)v56 != v23)
                objc_enumerationMutation(v7);
              objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * k), "setHandID:", (*((_DWORD *)&self->super._minHandSize + 1))++);
            }
            v22 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v79, 16);
          }
          while (v22);
        }
        v9 = v7;
      }
    }

  }
  else
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v9 = v53;
    v22 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    if (v22)
    {
      v25 = *(_QWORD *)v76;
      do
      {
        for (m = 0; m != v22; ++m)
        {
          if (*(_QWORD *)v76 != v25)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * m), "setHandID:", (*((_DWORD *)&self->super._minHandSize + 1))++);
        }
        v22 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      }
      while (v22);
    }
  }

  return v22;
}

- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4
{
  double handID;
  double preferredWidth;
  CGSize result;

  handID = (double)self->_handID;
  preferredWidth = (double)self->_preferredWidth;
  result.height = preferredWidth;
  result.width = handID;
  return result;
}

- (unsigned)preferredPixelFormat
{
  return self->_preferredHeight;
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
  objc_storeStrong((id *)&self->_existingHands, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
}

@end
