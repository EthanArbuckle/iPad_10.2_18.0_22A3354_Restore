@implementation DenyList

- (BOOL)checkIfCaptionInDenylist:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_denyListRules(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_count(v9, v10, v11, v12, v13);

  if (v14)
  {
    v19 = objc_msgSend_length(v4, v15, v16, v17, v18);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend_denyListRules(self, v20, v21, v22, v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v31, (uint64_t)v35, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v32 != v28)
            objc_enumerationMutation(v24);
          if (objc_msgSend_rangeOfFirstMatchInString_options_range_(*(void **)(*((_QWORD *)&v31 + 1) + 8 * i), v26, (uint64_t)v4, 0, 0, v19) != 0x7FFFFFFFFFFFFFFFLL)
          {
            LOBYTE(v14) = 1;
            goto LABEL_12;
          }
        }
        v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v31, (uint64_t)v35, 16);
        if (v27)
          continue;
        break;
      }
    }
    LOBYTE(v14) = 0;
LABEL_12:

  }
  return v14;
}

- (NSArray)denyListRules
{
  return self->denyListRules;
}

- (void)setDenyListRules:(id)a3
{
  objc_storeStrong((id *)&self->denyListRules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->denyListRules, 0);
}

@end
