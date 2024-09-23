@implementation VCPImageFaceExpressionAnalyzer

- (VCPImageFaceExpressionAnalyzer)initWithFaceResults:(id)a3
{
  id v4;
  VCPImageFaceExpressionAnalyzer *v5;
  uint64_t v6;
  NSArray *faces;
  VCPImageFaceExpressionAnalyzer *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VCPImageFaceExpressionAnalyzer;
  v5 = -[VCPImageFaceExpressionAnalyzer init](&v10, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("FaceResults"));
      v6 = objc_claimAutoreleasedReturnValue();
      faces = v5->_faces;
      v5->_faces = (NSArray *)v6;

    }
    v8 = v5;
  }

  return v5;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  NSArray *faces;
  int Width;
  int Height;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSString *v23;
  double x;
  double y;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id *v35;
  void *context;
  NSArray *obj;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  VCPCNNGazeAnalysis *v41;
  void *v42;
  void *v43;
  uint64_t (**v44)(void);
  char v45;
  uint64_t v46;
  unsigned __int8 v47;
  CGAffineTransform v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  const __CFString *v54;
  void *v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _BYTE v58[128];
  uint64_t v59;
  NSRect v60;
  CGRect v61;

  v59 = *MEMORY[0x1E0C80C00];
  v44 = (uint64_t (**)(void))a6;
  *a5 = 0;
  faces = self->_faces;
  if (!faces || !-[NSArray count](faces, "count"))
  {
    v14 = 0;
    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v53 = 0uLL;
  v13 = MEMORY[0x1BCCA1B2C]();
  +[VCPCNNSmileDetector detector](VCPCNNSmileDetector, "detector");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPCNNPoseEstimator estimator](VCPCNNPoseEstimator, "estimator");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = a5;
  context = (void *)v13;
  v41 = objc_alloc_init(VCPCNNGazeAnalysis);
  v14 = -18;
  v15 = 6;
  if (!v43 || !v42 || !v41)
    goto LABEL_29;
  *a4 &= 0xFFFFFFFFFFFFFFF9;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = self->_faces;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (!v16)
  {
    v15 = 0;
    v14 = 0;
    goto LABEL_28;
  }
  v17 = (double)Width;
  v18 = (double)-Height;
  v19 = (double)Height;
  v39 = *(_QWORD *)v50;
  while (2)
  {
    v38 = v16;
    for (i = 0; i != v38; ++i)
    {
      if (*(_QWORD *)v50 != v39)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
      if ((v44[2]() & 1) != 0)
      {
        v14 = -128;
        goto LABEL_27;
      }
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("attributes"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("faceBounds"));
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        v14 = -18;
        goto LABEL_27;
      }
      v60 = NSRectFromString(v23);
      *(_OWORD *)&v48.b = v53;
      v48.a = v17;
      v48.d = v18;
      v48.tx = 0.0;
      v48.ty = v19;
      v61 = CGRectApplyAffineTransform(v60, &v48);
      x = v61.origin.x;
      y = v61.origin.y;
      v26 = v61.size.width;
      v27 = v61.size.height;
      v47 = 0;
      v14 = objc_msgSend(v43, "detectSmileForFace:inBuffer:smile:", a3, &v47);
      if (v14
        || (v46 = 0, (v14 = objc_msgSend(v42, "detectPoseForFace:inBuffer:yaw:", a3, &v46, x, y, v26, v27)) != 0)
        || (v45 = 0,
            (v14 = -[VCPCNNGazeAnalysis detectEyeOpennessForFace:inBuffer:eyeOpenness:](v41, "detectEyeOpennessForFace:inBuffer:eyeOpenness:", a3, &v45, x, y, v26, v27)) != 0))
      {

LABEL_27:
        v15 = 6;
        goto LABEL_28;
      }
      if (v45)
        v28 = 2 * v47;
      else
        v28 = (2 * v47) | 4;
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("attributes"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v29, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v46);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v31, CFSTR("facePoseYaw"));

      v56[0] = CFSTR("flags");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v56[1] = CFSTR("attributes");
      v57[0] = v32;
      v57[1] = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObject:", v33);

      *a4 |= v28;
    }
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    v15 = 0;
    v14 = 0;
    if (v16)
      continue;
    break;
  }
LABEL_28:

LABEL_29:
  objc_autoreleasePoolPop(context);
  if (!v15 && objc_msgSend(v40, "count"))
  {
    *a4 |= 0x20uLL;
    v54 = CFSTR("FaceResults");
    v55 = v40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
    *v35 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_33:
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faces, 0);
}

@end
