@implementation NSArray(ZhuGe)

+ (id)graphicInfoArrayFromArray:()ZhuGe
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[6];
  _QWORD v31[6];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v3)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sppci_model"));
            v17 = objc_claimAutoreleasedReturnValue();
            if (!v17)
            {
              ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSArray+ZhuGe.m", "+[NSArray(ZhuGe) graphicInfoArrayFromArray:]", 33, CFSTR("One graphic in graphics array does not contain \"sppci_model\"), v18, v19, v20, v25);

              v23 = 0;
              goto LABEL_16;
            }
            v21 = (void *)v17;
            v30[0] = CFSTR("Chipset Model");
            v30[1] = CFSTR("Device ID");
            v31[0] = v17;
            v31[1] = &stru_2507BF7D0;
            v30[2] = CFSTR("VRAM Size");
            v30[3] = CFSTR("ROM Revision");
            v31[2] = &stru_2507BF7D0;
            v31[3] = &stru_2507BF7D0;
            v30[4] = CFSTR("VBIOS Version");
            v30[5] = CFSTR("Option ROM Version");
            v31[4] = &stru_2507BF7D0;
            v31[5] = &stru_2507BF7D0;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 6);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v22);

          }
          else
          {
            ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSArray+ZhuGe.m", "+[NSArray(ZhuGe) graphicInfoArrayFromArray:]", 27, CFSTR("One graphic in graphics array is not a dictionary, ignore it."), v14, v15, v16, v25);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        if (v10)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSArray+ZhuGe.m", "+[NSArray(ZhuGe) graphicInfoArrayFromArray:]", 20, CFSTR("graphicsArray pointer is nil!"), v4, v5, v6, v25);
    v23 = 0;
  }
LABEL_16:

  return v23;
}

+ (id)arrayFromShellCommandString:()ZhuGe
{
  id v3;
  id v4;
  const char *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  const char *v12;
  char v13;
  int64_t v14;
  int v15;
  int v17;
  BOOL v18;
  int64_t v19;
  id v20;
  void *v21;
  _BYTE *v22;
  int v23;
  void *v24;
  id v25;
  id v27;
  const char *v28;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!v3)
  {
    v25 = 0;
    goto LABEL_45;
  }
  v27 = v3;
  v5 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
  v6 = strlen(v5);
  if (v6 < 1)
  {
LABEL_42:
    v25 = v4;
    goto LABEL_43;
  }
  v10 = 0;
  v11 = (unint64_t)&v5[v6];
  v28 = &v5[v6];
  while (*v5 == 32)
  {
    v12 = v5;
LABEL_41:
    v5 = v12 + 1;
    if ((unint64_t)(v12 + 1) >= v11)
      goto LABEL_42;
  }
  if ((unint64_t)v5 >= v11)
  {
    v13 = 0;
    v12 = v5;
  }
  else
  {
    v13 = 0;
    v14 = v28 - v5;
    v12 = v5;
    do
    {
      v15 = *(unsigned __int8 *)v12;
      if (v15 == 32 && v10 == 0)
        goto LABEL_26;
      if (v15 == 39 || v15 == 34)
      {
        if (v15 == v10)
          v17 = 0;
        else
          v17 = v10;
        v18 = v10 == 0;
        if ((_BYTE)v10)
          v10 = v17;
        else
          v10 = *(unsigned __int8 *)v12;
        if (v18)
          v13 = 1;
      }
      ++v12;
      --v14;
    }
    while (v14);
    v12 = v28;
  }
  if (!(_BYTE)v10)
  {
LABEL_26:
    v19 = v12 - v5;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v12 - v5 + 1);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = (void *)objc_msgSend(v20, "mutableBytes");

    bzero(v21, v12 - v5 + 1);
    if ((v13 & 1) != 0)
    {
      if (v5 < v12)
      {
        v10 = 0;
        v22 = v21;
        while (1)
        {
          v23 = *(unsigned __int8 *)v5;
          if (v23 != 39 && v23 != 34)
            break;
          if ((_BYTE)v10)
          {
            if (v23 != v10)
              break;
            v10 = 0;
          }
          else
          {
            v10 = *(unsigned __int8 *)v5;
          }
LABEL_36:
          ++v5;
          if (!--v19)
            goto LABEL_40;
        }
        *v22++ = v23;
        goto LABEL_36;
      }
    }
    else
    {
      memcpy(v21, v5, v12 - v5);
    }
    v10 = 0;
LABEL_40:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v24);

    goto LABEL_41;
  }
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSArray+ZhuGe.m", "+[NSArray(ZhuGe) arrayFromShellCommandString:]", 98, CFSTR("Quotation \"%c\" is not paired in command \"%@\"!"), v7, v8, v9, (char)v10);
  v25 = 0;
LABEL_43:
  v3 = v27;
LABEL_45:

  return v25;
}

@end
