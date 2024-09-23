@implementation AVTAvatarConfigurationMetric

+ (id)defaultMetric
{
  if (defaultMetric_onceToken != -1)
    dispatch_once(&defaultMetric_onceToken, &__block_literal_global_18);
  return (id)defaultMetric_sInstance;
}

void __45__AVTAvatarConfigurationMetric_defaultMetric__block_invoke()
{
  AVTAvatarConfigurationMetric *v0;
  void *v1;

  v0 = objc_alloc_init(AVTAvatarConfigurationMetric);
  v1 = (void *)defaultMetric_sInstance;
  defaultMetric_sInstance = (uint64_t)v0;

}

+ (unint64_t)distanceFromConfiguration:(id)a3 toConfiguration:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__AVTAvatarConfigurationMetric_distanceFromConfiguration_toConfiguration___block_invoke;
  v10[3] = &unk_1EA51F0C8;
  v10[4] = &v11;
  v10[5] = a1;
  objc_msgSend(a1, "enumerateDifferencesFromConfiguration:toConfiguration:withHandler:", v6, v7, v10);
  v8 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __74__AVTAvatarConfigurationMetric_distanceFromConfiguration_toConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "impactForSettingKind:", a2, a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += 1 << (6 * result);
  return result;
}

+ (int64_t)gapFromDistance:(unint64_t)a3
{
  int64_t v3;

  if ((a3 & 7) != 0)
    v3 = 0;
  else
    v3 = -1;
  if ((a3 & 0x1C0) != 0)
    v3 = 1;
  if ((a3 & 0x7000) != 0)
    v3 = 2;
  if ((a3 & 0x1C0000) != 0)
    return 3;
  else
    return v3;
}

+ (unint64_t)differenceCountFromDistance:(unint64_t)a3
{
  return ((a3 >> 6) & 7) + (a3 & 7) + ((a3 >> 12) & 7) + ((a3 >> 18) & 7);
}

+ (int64_t)impactForSettingKind:(id)a3
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int64_t v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v42[11];
  _QWORD v43[13];

  v43[11] = *MEMORY[0x1E0C80C00];
  v3 = AVTPresetSettingKind();
  +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v3, v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v40;
  v43[0] = &unk_1EA571788;
  v5 = AVTPresetSettingKind();
  +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v5, v6);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v39;
  v43[1] = &unk_1EA571788;
  v7 = AVTPresetSettingKind();
  +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v7, v8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v38;
  v43[2] = &unk_1EA571788;
  v9 = AVTPresetSettingKind();
  +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v9, v10);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v37;
  v43[3] = &unk_1EA571788;
  v11 = AVTPresetSettingKind();
  +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v13;
  v43[4] = &unk_1EA571788;
  v14 = AVTPresetSettingKind();
  +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v16;
  v43[5] = &unk_1EA571788;
  v17 = AVTPresetSettingKind();
  +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v19;
  v43[6] = &unk_1EA571788;
  v20 = AVTPresetSettingKind();
  +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v22;
  v43[7] = &unk_1EA571788;
  v23 = AVTPresetSettingKind();
  +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[8] = v25;
  v43[8] = &unk_1EA5717A0;
  v26 = AVTPresetSettingKind();
  +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[9] = v28;
  v43[9] = &unk_1EA5717A0;
  v29 = AVTPresetSettingKind();
  +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[10] = v31;
  v43[10] = &unk_1EA5717A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 11);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", a3.var0, a3.var1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
    v35 = objc_msgSend(v34, "integerValue");
  else
    v35 = 0;

  return v35;
}

+ (void)enumerateDifferencesFromConfiguration:(id)a3 toConfiguration:(id)a4 withHandler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0C99E20];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__AVTAvatarConfigurationMetric_enumerateDifferencesFromConfiguration_toConfiguration_withHandler___block_invoke;
  v15[3] = &unk_1EA51F0F0;
  v16 = v11;
  v17 = v7;
  v12 = v7;
  v13 = v11;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1DF0D0754](v15);
  ((void (**)(_QWORD, id, id))v14)[2](v14, v10, v9);
  ((void (**)(_QWORD, id, id))v14)[2](v14, v9, v10);

}

void __98__AVTAvatarConfigurationMetric_enumerateDifferencesFromConfiguration_toConfiguration_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __objc2_class **v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __objc2_class *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  __objc2_class **v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(a2, "configurationPresets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    v10 = off_1EA51C000;
    do
    {
      v11 = 0;
      v29 = v8;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "settingKind");
        objc_msgSend(v5, "configurationPresetForSettingKind:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v10[5];
        v17 = objc_msgSend(v12, "settingKind");
        -[__objc2_class valueWithSettingKind:](v16, "valueWithSettingKind:", v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v19) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v19);
          if ((objc_msgSend(v12, "isEqual:", v15) & 1) == 0)
          {
            v20 = v9;
            v21 = v5;
            v22 = v10;
            v23 = v6;
            v24 = *(_QWORD *)(a1 + 40);
            v25 = objc_msgSend(v12, "settingKind");
            v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16);
            v27 = v24;
            v6 = v23;
            v10 = v22;
            v5 = v21;
            v9 = v20;
            v8 = v29;
            v26(v27, v25, v28);
          }
        }

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v8);
  }

}

- (unint64_t)distanceFromConfiguration:(id)a3 toConfiguration:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(), "distanceFromConfiguration:toConfiguration:", v6, v5);

  return v7;
}

- (unint64_t)differenceCountFromDistance:(unint64_t)a3
{
  return objc_msgSend((id)objc_opt_class(), "differenceCountFromDistance:", a3);
}

- (int64_t)gapFromDistance:(unint64_t)a3
{
  return objc_msgSend((id)objc_opt_class(), "gapFromDistance:", a3);
}

@end
