@implementation DMTDisallowedPayloadTypesValidator

- (BOOL)validateProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[DMTDisallowedPayloadTypesValidator disallowedPayloadTypes](self, "disallowedPayloadTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v6, "payloads", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "type");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v7, "containsObject:", v14);

        if (v15)
        {
          if (a4)
          {
            v24[0] = CFSTR("PayloadContent");
            v23[0] = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
            v23[1] = CFSTR("PayloadType");
            objc_msgSend(v13, "type");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v24[1] = v16;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            DMTErrorWithCodeAndUserInfo(77, v17);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            LOBYTE(a4) = 0;
          }
          goto LABEL_12;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v10)
        continue;
      break;
    }
  }
  LOBYTE(a4) = 1;
LABEL_12:

  return (char)a4;
}

- (NSSet)disallowedPayloadTypes
{
  return self->_disallowedPayloadTypes;
}

- (void)setDisallowedPayloadTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disallowedPayloadTypes, 0);
}

@end
