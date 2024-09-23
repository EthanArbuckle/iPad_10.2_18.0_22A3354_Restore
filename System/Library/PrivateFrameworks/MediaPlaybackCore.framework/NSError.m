@implementation NSError

id __63__NSError_MPCPlaybackEngineEventPayload__mpc_userInfoJSONValue__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = a2;
  v5 = a3;
  if (_NSIsNSString())
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD1398])
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD10D8]) && _NSIsNSArray())
      {
        objc_msgSend(v5, "msv_compactMap:", &__block_literal_global_61);
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v7 = (void *)v6;
        goto LABEL_13;
      }
      if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD1328])
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        _MPCJSONSanitizedValue(v5);
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    objc_msgSend(v5, "mpc_jsonValue");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v7 = 0;
LABEL_13:

  return v7;
}

id __63__NSError_MPCPlaybackEngineEventPayload__mpc_userInfoJSONValue__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "mpc_jsonValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __68__NSError_MPCPlaybackEngineEventPayload__mpc_userInfoFromJSONValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD1398]))
  {
    v6 = (void *)MEMORY[0x24BDD1540];
LABEL_7:
    objc_msgSend(v6, "payloadValueFromJSONValue:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD10D8]))
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD1328]))
    {
      v7 = v5;
      goto LABEL_8;
    }
    v6 = (void *)MEMORY[0x24BDBCF48];
    goto LABEL_7;
  }
  objc_msgSend(v5, "msv_map:", &__block_literal_global_64);
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v8 = v7;

  return v8;
}

uint64_t __68__NSError_MPCPlaybackEngineEventPayload__mpc_userInfoFromJSONValue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDD1540], "payloadValueFromJSONValue:", a2);
}

@end
