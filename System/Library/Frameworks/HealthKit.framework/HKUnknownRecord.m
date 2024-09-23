@implementation HKUnknownRecord

- (id)fallbackDisplayString
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[HKUnknownRecord displayName](self, "displayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultDisplayString");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (id)defaultDisplayString
{
  void *v2;
  void *v3;

  HKHealthKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("UNSPECIFIED_UNKNOWN_RECORD"), &stru_1E37FD4C0, CFSTR("Localizable-Clinical-Health-Records"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)recordCategoryType
{
  return 8;
}

+ (id)unknownRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 displayName:(id)a15
{
  return (id)objc_msgSend(a1, "_newUnknownRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:displayName:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, 0);
}

+ (id)_newUnknownRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 displayName:(id)a15 config:(id)a16
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
  void *v31;
  _BOOL4 v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;
  _QWORD aBlock[4];
  id v41;
  id v42;

  v35 = a5;
  v20 = a15;
  v21 = a16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __178__HKUnknownRecord__newUnknownRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_displayName_config___block_invoke;
  aBlock[3] = &unk_1E37E9FB0;
  v41 = v20;
  v42 = v21;
  v38 = v21;
  v37 = v20;
  v22 = a13;
  v23 = a12;
  v24 = a11;
  v25 = a10;
  v26 = a8;
  v27 = a7;
  v28 = a6;
  v29 = a4;
  v30 = a3;
  v31 = _Block_copy(aBlock);
  v39.receiver = a1;
  v39.super_class = (Class)&OBJC_METACLASS___HKUnknownRecord;
  v36 = objc_msgSendSuper2(&v39, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v30, v29, v35, v28, v27, v26, a9, v25, v24, v23, v22, a14, v31);

  return v36;
}

void __178__HKUnknownRecord__newUnknownRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_displayName_config___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;

  v6 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v6[22];
  v6[22] = v3;

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD *))(v5 + 16))(v5, v6);

}

- (HKUnknownRecord)init
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
  v9.super_class = (Class)HKUnknownRecord;
  -[HKSample description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p super=%@displayName = %@>"), v5, self, v6, self->_displayName);
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
  v5.super_class = (Class)HKUnknownRecord;
  v4 = a3;
  -[HKMedicalRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayName, CFSTR("DisplayName"), v5.receiver, v5.super_class);

}

- (HKUnknownRecord)initWithCoder:(id)a3
{
  id v4;
  HKUnknownRecord *v5;
  uint64_t v6;
  NSString *displayName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKUnknownRecord;
  v5 = -[HKMedicalRecord initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DisplayName"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

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
  char v13;
  BOOL v14;
  objc_super v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v16.receiver = self;
    v16.super_class = (Class)HKUnknownRecord;
    if (-[HKMedicalRecord isEquivalent:](&v16, sel_isEquivalent_, v5))
    {
      -[HKUnknownRecord displayName](self, "displayName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayName");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

        goto LABEL_9;
      }
      v8 = (void *)v7;
      objc_msgSend(v5, "displayName");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        -[HKUnknownRecord displayName](self, "displayName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "displayName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if ((v13 & 1) == 0)
          goto LABEL_11;
LABEL_9:
        v14 = 1;
LABEL_12:

        goto LABEL_13;
      }

    }
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  v14 = 0;
LABEL_13:

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

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKUnknownRecord;
  -[HKMedicalRecord _validateWithConfiguration:](&v7, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
}

+ (id)unknownRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 displayName:(id)a14
{
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
  void *v28;
  void *v30;
  _BOOL4 v31;

  v31 = a5;
  v18 = a6;
  v19 = a14;
  v20 = a12;
  v21 = a11;
  v22 = a10;
  v23 = a8;
  v24 = a7;
  v25 = a4;
  v26 = a3;
  v30 = v18;
  +[HKSemanticDate semanticDateWithKeyPath:date:](HKSemanticDate, "semanticDateWithKeyPath:date:", CFSTR("modifiedDate"), v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnknownRecord unknownRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:displayName:](HKUnknownRecord, "unknownRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:displayName:", v26, v25, v31, v18, v24, v23, a9, v22, v21, v27, v20, a13, v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

@end
