@implementation HKUserTrackedMedication

- (HKUserTrackedMedication)init
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

+ (id)userTrackedMedicationWithNickname:(id)a3 isArchived:(BOOL)a4 hasSchedule:(BOOL)a5 medication:(id)a6 device:(id)a7
{
  return +[HKUserTrackedMedication _newUserTrackedMedicationWithNickname:isArchived:hasSchedule:medication:device:config:]((uint64_t)a1, a3, a4, a5, a6, (uint64_t)a6, 0);
}

+ (id)_newUserTrackedMedicationWithNickname:(char)a3 isArchived:(char)a4 hasSchedule:(void *)a5 medication:(uint64_t)a6 device:(void *)a7 config:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  objc_super v22;
  _QWORD aBlock[4];
  id v24;
  id v25;
  id v26;
  char v27;
  char v28;

  v11 = a2;
  v12 = a5;
  v13 = a7;
  v14 = (void *)objc_opt_self();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__HKUserTrackedMedication__newUserTrackedMedicationWithNickname_isArchived_hasSchedule_medication_device_config___block_invoke;
  aBlock[3] = &unk_1E37F6970;
  v27 = a3;
  v28 = a4;
  v24 = v11;
  v25 = v12;
  v26 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = _Block_copy(aBlock);
  +[HKObjectType userTrackedConceptTypeForIdentifier:](HKUserTrackedConceptType, "userTrackedConceptTypeForIdentifier:", CFSTR("HKUserTrackedConceptTypeIdentifierMedication"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = v14;
  v22.super_class = (Class)&OBJC_METACLASS___HKUserTrackedMedication;
  v20 = objc_msgSendSuper2(&v22, sel__newUserTrackedConceptWithType_config_, v19, v18);

  return v20;
}

void __113__HKUserTrackedMedication__newUserTrackedMedicationWithNickname_isArchived_hasSchedule_medication_device_config___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v8 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v8[3];
  v8[3] = v3;

  *((_BYTE *)v8 + 16) = *(_BYTE *)(a1 + 56);
  *((_BYTE *)v8 + 17) = *(_BYTE *)(a1 + 57);
  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)v8[4];
  v8[4] = v5;

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, _QWORD *))(v7 + 16))(v7, v8);

}

+ (BOOL)isConcreteUserTrackedConceptClass
{
  return 1;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  HKUserTrackedMedication *v4;
  HKUserTrackedMedication *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  _BOOL4 v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;

  v4 = (HKUserTrackedMedication *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKUserTrackedMedication nickname](v5, "nickname");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKUserTrackedMedication nickname](self, "nickname");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKUserTrackedMedication nickname](self, "nickname");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_16;
        v10 = (void *)v9;
        -[HKUserTrackedMedication nickname](v5, "nickname");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKUserTrackedMedication nickname](self, "nickname");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if (!v13)
          goto LABEL_17;
      }
      v15 = -[HKUserTrackedMedication isArchived](v5, "isArchived");
      if (v15 != -[HKUserTrackedMedication isArchived](self, "isArchived"))
        goto LABEL_17;
      v16 = -[HKUserTrackedMedication hasSchedule](v5, "hasSchedule");
      if (v16 != -[HKUserTrackedMedication hasSchedule](self, "hasSchedule"))
        goto LABEL_17;
      -[HKUserTrackedMedication medication](v5, "medication");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKUserTrackedMedication medication](self, "medication");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v17)
      {

LABEL_21:
        v14 = 1;
        goto LABEL_18;
      }
      v8 = (void *)v17;
      -[HKUserTrackedMedication medication](self, "medication");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)v18;
        -[HKUserTrackedMedication medication](v5, "medication");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKUserTrackedMedication medication](self, "medication");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isEqual:", v21);

        if ((v22 & 1) != 0)
          goto LABEL_21;
LABEL_17:
        v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_16:

      goto LABEL_17;
    }
    v14 = 0;
  }
LABEL_19:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKUserTrackedMedication)initWithCoder:(id)a3
{
  id v4;
  HKUserTrackedMedication *v5;
  uint64_t v6;
  NSString *nickname;
  uint64_t v8;
  HKMedication *medication;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKUserTrackedMedication;
  v5 = -[HKUserTrackedConcept initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NicknameKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    nickname = v5->_nickname;
    v5->_nickname = (NSString *)v6;

    v5->_isArchived = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsArchivedKey"));
    v5->_hasSchedule = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HasScheduleKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MedicationKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    medication = v5->_medication;
    v5->_medication = (HKMedication *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *nickname;
  id v5;

  nickname = self->_nickname;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", nickname, CFSTR("NicknameKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isArchived, CFSTR("IsArchivedKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasSchedule, CFSTR("HasScheduleKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_medication, CFSTR("MedicationKey"));

}

- (NSString)nickname
{
  return self->_nickname;
}

- (BOOL)isArchived
{
  return self->_isArchived;
}

- (BOOL)hasSchedule
{
  return self->_hasSchedule;
}

- (HKMedication)medication
{
  return self->_medication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medication, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
}

@end
