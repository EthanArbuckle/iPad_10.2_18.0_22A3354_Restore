@implementation HUSoftwareUpdateInfoItem

+ (id)_dateFormatter
{
  if (qword_1EF226B50 != -1)
    dispatch_once(&qword_1EF226B50, &__block_literal_global_160);
  return (id)_MergedGlobals_3_8;
}

uint64_t __42__HUSoftwareUpdateInfoItem__dateFormatter__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D313F0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "relativeDateFormatter");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_3_8;
  _MergedGlobals_3_8 = v1;

  objc_msgSend((id)_MergedGlobals_3_8, "setDateStyle:", 2);
  return objc_msgSend((id)_MergedGlobals_3_8, "setTimeStyle:", 0);
}

+ (id)_iconDescriptorForAccessories:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_isMediaAccessory");

  if (!v5)
    goto LABEL_6;
  objc_msgSend(v3, "na_flatMap:", &__block_literal_global_9_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") != 1)
  {

LABEL_6:
    v8 = (void *)MEMORY[0x1E0D317C8];
    objc_msgSend(v3, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iconDescriptorForAccessory:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_6;
LABEL_7:

  return v7;
}

id __58__HUSoftwareUpdateInfoItem__iconDescriptorForAccessories___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D31530];
  objc_msgSend(a2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaIconDescriptorForMediaContainer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HUSoftwareUpdateInfoItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessories_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateInfoItem.m"), 72, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSoftwareUpdateInfoItem init]",
    v5);

  return 0;
}

- (HUSoftwareUpdateInfoItem)initWithAccessories:(id)a3
{
  id v5;
  HUSoftwareUpdateInfoItem *v6;
  HUSoftwareUpdateInfoItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUSoftwareUpdateInfoItem;
  v6 = -[HUSoftwareUpdateInfoItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accessories, a3);

  return v7;
}

- (id)_releaseNotesResultsFuture
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__22;
  v24 = __Block_byref_object_dispose__22;
  v25 = (id)*MEMORY[0x1E0CEC590];
  v4 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __54__HUSoftwareUpdateInfoItem__releaseNotesResultsFuture__block_invoke;
  v19[3] = &unk_1E6F58600;
  v19[4] = self;
  v19[5] = &v20;
  __54__HUSoftwareUpdateInfoItem__releaseNotesResultsFuture__block_invoke((uint64_t)v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") && objc_msgSend((id)v21[5], "isEqual:", *MEMORY[0x1E0CEC518]))
  {
    -[HUSoftwareUpdateInfoItem releaseNotesHTMLString](self, "releaseNotesHTMLString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3498], "hf_safeAttributedStringWithHTML:attributes:", v5, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v4;
      v16[1] = 3221225472;
      v16[2] = __54__HUSoftwareUpdateInfoItem__releaseNotesResultsFuture__block_invoke_3;
      v16[3] = &unk_1E6F58628;
      v16[4] = self;
      v17 = v5;
      v12 = v3;
      v18 = v12;
      objc_msgSend(v11, "flatMap:", v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v4;
      v14[1] = 3221225472;
      v14[2] = __54__HUSoftwareUpdateInfoItem__releaseNotesResultsFuture__block_invoke_4;
      v14[3] = &unk_1E6F4F2D0;
      v15 = v12;
      objc_msgSend(v13, "recover:", v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    -[HUSoftwareUpdateInfoItem releaseNotesAttributedString](self, "releaseNotesAttributedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("releaseNotesAttributedString"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("releaseNotesString"));
    -[HUSoftwareUpdateInfoItem setReleaseNotesHTMLString:](self, "setReleaseNotesHTMLString:", 0);
    -[HUSoftwareUpdateInfoItem setReleaseNotesAttributedString:](self, "setReleaseNotesAttributedString:", 0);
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  _Block_object_dispose(&v20, 8);
  return v9;
}

__CFString *__54__HUSoftwareUpdateInfoItem__releaseNotesResultsFuture__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;

  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_22_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "hf_softwareUpdateDocumentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "releaseNotes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), (id)*MEMORY[0x1E0CEC518]);
    objc_msgSend(v4, "releaseNotes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "textReleaseNotes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "textReleaseNotes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "releaseNotesSummary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v13 = &stru_1E6F60E80;
        goto LABEL_8;
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), (id)*MEMORY[0x1E0CEC518]);
      objc_msgSend(v4, "releaseNotesSummary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v12 = v7;
  objc_msgSend(v7, "stringValue");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v13;
}

BOOL __54__HUSoftwareUpdateInfoItem__releaseNotesResultsFuture__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "hf_softwareUpdateDocumentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __54__HUSoftwareUpdateInfoItem__releaseNotesResultsFuture__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "setReleaseNotesHTMLString:", v3);
  objc_msgSend(v5, "hf_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setReleaseNotesAttributedString:", v6);
  objc_msgSend(*(id *)(a1 + 32), "releaseNotesAttributedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v7, CFSTR("releaseNotesAttributedString"));

  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 48));
}

uint64_t __54__HUSoftwareUpdateInfoItem__releaseNotesResultsFuture__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  HUSoftwareUpdateInfoItem *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateInfoItem _releaseNotesResultsFuture](self, "_releaseNotesResultsFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HUSoftwareUpdateInfoItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_1E6F4E848;
  v10 = v4;
  v11 = self;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __56__HUSoftwareUpdateInfoItem__subclass_updateWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;

  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", a2);
  objc_msgSend(*(id *)(a1 + 40), "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_30_4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30EA8]);

  objc_msgSend(*(id *)(a1 + 40), "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_32_1) ^ 1;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30D70]);

  objc_msgSend(*(id *)(a1 + 40), "accessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "na_all:", &__block_literal_global_33_2);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D30EB8]);

  objc_msgSend(*(id *)(a1 + 40), "accessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_filter:", &__block_literal_global_34_1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D31830], "progressForAccessoriesDownloadingSoftwareUpdate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30EC0]);

  objc_msgSend(*(id *)(a1 + 40), "accessories");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "anyObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hf_userFriendlyLocalizedCapitalizedDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30D18]);

  v18 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "accessories");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_iconDescriptorForAccessories:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30C60]);

  objc_msgSend(*(id *)(a1 + 40), "accessories");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "na_flatMap:", &__block_literal_global_36_3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v22, CFSTR("affectedAccessories"));

  objc_msgSend(*(id *)(a1 + 40), "accessories");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "anyObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "manufacturer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    v27 = v25;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateInfoItemProviderUnknownPublisher"), CFSTR("HUSoftwareUpdateInfoItemProviderUnknownPublisher"), 1);
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = v27;

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D30C08]);
  objc_msgSend(*(id *)(a1 + 40), "accessories");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "anyObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "hf_softwareUpdateDisplayableVersion");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    HULocalizedStringWithFormat(CFSTR("HUSoftwareUpdateVersionFormat"), CFSTR("%@"), v32, v33, v34, v35, v36, v37, (uint64_t)v31);
    v38 = objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      v39 = (void *)v38;
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0D30CD0]);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "accessories");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "anyObject");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "hf_softwareUpdateReleaseDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend((id)objc_opt_class(), "_dateFormatter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringFromDate:", v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v44 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "accessories");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "anyObject");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "hf_softwareUpdateDownloadSize");

  if (v47 < 2)
  {
    v55 = 0;
LABEL_15:
    if (v44)
    {
      v56 = v44;
    }
    else
    {
      v56 = v55;
      v55 = v56;
    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v47, 0);
  v48 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v48;
  if (!v42 || !v48)
    goto LABEL_15;
  HULocalizedStringWithFormat(CFSTR("HUSoftwareUpdateCombinedReleaseDateAndSizeFormat"), CFSTR("%@%@"), v49, v50, v51, v52, v53, v54, (uint64_t)v44);
  v56 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
  v57 = v56;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v56, *MEMORY[0x1E0D30D08]);
  objc_msgSend(*(id *)(a1 + 40), "accessories");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "na_all:", &__block_literal_global_49_1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v60, *MEMORY[0x1E0D30EC8]);

  if ((_DWORD)v59)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30C80]);
    v61 = CFSTR("HUSoftwareUpdateControlTitle_Requested");
  }
  else
  {
    v61 = CFSTR("HUSoftwareUpdateControlTitle_Update");
  }
  _HULocalizedStringWithDefaultValue(v61, v61, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v62, *MEMORY[0x1E0D30BC0]);

  objc_msgSend(*(id *)(a1 + 40), "accessories");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v63, *MEMORY[0x1E0D30B80]);

  v64 = (void *)MEMORY[0x1E0C99E60];
  v65 = objc_opt_class();
  objc_msgSend(v64, "setWithObjects:", v65, objc_opt_class(), 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v66, *MEMORY[0x1E0D30B78]);

  v67 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D60]);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v67, *MEMORY[0x1E0D30D58]);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v67, *MEMORY[0x1E0D30CF0]);
  v68 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", *(_QWORD *)(a1 + 32));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "futureWithResult:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  return v70;
}

uint64_t __56__HUSoftwareUpdateInfoItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSoftwareUpdateInProgress");
}

uint64_t __56__HUSoftwareUpdateInfoItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_softwareUpdatePossessesNecessaryDocumentation");
}

uint64_t __56__HUSoftwareUpdateInfoItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSoftwareUpdateInstalled");
}

uint64_t __56__HUSoftwareUpdateInfoItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isDownloadingSoftwareUpdate");
}

id __56__HUSoftwareUpdateInfoItem__subclass_updateWithOptions___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E20];
  v3 = a2;
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_bridgedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", v5);
  return v4;
}

uint64_t __56__HUSoftwareUpdateInfoItem__subclass_updateWithOptions___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasRequestedSoftwareUpdate");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateInfoItem latestResults](self, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", objc_msgSend(v5, "BOOLValue"), CFSTR("hidden"), 1);

  -[HUSoftwareUpdateInfoItem accessories](self, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_prettyDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("accessories"));

  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSSet)accessories
{
  return self->_accessories;
}

- (NSString)releaseNotesHTMLString
{
  return self->_releaseNotesHTMLString;
}

- (void)setReleaseNotesHTMLString:(id)a3
{
  objc_storeStrong((id *)&self->_releaseNotesHTMLString, a3);
}

- (NSAttributedString)releaseNotesAttributedString
{
  return self->_releaseNotesAttributedString;
}

- (void)setReleaseNotesAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_releaseNotesAttributedString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releaseNotesAttributedString, 0);
  objc_storeStrong((id *)&self->_releaseNotesHTMLString, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
}

@end
