@implementation GEOLPRVehicle(MNExtras)

- (uint64_t)_matchesPower:()MNExtras andVehicle:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "powerTypeKey");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = objc_msgSend(v6, "count");

    if (v10)
    {
      objc_msgSend(a1, "powerTypeKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "containsObject:", v11);

      if (!v12)
        goto LABEL_8;
    }
  }
  objc_msgSend(a1, "vehicleTypeKey");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_7;
  v14 = (void *)v13;
  v15 = objc_msgSend(v7, "count");

  if (v15
    && (objc_msgSend(a1, "vehicleTypeKey"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v7, "containsObject:", v16),
        v16,
        !v17))
  {
LABEL_8:
    v18 = 0;
  }
  else
  {
LABEL_7:
    v18 = 1;
  }

  return v18;
}

- (uint64_t)matchesPlateInfo:()MNExtras
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "powerTypeKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vehicleTypeKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(a1, "_matchesPower:andVehicle:", v5, v6);
  return v7;
}

- (uint64_t)matchesLicensePlateRegion:()MNExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "licensePlateInfosCount"))
  {
    objc_msgSend(a1, "powerTypeKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      objc_msgSend(a1, "vehicleTypeKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v6 = 0;
        goto LABEL_17;
      }
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "licensePlateInfos", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v13, "powerTypeKeys");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "vehicleTypeKeys");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "_matchesPower:andVehicle:", v14, v15);

          if ((v16 & 1) != 0)
          {
            v6 = 1;
            goto LABEL_16;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_16:

  }
  else
  {
    v6 = 1;
  }
LABEL_17:

  return v6;
}

- (uint64_t)matchesDefinedPlateCondition:()MNExtras error:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "licensePlate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {

    goto LABEL_29;
  }
  objc_msgSend(a1, "powerTypeKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else
  {
    objc_msgSend(a1, "vehicleTypeKey");
    v9 = objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_30;
  }
  objc_msgSend(v6, "powerTypeKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vehicleTypeKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(a1, "_matchesPower:andVehicle:", v10, v11);

  if (!v12)
  {
LABEL_29:
    v9 = 0;
    goto LABEL_30;
  }
  objc_msgSend(a1, "licensePlate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v6, "plateMatchConditions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (!v40)
  {
LABEL_28:

    goto LABEL_29;
  }
  v16 = *(_QWORD *)v50;
  v42 = v15;
  v43 = v6;
  v38 = *(_QWORD *)v50;
  v39 = a4;
  while (1)
  {
    v17 = 0;
LABEL_10:
    if (*(_QWORD *)v50 != v16)
      objc_enumerationMutation(v15);
    v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v17);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v18, "patterns");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (!v20)
      break;
    v21 = v20;
    v41 = v17;
    v22 = *(_QWORD *)v46;
LABEL_14:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v22)
        objc_enumerationMutation(v19);
      v24 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v23);
      v25 = objc_alloc(MEMORY[0x1E0CB38E8]);
      v44 = 0;
      v26 = (void *)objc_msgSend(v25, "initWithPattern:options:error:", v24, 3, &v44);
      v27 = v44;
      if (v26)
        v32 = v27 == 0;
      else
        v32 = 0;
      if (!v32)
      {
        v37 = v27;
        _mnLPRWrappedError(v39, -100, v27, CFSTR("Invalid regular expression: \"%@\"), v28, v29, v30, v31, v24);
        objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 2191, 0, CFSTR("InvalidRegEx"));

        v9 = 0;
LABEL_31:
        v15 = v42;
        v6 = v43;
        goto LABEL_32;
      }
      objc_msgSend(a1, "licensePlate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "rangeOfFirstMatchInString:options:range:", v33, 0, 0, v14);
      v35 = v34;

      if (!v35)
        break;
      if (v21 == ++v23)
      {
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        if (v21)
          goto LABEL_14;
        v9 = 1;
        goto LABEL_31;
      }
    }

    v17 = v41 + 1;
    v15 = v42;
    v6 = v43;
    v16 = v38;
    if (v41 + 1 != v40)
      goto LABEL_10;
    v40 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (!v40)
      goto LABEL_28;
  }
  v9 = 1;
LABEL_32:

LABEL_30:
  return v9;
}

@end
