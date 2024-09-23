@implementation VNSceneObservation

- (VNSceneObservation)initWithRequestRevision:(unint64_t)a3 sceneprints:(id)a4
{
  id v6;
  VNSceneObservation *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *sceneprints;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  VNSceneObservation *v14;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VNSceneObservation;
  v7 = -[VNObservation initWithRequestRevision:](&v16, sel_initWithRequestRevision_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    v9 = 96;
    sceneprints = v7->_sceneprints;
    v7->_sceneprints = (NSArray *)v8;

    v11 = v7;
    v12 = -[NSArray count](v7->_sceneprints, "count");
    if (v12)
    {
      -[NSArray firstObject](v7->_sceneprints, "firstObject");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v9, "version");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (__CFString *)objc_msgSend(v11, "copy");
    }
    else
    {
      v13 = CFSTR("Undefined");
    }
    objc_storeStrong((id *)&v7->_sceneprintVersion, v13);
    if (v12)
    {

    }
    v14 = v7;
  }

  return v7;
}

- (VNSceneObservation)initWithOriginatingRequestSpecifier:(id)a3 sceneprints:(id)a4
{
  id v6;
  id v7;
  VNSceneObservation *v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *sceneprints;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VNSceneObservation;
  v8 = -[VNObservation initWithOriginatingRequestSpecifier:](&v16, sel_initWithOriginatingRequestSpecifier_, v6);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    v10 = 96;
    sceneprints = v8->_sceneprints;
    v8->_sceneprints = (NSArray *)v9;

    v12 = v8;
    v13 = -[NSArray count](v8->_sceneprints, "count");
    if (v13)
    {
      -[NSArray firstObject](v8->_sceneprints, "firstObject");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v10, "version");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (__CFString *)objc_msgSend(v12, "copy");
    }
    else
    {
      v14 = CFSTR("Undefined");
    }
    objc_storeStrong((id *)&v8->_sceneprintVersion, v14);
    if (v13)
    {

    }
  }

  return v8;
}

- (VNSceneObservation)initWithCoder:(id)a3
{
  id v4;
  VNSceneObservation *v5;
  VNSceneObservation *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *sceneprints;
  uint64_t v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)VNSceneObservation;
  v5 = -[VNObservation initWithCoder:](&v29, sel_initWithCoder_, v4);
  if (v5 && !objc_msgSend(v4, "vn_decodeCodingVersionForKey:", CFSTR("VNSceneObservation")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("algo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNSceneObservation sceneprintCurrentVersion](VNSceneObservation, "sceneprintCurrentVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[VNVersionParser isMajorVersion:equalToMajorVersion:](VNVersionParser, "isMajorVersion:equalToMajorVersion:", v7, v8))
    {
      if (!+[VNVersionParser isMinorVersion:equalToMinorVersion:](VNVersionParser, "isMinorVersion:equalToMinorVersion:", v7, v8))VNValidatedLog(2, (uint64_t)CFSTR("Minor component of encoded sceneprint is different than minor component currently supported by software."), v15, v16, v17, v18, v19, v20, v28);
      objc_storeStrong((id *)&v5->_sceneprintVersion, v7);
      v21 = (void *)MEMORY[0x1E0C99E60];
      v22 = objc_opt_class();
      objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("descriptors"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_msgSend(v24, "copy");
      sceneprints = v5->_sceneprints;
      v5->_sceneprints = (NSArray *)v25;

      v6 = v5;
    }
    else
    {
      VNValidatedLog(4, (uint64_t)CFSTR("Major component of encoded sceneprint is different than major component currently supported by software. The sceneprint object cannot be decoded."), v9, v10, v11, v12, v13, v14, v28);
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNSceneObservation;
  -[VNObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, CFSTR("VNSceneObservation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sceneprintVersion, CFSTR("algo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sceneprints, CFSTR("descriptors"));

}

- (id)vn_cloneObject
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNSceneObservation;
  -[VNObservation vn_cloneObject](&v7, sel_vn_cloneObject);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[NSArray copy](self->_sceneprints, "copy");
    v5 = *(void **)(v3 + 96);
    *(_QWORD *)(v3 + 96) = v4;

    objc_storeStrong((id *)(v3 + 104), self->_sceneprintVersion);
  }
  return (id)v3;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNSceneObservation;
  v3 = -[VNObservation hash](&v9, sel_hash);
  -[VNSceneObservation sceneprintVersion](self, "sceneprintVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[VNSceneObservation sceneprints](self, "sceneprints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ __ROR8__(v5 ^ __ROR8__(v3, 51), 51);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  VNSceneObservation *v4;
  VNSceneObservation *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (VNSceneObservation *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VNSceneObservation;
    if (-[VNObservation isEqual:](&v13, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNSceneObservation sceneprintVersion](self, "sceneprintVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNSceneObservation sceneprintVersion](v5, "sceneprintVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = VisionCoreEqualOrNilObjects();

      if ((v8 & 1) != 0)
      {
        -[VNSceneObservation sceneprints](self, "sceneprints");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNSceneObservation sceneprints](v5, "sceneprints");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = VisionCoreEqualOrNilObjects();

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)elementType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[VNSceneObservation sceneprints](self, "sceneprints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "elementType");
  return v4;
}

- (unint64_t)elementCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[VNSceneObservation sceneprints](self, "sceneprints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "elementCount");
  return v4;
}

- (id)data
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[VNSceneObservation sceneprints](self, "sceneprints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "descriptorData");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VNSceneObservation;
    -[VNFeaturePrintObservation data](&v8, sel_data);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (NSArray)sceneprints
{
  return self->_sceneprints;
}

- (NSString)sceneprintVersion
{
  return self->_sceneprintVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneprintVersion, 0);
  objc_storeStrong((id *)&self->_sceneprints, 0);
}

+ (id)sceneprintCurrentVersion
{
  return +[VNSceneprint currentVersion](VNSceneprint, "currentVersion");
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  if (a3 - 3737841664u >= 5)
    return CFSTR("VNGenerateImageFeaturePrintRequest");
  else
    return CFSTR("VNCreateSceneprintRequest");
}

+ (VNSceneObservation)observationWithSceneprints:(id)a3
{
  id v3;
  VNSceneObservation *v4;

  v3 = a3;
  v4 = -[VNSceneObservation initWithRequestRevision:sceneprints:]([VNSceneObservation alloc], "initWithRequestRevision:sceneprints:", 1, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)VNCoreMLTransformerSceneprintsAndReturnError:(id *)a3
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;

  -[VNSceneObservation sceneprints](self, "sceneprints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    a3 = v4;
  }
  else if (a3)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@ does not have any sceneprint data"), v7);

    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    a3 = 0;
  }

  return a3;
}

@end
