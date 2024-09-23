@implementation HUCameraStreamAndRecordStateInfoProvider

- (HUCameraStreamAndRecordStateInfoProvider)initWithDisplayStyle:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  HUCameraStreamAndRecordStateInfoProvider *v15;
  objc_super v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD aBlock[5];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__HUCameraStreamAndRecordStateInfoProvider_initWithDisplayStyle___block_invoke;
  aBlock[3] = &__block_descriptor_40_e38___NSAttributedString_16__0__NSNumber_8l;
  aBlock[4] = a3;
  v5 = _Block_copy(aBlock);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(&unk_1E7042C30, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    v9 = 1;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(&unk_1E7042C30);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10);
        v12 = objc_alloc(MEMORY[0x1E0D31840]);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __65__HUCameraStreamAndRecordStateInfoProvider_initWithDisplayStyle___block_invoke_2;
        v19[3] = &unk_1E6F52570;
        v21 = v9 + v10;
        v13 = v5;
        v19[4] = v11;
        v20 = v13;
        v14 = (void *)objc_msgSend(v12, "initWithResultsBlock:", v19);
        objc_msgSend(v4, "addObject:", v14);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(&unk_1E7042C30, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      v9 += v10;
    }
    while (v7);
  }
  v18.receiver = self;
  v18.super_class = (Class)HUCameraStreamAndRecordStateInfoProvider;
  v15 = -[HFStaticItemProvider initWithItems:](&v18, sel_initWithItems_, v4, self);

  return v15;
}

id __65__HUCameraStreamAndRecordStateInfoProvider_initWithDisplayStyle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  HUImageIdentifierForStreamingOption(objc_msgSend(a2, "unsignedIntegerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HUCameraStreamingSettingsHeaderDisplayStyleServiceDetails_%@_Title"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v4, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HUCameraStreamingSettingsHeaderDisplayStyleServiceDetails_%@_Body"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v6, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HUCameraBuildFeatureDescriptionAttributedString(*(_QWORD *)(a1 + 32), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __65__HUCameraStreamAndRecordStateInfoProvider_initWithDisplayStyle___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30DA8]);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30BF8]);

  v5 = objc_alloc(MEMORY[0x1E0D31460]);
  HUImageIdentifierForStreamingOption(objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithImageIdentifier:", v6);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30C60]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
