@implementation ASDControl(ASDTIOA2Control)

- (BOOL)asdtAddControlProperties:()ASDTIOA2Control
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  uint64_t v17;
  unsigned int j;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  objc_class *v35;
  void *v36;
  objc_class *v38;
  id v39;
  int v40;
  int v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  id v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  v4 = a1;
  v5 = (void *)MEMORY[0x24BDBCEB8];
  v45 = v4;
  objc_msgSend(v4, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count") + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v45, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v51 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v12, "address");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "numberWithUnsignedInt:", objc_msgSend(v14, "selector"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
        else
        {
          objc_msgSend(v7, "addObject:", &unk_250850248);
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
    }
    while (v9);
  }

  if ((objc_msgSend(v7, "isEqual:", v44) & 1) != 0)
  {
    v16 = 1;
    goto LABEL_42;
  }
  objc_msgSend(v45, "asdtRemoveControlProperties");
  objc_msgSend(v45, "propertySelectorInfo");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v43, "count") || !objc_msgSend(v44, "count"))
  {
    v16 = 1;
    goto LABEL_41;
  }
  v17 = objc_msgSend(v44, "count");
  if (v17 != objc_msgSend(v43, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v44, "count");
      v41 = objc_msgSend(v43, "count");
      *(_DWORD *)buf = 138412802;
      v56 = v39;
      v57 = 1024;
      v58 = v40;
      v59 = 1024;
      v60 = v41;
      _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Invalid property selector count in registry: found %u, expected %u", buf, 0x18u);

    }
    v16 = 0;
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v44, "count"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  for (j = 0; ; ++j)
  {
    v19 = objc_msgSend(v44, "count", v42);
    v16 = v19 <= j;
    if (v19 <= j)
    {
      v27 = (void *)objc_msgSend(v42, "copy");
      objc_msgSend(v45, "setProperties:", v27);

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      objc_msgSend(v45, "properties");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      v30 = v29;
      if (v29)
      {
        v31 = *(_QWORD *)v47;
        do
        {
          v32 = 0;
          do
          {
            if (*(_QWORD *)v47 != v31)
              objc_enumerationMutation(v28);
            v33 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v32);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v45, "ioa2Device");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "addCustomProperty:", v33);

            }
            ++v32;
          }
          while (v30 != v32);
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        }
        while (v30);
      }
      goto LABEL_40;
    }
    objc_msgSend(v44, "objectAtIndexedSubscript:", j);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "unsignedIntValue");

    if ((_DWORD)v21)
      break;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObject:", v28);
LABEL_23:

  }
  objc_msgSend(v43, "objectAtIndexedSubscript:", j);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("selector"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unsignedIntValue");

  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("dataType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "unsignedIntValue");

  objc_msgSend(MEMORY[0x24BE0A278], "forControl:controlSelector:propertySelector:propertyDataType:", v45, v23, v21, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v42, "addObject:", v26);

    goto LABEL_23;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDControl(ASDTIOA2Control) asdtAddControlProperties:].cold.1(v36, v21, buf);
  }
LABEL_40:

LABEL_41:
LABEL_42:

  return v16;
}

- (void)asdtRemoveControlProperties
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v1, "properties", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v1, "ioa2Device");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "removeCustomProperty:", v6);

        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

  objc_msgSend(v1, "setProperties:", 0);
}

- (void)asdtSendControlPropertyChangeNotificationAtIndex:()ASDTIOA2Control
{
  void *v4;
  id v5;

  objc_msgSend(a1, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "sendPropertyChangeNotification");

}

- (void)asdtAddControlProperties:()ASDTIOA2Control .cold.1(void *a1, unsigned int a2, uint8_t *buf)
{
  int v4;
  int v5;
  int v6;
  int v7;

  v4 = HIBYTE(a2);
  if ((a2 - 0x20000000) >> 24 >= 0x5F)
    v4 = 32;
  v5 = BYTE2(a2);
  if (BYTE2(a2) - 32 >= 0x5F)
    v5 = 32;
  v6 = BYTE1(a2);
  if (BYTE1(a2) - 32 >= 0x5F)
    v6 = 32;
  *(_DWORD *)buf = 138413314;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v4;
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = v5;
  *((_WORD *)buf + 12) = 1024;
  *(_DWORD *)(buf + 26) = v6;
  if (a2 - 32 >= 0x5F)
    v7 = 32;
  else
    v7 = a2;
  *((_WORD *)buf + 15) = 1024;
  *((_DWORD *)buf + 8) = v7;
  _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Failed creating custom property for selector '%c%c%c%c'.", buf, 0x24u);

}

@end
