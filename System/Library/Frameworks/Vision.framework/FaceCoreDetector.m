@implementation FaceCoreDetector

+ (id)faceDetectorWithOptions:(id)a3
{
  id v3;
  FaceCoreDetector *v4;

  v3 = a3;
  v4 = -[FaceCoreDetector initWithProfile:parameters:]([FaceCoreDetector alloc], "initWithProfile:parameters:", +[FaceCoreDetector findProfileInParameters:](FaceCoreDetector, "findProfileInParameters:", v3), v3);

  return v4;
}

+ (int)findProfileInParameters:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("FCRTrackingType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("FCRTrackingTypeStandard")) & 1) == 0)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FCRTrackingTypeKeypoints")) & 1) != 0)
    {
      v6 = 4;
      goto LABEL_12;
    }
LABEL_6:
    objc_msgSend(v3, "objectForKey:", CFSTR("FCRDetectorType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FCRDetectorTypeFaceDetection")) & 1) != 0)
      {
        v6 = 2;
LABEL_11:

        goto LABEL_12;
      }
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FCRDetectorTypeFastFaceDetection")) & 1) == 0)
      {
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FCRDetectorTypePreciseFaceDetection")) & 1) != 0)
        {
          v6 = 0;
          goto LABEL_11;
        }
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FCRDetectorTypePBM")) & 1) != 0)
        {
          v6 = 1;
          goto LABEL_11;
        }
      }
    }
    v6 = 3;
    goto LABEL_11;
  }
  v6 = 5;
LABEL_12:

  return v6;
}

+ (id)faceDetector
{
  void *v2;
  void *v3;

  FCRFaceDetectionParameters();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FaceCoreDetector faceDetectorWithOptions:](FaceCoreDetector, "faceDetectorWithOptions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)fastFaceDetector
{
  void *v2;
  void *v3;

  FCRFastFaceDetectionParameters();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FaceCoreDetector faceDetectorWithOptions:](FaceCoreDetector, "faceDetectorWithOptions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)preciseFaceDetector
{
  void *v2;
  void *v3;

  FCRPreciseDetectionParameters();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FaceCoreDetector faceDetectorWithOptions:](FaceCoreDetector, "faceDetectorWithOptions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)standardTrackingDetector
{
  void *v2;
  void *v3;

  FCRStandardTrackingParameters();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FaceCoreDetector faceDetectorWithOptions:](FaceCoreDetector, "faceDetectorWithOptions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)keypointTrackingDetector
{
  void *v2;
  void *v3;

  FCRKeypointTrackingParameters();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FaceCoreDetector faceDetectorWithOptions:](FaceCoreDetector, "faceDetectorWithOptions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FaceCoreDetector)initWithOptions:(id)a3
{
  id v4;
  FaceCoreDetector *v5;

  v4 = a3;
  v5 = -[FaceCoreDetector initWithProfile:parameters:](self, "initWithProfile:parameters:", +[FaceCoreDetector findProfileInParameters:](FaceCoreDetector, "findProfileInParameters:", v4), v4);

  return v5;
}

- (FaceCoreDetector)initWithProfile:(int)a3 parameters:(id)a4
{
  uint64_t v4;
  id v6;
  FaceCoreDetector *v7;
  FaceCoreDetector *v8;
  FaceCoreDetector *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FaceCoreDetector;
  v7 = -[FaceCoreDetector init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    -[FaceCoreDetector _createFaceCoreLightApiWithProfile:parameters:](v7, "_createFaceCoreLightApiWithProfile:parameters:", v4, v6);
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)version
{
  void *v2;
  std::string *p_p;
  void *v4;
  std::string __p;

  v2 = (void *)MEMORY[0x1E0CB3940];
  apple::vision::libraries::facecore::FaceCoreAPI::version((apple::vision::libraries::facecore::FaceCoreAPI *)self->_api.__ptr_.__value_, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v2, "stringWithUTF8String:", p_p);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v4;
}

- (void)_updateDetectionParamsValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  if (!v4)
    v4 = (id)MEMORY[0x1E0C9AA70];
  v12 = v4;
  objc_msgSend(v4, "objectForKey:", CFSTR("initial_angle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FaceCoreDetector _setParam:toValue:withDefaultValue:](self, "_setParam:toValue:withDefaultValue:", CFSTR("initial_angle"), v5, &unk_1E954BBA0);

  objc_msgSend(v12, "objectForKey:", CFSTR("eye_and_mouth"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FaceCoreDetector _setParam:toValue:withDefaultValue:](self, "_setParam:toValue:withDefaultValue:", CFSTR("eye_and_mouth"), v6, MEMORY[0x1E0C9AAA0]);

  objc_msgSend(v12, "objectForKey:", CFSTR("FCRDetectionRegion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FaceCoreDetector _parseRegionOfInterestParam:](FaceCoreDetector, "_parseRegionOfInterestParam:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    if ((unint64_t)objc_msgSend(v8, "count") >= 0x65)
      NSLog(CFSTR("Error: LegacyFaceCore - Number of regions of interest is limited to 100."));
    +[FaceCoreDetector _convertRectsToString:](FaceCoreDetector, "_convertRectsToString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FaceCoreDetector _setParam:toValue:withDefaultValue:](self, "_setParam:toValue:withDefaultValue:", CFSTR("FCRDetectionRegion"), v9, 0);

  }
  objc_msgSend(v12, "objectForKey:", CFSTR("FCRTrackingModeKeypoints"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FaceCoreDetector _setParam:toValue:withDefaultValue:](self, "_setParam:toValue:withDefaultValue:", CFSTR("FCRTrackingModeKeypoints"), v10, MEMORY[0x1E0C9AAA0]);

  objc_msgSend(v12, "objectForKey:", CFSTR("kalman_filter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FaceCoreDetector _setParam:toValue:withDefaultValue:](self, "_setParam:toValue:withDefaultValue:", CFSTR("kalman_filter"), v11, &unk_1E954C188);

}

+ (id)_transformROIs:(id)a3 image:(id)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  double (**v9)(id, id, double, double, double, double);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 *v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect v30;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (double (**)(id, id, double, double, double, double))a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v25;
    v13 = (__int128 *)MEMORY[0x1E0C9D648];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v16 = v13[1];
        v22 = *v13;
        v23 = v16;
        objc_msgSend(v15, "getValue:", &v22);
        v20 = 0u;
        v21 = 0u;
        v30.origin.x = v9[2](v9, v8, *(double *)&v22, *((double *)&v22 + 1), *(double *)&v23, *((double *)&v23 + 1));
        *(CGFloat *)&v20 = v30.origin.x;
        *((_QWORD *)&v20 + 1) = *(_QWORD *)&v30.origin.y;
        *(CGFloat *)&v21 = v30.size.width;
        *((_QWORD *)&v21 + 1) = *(_QWORD *)&v30.size.height;
        if (CGRectIsEmpty(v30))
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v13, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        else
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v20, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v17);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  return v10;
}

+ (id)_parseRegionOfInterestParam:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        NSLog(&CFSTR("Error: LegacyFaceCore - Region of interest need to be CGRect wrapped in NSValue or NSArray with CGRects w"
                     "rapped in NSValues.").isa);
        v5 = 0;
        goto LABEL_9;
      }
      v4 = v3;
    }
    v5 = v4;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_9:

  return v5;
}

- (void)_updateExtractionParamsValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  if (!v4)
    v4 = (id)MEMORY[0x1E0C9AA70];
  v13 = v4;
  objc_msgSend(v4, "objectForKey:", CFSTR("initial_angle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FaceCoreDetector _setParam:toValue:withDefaultValue:](self, "_setParam:toValue:withDefaultValue:", CFSTR("initial_angle"), v5, &unk_1E954BBA0);

  objc_msgSend(v13, "objectForKey:", CFSTR("FCRExtractFaceprint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FaceCoreDetector _setParam:toValue:withDefaultValue:](self, "_setParam:toValue:withDefaultValue:", CFSTR("FCRExtractFaceprint"), v6, MEMORY[0x1E0C9AAA0]);

  objc_msgSend(v13, "objectForKey:", CFSTR("FCRExtractLandmarkPoints"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FaceCoreDetector _setParam:toValue:withDefaultValue:](self, "_setParam:toValue:withDefaultValue:", CFSTR("FCRExtractLandmarkPoints"), v7, MEMORY[0x1E0C9AAA0]);

  objc_msgSend(v13, "objectForKey:", CFSTR("FCRDetectBlink"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FaceCoreDetector _setParam:toValue:withDefaultValue:](self, "_setParam:toValue:withDefaultValue:", CFSTR("FCRDetectBlink"), v8, MEMORY[0x1E0C9AAA0]);

  objc_msgSend(v13, "objectForKey:", CFSTR("FCRDetectSmile"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FaceCoreDetector _setParam:toValue:withDefaultValue:](self, "_setParam:toValue:withDefaultValue:", CFSTR("FCRDetectSmile"), v9, MEMORY[0x1E0C9AAA0]);

  objc_msgSend(v13, "objectForKey:", CFSTR("eye_and_mouth"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FaceCoreDetector _setParam:toValue:withDefaultValue:](self, "_setParam:toValue:withDefaultValue:", CFSTR("eye_and_mouth"), v10, MEMORY[0x1E0C9AAA0]);

  objc_msgSend(v13, "objectForKey:", CFSTR("FCRExtractNaturalSmileFeatures"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FaceCoreDetector _setParam:toValue:withDefaultValue:](self, "_setParam:toValue:withDefaultValue:", CFSTR("FCRExtractNaturalSmileFeatures"), v11, MEMORY[0x1E0C9AAA0]);

  objc_msgSend(v13, "objectForKey:", CFSTR("kalman_filter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FaceCoreDetector _setParam:toValue:withDefaultValue:](self, "_setParam:toValue:withDefaultValue:", CFSTR("kalman_filter"), v12, &unk_1E954C188);

}

- (id)detectFacesInImage:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  image v18;
  void **v19;

  v7 = a3;
  v8 = a4;
  v18.var0 = (char *)+[FaceCoreDetector _createImage:](FaceCoreDetector, "_createImage:", v7);
  *(_QWORD *)&v18.var1 = v9;
  -[FaceCoreDetector _updateDetectionParamsValues:](self, "_updateDetectionParamsValues:", v8);
  apple::vision::libraries::facecore::FaceCoreAPI::detectFaces((apple::vision::libraries::facecore::FaceCoreAPI::Impl **)self->_api.__ptr_.__value_, &v18, (uint64_t)&v16);
  v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v11 = (void *)objc_msgSend(v10, "initWithCapacity:", 0x8E38E38E38E38E39 * ((v17 - v16) >> 4));
  v12 = v16;
  v13 = v17;
  while (v12 != v13)
  {
    +[FaceCoreDetector _createFCRFaceFromFace:image:](FaceCoreDetector, "_createFCRFaceFromFace:image:", v12, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v14);

    v12 += 144;
  }
  v19 = (void **)&v16;
  std::vector<apple::vision::libraries::facecore::Face>::__destroy_vector::operator()[abi:ne180100](&v19);

  return v11;
}

- (id)extractDetailsForFaces:(id)a3 inImage:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  _BYTE v19[144];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  image v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.var0 = (char *)+[FaceCoreDetector _createImage:](FaceCoreDetector, "_createImage:", v10);
  *(_QWORD *)&v24.var1 = v12;
  -[FaceCoreDetector _updateExtractionParamsValues:](self, "_updateExtractionParamsValues:", v11);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        +[FaceCoreDetector _createFaceFromFCRFace:image:](FaceCoreDetector, "_createFaceFromFCRFace:image:", v17, v10);
        apple::vision::libraries::facecore::FaceCoreAPI::extractFaceDetails((apple::vision::libraries::facecore::FaceCoreContext ***)self->_api.__ptr_.__value_, &v24, (apple::vision::libraries::facecore::Face *)v19);
        +[FaceCoreDetector _updateFCRFace:fromFace:image:](FaceCoreDetector, "_updateFCRFace:fromFace:image:", v17, v19, v10);
        apple::vision::libraries::facecore::Face::~Face((apple::vision::libraries::facecore::Face *)v19);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v14);
  }

  return v13;
}

+ (image)_createImage:(id)a3
{
  id v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  image result;

  v3 = a3;
  v4 = objc_msgSend(v3, "width");
  v5 = objc_msgSend(v3, "height");
  v6 = objc_msgSend(v3, "alignedImageData");

  v7 = (char *)v6;
  v8 = v4 | ((unint64_t)v5 << 32);
  result.var1 = v8;
  result.var2 = HIDWORD(v8);
  result.var0 = v7;
  return result;
}

+ (Face)_createFaceFromFCRFace:(SEL)a3 image:(id)a4
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  float v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  float v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  float v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  float v42;
  void *v43;
  void *v44;
  uint64_t v45;
  double *var0;
  id v47;
  int v48;
  int v49;
  Face *result;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;

  v7 = a4;
  v8 = a5;
  *(_QWORD *)&retstr->var14 = 0;
  retstr->var17 = 0.0;
  retstr->var18 = 0;
  retstr->var19 = 0.0;
  retstr->var20 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2.var1 = 0u;
  *(_OWORD *)&retstr->var4.var1 = 0u;
  *(_OWORD *)&retstr->var8.var0 = 0u;
  *(_OWORD *)((char *)&retstr->var8.var1 + 4) = 0u;
  retstr->var10.var1 = 0;
  retstr->var10.var2.var0 = 0;
  retstr->var10.var0 = 0;
  *(coord **)((char *)&retstr->var10.var2.var0 + 6) = 0;
  retstr->var16 = 0;
  objc_msgSend(v7, "faceSize");
  retstr->var0 = (int)v9;
  objc_msgSend(v7, "faceAngle");
  retstr->var11 = (int)v10;
  if (v7)
  {
    objc_msgSend(v7, "face");
    v12 = *((double *)&v51 + 1);
    v11 = *(double *)&v51;
  }
  else
  {
    v55 = 0u;
    v59 = 0u;
    v51 = 0u;
    v12 = 0.0;
    v11 = 0.0;
  }
  retstr->var4 = +[FaceCoreDetector _makeYFlippedCoordFromPoint:image:](FaceCoreDetector, "_makeYFlippedCoordFromPoint:image:", v8, v11, v12, v51, v55, v59);
  retstr->var7 = objc_msgSend(v7, "trackDuration");
  retstr->var6 = objc_msgSend(v7, "trackID");
  if (v7)
  {
    objc_msgSend(v7, "leftEye");
    v14 = *((double *)&v52 + 1);
    v13 = *(double *)&v52;
  }
  else
  {
    v56 = 0u;
    v60 = 0u;
    v52 = 0u;
    v14 = 0.0;
    v13 = 0.0;
  }
  retstr->var1 = +[FaceCoreDetector _makeYFlippedCoordFromPoint:image:](FaceCoreDetector, "_makeYFlippedCoordFromPoint:image:", v8, v13, v14, v52, v56, v60);
  if (v7)
  {
    objc_msgSend(v7, "rightEye");
    v16 = *((double *)&v53 + 1);
    v15 = *(double *)&v53;
  }
  else
  {
    v57 = 0u;
    v61 = 0u;
    v53 = 0u;
    v16 = 0.0;
    v15 = 0.0;
  }
  retstr->var2 = +[FaceCoreDetector _makeYFlippedCoordFromPoint:image:](FaceCoreDetector, "_makeYFlippedCoordFromPoint:image:", v8, v15, v16, v53, v57, v61);
  if (v7)
  {
    objc_msgSend(v7, "mouth");
    v18 = *((double *)&v54 + 1);
    v17 = *(double *)&v54;
  }
  else
  {
    v58 = 0u;
    v62 = 0u;
    v54 = 0u;
    v18 = 0.0;
    v17 = 0.0;
  }
  retstr->var3 = +[FaceCoreDetector _makeYFlippedCoordFromPoint:image:](FaceCoreDetector, "_makeYFlippedCoordFromPoint:image:", v8, v17, v18, v54, v58, v62);
  objc_msgSend(v7, "expressionFeatures");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "valueForKey:", CFSTR("FCRFaceExpressionLeftEyeClosed"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var12 = v20 != 0;

  objc_msgSend(v7, "expressionFeatures");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "valueForKey:", CFSTR("FCRFaceExpressionLeftEyeClosedScore"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = 0;
  +[FaceCoreDetector _interpretAsFloat:withDefault:](FaceCoreDetector, "_interpretAsFloat:withDefault:", v22, v23);
  retstr->var14 = v24;

  objc_msgSend(v7, "expressionFeatures");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "valueForKey:", CFSTR("FCRFaceExpressionRightEyeClosed"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var13 = v26 != 0;

  objc_msgSend(v7, "expressionFeatures");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "valueForKey:", CFSTR("FCRFaceExpressionRightEyeClosedScore"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = 0;
  +[FaceCoreDetector _interpretAsFloat:withDefault:](FaceCoreDetector, "_interpretAsFloat:withDefault:", v28, v29);
  retstr->var15 = v30;

  objc_msgSend(v7, "expressionFeatures");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "valueForKey:", CFSTR("FCRFaceExpressionSmile"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var16 = v32 != 0;

  objc_msgSend(v7, "expressionFeatures");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "valueForKey:", CFSTR("FCRFaceExpressionSmileScore"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v35) = 0;
  +[FaceCoreDetector _interpretAsFloat:withDefault:](FaceCoreDetector, "_interpretAsFloat:withDefault:", v34, v35);
  retstr->var17 = v36;

  objc_msgSend(v7, "expressionFeatures");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "valueForKey:", CFSTR("FCRFaceBlurred"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var18 = v38 != 0;

  objc_msgSend(v7, "expressionFeatures");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "valueForKey:", CFSTR("FCRFaceBlurScore"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v41) = 0;
  +[FaceCoreDetector _interpretAsFloat:withDefault:](FaceCoreDetector, "_interpretAsFloat:withDefault:", v40, v41);
  retstr->var19 = v42;

  objc_msgSend(v7, "faceprint");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    objc_msgSend(v7, "faceprint");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "length");

    if (v45)
    {
      std::vector<double>::resize((uint64_t)&retstr->var8, 0x254uLL);
      var0 = retstr->var8.var0;
      objc_msgSend(v7, "faceprint");
      v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      memcpy(var0, (const void *)objc_msgSend(v47, "bytes"), 0x12A0uLL);

    }
  }
  v48 = objc_msgSend(v7, "faceType");
  v49 = v48 == 2;
  if (v48 == 1)
    v49 = 2;
  retstr->var9 = v49;

  return result;
}

+ (id)_createFCRFaceFromFace:(void *)a3 image:(id)a4
{
  id v6;
  FaceCoreFace *v7;

  v6 = a4;
  v7 = objc_alloc_init(FaceCoreFace);
  objc_msgSend(a1, "_updateFCRFace:fromFace:image:", v7, a3, v6);

  return v7;
}

+ (void)_updateFCRFace:(id)a3 fromFace:(void *)a4 image:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  uint64_t *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _QWORD v57[2];
  __int128 v58;
  __int128 v59;
  _QWORD v60[2];
  __int128 v61;
  __int128 v62;
  _QWORD v63[2];
  __int128 v64;
  __int128 v65;
  _QWORD v66[6];
  _QWORD v67[11];
  _QWORD v68[12];

  v68[11] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "setFaceSize:", (double)*(int *)a4);
  objc_msgSend(v8, "setFaceAngle:", (double)*((int *)a4 + 26));
  objc_msgSend(a1, "_makeYFlippedPointFromCoord:image:", (char *)a4 + 28, v9);
  v11 = v10;
  v13 = v12;
  objc_msgSend(a1, "_makeYFlippedRectFromRect:image:", v9, (double)(*((_DWORD *)a4 + 7) - *(_DWORD *)a4), (double)(*((_DWORD *)a4 + 8) + *(_DWORD *)a4), (double)(2 * *(_DWORD *)a4), (double)(2 * *(_DWORD *)a4));
  v66[0] = v11;
  v66[1] = v13;
  v66[2] = v14;
  v66[3] = v15;
  v66[4] = v16;
  v66[5] = v17;
  objc_msgSend(v8, "setFace:", v66);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *((_QWORD *)a4 + 6), *((_QWORD *)a4 + 7) - *((_QWORD *)a4 + 6));
  objc_msgSend(v8, "setFaceprint:", v18);

  v19 = *((_DWORD *)a4 + 18);
  if (v19 == 2)
    v20 = 1;
  else
    v20 = 2 * (v19 == 1);
  objc_msgSend(v8, "setFaceType:", v20);
  objc_msgSend(v8, "setTrackID:", *((int *)a4 + 10));
  objc_msgSend(v8, "setTrackDuration:", *((int *)a4 + 11));
  objc_msgSend(a1, "_makeYFlippedPointFromCoord:image:", (char *)a4 + 4, v9);
  v65 = 0u;
  v64 = 0u;
  v63[0] = v21;
  v63[1] = v22;
  objc_msgSend(v8, "setLeftEye:", v63);
  objc_msgSend(a1, "_makeYFlippedPointFromCoord:image:", (char *)a4 + 12, v9);
  v62 = 0u;
  v61 = 0u;
  v60[0] = v23;
  v60[1] = v24;
  objc_msgSend(v8, "setRightEye:", v60);
  objc_msgSend(a1, "_makeYFlippedPointFromCoord:image:", (char *)a4 + 20, v9);
  v59 = 0u;
  v58 = 0u;
  v57[0] = v25;
  v57[1] = v26;
  objc_msgSend(v8, "setMouth:", v57);
  if (*((_QWORD *)a4 + 10) != *((_QWORD *)a4 + 11))
  {
    v67[0] = CFSTR("FCRFaceLandmarkEyebrowLeft");
    v67[1] = CFSTR("FCRFaceLandmarkEyebrowRight");
    v68[0] = &unk_1E954C390;
    v68[1] = &unk_1E954C3A8;
    v67[2] = CFSTR("FCRFaceLandmarkEyeLeft");
    v67[3] = CFSTR("FCRFaceLandmarkEyeRight");
    v68[2] = &unk_1E954C3C0;
    v68[3] = &unk_1E954C3D8;
    v67[4] = CFSTR("FCRFaceLandmarkLipUpper");
    v67[5] = CFSTR("FCRFaceLandmarkLipLower");
    v68[4] = &unk_1E954C3F0;
    v68[5] = &unk_1E954C408;
    v67[6] = CFSTR("FCRFaceLandmarkMouth");
    v67[7] = CFSTR("FCRFaceLandmarkContour");
    v68[6] = &unk_1E954C420;
    v68[7] = &unk_1E954C438;
    v67[8] = CFSTR("FCRFaceLandmarkNose");
    v67[9] = CFSTR("FCRFaceLandmarkNoseCenter");
    v68[8] = &unk_1E954C450;
    v68[9] = &unk_1E954C468;
    v67[10] = CFSTR("FCRFaceLandmarkNoseTip");
    v68[10] = &unk_1E954C480;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__1;
    v55 = __Block_byref_object_dispose__1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v56 = (id)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __50__FaceCoreDetector__updateFCRFace_fromFace_image___block_invoke;
    v46[3] = &unk_1E954A6B8;
    v49 = a1;
    v50 = a4;
    v48 = &v51;
    v47 = v9;
    objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v46);
    objc_msgSend(v8, "setFaceLandmarkPoints:", v52[5]);

    _Block_object_dispose(&v51, 8);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v28;
  if (*((_BYTE *)a4 + 108))
    objc_msgSend(v28, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("FCRFaceExpressionLeftEyeClosed"));
  LODWORD(v29) = *((_DWORD *)a4 + 28);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setValue:forKey:", v31, CFSTR("FCRFaceExpressionLeftEyeClosedScore"));

  if (*((_BYTE *)a4 + 109))
    objc_msgSend(v30, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("FCRFaceExpressionRightEyeClosed"));
  LODWORD(v32) = *((_DWORD *)a4 + 29);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setValue:forKey:", v33, CFSTR("FCRFaceExpressionRightEyeClosedScore"));

  if (*((_BYTE *)a4 + 120))
    objc_msgSend(v30, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("FCRFaceExpressionSmile"));
  LODWORD(v34) = *((_DWORD *)a4 + 31);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setValue:forKey:", v35, CFSTR("FCRFaceExpressionSmileScore"));

  if (*((_BYTE *)a4 + 128))
    objc_msgSend(v30, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("FCRFaceBlurred"));
  LODWORD(v36) = *((_DWORD *)a4 + 33);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setValue:forKey:", v37, CFSTR("FCRFaceBlurScore"));

  objc_msgSend(v8, "setExpressionFeatures:", v30);
  if (*((_QWORD *)a4 + 17))
  {
    v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "additionalInfo");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
      objc_msgSend(v38, "setValuesForKeysWithDictionary:", v39);
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", **((_QWORD **)a4 + 17), *(_QWORD *)(*((_QWORD *)a4 + 17) + 8));
    objc_msgSend(v38, "setObject:forKey:", v40, CFSTR("FCRSmileAndBlinkFeatures"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*((_QWORD *)a4 + 17) + 16));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKey:", v41, CFSTR("FCRLeftEyeFeaturesOffset"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*((_QWORD *)a4 + 17) + 20));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKey:", v42, CFSTR("FCRRightEyeFeaturesOffset"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*((_QWORD *)a4 + 17) + 32));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKey:", v43, CFSTR("FCRSmileFeaturesOffset"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*((_QWORD *)a4 + 17) + 24));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKey:", v44, CFSTR("FCRBlinkFeaturesSize"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*((_QWORD *)a4 + 17) + 28));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKey:", v45, CFSTR("FCRSmileFeaturesSize"));

    objc_msgSend(v8, "setAdditionalInfo:", v38);
  }

}

uint64_t __50__FaceCoreDetector__updateFCRFace_fromFace_image___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 48), "_addLandmarkOfType:fromMesh:indexes:to:image:", a2, *(_QWORD *)(a1 + 56) + 80, a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
}

+ (void)_addLandmarkOfType:(id)a3 fromMesh:(void *)a4 indexes:(id)a5 to:(id)a6 image:(id)a7
{
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *__p[3];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v26 = a6;
  v14 = a7;
  v25 = v13;
  std::vector<CGPoint>::vector(__p, objc_msgSend(v13, "count"));
  v15 = __p[0];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = v25;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v16);
        v27 = *(_QWORD *)(*(_QWORD *)a4
                        + 8 * objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "unsignedIntegerValue"));
        objc_msgSend(a1, "_makeYFlippedPointFromCoord:image:", &v27, v14);
        v20 = v15 + 2;
        *v15 = v21;
        v15[1] = v22;
        v15 += 2;
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      v15 = v20;
    }
    while (v17);
  }

  v23 = objc_msgSend(v16, "count");
  +[FaceCoreLandmark landmarkWithType:pointCount:points:](FaceCoreLandmark, "landmarkWithType:pointCount:points:", v12, v23, __p[0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v24, v12);

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

}

- (void)_createFaceCoreLightApiWithProfile:(int)a3 parameters:(id)a4
{
  uint64_t v6;
  void ***v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  id v15;
  FaceCoreAPI *value;
  id v17;
  unique_ptr<apple::vision::libraries::facecore::FaceCoreAPI, std::default_delete<apple::vision::libraries::facecore::FaceCoreAPI>> *p_api;
  int v19;
  std::string v20;
  std::string v21;
  std::string __p;
  std::string v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v17 = a4;
  if (a3 >= 6)
  {
    NSLog(CFSTR("Error: LegacyFaceCore - Unknown detector profile parameter."));
    v6 = 3;
  }
  else
  {
    v6 = dword_1D3A888C8[a3];
  }
  v7 = (void ***)operator new();
  apple::vision::libraries::facecore::FaceCoreAPI::FaceCoreAPI(v7, v6);
  v19 = a3;
  p_api = &self->_api;
  std::unique_ptr<apple::vision::libraries::facecore::FaceCoreAPI>::reset[abi:ne180100]((void ****)&self->_api, v7);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v17;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("FCRDetectorType")) & 1) == 0
          && (objc_msgSend(v12, "isEqualToString:", CFSTR("FCRTrackingType")) & 1) == 0)
        {
          if (objc_msgSend(v12, "isEqualToString:", CFSTR("FCRDetectProfiles")))
          {
            if (v19 != 1)
              NSLog(CFSTR("Error: LegacyFaceCore - Profile detection is not supported for this profile."));
          }
          else
          {
            v13 = objc_retainAutorelease(v12);
            std::string::basic_string[abi:ne180100]<0>(&v23, (char *)objc_msgSend(v13, "UTF8String"));
            objc_msgSend(v8, "objectForKey:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            +[FaceCoreDetector _parseOption:value:](FaceCoreDetector, "_parseOption:value:", v13, v14);
            v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v15, "UTF8String"));

            value = p_api->__ptr_.__value_;
            if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
              std::string::__init_copy_ctor_external(&v21, v23.__r_.__value_.__l.__data_, v23.__r_.__value_.__l.__size_);
            else
              v21 = v23;
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              std::string::__init_copy_ctor_external(&v20, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
            else
              v20 = __p;
            (**(void (***)(FaceCoreAPI *, std::string *, std::string *))value)(value, &v21, &v20);
            if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v20.__r_.__value_.__l.__data_);
            if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v21.__r_.__value_.__l.__data_);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v23.__r_.__value_.__l.__data_);
          }
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

}

+ (coord)_makeYFlippedCoordFromPoint:(CGPoint)a3 image:(id)a4
{
  return (coord)((int)a3.x | ((unint64_t)(int)((double)(unint64_t)(objc_msgSend(a4, "height") - 1)
                                                                                - a3.y) << 32));
}

+ (CGPoint)_makeYFlippedPointFromCoord:(coord *)a3 image:(id)a4
{
  int var0;
  uint64_t v6;
  double v7;
  double v8;
  CGPoint result;

  var0 = a3->var0;
  v6 = objc_msgSend(a4, "height");
  v7 = (double)var0;
  v8 = (double)(unint64_t)(v6 + ~a3->var1);
  result.y = v8;
  result.x = v7;
  return result;
}

+ (CGRect)_makeYFlippedRectFromRect:(CGRect)a3 image:(id)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v9 = v8;
  if (v8)
    y = (double)(unint64_t)(objc_msgSend(v8, "height") - 1) - y;

  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)_setParam:(id)a3 toValue:(id)a4 withDefaultValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  FaceCoreAPI *value;
  id v15;
  id v16;
  void *__p[2];
  char v18;
  void *v19[2];
  char v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9)
    v12 = v9;
  else
    v12 = v10;
  v13 = v12;
  value = self->_api.__ptr_.__value_;
  v15 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(v19, (char *)objc_msgSend(v15, "UTF8String"));
  +[FaceCoreDetector _parseOption:value:](FaceCoreDetector, "_parseOption:value:", v15, v13);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v16, "UTF8String"));
  (**(void (***)(FaceCoreAPI *, void **, void **))value)(value, v19, __p);
  if (v18 < 0)
    operator delete(__p[0]);

  if (v20 < 0)
    operator delete(v19[0]);

}

+ (float)_interpretAsFloat:(id)a3 withDefault:(float)a4
{
  id v5;
  void *v6;
  float v7;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    a4 = v7;
  }

  return a4;
}

+ (id)_parseOption:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "_parseNumericOrBoolValue:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = v5;
  }
  v7 = v6;
LABEL_7:

  return v7;
}

+ (id)_parseNumericOrBoolValue:(id)a3
{
  id v3;
  objc_class *v4;
  void *v5;
  int v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;

  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("__NSCFBoolean"));

  if (v6)
  {
    v7 = objc_msgSend(v3, "BOOLValue");
    v8 = CFSTR("false");
    if (v7)
      v8 = CFSTR("true");
    v9 = v8;
  }
  else
  {
    objc_msgSend(v3, "stringValue");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

+ (id)_convertRectsToString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  __int128 *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __CFString *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", &stru_1E954AFB8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v17;
      v8 = (__int128 *)MEMORY[0x1E0C9D648];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
          v11 = v8[1];
          v14 = *v8;
          v15 = v11;
          objc_msgSend(v10, "getValue:", &v14);
          objc_msgSend(v4, "appendFormat:", CFSTR("%d,%d,%d,%d,"), (int)*(double *)&v14, (int)*((double *)&v14 + 1), (int)*(double *)&v15, (int)*((double *)&v15 + 1));
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

    objc_msgSend(v4, "substringWithRange:", 0, objc_msgSend(v4, "length") - 1);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = CFSTR("0,0,0,0");
  }

  return v12;
}

- (void).cxx_destruct
{
  std::unique_ptr<apple::vision::libraries::facecore::FaceCoreAPI>::reset[abi:ne180100]((void ****)&self->_api, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
