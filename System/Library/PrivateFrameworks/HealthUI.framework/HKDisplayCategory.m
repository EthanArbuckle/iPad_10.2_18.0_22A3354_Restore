@implementation HKDisplayCategory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_multiColorImageConfiguration, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_shareIconName, 0);
  objc_storeStrong((id *)&self->_healthDataIconName, 0);
  objc_storeStrong((id *)&self->_listIconName, 0);
  objc_storeStrong((id *)&self->_largeListIconName, 0);
  objc_storeStrong((id *)&self->_embeddedDisplayName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
}

- (HKDisplayCategory)initWithCategoryID:(int64_t)a3 displayName:(id)a4 listIconName:(id)a5 largeListIconName:(id)a6 shareIconName:(id)a7 systemImageName:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HKDisplayCategory *v18;
  HKDisplayCategory *v19;
  uint64_t v20;
  NSString *categoryName;
  void *v22;
  uint64_t v23;
  NSString *displayName;
  void *v25;
  void *v26;
  uint64_t v27;
  NSString *embeddedDisplayName;
  uint64_t v29;
  NSString *largeListIconName;
  uint64_t v31;
  NSString *listIconName;
  uint64_t v33;
  NSString *shareIconName;
  uint64_t v35;
  NSString *systemImageName;
  void *v37;
  uint64_t v38;
  NSString *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSString *v43;
  void *v44;
  uint64_t v45;
  NSString *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSString *v50;
  void *v51;
  uint64_t v52;
  NSString *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSString *v57;
  void *v58;
  uint64_t v59;
  NSString *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSString *v64;
  void *v65;
  void *v66;
  NSString *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  NSString *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  NSString *v76;
  id v78;
  objc_super v79;

  v78 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v79.receiver = self;
  v79.super_class = (Class)HKDisplayCategory;
  v18 = -[HKDisplayCategory init](&v79, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_categoryID = a3;
    v20 = objc_msgSend(v78, "copy");
    categoryName = v19->_categoryName;
    v19->_categoryName = (NSString *)v20;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", v19->_categoryName, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v23 = objc_claimAutoreleasedReturnValue();
    displayName = v19->_displayName;
    v19->_displayName = (NSString *)v23;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingString:](v19->_categoryName, "stringByAppendingString:", CFSTR("_EMBEDDED"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", v26, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v27 = objc_claimAutoreleasedReturnValue();
    embeddedDisplayName = v19->_embeddedDisplayName;
    v19->_embeddedDisplayName = (NSString *)v27;

    v29 = objc_msgSend(v15, "copy");
    largeListIconName = v19->_largeListIconName;
    v19->_largeListIconName = (NSString *)v29;

    v31 = objc_msgSend(v14, "copy");
    listIconName = v19->_listIconName;
    v19->_listIconName = (NSString *)v31;

    v33 = objc_msgSend(v16, "copy");
    shareIconName = v19->_shareIconName;
    v19->_shareIconName = (NSString *)v33;

    v35 = objc_msgSend(v17, "copy");
    systemImageName = v19->_systemImageName;
    v19->_systemImageName = (NSString *)v35;

    if (-[NSString isEqualToString:](v19->_displayName, "isEqualToString:", v19->_categoryName))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", v19->_categoryName, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Clinical-Health-Records"));
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v19->_displayName;
      v19->_displayName = (NSString *)v38;

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAppendingString:](v19->_categoryName, "stringByAppendingString:", CFSTR("_EMBEDDED"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedStringForKey:value:table:", v41, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Clinical-Health-Records"));
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v19->_embeddedDisplayName;
      v19->_embeddedDisplayName = (NSString *)v42;

    }
    if (-[NSString isEqualToString:](v19->_displayName, "isEqualToString:", v19->_categoryName))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "localizedStringForKey:value:table:", v19->_categoryName, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-WalkingSteadiness"));
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = v19->_displayName;
      v19->_displayName = (NSString *)v45;

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAppendingString:](v19->_categoryName, "stringByAppendingString:", CFSTR("_EMBEDDED"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "localizedStringForKey:value:table:", v48, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-WalkingSteadiness"));
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = v19->_embeddedDisplayName;
      v19->_embeddedDisplayName = (NSString *)v49;

    }
    if (-[NSString isEqualToString:](v19->_displayName, "isEqualToString:", v19->_categoryName))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "localizedStringForKey:value:table:", v19->_categoryName, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Meds"));
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = v19->_displayName;
      v19->_displayName = (NSString *)v52;

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAppendingString:](v19->_categoryName, "stringByAppendingString:", CFSTR("_EMBEDDED"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "localizedStringForKey:value:table:", v55, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Meds"));
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = v19->_embeddedDisplayName;
      v19->_embeddedDisplayName = (NSString *)v56;

    }
    if (-[NSString isEqualToString:](v19->_displayName, "isEqualToString:", v19->_categoryName))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "localizedStringForKey:value:table:", v19->_categoryName, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Clinical-Notes"));
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = v19->_displayName;
      v19->_displayName = (NSString *)v59;

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAppendingString:](v19->_categoryName, "stringByAppendingString:", CFSTR("_EMBEDDED"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "localizedStringForKey:value:table:", v62, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Clinical-Notes"));
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = v19->_embeddedDisplayName;
      v19->_embeddedDisplayName = (NSString *)v63;

    }
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "features");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v66, "chamomile") & 1) == 0)
    {

      goto LABEL_14;
    }
    v67 = v19->_categoryName;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "localizedStringForKey:value:table:", v19->_categoryName, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v67) = -[NSString isEqualToString:](v67, "isEqualToString:", v69);

    if ((v67 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "localizedStringForKey:value:table:", v19->_categoryName, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
      v71 = objc_claimAutoreleasedReturnValue();
      v72 = v19->_displayName;
      v19->_displayName = (NSString *)v71;

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAppendingString:](v19->_categoryName, "stringByAppendingString:", CFSTR("_EMBEDDED"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "localizedStringForKey:value:table:", v74, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
      v75 = objc_claimAutoreleasedReturnValue();
      v76 = v19->_embeddedDisplayName;
      v19->_embeddedDisplayName = (NSString *)v75;

      v65 = v19->_systemImageName;
      v19->_systemImageName = (NSString *)CFSTR("brain.head.profile");
LABEL_14:

    }
  }

  return v19;
}

- (unint64_t)hash
{
  return self->_categoryID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (UIImage)listIcon
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSString *listIconName;
  void *v9;
  void *v10;

  -[HKDisplayCategory _image](self, "_image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      -[HKDisplayCategory largeListIcon].cold.1((uint64_t)self, v7, a2);
    listIconName = self->_listIconName;
    if (listIconName)
    {
      v9 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageNamed:inBundle:", listIconName, v10);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
  }

  return (UIImage *)v6;
}

- (BOOL)isEqual:(id)a3
{
  int64_t categoryID;

  categoryID = self->_categoryID;
  return categoryID == objc_msgSend(a3, "categoryID");
}

- (id)_image
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!self->_systemImageName
    || (objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (self->_systemImageName)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  -[HKDisplayCategory(BuiltinCategories) multiColorImageConfiguration](self, "multiColorImageConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "imageByApplyingSymbolConfiguration:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKDisplayCategory(BuiltinCategories) color](self, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "imageWithTintColor:renderingMode:", v6, 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v3;
    }
    v5 = v7;

  }
  return v5;
}

- (int64_t)categoryID
{
  return self->_categoryID;
}

+ (HKDisplayCategory)categoryWithName:(id)a3
{
  id v3;
  HKDisplayCategory *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  HKDisplayCategory *v11;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("VITAL_SIGNS")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("VITAL_SIGNS");
    v6 = CFSTR("healthdata_glyph_vitals");
    v7 = CFSTR("healthdata_glyph_vitals_large");
    v8 = CFSTR("sharedata_glyph_vitals");
    v9 = CFSTR("waveform.path.ecg.rectangle");
    v10 = 1;
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("FITNESS")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("FITNESS");
    v6 = CFSTR("healthdata_glyph_fitness");
    v7 = CFSTR("healthdata_glyph_activity_large");
    v8 = CFSTR("sharedata_glyph_fitness");
    v9 = CFSTR("flame.fill");
    v10 = 2;
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("NUTRITION")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("NUTRITION");
    v6 = CFSTR("healthdata_glyph_nutrition");
    v7 = CFSTR("healthdata_glyph_nutrition_large");
    v8 = CFSTR("sharedata_glyph_nutrition");
    v9 = CFSTR("apple.slice");
    v10 = 4;
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("SLEEP")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("SLEEP");
    v6 = CFSTR("healthdata_glyph_sleep");
    v7 = CFSTR("healthdata_glyph_sleep_large");
    v8 = CFSTR("sharedata_glyph_sleep");
    v9 = CFSTR("bed.double.fill");
    v10 = 5;
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("BODY_MEASUREMENTS")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("BODY_MEASUREMENTS");
    v6 = CFSTR("healthdata_glyph_bodymeasurements");
    v7 = CFSTR("healthdata_glyph_bodymeasurements_large");
    v8 = CFSTR("sharedata_glyph_bodymeasurements");
    v9 = CFSTR("figure");
    v10 = 6;
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ME")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("ME");
    v6 = CFSTR("healthdata_glyph_me");
    v8 = CFSTR("sharedata_glyph_me");
    v9 = CFSTR("person.circle");
    v10 = 7;
LABEL_17:
    v7 = 0;
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("REPRODUCTIVE_HEALTH")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("REPRODUCTIVE_HEALTH");
    v6 = CFSTR("healthdata_glyph_reproductive");
    v7 = CFSTR("healthdata_glyph_reproductive_large");
    v8 = CFSTR("sharedata_glyph_reproductive");
    v9 = CFSTR("apple.cycletracking");
    v10 = 8;
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("CLINICAL_DOCUMENTS")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("CLINICAL_DOCUMENTS");
    v6 = CFSTR("healthdata_glyph_documents");
    v8 = CFSTR("sharedata_glyph_documents");
    v9 = CFSTR("doc.text");
    v10 = 9;
    goto LABEL_17;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("MINDFULNESS")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("MINDFULNESS");
    v6 = CFSTR("healthdata_glyph_mindfulness");
    v7 = CFSTR("healthdata_glyph_mindfulness_large");
    v8 = CFSTR("sharedata_glyph_mindfulness");
    v9 = CFSTR("apple.mindfulness");
    v10 = 10;
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("HEART")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("HEART");
    v6 = CFSTR("healthdata_glyph_heart");
    v7 = CFSTR("healthdata_glyph_heart_large");
    v8 = CFSTR("sharedata_glyph_heart");
    v9 = CFSTR("heart.fill");
    v10 = 11;
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("HEARING_HEALTH")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("HEARING_HEALTH");
    v6 = CFSTR("healthdata_glyph_hearing");
    v7 = CFSTR("healthdata_glyph_hearing_large");
    v8 = CFSTR("sharedata_glyph_hearing");
    v9 = CFSTR("ear");
    v10 = 12;
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESPIRATORY")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("RESPIRATORY");
    v6 = CFSTR("healthdata_glyph_respiratory");
    v7 = CFSTR("healthdata_glyph_respiratory_large");
    v8 = CFSTR("sharedata_glyph_respiratory");
    v9 = CFSTR("lungs.fill");
    v10 = 13;
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("OTHER");
    v6 = CFSTR("healthdata_glyph_other");
    v7 = CFSTR("healthdata_glyph_other_large");
    v8 = CFSTR("sharedata_glyph_other");
    v9 = CFSTR("capsule.cross.fill");
    v10 = 14;
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_RECORDS")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("HEALTH_RECORDS");
    v6 = CFSTR("healthdata_glyph_results");
    v7 = CFSTR("healthdata_glyph_results_large");
    v8 = CFSTR("sharedata_glyph_results");
    v9 = CFSTR("testtube.2");
    v10 = 15;
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ALLERGY_CATEGORY")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("ALLERGY_CATEGORY");
    v6 = CFSTR("health_records_allergies");
    v9 = CFSTR("allergens");
    v10 = 16;
LABEL_46:
    v7 = 0;
    v8 = v6;
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("CLINICAL_VITALS_CATEGORY")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("CLINICAL_VITALS_CATEGORY");
    v6 = CFSTR("health_records_vitals");
    v9 = CFSTR("waveform.path.ecg.rectangle");
    v10 = 17;
    goto LABEL_46;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("CONDITION_CATEGORY")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("CONDITION_CATEGORY");
    v6 = CFSTR("health_records_conditions");
    v9 = CFSTR("stethoscope");
    v10 = 18;
    goto LABEL_46;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("IMMUNIZATION_CATEGORY")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("IMMUNIZATION_CATEGORY");
    v6 = CFSTR("health_records_immunizations");
    v9 = CFSTR("cross.vial");
    v10 = 19;
    goto LABEL_46;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("LAB_CATEGORY")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("LAB_CATEGORY");
    v6 = CFSTR("health_records_lab_results");
    v9 = CFSTR("testtube.2");
    v10 = 20;
    goto LABEL_46;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("MEDICATIONS_CATEGORY")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("MEDICATIONS_CATEGORY");
    v6 = CFSTR("health_records_medications");
    v9 = CFSTR("pills.fill");
    v10 = 21;
    goto LABEL_46;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("PROCEDURE_CATEGORY")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("PROCEDURE_CATEGORY");
    v6 = CFSTR("health_records_procedures");
    v9 = CFSTR("ivfluid.bag");
    v10 = 22;
    goto LABEL_46;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("MOBILITY")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("MOBILITY");
    v6 = CFSTR("healthdata_glyph_mobility");
    v7 = CFSTR("healthdata_glyph_mobility_large");
    v8 = CFSTR("sharedata_glyph_mobility");
    v9 = CFSTR("apple.mobility");
    v10 = 23;
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYMPTOMS")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("SYMPTOMS");
    v6 = CFSTR("healthdata_glyph_symptoms");
    v7 = CFSTR("healthdata_glyph_symptoms_large");
    v8 = CFSTR("sharedata_glyph_symptoms");
    v9 = CFSTR("figure.arms.open.and.exclamationmark.magnifyingglass");
    v10 = 26;
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INSURANCE_CATEGORY")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("INSURANCE_CATEGORY");
    v6 = CFSTR("health_records_insurance");
    v9 = CFSTR("person.text.rectangle.fill");
    v10 = 27;
    goto LABEL_46;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("CLINICAL_NOTES_CATEGORY")))
  {
    v4 = [HKDisplayCategory alloc];
    v5 = CFSTR("CLINICAL_NOTES_CATEGORY");
    v6 = CFSTR("health_records_clinical_notes");
    v9 = CFSTR("pencil.and.list.clipboard");
    v10 = 30;
    goto LABEL_46;
  }
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("MEDICATION_TRACKING")))
  {
    v11 = 0;
    goto LABEL_19;
  }
  v4 = [HKDisplayCategory alloc];
  v5 = CFSTR("MEDICATION_TRACKING");
  v6 = CFSTR("healthdata_glyph_medicationTracking");
  v7 = CFSTR("healthdata_glyph_medicationTracking_large");
  v8 = CFSTR("sharedata_glyph_medicationTracking");
  v9 = CFSTR("pills.fill");
  v10 = 31;
LABEL_18:
  v11 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:](v4, "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", v10, v5, v6, v7, v8, v9);
LABEL_19:

  return v11;
}

+ (HKDisplayCategory)categoryWithID:(int64_t)a3
{
  HKDisplayCategory *v3;
  HKDisplayCategory *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;

  v3 = 0;
  switch(a3)
  {
    case 1:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("VITAL_SIGNS");
      v6 = CFSTR("healthdata_glyph_vitals");
      v7 = CFSTR("healthdata_glyph_vitals_large");
      v8 = CFSTR("sharedata_glyph_vitals");
      v9 = CFSTR("waveform.path.ecg.rectangle");
      v10 = 1;
      goto LABEL_29;
    case 2:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("FITNESS");
      v6 = CFSTR("healthdata_glyph_fitness");
      v7 = CFSTR("healthdata_glyph_activity_large");
      v8 = CFSTR("sharedata_glyph_fitness");
      v9 = CFSTR("flame.fill");
      v10 = 2;
      goto LABEL_29;
    case 4:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("NUTRITION");
      v6 = CFSTR("healthdata_glyph_nutrition");
      v7 = CFSTR("healthdata_glyph_nutrition_large");
      v8 = CFSTR("sharedata_glyph_nutrition");
      v9 = CFSTR("apple.slice");
      v10 = 4;
      goto LABEL_29;
    case 5:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("SLEEP");
      v6 = CFSTR("healthdata_glyph_sleep");
      v7 = CFSTR("healthdata_glyph_sleep_large");
      v8 = CFSTR("sharedata_glyph_sleep");
      v9 = CFSTR("bed.double.fill");
      v10 = 5;
      goto LABEL_29;
    case 6:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("BODY_MEASUREMENTS");
      v6 = CFSTR("healthdata_glyph_bodymeasurements");
      v7 = CFSTR("healthdata_glyph_bodymeasurements_large");
      v8 = CFSTR("sharedata_glyph_bodymeasurements");
      v9 = CFSTR("figure");
      v10 = 6;
      goto LABEL_29;
    case 7:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("ME");
      v6 = CFSTR("healthdata_glyph_me");
      v8 = CFSTR("sharedata_glyph_me");
      v9 = CFSTR("person.circle");
      v10 = 7;
      goto LABEL_10;
    case 8:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("REPRODUCTIVE_HEALTH");
      v6 = CFSTR("healthdata_glyph_reproductive");
      v7 = CFSTR("healthdata_glyph_reproductive_large");
      v8 = CFSTR("sharedata_glyph_reproductive");
      v9 = CFSTR("apple.cycletracking");
      v10 = 8;
      goto LABEL_29;
    case 9:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("CLINICAL_DOCUMENTS");
      v6 = CFSTR("healthdata_glyph_documents");
      v8 = CFSTR("sharedata_glyph_documents");
      v9 = CFSTR("doc.text");
      v10 = 9;
LABEL_10:
      v7 = 0;
      goto LABEL_29;
    case 10:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("MINDFULNESS");
      v6 = CFSTR("healthdata_glyph_mindfulness");
      v7 = CFSTR("healthdata_glyph_mindfulness_large");
      v8 = CFSTR("sharedata_glyph_mindfulness");
      v9 = CFSTR("apple.mindfulness");
      v10 = 10;
      goto LABEL_29;
    case 11:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("HEART");
      v6 = CFSTR("healthdata_glyph_heart");
      v7 = CFSTR("healthdata_glyph_heart_large");
      v8 = CFSTR("sharedata_glyph_heart");
      v9 = CFSTR("heart.fill");
      v10 = 11;
      goto LABEL_29;
    case 12:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("HEARING_HEALTH");
      v6 = CFSTR("healthdata_glyph_hearing");
      v7 = CFSTR("healthdata_glyph_hearing_large");
      v8 = CFSTR("sharedata_glyph_hearing");
      v9 = CFSTR("ear");
      v10 = 12;
      goto LABEL_29;
    case 13:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("RESPIRATORY");
      v6 = CFSTR("healthdata_glyph_respiratory");
      v7 = CFSTR("healthdata_glyph_respiratory_large");
      v8 = CFSTR("sharedata_glyph_respiratory");
      v9 = CFSTR("lungs.fill");
      v10 = 13;
      goto LABEL_29;
    case 14:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("OTHER");
      v6 = CFSTR("healthdata_glyph_other");
      v7 = CFSTR("healthdata_glyph_other_large");
      v8 = CFSTR("sharedata_glyph_other");
      v9 = CFSTR("capsule.cross.fill");
      v10 = 14;
      goto LABEL_29;
    case 15:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("HEALTH_RECORDS");
      v6 = CFSTR("healthdata_glyph_results");
      v7 = CFSTR("healthdata_glyph_results_large");
      v8 = CFSTR("sharedata_glyph_results");
      v9 = CFSTR("testtube.2");
      v10 = 15;
      goto LABEL_29;
    case 16:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("ALLERGY_CATEGORY");
      v6 = CFSTR("health_records_allergies");
      v9 = CFSTR("allergens");
      v10 = 16;
      goto LABEL_28;
    case 17:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("CLINICAL_VITALS_CATEGORY");
      v6 = CFSTR("health_records_vitals");
      v9 = CFSTR("waveform.path.ecg.rectangle");
      v10 = 17;
      goto LABEL_28;
    case 18:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("CONDITION_CATEGORY");
      v6 = CFSTR("health_records_conditions");
      v9 = CFSTR("stethoscope");
      v10 = 18;
      goto LABEL_28;
    case 19:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("IMMUNIZATION_CATEGORY");
      v6 = CFSTR("health_records_immunizations");
      v9 = CFSTR("cross.vial");
      v10 = 19;
      goto LABEL_28;
    case 20:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("LAB_CATEGORY");
      v6 = CFSTR("health_records_lab_results");
      v9 = CFSTR("testtube.2");
      v10 = 20;
      goto LABEL_28;
    case 21:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("MEDICATIONS_CATEGORY");
      v6 = CFSTR("health_records_medications");
      v9 = CFSTR("pills.fill");
      v10 = 21;
      goto LABEL_28;
    case 22:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("PROCEDURE_CATEGORY");
      v6 = CFSTR("health_records_procedures");
      v9 = CFSTR("ivfluid.bag");
      v10 = 22;
      goto LABEL_28;
    case 23:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("MOBILITY");
      v6 = CFSTR("healthdata_glyph_mobility");
      v7 = CFSTR("healthdata_glyph_mobility_large");
      v8 = CFSTR("sharedata_glyph_mobility");
      v9 = CFSTR("apple.mobility");
      v10 = 23;
      goto LABEL_29;
    case 26:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("SYMPTOMS");
      v6 = CFSTR("healthdata_glyph_symptoms");
      v7 = CFSTR("healthdata_glyph_symptoms_large");
      v8 = CFSTR("sharedata_glyph_symptoms");
      v9 = CFSTR("figure.arms.open.and.exclamationmark.magnifyingglass");
      v10 = 26;
      goto LABEL_29;
    case 27:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("INSURANCE_CATEGORY");
      v6 = CFSTR("health_records_insurance");
      v9 = CFSTR("person.text.rectangle.fill");
      v10 = 27;
      goto LABEL_28;
    case 30:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("CLINICAL_NOTES_CATEGORY");
      v6 = CFSTR("health_records_clinical_notes");
      v9 = CFSTR("pencil.and.list.clipboard");
      v10 = 30;
LABEL_28:
      v7 = 0;
      v8 = v6;
      goto LABEL_29;
    case 31:
      v4 = [HKDisplayCategory alloc];
      v5 = CFSTR("MEDICATION_TRACKING");
      v6 = CFSTR("healthdata_glyph_medicationTracking");
      v7 = CFSTR("healthdata_glyph_medicationTracking_large");
      v8 = CFSTR("sharedata_glyph_medicationTracking");
      v9 = CFSTR("pills.fill");
      v10 = 31;
LABEL_29:
      v3 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:](v4, "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", v10, v5, v6, v7, v8, v9);
      break;
    default:
      return v3;
  }
  return v3;
}

+ (id)allCategories
{
  HKDisplayCategory *v2;
  HKDisplayCategory *v3;
  HKDisplayCategory *v4;
  HKDisplayCategory *v5;
  HKDisplayCategory *v6;
  HKDisplayCategory *v7;
  HKDisplayCategory *v8;
  HKDisplayCategory *v9;
  HKDisplayCategory *v10;
  void *v11;
  HKDisplayCategory *v13;
  HKDisplayCategory *v14;
  HKDisplayCategory *v15;
  HKDisplayCategory *v16;
  HKDisplayCategory *v17;
  HKDisplayCategory *v18;
  HKDisplayCategory *v19;
  HKDisplayCategory *v20;
  HKDisplayCategory *v21;
  HKDisplayCategory *v22;
  HKDisplayCategory *v23;
  HKDisplayCategory *v24;
  HKDisplayCategory *v25;
  HKDisplayCategory *v26;
  HKDisplayCategory *v27;
  HKDisplayCategory *v28;
  HKDisplayCategory *v29;
  _QWORD v30[28];

  v30[26] = *MEMORY[0x1E0C80C00];
  v29 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 1, CFSTR("VITAL_SIGNS"), CFSTR("healthdata_glyph_vitals"), CFSTR("healthdata_glyph_vitals_large"), CFSTR("sharedata_glyph_vitals"), CFSTR("waveform.path.ecg.rectangle"));
  v30[0] = v29;
  v28 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 2, CFSTR("FITNESS"), CFSTR("healthdata_glyph_fitness"), CFSTR("healthdata_glyph_activity_large"), CFSTR("sharedata_glyph_fitness"), CFSTR("flame.fill"));
  v30[1] = v28;
  v27 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 4, CFSTR("NUTRITION"), CFSTR("healthdata_glyph_nutrition"), CFSTR("healthdata_glyph_nutrition_large"), CFSTR("sharedata_glyph_nutrition"), CFSTR("apple.slice"));
  v30[2] = v27;
  v26 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 5, CFSTR("SLEEP"), CFSTR("healthdata_glyph_sleep"), CFSTR("healthdata_glyph_sleep_large"), CFSTR("sharedata_glyph_sleep"), CFSTR("bed.double.fill"));
  v30[3] = v26;
  v25 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 6, CFSTR("BODY_MEASUREMENTS"), CFSTR("healthdata_glyph_bodymeasurements"), CFSTR("healthdata_glyph_bodymeasurements_large"), CFSTR("sharedata_glyph_bodymeasurements"), CFSTR("figure"));
  v30[4] = v25;
  v24 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 7, CFSTR("ME"), CFSTR("healthdata_glyph_me"), 0, CFSTR("sharedata_glyph_me"), CFSTR("person.circle"));
  v30[5] = v24;
  v23 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 8, CFSTR("REPRODUCTIVE_HEALTH"), CFSTR("healthdata_glyph_reproductive"), CFSTR("healthdata_glyph_reproductive_large"), CFSTR("sharedata_glyph_reproductive"), CFSTR("apple.cycletracking"));
  v30[6] = v23;
  v22 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 9, CFSTR("CLINICAL_DOCUMENTS"), CFSTR("healthdata_glyph_documents"), 0, CFSTR("sharedata_glyph_documents"), CFSTR("doc.text"));
  v30[7] = v22;
  v21 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 10, CFSTR("MINDFULNESS"), CFSTR("healthdata_glyph_mindfulness"), CFSTR("healthdata_glyph_mindfulness_large"), CFSTR("sharedata_glyph_mindfulness"), CFSTR("apple.mindfulness"));
  v30[8] = v21;
  v20 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 11, CFSTR("HEART"), CFSTR("healthdata_glyph_heart"), CFSTR("healthdata_glyph_heart_large"), CFSTR("sharedata_glyph_heart"), CFSTR("heart.fill"));
  v30[9] = v20;
  v19 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 12, CFSTR("HEARING_HEALTH"), CFSTR("healthdata_glyph_hearing"), CFSTR("healthdata_glyph_hearing_large"), CFSTR("sharedata_glyph_hearing"), CFSTR("ear"));
  v30[10] = v19;
  v18 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 13, CFSTR("RESPIRATORY"), CFSTR("healthdata_glyph_respiratory"), CFSTR("healthdata_glyph_respiratory_large"), CFSTR("sharedata_glyph_respiratory"), CFSTR("lungs.fill"));
  v30[11] = v18;
  v17 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 14, CFSTR("OTHER"), CFSTR("healthdata_glyph_other"), CFSTR("healthdata_glyph_other_large"), CFSTR("sharedata_glyph_other"), CFSTR("capsule.cross.fill"));
  v30[12] = v17;
  v16 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 15, CFSTR("HEALTH_RECORDS"), CFSTR("healthdata_glyph_results"), CFSTR("healthdata_glyph_results_large"), CFSTR("sharedata_glyph_results"), CFSTR("testtube.2"));
  v30[13] = v16;
  v15 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 16, CFSTR("ALLERGY_CATEGORY"), CFSTR("health_records_allergies"), 0, CFSTR("health_records_allergies"), CFSTR("allergens"));
  v30[14] = v15;
  v14 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 17, CFSTR("CLINICAL_VITALS_CATEGORY"), CFSTR("health_records_vitals"), 0, CFSTR("health_records_vitals"), CFSTR("waveform.path.ecg.rectangle"));
  v30[15] = v14;
  v13 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 18, CFSTR("CONDITION_CATEGORY"), CFSTR("health_records_conditions"), 0, CFSTR("health_records_conditions"), CFSTR("stethoscope"));
  v30[16] = v13;
  v2 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 19, CFSTR("IMMUNIZATION_CATEGORY"), CFSTR("health_records_immunizations"), 0, CFSTR("health_records_immunizations"), CFSTR("cross.vial"));
  v30[17] = v2;
  v3 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 20, CFSTR("LAB_CATEGORY"), CFSTR("health_records_lab_results"), 0, CFSTR("health_records_lab_results"), CFSTR("testtube.2"));
  v30[18] = v3;
  v4 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 21, CFSTR("MEDICATIONS_CATEGORY"), CFSTR("health_records_medications"), 0, CFSTR("health_records_medications"), CFSTR("pills.fill"));
  v30[19] = v4;
  v5 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 22, CFSTR("PROCEDURE_CATEGORY"), CFSTR("health_records_procedures"), 0, CFSTR("health_records_procedures"), CFSTR("ivfluid.bag"));
  v30[20] = v5;
  v6 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 23, CFSTR("MOBILITY"), CFSTR("healthdata_glyph_mobility"), CFSTR("healthdata_glyph_mobility_large"), CFSTR("sharedata_glyph_mobility"), CFSTR("apple.mobility"));
  v30[21] = v6;
  v7 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 26, CFSTR("SYMPTOMS"), CFSTR("healthdata_glyph_symptoms"), CFSTR("healthdata_glyph_symptoms_large"), CFSTR("sharedata_glyph_symptoms"), CFSTR("figure.arms.open.and.exclamationmark.magnifyingglass"));
  v30[22] = v7;
  v8 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 27, CFSTR("INSURANCE_CATEGORY"), CFSTR("health_records_insurance"), 0, CFSTR("health_records_insurance"), CFSTR("person.text.rectangle.fill"));
  v30[23] = v8;
  v9 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 30, CFSTR("CLINICAL_NOTES_CATEGORY"), CFSTR("health_records_clinical_notes"), 0, CFSTR("health_records_clinical_notes"), CFSTR("pencil.and.list.clipboard"));
  v30[24] = v9;
  v10 = -[HKDisplayCategory initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:]([HKDisplayCategory alloc], "initWithCategoryID:displayName:listIconName:largeListIconName:shareIconName:systemImageName:", 31, CFSTR("MEDICATION_TRACKING"), CFSTR("healthdata_glyph_medicationTracking"), CFSTR("healthdata_glyph_medicationTracking_large"), CFSTR("sharedata_glyph_medicationTracking"), CFSTR("pills.fill"));
  v30[25] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)sortedCategories
{
  void *v2;
  void *v3;

  +[HKDisplayCategory allCategories](HKDisplayCategory, "allCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_29);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __56__HKDisplayCategory_BuiltinCategories__sortedCategories__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

+ (id)topLevelCategoryIdentifiers
{
  return &unk_1E9CE9E30;
}

- (HKDisplayCategory)init
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

- (HKFillStyle)fillStyle
{
  HKSolidFillStyle *v3;
  void *v4;

  v3 = objc_alloc_init(HKSolidFillStyle);
  -[HKDisplayCategory(BuiltinCategories) color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v3, "setColor:", v4);

  return (HKFillStyle *)v3;
}

- (UIImage)largeListIcon
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSString *largeListIconName;
  void *v9;
  void *v10;

  -[HKDisplayCategory _image](self, "_image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      -[HKDisplayCategory largeListIcon].cold.1((uint64_t)self, v7, a2);
    largeListIconName = self->_largeListIconName;
    if (largeListIconName)
    {
      v9 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageNamed:inBundle:", largeListIconName, v10);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
  }

  return (UIImage *)v6;
}

- (UIImage)shareIcon
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSString *shareIconName;
  void *v9;
  void *v10;

  -[HKDisplayCategory _image](self, "_image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      -[HKDisplayCategory largeListIcon].cold.1((uint64_t)self, v7, a2);
    shareIconName = self->_shareIconName;
    if (shareIconName)
    {
      v9 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageNamed:inBundle:", shareIconName, v10);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
  }

  return (UIImage *)v6;
}

- (BOOL)isMeCategory
{
  return self->_categoryID == 7;
}

- (BOOL)isTopLevelCategory
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend((id)objc_opt_class(), "topLevelCategoryIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_categoryID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "indexOfObject:", v4) != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (NSString)embeddedDisplayName
{
  return self->_embeddedDisplayName;
}

- (NSString)largeListIconName
{
  return self->_largeListIconName;
}

- (NSString)listIconName
{
  return self->_listIconName;
}

- (NSString)healthDataIconName
{
  return self->_healthDataIconName;
}

- (NSString)shareIconName
{
  return self->_shareIconName;
}

- (UIImageSymbolConfiguration)multiColorImageConfiguration
{
  return self->_multiColorImageConfiguration;
}

- (UIColor)color
{
  return self->_color;
}

- (void)largeListIcon
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = OUTLINED_FUNCTION_3_4(a1, a2);
  NSStringFromSelector(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_1(&dword_1D7813000, v6, v7, "using fallback icon for %@ in %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0_2();
}

@end
