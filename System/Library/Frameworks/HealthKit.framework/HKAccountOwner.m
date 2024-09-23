@implementation HKAccountOwner

+ (id)accountOwnerWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 name:(id)a15 birthDate:(id)a16
{
  return (id)objc_msgSend(a1, "_newAccountOwnerWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:name:birthDate:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, 0);
}

+ (id)_newAccountOwnerWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 name:(id)a15 birthDate:(id)a16 config:(id)a17
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  _BOOL4 v37;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;
  _QWORD aBlock[4];
  id v44;
  id v45;
  id v46;

  v37 = a5;
  v20 = a15;
  v21 = a16;
  v22 = a17;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __179__HKAccountOwner__newAccountOwnerWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_name_birthDate_config___block_invoke;
  aBlock[3] = &unk_1E37E9700;
  v44 = v20;
  v45 = v21;
  v46 = v22;
  v41 = v22;
  v40 = v21;
  v39 = v20;
  v23 = a13;
  v24 = a12;
  v25 = a11;
  v26 = a10;
  v27 = a8;
  v28 = a7;
  v29 = a6;
  v30 = a4;
  v31 = a3;
  v32 = _Block_copy(aBlock);
  v42.receiver = a1;
  v42.super_class = (Class)&OBJC_METACLASS___HKAccountOwner;
  v38 = objc_msgSendSuper2(&v42, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v31, v30, v37, v29, v28, v27, a9, v26, v25, v24, v23, a14, v32);

  return v38;
}

void __179__HKAccountOwner__newAccountOwnerWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_name_birthDate_config___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v8 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v8[22];
  v8[22] = v3;

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)v8[23];
  v8[23] = v5;

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, _QWORD *))(v7 + 16))(v7, v8);

}

- (HKAccountOwner)init
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
  v9.super_class = (Class)HKAccountOwner;
  -[HKSample description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p super=%@name = %@birthDate = %@>"), v5, self, v6, self->_name, self->_birthDate);
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
  v5.super_class = (Class)HKAccountOwner;
  v4 = a3;
  -[HKMedicalRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("Name"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_birthDate, CFSTR("BirthDate"));

}

- (HKAccountOwner)initWithCoder:(id)a3
{
  id v4;
  HKAccountOwner *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  HKMedicalDate *birthDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKAccountOwner;
  v5 = -[HKMedicalRecord initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BirthDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    birthDate = v5->_birthDate;
    v5->_birthDate = (HKMedicalDate *)v8;

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
    v22.super_class = (Class)HKAccountOwner;
    if (!-[HKMedicalRecord isEquivalent:](&v22, sel_isEquivalent_, v5))
      goto LABEL_14;
    -[HKAccountOwner name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "name");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_13;
      v10 = (void *)v9;
      -[HKAccountOwner name](self, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (!v13)
        goto LABEL_14;
    }
    -[HKAccountOwner birthDate](self, "birthDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "birthDate");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v15)
    {

LABEL_18:
      v14 = 1;
      goto LABEL_15;
    }
    v8 = (void *)v15;
    objc_msgSend(v5, "birthDate");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      -[HKAccountOwner birthDate](self, "birthDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "birthDate");
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

- (NSString)name
{
  return self->_name;
}

- (void)_setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

}

- (HKMedicalDate)birthDate
{
  return self->_birthDate;
}

- (void)_setBirthDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *birthDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  birthDate = self->_birthDate;
  self->_birthDate = v4;

}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKAccountOwner;
  -[HKMedicalRecord _validateWithConfiguration:](&v10, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    if (self->_name)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("%@: name must not be nil"), self);
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
  objc_storeStrong((id *)&self->_birthDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)accountOwnerWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 name:(id)a14 birthDate:(id)a15
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v29;
  _BOOL4 v31;
  void *v32;

  v31 = a5;
  v27 = a6;
  v26 = a15;
  v25 = a14;
  v17 = a12;
  v18 = a11;
  v19 = a10;
  v24 = a8;
  v20 = a7;
  v29 = a4;
  v21 = a3;
  +[HKSemanticDate semanticDateWithKeyPath:date:](HKSemanticDate, "semanticDateWithKeyPath:date:", CFSTR("modifiedDate"), v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKAccountOwner accountOwnerWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:name:birthDate:](HKAccountOwner, "accountOwnerWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:name:birthDate:", v21, v29, v31, v27, v20, v24, a9, v19, v18, v22, v17, a13, v25, v26);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

@end
