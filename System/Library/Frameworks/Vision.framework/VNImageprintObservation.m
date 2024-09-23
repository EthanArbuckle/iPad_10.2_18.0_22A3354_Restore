@implementation VNImageprintObservation

- (VNImageprintObservation)initWithCoder:(id)a3
{
  id v4;
  VNImageprintObservation *v5;
  VNImageprintObservation *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  VNImageprint *v12;
  VNImageprint *imageprint;
  VNImageprint *v14;
  id v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VNImageprintObservation;
  v5 = -[VNObservation initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5 && !objc_msgSend(v4, "vn_decodeCodingVersionForKey:", CFSTR("VNImageprintObservation")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VNImageprint"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_storeStrong((id *)&v5->_imageprint, v7);
LABEL_6:
      v6 = v5;
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_class();
    v16 = 0;
    +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", v9, objc_msgSend(v9, "currentRevision"), &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;
    if (v10)
    {
      v12 = -[VNImageprint initWithImageDescriptor:type:originatingRequestSpecifier:]([VNImageprint alloc], "initWithImageDescriptor:type:originatingRequestSpecifier:", v8, 0, v10);
      imageprint = v5->_imageprint;
      v5->_imageprint = v12;

      v14 = v5->_imageprint;
      if (v14)
        goto LABEL_6;
    }
    else
    {
      objc_msgSend(v4, "failWithError:", v11);

    }
    v6 = 0;
    goto LABEL_12;
  }
  v6 = 0;
LABEL_13:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNImageprintObservation;
  -[VNObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, CFSTR("VNImageprintObservation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageprint, CFSTR("VNImageprint"));

}

- (id)vn_cloneObject
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNImageprintObservation;
  -[VNObservation vn_cloneObject](&v6, sel_vn_cloneObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)-[VNImageprint copy](self->_imageprint, "copy");
    objc_msgSend(v3, "setImageprint:", v4);

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
  v7.super_class = (Class)VNImageprintObservation;
  v3 = -[VNObservation hash](&v7, sel_hash);
  -[VNImageprintObservation imageprint](self, "imageprint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ __ROR8__(v3, 51);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VNImageprintObservation *v4;
  VNImageprintObservation *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = (VNImageprintObservation *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VNImageprintObservation;
    if (-[VNObservation isEqual:](&v10, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNImageprintObservation imageprint](self, "imageprint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNImageprintObservation imageprint](v5, "imageprint");
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

- (float)calculateDistanceFromImageprintObservation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;

  v4 = a3;
  if (v4)
  {
    -[VNImageprintObservation imageprint](self, "imageprint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageprint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "distanceToImageprint:error:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "floatValue");
    v9 = v8;

  }
  else
  {
    v9 = -1.0;
  }

  return v9;
}

- (BOOL)isImageprintValid
{
  return 0;
}

- (VNImageprintObservation)initWithRawImageprintDescriptor:(id)a3
{

  return 0;
}

- (NSData)rawImageprintDescriptor
{
  return 0;
}

- (VNImageprint)imageprint
{
  return self->_imageprint;
}

- (void)setImageprint:(id)a3
{
  objc_storeStrong((id *)&self->_imageprint, a3);
}

- (BOOL)imageprintValid
{
  return self->_imageprintValid;
}

- (NSString)imageprintVersion
{
  return self->_imageprintVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageprintVersion, 0);
  objc_storeStrong((id *)&self->_imageprint, 0);
}

+ (id)observationWithImageprint:(id)a3 error:(id *)a4
{
  id v5;
  VNImageprintObservation *v6;
  VNImageprintObservation *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  VNImageprintObservation *v12;

  v5 = a3;
  if (v5)
  {
    v6 = -[VNObservation initWithRequestRevision:]([VNImageprintObservation alloc], "initWithRequestRevision:", objc_msgSend(v5, "requestRevision"));
    v7 = v6;
    if (v6)
    {
      -[VNImageprintObservation setImageprint:](v6, "setImageprint:", v5);
      v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v5, "descriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "externalImageId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v8, "initWithUUIDString:", v10);

      if (v11)
        -[VNObservation setUUID:](v7, "setUUID:", v11);
      v12 = v7;

    }
    else if (a4)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, CFSTR("Failed creating a new VNImageprintObservation object"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (a4)
  {
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, CFSTR("nil imageprint supplied"));
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNCreateImageprintRequest");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
