@implementation HUStatusBannerItem

- (HUStatusBannerItem)initWithSourceItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUStatusBannerItem;
  return -[HFTransformItem initWithSourceItem:resultKeyExclusionFilter:](&v4, sel_initWithSourceItem_resultKeyExclusionFilter_, a3, MEMORY[0x1E0C9AA60]);
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30910]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0D519C0];
    v8 = (void *)MEMORY[0x1E0D314B8];
    v14 = *MEMORY[0x1E0D30D70];
    v15[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "outcomeWithResults:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "futureWithResult:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HUStatusBannerItem;
    -[HFTransformItem _subclass_updateWithOptions:](&v13, sel__subclass_updateWithOptions_, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "flatMap:", &__block_literal_global_44);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

id __50__HUStatusBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *MEMORY[0x1E0D30D70];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v3, "mutableCopy");

    _HULocalizedStringWithDefaultValue(CFSTR("HUBannerStatus_ViewDetails"), CFSTR("HUBannerStatus_ViewDetails"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30BC0]);

    v3 = v6;
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_descriptionForLocalizedStringKey:(id)a3 representedHomeKitObjects:(id)a4
{
  return -[HUStatusBannerItem _descriptionForLocalizedStringKey:representedHomeKitObjects:options:](self, "_descriptionForLocalizedStringKey:representedHomeKitObjects:options:", a3, a4, 0);
}

- (id)_descriptionForLocalizedStringKey:(id)a3 representedHomeKitObjects:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  id v24;
  const __CFString *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v35[4];

  v5 = a5;
  v35[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  if ((v5 & 1) != 0)
    objc_msgSend((id)objc_opt_class(), "_sortedRoomNamesForHomeKitObjects:", v9);
  else
    -[HUStatusBannerItem _sortedObjectDisplayNamesForHomeKitObjects:](self, "_sortedObjectDisplayNamesForHomeKitObjects:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0x1E0CB3000uLL;
  switch(objc_msgSend(v11, "count"))
  {
    case 0:
      if ((v5 & 1) != 0)
        v13 = CFSTR("%@_ZeroRooms");
      else
        v13 = CFSTR("%@_ZeroObjects");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v13, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 1:
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = CFSTR("%@_OneRoom");
      v22 = CFSTR("%@_OneObject");
      goto LABEL_15;
    case 2:
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = CFSTR("%@_TwoRooms");
      v22 = CFSTR("%@_TwoObjects");
LABEL_15:
      if ((v5 & 1) != 0)
        v23 = v21;
      else
        v23 = v22;
      objc_msgSend(v20, "stringWithFormat:", v23, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v11;
      goto LABEL_23;
    case 3:
      if ((v5 & 1) != 0)
        v25 = CFSTR("%@_ThreeRooms");
      else
        v25 = CFSTR("%@_ThreeObjects");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v25, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "subarrayWithRange:", 0, 2);
      v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
      v26 = v24;

      v10 = v26;
      break;
    default:
      if ((v5 & 1) != 0)
        v15 = CFSTR("%@_MoreThanThreeRooms");
      else
        v15 = CFSTR("%@_MoreThanThreeObjects");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v15, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v16;
      objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v17;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "count") - 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
      v19 = objc_claimAutoreleasedReturnValue();

      v12 = 0x1E0CB3000;
      v10 = (void *)v19;
      break;
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(v14, "stringByAppendingString:", CFSTR("_NetworkName"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend((id)objc_opt_class(), "_networkNameForHomeKitObjects:", v9);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "length"))
      {
        v29 = v27;

        objc_msgSend(v10, "arrayByAddingObject:", v28);
        v30 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v30;
        v14 = v29;
      }

    }
  }
  v31 = *(void **)(v12 + 2368);
  _HULocalizedStringWithDefaultValue(v14, v14, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "hf_stringWithFormat:arguments:", v32, v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

+ (id)_networkNameForHomeKitObjects:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "na_map:", &__block_literal_global_82);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __52__HUStatusBannerItem__networkNameForHomeKitObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "wifiNetworkInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "SSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_sortedRoomNamesForHomeKitObjects:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "na_map:", &__block_literal_global_85_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_208);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __56__HUStatusBannerItem__sortedRoomNamesForHomeKitObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = a2;
  v3 = &unk_1EF347348;
  v4 = v2;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  if (objc_msgSend(v4, "conformsToProtocol:", v3))
    v6 = v5;
  else
    v6 = 0;
  v7 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v10);

LABEL_7:
    v7 = 0;
  }

  objc_msgSend(v7, "hf_safeRoom");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __56__HUStatusBannerItem__sortedRoomNamesForHomeKitObjects___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedStandardCompare:");
}

- (id)_sortedObjectDisplayNamesForHomeKitObjects:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__HUStatusBannerItem__sortedObjectDisplayNamesForHomeKitObjects___block_invoke;
  v7[3] = &unk_1E6F4FC80;
  v7[4] = self;
  objc_msgSend(a3, "na_map:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_209);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __65__HUStatusBannerItem__sortedObjectDisplayNamesForHomeKitObjects___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "sourceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayNameForHomeKitObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __65__HUStatusBannerItem__sortedObjectDisplayNamesForHomeKitObjects___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedStandardCompare:");
}

@end
