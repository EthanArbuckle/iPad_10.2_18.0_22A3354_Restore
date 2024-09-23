@implementation VNHumanObservation

- (id)VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[VNHumanObservation torsoprint](self, "torsoprint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _validatedEntityPrintOriginatingRequestSpecifierCompatibility(self, CFSTR("torsoprint"), v7, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (VNTorsoprint)torsoprint
{
  return self->_torsoprint;
}

- (void)setTorsoprint:(id)a3
{
  VNTorsoprint *v4;
  VNTorsoprint *torsoprint;
  id v6;

  v6 = a3;
  v4 = (VNTorsoprint *)objc_msgSend(v6, "copy");
  torsoprint = self->_torsoprint;
  self->_torsoprint = v4;

}

- (VNHumanObservation)initWithOriginatingRequestSpecifier:(id)a3 boundingBox:(CGRect)a4 upperBodyOnly:(BOOL)a5 confidence:(float)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  VNHumanObservation *v14;
  double v15;
  VNHumanObservation *v16;
  VNTorsoprint *torsoprint;
  VNHumanObservation *v18;
  objc_super v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VNHumanObservation;
  v14 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:](&v20, sel_initWithOriginatingRequestSpecifier_boundingBox_, v13, x, y, width, height);
  v16 = v14;
  if (v14)
  {
    *(float *)&v15 = a6;
    -[VNObservation setConfidence:](v14, "setConfidence:", v15);
    torsoprint = v16->_torsoprint;
    v16->_torsoprint = 0;

    v16->_upperBodyOnly = a5;
    v18 = v16;
  }

  return v16;
}

- (VNHumanObservation)initWithCoder:(id)a3
{
  id v4;
  VNHumanObservation *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  VNHumanObservation *v9;
  uint64_t v10;
  VNTorsoprint *torsoprint;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNHumanObservation;
  v5 = -[VNDetectedObjectObservation initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  v6 = objc_msgSend(v4, "vn_decodeCodingVersionForKey:", CFSTR("VNHumanObservation"));
  if ((_DWORD)v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to unarchive %@ object due to coding version mismatch: Currently supported: %u; encoded: %u"),
                   objc_opt_class(),
                   0,
                   v6);
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v8);

LABEL_4:
    v9 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trsPrnt"));
  v10 = objc_claimAutoreleasedReturnValue();
  torsoprint = v5->_torsoprint;
  v5->_torsoprint = (VNTorsoprint *)v10;

  v5->_upperBodyOnly = 1;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("upBdyOnly")))
    v5->_upperBodyOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("upBdyOnly"));
  v9 = v5;
LABEL_8:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNHumanObservation;
  -[VNDetectedObjectObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, CFSTR("VNHumanObservation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_torsoprint, CFSTR("trsPrnt"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_upperBodyOnly, CFSTR("upBdyOnly"));

}

- (id)vn_cloneObject
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNHumanObservation;
  -[VNDetectedObjectObservation vn_cloneObject](&v7, sel_vn_cloneObject);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[VNTorsoprint copy](self->_torsoprint, "copy");
    v5 = *(void **)(v3 + 160);
    *(_QWORD *)(v3 + 160) = v4;

    *(_BYTE *)(v3 + 168) = self->_upperBodyOnly;
  }
  return (id)v3;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNHumanObservation;
  v3 = -[VNDetectedObjectObservation hash](&v9, sel_hash);
  -[VNHumanObservation torsoprint](self, "torsoprint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ __ROR8__(v3, 51);

  v6 = -[VNHumanObservation upperBodyOnly](self, "upperBodyOnly");
  v7 = 21845;
  if (v6)
    v7 = 43690;
  return v7 ^ __ROR8__(v5, 51);
}

- (BOOL)isEqual:(id)a3
{
  VNHumanObservation *v4;
  VNHumanObservation *v5;
  void *v6;
  void *v7;
  char v8;
  _BOOL4 v9;
  _BOOL4 v10;
  objc_super v12;

  v4 = (VNHumanObservation *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)VNHumanObservation;
    if (-[VNDetectedObjectObservation isEqual:](&v12, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNHumanObservation torsoprint](self, "torsoprint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNHumanObservation torsoprint](v5, "torsoprint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = VisionCoreEqualOrNilObjects();

      if ((v8 & 1) != 0)
      {
        v9 = -[VNHumanObservation upperBodyOnly](self, "upperBodyOnly");
        v10 = v9 ^ -[VNHumanObservation upperBodyOnly](v5, "upperBodyOnly") ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }

    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (BOOL)upperBodyOnly
{
  return self->_upperBodyOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torsoprint, 0);
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNDetectHumanRectanglesRequest");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
