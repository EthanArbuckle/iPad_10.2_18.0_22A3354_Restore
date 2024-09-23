@implementation VNRecognizedPoints3DObservation

- (VNRecognizedPoints3DObservation)initWithOriginatingRequestSpecifier:(id)a3 keypointsReturningObject:(id)a4
{
  id v6;
  id v7;
  VNRecognizedPoints3DObservation *v8;
  VNHumanBodyPose3DSpecifier *v9;
  VNRecognizedPoints3DSpecifier *specifier;
  VNRecognizedPoints3DObservation *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VNRecognizedPoints3DObservation;
  v8 = -[VNObservation initWithOriginatingRequestSpecifier:](&v13, sel_initWithOriginatingRequestSpecifier_, v6);
  if (v8)
  {
    if (objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
    {
      v9 = -[VNHumanBodyPose3DSpecifier initWithHumanBody3DOutput:originatingRequestSpecifier:]([VNHumanBodyPose3DSpecifier alloc], "initWithHumanBody3DOutput:originatingRequestSpecifier:", v7, v6);
      specifier = v8->_specifier;
      v8->_specifier = &v9->super;

    }
    v11 = v8;
  }

  return v8;
}

- (VNRecognizedPoints3DSpecifier)recognizedPointsSpecifier
{
  return self->_specifier;
}

- (NSArray)availableKeys
{
  return (NSArray *)-[VNRecognizedPoints3DSpecifier availableKeys](self->_specifier, "availableKeys");
}

- (NSArray)availableGroupKeys
{
  return (NSArray *)-[VNRecognizedPoints3DSpecifier availableGroupKeys](self->_specifier, "availableGroupKeys");
}

- (id)groupIdentifier
{
  return &unk_1E459C808;
}

- (NSDictionary)recognizedPointsForGroupKey:(VNRecognizedPointGroupKey)groupKey error:(NSError *)error
{
  return (NSDictionary *)-[VNRecognizedPoints3DSpecifier recognizedPointsForGroupKey:error:](self->_specifier, "recognizedPointsForGroupKey:error:", groupKey, error);
}

- (VNRecognizedPoint3D)recognizedPointForKey:(VNRecognizedPointKey)pointKey error:(NSError *)error
{
  return (VNRecognizedPoint3D *)-[VNRecognizedPoints3DSpecifier recognizedPointForKey:error:](self->_specifier, "recognizedPointForKey:error:", pointKey, error);
}

- (VNRecognizedPoints3DObservation)initWithCoder:(id)a3
{
  id v4;
  VNRecognizedPoints3DObservation *v5;
  uint64_t v6;
  VNRecognizedPoints3DSpecifier *specifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNRecognizedPoints3DObservation;
  v5 = -[VNObservation initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("3DPtSpec"));
    v6 = objc_claimAutoreleasedReturnValue();
    specifier = v5->_specifier;
    v5->_specifier = (VNRecognizedPoints3DSpecifier *)v6;

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
  v6.super_class = (Class)VNRecognizedPoints3DObservation;
  -[VNObservation encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_specifier, CFSTR("3DPtSpec"));
  objc_autoreleasePoolPop(v5);

}

- (id)vn_cloneObject
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNRecognizedPoints3DObservation;
  -[VNObservation vn_cloneObject](&v7, sel_vn_cloneObject);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[VNRecognizedPoints3DSpecifier copy](self->_specifier, "copy");
    v5 = (void *)v3[12];
    v3[12] = v4;

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  VNRecognizedPoints3DSpecifier *v5;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VNRecognizedPoints3DObservation;
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
  v3.super_class = (Class)VNRecognizedPoints3DObservation;
  return -[VNRecognizedPoints3DSpecifier hash](self->_specifier, "hash") ^ __ROR8__(-[VNObservation hash](&v3, sel_hash), 51);
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
