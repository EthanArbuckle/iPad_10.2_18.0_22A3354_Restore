@implementation DMTAllowedPayloadTypesValidator

- (BOOL)validateProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[DMTAllowedPayloadTypesValidator allowedPayloadTypes](self, "allowedPayloadTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTAllowedPayloadTypesValidator requireAllPayloadTypes](self, "requireAllPayloadTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v6, "payloads", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "type");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "containsObject:", v15) & 1) == 0 && (objc_msgSend(v8, "containsObject:", v15) & 1) == 0)
        {
          if (a4)
          {
            v26[0] = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
            v26[1] = CFSTR("PayloadType");
            v27[0] = CFSTR("PayloadContent");
            v27[1] = v15;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            DMTErrorWithCodeAndUserInfo(77, v18);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          v17 = 0;
          goto LABEL_16;
        }
        objc_msgSend(v9, "removeObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v12)
        continue;
      break;
    }
  }

  v16 = objc_msgSend(v9, "count");
  v17 = 1;
  if (a4 && v16)
  {
    v25[0] = CFSTR("PayloadContent");
    v24[0] = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
    v24[1] = CFSTR("PayloadType");
    objc_msgSend(v9, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    DMTErrorWithCodeAndUserInfo(76, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

  }
  return v17;
}

- (NSSet)allowedPayloadTypes
{
  return self->_allowedPayloadTypes;
}

- (void)setAllowedPayloadTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)requireAllPayloadTypes
{
  return self->_requireAllPayloadTypes;
}

- (void)setRequireAllPayloadTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requireAllPayloadTypes, 0);
  objc_storeStrong((id *)&self->_allowedPayloadTypes, 0);
}

@end
