@implementation KmlDeviceConfigurationData

- (uint64_t)initWithData:(uint64_t)result
{
  if (result)
    return -[KmlDeviceConfigurationData initWithData:outerTag:](result, a2, 0);
  return result;
}

- (uint64_t)initWithData:(int)a3 outerTag:
{
  id v5;
  _WORD *v6;
  void *v7;
  void *v8;
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
  uint64_t v20;
  void *v21;
  objc_super v23;

  v5 = a2;
  if (a1)
  {
    v23.receiver = (id)a1;
    v23.super_class = (Class)KmlDeviceConfigurationData;
    v6 = objc_msgSendSuper2(&v23, sel_init);
    a1 = (uint64_t)v6;
    if (v6)
    {
      v6[9] = 1;
      *((_BYTE *)v6 + 29) = 0;
      *((_BYTE *)v6 + 20) = 0;
      v7 = (void *)*((_QWORD *)v6 + 4);
      *((_QWORD *)v6 + 4) = 0;

      v8 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

      v9 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

      v10 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = 0;

      *(_WORD *)(a1 + 21) = 0;
      v11 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = 0;

      v12 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = 0;

      v13 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = 0;

      v14 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = 0;

      v15 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = 0;

      v16 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = 0;

      v17 = *(void **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = 0;

      *(_WORD *)(a1 + 16) = 0;
      *(_DWORD *)(a1 + 23) = 0;
      v18 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = 0;

      v19 = *(void **)(a1 + 152);
      *(_QWORD *)(a1 + 152) = 0;

      *(_WORD *)(a1 + 27) = 0;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v20;

      -[KmlDeviceConfigurationData parseDeviceConfigData:outerTag:](a1, v5, a3);
    }
  }

  return a1;
}

- (void)parseDeviceConfigData:(int)a3 outerTag:
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a1)
  {
    v46 = v5;
    v6 = v5;
    if (a3)
    {
      +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v6);
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (!v8)
        goto LABEL_13;
      v9 = v8;
      v10 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v52 != v10)
            objc_enumerationMutation(v7);
          v12 = *(id **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if (-[KmlTlv tag]((uint64_t)v12) == 32590)
          {
            KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDeviceConfigurationData parseDeviceConfigData:outerTag:]", 251, CFSTR("Found device config data to parse in outer tag"), v13, v14, v15, v16, v44);
            -[KmlTlv value](v12);
            v17 = objc_claimAutoreleasedReturnValue();

            v6 = (id)v17;
            goto LABEL_13;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v9);
LABEL_13:

    }
    v45 = v6;
    +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 8), "removeAllObjects");
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (!v20)
      goto LABEL_52;
    v21 = v20;
    v22 = *(_QWORD *)v48;
LABEL_16:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v48 != v22)
        objc_enumerationMutation(v19);
      v24 = *(id **)(*((_QWORD *)&v47 + 1) + 8 * v23);
      v25 = -[KmlTlv tag]((uint64_t)v24);
      if (v25 > 215)
      {
        if (v25 > 32584)
        {
          switch(v25)
          {
            case 32610:
              -[KmlTlv value](v24);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[KmlDeviceConfigurationData parseReaderBleConfigData:](a1, v38);

              *(_BYTE *)(a1 + 29) = 1;
              objc_msgSend(*(id *)(a1 + 8), "addObject:", v24);
              KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDeviceConfigurationData parseDeviceConfigData:outerTag:]", 314, CFSTR("UWB is disabled for local use, but available for sharing."), v39, v40, v41, v42, (uint64_t)v45);
              break;
            case 32608:
              -[KmlTlv value](v24);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[KmlDeviceConfigurationData parseKeySharingConfigData:]((_BYTE *)a1, v30);
              goto LABEL_50;
            case 32585:
              -[KmlTlv value](v24);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[KmlDeviceConfigurationData parseSupportedRadiosData:]((_BYTE *)a1, v30);
LABEL_50:

              break;
          }
        }
        else
        {
          switch(v25)
          {
            case 216:
              *(_BYTE *)(a1 + 22) = -[KmlTlv valueAsUnsignedShort]((uint64_t)v24);
              -[KmlTlv asData]((uint64_t)v24);
              v33 = objc_claimAutoreleasedReturnValue();
              v27 = *(void **)(a1 + 120);
              *(_QWORD *)(a1 + 120) = v33;
              goto LABEL_43;
            case 217:
              -[KmlTlv value](v24);
              v34 = objc_claimAutoreleasedReturnValue();
              v27 = *(void **)(a1 + 72);
              *(_QWORD *)(a1 + 72) = v34;
              goto LABEL_43;
            case 32554:
              -[KmlTlv value](v24);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[KmlDeviceConfigurationData parseOemSpecificContent:](a1, v28);

              -[KmlTlv asData]((uint64_t)v24);
              v29 = objc_claimAutoreleasedReturnValue();
              v27 = *(void **)(a1 + 128);
              *(_QWORD *)(a1 + 128) = v29;
              goto LABEL_43;
          }
        }
      }
      else if (v25 > 90)
      {
        switch(v25)
        {
          case 91:
            -[KmlTlv asData]((uint64_t)v24);
            v35 = objc_claimAutoreleasedReturnValue();
            v27 = *(void **)(a1 + 144);
            *(_QWORD *)(a1 + 144) = v35;
            goto LABEL_43;
          case 96:
            -[KmlTlv asData]((uint64_t)v24);
            v36 = objc_claimAutoreleasedReturnValue();
            v37 = *(void **)(a1 + 112);
            *(_QWORD *)(a1 + 112) = v36;

            -[KmlDeviceConfigurationData parseSharingInAChainDeviceConfigMailboxSettingData](a1);
            goto LABEL_44;
          case 215:
            *(_BYTE *)(a1 + 21) = -[KmlTlv valueAsUnsignedShort]((uint64_t)v24) == 1;
LABEL_44:
            objc_msgSend(*(id *)(a1 + 8), "addObject:", v24, v45);
            break;
        }
      }
      else
      {
        switch(v25)
        {
          case 'J':
            -[KmlTlv value](v24);
            v31 = objc_claimAutoreleasedReturnValue();
            v27 = *(void **)(a1 + 80);
            *(_QWORD *)(a1 + 80) = v31;
            goto LABEL_43;
          case 'K':
            -[KmlTlv value](v24);
            v32 = objc_claimAutoreleasedReturnValue();
            v27 = *(void **)(a1 + 88);
            *(_QWORD *)(a1 + 88) = v32;
            goto LABEL_43;
          case 'T':
            -[KmlTlv asData]((uint64_t)v24);
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = *(void **)(a1 + 152);
            *(_QWORD *)(a1 + 152) = v26;
LABEL_43:

            goto LABEL_44;
        }
      }
      if (v21 == ++v23)
      {
        v43 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        v21 = v43;
        if (!v43)
        {
LABEL_52:

          v5 = v46;
          break;
        }
        goto LABEL_16;
      }
    }
  }

}

- (uint64_t)isFriendImmoTokenOrSlotOnline
{
  unsigned int v1;
  BOOL v2;
  unsigned int v3;

  if (result)
  {
    v1 = *(unsigned __int8 *)(result + 23);
    v2 = v1 > 5;
    v3 = (0x3Au >> v1) & 1;
    if (v2)
      return 0;
    else
      return v3;
  }
  return result;
}

- (id)readerSupportedTransports
{
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (*(_BYTE *)(a1 + 19))
      objc_msgSend(v2, "addObject:", &unk_24C32F4F0);
    if (*(_BYTE *)(a1 + 18))
      objc_msgSend(v3, "addObject:", &unk_24C32F508);
    if (!objc_msgSend(v3, "count"))
      objc_msgSend(v3, "addObject:", &unk_24C32F520);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)parseSupportedRadiosData:(_BYTE *)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  id *v9;
  int v10;
  void *v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return;
  a1[18] = 0;
  +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v4)
    goto LABEL_21;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v3);
      v9 = *(id **)(*((_QWORD *)&v13 + 1) + 8 * i);
      v10 = -[KmlTlv tag]((uint64_t)v9);
      if (v10 <= 32591)
      {
        if (v10 != 24400)
        {
          if (v10 != 24401)
            continue;
LABEL_14:
          v6 = 1;
          a1[19] = 1;
          a1[29] = 0;
          continue;
        }
LABEL_15:
        v6 = 1;
        a1[18] = 1;
        continue;
      }
      switch(v10)
      {
        case 32594:
          -[KmlTlv value](v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[KmlDeviceConfigurationData parseReaderBleConfigData:]((uint64_t)a1, v11);

          v6 = 1;
          break;
        case 32593:
          goto LABEL_14;
        case 32592:
          goto LABEL_15;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v5);
  if ((v6 & 1) != 0)
  {
    v12 = 1;
    goto LABEL_22;
  }
LABEL_21:
  v12 = 0;
  a1[18] = 1;
LABEL_22:
  a1[16] = v12;

}

- (void)parseKeySharingConfigData:(_BYTE *)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _QWORD *v8;
  int v9;
  unsigned int v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    a1[17] = 1;
    +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD **)(*((_QWORD *)&v12 + 1) + 8 * i);
          v9 = -[KmlTlv tag]((uint64_t)v8);
          switch(v9)
          {
            case 218:
              a1[23] = -[KmlTlv valueAsUnsignedShort]((uint64_t)v8);
              break;
            case 219:
              a1[24] = 1;
              break;
            case 220:
              a1[25] = 1;
              break;
            case 221:
              v10 = -[KmlTlv valueAsUnsignedChar](v8);
              if (v10 >= 0x10)
                v11 = 16;
              else
                v11 = v10;
              a1[26] = v11;
              break;
            case 222:
              a1[27] = 1;
              break;
            default:
              if (v9 == 192)
                a1[28] = 1;
              break;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

  }
}

- (void)parseOemSpecificContent:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t i;
  id *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  uint64_t v48;
  uint64_t j;
  id *v50;
  void *v51;
  int v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  void *v84;
  void *v85;
  char v86;
  void *v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v78 = a1;
  if (!a1)
    goto LABEL_50;
  +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("AAPL"), "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("DFLT"), "dataUsingEncoding:", 4);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDeviceConfigurationData parseOemSpecificContent:]", 496, CFSTR("Looking for %@, or back up %@"), v6, v7, v8, v9, (uint64_t)v5);
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
  if (!v11)
  {
    v82 = 0;
    v65 = v10;
LABEL_48:

    goto LABEL_49;
  }
  v12 = v11;
  v77 = v3;
  v82 = 0;
  v13 = 0;
  v14 = *(_QWORD *)v98;
  v15 = "-[KmlDeviceConfigurationData parseOemSpecificContent:]";
  v79 = *(_QWORD *)v98;
  v80 = v10;
  while (2)
  {
    v16 = 0;
    v81 = v12;
    do
    {
      v17 = v13;
      if (*(_QWORD *)v98 != v14)
        objc_enumerationMutation(v10);
      v83 = v16;
      v18 = *(id **)(*((_QWORD *)&v97 + 1) + 8 * v16);
      v19 = -[KmlTlv tag]((uint64_t)v18);
      -[KmlTlv value](v18);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)v15, 498, CFSTR("TLV: %02x : %@"), v20, v21, v22, v23, v19);

      if (-[KmlTlv tag]((uint64_t)v18) != 97)
      {
        v13 = v17;
        v55 = v83;
        goto LABEL_41;
      }
      -[KmlTlv value](v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      v26 = v25;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
      v84 = v26;
      if (v27)
      {
        v28 = v27;
        v86 = 0;
        v87 = 0;
        v88 = *(_QWORD *)v94;
        v29 = v17;
        v30 = v26;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v94 != v88)
              objc_enumerationMutation(v30);
            v32 = *(id **)(*((_QWORD *)&v93 + 1) + 8 * i);
            v33 = -[KmlTlv tag]((uint64_t)v32);
            -[KmlTlv value](v32);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)v15, 503, CFSTR("TLV: %02x : %@"), v34, v35, v36, v37, v33);

            if (-[KmlTlv tag]((uint64_t)v32) == 64)
            {
              -[KmlTlv value](v32);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v5, "isEqualToData:", v38);

              if ((v39 & 1) != 0)
              {
                v86 = 1;
              }
              else
              {
                -[KmlTlv value](v32);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = objc_msgSend(v85, "isEqualToData:", v51);

                v29 = v52 | v29;
              }
            }
            else if (-[KmlTlv tag]((uint64_t)v32) == 49)
            {
              -[KmlTlv value](v32);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              v91 = 0u;
              v92 = 0u;
              v89 = 0u;
              v90 = 0u;
              v42 = v41;
              v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
              if (v43)
              {
                v44 = v43;
                v45 = v29;
                v46 = v15;
                v47 = v5;
                v48 = *(_QWORD *)v90;
                while (2)
                {
                  for (j = 0; j != v44; ++j)
                  {
                    if (*(_QWORD *)v90 != v48)
                      objc_enumerationMutation(v42);
                    v50 = *(id **)(*((_QWORD *)&v89 + 1) + 8 * j);
                    if (-[KmlTlv tag]((uint64_t)v50) == 80)
                    {
                      -[KmlTlv value](v50);
                      v53 = objc_claimAutoreleasedReturnValue();

                      v87 = (void *)v53;
                      goto LABEL_28;
                    }
                  }
                  v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
                  if (v44)
                    continue;
                  break;
                }
LABEL_28:
                v5 = v47;
                v15 = v46;
                v29 = v45;
                v30 = v84;
              }

            }
          }
          v28 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
        }
        while (v28);

        if ((v86 & 1) != 0)
        {
          kmlUtilHexStringFromData(v87);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDeviceConfigurationData parseOemSpecificContent:]", 522, CFSTR("Found oem specific data for %@ : (%@)"), v66, v67, v68, v69, (uint64_t)CFSTR("AAPL"));

          v70 = *(void **)(v78 + 136);
          *(_QWORD *)(v78 + 136) = v87;
          v71 = v87;

          v10 = v80;
          v65 = v80;
          goto LABEL_46;
        }
        v10 = v80;
        v54 = v87;
        if ((v29 & 1) == 0)
        {
          v13 = 0;
          v14 = v79;
          v12 = v81;
          goto LABEL_40;
        }
        v14 = v79;
        v12 = v81;
      }
      else
      {

        v54 = 0;
        if ((v17 & 1) == 0)
        {
          v13 = 0;
          goto LABEL_40;
        }
      }
      kmlUtilHexStringFromData(v54);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 1;
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)v15, 526, CFSTR("Found default product plan data for %@ : (%@)"), v56, v57, v58, v59, (uint64_t)CFSTR("DFLT"));

      v54 = v54;
      v82 = v54;
LABEL_40:
      v55 = v83;

LABEL_41:
      v16 = v55 + 1;
    }
    while (v16 != v12);
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
    if (v12)
      continue;
    break;
  }

  if ((v13 & 1) != 0)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDeviceConfigurationData parseOemSpecificContent:]", 533, CFSTR("Only found default product plan data, so using it"), v60, v61, v62, v63, v72);
    v64 = v82;
    v65 = *(void **)(v78 + 136);
    v82 = v64;
    *(_QWORD *)(v78 + 136) = v64;
LABEL_46:
    v3 = v77;
    goto LABEL_48;
  }
  v3 = v77;
LABEL_49:

LABEL_50:
}

- (void)parseSharingInAChainDeviceConfigMailboxSettingData
{
  id v2;
  void *v3;
  uint64_t v4;
  void *i;
  id *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, *(void **)(a1 + 112));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v2 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v4)
            objc_enumerationMutation(v2);
          v6 = *(id **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          if (-[KmlTlv tag]((uint64_t)v6) == 96)
          {
            -[KmlTlv value](v6);
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_12:

    if (!objc_msgSend(v3, "length"))
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDeviceConfigurationData parseSharingInAChainDeviceConfigMailboxSettingData]", 588, CFSTR("No override found"), v7, v8, v9, v10, v21);
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDeviceConfigurationData parseSharingInAChainDeviceConfigMailboxSettingData]", 591, CFSTR("SharingInAChain override %@"), v7, v8, v9, v10, (uint64_t)v3);
    +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id **)(*((_QWORD *)&v22 + 1) + 8 * j);
          if (-[KmlTlv tag]((uint64_t)v16) == 74)
          {
            -[KmlTlv value](v16);
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = *(void **)(a1 + 96);
            *(_QWORD *)(a1 + 96) = v17;

          }
          if (-[KmlTlv tag]((uint64_t)v16) == 75)
          {
            -[KmlTlv value](v16);
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = *(void **)(a1 + 104);
            *(_QWORD *)(a1 + 104) = v19;

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v13);
    }

  }
}

- (void)parseReaderBleConfigData:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(v3);
          v8 = *(id **)(*((_QWORD *)&v15 + 1) + 8 * i);
          switch(-[KmlTlv tag]((uint64_t)v8))
          {
            case 0xD0u:
              -[KmlTlv value](v8);
              v9 = objc_claimAutoreleasedReturnValue();
              v10 = *(void **)(a1 + 32);
              *(_QWORD *)(a1 + 32) = v9;
              goto LABEL_14;
            case 0xD1u:
              -[KmlTlv value](v8);
              v12 = objc_claimAutoreleasedReturnValue();
              v10 = *(void **)(a1 + 40);
              *(_QWORD *)(a1 + 40) = v12;
              goto LABEL_14;
            case 0xD2u:
              *(_BYTE *)(a1 + 20) = 1;
              continue;
            case 0xD3u:
              -[KmlTlv value](v8);
              v13 = objc_claimAutoreleasedReturnValue();
              v10 = *(void **)(a1 + 48);
              *(_QWORD *)(a1 + 48) = v13;
              goto LABEL_14;
            case 0xD4u:
              -[KmlTlv value](v8);
              v11 = objc_claimAutoreleasedReturnValue();
              v10 = *(void **)(a1 + 56);
              *(_QWORD *)(a1 + 56) = v11;
              goto LABEL_14;
            case 0xD5u:
              -[KmlTlv value](v8);
              v14 = objc_claimAutoreleasedReturnValue();
              v10 = *(void **)(a1 + 64);
              *(_QWORD *)(a1 + 64) = v14;
LABEL_14:

              break;
            default:
              continue;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v5);
    }

  }
}

- (BOOL)sharingPasswordRequired
{
  if (result)
    return *(_BYTE *)(result + 21) != 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatorSupportedFrameworkVersionsData, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedFrameworkVersionsData, 0);
  objc_storeStrong((id *)&self->_mfiPPID, 0);
  objc_storeStrong((id *)&self->_oemSpecificContentAsData, 0);
  objc_storeStrong((id *)&self->_sharingPasswordLengthAsData, 0);
  objc_storeStrong((id *)&self->_additionalMailboxSettingAsData, 0);
  objc_storeStrong((id *)&self->_v3PrivateMailboxSettingAsData, 0);
  objc_storeStrong((id *)&self->_v3ConfMailboxSettingAsData, 0);
  objc_storeStrong((id *)&self->_privateMailboxSettingAsData, 0);
  objc_storeStrong((id *)&self->_confMailboxSettingAsData, 0);
  objc_storeStrong((id *)&self->_supportedKeyProfiles, 0);
  objc_storeStrong((id *)&self->_onlineBleOOBMasterKeyOverride, 0);
  objc_storeStrong((id *)&self->_deviceBtIntroKey, 0);
  objc_storeStrong((id *)&self->_deviceBtOOBKey, 0);
  objc_storeStrong((id *)&self->_readerBtIdAddress, 0);
  objc_storeStrong((id *)&self->_readerBtIRK, 0);
  objc_storeStrong((id *)&self->_remainingTlvs, 0);
}

@end
