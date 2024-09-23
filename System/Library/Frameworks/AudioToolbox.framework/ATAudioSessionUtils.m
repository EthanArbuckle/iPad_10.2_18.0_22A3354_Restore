@implementation ATAudioSessionUtils

+ (unint64_t)getCategoryOptionFromPropertyID:(unsigned int)a3
{
  unint64_t result;
  NSObject *v4;
  id v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((int)a3 > 1668509802)
  {
    if (a3 == 1668509803)
      return 8;
    if (a3 == 1685414763)
      return 2;
  }
  else
  {
    if (a3 == 1667394677)
      return 4;
    if (a3 == 1668114808)
      return 1;
  }
  if (kAudioSessionClientLogSubsystem)
  {
    result = (unint64_t)*(id *)kAudioSessionClientLogSubsystem;
    v4 = result;
    if (!result)
      return result;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "ATAudioSessionUtils.mm";
    v8 = 1024;
    v9 = 39;
    _os_log_impl(&dword_1A0F4D000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid Category option requested", (uint8_t *)&v6, 0x12u);
  }

  return 0;
}

+ (id)getAVASProperty:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "KVOProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getMappedObjectOf:inside:ofType:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unsigned)getAudioSessionProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v4 = a3;
  objc_msgSend(a1, "KVOProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getMappedObjectOf:inside:ofType:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  return v7;
}

+ (id)getAVASCategory:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "categories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getMappedObjectOf:inside:ofType:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unsigned)getAudioSessionCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v4 = a3;
  objc_msgSend(a1, "categories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getMappedObjectOf:inside:ofType:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  return v7;
}

+ (id)getAVASMode:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getMappedObjectOf:inside:ofType:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unsigned)getAudioSessionMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v4 = a3;
  objc_msgSend(a1, "modes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getMappedObjectOf:inside:ofType:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  return v7;
}

+ (__CFString)getAudioSessionPortType:(id)a3 forInput:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;

  v4 = a4;
  v6 = (__CFString *)a3;
  if (v4)
    objc_msgSend(a1, "inputPortTypes");
  else
    objc_msgSend(a1, "outputPortTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getMappedObjectOf:inside:ofType:", v6, v7, 0);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v8;
  else
    v9 = v6;

  return v9;
}

+ (id)getMappedObjectOf:(id)a3 inside:(id)a4 ofType:(int)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF contains [c] %@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && objc_msgSend(v10, "count"))
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", a5);
    v13 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (kAudioSessionClientLogSubsystem)
    {
      v13 = *(id *)kAudioSessionClientLogSubsystem;
      if (!v13)
        goto LABEL_11;
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "ATAudioSessionUtils.mm";
      v18 = 1024;
      v19 = 111;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Invalid item requested %@", buf, 0x1Cu);
    }

    v13 = 0;
  }
LABEL_11:

  return v13;
}

+ (id)KVOProperties
{
  return &unk_1E4527638;
}

+ (id)categories
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[9];

  v23[8] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFEFB0];
  v22[0] = &unk_1E4526D40;
  v22[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v3;
  v4 = *MEMORY[0x1E0CFEFF0];
  v21[0] = &unk_1E4526D58;
  v21[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v5;
  v6 = *MEMORY[0x1E0CFEFC8];
  v20[0] = &unk_1E4526D70;
  v20[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v7;
  v8 = *MEMORY[0x1E0CFEFD8];
  v19[0] = &unk_1E4526D88;
  v19[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v9;
  v10 = *MEMORY[0x1E0CFEFC0];
  v18[0] = &unk_1E4526DA0;
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v11;
  v23[5] = &unk_1E4527650;
  v17[0] = &unk_1E4526DD0;
  v17[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v12;
  v16[0] = &unk_1E4526DE8;
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)modes
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[30];

  v31[28] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFF078];
  v30[0] = &unk_1E4526E00;
  v30[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v3;
  v4 = *MEMORY[0x1E0CFF0E0];
  v29[0] = &unk_1E4526E18;
  v29[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v5;
  v6 = *MEMORY[0x1E0CFF0D8];
  v28[0] = &unk_1E4526E30;
  v28[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v7;
  v8 = *MEMORY[0x1E0CFF098];
  v27[0] = &unk_1E4526E48;
  v27[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v9;
  v10 = *MEMORY[0x1E0CFF088];
  v26[0] = &unk_1E4526E60;
  v26[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v11;
  v12 = *MEMORY[0x1E0CFF0D0];
  v25[0] = &unk_1E4526E78;
  v25[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v13;
  v31[6] = &unk_1E4527668;
  v14 = *MEMORY[0x1E0CFF0A0];
  v24[0] = &unk_1E4526EA8;
  v24[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v15;
  v16 = *MEMORY[0x1E0CFF0C8];
  v23[0] = &unk_1E4526EC0;
  v23[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v17;
  v18 = *MEMORY[0x1E0CFF0F8];
  v22[0] = &unk_1E4526ED8;
  v22[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[9] = v19;
  v31[10] = &unk_1E4527680;
  v31[11] = &unk_1E4527698;
  v31[12] = &unk_1E45276B0;
  v31[13] = &unk_1E45276C8;
  v31[14] = &unk_1E45276E0;
  v31[15] = &unk_1E45276F8;
  v31[16] = &unk_1E4527710;
  v31[17] = &unk_1E4527728;
  v31[18] = &unk_1E4527740;
  v31[19] = &unk_1E4527758;
  v31[20] = &unk_1E4527770;
  v31[21] = &unk_1E4527788;
  v31[22] = &unk_1E45277A0;
  v31[23] = &unk_1E45277B8;
  v31[24] = &unk_1E45277D0;
  v31[25] = &unk_1E45277E8;
  v31[26] = &unk_1E4527800;
  v31[27] = &unk_1E4527818;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)inputPortTypes
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFF168];
  v18[0] = CFSTR("LineIn");
  v18[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  v4 = *MEMORY[0x1E0CFF118];
  v17[0] = CFSTR("MicrophoneBuiltIn");
  v17[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  v6 = *MEMORY[0x1E0CFF160];
  v16[0] = CFSTR("MicrophoneWired");
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  v8 = *MEMORY[0x1E0CFF110];
  v15[0] = CFSTR("MicrophoneBluetooth");
  v15[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v9;
  v10 = *MEMORY[0x1E0CFF178];
  v14[0] = CFSTR("USBInput");
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)outputPortTypes
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[11];

  v31[9] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFF170];
  v30[0] = CFSTR("LineOut");
  v30[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v3;
  v4 = *MEMORY[0x1E0CFF158];
  v29[0] = CFSTR("Headphones");
  v29[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v5;
  v6 = *MEMORY[0x1E0CFF110];
  v28[0] = CFSTR("BluetoothHFPOutput");
  v28[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v7;
  v8 = *MEMORY[0x1E0CFF108];
  v27[0] = CFSTR("BluetoothA2DPOutput");
  v27[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v9;
  v10 = *MEMORY[0x1E0CFF128];
  v26[0] = CFSTR("Receiver");
  v26[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v11;
  v12 = *MEMORY[0x1E0CFF140];
  v25[0] = CFSTR("Speaker");
  v25[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v13;
  v14 = *MEMORY[0x1E0CFF178];
  v24[0] = CFSTR("USBOutput");
  v24[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v15;
  v16 = *MEMORY[0x1E0CFF150];
  v23[0] = CFSTR("HDMIOutput");
  v23[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v17;
  v18 = *MEMORY[0x1E0CFF100];
  v22[0] = CFSTR("AirPlay");
  v22[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)getRouteDescriptionFromAVASRouteDescription:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "inputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getPorts:forInput:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("RouteDetailedDescription_Inputs"));
  objc_msgSend(v4, "outputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getPorts:forInput:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("RouteDetailedDescription_Outputs"));

  return v5;
}

+ (id)getRouteStringFromAVASRouteDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;

  v4 = a3;
  objc_msgSend(v4, "inputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getPorts:forInput:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("RouteDetailedDescription_PortType"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_1E451D688;
  }
  objc_msgSend(v4, "outputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getPorts:forInput:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("RouteDetailedDescription_PortType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v8, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@+%@"), v8, v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = v12;
    }
    v14 = v13;

    v8 = v14;
  }

  return v8;
}

+ (id)getPorts:(id)a3 forInput:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(a1, "getPort:forInput:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), v4, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v7;
}

+ (id)getPort:(id)a3 forInput:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v4 = a4;
  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9 = CFSTR("RouteDetailedDescription_PortType");
  objc_msgSend(v5, "portType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = +[ATAudioSessionUtils getAudioSessionPortType:forInput:](ATAudioSessionUtils, "getAudioSessionPortType:forInput:", v6, v4);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
