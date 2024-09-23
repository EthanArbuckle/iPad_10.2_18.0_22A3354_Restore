@implementation MPAVRoute(Routing)

- (id)routingBatteryTextWithFormatter:()Routing
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  float v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;

  v4 = a3;
  objc_msgSend(a1, "batteryLevel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftPercentage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "rightPercentage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "leftPercentage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v10 = v9;
      objc_msgSend(v5, "rightPercentage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v13 = vabds_f32(v10, v12) >= 0.1;

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  objc_msgSend(v5, "leftPercentage");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14
    || ((v15 = (void *)v14,
         objc_msgSend(v5, "rightPercentage"),
         (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      ? (v17 = v13)
      : (v17 = 0),
        v16,
        v15,
        !v17))
  {
    objc_msgSend(v5, "leftPercentage");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      objc_msgSend(v5, "rightPercentage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v5, "leftPercentage");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "floatValue");
        v28 = v27;
        objc_msgSend(v5, "rightPercentage");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "floatValue");
        if (v28 < v30)
          objc_msgSend(v5, "leftPercentage");
        else
          objc_msgSend(v5, "rightPercentage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
        objc_msgSend(v4, "stringFromNumber:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[MRUStringsProvider accessoryBatteryLevelSingle:](MRUStringsProvider, "accessoryBatteryLevelSingle:", v19);
        v32 = objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
    }
    objc_msgSend(v5, "leftPercentage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v5, "leftPercentage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringFromNumber:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[MRUStringsProvider accessoryBatteryLevelLeft:](MRUStringsProvider, "accessoryBatteryLevelLeft:", v19);
      v32 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "rightPercentage");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33)
      {
        objc_msgSend(v5, "singlePercentage");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          goto LABEL_26;
        objc_msgSend(v5, "singlePercentage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      objc_msgSend(v5, "rightPercentage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringFromNumber:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[MRUStringsProvider accessoryBatteryLevelRight:](MRUStringsProvider, "accessoryBatteryLevelRight:", v19);
      v32 = objc_claimAutoreleasedReturnValue();
    }
LABEL_24:
    v22 = (void *)v32;
    goto LABEL_25;
  }
  objc_msgSend(v5, "leftPercentage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightPercentage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRUStringsProvider accessoryBatteryLevelCombinedLeft:right:](MRUStringsProvider, "accessoryBatteryLevelCombinedLeft:right:", v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_25:
LABEL_26:
  objc_msgSend(v5, "casePercentage");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
    goto LABEL_30;
  objc_msgSend(v5, "casePercentage");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRUStringsProvider accessoryBatteryLevelCase:](MRUStringsProvider, "accessoryBatteryLevelCase:", v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
    goto LABEL_30;
  if (v34)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  %@"), v22, v34);
    v37 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_30:
    v37 = v22;
  }
  v38 = v37;

  return v38;
}

- (id)routingPairedDeviceText
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isPickedOnPairedDevice"))
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "auxiliaryDevices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v3)
  {

    goto LABEL_15;
  }
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v13;
LABEL_4:
  v7 = 0;
  v8 = v5;
  while (1)
  {
    if (*(_QWORD *)v13 != v6)
      objc_enumerationMutation(v2);
    v5 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v7);

    if ((objc_msgSend(v5, "isPlaying") & 1) != 0)
      break;
    ++v7;
    v8 = v5;
    if (v4 == v7)
    {
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        goto LABEL_4;
      break;
    }
  }

  if (!v5)
  {
LABEL_15:
    objc_msgSend(a1, "playingPairedDeviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_12;
LABEL_16:
    +[MRUStringsProvider routingInUseOnPairedDevice:](MRUStringsProvider, "routingInUseOnPairedDevice:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(v5, "deviceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_16;
LABEL_12:
  v10 = 0;
LABEL_17:

  return v10;
}

@end
