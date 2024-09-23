@implementation NSArray(PreviewDeviceInfoAppearanceAdditions)

- (id)ic_deviceInfosByAddingAppearances
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_opt_class();
        ICDynamicCast();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __82__NSArray_PreviewDeviceInfoAppearanceAdditions__ic_deviceInfosByAddingAppearances__block_invoke;
          v12[3] = &unk_1E76CBCB8;
          v12[4] = v8;
          v13 = v2;
          +[ICAppearanceInfo enumerateAppearanceTypesUsingBlock:](ICAppearanceInfo, "enumerateAppearanceTypesUsingBlock:", v12);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "checkedDeviceInfo != ((void *)0)", "-[NSArray(PreviewDeviceInfoAppearanceAdditions) ic_deviceInfosByAddingAppearances]", 1, 0, CFSTR("Trying to add appearances to an array of devices infos, but the array contains something other than a device info, skipping %@"), v8);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  v10 = (void *)objc_msgSend(v2, "copy");
  return v10;
}

@end
