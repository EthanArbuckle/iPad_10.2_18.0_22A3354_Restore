@implementation NSInvocation(MKAdditions)

+ (id)_mapkit_invocationWithSelector:()MKAdditions target:
{
  objc_msgSend(a1, "_mapkit_invocationWithSelector:target:arguments:", a3, a4, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_mapkit_invocationWithSelector:()MKAdditions target:arguments:
{
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v15;
  uint64_t *v16;

  v7 = a4;
  v16 = a5;
  objc_msgSend(v7, "methodSignatureForSelector:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfArguments");
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTarget:", v7);
  objc_msgSend(v10, "setSelector:", a3);
  objc_msgSend(v10, "retainArguments");
  if (v9 >= 3)
  {
    v11 = v9 - 2;
    v12 = 0x200000000;
    do
    {
      v13 = v16++;
      v15 = *v13;
      objc_msgSend(v10, "setArgument:atIndex:", &v15, v12 >> 32);
      v12 += 0x100000000;
      --v11;
    }
    while (v11);
  }

  return v10;
}

@end
