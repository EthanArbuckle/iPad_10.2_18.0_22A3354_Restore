@implementation HKClinicalRecord

+ (HKClinicalRecord)clinicalRecordWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 displayName:(id)a8 FHIRResource:(id)a9
{
  return (HKClinicalRecord *)(id)objc_msgSend(a1, "_newClinicalRecordWithType:startDate:endDate:device:metadata:displayName:FHIRResource:config:", a3, a4, a5, a6, a7, a8, a9, 0);
}

+ (id)_newClinicalRecordWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 displayName:(id)a8 FHIRResource:(id)a9 config:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  objc_super v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  id v34;

  v16 = a8;
  v17 = a9;
  v18 = a10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__HKClinicalRecord__newClinicalRecordWithType_startDate_endDate_device_metadata_displayName_FHIRResource_config___block_invoke;
  aBlock[3] = &unk_1E37E9700;
  v32 = v16;
  v33 = v17;
  v34 = v18;
  v19 = v18;
  v20 = v17;
  v21 = v16;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v26 = a3;
  v27 = _Block_copy(aBlock);
  v30.receiver = a1;
  v30.super_class = (Class)&OBJC_METACLASS___HKClinicalRecord;
  v28 = objc_msgSendSuper2(&v30, sel__newSampleFromDatesWithType_startDate_endDate_device_metadata_config_, v26, v25, v24, v23, v22, v27);

  return v28;
}

void __113__HKClinicalRecord__newClinicalRecordWithType_startDate_endDate_device_metadata_displayName_FHIRResource_config___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v8 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v8[12];
  v8[12] = v3;

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)v8[13];
  v8[13] = v5;

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, _QWORD *))(v7 + 16))(v7, v8);

}

- (HKClinicalRecord)init
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

- (id)attachmentObjectIdentifier
{
  return +[HKAttachmentObjectIdentifierUtilities attachmentObjectIdentifierForClinicalRecord:](HKAttachmentObjectIdentifierUtilities, "attachmentObjectIdentifierForClinicalRecord:", self);
}

- (id)attachmentSchemaIdentifier
{
  return CFSTR("HKClinicalRecord");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)HKClinicalRecord;
  -[HKSample description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p super=%@, displayName = %@, FHIRResource = %@>"), v5, self, v6, self->_displayName, self->_FHIRResource, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKClinicalRecord;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayName, CFSTR("DisplayName"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_FHIRResource, CFSTR("FHIRResource"));

}

- (HKClinicalRecord)initWithCoder:(id)a3
{
  id v4;
  HKClinicalRecord *v5;
  uint64_t v6;
  NSString *displayName;
  uint64_t v8;
  HKFHIRResource *FHIRResource;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKClinicalRecord;
  v5 = -[HKSample initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DisplayName"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FHIRResource"));
    v8 = objc_claimAutoreleasedReturnValue();
    FHIRResource = v5->_FHIRResource;
    v5->_FHIRResource = (HKFHIRResource *)v8;

  }
  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  objc_super v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v22.receiver = self;
    v22.super_class = (Class)HKClinicalRecord;
    if (!-[HKSample isEquivalent:](&v22, sel_isEquivalent_, v5))
      goto LABEL_14;
    -[HKClinicalRecord displayName](self, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "displayName");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_13;
      v10 = (void *)v9;
      -[HKClinicalRecord displayName](self, "displayName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (!v13)
        goto LABEL_14;
    }
    -[HKClinicalRecord FHIRResource](self, "FHIRResource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "FHIRResource");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v15)
    {

LABEL_18:
      v14 = 1;
      goto LABEL_15;
    }
    v8 = (void *)v15;
    objc_msgSend(v5, "FHIRResource");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      -[HKClinicalRecord FHIRResource](self, "FHIRResource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "FHIRResource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if ((v20 & 1) != 0)
        goto LABEL_18;
LABEL_14:
      v14 = 0;
LABEL_15:

      goto LABEL_16;
    }
LABEL_13:

    goto LABEL_14;
  }
  v14 = 0;
LABEL_16:

  return v14;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)_setDisplayName:(id)a3
{
  NSString *v4;
  NSString *displayName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  displayName = self->_displayName;
  self->_displayName = v4;

}

- (HKFHIRResource)FHIRResource
{
  return self->_FHIRResource;
}

- (void)_setFHIRResource:(id)a3
{
  HKFHIRResource *v4;
  HKFHIRResource *FHIRResource;

  v4 = (HKFHIRResource *)objc_msgSend(a3, "copy");
  FHIRResource = self->_FHIRResource;
  self->_FHIRResource = v4;

}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKClinicalRecord;
  -[HKSample _validateWithConfiguration:](&v10, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    if (self->_displayName)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("%@: displayName must not be nil"), self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_6:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_FHIRResource, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
