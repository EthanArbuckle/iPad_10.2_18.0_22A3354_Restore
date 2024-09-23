@implementation ASDAudioDeviceDSPConfiguration

- (ASDAudioDeviceDSPConfiguration)initWithDictionary:(id)a3 resourcePath:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASDAudioDeviceDSPConfiguration *v11;
  ASDAudioDeviceDSPConfiguration *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  ASDStreamDSPConfiguration *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  ASDPropertyAddress *v30;
  ASDProperty *v31;
  void *v32;
  ASDProperty *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  ASDStreamDSPConfiguration *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  _BOOL8 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  ASDAudioDeviceDSPConfiguration *v63;
  id v64;
  id v65;
  unsigned int v66;
  id v67;
  uint64_t v68;
  id obj;
  id v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  objc_super v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v91.receiver = self;
  v91.super_class = (Class)ASDAudioDeviceDSPConfiguration;
  v11 = -[ASDAudioDeviceDSPConfiguration init](&v91, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_65;
  objc_storeStrong((id *)&v11->_name, a5);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
  if (!v17)
  {

LABEL_63:
    objc_storeStrong((id *)&v12->_underlyingDeviceProperties, v13);
    objc_storeStrong((id *)&v12->_dspDeviceProperties, v14);
    v61 = obj;
    objc_storeStrong((id *)&v12->_inputDSP, obj);
    objc_storeStrong((id *)&v12->_outputDSP, v15);
    goto LABEL_64;
  }
  v18 = v17;
  v73 = v14;
  v74 = v13;
  v63 = v12;
  v64 = v10;
  v65 = v8;
  v19 = (ASDStreamDSPConfiguration *)1;
  v71 = v15;
  v72 = *(_QWORD *)v88;
  v20 = obj;
  v70 = v16;
  v67 = v9;
  do
  {
    v21 = 0;
    v68 = v18;
    do
    {
      if (*(_QWORD *)v88 != v72)
        objc_enumerationMutation(v16);
      v22 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v21);
      if ((objc_msgSend(v22, "isEqualToString:", CFSTR("UnderlyingDeviceProperties"), v63, v64, v65) & 1) != 0
        || objc_msgSend(v22, "isEqualToString:", CFSTR("DSPDeviceProperties")))
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_58;
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v24 = v23;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
        if (v25)
        {
          v26 = v25;
          v66 = v19;
          v27 = *(_QWORD *)v84;
          while (2)
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v84 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_25;
              v30 = -[ASDPropertyAddress initWithDictionary:]([ASDPropertyAddress alloc], "initWithDictionary:", v29);
              v31 = [ASDProperty alloc];
              objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Value"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = -[ASDProperty initWithAddress:value:](v31, "initWithAddress:value:", v30, v32);

              -[ASDProperty address](v33, "address");
              v34 = objc_claimAutoreleasedReturnValue();
              if (!v34
                || (v35 = (void *)v34,
                    -[ASDProperty value](v33, "value"),
                    v36 = (void *)objc_claimAutoreleasedReturnValue(),
                    v36,
                    v35,
                    !v36))
              {

LABEL_25:
                v19 = 0;
                v9 = v67;
                v18 = v68;
                v20 = obj;
                v16 = v70;
                goto LABEL_26;
              }
              v37 = objc_msgSend(v22, "isEqualToString:", CFSTR("UnderlyingDeviceProperties"));
              v38 = v74;
              if ((v37 & 1) != 0
                || (v39 = objc_msgSend(v22, "isEqualToString:", CFSTR("DSPDeviceProperties")), v38 = v73, (v39 & 1) != 0))
              {
                objc_msgSend(v38, "addObject:", v33);
              }

            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
            if (v26)
              continue;
            break;
          }
          v9 = v67;
          v18 = v68;
          v20 = obj;
          v16 = v70;
          v19 = (ASDStreamDSPConfiguration *)v66;
        }
        goto LABEL_26;
      }
      if (objc_msgSend(v22, "isEqualToString:", CFSTR("Input")))
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_58;
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v24 = v23;
        v40 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
        if (v40)
        {
          v41 = v40;
          v42 = v19;
          v43 = *(_QWORD *)v80;
LABEL_33:
          v44 = 0;
          while (1)
          {
            if (*(_QWORD *)v80 != v43)
              objc_enumerationMutation(v24);
            v45 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * v44);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_53;
            v19 = -[ASDStreamDSPConfiguration initWithDictionary:resourcePath:]([ASDStreamDSPConfiguration alloc], "initWithDictionary:resourcePath:", v45, v9);
            if (!v19)
              goto LABEL_54;
            objc_msgSend(v20, "addObject:", v19);

            if (v41 == ++v44)
            {
              v41 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
              if (v41)
                goto LABEL_33;
              goto LABEL_52;
            }
          }
        }
        goto LABEL_26;
      }
      if (objc_msgSend(v22, "isEqualToString:", CFSTR("Output")))
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_58:

          v10 = v64;
          v8 = v65;
          v12 = v63;
          v14 = v73;
          v13 = v74;
          v15 = v71;
          goto LABEL_59;
        }
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v24 = v23;
        v46 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
        if (v46)
        {
          v47 = v46;
          v42 = v19;
          v48 = *(_QWORD *)v76;
LABEL_45:
          v49 = 0;
          while (1)
          {
            if (*(_QWORD *)v76 != v48)
              objc_enumerationMutation(v24);
            v50 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v49);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              break;
            v19 = -[ASDStreamDSPConfiguration initWithDictionary:resourcePath:]([ASDStreamDSPConfiguration alloc], "initWithDictionary:resourcePath:", v50, v9);
            if (!v19)
              goto LABEL_54;
            objc_msgSend(v71, "addObject:", v19);

            if (v47 == ++v49)
            {
              v47 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
              if (v47)
                goto LABEL_45;
LABEL_52:
              v16 = v70;
              v19 = v42;
              goto LABEL_26;
            }
          }
LABEL_53:
          v19 = 0;
LABEL_54:
          v16 = v70;
        }
LABEL_26:

      }
      ++v21;
    }
    while (v21 != v18);
    v51 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
    v18 = v51;
  }
  while (v51);

  v52 = (char)v19;
  v10 = v64;
  v8 = v65;
  v12 = v63;
  v14 = v73;
  v13 = v74;
  v15 = v71;
  if ((v52 & 1) != 0)
    goto LABEL_63;
LABEL_59:
  v53 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v53)
    -[ASDAudioDeviceDSPConfiguration initWithDictionary:resourcePath:name:].cold.1(v53, v54, v55, v56, v57, v58, v59, v60);

  v12 = 0;
  v61 = obj;
LABEL_64:

LABEL_65:
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  ASDAudioDeviceDSPConfiguration *v4;
  ASDAudioDeviceDSPConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;
  void *v17;
  void *v18;

  v4 = (ASDAudioDeviceDSPConfiguration *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ASDAudioDeviceDSPConfiguration name](v5, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDAudioDeviceDSPConfiguration name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[ASDAudioDeviceDSPConfiguration underlyingDeviceProperties](v5, "underlyingDeviceProperties");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDAudioDeviceDSPConfiguration underlyingDeviceProperties](self, "underlyingDeviceProperties");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9))
        {
          -[ASDAudioDeviceDSPConfiguration dspDeviceProperties](v5, "dspDeviceProperties");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASDAudioDeviceDSPConfiguration dspDeviceProperties](self, "dspDeviceProperties");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqual:", v11))
          {
            -[ASDAudioDeviceDSPConfiguration inputDSP](v5, "inputDSP");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[ASDAudioDeviceDSPConfiguration inputDSP](self, "inputDSP");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "isEqual:"))
            {
              -[ASDAudioDeviceDSPConfiguration outputDSP](v5, "outputDSP");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[ASDAudioDeviceDSPConfiguration outputDSP](self, "outputDSP");
              v16 = v12;
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v17, "isEqual:", v13);

              v12 = v16;
            }
            else
            {
              v14 = 0;
            }

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[ASDAudioDeviceDSPConfiguration name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ASDAudioDeviceDSPConfiguration underlyingDeviceProperties](self, "underlyingDeviceProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[ASDAudioDeviceDSPConfiguration dspDeviceProperties](self, "dspDeviceProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[ASDAudioDeviceDSPConfiguration inputDSP](self, "inputDSP");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[ASDAudioDeviceDSPConfiguration outputDSP](self, "outputDSP");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSSet)underlyingDeviceProperties
{
  return self->_underlyingDeviceProperties;
}

- (NSSet)dspDeviceProperties
{
  return self->_dspDeviceProperties;
}

- (NSArray)inputDSP
{
  return self->_inputDSP;
}

- (NSArray)outputDSP
{
  return self->_outputDSP;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDSP, 0);
  objc_storeStrong((id *)&self->_inputDSP, 0);
  objc_storeStrong((id *)&self->_dspDeviceProperties, 0);
  objc_storeStrong((id *)&self->_underlyingDeviceProperties, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithDictionary:(uint64_t)a3 resourcePath:(uint64_t)a4 name:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "ASDAudioDeviceDSPConfiguration parse failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

@end
