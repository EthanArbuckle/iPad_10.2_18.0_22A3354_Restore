@implementation VNFaceLegacyFaceCore

- (VNFaceLegacyFaceCore)initWithFace:(id)a3
{
  id v4;
  char *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  VNFaceLegacyFaceCore *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)VNFaceLegacyFaceCore;
  v5 = -[VNFaceLegacyFaceCore init](&v29, sel_init);
  if (!v5)
    goto LABEL_6;
  v6 = objc_msgSend(v4, "faceType");
  if (v6 >= 3)
  {
    VNValidatedLog(4, (uint64_t)CFSTR("VNFaceLegacyFaceCore:initWithFace: unsupported face profile\n"), v7, v8, v9, v10, v11, v12, v26);
LABEL_6:
    v15 = 0;
    goto LABEL_9;
  }
  *((_QWORD *)v5 + 1) = v6;
  objc_msgSend(v4, "faceSize");
  *((_QWORD *)v5 + 2) = v13;
  objc_msgSend(v4, "faceAngle");
  *((_QWORD *)v5 + 3) = v14;
  if (v4)
  {
    objc_msgSend(v4, "face");
    *(_OWORD *)(v5 + 56) = v26;
    objc_msgSend(v4, "face");
    *(_OWORD *)(v5 + 120) = v27;
    *(_OWORD *)(v5 + 136) = v28;
    objc_msgSend(v4, "leftEye");
    *(_OWORD *)(v5 + 72) = v26;
    objc_msgSend(v4, "rightEye");
    *(_OWORD *)(v5 + 88) = v26;
    objc_msgSend(v4, "mouth");
  }
  else
  {
    *(_OWORD *)(v5 + 120) = 0u;
    *((_QWORD *)v5 + 7) = 0;
    *((_QWORD *)v5 + 8) = 0;
    *(_OWORD *)(v5 + 136) = 0u;
    *((_QWORD *)v5 + 9) = 0;
    *((_QWORD *)v5 + 10) = 0;
    *((_QWORD *)v5 + 11) = 0;
    *((_QWORD *)v5 + 12) = 0;
    v26 = 0u;
  }
  *(_OWORD *)(v5 + 104) = v26;
  *((_QWORD *)v5 + 4) = objc_msgSend(v4, "trackID", (_QWORD)v26);
  *((_QWORD *)v5 + 5) = objc_msgSend(v4, "trackDuration");
  v16 = (void *)objc_opt_class();
  v17 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v4, "expressionFeatures");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "expressionFeatures");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setFaceExpressionFeatureScoreIfDetected:features:detectionKey:scoreKey:featureKey:", v20, v19, *MEMORY[0x1E0CEE480], *MEMORY[0x1E0CEE488], CFSTR("VNFaceLegacyFaceCoreFeature_LeftEyeClosedScore"));

  objc_msgSend(v4, "expressionFeatures");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setFaceExpressionFeatureScoreIfDetected:features:detectionKey:scoreKey:featureKey:", v21, v19, *MEMORY[0x1E0CEE490], *MEMORY[0x1E0CEE498], CFSTR("VNFaceLegacyFaceCoreFeature_RightEyeClosedScore"));

  objc_msgSend(v4, "expressionFeatures");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setFaceExpressionFeatureScoreIfDetected:features:detectionKey:scoreKey:featureKey:", v22, v19, *MEMORY[0x1E0CEE4A0], *MEMORY[0x1E0CEE4A8], CFSTR("VNFaceLegacyFaceCoreFeature_SmileScore"));

  v23 = objc_msgSend(v19, "copy");
  v24 = (void *)*((_QWORD *)v5 + 6);
  *((_QWORD *)v5 + 6) = v23;

  v15 = v5;
LABEL_9:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("VNFaceLegacyFaceCore"));

  objc_msgSend(v8, "encodeInt:forKey:", -[VNFaceLegacyFaceCore profile](self, "profile"), CFSTR("fcr_profile"));
  -[VNFaceLegacyFaceCore faceSize](self, "faceSize");
  *(float *)&v5 = v5;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("fcr_size"), v5);
  -[VNFaceLegacyFaceCore faceAngle](self, "faceAngle");
  *(float *)&v6 = v6;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("fcr_angle"), v6);
  -[VNFaceLegacyFaceCore faceCenter](self, "faceCenter");
  objc_msgSend(v8, "vn_encodePoint:forKey:", CFSTR("fcr_center"));
  -[VNFaceLegacyFaceCore faceBoundingBox](self, "faceBoundingBox");
  objc_msgSend(v8, "vn_encodeRect:forKey:", CFSTR("fcr_bbox"));
  -[VNFaceLegacyFaceCore leftEye](self, "leftEye");
  objc_msgSend(v8, "vn_encodePoint:forKey:", CFSTR("fcr_lefteye"));
  -[VNFaceLegacyFaceCore rightEye](self, "rightEye");
  objc_msgSend(v8, "vn_encodePoint:forKey:", CFSTR("fcr_righteye"));
  -[VNFaceLegacyFaceCore mouth](self, "mouth");
  objc_msgSend(v8, "vn_encodePoint:forKey:", CFSTR("fcr_mouth"));
  objc_msgSend(v8, "encodeInt:forKey:", -[VNFaceLegacyFaceCore trackID](self, "trackID"), CFSTR("fcr_trackid"));
  objc_msgSend(v8, "encodeInt:forKey:", -[VNFaceLegacyFaceCore trackDuration](self, "trackDuration"), CFSTR("fcr_trackduration"));
  -[VNFaceLegacyFaceCore features](self, "features");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("fcr_features"));

}

- (VNFaceLegacyFaceCore)initWithCoder:(id)a3
{
  id v4;
  VNFaceLegacyFaceCore *v5;
  void *v6;
  void *v7;
  VNFaceLegacyFaceCore *v8;
  float v9;
  float v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  uint64_t v23;
  NSDictionary *features;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)VNFaceLegacyFaceCore;
  v5 = -[VNFaceLegacyFaceCore init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VNFaceLegacyFaceCore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && !objc_msgSend(v6, "unsignedIntValue"))
    {
      v5->_profile = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("fcr_profile"));
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("fcr_size"));
      v5->_faceSize = v9;
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("fcr_angle"));
      v5->_faceAngle = v10;
      objc_msgSend(v4, "vn_decodePointForKey:", CFSTR("fcr_center"));
      v5->_faceCenter.x = v11;
      v5->_faceCenter.y = v12;
      objc_msgSend(v4, "vn_decodeRectForKey:", CFSTR("fcr_bbox"));
      v5->_faceBoundingBox.origin.x = v13;
      v5->_faceBoundingBox.origin.y = v14;
      v5->_faceBoundingBox.size.width = v15;
      v5->_faceBoundingBox.size.height = v16;
      objc_msgSend(v4, "vn_decodePointForKey:", CFSTR("fcr_lefteye"));
      v5->_leftEye.x = v17;
      v5->_leftEye.y = v18;
      objc_msgSend(v4, "vn_decodePointForKey:", CFSTR("fcr_righteye"));
      v5->_rightEye.x = v19;
      v5->_rightEye.y = v20;
      objc_msgSend(v4, "vn_decodePointForKey:", CFSTR("fcr_mouth"));
      v5->_mouth.x = v21;
      v5->_mouth.y = v22;
      v5->_trackID = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("fcr_trackid"));
      v5->_trackDuration = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("fcr_trackduration"));
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("fcr_features")))
      {
        if (-[VNFaceLegacyFaceCore initWithCoder:]::ourFeaturesClassSetOnceToken != -1)
          dispatch_once(&-[VNFaceLegacyFaceCore initWithCoder:]::ourFeaturesClassSetOnceToken, &__block_literal_global_20500);
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", -[VNFaceLegacyFaceCore initWithCoder:]::ourFeaturesClassSet, CFSTR("fcr_features"));
        v23 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithCoder:", v4);
      }
      features = v5->_features;
      v5->_features = (NSDictionary *)v23;

      v8 = v5;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  VNFaceLegacyFaceCore *v4;
  VNFaceLegacyFaceCore *v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  int64_t v51;
  unint64_t v52;
  void *v53;
  void *v54;
  CGRect v55;
  CGRect v56;

  v4 = (VNFaceLegacyFaceCore *)a3;
  if (self == v4)
  {
    v13 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
    goto LABEL_10;
  }
  v5 = v4;
  v6 = -[VNFaceLegacyFaceCore profile](self, "profile");
  if (v6 != -[VNFaceLegacyFaceCore profile](v5, "profile"))
    goto LABEL_6;
  -[VNFaceLegacyFaceCore faceSize](self, "faceSize");
  v8 = v7;
  -[VNFaceLegacyFaceCore faceSize](v5, "faceSize");
  if (v8 != v9)
    goto LABEL_6;
  -[VNFaceLegacyFaceCore faceAngle](self, "faceAngle");
  v11 = v10;
  -[VNFaceLegacyFaceCore faceAngle](v5, "faceAngle");
  if (v11 != v12)
    goto LABEL_6;
  -[VNFaceLegacyFaceCore faceCenter](self, "faceCenter");
  v16 = v15;
  v18 = v17;
  -[VNFaceLegacyFaceCore faceCenter](v5, "faceCenter");
  v13 = 0;
  if (v16 != v20 || v18 != v19)
    goto LABEL_7;
  -[VNFaceLegacyFaceCore faceBoundingBox](self, "faceBoundingBox");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[VNFaceLegacyFaceCore faceBoundingBox](v5, "faceBoundingBox");
  v56.origin.x = v29;
  v56.origin.y = v30;
  v56.size.width = v31;
  v56.size.height = v32;
  v55.origin.x = v22;
  v55.origin.y = v24;
  v55.size.width = v26;
  v55.size.height = v28;
  if (!CGRectEqualToRect(v55, v56))
    goto LABEL_6;
  -[VNFaceLegacyFaceCore leftEye](self, "leftEye");
  v34 = v33;
  v36 = v35;
  -[VNFaceLegacyFaceCore leftEye](v5, "leftEye");
  v13 = 0;
  if (v34 != v38)
    goto LABEL_7;
  if (v36 != v37)
    goto LABEL_7;
  -[VNFaceLegacyFaceCore rightEye](self, "rightEye");
  v40 = v39;
  v42 = v41;
  -[VNFaceLegacyFaceCore rightEye](v5, "rightEye");
  v13 = 0;
  if (v40 != v44)
    goto LABEL_7;
  if (v42 != v43)
    goto LABEL_7;
  -[VNFaceLegacyFaceCore mouth](self, "mouth");
  v46 = v45;
  v48 = v47;
  -[VNFaceLegacyFaceCore mouth](v5, "mouth");
  v13 = 0;
  if (v46 != v50 || v48 != v49)
    goto LABEL_7;
  v51 = -[VNFaceLegacyFaceCore trackID](self, "trackID");
  if (v51 == -[VNFaceLegacyFaceCore trackID](v5, "trackID")
    && (v52 = -[VNFaceLegacyFaceCore trackDuration](self, "trackDuration"),
        v52 == -[VNFaceLegacyFaceCore trackDuration](v5, "trackDuration")))
  {
    -[VNFaceLegacyFaceCore features](self, "features");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNFaceLegacyFaceCore features](v5, "features");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v53, "isEqual:", v54);

  }
  else
  {
LABEL_6:
    v13 = 0;
  }
LABEL_7:

LABEL_10:
  return v13;
}

- (unint64_t)requestRevision
{
  return 3737841665;
}

- (unint64_t)profile
{
  return self->_profile;
}

- (double)faceSize
{
  return self->_faceSize;
}

- (double)faceAngle
{
  return self->_faceAngle;
}

- (CGPoint)faceCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_faceCenter.x;
  y = self->_faceCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGRect)faceBoundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_faceBoundingBox.origin.x;
  y = self->_faceBoundingBox.origin.y;
  width = self->_faceBoundingBox.size.width;
  height = self->_faceBoundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)leftEye
{
  double x;
  double y;
  CGPoint result;

  x = self->_leftEye.x;
  y = self->_leftEye.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)rightEye
{
  double x;
  double y;
  CGPoint result;

  x = self->_rightEye.x;
  y = self->_rightEye.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)mouth
{
  double x;
  double y;
  CGPoint result;

  x = self->_mouth.x;
  y = self->_mouth.y;
  result.y = y;
  result.x = x;
  return result;
}

- (int64_t)trackID
{
  return self->_trackID;
}

- (unint64_t)trackDuration
{
  return self->_trackDuration;
}

- (NSDictionary)features
{
  return self->_features;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
}

void __38__VNFaceLegacyFaceCore_initWithCoder___block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_msgSend(v0, "initWithObjects:", v1, v2, objc_opt_class(), 0);
  v4 = (void *)-[VNFaceLegacyFaceCore initWithCoder:]::ourFeaturesClassSet;
  -[VNFaceLegacyFaceCore initWithCoder:]::ourFeaturesClassSet = v3;

}

+ (void)_setFaceExpressionFeatureScoreIfDetected:(id)a3 features:(id)a4 detectionKey:(id)a5 scoreKey:(id)a6 featureKey:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a7;
  objc_msgSend(v17, "objectForKey:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 && (objc_msgSend(v14, "isEqual:", MEMORY[0x1E0C9AAA0]) & 1) == 0)
  {
    objc_msgSend(v17, "objectForKey:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, v13);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
