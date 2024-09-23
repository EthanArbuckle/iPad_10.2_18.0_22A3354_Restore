@implementation MRAVOutputDeviceSymbolProvider

+ (id)symbolNameForOutputDevice:(id)a3
{
  id v4;
  int v5;
  int v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v16;
  char v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "deviceType");
  v6 = objc_msgSend(v4, "isAirpodsDevice");
  if (v5 == 2 && (!v6 || objc_msgSend(v4, "isAppleAccessory")))
  {
    objc_msgSend(v4, "modelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "symbolNameForProductIdentifier:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_27;
  }
  if (objc_msgSend(v4, "clusterType"))
  {
    objc_msgSend(a1, "symbolNameForClusterOutputDevice:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v8 = (__CFString *)v9;
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "deviceSubtype") == 11)
  {
    v8 = CFSTR("tv");
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "deviceSubtype") == 16)
  {
    v8 = CFSTR("tv.and.mediabox");
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "deviceSubtype") == 17)
  {
    v8 = CFSTR("mediastick");
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "deviceSubtype") == 13)
  {
    v8 = CFSTR("appletv.fill");
    goto LABEL_27;
  }
  if ((objc_msgSend(v4, "isBeatsLegacyDevice") & 1) != 0)
  {
    v8 = CFSTR("beatslogo");
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "deviceSubtype") == 19)
  {
    objc_msgSend(v4, "modelID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "symbolNameForModelID:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("iphone");
LABEL_24:
    if (v11)
      v13 = (__CFString *)v11;
    v8 = v13;

    goto LABEL_27;
  }
  if (objc_msgSend(v4, "deviceSubtype") == 18)
  {
    objc_msgSend(v4, "modelID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "symbolNameForModelID:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("display");
    goto LABEL_24;
  }
  if (objc_msgSend(v4, "deviceSubtype") == 21)
  {
    objc_msgSend(v4, "modelID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "symbolNameForModelID:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("vision.pro.fill");
    goto LABEL_24;
  }
  if ((objc_msgSend(v4, "isJ327Device") & 1) != 0)
  {
    v8 = CFSTR("display");
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "deviceType") == 3)
  {
    v8 = CFSTR("carplay");
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "deviceSubtype") != 12)
  {
    if ((objc_msgSend(v4, "isHearingDevice") & 1) != 0)
    {
      v8 = CFSTR("hearingdevice.ear");
      goto LABEL_27;
    }
    if (objc_msgSend(v4, "deviceType") == 4 && objc_msgSend(v4, "deviceSubtype") == 1)
    {
      objc_msgSend(v4, "sourceInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "multipleBuiltInDevices");

      if ((v17 & 1) != 0)
      {
        v8 = CFSTR("speaker.wave.2.fill");
        goto LABEL_27;
      }
    }
    if (objc_msgSend(v4, "deviceType") == 4 || MSVDeviceIsAppleTV())
    {
      objc_msgSend(a1, "_currentDeviceRoutingSymbolName");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "_fallbackSymbolNameForOutputDevice:", v4);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isB520Device"))
    v8 = CFSTR("homepodmini.fill");
  else
    v8 = CFSTR("homepod.fill");
LABEL_27:
  v14 = v8;

  return v14;
}

+ (id)_fallbackSymbolNameForOutputDevice:(id)a3
{
  id v3;
  int v4;
  int v5;
  int v6;
  id result;

  v3 = a3;
  v4 = objc_msgSend(v3, "deviceType");
  v5 = objc_msgSend(v3, "deviceSubtype");
  v6 = objc_msgSend(v3, "producesLowFidelityAudio");

  result = CFSTR("speaker.wave.2.fill");
  switch(v4)
  {
    case 0:
      return result;
    case 1:
LABEL_2:
      if (v6)
        result = CFSTR("speaker.wave.2.fill");
      else
        result = CFSTR("hifispeaker.fill");
      break;
    case 2:
      if (v5 == 9)
        result = CFSTR("headphones");
      else
        result = CFSTR("speaker.bluetooth.fill");
      break;
    case 3:
LABEL_10:
      result = CFSTR("car.fill");
      break;
    default:
      result = CFSTR("headphones");
      switch(v5)
      {
        case 2:
          return result;
        case 4:
        case 5:
          goto LABEL_2;
        case 7:
        case 8:
        case 11:
          result = CFSTR("tv");
          break;
        case 14:
          goto LABEL_10;
        default:
          result = CFSTR("speaker.wave.2.fill");
          break;
      }
      break;
  }
  return result;
}

+ (id)symbolNameForOutputDevices:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;
  id obj;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[13];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = v4;
  if (objc_msgSend(v4, "count") != 1)
  {
    v71 = 0;
    v72 = &v71;
    v73 = 0x2020000000;
    v74 = 0;
    v67 = 0;
    v68 = &v67;
    v69 = 0x2020000000;
    v70 = 0;
    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 0;
    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v62 = 0;
    v55 = 0;
    v56 = &v55;
    v57 = 0x2020000000;
    v58 = 0;
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __61__MRAVOutputDeviceSymbolProvider_symbolNameForOutputDevices___block_invoke;
    v38[3] = &unk_1E30CFC20;
    v38[4] = &v63;
    v38[5] = &v67;
    v38[6] = &v71;
    v38[7] = &v59;
    v38[8] = &v55;
    v38[9] = &v51;
    v38[10] = &v47;
    v38[11] = &v43;
    v38[12] = &v39;
    v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v38);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v4;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v76, 16);
    if (v8)
    {
      v29 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v35 != v29)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v10, "deviceSubtype") == 15)
          {
            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            objc_msgSend(v10, "clusterComposition");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v75, 16);
            if (v12)
            {
              v13 = *(_QWORD *)v31;
              do
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v31 != v13)
                    objc_enumerationMutation(v11);
                  v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
                  v16 = objc_msgSend(v15, "deviceType");
                  v17 = objc_msgSend(v15, "deviceSubtype");
                  objc_msgSend(v15, "modelID");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  ((void (**)(_QWORD, _QWORD, uint64_t, uint64_t, void *))v7)[2](v7, 0, v16, v17, v18);

                }
                v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v75, 16);
              }
              while (v12);
            }
          }
          else
          {
            v19 = objc_msgSend(v10, "deviceType");
            v20 = objc_msgSend(v10, "deviceSubtype");
            objc_msgSend(v10, "modelID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, uint64_t, uint64_t, void *))v7)[2](v7, v10, v19, v20, v11);
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v76, 16);
      }
      while (v8);
    }

    v21 = v72[3];
    v22 = v68[3];
    if (v21 < 1)
    {
      v23 = v64;
      if (v22 >= 1)
      {
        if (v64[3] > 0)
        {
          v6 = CFSTR("homepod.and.homepodmini.fill");
          goto LABEL_57;
        }
        if (v40[3] > 0)
        {
          v6 = CFSTR("hifispeaker.and.homepod.fill");
          goto LABEL_57;
        }
        if ((unint64_t)v22 > 1)
        {
          v6 = CFSTR("homepod.2.fill");
          goto LABEL_57;
        }
LABEL_39:
        v25 = v40[3];
        if (v25 <= 1)
        {
          if (v25 == 1)
            v6 = CFSTR("hifispeaker.fill");
          else
            v6 = CFSTR("appletv.fill");
          if (v25 != 1 && v21 <= 0)
          {
            if (v56[3] <= 0)
            {
              if (v52[3] <= 0)
              {
                if (v48[3] <= 0)
                {
                  if (v44[3] <= 0)
                  {
                    if (v60[3] <= 1)
                      v6 = CFSTR("speaker.wave.2.fill");
                    else
                      v6 = CFSTR("person.2.fill");
                  }
                  else
                  {
                    v6 = CFSTR("display");
                  }
                }
                else
                {
                  v6 = CFSTR("tv");
                }
              }
              else
              {
                v6 = CFSTR("mediastick");
              }
            }
            else
            {
              v6 = CFSTR("tv.and.mediabox");
            }
          }
        }
        else
        {
          v6 = CFSTR("hifispeaker.2.fill");
        }
        goto LABEL_57;
      }
    }
    else
    {
      if (v22 > 0)
      {
        v6 = CFSTR("homepod.and.appletv.fill");
LABEL_57:

        _Block_object_dispose(&v39, 8);
        _Block_object_dispose(&v43, 8);
        _Block_object_dispose(&v47, 8);
        _Block_object_dispose(&v51, 8);
        _Block_object_dispose(&v55, 8);
        _Block_object_dispose(&v59, 8);
        _Block_object_dispose(&v63, 8);
        _Block_object_dispose(&v67, 8);
        _Block_object_dispose(&v71, 8);
        goto LABEL_58;
      }
      v23 = v64;
      if (v64[3] > 0)
      {
        v6 = CFSTR("homepodmini.and.appletv.fill");
        goto LABEL_57;
      }
      if (v40[3] > 0)
      {
        v6 = CFSTR("hifispeaker.and.appletv");
        goto LABEL_57;
      }
    }
    v24 = v23[3];
    if (v24 >= 1)
    {
      if (v40[3] > 0)
      {
        v6 = CFSTR("hifispeaker.and.homepodmini.fill");
        goto LABEL_57;
      }
      if ((unint64_t)v24 > 1)
      {
        v6 = CFSTR("homepodmini.2.fill");
        goto LABEL_57;
      }
    }
    goto LABEL_39;
  }
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "symbolNameForOutputDevice:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_58:
  return v6;
}

void __61__MRAVOutputDeviceSymbolProvider_symbolNameForOutputDevices___block_invoke(_QWORD *a1, void *a2, int a3, int a4, void *a5)
{
  id v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v9 = a5;
  switch(a4)
  {
    case 2:
      v10 = a1[7];
      goto LABEL_14;
    case 11:
      v10 = a1[10];
      goto LABEL_14;
    case 12:
      if (objc_msgSend(v11, "isB520Device"))
        v10 = a1[4];
      else
        v10 = a1[5];
      goto LABEL_14;
    case 13:
      v10 = a1[6];
      goto LABEL_14;
    case 16:
      v10 = a1[8];
      goto LABEL_14;
    case 17:
      v10 = a1[9];
      goto LABEL_14;
    case 18:
      v10 = a1[11];
      goto LABEL_14;
    default:
      if (a3 != 1 || (objc_msgSend(v11, "producesLowFidelityAudio") & 1) != 0)
        goto LABEL_15;
      v10 = a1[12];
LABEL_14:
      ++*(_QWORD *)(*(_QWORD *)(v10 + 8) + 24);
LABEL_15:

      return;
  }
}

+ (id)symbolNameForClusterOutputDevice:(id)a3
{
  id v4;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFString *v8;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "clusterType") == 2)
  {
    v5 = objc_msgSend(v4, "isHomeTheaterB520Device");
    v6 = CFSTR("homepod.and.appletv.fill");
    v7 = CFSTR("homepodmini.and.appletv.fill");
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "clusterType") == 1)
  {
    v5 = objc_msgSend(v4, "isB520Device");
    v6 = CFSTR("homepod.2.fill");
    v7 = CFSTR("homepodmini.2.fill");
LABEL_5:
    if (v5)
      v8 = (__CFString *)v7;
    else
      v8 = (__CFString *)v6;
    goto LABEL_8;
  }
  objc_msgSend(v4, "clusterCompositionOutputDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    objc_msgSend(v4, "clusterCompositionOutputDevices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "symbolNameForOutputDevices:", v12);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("speaker.wave.2.fill");
  }
LABEL_8:

  return v8;
}

+ (id)symbolNameForModelID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "_symbolNameMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithDeviceModelCode:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D3A838];
      objc_msgSend(v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(v8, "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:", v9, 1, 1, &v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v16;

      objc_msgSend(v10, "name");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v11)
      {
        _MRLogForCategory(0);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v18 = v4;
          v19 = 2114;
          v20 = v7;
          v21 = 2114;
          v22 = v11;
          _os_log_error_impl(&dword_193827000, v14, OS_LOG_TYPE_ERROR, "Failed to find product symbol with model: %{public}@ uti: %{public}@ error: %{public}@", buf, 0x20u);
        }
      }
      else
      {
        if (!v12)
        {
LABEL_10:
          v6 = v13;

          goto LABEL_11;
        }
        objc_msgSend(a1, "_symbolNameMap");
        v14 = objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v14, "setObject:forKey:", v13, v4);
      }

      goto LABEL_10;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_11:

  return v6;
}

+ (id)symbolNameForProductIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    return 0;
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_symbolNameMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(","));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v11 || !v12)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithBluetoothProductID:vendorID:", objc_msgSend(v12, "intValue"), (unsigned __int16)objc_msgSend(v11, "intValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0D3A838];
    objc_msgSend(v14, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v15, "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:", v16, 1, 1, &v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v23;

    objc_msgSend(v17, "name");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v18)
    {
      _MRLogForCategory(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v25 = v7;
        v26 = 2114;
        v27 = v14;
        v28 = 2114;
        v29 = v18;
        _os_log_error_impl(&dword_193827000, v21, OS_LOG_TYPE_ERROR, "Failed to find bluetooth symbol with model: %{public}@ uti: %{public}@ error: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      if (!v19)
      {
LABEL_12:
        v9 = v20;

LABEL_13:
        goto LABEL_14;
      }
      objc_msgSend(a1, "_symbolNameMap");
      v21 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v21, "setObject:forKey:", v20, v7);
    }

    goto LABEL_12;
  }
LABEL_14:

  return v9;
}

+ (id)_symbolNameMap
{
  if (_symbolNameMap_onceToken != -1)
    dispatch_once(&_symbolNameMap_onceToken, &__block_literal_global_108);
  return (id)_symbolNameMap___symbolNameMap;
}

void __48__MRAVOutputDeviceSymbolProvider__symbolNameMap__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_symbolNameMap___symbolNameMap;
  _symbolNameMap___symbolNameMap = v0;

}

+ (id)_currentDeviceRoutingSymbolName
{
  if (_currentDeviceRoutingSymbolName_onceToken != -1)
    dispatch_once(&_currentDeviceRoutingSymbolName_onceToken, &__block_literal_global_60_0);
  return (id)_currentDeviceRoutingSymbolName___symbolName;
}

void __65__MRAVOutputDeviceSymbolProvider__currentDeviceRoutingSymbolName__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeOfCurrentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0D3A838], "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:", v1, 1, 1, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v3)
  {
    _MRLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__MRAVOutputDeviceSymbolProvider__currentDeviceRoutingSymbolName__block_invoke_cold_1((uint64_t)v1, (uint64_t)v3, v4);

  }
  objc_msgSend(v2, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_currentDeviceRoutingSymbolName___symbolName;
  _currentDeviceRoutingSymbolName___symbolName = v5;

}

void __65__MRAVOutputDeviceSymbolProvider__currentDeviceRoutingSymbolName__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_193827000, log, OS_LOG_TYPE_ERROR, "Failed to find symbol with uti: %{public}@ error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
