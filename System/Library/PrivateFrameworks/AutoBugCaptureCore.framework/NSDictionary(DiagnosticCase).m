@implementation NSDictionary(DiagnosticCase)

- (id)logSignatureDescription
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;

  if (logSignatureDescription_onceToken != -1)
    dispatch_once(&logSignatureDescription_onceToken, &__block_literal_global_17);
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("domain"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("detected"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = logSignatureDescription_isInternal;
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("subtype"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("additional"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{domain:%@, type:%@, subtype:%@, subtypeContext:%@, process:%@}"), v2, v3, v7, v8, v4);
  }
  else
  {
    if (v6)
      v10 = CFSTR("…");
    else
      v10 = &stru_1EA3B8F58;
    v11 = v10;

    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("additional"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = CFSTR("…");
    else
      v13 = &stru_1EA3B8F58;
    v8 = v13;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{domain:%@, type:%@, %@%@, process:%@}"), v2, v3, v11, v8, v4);
    v7 = v11;
  }

  return v9;
}

@end
