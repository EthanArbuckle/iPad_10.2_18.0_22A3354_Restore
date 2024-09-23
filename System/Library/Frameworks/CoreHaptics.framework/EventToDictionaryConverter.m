@implementation EventToDictionaryConverter

+ (id)eventTypeToNSString:(unint64_t)a3
{
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[33];
  _QWORD v43[35];

  v43[33] = *MEMORY[0x1E0C80C00];
  if ((v4 & 1) == 0
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 32514);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v41;
    v43[0] = CFSTR("AudioSineTransient");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 32513);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v40;
    v43[1] = CFSTR("AudioSine");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 32611);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v39;
    v43[2] = CFSTR("HapticSineTransient");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 32610);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v38;
    v43[3] = CFSTR("HapticSine");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 15713);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v42[4] = v37;
    v43[4] = CFSTR("HapticSineLow");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 15969);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42[5] = v36;
    v43[5] = CFSTR("HapticSineLowMid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 16225);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v42[6] = v35;
    v43[6] = CFSTR("HapticSineMid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 16481);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v42[7] = v34;
    v43[7] = CFSTR("HapticSineMidHigh");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 16737);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v42[8] = v33;
    v43[8] = CFSTR("HapticSineHigh");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 8021);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v42[9] = v32;
    v43[9] = CFSTR("HapticMicroTap2");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 11093);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v42[10] = v31;
    v43[10] = CFSTR("HapticMicroTap3");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 14165);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v42[11] = v30;
    v43[11] = CFSTR("HapticMicroTap4");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 17237);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42[12] = v29;
    v43[12] = CFSTR("HapticMicroTap5");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 20309);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v42[13] = v28;
    v43[13] = CFSTR("HapticMicroTap6");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 23381);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42[14] = v27;
    v43[14] = CFSTR("HapticMicroTap7");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 26453);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v42[15] = v26;
    v43[15] = CFSTR("HapticMicroTap8");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 29525);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v42[16] = v25;
    v43[16] = CFSTR("HapticMicroTap9");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 8022);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42[17] = v24;
    v43[17] = CFSTR("HapticMiniTap2");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 11094);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42[18] = v23;
    v43[18] = CFSTR("HapticMiniTap3");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 14166);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v42[19] = v22;
    v43[19] = CFSTR("HapticMiniTap4");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 17238);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42[20] = v21;
    v43[20] = CFSTR("HapticMiniTap5");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 20310);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42[21] = v20;
    v43[21] = CFSTR("HapticMiniTap6");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 23382);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42[22] = v19;
    v43[22] = CFSTR("HapticMiniTap7");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 26454);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42[23] = v18;
    v43[23] = CFSTR("HapticMiniTap8");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 29526);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v42[24] = v17;
    v43[24] = CFSTR("HapticMiniTap9");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 8023);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v42[25] = v16;
    v43[25] = CFSTR("HapticFullTap2");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 11095);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v42[26] = v9;
    v43[26] = CFSTR("HapticFullTap3");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 14167);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42[27] = v10;
    v43[27] = CFSTR("HapticFullTap4");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 17239);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42[28] = v11;
    v43[28] = CFSTR("HapticFullTap5");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 20311);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v42[29] = v12;
    v43[29] = CFSTR("HapticFullTap6");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 23383);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v42[30] = v13;
    v43[30] = CFSTR("HapticFullTap7");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 26455);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42[31] = v14;
    v43[31] = CFSTR("HapticFullTap8");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 29527);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42[32] = v15;
    v43[32] = CFSTR("HapticFullTap9");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 33);
    +[EventToDictionaryConverter eventTypeToNSString:]::eventDict = objc_claimAutoreleasedReturnValue();

  }
  v5 = (void *)+[EventToDictionaryConverter eventTypeToNSString:]::eventDict;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)paramTypeToNSString:(unint64_t)a3
{
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[11];
  _QWORD v22[13];

  v22[11] = *MEMORY[0x1E0C80C00];
  if ((v4 & 1) == 0
  {
    v17 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 1000);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v20;
    v22[0] = CFSTR("AudioVolume");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 1001);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v19;
    v22[1] = CFSTR("AudioTransposition");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 1010);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v18;
    v22[2] = CFSTR("AudioAttackTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 1011);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v9;
    v22[3] = CFSTR("AudioDecayTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 1012);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[4] = v10;
    v22[4] = CFSTR("AudioReleaseTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 1013);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[5] = v11;
    v22[5] = CFSTR("AudioLPFilterCutoff");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 2000);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[6] = v12;
    v22[6] = CFSTR("HapticVolume");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 2001);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[7] = v13;
    v22[7] = CFSTR("HapticTransposition");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 2010);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[8] = v14;
    v22[8] = CFSTR("HapticAttackTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 2011);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[9] = v15;
    v22[9] = CFSTR("HapticDecayTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 2012);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[10] = v16;
    v22[10] = CFSTR("HapticReleaseTime");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 11);
    +[EventToDictionaryConverter paramTypeToNSString:]::paramDict = objc_claimAutoreleasedReturnValue();

    a3 = v17;
  }
  v5 = (void *)+[EventToDictionaryConverter paramTypeToNSString:]::paramDict;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)convertEvents:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  unsigned int i;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  double v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  int v31;
  NSObject *v32;
  id v33;
  void *v34;
  id v35;
  int v36;
  void *v37;
  id v39;
  id v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v39;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v3)
  {
    v43 = *(_QWORD *)v45;
    do
    {
      v4 = 0;
      v42 = v3;
      do
      {
        if (*(_QWORD *)v45 != v43)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v4);
        if (objc_msgSend(v5, "eventCategory") == 1)
        {
          +[EventToDictionaryConverter paramTypeToNSString:](EventToDictionaryConverter, "paramTypeToNSString:", objc_msgSend(v5, "paramType"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
          {
            v7 = (void *)MEMORY[0x1E0C99D80];
            v8 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v5, "value");
            objc_msgSend(v8, "numberWithFloat:");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v5, "time");
            *(float *)&v11 = v11;
            objc_msgSend(v10, "numberWithFloat:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v6, CFSTR("Type"), v9, CFSTR("Value"), v12, CFSTR("Time"), 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v13, CFSTR("Param"));
            v14 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "addObject:", v14);
            goto LABEL_38;
          }
          if (kHAPIScope)
          {
            v28 = *(id *)kHAPIScope;
            if (v28)
              goto LABEL_28;
            goto LABEL_39;
          }
          v29 = (void *)MEMORY[0x1E0C81028];
          v30 = MEMORY[0x1E0C81028];
          v28 = v29;
LABEL_28:
          v14 = v28;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v31 = objc_msgSend(v5, "paramType");
            *(_DWORD *)buf = 136315906;
            v49 = "EventToDictionaryConverter.mm";
            v50 = 1024;
            v51 = 111;
            v52 = 2080;
            v53 = "+[EventToDictionaryConverter convertEvents:]";
            v54 = 1024;
            v55 = v31;
            v32 = v14;
LABEL_36:
            _os_log_impl(&dword_1B573F000, v32, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unknown param type: %u", buf, 0x22u);
            goto LABEL_37;
          }
          goto LABEL_37;
        }
        if (objc_msgSend(v5, "eventCategory"))
          goto LABEL_40;
        +[EventToDictionaryConverter eventTypeToNSString:](EventToDictionaryConverter, "eventTypeToNSString:", objc_msgSend(v5, "eventType"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v15 = (void *)MEMORY[0x1E0C99E08];
          v16 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "time");
          *(float *)&v17 = v17;
          objc_msgSend(v16, "numberWithFloat:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v6, CFSTR("Type"), v18, CFSTR("Time"), 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          for (i = 0; ; i = v20 + 1)
          {
            v20 = i;
            if (objc_msgSend(v5, "fixedParamCount") <= i)
            {
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v13, CFSTR("Event"));
              v14 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "addObject:", v14);
              goto LABEL_38;
            }
            v21 = objc_msgSend(v5, "fixedParams");
            v22 = (_QWORD *)(v21 + 16 * i);
            +[EventToDictionaryConverter paramTypeToNSString:](EventToDictionaryConverter, "paramTypeToNSString:", *v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
              break;
            if (!kHAPIScope)
            {
              v25 = MEMORY[0x1E0C81028];
              v26 = MEMORY[0x1E0C81028];
LABEL_21:
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                v27 = *v22;
                *(_DWORD *)buf = 136315906;
                v49 = "EventToDictionaryConverter.mm";
                v50 = 1024;
                v51 = 128;
                v52 = 2080;
                v53 = "+[EventToDictionaryConverter convertEvents:]";
                v54 = 1024;
                v55 = v27;
                _os_log_impl(&dword_1B573F000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unknown event param type: %u", buf, 0x22u);
              }
LABEL_15:

              goto LABEL_16;
            }
            v25 = *(id *)kHAPIScope;
            if (v25)
              goto LABEL_21;
LABEL_16:

          }
          LODWORD(v24) = *(_DWORD *)(v21 + 16 * v20 + 8);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
          v25 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, v23);
          goto LABEL_15;
        }
        if (!kHAPIScope)
        {
          v34 = (void *)MEMORY[0x1E0C81028];
          v35 = MEMORY[0x1E0C81028];
          v33 = v34;
LABEL_34:
          v14 = v33;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v36 = objc_msgSend(v5, "eventType");
            *(_DWORD *)buf = 136315906;
            v49 = "EventToDictionaryConverter.mm";
            v50 = 1024;
            v51 = 134;
            v52 = 2080;
            v53 = "+[EventToDictionaryConverter convertEvents:]";
            v54 = 1024;
            v55 = v36;
            v32 = v14;
            goto LABEL_36;
          }
LABEL_37:
          v13 = v14;
LABEL_38:

          goto LABEL_39;
        }
        v33 = *(id *)kHAPIScope;
        if (v33)
          goto LABEL_34;
LABEL_39:

        v3 = v42;
LABEL_40:
        ++v4;
      }
      while (v4 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v3);
  }

  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v40, CFSTR("Pattern"), 0);
  return v37;
}

@end
