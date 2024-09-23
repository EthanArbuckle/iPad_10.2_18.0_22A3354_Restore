@implementation VNImageNeuralHashprintObservation

- (VNImageNeuralHashprintObservation)initWithOriginatingRequestSpecifier:(id)a3 imageNeuralHashprint:(id)a4
{
  id v6;
  id v7;
  VNImageNeuralHashprintObservation *v8;
  uint64_t v9;
  VN6Ac6Cyl5O5oK19HboyMBR *imageNeuralHashprint;
  VNImageNeuralHashprintObservation *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VNImageNeuralHashprintObservation;
  v8 = -[VNObservation initWithOriginatingRequestSpecifier:](&v13, sel_initWithOriginatingRequestSpecifier_, v6);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    imageNeuralHashprint = v8->_imageNeuralHashprint;
    v8->_imageNeuralHashprint = (VN6Ac6Cyl5O5oK19HboyMBR *)v9;

    v11 = v8;
  }

  return v8;
}

- (VNImageNeuralHashprintObservation)initWithCoder:(id)a3
{
  id v4;
  VNImageNeuralHashprintObservation *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  VNImageNeuralHashprintObservation *v9;
  uint64_t v10;
  VN6Ac6Cyl5O5oK19HboyMBR *imageNeuralHashprint;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNImageNeuralHashprintObservation;
  v5 = -[VNObservation initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "vn_decodeCodingVersionForKey:", CFSTR("VNImageNeuralHashprintObservation"));
    if (!(_DWORD)v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nrlHshPrnt"));
      v10 = objc_claimAutoreleasedReturnValue();
      imageNeuralHashprint = v5->_imageNeuralHashprint;
      v5->_imageNeuralHashprint = (VN6Ac6Cyl5O5oK19HboyMBR *)v10;

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
  v5.super_class = (Class)VNImageNeuralHashprintObservation;
  -[VNObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, CFSTR("VNImageNeuralHashprintObservation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageNeuralHashprint, CFSTR("nrlHshPrnt"));

}

- (id)vn_cloneObject
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNImageNeuralHashprintObservation;
  -[VNObservation vn_cloneObject](&v7, sel_vn_cloneObject);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[VN6Ac6Cyl5O5oK19HboyMBR copy](self->_imageNeuralHashprint, "copy");
    v5 = (void *)v3[12];
    v3[12] = v4;

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
  v7.super_class = (Class)VNImageNeuralHashprintObservation;
  v3 = -[VNObservation hash](&v7, sel_hash);
  -[VNImageNeuralHashprintObservation imageNeuralHashprint](self, "imageNeuralHashprint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ __ROR8__(v3, 51);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VNImageNeuralHashprintObservation *v4;
  VNImageNeuralHashprintObservation *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = (VNImageNeuralHashprintObservation *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VNImageNeuralHashprintObservation;
    if (-[VNObservation isEqual:](&v10, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNImageNeuralHashprintObservation imageNeuralHashprint](self, "imageNeuralHashprint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNImageNeuralHashprintObservation imageNeuralHashprint](v5, "imageNeuralHashprint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (VN6Ac6Cyl5O5oK19HboyMBR)imageNeuralHashprint
{
  return (VN6Ac6Cyl5O5oK19HboyMBR *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageNeuralHashprint, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
