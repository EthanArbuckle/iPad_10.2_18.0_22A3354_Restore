@implementation VCPImagePetsAnalyzer

- (VCPImagePetsAnalyzer)initWithMaxNumRegions:(int)a3
{
  VCPImagePetsAnalyzer *v4;
  VCPImagePetsAnalyzer *v5;
  int v6;
  uint64_t v7;
  VCPCNNPetsDetectorV2 *petsDetector;
  VCPImagePetsAnalyzer *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VCPImagePetsAnalyzer;
  v4 = -[VCPImagePetsAnalyzer init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 >= 5)
      v6 = 5;
    else
      v6 = a3;
    if (v6 <= 1)
      v6 = 1;
    v4->_maxNumRegions = v6;
    +[VCPCNNPetsDetectorV2 detector:forceCPU:sharedModel:revision:](VCPCNNPetsDetectorV2, "detector:forceCPU:sharedModel:revision:", 5, 0, 0, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    petsDetector = v5->_petsDetector;
    v5->_petsDetector = (VCPCNNPetsDetectorV2 *)v7;

    v9 = v5;
  }

  return v5;
}

- (int)convertResultsToDict:(id)a3 results:(id)a4
{
  id v5;
  uint64_t v6;
  int v7;
  void *v8;
  NSString *v9;
  double x;
  double y;
  double width;
  double v13;
  double height;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  id obj;
  uint64_t v25;
  id v27;
  uint64_t v28;
  CGAffineTransform v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  _QWORD v35[2];
  const __CFString *v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;
  NSRect v40;
  CGRect v41;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v28)
  {
    v23 = 0;
    v25 = *(_QWORD *)v31;
LABEL_3:
    v6 = 0;
    v7 = v23;
    v23 += v28;
    while (1)
    {
      if (*(_QWORD *)v31 != v25)
        objc_enumerationMutation(obj);
      if (v7 + (int)v6 >= self->_maxNumRegions)
        break;
      v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v6);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("petsBounds"));
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      v40 = NSRectFromString(v9);
      v29.a = 1.0;
      v29.b = 0.0;
      v29.c = 0.0;
      *(_OWORD *)&v29.d = xmmword_1B6FBCA30;
      v29.ty = 1.0;
      v41 = CGRectApplyAffineTransform(v40, &v29);
      v36 = CFSTR("attributes");
      v34[0] = CFSTR("petsBounds");
      if (v41.origin.x < 1.0)
        x = v41.origin.x;
      else
        x = 1.0;
      if (v41.origin.x <= 0.0)
        x = 0.0;
      if (v41.origin.y < 1.0)
        y = v41.origin.y;
      else
        y = 1.0;
      if (v41.origin.y <= 0.0)
        y = 0.0;
      width = 1.0 - v41.origin.x;
      if (v41.size.width < width)
        width = v41.size.width;
      if (v41.size.width <= 0.0)
        v13 = 0.0;
      else
        v13 = width;
      height = 1.0 - v41.origin.y;
      if (v41.size.height < 1.0 - v41.origin.y)
        height = v41.size.height;
      if (v41.size.height <= 0.0)
        v15 = 0.0;
      else
        v15 = height;
      v16 = x;
      v17 = y;
      NSStringFromRect(*(NSRect *)(&v13 - 2));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = CFSTR("petsConfidence");
      v35[0] = v18;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("petsConfidence"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v21);

      if (v28 == ++v6)
      {
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v28)
          goto LABEL_3;
        break;
      }
    }
  }

  return 0;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  id v9;
  int Width;
  int Height;
  int v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v9 = a6;
  *a5 = 0;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (Width <= Height)
    v12 = Height;
  else
    v12 = Width;
  if (Height >= Width)
    v13 = Width;
  else
    v13 = Height;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((float)((float)v12 / (float)v13) > 2.0)
  {
LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
  v16 = -[VCPCNNPetsDetectorV2 petsDetection:petsRegions:petsFaceRegions:cancel:](self->_petsDetector, "petsDetection:petsRegions:petsFaceRegions:cancel:", a3, v14, v15, v9);
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPImagePetsAnalyzer convertResultsToDict:results:](self, "convertResultsToDict:results:", v14, v17);
    -[VCPImagePetsAnalyzer convertResultsToDict:results:](self, "convertResultsToDict:results:", v15, v18);
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(v17, "count"))
      objc_msgSend(v19, "setValue:forKey:", v17, CFSTR("PetsResults"));
    if (objc_msgSend(v18, "count"))
      objc_msgSend(v19, "setValue:forKey:", v18, CFSTR("PetsFaceResults"));
    v20 = objc_retainAutorelease(v19);
    *a5 = v20;

    goto LABEL_14;
  }
LABEL_15:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_petsDetector, 0);
}

@end
