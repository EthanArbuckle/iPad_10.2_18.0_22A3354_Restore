@implementation CBStatusInfoHelper

+ (id)copyStatusInfoFor:(id)a3
{
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  SEL v14;
  id v15;

  v15 = a1;
  v14 = a2;
  v13 = a3;
  v12 = 0;
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_1EF12B920) & 1) != 0)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = (id)objc_msgSend(v13, "copyIdentifiers");
    v4 = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __40__CBStatusInfoHelper_copyStatusInfoFor___block_invoke;
    v8 = &unk_1E68EA760;
    v9 = v13;
    v10 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v4);

  }
  return v12;
}

void __40__CBStatusInfoHelper_copyStatusInfoFor___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 32), "copyPropertyInternalForKey:", a2);
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, a2);

    }
  }
}

@end
