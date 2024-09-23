@implementation MRLocalization

- (id)localizedStringWithKey:(id)a3 defaultString:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;

  v5 = a3;
  v6 = a4;
  objc_msgSend_bundleWithPath_(MEMORY[0x1E0CB34D0], v7, (uint64_t)CFSTR("/System/Library/PrivateFrameworks/CoreRepairKit.framework"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend_localizations(v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredLanguages(MEMORY[0x1E0C99DC8], v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredLocalizationsFromArray_forPreferences_(v10, v19, (uint64_t)v14, (uint64_t)v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v20, v21, 0, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_localization_(v9, v24, (uint64_t)v5, (uint64_t)CFSTR("NOTFOUND"), CFSTR("Localizable"), v23);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_isEqualToString_(v25, v26, (uint64_t)CFSTR("NOTFOUND"), v27))
  {
    objc_msgSend_objectAtIndexedSubscript_(v20, v28, 0, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_localization_(v9, v31, (uint64_t)v5, (uint64_t)CFSTR("NOTFOUND"), CFSTR("Localizable-IPAD"), v30);
    v32 = objc_claimAutoreleasedReturnValue();

    v25 = (id)v32;
  }
  if (objc_msgSend_isEqualToString_(v25, v28, (uint64_t)CFSTR("NOTFOUND"), v29))
  {
    objc_msgSend_objectAtIndexedSubscript_(v20, v33, 0, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_localization_(v9, v36, (uint64_t)v5, (uint64_t)CFSTR("NOTFOUND"), CFSTR("Localizable-CRYSTAL_FEATURES"), v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_isEqualToString_(v37, v38, (uint64_t)CFSTR("NOTFOUND"), v39))
    {
      v25 = v6;

    }
    else
    {
      v25 = v37;
    }
  }

  return v25;
}

@end
