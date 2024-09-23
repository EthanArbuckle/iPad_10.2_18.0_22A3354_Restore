@implementation ULServiceMetaInfo

- (ULServiceMetaInfo)initWithNumClustersLearnedInModel:(id)a3 numRecordingTriggersAtCurrentLOI:(id)a4 numInputValidFingerprints:(id)a5 numInputValidFingerprintsLabeled:(id)a6 numInputValidFingerprintsUnlabeled:(id)a7 numFingerprintsBeforePruning:(id)a8 numFingerprintsAfterPruning:(id)a9 numWiFiAccessPoints:(id)a10 numBLESources:(id)a11 numUWBSources:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  ULServiceMetaInfo *v26;
  ULServiceMetaInfo *v27;
  id v30;
  objc_super v31;

  v17 = a3;
  v30 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v31.receiver = self;
  v31.super_class = (Class)ULServiceMetaInfo;
  v26 = -[ULServiceMetaInfo init](&v31, sel_init);
  v27 = v26;
  if (v26)
  {
    -[ULServiceMetaInfo setNumberOfClustersLearnedInModel:](v26, "setNumberOfClustersLearnedInModel:", v17);
    -[ULServiceMetaInfo setNumberOfRecordingTriggersAtCurrentLocationOfInterest:](v27, "setNumberOfRecordingTriggersAtCurrentLocationOfInterest:", v30);
    -[ULServiceMetaInfo setNumberOfInputValidFingerprints:](v27, "setNumberOfInputValidFingerprints:", v18);
    -[ULServiceMetaInfo setNumberOfInputValidFingerprintsLabeled:](v27, "setNumberOfInputValidFingerprintsLabeled:", v19);
    -[ULServiceMetaInfo setNumberOfInputValidFingerprintsUnLabeled:](v27, "setNumberOfInputValidFingerprintsUnLabeled:", v20);
    -[ULServiceMetaInfo setNumberOfFingerprintsBeforePruning:](v27, "setNumberOfFingerprintsBeforePruning:", v21);
    -[ULServiceMetaInfo setNumberOfFingerprintsAfterPruning:](v27, "setNumberOfFingerprintsAfterPruning:", v22);
    -[ULServiceMetaInfo setNumberOfWiFiAccessPoints:](v27, "setNumberOfWiFiAccessPoints:", v23);
    -[ULServiceMetaInfo setNumberOfBLESources:](v27, "setNumberOfBLESources:", v24);
    -[ULServiceMetaInfo setNumberOfUWBSources:](v27, "setNumberOfUWBSources:", v25);
  }

  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  v5 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)-[NSNumber copyWithZone:](self->_numberOfClustersLearnedInModel, "copyWithZone:", a3);
  v7 = (void *)-[NSNumber copyWithZone:](self->_numberOfRecordingTriggersAtCurrentLocationOfInterest, "copyWithZone:", a3);
  v17 = (void *)-[NSNumber copyWithZone:](self->_numberOfInputValidFingerprints, "copyWithZone:", a3);
  v16 = (void *)-[NSNumber copyWithZone:](self->_numberOfInputValidFingerprintsLabeled, "copyWithZone:", a3);
  v8 = (void *)-[NSNumber copyWithZone:](self->_numberOfInputValidFingerprintsUnLabeled, "copyWithZone:", a3);
  v9 = (void *)-[NSNumber copyWithZone:](self->_numberOfFingerprintsBeforePruning, "copyWithZone:", a3);
  v10 = (void *)-[NSNumber copyWithZone:](self->_numberOfFingerprintsAfterPruning, "copyWithZone:", a3);
  v11 = (void *)-[NSNumber copyWithZone:](self->_numberOfWiFiAccessPoints, "copyWithZone:", a3);
  v12 = (void *)-[NSNumber copyWithZone:](self->_numberOfBLESources, "copyWithZone:", a3);
  v13 = (void *)-[NSNumber copyWithZone:](self->_numberOfUWBSources, "copyWithZone:", a3);
  v15 = (void *)objc_msgSend(v5, "initWithNumClustersLearnedInModel:numRecordingTriggersAtCurrentLOI:numInputValidFingerprints:numInputValidFingerprintsLabeled:numInputValidFingerprintsUnlabeled:numFingerprintsBeforePruning:numFingerprintsAfterPruning:numWiFiAccessPoints:numBLESources:numUWBSources:", v6, v7, v17, v16, v8, v9, v10, v11, v12, v13);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *numberOfClustersLearnedInModel;
  id v5;

  numberOfClustersLearnedInModel = self->_numberOfClustersLearnedInModel;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", numberOfClustersLearnedInModel, CFSTR("numberOfClustersLearnedInModel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfRecordingTriggersAtCurrentLocationOfInterest, CFSTR("numberOfRecordingTriggersAtCurrentLocationOfInterest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfInputValidFingerprints, CFSTR("numberOfInputValidFingerprints"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfInputValidFingerprintsLabeled, CFSTR("numberOfInputValidFingerprintsLabeled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfInputValidFingerprintsUnLabeled, CFSTR("numberOfInputValidFingerprintsUnLabeled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfFingerprintsBeforePruning, CFSTR("numberOfFingerprintsBeforePruning"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfFingerprintsAfterPruning, CFSTR("numberOfFingerprintsAfterPruning"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfWiFiAccessPoints, CFSTR("numberOfWiFiAccessPoints"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfBLESources, CFSTR("numberOfBLESources"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfUWBSources, CFSTR("numberOfUWBSources"));

}

- (ULServiceMetaInfo)initWithCoder:(id)a3
{
  id v4;
  ULServiceMetaInfo *v5;
  void *v6;
  uint64_t v7;
  NSNumber *numberOfClustersLearnedInModel;
  void *v9;
  uint64_t v10;
  NSNumber *numberOfRecordingTriggersAtCurrentLocationOfInterest;
  void *v12;
  uint64_t v13;
  NSNumber *numberOfInputValidFingerprints;
  void *v15;
  uint64_t v16;
  NSNumber *numberOfInputValidFingerprintsLabeled;
  void *v18;
  uint64_t v19;
  NSNumber *numberOfInputValidFingerprintsUnLabeled;
  void *v21;
  uint64_t v22;
  NSNumber *numberOfFingerprintsBeforePruning;
  void *v24;
  uint64_t v25;
  NSNumber *numberOfFingerprintsAfterPruning;
  void *v27;
  uint64_t v28;
  NSNumber *numberOfWiFiAccessPoints;
  void *v30;
  uint64_t v31;
  NSNumber *numberOfBLESources;
  void *v33;
  uint64_t v34;
  NSNumber *numberOfUWBSources;
  ULServiceMetaInfo *v36;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)ULServiceMetaInfo;
  v5 = -[ULServiceMetaInfo init](&v38, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfClustersLearnedInModel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v7 = objc_claimAutoreleasedReturnValue();

    numberOfClustersLearnedInModel = v5->_numberOfClustersLearnedInModel;
    v5->_numberOfClustersLearnedInModel = (NSNumber *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfRecordingTriggersAtCurrentLocationOfInterest"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v10 = objc_claimAutoreleasedReturnValue();

    numberOfRecordingTriggersAtCurrentLocationOfInterest = v5->_numberOfRecordingTriggersAtCurrentLocationOfInterest;
    v5->_numberOfRecordingTriggersAtCurrentLocationOfInterest = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfInputValidFingerprints"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v13 = objc_claimAutoreleasedReturnValue();

    numberOfInputValidFingerprints = v5->_numberOfInputValidFingerprints;
    v5->_numberOfInputValidFingerprints = (NSNumber *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfInputValidFingerprintsLabeled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v16 = objc_claimAutoreleasedReturnValue();

    numberOfInputValidFingerprintsLabeled = v5->_numberOfInputValidFingerprintsLabeled;
    v5->_numberOfInputValidFingerprintsLabeled = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfInputValidFingerprintsUnLabeled"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v19 = objc_claimAutoreleasedReturnValue();

    numberOfInputValidFingerprintsUnLabeled = v5->_numberOfInputValidFingerprintsUnLabeled;
    v5->_numberOfInputValidFingerprintsUnLabeled = (NSNumber *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfFingerprintsBeforePruning"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v22 = objc_claimAutoreleasedReturnValue();

    numberOfFingerprintsBeforePruning = v5->_numberOfFingerprintsBeforePruning;
    v5->_numberOfFingerprintsBeforePruning = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfFingerprintsAfterPruning"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v25 = objc_claimAutoreleasedReturnValue();

    numberOfFingerprintsAfterPruning = v5->_numberOfFingerprintsAfterPruning;
    v5->_numberOfFingerprintsAfterPruning = (NSNumber *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfWiFiAccessPoints"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v28 = objc_claimAutoreleasedReturnValue();

    numberOfWiFiAccessPoints = v5->_numberOfWiFiAccessPoints;
    v5->_numberOfWiFiAccessPoints = (NSNumber *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfBLESources"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v31 = objc_claimAutoreleasedReturnValue();

    numberOfBLESources = v5->_numberOfBLESources;
    v5->_numberOfBLESources = (NSNumber *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfUWBSources"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v34 = objc_claimAutoreleasedReturnValue();

    numberOfUWBSources = v5->_numberOfUWBSources;
    v5->_numberOfUWBSources = (NSNumber *)v34;

    v36 = v5;
  }

  return v5;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  objc_msgSend(v6, "appendFormat:", CFSTR(", numberOfClustersLearnedInModel: %@"), self->_numberOfClustersLearnedInModel);
  objc_msgSend(v6, "appendFormat:", CFSTR(", numberOfRecordingTriggersAtCurrentLocationOfInterest: %@"), self->_numberOfRecordingTriggersAtCurrentLocationOfInterest);
  objc_msgSend(v6, "appendFormat:", CFSTR(", numberOfInputValidFingerprints: %@"), self->_numberOfInputValidFingerprints);
  objc_msgSend(v6, "appendFormat:", CFSTR(", numberOfInputValidFingerprintsLabeled: %@"), self->_numberOfInputValidFingerprintsLabeled);
  objc_msgSend(v6, "appendFormat:", CFSTR(", numberOfInputValidFingerprintsUnLabeled: %@"), self->_numberOfInputValidFingerprintsUnLabeled);
  objc_msgSend(v6, "appendFormat:", CFSTR(", numberOfFingerprintsBeforePruning: %@"), self->_numberOfFingerprintsBeforePruning);
  objc_msgSend(v6, "appendFormat:", CFSTR(", numberOfFingerprintsAfterPruning: %@"), self->_numberOfFingerprintsAfterPruning);
  objc_msgSend(v6, "appendFormat:", CFSTR(", numberOfWiFiAccessPoints: %@"), self->_numberOfWiFiAccessPoints);
  objc_msgSend(v6, "appendFormat:", CFSTR(", numberOfBLESources: %@"), self->_numberOfBLESources);
  objc_msgSend(v6, "appendFormat:", CFSTR(", numberOfUWBSources: %@"), self->_numberOfUWBSources);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[ULServiceMetaInfo numberOfClustersLearnedInModel](self, "numberOfClustersLearnedInModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberOfClustersLearnedInModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {

    }
    else
    {
      -[ULServiceMetaInfo numberOfClustersLearnedInModel](self, "numberOfClustersLearnedInModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberOfClustersLearnedInModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v10)
        goto LABEL_30;
    }
    -[ULServiceMetaInfo numberOfRecordingTriggersAtCurrentLocationOfInterest](self, "numberOfRecordingTriggersAtCurrentLocationOfInterest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberOfRecordingTriggersAtCurrentLocationOfInterest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqual:", v12))
    {

    }
    else
    {
      -[ULServiceMetaInfo numberOfRecordingTriggersAtCurrentLocationOfInterest](self, "numberOfRecordingTriggersAtCurrentLocationOfInterest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberOfRecordingTriggersAtCurrentLocationOfInterest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 != v14)
        goto LABEL_30;
    }
    -[ULServiceMetaInfo numberOfInputValidFingerprints](self, "numberOfInputValidFingerprints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberOfInputValidFingerprints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqual:", v16))
    {

    }
    else
    {
      -[ULServiceMetaInfo numberOfInputValidFingerprints](self, "numberOfInputValidFingerprints");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberOfInputValidFingerprints");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 != v18)
        goto LABEL_30;
    }
    -[ULServiceMetaInfo numberOfInputValidFingerprintsLabeled](self, "numberOfInputValidFingerprintsLabeled");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberOfInputValidFingerprintsLabeled");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqual:", v20))
    {

    }
    else
    {
      -[ULServiceMetaInfo numberOfInputValidFingerprintsLabeled](self, "numberOfInputValidFingerprintsLabeled");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberOfInputValidFingerprintsLabeled");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21 != v22)
        goto LABEL_30;
    }
    -[ULServiceMetaInfo numberOfInputValidFingerprintsUnLabeled](self, "numberOfInputValidFingerprintsUnLabeled");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberOfInputValidFingerprintsUnLabeled");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isEqual:", v24))
    {

    }
    else
    {
      -[ULServiceMetaInfo numberOfInputValidFingerprintsUnLabeled](self, "numberOfInputValidFingerprintsUnLabeled");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberOfInputValidFingerprintsUnLabeled");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25 != v26)
        goto LABEL_30;
    }
    -[ULServiceMetaInfo numberOfFingerprintsBeforePruning](self, "numberOfFingerprintsBeforePruning");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberOfFingerprintsBeforePruning");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "isEqual:", v28))
    {

    }
    else
    {
      -[ULServiceMetaInfo numberOfFingerprintsBeforePruning](self, "numberOfFingerprintsBeforePruning");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberOfFingerprintsBeforePruning");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29 != v30)
        goto LABEL_30;
    }
    -[ULServiceMetaInfo numberOfFingerprintsAfterPruning](self, "numberOfFingerprintsAfterPruning");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberOfFingerprintsAfterPruning");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "isEqual:", v32))
    {

    }
    else
    {
      -[ULServiceMetaInfo numberOfFingerprintsAfterPruning](self, "numberOfFingerprintsAfterPruning");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberOfFingerprintsAfterPruning");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33 != v34)
        goto LABEL_30;
    }
    -[ULServiceMetaInfo numberOfWiFiAccessPoints](self, "numberOfWiFiAccessPoints");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberOfWiFiAccessPoints");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "isEqual:", v36))
    {

    }
    else
    {
      -[ULServiceMetaInfo numberOfWiFiAccessPoints](self, "numberOfWiFiAccessPoints");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberOfWiFiAccessPoints");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37 != v38)
        goto LABEL_30;
    }
    -[ULServiceMetaInfo numberOfBLESources](self, "numberOfBLESources");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberOfBLESources");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "isEqual:", v40))
    {

      goto LABEL_33;
    }
    -[ULServiceMetaInfo numberOfBLESources](self, "numberOfBLESources");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberOfBLESources");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41 == v42)
    {
LABEL_33:
      -[ULServiceMetaInfo numberOfUWBSources](self, "numberOfUWBSources");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberOfUWBSources");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v44, "isEqual:", v45))
      {

        v8 = 1;
      }
      else
      {
        -[ULServiceMetaInfo numberOfUWBSources](self, "numberOfUWBSources");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "numberOfUWBSources");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v46 != v47;

        v8 = !v48;
      }
      goto LABEL_31;
    }
LABEL_30:
    v8 = 0;
LABEL_31:

    goto LABEL_32;
  }
  v8 = 0;
LABEL_32:

  return v8 & 1;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[NSNumber hash](self->_numberOfClustersLearnedInModel, "hash");
  v4 = -[NSNumber hash](self->_numberOfRecordingTriggersAtCurrentLocationOfInterest, "hash") ^ v3;
  v5 = -[NSNumber hash](self->_numberOfInputValidFingerprints, "hash");
  v6 = v4 ^ v5 ^ -[NSNumber hash](self->_numberOfInputValidFingerprintsLabeled, "hash");
  v7 = -[NSNumber hash](self->_numberOfInputValidFingerprintsUnLabeled, "hash");
  v8 = v7 ^ -[NSNumber hash](self->_numberOfFingerprintsBeforePruning, "hash");
  v9 = v6 ^ v8 ^ -[NSNumber hash](self->_numberOfFingerprintsAfterPruning, "hash");
  v10 = -[NSNumber hash](self->_numberOfWiFiAccessPoints, "hash");
  v11 = v10 ^ -[NSNumber hash](self->_numberOfBLESources, "hash");
  return v9 ^ v11 ^ -[NSNumber hash](self->_numberOfUWBSources, "hash");
}

- (ULServiceMetaInfo)init
{
  __assert_rtn("-[ULServiceMetaInfo init]", "ULConnectionDelegateTypes.m", 464, "NO");
}

+ (id)new
{
  __assert_rtn("+[ULServiceMetaInfo new]", "ULConnectionDelegateTypes.m", 469, "NO");
}

- (NSNumber)numberOfClustersLearnedInModel
{
  return self->_numberOfClustersLearnedInModel;
}

- (void)setNumberOfClustersLearnedInModel:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfClustersLearnedInModel, a3);
}

- (NSNumber)numberOfRecordingTriggersAtCurrentLocationOfInterest
{
  return self->_numberOfRecordingTriggersAtCurrentLocationOfInterest;
}

- (void)setNumberOfRecordingTriggersAtCurrentLocationOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfRecordingTriggersAtCurrentLocationOfInterest, a3);
}

- (NSNumber)numberOfInputValidFingerprints
{
  return self->_numberOfInputValidFingerprints;
}

- (void)setNumberOfInputValidFingerprints:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfInputValidFingerprints, a3);
}

- (NSNumber)numberOfInputValidFingerprintsLabeled
{
  return self->_numberOfInputValidFingerprintsLabeled;
}

- (void)setNumberOfInputValidFingerprintsLabeled:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfInputValidFingerprintsLabeled, a3);
}

- (NSNumber)numberOfInputValidFingerprintsUnLabeled
{
  return self->_numberOfInputValidFingerprintsUnLabeled;
}

- (void)setNumberOfInputValidFingerprintsUnLabeled:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfInputValidFingerprintsUnLabeled, a3);
}

- (NSNumber)numberOfFingerprintsBeforePruning
{
  return self->_numberOfFingerprintsBeforePruning;
}

- (void)setNumberOfFingerprintsBeforePruning:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfFingerprintsBeforePruning, a3);
}

- (NSNumber)numberOfFingerprintsAfterPruning
{
  return self->_numberOfFingerprintsAfterPruning;
}

- (void)setNumberOfFingerprintsAfterPruning:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfFingerprintsAfterPruning, a3);
}

- (NSNumber)numberOfWiFiAccessPoints
{
  return self->_numberOfWiFiAccessPoints;
}

- (void)setNumberOfWiFiAccessPoints:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfWiFiAccessPoints, a3);
}

- (NSNumber)numberOfBLESources
{
  return self->_numberOfBLESources;
}

- (void)setNumberOfBLESources:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfBLESources, a3);
}

- (NSNumber)numberOfUWBSources
{
  return self->_numberOfUWBSources;
}

- (void)setNumberOfUWBSources:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfUWBSources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfUWBSources, 0);
  objc_storeStrong((id *)&self->_numberOfBLESources, 0);
  objc_storeStrong((id *)&self->_numberOfWiFiAccessPoints, 0);
  objc_storeStrong((id *)&self->_numberOfFingerprintsAfterPruning, 0);
  objc_storeStrong((id *)&self->_numberOfFingerprintsBeforePruning, 0);
  objc_storeStrong((id *)&self->_numberOfInputValidFingerprintsUnLabeled, 0);
  objc_storeStrong((id *)&self->_numberOfInputValidFingerprintsLabeled, 0);
  objc_storeStrong((id *)&self->_numberOfInputValidFingerprints, 0);
  objc_storeStrong((id *)&self->_numberOfRecordingTriggersAtCurrentLocationOfInterest, 0);
  objc_storeStrong((id *)&self->_numberOfClustersLearnedInModel, 0);
}

@end
