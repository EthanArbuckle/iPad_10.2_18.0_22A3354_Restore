@implementation HKMedicalRecordOriginIdentifier

- (HKMedicalRecordOriginIdentifier)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKMedicalRecordOriginIdentifier)initWithFHIRIdentifier:(id)a3
{
  return (HKMedicalRecordOriginIdentifier *)-[HKMedicalRecordOriginIdentifier _initWithFHIRIdentifier:signedClinicalDataRecordIdentifier:](self, "_initWithFHIRIdentifier:signedClinicalDataRecordIdentifier:", a3, 0);
}

+ (HKMedicalRecordOriginIdentifier)originIdentifierWithFHIRResourceType:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  HKFHIRIdentifier *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v9 = -[HKFHIRIdentifier initWithResourceType:identifier:]([HKFHIRIdentifier alloc], "initWithResourceType:identifier:", v7, v6);

  v10 = (void *)objc_msgSend(v8, "initWithFHIRIdentifier:", v9);
  return (HKMedicalRecordOriginIdentifier *)v10;
}

- (HKMedicalRecordOriginIdentifier)initWithSignedClinicalDataRecordIdentifier:(id)a3
{
  return (HKMedicalRecordOriginIdentifier *)-[HKMedicalRecordOriginIdentifier _initWithFHIRIdentifier:signedClinicalDataRecordIdentifier:](self, "_initWithFHIRIdentifier:signedClinicalDataRecordIdentifier:", 0, a3);
}

- (id)_initWithFHIRIdentifier:(id)a3 signedClinicalDataRecordIdentifier:(id)a4
{
  id v7;
  id v8;
  int v9;
  HKMedicalRecordOriginIdentifier *v10;
  uint64_t v11;
  HKFHIRIdentifier *fhirIdentifier;
  uint64_t v13;
  NSUUID *signedClinicalDataRecordIdentifier;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = v7 != 0;
  if (v8)
    ++v9;
  if (v9 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicalRecordOriginIdentifier.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(!!fhirIdentifier + !!signedClinicalDataRecordIdentifier) == 1"));

  }
  v17.receiver = self;
  v17.super_class = (Class)HKMedicalRecordOriginIdentifier;
  v10 = -[HKMedicalRecordOriginIdentifier init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    fhirIdentifier = v10->_fhirIdentifier;
    v10->_fhirIdentifier = (HKFHIRIdentifier *)v11;

    v13 = objc_msgSend(v8, "copy");
    signedClinicalDataRecordIdentifier = v10->_signedClinicalDataRecordIdentifier;
    v10->_signedClinicalDataRecordIdentifier = (NSUUID *)v13;

  }
  return v10;
}

- (void)_setFhirIdentifier:(id)a3
{
  HKFHIRIdentifier *v4;
  HKFHIRIdentifier *fhirIdentifier;

  v4 = (HKFHIRIdentifier *)objc_msgSend(a3, "copy");
  fhirIdentifier = self->_fhirIdentifier;
  self->_fhirIdentifier = v4;

}

- (void)_setSignedClinicalDataRecordIdentifier:(id)a3
{
  NSUUID *v4;
  NSUUID *signedClinicalDataRecordIdentifier;

  v4 = (NSUUID *)objc_msgSend(a3, "copy");
  signedClinicalDataRecordIdentifier = self->_signedClinicalDataRecordIdentifier;
  self->_signedClinicalDataRecordIdentifier = v4;

}

+ (id)unitTesting_identifierWithNeitherPropertyAllocated
{
  void *v2;

  +[HKMedicalRecordOriginIdentifier originIdentifierWithFHIRResourceType:identifier:](HKMedicalRecordOriginIdentifier, "originIdentifierWithFHIRResourceType:identifier:", CFSTR("ResourceType"), CFSTR("identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setFhirIdentifier:", 0);
  return v2;
}

+ (id)unitTesting_identifierWithAllPropertiesAllocated
{
  void *v2;
  void *v3;

  +[HKMedicalRecordOriginIdentifier originIdentifierWithFHIRResourceType:identifier:](HKMedicalRecordOriginIdentifier, "originIdentifierWithFHIRResourceType:identifier:", CFSTR("ResourceType"), CFSTR("identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSignedClinicalDataRecordIdentifier:", v3);

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKMedicalRecordOriginIdentifier *v6;
  HKMedicalRecordOriginIdentifier *v7;
  HKMedicalRecordOriginIdentifier *v8;
  HKFHIRIdentifier *fhirIdentifier;
  HKFHIRIdentifier *v10;
  uint64_t v11;
  HKFHIRIdentifier *v12;
  char v13;
  NSUUID *signedClinicalDataRecordIdentifier;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSUUID *v19;
  void *v20;

  v6 = (HKMedicalRecordOriginIdentifier *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
    fhirIdentifier = self->_fhirIdentifier;
    -[HKMedicalRecordOriginIdentifier fhirIdentifier](v8, "fhirIdentifier");
    v10 = (HKFHIRIdentifier *)objc_claimAutoreleasedReturnValue();
    if (fhirIdentifier == v10)
      goto LABEL_9;
    -[HKMedicalRecordOriginIdentifier fhirIdentifier](v8, "fhirIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v13 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v3 = (void *)v11;
    v12 = self->_fhirIdentifier;
    -[HKMedicalRecordOriginIdentifier fhirIdentifier](v8, "fhirIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HKFHIRIdentifier isEqual:](v12, "isEqual:", v4))
    {
LABEL_9:
      signedClinicalDataRecordIdentifier = self->_signedClinicalDataRecordIdentifier;
      -[HKMedicalRecordOriginIdentifier signedClinicalDataRecordIdentifier](v8, "signedClinicalDataRecordIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      if (signedClinicalDataRecordIdentifier == (NSUUID *)v15)
      {

        v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HKMedicalRecordOriginIdentifier signedClinicalDataRecordIdentifier](v8, "signedClinicalDataRecordIdentifier");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          v19 = self->_signedClinicalDataRecordIdentifier;
          -[HKMedicalRecordOriginIdentifier signedClinicalDataRecordIdentifier](v8, "signedClinicalDataRecordIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[NSUUID isEqual:](v19, "isEqual:", v20);

        }
        else
        {

          v13 = 0;
        }
      }
      if (fhirIdentifier == v10)
        goto LABEL_17;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_17;
  }
  v13 = 1;
LABEL_19:

  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSUUID *signedClinicalDataRecordIdentifier;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  if (self->_fhirIdentifier)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: FHIR identifier: %@>"), v5, self, self->_fhirIdentifier);
  }
  else
  {
    signedClinicalDataRecordIdentifier = self->_signedClinicalDataRecordIdentifier;
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v9;
    if (signedClinicalDataRecordIdentifier)
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@ %p: original SCD record identifier: %@>"), v9, self, self->_signedClinicalDataRecordIdentifier);
    else
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@ %p: INVALID, no identifier!>"), v9, self, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKFHIRIdentifier *fhirIdentifier;
  id v5;

  fhirIdentifier = self->_fhirIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", fhirIdentifier, CFSTR("FHIRIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signedClinicalDataRecordIdentifier, CFSTR("SignedClinicalDataRecordIdentifier"));

}

- (HKMedicalRecordOriginIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKMedicalRecordOriginIdentifier *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FHIRIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SignedClinicalDataRecordIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HKMedicalRecordOriginIdentifier _initWithFHIRIdentifier:signedClinicalDataRecordIdentifier:]([HKMedicalRecordOriginIdentifier alloc], "_initWithFHIRIdentifier:signedClinicalDataRecordIdentifier:", v5, v6);
  return v7;
}

- (HKFHIRIdentifier)fhirIdentifier
{
  return self->_fhirIdentifier;
}

- (NSUUID)signedClinicalDataRecordIdentifier
{
  return self->_signedClinicalDataRecordIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedClinicalDataRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_fhirIdentifier, 0);
}

@end
