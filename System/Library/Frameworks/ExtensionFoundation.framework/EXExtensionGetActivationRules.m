@implementation EXExtensionGetActivationRules

void ___EXExtensionGetActivationRules_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;

  if (_EXExtensionUseAlternateRules)
  {
    v31 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", _EXExtensionUseAlternateRules, 2, &v31);
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v31;
    if (v0)
    {
      v30 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v0, 0, 0, &v30);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v30;

      v1 = v3;
    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    if (_EXExtensionKitBundle_onceToken[0] != -1)
      dispatch_once(_EXExtensionKitBundle_onceToken, &__block_literal_global_188);
    objc_msgSend((id)_EXExtensionKitBundle_bundle, "URLForResource:withExtension:", CFSTR("activation_rules"), CFSTR("plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "propertyListWithData:options:format:error:", v6, 0, 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v1 = 0;
  }
  objc_msgSend(v2, "objectForKey:", CFSTR("RULES"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1EE20C578;
  qword_1EE20C578 = v7;

  objc_msgSend(v2, "objectForKey:", CFSTR("GENERIC_ACCEPT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _EXPredicateWithString(v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_EXExtensionGetActivationRules__activation_rules;
  *(_QWORD *)&_EXExtensionGetActivationRules__activation_rules = v10;

  objc_msgSend(v2, "objectForKey:", CFSTR("GENERIC_REJECT_EXCEPT_ONE_OTHER_TYPE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _EXPredicateWithString(v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)*((_QWORD *)&_EXExtensionGetActivationRules__activation_rules + 1);
  *((_QWORD *)&_EXExtensionGetActivationRules__activation_rules + 1) = v13;

  objc_msgSend(v2, "objectForKey:", CFSTR("GENERIC_REJECT_EXCEPT_MULTIPLE_OTHER_TYPES"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _EXPredicateWithString(v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)qword_1EE20C550;
  qword_1EE20C550 = v16;

  objc_msgSend(v2, "objectForKey:", CFSTR("GENERIC_ENFORCE_ALL_TYPES"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _EXPredicateWithString(v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)qword_1EE20C558;
  qword_1EE20C558 = v19;

  objc_msgSend(v2, "objectForKey:", CFSTR("GENERIC_ENFORCE_ANY_TYPE"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _EXPredicateWithString(v21);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)xmmword_1EE20C560;
  *(_QWORD *)&xmmword_1EE20C560 = v22;

  objc_msgSend(v2, "objectForKey:", CFSTR("GENERIC_ENFORCE_ALL_TYPES_WITH_EXCEPTIONS"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _EXPredicateWithString(v24);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)*((_QWORD *)&xmmword_1EE20C560 + 1);
  *((_QWORD *)&xmmword_1EE20C560 + 1) = v25;

  objc_msgSend(v2, "objectForKey:", CFSTR("GENERIC_ENFORCE_ANY_TYPE_WITH_EXCEPTIONS"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _EXPredicateWithString(v27);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)qword_1EE20C570;
  qword_1EE20C570 = v28;

  if ((vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)_EXExtensionGetActivationRules__activation_rules), (int32x4_t)vceqzq_s64(*(int64x2_t *)&qword_1EE20C550)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)xmmword_1EE20C560), (int32x4_t)vceqzq_s64(*(int64x2_t *)&qword_1EE20C570))))) & 1) != 0)___EXExtensionGetActivationRules_block_invoke_cold_1(v1);
}

void ___EXExtensionGetActivationRules_block_invoke_cold_1(void *a1)
{
  void *v1;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Unable to load rules from internal property list, aborting. Error: %@"), v1);

  abort();
}

@end
