@implementation ASDAudioDeviceDSPDatabase

- (ASDAudioDeviceDSPDatabase)initWithDictionary:(id)a3 resourcePath:(id)a4 deviceUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASDAudioDeviceDSPDatabase *v11;
  id *p_isa;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  ASDAudioDeviceDSPConfiguration *v20;
  ASDAudioDeviceDSPConfiguration *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  NSSet *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t n;
  void *v46;
  ASDAudioDeviceDSPDatabase *v47;
  NSSet *referencedDSPDeviceProperties;
  _BOOL8 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v58;
  id v59;
  id v60;
  ASDAudioDeviceDSPDatabase *v61;
  id obj;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  objc_super v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v84.receiver = self;
  v84.super_class = (Class)ASDAudioDeviceDSPDatabase;
  v11 = -[ASDAudioDeviceDSPDatabase init](&v84, sel_init);
  if (v11)
  {
    p_isa = (id *)&v11->super.isa;
    v60 = v10;
    objc_storeStrong((id *)&v11->_deviceUID, a5);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
    v61 = (ASDAudioDeviceDSPDatabase *)p_isa;
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v81;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v81 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (v20 = -[ASDAudioDeviceDSPConfiguration initWithDictionary:resourcePath:name:]([ASDAudioDeviceDSPConfiguration alloc], "initWithDictionary:resourcePath:name:", v19, v9, v18)) == 0)
          {

            v49 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v49)
              -[ASDAudioDeviceDSPDatabase initWithDictionary:resourcePath:deviceUID:].cold.1(v49, v50, v51, v52, v53, v54, v55, v56);
            v22 = v61;
            v47 = 0;
            goto LABEL_43;
          }
          v21 = v20;
          objc_msgSend(obj, "addObject:", v20);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
        p_isa = (id *)&v61->super.isa;
        if (v15)
          continue;
        break;
      }
    }
    v58 = v9;
    v59 = v8;

    objc_storeStrong(p_isa + 2, obj);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    objc_msgSend(p_isa, "dspConfigurations");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v77;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v77 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          objc_msgSend(v28, "underlyingDeviceProperties", v58, v59);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v73;
            do
            {
              for (k = 0; k != v31; ++k)
              {
                if (*(_QWORD *)v73 != v32)
                  objc_enumerationMutation(v29);
                objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * k), "address");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "addObject:", v34);

              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
            }
            while (v31);
          }

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
      }
      while (v25);
    }

    objc_storeStrong((id *)&v61->_referencedUnderlyingDeviceProperties, v22);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v35 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    -[ASDAudioDeviceDSPDatabase dspConfigurations](v61, "dspConfigurations");
    v63 = (id)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v69;
      do
      {
        for (m = 0; m != v37; ++m)
        {
          if (*(_QWORD *)v69 != v38)
            objc_enumerationMutation(v63);
          v40 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * m);
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          objc_msgSend(v40, "dspDeviceProperties", v58, v59);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
          if (v42)
          {
            v43 = v42;
            v44 = *(_QWORD *)v65;
            do
            {
              for (n = 0; n != v43; ++n)
              {
                if (*(_QWORD *)v65 != v44)
                  objc_enumerationMutation(v41);
                objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * n), "address");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSSet addObject:](v35, "addObject:", v46);

              }
              v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
            }
            while (v43);
          }

        }
        v37 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
      }
      while (v37);
    }

    v47 = v61;
    referencedDSPDeviceProperties = v61->_referencedDSPDeviceProperties;
    v61->_referencedDSPDeviceProperties = v35;

    v9 = v58;
    v8 = v59;
LABEL_43:
    v10 = v60;

  }
  else
  {
    v47 = 0;
  }

  return v47;
}

- (id)dspConfigurationForDevice:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[ASDAudioDeviceDSPDatabase dspConfigurations](self, "dspConfigurations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v39;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v28)
        objc_enumerationMutation(obj);
      v6 = *(id *)(*((_QWORD *)&v38 + 1) + 8 * v5);
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      objc_msgSend(v6, "underlyingDeviceProperties");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      v9 = v6;
      if (v8)
      {
        v10 = v8;
        v11 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v35 != v11)
              objc_enumerationMutation(v7);
            v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(v13, "address");
            v14 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "getProperty:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v13, "value");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v14) = objc_msgSend(v15, "isEqual:", v16);

            if ((v14 & 1) == 0)
            {

              v9 = 0;
              goto LABEL_16;
            }

          }
          v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          if (v10)
            continue;
          break;
        }
        v9 = v6;
      }
LABEL_16:

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend(v6, "dspDeviceProperties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v31;
        while (2)
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v31 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
            objc_msgSend(v22, "address");
            v23 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "getProperty:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v22, "value");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v23) = objc_msgSend(v24, "isEqual:", v25);

            if ((v23 & 1) == 0)
            {

              goto LABEL_27;
            }

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          if (v19)
            continue;
          break;
        }
      }

      if (v9)
        break;
LABEL_27:
      if (++v5 == v29)
      {
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        if (v29)
          goto LABEL_3;
        goto LABEL_29;
      }
    }
  }
  else
  {
LABEL_29:
    v9 = 0;
  }

  return v9;
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (NSSet)dspConfigurations
{
  return self->_dspConfigurations;
}

- (NSSet)referencedUnderlyingDeviceProperties
{
  return self->_referencedUnderlyingDeviceProperties;
}

- (NSSet)referencedDSPDeviceProperties
{
  return self->_referencedDSPDeviceProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencedDSPDeviceProperties, 0);
  objc_storeStrong((id *)&self->_referencedUnderlyingDeviceProperties, 0);
  objc_storeStrong((id *)&self->_dspConfigurations, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
}

- (void)initWithDictionary:(uint64_t)a3 resourcePath:(uint64_t)a4 deviceUID:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "ASDAudioDeviceDSPDatabase parse failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

@end
