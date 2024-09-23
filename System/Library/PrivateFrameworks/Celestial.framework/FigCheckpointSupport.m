@implementation FigCheckpointSupport

+ (id)makeDictionary
{
  void *ModelSpecificPropertyList;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
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
  int v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  int v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  int v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  int v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  int v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t i;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  id obj;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  ModelSpecificPropertyList = (void *)FigCreateModelSpecificPropertyList();
  obj = (id)FigCreateModelSpecificPropertyList();
  if (!ModelSpecificPropertyList)
  {
    v3 = 0;
    goto LABEL_94;
  }
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)objc_msgSend(ModelSpecificPropertyList, "objectForKeyedSubscript:", CFSTR("VideoCodecs"));
  v75 = ModelSpecificPropertyList;
  v5 = objc_msgSend(ModelSpecificPropertyList, "objectForKeyedSubscript:", CFSTR("AudioCodecs"));
  v6 = (void *)MGCopyAnswer();
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "intValue");

  }
  else
  {
    v8 = -1;
  }
  v9 = (void *)MGCopyAnswer();
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "intValue");

  }
  v11 = (void *)MGCopyAnswer();
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, "intValue");

  }
  v13 = (void *)MGCopyAnswer();
  if (v13)
  {
    v14 = v13;
    objc_msgSend(v13, "intValue");

  }
  v15 = (void *)MGCopyAnswer();
  if (v15)
  {
    v16 = v15;
    objc_msgSend(v15, "intValue");

  }
  v17 = (void *)MGCopyAnswer();
  if (v17)
  {
    v18 = v17;
    v19 = objc_msgSend(v17, "intValue");

    v20 = v19 > 41;
  }
  else
  {
    v20 = 0;
  }
  v21 = (void *)MGCopyAnswer();
  if (v21)
  {
    v22 = v21;
    v23 = objc_msgSend(v21, "intValue");

    v24 = v23 > 49;
  }
  else
  {
    v24 = 0;
  }
  v25 = (void *)MGCopyAnswer();
  if (v25)
  {
    v26 = v25;
    v27 = objc_msgSend(v25, "intValue");

    v28 = v27 > 50;
  }
  else
  {
    v28 = 0;
  }
  v29 = (void *)MGCopyAnswer();
  if (v29)
  {
    v30 = v29;
    v31 = objc_msgSend(v29, "intValue");

    v32 = v31 > 51;
  }
  else
  {
    v32 = 0;
  }
  v33 = (void *)MGCopyAnswer();
  if (v33)
  {
    v34 = v33;
    v35 = objc_msgSend(v33, "intValue");

    v36 = v35 != 0;
  }
  else
  {
    v36 = 0;
  }
  v37 = (void *)MGCopyAnswer();
  if (v37)
  {
    v38 = v37;
    objc_msgSend(v37, "intValue");

  }
  if (v8 != 1)
  {
    v39 = (void *)MGCopyAnswer();
    if (v39)
    {
      v40 = v39;
      objc_msgSend(v39, "intValue");

    }
  }
  v41 = (void *)MGCopyAnswer();
  if (v41)
  {
    v42 = v41;
    objc_msgSend(v41, "intValue");

  }
  v43 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v43)
  {
    if (v32)
    {
      v44 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("H.264_UHDVideo3"));
      if (v44)
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v44, CFSTR("H.264"));
      v45 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("H.264M_UHDVideo3"));
      if (v45)
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v45, CFSTR("H.264M"));
      v46 = CFSTR("H.264H_UHDVideo3");
    }
    else if (v28)
    {
      v47 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("H.264_UHDVideo2"));
      if (v47)
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v47, CFSTR("H.264"));
      v48 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("H.264M_UHDVideo2"));
      if (v48)
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v48, CFSTR("H.264M"));
      v46 = CFSTR("H.264H_UHDVideo2");
    }
    else if (v24)
    {
      v49 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("H.264_UHDVideo"));
      if (v49)
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v49, CFSTR("H.264"));
      v50 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("H.264M_UHDVideo"));
      if (v50)
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v50, CFSTR("H.264M"));
      v46 = CFSTR("H.264H_UHDVideo");
    }
    else
    {
      if (!v20)
      {
LABEL_63:
        v54 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("H.263"));
        if (v54)
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v54, CFSTR("H.263"));
        v55 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MPEG4"));
        if (v55)
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v55, CFSTR("MPEG4"));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("VideoCodecs"));
        goto LABEL_68;
      }
      v51 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("H.264_HDVideo42"));
      if (v51)
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v51, CFSTR("H.264"));
      v52 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("H.264M_HDVideo42"));
      if (v52)
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v52, CFSTR("H.264M"));
      v46 = CFSTR("H.264H_HDVideo42");
    }
    v53 = objc_msgSend(v4, "objectForKeyedSubscript:", v46);
    if (v53)
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v53, CFSTR("H.264H"));
    goto LABEL_63;
  }
LABEL_68:

  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v5);
  v57 = v56;
  if (v5)
  {
    if (!v36)
    {
      objc_msgSend(v56, "removeObjectForKey:", CFSTR("AC3"));
      objc_msgSend(v57, "removeObjectForKey:", CFSTR("EnhancedAC3"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("AudioCodecs"));
  }

  if (obj)
  {
    if (v3)
    {
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
      if (v77)
      {
        v76 = *(_QWORD *)v80;
        do
        {
          for (i = 0; i != v77; ++i)
          {
            if (*(_QWORD *)v80 != v76)
              objc_enumerationMutation(obj);
            v59 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
            objc_msgSend(v59, "stringByAppendingFormat:", CFSTR(".plist"));
            v60 = (void *)FigCreateModelSpecificPropertyList();
            v61 = (void *)objc_msgSend(obj, "objectForKeyedSubscript:", v59);
            v62 = (void *)objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("VideoCodecs"));
            if (v62)
            {
              v63 = v62;
              if (objc_msgSend(v62, "count"))
              {
                v64 = 0;
                do
                {
                  v65 = objc_msgSend(v63, "objectAtIndexedSubscript:", v64);
                  v66 = objc_msgSend((id)objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("VideoCodecs")), "objectForKeyedSubscript:", v65);
                  v67 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VideoCodecs"));
                  if (v66)
                    objc_msgSend(v67, "setObject:forKey:", v66, v65);
                  ++v64;
                }
                while (v64 < objc_msgSend(v63, "count"));
              }
            }
            v68 = (void *)objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("AudioCodecs"));
            if (v68)
            {
              v69 = v68;
              if (objc_msgSend(v68, "count"))
              {
                v70 = 0;
                do
                {
                  v71 = objc_msgSend(v69, "objectAtIndexedSubscript:", v70);
                  v72 = objc_msgSend((id)objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("AudioCodecs")), "objectForKeyedSubscript:", v71);
                  v73 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AudioCodecs"));
                  if (v72)
                    objc_msgSend(v73, "setObject:forKey:", v72, v71);
                  ++v70;
                }
                while (v70 < objc_msgSend(v69, "count"));
              }
            }

          }
          v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
        }
        while (v77);
      }
    }
  }
  ModelSpecificPropertyList = v75;
LABEL_94:

  return v3;
}

@end
