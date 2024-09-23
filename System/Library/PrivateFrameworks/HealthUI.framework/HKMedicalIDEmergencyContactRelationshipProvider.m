@implementation HKMedicalIDEmergencyContactRelationshipProvider

- (HKMedicalIDEmergencyContactRelationshipProvider)init
{
  HKMedicalIDEmergencyContactRelationshipProvider *v2;
  HKMedicalIDEmergencyContactRelationshipProvider *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *tokens;
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
  HKMedicalIDEmergencyContactRelationshipProvider *v34;
  objc_super v35;
  _QWORD v36[26];

  v36[24] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)HKMedicalIDEmergencyContactRelationshipProvider;
  v2 = -[HKMedicalIDEmergencyContactRelationshipProvider init](&v35, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = *MEMORY[0x1E0C96BB8];
    v36[0] = *MEMORY[0x1E0C96D08];
    v36[1] = v4;
    v5 = *MEMORY[0x1E0C969D8];
    v36[2] = *MEMORY[0x1E0C96D90];
    v36[3] = v5;
    v6 = *MEMORY[0x1E0C96E58];
    v36[4] = *MEMORY[0x1E0C96E08];
    v36[5] = v6;
    v7 = *MEMORY[0x1E0C96A28];
    v36[6] = *MEMORY[0x1E0C96AF0];
    v36[7] = v7;
    v8 = *MEMORY[0x1E0C96E78];
    v36[8] = *MEMORY[0x1E0C96BF8];
    v36[9] = v8;
    v9 = *MEMORY[0x1E0C96958];
    v36[10] = *MEMORY[0x1E0C96DE8];
    v36[11] = v9;
    v10 = *MEMORY[0x1E0C97000];
    v36[12] = *MEMORY[0x1E0C96D00];
    v36[13] = v10;
    v34 = v2;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("relationship_roommate"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36[14] = v32;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("relationship_doctor"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36[15] = v30;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("relationship_emergency"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[16] = v28;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("relationship_family_member"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[17] = v26;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("relationship_teacher"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36[18] = v24;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("relationship_caretaker"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36[19] = v22;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("relationship_guardian"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[20] = v12;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("relationship_social_worker"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36[21] = v14;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("relationship_school"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36[22] = v16;
    v3 = v34;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("relationship_daycare"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[23] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 24);
    v19 = objc_claimAutoreleasedReturnValue();
    tokens = v34->_tokens;
    v34->_tokens = (NSArray *)v19;

  }
  return v3;
}

- (int64_t)numberOfRowsForRelationships
{
  return -[NSArray count](self->_tokens, "count");
}

- (id)keyForRelationshipAtIndex:(int64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_tokens, "objectAtIndexedSubscript:", a3);
}

- (id)localizedRelationshipAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C97338];
  -[NSArray objectAtIndexedSubscript:](self->_tokens, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForLabel:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end
