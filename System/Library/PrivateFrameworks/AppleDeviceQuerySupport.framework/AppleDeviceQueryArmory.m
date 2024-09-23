@implementation AppleDeviceQueryArmory

- (void)initData
{
  AppleDeviceQueryArmoryHelperArmory *v3;
  AppleDeviceQueryArmoryHelperArmory *v4;
  AppleDeviceQueryArmoryHelperArmory *helper;
  id v6;

  self->_configClass = (Class)objc_opt_class();
  self->_actionClass = (Class)objc_opt_class();
  v3 = [AppleDeviceQueryArmoryHelperArmory alloc];
  -[objc_class getConfig](self->_configClass, "getConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[AppleDeviceQueryArmoryHelperArmory initWithRawConfig:](v3, "initWithRawConfig:", v6);
  helper = self->_helper;
  self->_helper = v4;

}

- (BOOL)updateChangeablePropertiesForKey:(id)a3 andOption:(id)a4 withError:(id *)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSString *key;
  NSDictionary *v16;
  id v17;
  NSDictionary *config;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;
  id v30;
  uint64_t v32;
  id v33;

  v9 = a3;
  v13 = a4;
  if (!a5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory updateChangeablePropertiesForKey:andOption:withError:]", 38, CFSTR("error p-pointer is nil!"), v10, v11, v12, v32);
LABEL_12:
    v29 = 0;
    goto LABEL_13;
  }
  *a5 = 0;
  if (!v9)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory updateChangeablePropertiesForKey:andOption:withError:]", 44, CFSTR("key pointer is nil!"), v10, v11, v12, v32);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
    v29 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_storeStrong((id *)&self->_key, a3);
  objc_storeStrong((id *)&self->_option, a4);
  -[AppleDeviceQueryArmory helper](self, "helper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  key = self->_key;
  v33 = 0;
  objc_msgSend(v14, "getConfigOfKey:withError:", key, &v33);
  v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v17 = v33;
  config = self->_config;
  self->_config = v16;

  if (!self->_config)
  {
    ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory updateChangeablePropertiesForKey:andOption:withError:]", 55, CFSTR("Failed to update config for key \"%@\"!"), v19, v20, v21, (uint64_t)v9);
    v30 = objc_retainAutorelease(v17);
    *a5 = v30;

    goto LABEL_12;
  }
  if (isZhuGeInRestoreOS())
  {
    -[NSDictionary objectForKeyedSubscript:](self->_config, "objectForKeyedSubscript:", CFSTR("SUPPORT_RESTOREOS"));
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      -[NSDictionary objectForKeyedSubscript:](self->_config, "objectForKeyedSubscript:", CFSTR("SUPPORT_RESTOREOS"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "BOOLValue");

      if ((v28 & 1) == 0)
      {
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory updateChangeablePropertiesForKey:andOption:withError:]", 64, CFSTR("Key \"%@\" isn't supported in restoreos!"), v22, v23, v24, (uint64_t)v9);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 40, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
    }
  }
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory updateChangeablePropertiesForKey:andOption:withError:]", 70, CFSTR("Properties of key \"%@\" is: %@"), v22, v23, v24, (uint64_t)v9);

  v29 = 1;
LABEL_13:

  return v29;
}

- (BOOL)convertReturnValue:(id *)a3 ByItselfAndError:(id)a4 AndRevalues:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char isKindOfClass;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char v44;
  BOOL v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  void *v51;
  int v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  int v58;
  _QWORD *v59;
  const __CFString *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __CFString *v64;
  uint64_t v65;
  BOOL v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v71;
  id v72;
  char v73;
  void *v74;
  int v75;
  void *v76;
  uint64_t v77;
  void **v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v12 = v8;
  v78 = a3;
  if (!a3)
  {
    v64 = CFSTR("returnValue p-pointer is nil!");
    v65 = 91;
LABEL_66:
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory convertReturnValue:ByItselfAndError:AndRevalues:]", v65, v64, v9, v10, v11, v71);
    v66 = 0;
    goto LABEL_71;
  }
  if (!v8)
  {
    v64 = CFSTR("revalues pointer is nil!");
    v65 = 96;
    goto LABEL_66;
  }
  v74 = v7;
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v72 = v8;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
  if (v14)
  {
    v15 = v14;
    v73 = 0;
    v16 = *(_QWORD *)v85;
    v77 = *(_QWORD *)v85;
LABEL_5:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v85 != v16)
        objc_enumerationMutation(v13);
      v18 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * v17);
      objc_msgSend(v13, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory convertReturnValue:ByItselfAndError:AndRevalues:]", 104, CFSTR("Config of revalue \"%@\" is not a dictionary"), v21, v22, v23, v18);
LABEL_61:
      if (++v17 == v15)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
        if (v15)
          goto LABEL_5;
        goto LABEL_69;
      }
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("RETURN_REVALUE_ERROR"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (isObjectNilOrZhuGeNull(v25))
    {

    }
    else
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("RETURN_REVALUE_ERROR"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v27 = objc_opt_isKindOfClass();

      if ((v27 & 1) == 0)
      {
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory convertReturnValue:ByItselfAndError:AndRevalues:]", 111, CFSTR("Error config of revalue \"%@\" is not an array"), v28, v29, v30, v18);

        goto LABEL_60;
      }
    }
    v31 = v15;
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("RETURN_REVALUE_ERROR"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("RETURN_REVALUE_VALUE"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (isObjectNilOrZhuGeNull(v32))
    {

      goto LABEL_16;
    }
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("RETURN_REVALUE_VALUE"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v34 = objc_opt_isKindOfClass();

    if ((v34 & 1) != 0)
    {
LABEL_16:
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("RETURN_REVALUE_VALUE"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("RETURN_REVALUE_OUTCOME"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (isObjectNilOrZhuGeNull(v39))
      {

LABEL_21:
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory convertReturnValue:ByItselfAndError:AndRevalues:]", 125, CFSTR("Outcome config of revalue \"%@\" is invalid!"), v40, v41, v42, v18);
        v46 = 8;
        v15 = v31;
        goto LABEL_59;
      }
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("RETURN_REVALUE_OUTCOME"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v44 = objc_opt_isKindOfClass();

      if ((v44 & 1) == 0)
        goto LABEL_21;
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("RETURN_REVALUE_OUTCOME"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (isObjectNilOrZhuGeNull(v79) & 1) != 0 || objc_msgSend(v79, "count") == 0;
      v15 = v31;
      if ((isObjectNilOrZhuGeNull(v38) & 1) != 0)
      {
        v50 = 1;
        if (!v45)
          goto LABEL_27;
      }
      else
      {
        v50 = objc_msgSend(v38, "count") == 0;
        if (!v45)
        {
LABEL_27:
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v74, "code"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v79, "containsObject:", v51);

          if (!v50)
          {
LABEL_28:
            v75 = v52;
            v82 = 0u;
            v83 = 0u;
            v80 = 0u;
            v81 = 0u;
            v53 = v38;
            v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
            if (v54)
            {
              v55 = v54;
              v56 = *(_QWORD *)v81;
              while (2)
              {
                for (i = 0; i != v55; ++i)
                {
                  if (*(_QWORD *)v81 != v56)
                    objc_enumerationMutation(v53);
                  if (objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * i), "isEqualToString:", CFSTR("ALL_ZERO"))&& (isObjectValidAndAllZero(*v78) & 1) != 0)
                  {
                    v58 = 1;
                    goto LABEL_42;
                  }
                }
                v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
                if (v55)
                  continue;
                break;
              }
            }
            v58 = 0;
LABEL_42:

            v15 = v31;
            v52 = v75;
LABEL_43:
            if ((v52 & v58) == 1)
            {
              ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory convertReturnValue:ByItselfAndError:AndRevalues:]", 154, CFSTR("Revalue \"%@\" criteria are matched"), v47, v48, v49, v18);
              if (objc_msgSend(v76, "isEqualToString:", CFSTR("NIL")))
              {
                *v78 = 0;
LABEL_55:
                v73 = 1;
                v46 = 4;
LABEL_58:

LABEL_59:
                if (v46 != 8)
                {

                  v66 = v73 & 1;
                  goto LABEL_70;
                }
                goto LABEL_60;
              }
              if (objc_msgSend(v76, "isEqualToString:", CFSTR("EMPTY_STRING")))
              {
                v59 = v78;
                v60 = &stru_2507BF7D0;
LABEL_54:
                *v59 = v60;
                goto LABEL_55;
              }
              if (objc_msgSend(v76, "isEqualToString:", CFSTR("EMPTY_ARRAY")))
              {
                v59 = v78;
                v60 = (const __CFString *)MEMORY[0x24BDBD1A8];
                goto LABEL_54;
              }
              if (objc_msgSend(v76, "isEqualToString:", CFSTR("EMPTY_DICTIONARY")))
              {
                v59 = v78;
                v60 = (const __CFString *)MEMORY[0x24BDBD1B8];
                goto LABEL_54;
              }
              if (objc_msgSend(v76, "isEqualToString:", CFSTR("ZERO_NUMBER")))
              {
                v59 = v78;
                v60 = (const __CFString *)&unk_2507C8710;
                goto LABEL_54;
              }
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory convertReturnValue:ByItselfAndError:AndRevalues:]", 186, CFSTR("Outcome config of revalue \"%@\" is unsupported!"), v61, v62, v63, v18);
            }
            v46 = 8;
            goto LABEL_58;
          }
LABEL_40:
          v58 = 1;
          goto LABEL_43;
        }
      }
      v52 = 1;
      if (!v50)
        goto LABEL_28;
      goto LABEL_40;
    }
    ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory convertReturnValue:ByItselfAndError:AndRevalues:]", 118, CFSTR("Value config of revalue \"%@\" is not an array"), v35, v36, v37, v18);

    v15 = v31;
LABEL_60:
    v16 = v77;
    goto LABEL_61;
  }
  v73 = 0;
LABEL_69:

  v66 = v73 & 1;
  ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory convertReturnValue:ByItselfAndError:AndRevalues:]", 190, CFSTR("Wasn't successful to find a matched revalue pattern!"), v67, v68, v69, v71);
LABEL_70:
  v12 = v72;
  v7 = v74;
LABEL_71:

  return v66;
}

- (id)convertReturnValue:(id)a3 toFormat:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  char isKindOfClass;
  void *v30;
  id v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v5 = a3;
  v6 = a4;
  v10 = v6;
  if (!v5)
  {
    v11 = CFSTR("returnValue pointer is nil!");
    v12 = 204;
    goto LABEL_7;
  }
  if (!v6)
  {
    v11 = CFSTR("format pointer is nil!");
    v12 = 209;
    goto LABEL_7;
  }
  if (!isObjectNSStringAndZhuGeNull(v6))
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("STRING")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringFromData:", v5);
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_59:
        v13 = (void *)v15;
        goto LABEL_9;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("STRING_VISIBLE")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "visibleStringFromData:", v5);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("STRING_HEX")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "hexStringFromData:", v5);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x"), objc_msgSend(v5, "intValue"));
LABEL_40:
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("STRING_MAC_ADDR")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "macAddressStringFromData:", v5);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("STRING_MAC_ADDR_SYSCFG_6BYTE")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "macAddressStringFromSysconfigDataSixByte:", v5);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("STRING_UUID_WITHOUT_DASH")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "stringByRemovingCharactersInString:", CFSTR("-"));
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("STRING_TRIM_SIZE_UNIT_CHARS")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "stringByTrimmingCharactersInString:", CFSTR(" KkMmGgTtBb"));
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("STRING_SIZE_GB")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)MEMORY[0x24BDD17C8];
        v17 = objc_msgSend(v5, "unsignedLongLongValue") / 0x3B9ACA00uLL;
LABEL_39:
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%llu"), v17);
        goto LABEL_40;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("STRING_SIZE_GIB")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)MEMORY[0x24BDD17C8];
        v17 = (unint64_t)objc_msgSend(v5, "unsignedLongLongValue") >> 30;
        goto LABEL_39;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("ARRAY_GRAPHIC_INFO")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "graphicInfoArrayFromArray:", v5);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("NUMBER_SINT32")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)MEMORY[0x24BDD16E0];
        v19 = v5;
        v20 = 4;
LABEL_50:
        v21 = 1;
LABEL_58:
        objc_msgSend(v18, "integerFromData:size:truncate:isSigned:needSwap:", v19, v20, 0, v21, 0);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("NUMBER_SINT64")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)MEMORY[0x24BDD16E0];
        v19 = v5;
        v20 = 8;
        goto LABEL_50;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("NUMBER_UINT32")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)MEMORY[0x24BDD16E0];
        v19 = v5;
        v20 = 4;
LABEL_57:
        v21 = 0;
        goto LABEL_58;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("NUMBER_UINT64")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)MEMORY[0x24BDD16E0];
        v19 = v5;
        v20 = 8;
        goto LABEL_57;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("NUMBER_TRIM_SIZE_UNIT_CHARS")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = objc_alloc_init(MEMORY[0x24BDD16F0]);
        objc_msgSend(v5, "stringByTrimmingCharactersInString:", CFSTR(" KkMmGgTtBb"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "numberFromString:", v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_75:

        goto LABEL_9;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("NUMBER_SIZE_GB")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = (void *)MEMORY[0x24BDD16E0];
        v25 = objc_msgSend(v5, "unsignedLongLongValue") / 0x3B9ACA00uLL;
LABEL_71:
        objc_msgSend(v24, "numberWithUnsignedLongLong:", v25);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = objc_alloc_init(MEMORY[0x24BDD16F0]);
        v26 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v5, "stringByTrimmingCharactersInString:", CFSTR(" KkMmGgTtBb"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "numberFromString:", v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "unsignedLongLongValue") / 0x3B9ACA00uLL;
LABEL_74:
        objc_msgSend(v26, "numberWithUnsignedLongLong:", v28);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_75;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("NUMBER_SIZE_GIB")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = (void *)MEMORY[0x24BDD16E0];
        v25 = (unint64_t)objc_msgSend(v5, "unsignedLongLongValue") >> 30;
        goto LABEL_71;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = objc_alloc_init(MEMORY[0x24BDD16F0]);
        v26 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v5, "stringByTrimmingCharactersInString:", CFSTR(" KkMmGgTtBb"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "numberFromString:", v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (unint64_t)objc_msgSend(v27, "unsignedLongLongValue") >> 30;
        goto LABEL_74;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("BOOL_POSITIVE")))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v30 = (void *)MEMORY[0x24BDD16E0];
      if ((isKindOfClass & 1) != 0)
      {
        v31 = v5;
        v32 = 0;
LABEL_84:
        objc_msgSend(v30, "BOOLFromData:needNegate:", v31, v32);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "BOOLValue"));
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("BOOL_NEGATIVE")))
    {
      objc_opt_class();
      v33 = objc_opt_isKindOfClass();
      v30 = (void *)MEMORY[0x24BDD16E0];
      if ((v33 & 1) != 0)
      {
        v31 = v5;
        v32 = 1;
        goto LABEL_84;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v5, "BOOLValue") ^ 1);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
    }
    objc_opt_class();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory convertReturnValue:toFormat:]", 385, CFSTR("Format \"%@\" and class \"%@\" mismatched!"), v34, v35, v36, (uint64_t)v10);
    goto LABEL_8;
  }
  v11 = CFSTR("format is invalid!");
  v12 = 214;
LABEL_7:
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory convertReturnValue:toFormat:]", v12, v11, v7, v8, v9, v37);
LABEL_8:
  v13 = 0;
LABEL_9:

  return v13;
}

- (id)convertReturnValue:(id)a3 toCase:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  v5 = a3;
  v6 = a4;
  v10 = v6;
  if (!v5)
  {
    v11 = CFSTR("returnValue pointer is nil!");
    v12 = 398;
    goto LABEL_15;
  }
  if (!v6)
  {
    v11 = CFSTR("caseType pointer is nil!");
    v12 = 403;
    goto LABEL_15;
  }
  if (isObjectNSStringAndZhuGeNull(v6))
  {
    v11 = CFSTR("caseType is invalid!");
    v12 = 408;
LABEL_15:
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory convertReturnValue:toCase:]", v12, v11, v7, v8, v9, v17);
    v15 = 0;
    goto LABEL_16;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("STRING_UPPERCASE"))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uppercaseStringWithLocale:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("STRING_LOWERCASE"))
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      v11 = CFSTR("Case \"%@\" and class \"%@\" mismatched!");
      v17 = (uint64_t)v10;
      v12 = 425;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseStringWithLocale:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;

LABEL_16:
  return v15;
}

- (id)getKeyAndOptionFromDependency:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  id v26;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v9 = v5;
  if (a4)
  {
    *a4 = 0;
    if (v5)
    {
      objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("{"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count") == 1)
      {
        v11 = v9;
        v12 = 0;
        v13 = 0;
        v14 = CFSTR("ZHUGE_NULL");
LABEL_9:
        v27 = v11;
        v28[0] = v14;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      if (objc_msgSend(v10, "count") == 2)
      {
        objc_msgSend(v10, "firstObject");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", v11, &stru_2507BF7D0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "dataUsingEncoding:", 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v12, 1, &v26);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v13 = v26;

        if (v14)
          goto LABEL_9;
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory getKeyAndOptionFromDependency:withError:]", 472, CFSTR("dependency \"%@\" doesn't contain a valid JSON string!"), v21, v22, v23, (uint64_t)v9);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 27, v13);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v15 = 0;
LABEL_12:
        *a4 = v16;
        goto LABEL_13;
      }
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory getKeyAndOptionFromDependency:withError:]", 477, CFSTR("dependency \"%@\" format is wrong!"), v17, v18, v19, (uint64_t)v9);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 59, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v14 = 0;
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory getKeyAndOptionFromDependency:withError:]", 456, CFSTR("dependency pointer is nil!"), v6, v7, v8, v25);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v14 = 0;
      v10 = 0;
    }
    v12 = 0;
    v15 = 0;
    v13 = 0;
    goto LABEL_12;
  }
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory getKeyAndOptionFromDependency:withError:]", 450, CFSTR("error p-pointer is nil!"), v6, v7, v8, v25);
  v11 = 0;
  v14 = 0;
  v10 = 0;
  v12 = 0;
  v15 = 0;
  v13 = 0;
LABEL_13:

  return v15;
}

- (BOOL)checkDependency:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  char v48;
  void *v49;
  char isKindOfClass;
  void *v51;
  BOOL v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  id *v77;
  void *v78;
  id obj;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v10 = v6;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory checkDependency:withError:]", 500, CFSTR("error p-pointer is nil!"), v7, v8, v9, v73);
    v14 = 0;
    goto LABEL_36;
  }
  *a4 = 0;
  if (isObjectNilOrZhuGeNull(v6))
  {
    v11 = (void *)MEMORY[0x24BDBCEB8];
    -[AppleDeviceQueryArmory key](self, "key");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppleDeviceQueryArmory setDependencyPath:](self, "setDependencyPath:", v13);

    v14 = 1;
    goto LABEL_36;
  }
  -[AppleDeviceQueryArmory key](self, "key");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v10, "containsObject:", v15);

  if (v16)
  {
    -[AppleDeviceQueryArmory key](self, "key");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory checkDependency:withError:]", 513, CFSTR("Key \"%@\" dependency got deadloop"), v18, v19, v20, (uint64_t)v17);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 28, 0);
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v10;
  v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
  if (!v80)
  {
    v14 = 1;
    goto LABEL_35;
  }
  v77 = a4;
  v78 = v10;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v81 = *(_QWORD *)v88;
  v82 = 0;
  while (2)
  {
    v28 = 0;
    v29 = v24;
    v30 = v25;
    v31 = v26;
    do
    {
      if (*(_QWORD *)v88 != v81)
        objc_enumerationMutation(obj);
      v32 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v28);
      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory checkDependency:withError:]", 520, CFSTR("Checking dependency \"%@\"), v21, v22, v23, v32);
      -[AppleDeviceQueryArmory dependencyPath](self, "dependencyPath");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "containsObject:", v32);

      if (v34)
      {
        -[AppleDeviceQueryArmory key](self, "key");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory checkDependency:withError:]", 523, CFSTR("Duplicated dependency \"%@\" for key \"%@\"), v53, v54, v55, v32);

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 28, 0);
        *v77 = (id)objc_claimAutoreleasedReturnValue();

        v14 = 0;
        v26 = v31;
        v31 = v82;
        v25 = v30;
        goto LABEL_34;
      }
      v86 = v27;
      -[AppleDeviceQueryArmory getKeyAndOptionFromDependency:withError:](self, "getKeyAndOptionFromDependency:withError:", v32, &v86);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v86;

      if (!v24)
      {
        -[AppleDeviceQueryArmory key](self, "key");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory checkDependency:withError:]", 530, CFSTR("Failed to resolve dependency \"%@\" for key \"%@\"!"), v56, v57, v58, v32);

        v26 = objc_retainAutorelease(v35);
        v14 = 0;
        *v77 = v26;
        v29 = v30;
        v25 = v82;
        goto LABEL_34;
      }
      objc_msgSend(v24, "allKeys");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "allValues");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (isObjectNilOrZhuGeNull(v38))
      {

        v38 = 0;
      }
      v85 = v35;
      -[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:](self, "runForKey:andOptions:andPreferences:withError:", v25, v38, 0, &v85);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v85;

      if (!v39)
      {
        -[AppleDeviceQueryArmory key](self, "key");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory checkDependency:withError:]", 542, CFSTR("Failed to run for dependency \"%@\" for key \"%@\"), v59, v60, v61, v32);

        v62 = objc_retainAutorelease(v40);
        *v77 = v62;

        v14 = 0;
        v26 = v31;
        v31 = v38;
        goto LABEL_33;
      }
      v82 = v38;
      -[AppleDeviceQueryArmory dependencyPath](self, "dependencyPath");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v32);

      -[AppleDeviceQueryArmory helper](self, "helper");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v40;
      objc_msgSend(v42, "getConfigOfKey:withError:", v25, &v84);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v43 = v84;

      if (!v26)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory checkDependency:withError:]", 552, CFSTR("Failed to get config for dependency \"%@\"!"), v44, v45, v46, v32);
        v26 = objc_retainAutorelease(v43);
        v14 = 0;
        *v77 = v26;
        goto LABEL_32;
      }
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("DEPENDENCY"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = isObjectNilOrZhuGeNull(v47);

      if ((v48 & 1) == 0)
      {
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("DEPENDENCY"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          -[AppleDeviceQueryArmory key](self, "key");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory checkDependency:withError:]", 559, CFSTR("Dependency \"%@\" defines a non-array dependency"), v69, v70, v71, (uint64_t)v68);

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 9, 0);
          *v77 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_31;
        }
      }
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("DEPENDENCY"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v43;
      v52 = -[AppleDeviceQueryArmory checkDependency:withError:](self, "checkDependency:withError:", v51, &v83);
      v27 = v83;

      if (!v52)
      {
        -[AppleDeviceQueryArmory key](self, "key");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory checkDependency:withError:]", 566, CFSTR("Failed to verify for key \"%@\" in dependency \"%@\"), v64, v65, v66, (uint64_t)v63);

        v67 = objc_retainAutorelease(v27);
        *v77 = v67;

LABEL_31:
        v14 = 0;
        goto LABEL_32;
      }
      ++v28;
      v29 = v24;
      v30 = v25;
      v31 = v26;
    }
    while (v80 != v28);
    v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
    if (v80)
      continue;
    break;
  }

  v14 = 1;
LABEL_32:
  v31 = v82;
LABEL_33:
  v29 = v24;
LABEL_34:

  v10 = v78;
LABEL_35:

LABEL_36:
  return v14;
}

- (BOOL)verifyDependencyWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  BOOL v19;
  id v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  void *v34;
  id v35;

  if (!a3)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory verifyDependencyWithError:]", 585, CFSTR("error p-pointer is nil!"), v3, v4, v5, v33);
    v20 = 0;
    v21 = 0;
    goto LABEL_10;
  }
  *a3 = 0;
  v8 = (void *)MEMORY[0x24BDBCEB8];
  -[AppleDeviceQueryArmory key](self, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppleDeviceQueryArmory setDependencyPath:](self, "setDependencyPath:", v10);

  -[AppleDeviceQueryArmory config](self, "config");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DEPENDENCY"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = isObjectNilOrZhuGeNull(v12);

  if ((v13 & 1) == 0)
  {
    -[AppleDeviceQueryArmory config](self, "config");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("DEPENDENCY"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      -[AppleDeviceQueryArmory key](self, "key");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory verifyDependencyWithError:]", 595, CFSTR("Key \"%@\" defines a non-array dependency"), v29, v30, v31, (uint64_t)v28);

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 9, 0);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      goto LABEL_9;
    }
  }
  -[AppleDeviceQueryArmory config](self, "config");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("DEPENDENCY"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v19 = -[AppleDeviceQueryArmory checkDependency:withError:](self, "checkDependency:withError:", v18, &v35);
  v20 = v35;

  if (!v19)
  {
    -[AppleDeviceQueryArmory key](self, "key");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppleDeviceQueryArmory dependencyPath](self, "dependencyPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "componentsJoinedByString:", CFSTR("-->"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory verifyDependencyWithError:]", 602, CFSTR("Failed to check dependency for key \"%@\" in path \"%@\"), v24, v25, v26, (uint64_t)v22);

    v27 = objc_retainAutorelease(v20);
    v20 = v27;
LABEL_9:
    v21 = 0;
    *a3 = v27;
    goto LABEL_10;
  }
  v21 = 1;
LABEL_10:

  return v21;
}

- (id)actForKey:(id)a3 andName:(id)a4 andConfig:(id)a5 andOptions:(id)a6 andPreferences:(id)a7 withError:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  char isKindOfClass;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  SEL v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t i;
  __CFString *v67;
  id *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  int v84;
  void *v85;
  __CFString *v86;
  void *v87;
  __CFString *v88;
  __CFString *v89;
  __CFString *v90;
  void *v91;
  __CFString *v92;
  __CFString *v93;
  const __CFString *v94;
  id v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  char v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  char v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  char v131;
  void *v132;
  char v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  char v143;
  void *v144;
  char v145;
  _BOOL4 v146;
  uint64_t v147;
  NSObject *v148;
  void *v149;
  void *v150;
  void *v151;
  unint64_t v152;
  uint64_t v153;
  uint64_t v154;
  int v155;
  id v156;
  id v157;
  id v158;
  dispatch_block_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  char v166;
  void *v167;
  void *v168;
  void *v169;
  char v170;
  id v171;
  int v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  double v177;
  void *v178;
  id v179;
  void *v180;
  char v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  char v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  _BOOL4 v204;
  void *v205;
  id v206;
  id v207;
  id v208;
  dispatch_time_t timeout;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  uint64_t v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  uint64_t v221;
  void *v222;
  id *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  id v229;
  NSObject *v230;
  void *v231;
  void *v232;
  id v233;
  char v234;
  _QWORD block[4];
  id v236;
  id v237;
  id v238;
  id v239;
  id v240;
  id v241;
  id v242;
  uint64_t v243;
  uint64_t v244;
  id v245;
  __CFString *v246;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v226 = v18;
  v227 = v16;
  v225 = v15;
  v231 = v14;
  v224 = v17;
  if (!a8)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 648, CFSTR("error p-pointer is nil!"), v19, v20, v21, v198);
    v232 = 0;
    v25 = 0;
    v230 = 0;
    v228 = 0;
    v233 = 0;
    v26 = 0;
    v27 = 0;
    v229 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v14 = 0;
    v31 = 0;
LABEL_7:
    v33 = &unk_2507C8728;
    v34 = &unk_2507C8728;
    goto LABEL_19;
  }
  *a8 = 0;
  if (!v14)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 654, CFSTR("key pointer is nil!"), v19, v20, v21, v198);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v232 = 0;
    v25 = 0;
    v230 = 0;
    v228 = 0;
    v233 = 0;
    v26 = 0;
    v27 = 0;
    v229 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    *a8 = v32;
    a8 = 0;
    goto LABEL_7;
  }
  v22 = v18;
  -[AppleDeviceQueryArmory key](self, "key");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v23 == v14)
  {
    -[AppleDeviceQueryArmory option](self, "option");
    v24 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = (id *)v17;
  }
  v223 = v24;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ACTION_METHOD"));
  v26 = (id)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 667, CFSTR("Key \"%@\" doesn't define method for action \"%@\"), v35, v36, v37, (uint64_t)v14);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 29, 0);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v232 = 0;
    v25 = 0;
    v230 = 0;
    v228 = 0;
    v233 = 0;
    v27 = 0;
    v229 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v14 = 0;
    v31 = 0;
LABEL_17:
    *a8 = v44;
LABEL_18:
    v33 = &unk_2507C8728;
    v34 = &unk_2507C8728;
    a8 = v223;
    goto LABEL_19;
  }
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ACTION_METHOD"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 675, CFSTR("Key \"%@\" defines a non-string method for action \"%@\"), v38, v39, v40, (uint64_t)v14);
    goto LABEL_15;
  }
  if (isObjectNSStringAndZhuGeNull(v31))
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 681, CFSTR("Key \"%@\" defines a empty method for action \"%@\"), v41, v42, v43, (uint64_t)v14);
LABEL_15:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 9, 0);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v232 = 0;
    v25 = 0;
    v230 = 0;
    v228 = 0;
    v233 = 0;
    v26 = 0;
LABEL_16:
    v27 = 0;
    v229 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v14 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ACTION_ARGUMENT"));
  v26 = (id)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 688, CFSTR("Key \"%@\" doesn't define argument for action \"%@\"), v46, v47, v48, (uint64_t)v14);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 29, 0);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v232 = 0;
    v25 = 0;
    v230 = 0;
    v228 = 0;
    v233 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ACTION_ARGUMENT"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 694, CFSTR("Key \"%@\" defines a non-array argument for action \"%@\"), v51, v52, v53, (uint64_t)v14);
    goto LABEL_15;
  }
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ACTION_ARGUMENT"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = NSSelectorFromString((NSString *)v31);
  -[objc_class methodSignatureForSelector:](-[AppleDeviceQueryArmory actionClass](self, "actionClass"), "methodSignatureForSelector:", v55);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 705, CFSTR("Method \"%@\" of key \"%@\" doesn't exist!"), v56, v57, v58, (uint64_t)v31);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 35, 0);
    v95 = (id)objc_claimAutoreleasedReturnValue();
    v232 = 0;
    v25 = 0;
    v230 = 0;
    v228 = 0;
    v233 = 0;
    v26 = 0;
    v27 = 0;
    v229 = 0;
    v28 = 0;
    v29 = 0;
LABEL_62:
    *a8 = v95;
    v14 = v54;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 712, CFSTR("Failed to get invocation method \"%@\" for key \"%@\"), v59, v60, v61, (uint64_t)v31);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 33, 0);
    v95 = (id)objc_claimAutoreleasedReturnValue();
    v232 = 0;
    v25 = 0;
    v230 = 0;
    v228 = 0;
    v233 = 0;
    v26 = 0;
    v27 = 0;
    v229 = 0;
    v28 = 0;
    goto LABEL_62;
  }
  -[objc_class setKey:](-[AppleDeviceQueryArmory actionClass](self, "actionClass"), "setKey:", v14);
  objc_msgSend(v29, "setTarget:", -[AppleDeviceQueryArmory actionClass](self, "actionClass"));
  objc_msgSend(v29, "setSelector:", v55);
  v214 = v30;
  v62 = objc_msgSend(v30, "numberOfArguments") - 1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v54, "count"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v221 = v62;
  v222 = v29;
  v215 = (uint64_t)v31;
  v218 = v54;
  v220 = v63;
  if (v62 < 3)
  {
    v219 = 0;
    v206 = 0;
    v221 = 2;
  }
  else
  {
    v64 = 0;
    v65 = 0;
    for (i = 2; i != v62; ++i)
    {
      if (objc_msgSend(v54, "count") <= (unint64_t)(i - 2))
      {
        v67 = 0;
      }
      else
      {
        objc_msgSend(v54, "objectAtIndexedSubscript:");
        v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v246 = v67;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = v222;
        if (-[__CFString isEqualToString:](v246, "isEqualToString:", CFSTR("$option")))
        {
          v68 = v223;
          v69 = v246;
          v246 = (__CFString *)v68;
          goto LABEL_51;
        }
        v70 = isObjectNSStringAndZhuGeNull(v246);
        v69 = v246;
        if (v70)
        {
          v246 = 0;
          goto LABEL_51;
        }
        if (-[__CFString rangeOfString:](v246, "rangeOfString:", CFSTR("$subkey")) != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[AppleDeviceQueryArmory helper](self, "helper");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v245 = v64;
          objc_msgSend(v71, "getSubkeyOfKey:withError:", v14, &v245);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v206 = v245;

          v73 = v72;
          v219 = v72;
          if (v72)
          {
            if ((isObjectNSStringAndZhuGeNull(v72) & 1) == 0 && objc_msgSend(v72, "count"))
            {
              -[__CFString componentsSeparatedByString:](v246, "componentsSeparatedByString:", CFSTR("$subkey"));
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              if ((unint64_t)objc_msgSend(v69, "count") < 2)
                goto LABEL_50;
              v234 = 0;
              v80 = 1;
              while (1)
              {
                objc_msgSend(v69, "objectAtIndexedSubscript:", v80);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                v82 = objc_msgSend(v81, "intValue");

                if (objc_msgSend(v73, "count") < (unint64_t)((int)v82 + 1))
                  break;
                if ((_DWORD)v82
                  || (objc_msgSend(v69, "objectAtIndexedSubscript:", v80),
                      v83 = (void *)objc_claimAutoreleasedReturnValue(),
                      v84 = objc_msgSend(v83, "hasPrefix:", CFSTR("0")),
                      v83,
                      v84))
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%d"), "$subkey", v82);
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  v86 = v246;
                  objc_msgSend(v219, "objectAtIndexedSubscript:", (int)v82);
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  -[__CFString stringByReplacingOccurrencesOfString:withString:](v86, "stringByReplacingOccurrencesOfString:withString:", v85, v87);
                  v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  v89 = v246;
                  v246 = v88;

                }
                else
                {
                  v234 = 1;
                }
                ++v80;
                v73 = v219;
                if (objc_msgSend(v69, "count") <= v80)
                {
                  if ((v234 & 1) != 0)
                  {
                    v90 = v246;
                    objc_msgSend(v219, "objectAtIndexedSubscript:", 0);
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    -[__CFString stringByReplacingOccurrencesOfString:withString:](v90, "stringByReplacingOccurrencesOfString:withString:", CFSTR("$subkey"), v91);
                    v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    v93 = v246;
                    v246 = v92;

                  }
LABEL_50:
                  v65 = v73;
                  v64 = v206;
                  v29 = v222;
LABEL_51:

                  goto LABEL_52;
                }
              }
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v73, "count"));
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (v82 + 1));
              v201 = (void *)objc_claimAutoreleasedReturnValue();
              ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 773, CFSTR("Flexible key \"%@\" only has %@ subkeys while requring %@ subkeys!"), v127, v128, v129, (uint64_t)v14);

              objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 17, 0);
              *a8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_142:
              v232 = 0;
              v230 = 0;
              v228 = 0;
              v233 = 0;
              v26 = 0;
              v229 = 0;
LABEL_143:
              v33 = &unk_2507C8728;
              v34 = &unk_2507C8728;
              a8 = v223;
LABEL_144:
              v31 = (void *)v215;
LABEL_145:
              v14 = v218;
              v30 = v214;
              v29 = v222;
              goto LABEL_146;
            }
            ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 761, CFSTR("Flexible key \"%@\" is missing subkey(s)!"), v77, v78, v79, (uint64_t)v14);
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 17, 0);
            v179 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 755, CFSTR("Flexible key \"%@\" got a nil subkey!"), v74, v75, v76, (uint64_t)v14);
            v179 = objc_retainAutorelease(v206);
          }
          *a8 = v179;
          goto LABEL_142;
        }
LABEL_52:
        v54 = v218;
      }
      else
      {
        v29 = v222;
      }
      if (v246)
        v94 = v246;
      else
        v94 = CFSTR("ZHUGE_NULL");
      objc_msgSend(v220, "addObject:", v94);
      objc_msgSend(v29, "setArgument:atIndex:", &v246, i);

    }
    v219 = v65;
    v206 = v64;
    v22 = v226;
    v31 = (void *)v215;
    v63 = v220;
  }
  objc_msgSend(v63, "componentsJoinedByString:", CFSTR(", "));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ZHUGE_NULL"), CFSTR("nil"));
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 800, CFSTR("Arguments were set for key \"%@\": (%@)"), v97, v98, v99, (uint64_t)v14);

  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Timeout"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  if (v100)
  {
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Timeout"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v102 = objc_opt_isKindOfClass();

    if ((v102 & 1) == 0)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 806, CFSTR("Preference of key \"%@\" has a non-number timeout!"), v103, v104, v105, (uint64_t)v14);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 9, 0);
      v232 = 0;
      v230 = 0;
      v228 = 0;
      v233 = 0;
      v26 = 0;
      v229 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      v14 = v54;
      v33 = &unk_2507C8728;
      v34 = &unk_2507C8728;
      a8 = v223;
      v30 = v214;
      goto LABEL_146;
    }
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Timeout"));
    v232 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v232 = 0;
  }
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("RetryNumber"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (v106)
  {
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("RetryNumber"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v108 = objc_opt_isKindOfClass();

    if ((v108 & 1) == 0)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 817, CFSTR("Preference of key \"%@\" has a non-number retry number!"), v109, v110, v111, (uint64_t)v14);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 9, 0);
      v230 = 0;
      v228 = 0;
      v233 = 0;
      v26 = 0;
      v229 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_143;
    }
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("RetryNumber"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v112, "intValue") & 0x80000000) != 0)
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 824, CFSTR("Preference of key \"%@\" has an invalid retry number: %@!"), v113, v114, v115, (uint64_t)v14);
  }
  else
  {
    v112 = &unk_2507C8728;
  }
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("RetryInterval"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  if (v116)
  {
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("RetryInterval"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v118 = objc_opt_isKindOfClass();

    if ((v118 & 1) == 0)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 831, CFSTR("Preference of key \"%@\" has a non-number retry interval!"), v119, v120, v121, (uint64_t)v14);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 9, 0);
      v230 = 0;
      v228 = 0;
      v233 = 0;
      v26 = 0;
      v229 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      v34 = &unk_2507C8728;
      a8 = v223;
      v33 = v112;
      goto LABEL_144;
    }
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("RetryInterval"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v122, "intValue") & 0x80000000) != 0)
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 838, CFSTR("Preference of key \"%@\" has an invalid retry interval: %@!"), v123, v124, v125, (uint64_t)v14);
  }
  else
  {
    v122 = &unk_2507C8728;
  }
  if (!v232)
  {
    objc_msgSend(v227, "objectForKeyedSubscript:", CFSTR("ACTION_TIMEOUT"));
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = isObjectNilOrZhuGeNull(v130);

    if ((v131 & 1) != 0)
    {
      v232 = 0;
    }
    else
    {
      objc_msgSend(v227, "objectForKeyedSubscript:", CFSTR("ACTION_TIMEOUT"));
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v133 = objc_opt_isKindOfClass();

      if ((v133 & 1) == 0)
      {
        v33 = v112;
        v31 = (void *)v215;
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 848, CFSTR("Method \"%@\" of key \"%@\" has a non-number timeout"), v134, v135, v136, v215);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 9, 0);
        v34 = v122;
        v232 = 0;
        v230 = 0;
        v228 = 0;
        v233 = 0;
        v26 = 0;
        v229 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        a8 = v223;
        goto LABEL_145;
      }
      objc_msgSend(v227, "objectForKeyedSubscript:", CFSTR("ACTION_TIMEOUT"));
      v232 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v227, "objectForKeyedSubscript:", CFSTR("ACTION_RETRY"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isObjectNilOrZhuGeNull(v137) & 1) != 0)
  {
    v213 = v112;
    v205 = v122;
LABEL_90:
    v138 = (void *)v215;
    goto LABEL_98;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v217 = v122;
    v33 = v112;
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 864, CFSTR("Method \"%@\" of key \"%@\" has a non-dictionary retry!"), v139, v140, v141, v215);
    goto LABEL_137;
  }
  if ((objc_msgSend(v112, "intValue") & 0x80000000) != 0
    && (objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("ACTION_RETRY_NUMBER")),
        v142 = (void *)objc_claimAutoreleasedReturnValue(),
        v143 = isObjectNilOrZhuGeNull(v142),
        v142,
        (v143 & 1) == 0))
  {
    v217 = v122;
    v33 = v112;
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("ACTION_RETRY_NUMBER"));
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v181 = objc_opt_isKindOfClass();

    if ((v181 & 1) == 0)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 873, CFSTR("Method \"%@\" of key \"%@\" has a non-number retry number"), v182, v183, v184, v215);
      goto LABEL_137;
    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("ACTION_RETRY_NUMBER"));
    v185 = (void *)objc_claimAutoreleasedReturnValue();

    v213 = v185;
    if ((objc_msgSend(v185, "intValue") & 0x80000000) != 0)
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 880, CFSTR("Configuration of key \"%@\" has an invalid retry number: %@!"), v186, v187, v188, (uint64_t)v14);
  }
  else
  {
    v213 = v112;
  }
  v138 = (void *)v215;
  if ((objc_msgSend(v122, "intValue") & 0x80000000) != 0)
  {
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("ACTION_RETRY_INTERVAL"));
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = isObjectNilOrZhuGeNull(v144);

    if ((v145 & 1) == 0)
    {
      v217 = v122;
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("ACTION_RETRY_INTERVAL"));
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v190 = objc_opt_isKindOfClass();

      if ((v190 & 1) != 0)
      {
        objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("ACTION_RETRY_INTERVAL"));
        v194 = (void *)objc_claimAutoreleasedReturnValue();

        v205 = v194;
        if ((objc_msgSend(v194, "intValue") & 0x80000000) != 0)
          ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 896, CFSTR("Configuration of key \"%@\" has an invalid retry interval: %@!"), v195, v196, v197, (uint64_t)v14);
        goto LABEL_90;
      }
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 889, CFSTR("Method \"%@\" of key \"%@\" has a non-number retry interval"), v191, v192, v193, v215);
      v33 = v213;
LABEL_137:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 9, 0);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      v230 = 0;
      v228 = 0;
      v233 = 0;
      v26 = 0;
      v229 = 0;
      v29 = v222;
      a8 = v223;
      v30 = v214;
      v31 = (void *)v215;
      v14 = v218;
      v25 = v219;
      v28 = v220;
      v27 = v206;
      v34 = v217;
      goto LABEL_19;
    }
  }
  v205 = v122;
LABEL_98:

  if (!v232 || (objc_msgSend(v232, "intValue") & 0x80000000) != 0)
  {

    v232 = &unk_2507C8740;
  }
  if ((objc_msgSend(v213, "intValue") & 0x80000000) != 0)
  {

    v213 = &unk_2507C8710;
    v146 = 1;
  }
  else
  {
    v146 = (int)objc_msgSend(v213, "intValue") < 1;
  }
  v204 = v146;
  if ((objc_msgSend(v205, "intValue") & 0x80000000) != 0)
  {

    v205 = &unk_2507C8758;
  }
  v147 = objc_msgSend(v232, "unsignedLongLongValue");
  if (v147 == -1)
    timeout = -1;
  else
    timeout = dispatch_time(0, 1000000 * v147);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v148 = objc_claimAutoreleasedReturnValue();
  v230 = dispatch_queue_create("ZhuGe_Action_Retry_Serial_Queue", v148);

  v33 = v213;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", (int)(objc_msgSend(v213, "intValue") + 1));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", (int)(objc_msgSend(v213, "intValue") + 1));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", (int)(objc_msgSend(v213, "intValue") + 1));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "intValue");
  v152 = 0;
  v153 = MEMORY[0x24BDBD1C0];
  do
  {
    objc_msgSend(v149, "setObject:atIndexedSubscript:", CFSTR("ZHUGE_NULL"), v152);
    objc_msgSend(v150, "setObject:atIndexedSubscript:", CFSTR("ZHUGE_NULL"), v152);
    objc_msgSend(v151, "setObject:atIndexedSubscript:", v153, v152++);
  }
  while (v152 <= (int)objc_msgSend(v213, "intValue"));
  v211 = v150;
  v212 = v151;
  objc_msgSend(v213, "intValue");
  v154 = 0;
  v155 = v204;
  v210 = v149;
  while (1)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __90__AppleDeviceQueryArmory_actForKey_andName_andConfig_andOptions_andPreferences_withError___block_invoke;
    block[3] = &unk_2507BEF60;
    v156 = v222;
    v236 = v156;
    v243 = v221;
    v26 = v212;
    v237 = v26;
    v244 = v154;
    v207 = v214;
    v238 = v207;
    v157 = v138;
    v239 = v157;
    v240 = v231;
    v158 = v149;
    v241 = v158;
    v233 = v211;
    v242 = v233;
    v159 = dispatch_block_create((dispatch_block_flags_t)0, block);
    dispatch_async(v230, v159);
    v228 = v158;
    v208 = v156;
    v216 = v159;
    if (dispatch_block_wait(v159, timeout))
    {
      v160 = v154;
      objc_msgSend(v26, "setObject:atIndexedSubscript:", MEMORY[0x24BDBD1C8], v154);
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 984, CFSTR("%@ms timeout for method \"%@\" of key \"%@\"!"), v161, v162, v163, (uint64_t)v232);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 62, 0);
      v164 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_126;
    }
    objc_msgSend(v158, "objectAtIndexedSubscript:", v154);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v166 = objc_opt_isKindOfClass();
    if ((v166 & 1) != 0
      && (objc_msgSend(v158, "objectAtIndexedSubscript:", v154),
          v202 = (void *)objc_claimAutoreleasedReturnValue(),
          (objc_msgSend(v202, "isEqualToString:", CFSTR("ZHUGE_NULL")) & 1) != 0))
    {
      v167 = 0;
    }
    else
    {
      objc_msgSend(v158, "objectAtIndexedSubscript:", v154);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v166 & 1) == 0)
        goto LABEL_119;
    }

LABEL_119:
    *a8 = v167;
    v168 = v233;
    objc_msgSend(v233, "objectAtIndexedSubscript:", v154);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v170 = objc_opt_isKindOfClass();
    if ((v170 & 1) != 0)
    {
      objc_msgSend(v233, "objectAtIndexedSubscript:", v154);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v203, "isEqualToString:", CFSTR("ZHUGE_NULL")) & 1) != 0)
      {
        v160 = v154;
        v164 = 0;
LABEL_124:

        goto LABEL_125;
      }
      v168 = v233;
    }
    v160 = v154;
    objc_msgSend(v168, "objectAtIndexedSubscript:", v154);
    v164 = objc_claimAutoreleasedReturnValue();
    if ((v170 & 1) != 0)
      goto LABEL_124;
LABEL_125:

    v33 = v213;
    v155 = v204;
LABEL_126:
    v171 = v157;
    v229 = (id)v164;
    v172 = v164 ? 1 : v155;
    if ((v172 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v160);
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog(524800, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 1000, CFSTR("After %@ ms, retry %@/%@ times for method \"%@\" of key \"%@\"), v173, v174, v175, (uint64_t)v205);

      v176 = (void *)MEMORY[0x24BDD17F0];
      v177 = (double)(int)objc_msgSend(v205, "intValue") * 0.001;
      v178 = v176;
      v33 = v213;
      objc_msgSend(v178, "sleepForTimeInterval:", v177);
    }

    v149 = v210;
    if (v172)
      break;
    v31 = v157;
    v154 = v160 + 1;
    v138 = (void *)v215;
    if (v160 + 1 > (unint64_t)(int)objc_msgSend(v33, "intValue"))
    {
      v229 = 0;
      v34 = v205;
      v30 = v207;
      v29 = v208;
      goto LABEL_135;
    }
  }
  v34 = v205;
  v30 = v207;
  v29 = v208;
  v31 = v171;
LABEL_135:
  a8 = v223;
  v14 = v218;
LABEL_146:
  v25 = v219;
  v28 = v220;
  v27 = v206;
LABEL_19:

  return v229;
}

void __90__AppleDeviceQueryArmory_actForKey_andName_andConfig_andOptions_andPreferences_withError___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  const __CFString **v11;
  const __CFString *v12;

  v11 = &v12;
  v12 = 0;
  objc_msgSend(*(id *)(a1 + 32), "setArgument:atIndex:", &v11, *(_QWORD *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 32), "invoke");
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 96));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 48), "methodReturnLength"))
    {
      v10 = 0;
      objc_msgSend(*(id *)(a1 + 32), "getReturnValue:", &v10);
      if (v10)
        v7 = v10;
      else
        v7 = CFSTR("ZHUGE_NULL");
      objc_msgSend(*(id *)(a1 + 80), "setObject:atIndexedSubscript:", v7, *(_QWORD *)(a1 + 96));
      if (v12)
        v8 = v12;
      else
        v8 = CFSTR("ZHUGE_NULL");
      objc_msgSend(*(id *)(a1 + 72), "setObject:atIndexedSubscript:", v8, *(_QWORD *)(a1 + 96));
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]_block_invoke", 962, CFSTR("Method \"%@\" of key \"%@\" doesn't return anything!"), v4, v5, v6, *(_QWORD *)(a1 + 56));
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 37, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "setObject:atIndexedSubscript:", v9, *(_QWORD *)(a1 + 96));

    }
  }
}

- (id)runForKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char isKindOfClass;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uid_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  id v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v90;
  char v91;
  void *v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  char v99;
  void *v100;
  void *v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  char v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  char v127;
  void *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  id v133;
  uint64_t v134;
  id v135;
  id v136;
  void *v137;
  id obj;
  id *v139;
  AppleDeviceQueryArmory *v140;
  id v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  id v146;
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v15 = a5;
  if (a6)
  {
    *a6 = 0;
    if (!v10)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1027, CFSTR("key pointer is nil!"), v12, v13, v14, v134);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v22 = 0;
      v28 = 0;
      v29 = 0;
      v21 = 0;
LABEL_22:
      *a6 = v26;
      goto LABEL_43;
    }
    -[AppleDeviceQueryArmory key](self, "key");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v16 == v10)
    {
      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1033, CFSTR("Will invocate for key \"%@\"!"), v17, v18, v19, (uint64_t)v10);
      -[AppleDeviceQueryArmory config](self, "config");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
    }
    else
    {
      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1036, CFSTR("Will invocate for dependency \"%@\"!"), v17, v18, v19, (uint64_t)v10);
      -[AppleDeviceQueryArmory helper](self, "helper");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = 0;
      objc_msgSend(v20, "getConfigOfKey:withError:", v10, &v146);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v146;

      if (!v21)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1039, CFSTR("Failed to update config for key \"%@\"!"), v23, v24, v25, (uint64_t)v10);
        v26 = objc_retainAutorelease(v22);
        v22 = v26;
LABEL_21:
        v27 = 0;
        v28 = 0;
        v29 = 0;
        goto LABEL_22;
      }
    }
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PRIVILEGE"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = isObjectNilOrZhuGeNull(v30);

    if ((v31 & 1) != 0)
    {
      v137 = 0;
    }
    else
    {
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PRIVILEGE"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1048, CFSTR("Key \"%@\" defines a non-array user privilege"), v55, v56, v57, (uint64_t)v10);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 9, 0);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      v58 = (void *)MEMORY[0x24BDD17C8];
      v59 = getuid();
      objc_msgSend(v58, "stringWithUTF8String:", getpwuid(v59)->pw_name);
      v60 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PRIVILEGE"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = (void *)v60;
      LOBYTE(v60) = objc_msgSend(v61, "containsObject:", v60);

      if ((v60 & 1) == 0)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1055, CFSTR("Current process priviledge is not allowed by Key \"%@\"), v62, v63, v64, (uint64_t)v10);
        v65 = (void *)MEMORY[0x24BDD1540];
        v66 = 44;
        goto LABEL_25;
      }
    }
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ENTITLEMENT"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = isObjectNilOrZhuGeNull(v32);

    if ((v33 & 1) != 0
      || (objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ENTITLEMENT")),
          v34 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          v35 = objc_opt_isKindOfClass(),
          v34,
          (v35 & 1) != 0))
    {
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ACTIONS"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ACTIONS"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ACTION_DEFAULT"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v140 = self;
          v47 = (void *)MEMORY[0x24BDBCEB8];
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ACTIONS"));
          v48 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v48, "allKeys");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "arrayWithArray:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          obj = v50;
          objc_msgSend(v50, "removeObject:", CFSTR("ACTION_SEQUENCE"));
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ACTIONS"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("ACTION_SEQUENCE"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v48) = isObjectNilOrZhuGeNull(v52);

          if ((v48 & 1) != 0)
          {
            v27 = v50;
          }
          else
          {
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ACTIONS"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("ACTION_SEQUENCE"));
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v72 = objc_opt_isKindOfClass();

            if ((v72 & 1) == 0)
            {
              ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1091, CFSTR("Key \"%@\" is defined action sequence with non-array"), v73, v74, v75, (uint64_t)v10);
              objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 9, 0);
              v28 = 0;
              *a6 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_65;
            }
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ACTIONS"));
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("ACTION_SEQUENCE"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if (objc_msgSend(v27, "count"))
          {
            v144 = 0u;
            v145 = 0u;
            v142 = 0u;
            v143 = 0u;
            obj = v27;
            v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v147, 16);
            v139 = a6;
            if (v80)
            {
              v81 = v80;
              v135 = v22;
              v82 = v15;
              v83 = v11;
              v84 = *(_QWORD *)v143;
LABEL_32:
              v85 = 0;
              while (1)
              {
                if (*(_QWORD *)v143 != v84)
                  objc_enumerationMutation(obj);
                v86 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * v85);
                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ACTIONS"));
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v87, "objectForKeyedSubscript:", v86);
                v88 = (void *)objc_claimAutoreleasedReturnValue();

                -[AppleDeviceQueryArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:](v140, "actForKey:andName:andConfig:andOptions:andPreferences:withError:", v10, v86, v88, v83, v82, v139);
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                if (v28)
                  break;
                if (v81 == ++v85)
                {
                  v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v147, 16);
                  if (v81)
                    goto LABEL_32;
                  v28 = 0;
                  break;
                }
              }
              v11 = v83;
              v15 = v82;
              v22 = v135;
            }
            else
            {
              v28 = 0;
            }

            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("RETURN"));
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = isObjectNilOrZhuGeNull(v90);

            if ((v91 & 1) != 0)
              goto LABEL_65;
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("RETURN"));
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v93 = objc_opt_isKindOfClass();

            if ((v93 & 1) != 0)
            {
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("RETURN"));
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("RETURN_REVALUES"));
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              v99 = isObjectNilOrZhuGeNull(v98);

              if ((v99 & 1) == 0)
              {
                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("RETURN"));
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("RETURN_REVALUES"));
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v102 = objc_opt_isKindOfClass();

                if ((v102 & 1) != 0)
                {
                  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1142, CFSTR("Key \"%@\" original value is %@, error is %@"), v103, v104, v105, (uint64_t)v10);
                  v141 = v28;
                  v106 = *v139;
                  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("RETURN"));
                  v107 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("RETURN_REVALUES"));
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v106) = -[AppleDeviceQueryArmory convertReturnValue:ByItselfAndError:AndRevalues:](v140, "convertReturnValue:ByItselfAndError:AndRevalues:", &v141, v106, v108);
                  v136 = v141;

                  if ((v106 & 1) != 0)
                  {
                    *v139 = 0;
                    v28 = v136;
                    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1152, CFSTR("Key \"%@\" revalued value is %@, error is %@"), v109, v110, v111, (uint64_t)v10);
                    a6 = v139;
                    v29 = v137;
                    v27 = obj;
                    v115 = v136;
                    if (!v136)
                    {
                      ZhuGeLog(524800, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1155, CFSTR("Revalued key \"%@\" to nil intentionally!"), v112, v113, v114, (uint64_t)v10);
                      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 11, 0);
                      v26 = (id)objc_claimAutoreleasedReturnValue();
                      goto LABEL_22;
                    }
LABEL_57:
                    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("RETURN"));
                    v116 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v116, "objectForKeyedSubscript:", CFSTR("RETURN_FORMAT"));
                    v117 = (void *)objc_claimAutoreleasedReturnValue();
                    v118 = isObjectNilOrZhuGeNull(v117);

                    if ((v118 & 1) != 0)
                      goto LABEL_59;
                    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("RETURN"));
                    v119 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("RETURN_FORMAT"));
                    v120 = (void *)objc_claimAutoreleasedReturnValue();
                    -[AppleDeviceQueryArmory convertReturnValue:toFormat:](v140, "convertReturnValue:toFormat:", v115, v120);
                    v121 = objc_claimAutoreleasedReturnValue();

                    v115 = (void *)v121;
                    if (v121)
                    {
LABEL_59:
                      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("RETURN"));
                      v125 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("RETURN_CASE"));
                      v126 = (void *)objc_claimAutoreleasedReturnValue();
                      v127 = isObjectNilOrZhuGeNull(v126);

                      if ((v127 & 1) != 0)
                      {
                        v28 = v115;
                        goto LABEL_65;
                      }
                      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("RETURN"));
                      v128 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("RETURN_CASE"));
                      v129 = (void *)objc_claimAutoreleasedReturnValue();
                      -[AppleDeviceQueryArmory convertReturnValue:toCase:](v140, "convertReturnValue:toCase:", v115, v129);
                      v28 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v28)
                        goto LABEL_65;
                      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1179, CFSTR("Failed to convert case for key \"%@\"!"), v130, v131, v132, (uint64_t)v10);
                      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 10, 0);
                      v133 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1169, CFSTR("Failed to convert format for key \"%@\"!"), v122, v123, v124, (uint64_t)v10);
                      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 10, 0);
                      v133 = (id)objc_claimAutoreleasedReturnValue();
                      v28 = 0;
                    }
                    *v139 = v133;
                    goto LABEL_65;
                  }
                  v28 = v136;
                  ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1147, CFSTR("Key \"%@\" is not converted, keep original value %@"), v109, v110, v111, (uint64_t)v10);
                }
                else
                {
                  ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1138, CFSTR("Config \"%@\" for key \"%@\" is not a dictionary"), v103, v104, v105, (uint64_t)CFSTR("RETURN_REVALUES"));
                }
              }
              v29 = v137;
              v27 = obj;
              v115 = v28;
              if (!v28)
                goto LABEL_43;
              goto LABEL_57;
            }
            ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1127, CFSTR("Config \"%@\" for key \"%@\" is not a dictionary"), v94, v95, v96, (uint64_t)CFSTR("RETURN"));
LABEL_65:
            v29 = v137;
            v27 = obj;
            goto LABEL_43;
          }
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1100, CFSTR("Key \"%@\" is defined action sequence with no action item"), v77, v78, v79, (uint64_t)v10);
          v68 = (void *)MEMORY[0x24BDD1540];
          v69 = 37;
        }
        else
        {
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1080, CFSTR("Key \"%@\" doesn't define the default action"), v44, v45, v46, (uint64_t)v10);
          v68 = (void *)MEMORY[0x24BDD1540];
          v69 = 29;
        }
        objc_msgSend(v68, "errorWithZhuGeErrorCode:underlyingError:", v69, 0);
        v67 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:
        v28 = 0;
        *a6 = v67;
        v29 = v137;
        goto LABEL_43;
      }
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1074, CFSTR("Key \"%@\" doesn't define actions"), v40, v41, v42, (uint64_t)v10);
      v65 = (void *)MEMORY[0x24BDD1540];
      v66 = 29;
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1064, CFSTR("Key \"%@\" defines a non-string access"), v36, v37, v38, (uint64_t)v10);
      v65 = (void *)MEMORY[0x24BDD1540];
      v66 = 9;
    }
LABEL_25:
    objc_msgSend(v65, "errorWithZhuGeErrorCode:underlyingError:", v66, 0);
    v67 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    goto LABEL_42;
  }
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:]", 1021, CFSTR("error p-pointer is nil!"), v12, v13, v14, v134);
  v27 = 0;
  v22 = 0;
  v28 = 0;
  v29 = 0;
  v21 = 0;
LABEL_43:

  return v28;
}

- (id)queryKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  BOOL v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v35;
  id v36;
  id v37;
  id v38;

  v10 = a3;
  v11 = a4;
  v15 = a5;
  if (!a6)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory queryKey:andOptions:andPreferences:withError:]", 1202, CFSTR("error p-pointer is nil!"), v12, v13, v14, v35);
    v27 = 0;
    v28 = 0;
    goto LABEL_13;
  }
  *a6 = 0;
  if (!v10)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory queryKey:andOptions:andPreferences:withError:]", 1208, CFSTR("key pointer is nil!"), v12, v13, v14, v35);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = 0;
    goto LABEL_12;
  }
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory queryKey:andOptions:andPreferences:withError:]", 1213, CFSTR("Querying the key: %@"), v12, v13, v14, (uint64_t)v10);
  v38 = 0;
  v16 = -[AppleDeviceQueryArmory updateChangeablePropertiesForKey:andOption:withError:](self, "updateChangeablePropertiesForKey:andOption:withError:", v10, v11, &v38);
  v17 = v38;
  v21 = v17;
  if (!v16)
  {
    ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory queryKey:andOptions:andPreferences:withError:]", 1218, CFSTR("Failed to update properties for key \"%@\", error %@!"), v18, v19, v20, (uint64_t)v10);
    v33 = v21;
LABEL_11:
    v32 = objc_retainAutorelease(v33);
    v28 = v32;
    v27 = 0;
    goto LABEL_12;
  }
  v37 = v17;
  v22 = -[AppleDeviceQueryArmory verifyDependencyWithError:](self, "verifyDependencyWithError:", &v37);
  v23 = v37;

  if (!v22)
  {
    ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory queryKey:andOptions:andPreferences:withError:]", 1224, CFSTR("Dependency of \"%@\" is not ready, error %@"), v24, v25, v26, (uint64_t)v10);
    v33 = v23;
    goto LABEL_11;
  }
  v36 = v23;
  -[AppleDeviceQueryArmory runForKey:andOptions:andPreferences:withError:](self, "runForKey:andOptions:andPreferences:withError:", v10, v11, v15, &v36);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v36;

  if (!v27)
  {
    ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[AppleDeviceQueryArmory queryKey:andOptions:andPreferences:withError:]", 1234, CFSTR("Failed to act for key \"%@\"!"), v29, v30, v31, (uint64_t)v10);
    v32 = objc_retainAutorelease(v28);
    v28 = v32;
LABEL_12:
    *a6 = v32;
  }
LABEL_13:

  return v27;
}

- (AppleDeviceQueryArmoryHelperArmory)helper
{
  return (AppleDeviceQueryArmoryHelperArmory *)objc_getProperty(self, a2, 24, 1);
}

- (Class)configClass
{
  return self->_configClass;
}

- (Class)actionClass
{
  return self->_actionClass;
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)option
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)config
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableArray)dependencyPath
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDependencyPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependencyPath, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_option, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

@end
