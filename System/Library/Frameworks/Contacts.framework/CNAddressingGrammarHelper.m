@implementation CNAddressingGrammarHelper

+ (id)os_log
{
  if (os_log_cn_once_token_0_18 != -1)
    dispatch_once(&os_log_cn_once_token_0_18, &__block_literal_global_124);
  return (id)os_log_cn_once_object_0_18;
}

void __35__CNAddressingGrammarHelper_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNAddressingGrammarHelper");
  v1 = (void *)os_log_cn_once_object_0_18;
  os_log_cn_once_object_0_18 = (uint64_t)v0;

}

+ (BOOL)addNoisyValueToContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "probabilityUtility");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "trueWithProbability:", 0.1);

  if (!v7 || !objc_msgSend(v4, "isKeyAvailable:", CFSTR("addressingGrammars")))
    goto LABEL_10;
  v8 = *MEMORY[0x1E0D137F8];
  objc_msgSend(v4, "addressingGrammars");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  if ((_DWORD)v8)
  {
    objc_msgSend(a1, "noiseAddressingGrammars");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAddressingGrammars:", v10);

LABEL_8:
    LOBYTE(v15) = 1;
    goto LABEL_11;
  }
  objc_msgSend(v4, "addressingGrammars");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") != 1)
  {

LABEL_10:
    LOBYTE(v15) = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "addressingGrammars");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(a1, "isNoiseValue:", v14);

  if (v15)
  {
    objc_msgSend(v4, "setAddressingGrammars:", MEMORY[0x1E0C9AA60]);
    goto LABEL_8;
  }
LABEL_11:

  return v15;
}

+ (id)noiseAddressingGrammars
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "noiseValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNLabeledValue labeledValueWithLabel:value:](CNLabeledValue, "labeledValueWithLabel:value:", 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)noiseValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3960], "unspecified");
}

+ (BOOL)isNoiseValue:(id)a3
{
  return objc_msgSend(a3, "isUnspecified");
}

@end
