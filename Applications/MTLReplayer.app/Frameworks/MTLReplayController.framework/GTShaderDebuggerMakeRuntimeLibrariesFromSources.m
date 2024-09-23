@implementation GTShaderDebuggerMakeRuntimeLibrariesFromSources

uint64_t __GTShaderDebuggerMakeRuntimeLibrariesFromSources_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unsigned __int8 *v8;
  void *v9;
  unsigned __int8 *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5));
  v8 = (unsigned __int8 *)objc_msgSend(v7, "pointerValue");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6));
  v10 = (unsigned __int8 *)objc_msgSend(v9, "pointerValue");

  v11 = v8[160];
  v12 = v10[160];
  if (v11 == v12)
  {
    v13 = (uint64_t)objc_msgSend(v5, "compare:", v6);
  }
  else if (v11 > v12)
  {
    v13 = -1;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

@end
