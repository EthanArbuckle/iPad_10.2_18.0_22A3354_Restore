@implementation VNRecognizedPointsObservation

- (VNRecognizedPointsObservation)initWithOriginatingRequestSpecifier:(id)a3 keypointReturningObservation:(id)a4
{
  id v6;
  id v7;
  VNRecognizedPointsObservation *v8;
  void *v9;
  id v10;
  VNRecognizedPointsSpecifier *v11;
  VNRecognizedBodyPointsSpecifier *v12;
  VNRecognizedPointsSpecifier *specifier;
  void *v14;
  void *v15;
  VNHumanHandPoseObservation *v16;
  void *v17;
  void *v18;
  VNHumanHandPoseObservation *v19;
  void *v20;
  id v21;
  VNRecognizedAnimalBodyPointsSpecifier *v22;
  void *v23;
  id v24;
  VNRecognizedPointsObservation *v25;
  objc_super v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)VNRecognizedPointsObservation;
  v8 = -[VNObservation initWithOriginatingRequestSpecifier:](&v27, sel_initWithOriginatingRequestSpecifier_, v6);
  if (!v8)
    goto LABEL_21;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2050000000;
  v9 = (void *)getVCPPersonObservationClass_softClass;
  v36 = getVCPPersonObservationClass_softClass;
  if (!getVCPPersonObservationClass_softClass)
  {
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __getVCPPersonObservationClass_block_invoke;
    v31 = &unk_1E4548FA8;
    v32 = &v33;
    __getVCPPersonObservationClass_block_invoke((uint64_t)&v28);
    v9 = (void *)v34[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v33, 8);
  if (objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
  {
    v11 = (VNRecognizedPointsSpecifier *)v7;
    v12 = -[VNRecognizedBodyPointsSpecifier initWithVCPPersonObservation:originatingRequestSpecifier:]([VNRecognizedBodyPointsSpecifier alloc], "initWithVCPPersonObservation:originatingRequestSpecifier:", v11, v6);
    specifier = v8->_specifier;
    v8->_specifier = &v12->super;

    if (objc_msgSend(v6, "requestRevision") == 3737841664)
    {
      -[VNRecognizedPointsSpecifier leftHand](v11, "leftHand");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", objc_opt_class(), 1, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[VNRecognizedPointsObservation initWithOriginatingRequestSpecifier:keypointReturningObservation:]([VNHumanHandPoseObservation alloc], "initWithOriginatingRequestSpecifier:keypointReturningObservation:", v15, v14);
        -[VNRecognizedPointsObservation setLeftHand:](v8, "setLeftHand:", v16);

      }
      -[VNRecognizedPointsSpecifier rightHand](v11, "rightHand");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", objc_opt_class(), 1, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[VNRecognizedPointsObservation initWithOriginatingRequestSpecifier:keypointReturningObservation:]([VNHumanHandPoseObservation alloc], "initWithOriginatingRequestSpecifier:keypointReturningObservation:", v18, v17);
        -[VNRecognizedPointsObservation setRightHand:](v8, "setRightHand:", v19);

      }
    }
    goto LABEL_20;
  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x2050000000;
  v20 = (void *)getVCPHandObservationClass_softClass;
  v36 = getVCPHandObservationClass_softClass;
  if (!getVCPHandObservationClass_softClass)
  {
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __getVCPHandObservationClass_block_invoke;
    v31 = &unk_1E4548FA8;
    v32 = &v33;
    __getVCPHandObservationClass_block_invoke((uint64_t)&v28);
    v20 = (void *)v34[3];
  }
  v21 = objc_retainAutorelease(v20);
  _Block_object_dispose(&v33, 8);
  if (!objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2050000000;
    v23 = (void *)getVCPPetsObservationClass_softClass;
    v36 = getVCPPetsObservationClass_softClass;
    if (!getVCPPetsObservationClass_softClass)
    {
      v28 = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v30 = __getVCPPetsObservationClass_block_invoke;
      v31 = &unk_1E4548FA8;
      v32 = &v33;
      __getVCPPetsObservationClass_block_invoke((uint64_t)&v28);
      v23 = (void *)v34[3];
    }
    v24 = objc_retainAutorelease(v23);
    _Block_object_dispose(&v33, 8);
    if (objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
    {
      v22 = -[VNRecognizedAnimalBodyPointsSpecifier initWithVCPPetsObservation:originatingRequestSpecifier:]([VNRecognizedAnimalBodyPointsSpecifier alloc], "initWithVCPPetsObservation:originatingRequestSpecifier:", v7, v6);
      goto LABEL_19;
    }
LABEL_21:
    v25 = 0;
    goto LABEL_22;
  }
  v22 = -[VNRecognizedHandPointsSpecifier initWithVCPHandObservation:originatingRequestSpecifier:]([VNRecognizedHandPointsSpecifier alloc], "initWithVCPHandObservation:originatingRequestSpecifier:", v7, v6);
LABEL_19:
  v11 = v8->_specifier;
  v8->_specifier = &v22->super;
LABEL_20:

  v25 = v8;
LABEL_22:

  return v25;
}

- (VNRecognizedPointsSpecifier)recognizedPointsSpecifier
{
  return self->_specifier;
}

- (NSArray)availableKeys
{
  return (NSArray *)-[VNRecognizedPointsSpecifier availableKeys](self->_specifier, "availableKeys");
}

- (NSArray)availableGroupKeys
{
  return (NSArray *)-[VNRecognizedPointsSpecifier availableGroupKeys](self->_specifier, "availableGroupKeys");
}

- (NSNumber)groupIdentifier
{
  return (NSNumber *)&unk_1E459C8C8;
}

- (NSDictionary)recognizedPointsForGroupKey:(VNRecognizedPointGroupKey)groupKey error:(NSError *)error
{
  return (NSDictionary *)-[VNRecognizedPointsSpecifier recognizedPointsForGroupKey:error:](self->_specifier, "recognizedPointsForGroupKey:error:", groupKey, error);
}

- (VNRecognizedPoint)recognizedPointForKey:(VNRecognizedPointKey)pointKey error:(NSError *)error
{
  return (VNRecognizedPoint *)-[VNRecognizedPointsSpecifier recognizedPointForKey:error:](self->_specifier, "recognizedPointForKey:error:", pointKey, error);
}

- (MLMultiArray)keypointsMultiArrayAndReturnError:(NSError *)error
{
  return (MLMultiArray *)-[VNRecognizedPointsSpecifier populatedMLMultiArrayAndReturnError:](self->_specifier, "populatedMLMultiArrayAndReturnError:", error);
}

- (VNRecognizedPointsObservation)initWithCoder:(id)a3
{
  id v4;
  VNRecognizedPointsObservation *v5;
  uint64_t v6;
  VNRecognizedPointsSpecifier *specifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNRecognizedPointsObservation;
  v5 = -[VNObservation initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PtSpec"));
    v6 = objc_claimAutoreleasedReturnValue();
    specifier = v5->_specifier;
    v5->_specifier = (VNRecognizedPointsSpecifier *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A1B0B060]();
  v6.receiver = self;
  v6.super_class = (Class)VNRecognizedPointsObservation;
  -[VNObservation encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_specifier, CFSTR("PtSpec"));
  objc_autoreleasePoolPop(v5);

}

- (id)vn_cloneObject
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNRecognizedPointsObservation;
  -[VNObservation vn_cloneObject](&v7, sel_vn_cloneObject);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[VNRecognizedPointsSpecifier copy](self->_specifier, "copy");
    v5 = (void *)v3[12];
    v3[12] = v4;

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  VNRecognizedPointsSpecifier *v5;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VNRecognizedPointsObservation;
  if (-[VNObservation isEqual:](&v8, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = self->_specifier;
    v6 = VisionCoreEqualOrNilObjects();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedPointsObservation;
  return -[VNRecognizedPointsSpecifier hash](self->_specifier, "hash") ^ __ROR8__(-[VNObservation hash](&v3, sel_hash), 51);
}

- (void)addAllJointsToPath:(CGPath *)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGRect v29;

  height = a4.height;
  width = a4.width;
  v28 = *MEMORY[0x1E0C80C00];
  -[VNRecognizedPointsObservation availableKeys](self, "availableKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 7.0 / width;
    v13 = 7.0 / height;
    v14 = *(_QWORD *)v24;
    do
    {
      v15 = 0;
      v16 = v11;
      do
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v8);
        v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15);
        v22 = v16;
        -[VNRecognizedPointsObservation recognizedPointForKey:error:](self, "recognizedPointForKey:error:", v17, &v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v22;

        objc_msgSend(v18, "location");
        v20 = v19 - v12 * 0.5;
        objc_msgSend(v18, "location");
        v29.origin.y = v21 - v13 * 0.5;
        v29.origin.x = v20;
        v29.size.width = v12;
        v29.size.height = v13;
        CGPathAddEllipseInRect(a3, 0, v29);

        ++v15;
        v16 = v11;
      }
      while (v10 != v15);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);

  }
}

- (id)debugQuickLookObject
{
  CGMutablePathRef Mutable;
  const CGPath *v4;
  void *v5;
  void *v6;
  CGColor *v7;
  void *v9;
  objc_super v10;
  _OWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  Mutable = CGPathCreateMutable();
  if (!Mutable)
    return 0;
  v4 = Mutable;
  v10.receiver = self;
  v10.super_class = (Class)VNRecognizedPointsObservation;
  -[VNObservation debugQuickLookObject](&v10, sel_debugQuickLookObject);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    -[VNRecognizedPointsObservation addAllJointsToPath:imageSize:](self, "addAllJointsToPath:imageSize:", v4, VNDebugImageSizeFromObject(v5));
    v11[0] = xmmword_1A15FAF60;
    v11[1] = unk_1A15FAF70;
    v7 = (CGColor *)VNDebugColorFromValues((const CGFloat *)v11);
    VNDebugImageRenderNormalizedCGPathOnImage((uint64_t)v4, v6, v7);
  }
  else
  {
    -[VNRecognizedPointsObservation addAllJointsToPath:imageSize:](self, "addAllJointsToPath:imageSize:", v4, 512.0, 512.0);
    VNDebugPathFromNormalizedCGPath((uint64_t)v4, 512.0, 512.0);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CGPathRelease(v4);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
