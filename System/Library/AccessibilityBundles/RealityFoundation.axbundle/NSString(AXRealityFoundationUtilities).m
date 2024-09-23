@implementation NSString(AXRealityFoundationUtilities)

- (void)_accessibilityEnumerateDelayedDescriptionsWithBlock:()AXRealityFoundationUtilities
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  if (_accessibilityEnumerateDelayedDescriptionsWithBlock__onceToken != -1)
    dispatch_once(&_accessibilityEnumerateDelayedDescriptionsWithBlock__onceToken, &__block_literal_global_1);
  if (_accessibilityEnumerateDelayedDescriptionsWithBlock__regex)
  {
    v5 = a1;
    v25 = 0;
    v26 = (double *)&v25;
    v27 = 0x2020000000;
    v28 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v6 = (void *)_accessibilityEnumerateDelayedDescriptionsWithBlock__regex;
    v7 = objc_msgSend(v5, "length");
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __94__NSString_AXRealityFoundationUtilities___accessibilityEnumerateDelayedDescriptionsWithBlock___block_invoke_178;
    v16 = &unk_250328E40;
    v8 = v5;
    v17 = v8;
    v19 = &v21;
    v9 = v4;
    v18 = v9;
    v20 = &v25;
    objc_msgSend(v6, "enumerateMatchesInString:options:range:usingBlock:", v8, 0, 0, v7, &v13);
    v10 = v22[3];
    v11 = objc_msgSend(v8, "length", v13, v14, v15, v16);
    objc_msgSend(v8, "substringWithRange:", v10, v11 - v22[3]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
      (*((void (**)(id, void *, double))v9 + 2))(v9, v12, v26[3]);

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);

  }
  else
  {
    (*((void (**)(id, void *, double))v4 + 2))(v4, a1, 0.0);
  }

}

@end
