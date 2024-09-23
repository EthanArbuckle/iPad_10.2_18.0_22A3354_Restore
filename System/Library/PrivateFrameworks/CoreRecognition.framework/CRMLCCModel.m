@implementation CRMLCCModel

- (CRMLCCModel)init
{
  CRMLCCModel *v2;
  CRMLCCModel *v3;
  CRMLCCModel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRMLCCModel;
  v2 = -[CRMLModel init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)creditcardResultsFromImage:(id)a3
{
  void *v4;
  _BYTE v6[24];
  void **v7;

  -[CRMLModel activationsFromImage:](self, "activationsFromImage:", a3);
  -[CRMLModel decodeActivations:](self, "decodeActivations:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void **)v6;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v7);
  return v4;
}

- (id)creditcardResultsFromImage:(id)a3 textFeatures:(id)a4 invert:(BOOL)a5 tryPatternMatch:(BOOL)a6
{
  -[CRMLCCModel creditcardMLResultsFromImage:textFeatures:invert:tryPatternMatch:](self, "creditcardMLResultsFromImage:textFeatures:invert:tryPatternMatch:", a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)creditcardMLResultsFromImage:(id)a3 textFeatures:(id)a4 invert:(BOOL)a5 tryPatternMatch:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  const int *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  const int *v29;
  void *v30;
  void *v31;
  const int *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _BOOL4 v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  id v42;
  uint64_t *v43[3];
  _QWORD v44[3];
  _OWORD v45[2];
  _QWORD v46[3];
  _OWORD v47[2];
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  void **v52[2];

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  if (objc_msgSend(v11, "shouldExpandToFullWidth"))
    v12 = INFINITY;
  else
    v12 = 9.0;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  +[GeometricCutTools findCorrectedBoundingBoxOfTextFeature:inImageWithSize:](GeometricCutTools, "findCorrectedBoundingBoxOfTextFeature:inImageWithSize:", v11, (double)(unint64_t)objc_msgSend(v10, "width"), (double)(unint64_t)objc_msgSend(v10, "height"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageByCroppingTextFeature:correctedBoundingBox:padding:networkInputSize:", v11, v13, v12, 6.0, 18.0, 28.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "imageByApplyingHistogramCorrection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImageCut:", v16);
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "provideInsightValue:forKey:", v11, CFSTR("CRInsightsCardImageCutBufferKey"));

    v50 = 0uLL;
    v51 = 0;
    if (v7)
    {
      objc_msgSend(v16, "imageByRotating180");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRMLModel activationsFromImage:](self, "activationsFromImage:", v18);
      std::vector<std::vector<std::vector<float>>>::__vdeallocate((void ***)&v50);
      v50 = v48;
      v51 = v49;
      v49 = 0;
      v48 = 0uLL;
      v52[0] = (void **)&v48;
      std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](v52);

    }
    else
    {
      -[CRMLModel activationsFromImage:](self, "activationsFromImage:", v16);
      std::vector<std::vector<std::vector<float>>>::__vdeallocate((void ***)&v50);
      v50 = v48;
      v51 = v49;
      v49 = 0;
      v48 = 0uLL;
      v52[0] = (void **)&v48;
      std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](v52);
    }
    if (*((_QWORD *)&v50 + 1) != (_QWORD)v50)
    {
      v37 = v6;
      v40 = v7;
      v41 = v13;
      v38 = v16;
      if (v16)
        objc_msgSend(v16, "vImage");
      else
        memset(v47, 0, sizeof(v47));
      v19 = objc_msgSend(v10, "width");
      v20 = objc_msgSend(v10, "height");
      v21 = -[CRMLModel codeMap](self, "codeMap");
      memset(v46, 0, sizeof(v46));
      std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v46, (uint64_t *)v50, *((uint64_t **)&v50 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v50 + 1) - v50) >> 3));
      v22 = (int)*MEMORY[0x24BEB5BB0];
      v23 = (int)*MEMORY[0x24BEB5BA8];
      +[GeometricCutTools geometricRecognitionOf:inDerotatedRegion:withPadding:fromCorrectedBoundingBox:inImageWithSize:withCodeMap:activations:invert:networkInputSize:](GeometricCutTools, "geometricRecognitionOf:inDerotatedRegion:withPadding:fromCorrectedBoundingBox:inImageWithSize:withCodeMap:activations:invert:networkInputSize:", v11, v47, v41, v21, v46, v40, v12, 6.0, (double)v19, (double)v20, (double)*(int *)((char *)&self->super.super.isa + v22), (double)*(int *)((char *)&self->super.super.isa + v23));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v24, "mutableCopy");

      *(_QWORD *)&v48 = v46;
      std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
      v13 = v41;
      objc_msgSend(v11, "subFeatures");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

      if (v26 == 10)
      {
        objc_msgSend(v11, "addKohlsDigitProjection");
        if (v38)
          objc_msgSend(v38, "vImage");
        else
          memset(v45, 0, sizeof(v45));
        v27 = objc_msgSend(v10, "width");
        v28 = objc_msgSend(v10, "height");
        v29 = -[CRMLModel codeMap](self, "codeMap");
        memset(v44, 0, sizeof(v44));
        std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v44, (uint64_t *)v50, *((uint64_t **)&v50 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v50 + 1) - v50) >> 3));
        +[GeometricCutTools geometricRecognitionOf:inDerotatedRegion:withPadding:fromCorrectedBoundingBox:inImageWithSize:withCodeMap:activations:invert:networkInputSize:](GeometricCutTools, "geometricRecognitionOf:inDerotatedRegion:withPadding:fromCorrectedBoundingBox:inImageWithSize:withCodeMap:activations:invert:networkInputSize:", v11, v45, v41, v29, v44, v40, v12, 6.0, (double)v27, (double)v28, (double)*(int *)((char *)&self->super.super.isa + v22), (double)*(int *)((char *)&self->super.super.isa + v23));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v48 = v44;
        std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
        objc_msgSend(v30, "objectForKey:", CFSTR("CardNumber"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v41;
        objc_msgSend(v39, "setObject:forKey:", v31, CFSTR("CardNumber"));

      }
      objc_msgSend(v42, "setObject:forKey:", v39, CFSTR("FastScanningGeometricKey"));
      v32 = -[CRMLModel codeMap](self, "codeMap");
      v33 = -[CRMLModel classCount](self, "classCount");
      memset(v43, 0, sizeof(v43));
      std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v43, (uint64_t *)v50, *((uint64_t **)&v50 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v50 + 1) - v50) >> 3));
      _creditCardImage2stringCTCSegment(v11, v32, v33, v43);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v48 = v43;
      std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
      objc_msgSend(v42, "setObject:forKey:", v34, CFSTR("FastScanningCTCSegmentKey"));
      v16 = v38;
      if (v37)
      {
        +[ActivationMapTools textFromActivationMap:codeMap:invert:](ActivationMapTools, "textFromActivationMap:codeMap:invert:", &v50, -[CRMLModel codeMap](self, "codeMap"), v40);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
          objc_msgSend(v42, "setObject:forKey:", v35, CFSTR("FastScanningPatternSearchKey"));

      }
    }
    *(_QWORD *)&v48 = &v50;
    std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);

  }
  return v42;
}

@end
