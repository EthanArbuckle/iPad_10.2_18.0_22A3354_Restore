@implementation GEOLPRDefinedPlateType(MNExtras)

- (uint64_t)hasDefinedPlateConditionsForVehicle:()MNExtras error:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a1, "conditions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v17 = 0;
        v13 = objc_msgSend(v6, "matchesDefinedPlateCondition:error:", v12, &v17);
        v14 = v17;
        v15 = v14;
        if ((v13 & 1) != 0)
          goto LABEL_13;
        if (v14)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v14);
LABEL_13:

          goto LABEL_14;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
  v15 = v7;
LABEL_14:

  return v13;
}

@end
