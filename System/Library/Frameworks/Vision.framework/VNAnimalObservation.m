@implementation VNAnimalObservation

- (VNAnimalprint)animalprint
{
  return self->_animalprint;
}

- (void)setAnimalprint:(id)a3
{
  objc_storeStrong((id *)&self->_animalprint, a3);
}

- (VNAnimalObservation)initWithAnimalprint:(id)a3 confidence:(float)a4
{
  id v6;
  void *v7;
  double v8;
  VNAnimalObservation *v9;

  v6 = a3;
  objc_msgSend(v6, "originatingRequestSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a4;
  v9 = -[VNAnimalObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:groupId:animalprint:](self, "initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:groupId:animalprint:", v7, MEMORY[0x1E0C9AA60], 0, v6, 0.0, 0.0, 1.0, 1.0, v8);

  return v9;
}

- (VNAnimalObservation)initWithOriginatingRequestSpecifier:(id)a3 boundingBox:(CGRect)a4 confidence:(float)a5 labels:(id)a6 groupId:(id)a7 animalprint:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  VNAnimalObservation *v22;
  uint64_t v23;
  VNAnimalprint *animalprint;
  VNAnimalObservation *v25;
  objc_super v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a3;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v27.receiver = self;
  v27.super_class = (Class)VNAnimalObservation;
  *(float *)&v21 = a5;
  v22 = -[VNRecognizedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:](&v27, sel_initWithOriginatingRequestSpecifier_boundingBox_confidence_labels_segmentationMask_groupId_, v17, v18, 0, v19, x, y, width, height, v21);
  if (v22)
  {
    v23 = objc_msgSend(v20, "copy");
    animalprint = v22->_animalprint;
    v22->_animalprint = (VNAnimalprint *)v23;

    v25 = v22;
  }

  return v22;
}

- (VNAnimalObservation)initWithCoder:(id)a3
{
  id v4;
  VNAnimalObservation *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  VNAnimalObservation *v9;
  uint64_t v10;
  VNAnimalprint *animalprint;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNAnimalObservation;
  v5 = -[VNRecognizedObjectObservation initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "vn_decodeCodingVersionForKey:", CFSTR("VNAnimalObservation"));
    if (!(_DWORD)v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anmlPrnt"));
      v10 = objc_claimAutoreleasedReturnValue();
      animalprint = v5->_animalprint;
      v5->_animalprint = (VNAnimalprint *)v10;

      v9 = v5;
      goto LABEL_6;
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to unarchive %@ object due to coding version mismatch: Currently supported: %u; encoded: %u"),
                   objc_opt_class(),
                   0,
                   v6);
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v8);

  }
  v9 = 0;
LABEL_6:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNAnimalObservation;
  -[VNRecognizedObjectObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, CFSTR("VNAnimalObservation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_animalprint, CFSTR("anmlPrnt"));

}

- (id)vn_cloneObject
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNAnimalObservation;
  -[VNRecognizedObjectObservation vn_cloneObject](&v7, sel_vn_cloneObject);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[VNAnimalprint copy](self->_animalprint, "copy");
    v5 = (void *)v3[22];
    v3[22] = v4;

  }
  return v3;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNAnimalObservation;
  v3 = -[VNRecognizedObjectObservation hash](&v7, sel_hash);
  -[VNAnimalObservation animalprint](self, "animalprint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ __ROR8__(v3, 51);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VNAnimalObservation *v4;
  VNAnimalObservation *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = (VNAnimalObservation *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VNAnimalObservation;
    if (-[VNRecognizedObjectObservation isEqual:](&v10, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNAnimalObservation animalprint](self, "animalprint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNAnimalObservation animalprint](v5, "animalprint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = VisionCoreEqualOrNilObjects();

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animalprint, 0);
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNRecognizeAnimalsRequest");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[VNAnimalObservation animalprint](self, "animalprint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _validatedEntityPrintOriginatingRequestSpecifierCompatibility(self, CFSTR("animalprint"), v7, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
