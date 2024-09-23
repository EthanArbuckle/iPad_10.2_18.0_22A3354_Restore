@implementation VCPImageFaceDetector

+ (BOOL)isLivePhotoKeyFrameEnabled
{
  return 0;
}

+ (id)faceDetector
{
  return objc_alloc_init(VCPImageFaceDetector);
}

- (int)faceDetection:(__CVBuffer *)a3 faces:(id)a4 cancel:(id)a5
{
  uint64_t v7;
  int Width;
  int Height;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  BOOL v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  BOOL v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  VCPCNNGazeAnalysis *v31;
  VCPCNNGazeAnalysis *v32;
  unint64_t v33;
  double v34;
  double v35;
  void *v36;
  double x;
  double y;
  double v39;
  double v40;
  VCPFace *v41;
  double v42;
  void *v43;
  void *v44;
  int v46;
  int v47;
  void *context;
  void *v49;
  void *v50;
  id v51;
  uint64_t (**v52)(void);
  char v53;
  uint64_t v54;
  unsigned __int8 v55;
  CGAffineTransform v56;
  void *v57;
  _QWORD v58[3];
  CGRect v59;
  CGRect v60;

  v58[1] = *MEMORY[0x1E0C80C00];
  v51 = a4;
  v52 = (uint64_t (**)(void))a5;
  v7 = MEMORY[0x1BCCA1B2C]();
  Width = CVPixelBufferGetWidth(a3);
  context = (void *)v7;
  Height = CVPixelBufferGetHeight(a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = Width;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1BCCA1B2C]();
  v12 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v13 = (void *)objc_msgSend(v12, "initWithCVPixelBuffer:options:", a3, MEMORY[0x1E0C9AA70]);
  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CEDE90]);
    v15 = v14;
    if (v14
      && (objc_msgSend(v14, "setPreferBackgroundProcessing:", 1),
          objc_msgSend(v15, "setRevision:", 2),
          v58[0] = v15,
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v13, "performRequests:error:", v16, 0),
          v16,
          (v17 & 1) != 0))
    {
      objc_msgSend(v15, "results");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18 == 0;

      if (!v19)
      {
        objc_msgSend(v15, "results");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v20);

      }
      if (+[VCPImageFaceDetector isLivePhotoKeyFrameEnabled](VCPImageFaceDetector, "isLivePhotoKeyFrameEnabled"))
      {
        v21 = objc_alloc_init(MEMORY[0x1E0CEDE68]);
        v22 = v21;
        if (v21
          && (objc_msgSend(v21, "setRevision:", 1),
              objc_msgSend(v22, "setInputFaceObservations:", v10),
              v57 = v22,
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              v24 = objc_msgSend(v13, "performRequests:error:", v23, 0),
              v23,
              (v24 & 1) != 0))
        {
          objc_msgSend(v22, "results");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25 == 0;

          if (!v26)
          {
            objc_msgSend(v22, "results");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addObjectsFromArray:", v27);

          }
          v28 = 0;
          v47 = 0;
        }
        else
        {
          v47 = -18;
          v28 = 4;
        }

      }
      else
      {
        v28 = 0;
        v47 = 0;
      }
    }
    else
    {
      v47 = -18;
      v28 = 4;
    }

  }
  else
  {
    v47 = -108;
    v28 = 4;
  }

  objc_autoreleasePoolPop(v11);
  if (v28)
  {
    v29 = v47;
  }
  else
  {
    +[VCPCNNSmileDetector detector](VCPCNNSmileDetector, "detector");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPCNNPoseEstimator estimator](VCPCNNPoseEstimator, "estimator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_alloc_init(VCPCNNGazeAnalysis);
    v32 = v31;
    v29 = -18;
    if (v49 && v30 && v31)
    {
      v33 = 0;
      v34 = (double)-Height;
      v35 = (double)Height;
      while (1)
      {
        if (objc_msgSend(v10, "count") <= v33)
        {
          v29 = v47;
          goto LABEL_35;
        }
        objc_msgSend(v10, "objectAtIndexedSubscript:", v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v52[2]() & 1) != 0)
          break;
        objc_msgSend(v36, "boundingBox");
        v56.b = 0.0;
        v56.c = 0.0;
        v56.a = (double)v46;
        v56.d = v34;
        v56.tx = 0.0;
        v56.ty = v35;
        v60 = CGRectApplyAffineTransform(v59, &v56);
        x = v60.origin.x;
        y = v60.origin.y;
        v39 = v60.size.width;
        v40 = v60.size.height;
        v55 = 0;
        v29 = objc_msgSend(v49, "detectSmileForFace:inBuffer:smile:", a3, &v55);
        if (v29)
          goto LABEL_34;
        v54 = 0;
        v29 = objc_msgSend(v30, "detectPoseForFace:inBuffer:yaw:", a3, &v54, x, y, v39, v40);
        if (v29)
          goto LABEL_34;
        v53 = 0;
        v29 = -[VCPCNNGazeAnalysis detectEyeOpennessForFace:inBuffer:eyeOpenness:](v32, "detectEyeOpennessForFace:inBuffer:eyeOpenness:", a3, &v53, x, y, v39, v40);
        if (v29)
          goto LABEL_34;
        v41 = objc_alloc_init(VCPFace);
        -[VCPFace setBounds:](v41, "setBounds:", x, y, v39, v40);
        -[VCPFace setSmile:](v41, "setSmile:", v55);
        -[VCPFace setLeftEyeClosed:](v41, "setLeftEyeClosed:", v53 == 0);
        -[VCPFace setRightEyeClosed:](v41, "setRightEyeClosed:", v53 == 0);
        -[VCPFace setYaw:](v41, "setYaw:", v54);
        LODWORD(v42) = -1.0;
        -[VCPFace setFaceQuality:](v41, "setFaceQuality:", v42);
        if (+[VCPImageFaceDetector isLivePhotoKeyFrameEnabled](VCPImageFaceDetector, "isLivePhotoKeyFrameEnabled"))
        {
          objc_msgSend(v50, "objectAtIndexedSubscript:", v33);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "faceCaptureQuality");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "floatValue");
          -[VCPFace setFaceQuality:](v41, "setFaceQuality:");

        }
        objc_msgSend(v51, "addObject:", v41);

        ++v33;
      }
      v29 = -128;
LABEL_34:

    }
LABEL_35:

  }
  objc_autoreleasePoolPop(context);

  return v29;
}

- (BOOL)isDuplicate:(CGRect)a3 withRect:(CGRect)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  _BOOL4 v12;
  float v13;
  float v14;
  float v15;
  float v16;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v12 = CGRectIntersectsRect(a3, a4);
  if (v12)
  {
    v13 = v9 * v8;
    v14 = width * height;
    if (v13 >= v14)
      v15 = v9 * v8;
    else
      v15 = width * height;
    if (v14 >= v13)
      v14 = v9 * v8;
    if (v15 <= (float)(v14 + v14))
    {
      v18.origin.x = v11;
      v16 = v14;
      v18.origin.y = v10;
      v18.size.width = v9;
      v18.size.height = v8;
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      v19 = CGRectIntersection(v18, v20);
      LOBYTE(v12) = v19.size.width * v19.size.height >= (float)(v16 * 0.5);
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (int)aggregateTileResults:(id)a3 tileRect:(CGRect)a4 imageSize:(CGSize)a5 landscape:(BOOL)a6 results:(id)a7
{
  double y;
  double x;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  int v38;
  id v40;
  id obj;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  y = a4.origin.y;
  x = a4.origin.x;
  v53 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v42 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v40;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v48 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v15, "bounds");
          v17 = v16;
          objc_msgSend(v15, "bounds");
          v19 = v18;
          objc_msgSend(v15, "bounds");
          v21 = v20;
          objc_msgSend(v15, "bounds");
          objc_msgSend(v15, "setBounds:", x + v17, y + v19, v21);
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v22 = v42;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          if (v23)
          {
            v24 = *(_QWORD *)v44;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v44 != v24)
                  objc_enumerationMutation(v22);
                objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "bounds");
                v27 = v26;
                v29 = v28;
                v31 = v30;
                v33 = v32;
                objc_msgSend(v15, "bounds");
                if (-[VCPImageFaceDetector isDuplicate:withRect:](self, "isDuplicate:withRect:", v27, v29, v31, v33, v34, v35, v36, v37))
                {
                  objc_msgSend(v11, "addObject:", v15);
                }
              }
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            }
            while (v23);
          }

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v12);
    }

    if (obj && objc_msgSend(obj, "count"))
    {
      objc_msgSend(v42, "addObjectsFromArray:", obj);
      objc_msgSend(v42, "removeObjectsInArray:", v11);
    }
    v38 = 0;
  }
  else
  {
    v38 = -108;
  }

  return v38;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  int Width;
  int Height;
  int v10;
  int v11;
  int v12;
  int v13;
  size_t v14;
  size_t v15;
  uint64_t v16;
  double v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  uint64_t v22;
  void *v23;
  double v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  CGFloat x;
  double y;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id *v47;
  _QWORD *v48;
  id v49;
  void *v50;
  id obj;
  uint64_t v52;
  void *v53;
  uint64_t v55;
  void *v56;
  CGAffineTransform v57;
  CGRect v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[2];
  _QWORD v65[2];
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  _QWORD v70[4];
  _QWORD v71[4];
  _QWORD v72[2];
  _QWORD v73[2];
  _BYTE v74[128];
  uint64_t v75;
  CGRect v76;
  CGRect v77;

  v75 = *MEMORY[0x1E0C80C00];
  v47 = a5;
  v49 = a6;
  *v47 = 0;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (Height >= Width)
    v10 = Width;
  else
    v10 = Height;
  if (Width <= Height)
    v11 = Height;
  else
    v11 = Width;
  if ((float)((float)v11 / (float)v10) <= 2.0)
    v12 = -[VCPImageFaceDetector faceDetection:faces:cancel:](self, "faceDetection:faces:cancel:", a3, v50, v49);
  else
    v12 = -[VCPImageAnalyzer analyzePixelBufferInTiles:results:cancel:](self, "analyzePixelBufferInTiles:results:cancel:", a3, v50, v49);
  v13 = v12;
  if (!v12)
  {
    v14 = CVPixelBufferGetWidth(a3);
    v15 = CVPixelBufferGetHeight(a3);
    v63 = 0uLL;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = v50;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
    if (v16)
    {
      v17 = (double)v14;
      v18 = (double)v15;
      v19 = (unint64_t)(double)v14;
      v20 = (unint64_t)v18;
      v52 = *(_QWORD *)v60;
      v21 = 0.0;
      do
      {
        v22 = 0;
        v55 = v16;
        do
        {
          if (*(_QWORD *)v60 != v52)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v22);
          memset(&v58, 0, sizeof(v58));
          objc_msgSend(v23, "faceBounds:height:", v19, v20, v47);
          v58 = v76;
          v57.a = 1.0;
          *(_OWORD *)&v57.b = v63;
          *(_OWORD *)&v57.d = xmmword_1B6FBCA30;
          v57.ty = 1.0;
          v77 = CGRectApplyAffineTransform(v76, &v57);
          v58 = v77;
          if (v17 < v18)
            v24 = v77.size.width;
          else
            v24 = v77.size.height;
          if (v21 < v24)
            v21 = v24;
          v25 = v19;
          v26 = v20;
          v27 = objc_msgSend(v23, "flagsForOrientation:width:height:", v17 >= v18, v19, v20);
          v28 = MediaAnalysisFacePosition(&v58);
          v72[0] = CFSTR("flags");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v72[1] = CFSTR("attributes");
          v73[0] = v56;
          v70[0] = CFSTR("faceQuality");
          v29 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v23, "faceQuality");
          objc_msgSend(v29, "numberWithFloat:");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v71[0] = v30;
          v70[1] = CFSTR("facePosition");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v28);
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v31;
          if (v58.origin.x < 1.0)
            x = v58.origin.x;
          else
            x = 1.0;
          if (v58.origin.x <= 0.0)
            x = 0.0;
          if (v58.origin.y < 1.0)
            y = v58.origin.y;
          else
            y = 1.0;
          if (v58.origin.y <= 0.0)
            y = 0.0;
          v35 = 1.0 - v58.origin.x;
          if (v58.size.width < 1.0 - v58.origin.x)
            v35 = v58.size.width;
          v71[1] = v31;
          v70[2] = CFSTR("faceBounds");
          if (v58.size.width <= 0.0)
            v35 = 0.0;
          v36 = 1.0 - v58.origin.y;
          if (v58.size.height < 1.0 - v58.origin.y)
            v36 = v58.size.height;
          if (v58.size.height <= 0.0)
            v36 = 0.0;
          NSStringFromRect(*(NSRect *)&x);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v71[2] = v37;
          v70[3] = CFSTR("facePoseYaw");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v23, "yaw"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v71[3] = v38;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 4);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v73[1] = v39;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "addObject:", v40);

          *a4 |= v27;
          ++v22;
          v19 = v25;
          v20 = v26;
        }
        while (v55 != v22);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
      }
      while (v16);
    }
    else
    {
      v21 = 0.0;
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(obj, "count"))
    {
      v42 = MediaAnalysisShotType(v21);
      v68 = CFSTR("attributes");
      v66 = CFSTR("shotType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v43;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v44;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v45);

    }
    if (objc_msgSend(obj, "count", v47))
    {
      *a4 |= 0x20uLL;
      v64[0] = CFSTR("FaceResults");
      v64[1] = CFSTR("ShotTypeResults");
      v65[0] = v53;
      v65[1] = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
      *v48 = (id)objc_claimAutoreleasedReturnValue();
    }

    v13 = 0;
  }

  return v13;
}

@end
