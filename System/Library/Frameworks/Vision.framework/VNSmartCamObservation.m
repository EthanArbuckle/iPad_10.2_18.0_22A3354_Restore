@implementation VNSmartCamObservation

- (VNSmartCamObservation)initWithRequestRevision:(unint64_t)a3 smartCamprints:(id)a4
{
  id v6;
  VNSmartCamObservation *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *smartCamprints;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VNSmartCamObservation;
  v7 = -[VNObservation initWithRequestRevision:](&v15, sel_initWithRequestRevision_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    v9 = 96;
    smartCamprints = v7->_smartCamprints;
    v7->_smartCamprints = (NSArray *)v8;

    v11 = v7;
    v12 = -[NSArray count](v7->_smartCamprints, "count");
    if (v12)
    {
      -[NSArray firstObject](v7->_smartCamprints, "firstObject");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v9, "version");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (__CFString *)objc_msgSend(v11, "copy");
    }
    else
    {
      v13 = CFSTR("Undefined");
    }
    objc_storeStrong((id *)&v7->_smartCamprintVersion, v13);
    if (v12)
    {

    }
  }

  return v7;
}

- (VNSmartCamObservation)initWithOriginatingRequestSpecifier:(id)a3 smartCamprints:(id)a4
{
  id v6;
  id v7;
  VNSmartCamObservation *v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *smartCamprints;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VNSmartCamObservation;
  v8 = -[VNObservation initWithOriginatingRequestSpecifier:](&v16, sel_initWithOriginatingRequestSpecifier_, v6);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    v10 = 96;
    smartCamprints = v8->_smartCamprints;
    v8->_smartCamprints = (NSArray *)v9;

    v12 = v8;
    v13 = -[NSArray count](v8->_smartCamprints, "count");
    if (v13)
    {
      -[NSArray firstObject](v8->_smartCamprints, "firstObject");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v10, "version");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (__CFString *)objc_msgSend(v12, "copy");
    }
    else
    {
      v14 = CFSTR("Undefined");
    }
    objc_storeStrong((id *)&v8->_smartCamprintVersion, v14);
    if (v13)
    {

    }
  }

  return v8;
}

- (VNSmartCamObservation)initWithCoder:(id)a3
{
  id v4;
  VNSmartCamObservation *v5;
  VNSmartCamObservation *v6;
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
  NSArray *smartCamprints;
  uint64_t v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)VNSmartCamObservation;
  v5 = -[VNObservation initWithCoder:](&v29, sel_initWithCoder_, v4);
  if (v5 && !objc_msgSend(v4, "vn_decodeCodingVersionForKey:", CFSTR("VNSmartCamObservation")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sc_algo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNSmartCamObservation smartCamprintCurrentVersion](VNSmartCamObservation, "smartCamprintCurrentVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[VNVersionParser isMajorVersion:equalToMajorVersion:](VNVersionParser, "isMajorVersion:equalToMajorVersion:", v7, v8))
    {
      if (!+[VNVersionParser isMinorVersion:equalToMinorVersion:](VNVersionParser, "isMinorVersion:equalToMinorVersion:", v7, v8))VNValidatedLog(2, (uint64_t)CFSTR("Minor component of encoded smartCamprint is different than minor component currently supported by software."), v15, v16, v17, v18, v19, v20, v28);
      objc_storeStrong((id *)&v5->_smartCamprintVersion, v7);
      v21 = (void *)MEMORY[0x1E0C99E60];
      v22 = objc_opt_class();
      objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("sc_descriptors"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_msgSend(v24, "copy");
      smartCamprints = v5->_smartCamprints;
      v5->_smartCamprints = (NSArray *)v25;

      v6 = v5;
    }
    else
    {
      VNValidatedLog(4, (uint64_t)CFSTR("Major component of encoded smartCamprint is different than major component currently supported by software. The smartCamprint object cannot be decoded."), v9, v10, v11, v12, v13, v14, v28);
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
  v5.super_class = (Class)VNSmartCamObservation;
  -[VNObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, CFSTR("VNSmartCamObservation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_smartCamprintVersion, CFSTR("sc_algo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_smartCamprints, CFSTR("sc_descriptors"));

}

- (id)vn_cloneObject
{
  id *v3;
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNSmartCamObservation;
  -[VNObservation vn_cloneObject](&v6, sel_vn_cloneObject);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setSmartCamprints:", self->_smartCamprints);
    objc_storeStrong(v4 + 13, self->_smartCamprintVersion);
  }
  return v4;
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
  v9.super_class = (Class)VNSmartCamObservation;
  v3 = -[VNObservation hash](&v9, sel_hash);
  -[VNSmartCamObservation smartCamprintVersion](self, "smartCamprintVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[VNSmartCamObservation smartCamprints](self, "smartCamprints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ __ROR8__(v5 ^ __ROR8__(v3, 51), 51);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNSmartCamObservation;
  if (-[VNObservation isEqual:](&v13, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[VNSmartCamObservation smartCamprintVersion](self, "smartCamprintVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "smartCamprintVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = VisionCoreEqualOrNilObjects();

    if ((v8 & 1) != 0)
    {
      -[VNSmartCamObservation smartCamprints](self, "smartCamprints");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "smartCamprints");
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

  return v11;
}

- (NSArray)smartCamprints
{
  return self->_smartCamprints;
}

- (void)setSmartCamprints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)smartCamprintVersion
{
  return self->_smartCamprintVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartCamprintVersion, 0);
  objc_storeStrong((id *)&self->_smartCamprints, 0);
}

+ (id)observationWithSmartCamprints:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequestRevision:smartCamprints:", 1, v4);

  return v5;
}

+ (id)smartCamprintCurrentVersion
{
  return +[VNSmartCamprint currentVersion](VNSmartCamprint, "currentVersion");
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNCreateSmartCamprintRequest");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
