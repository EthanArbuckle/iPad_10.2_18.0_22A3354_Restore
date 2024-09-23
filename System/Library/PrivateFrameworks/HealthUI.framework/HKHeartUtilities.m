@implementation HKHeartUtilities

+ (id)minMaxStringForHeartRates:(id)a3 displayTypeController:(id)a4 unitController:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t i;
  void *v18;
  void *v19;
  double v20;
  double v21;
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
  void *v34;
  void *v35;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v38 = v9;
    v10 = v8;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    v37 = v7;
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v40;
      v15 = 0.0;
      v16 = 1.79769313e308;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v40 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "quantity");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("count/min"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "doubleValueForUnit:", v19);
          v21 = v20;

          if (v16 >= v21)
            v16 = v21;
          if (v15 < v21)
            v15 = v21;
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v13);
    }
    else
    {
      v15 = 0.0;
      v16 = 1.79769313e308;
    }

    v23 = v10;
    objc_msgSend(v10, "displayTypeWithIdentifier:", &unk_1E9CECE48);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "presentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "adjustedValueForDaemonValue:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "presentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "adjustedValueForDaemonValue:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v38;
    HKFormattedStringFromValueForContext(v27, v24, v38, 0, 0, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    HKFormattedStringFromValueForContext(v30, v24, v38, 0, 0, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("SHOW_ALL_DATA_MIN_MAX"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", v35, v31, v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v23;
    v7 = v37;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end
