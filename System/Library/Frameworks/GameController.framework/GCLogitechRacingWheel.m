@implementation GCLogitechRacingWheel

void __47___GCLogitechRacingWheel_observeGamepadEvents___block_invoke(uint64_t a1, const char *a2)
{
  id Property;
  uint64_t v4;
  id v5;
  void *v6;
  int v7;
  const char *v8;
  id v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;

  while (1)
  {
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, a2, 144, 1);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = Property;
    v6 = (void *)MEMORY[0x2199DEBB0](v4);
    v7 = objc_msgSend(v5, "containsObject:", v6);

    if (!v7)
      break;
    v9 = *(id *)(a1 + 32);
    if (v9)
      v9 = objc_getProperty(v9, v8, 144, 1);
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    v11 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
    objc_msgSend(v10, "removeObject:", v11);

    v13 = *(void **)(a1 + 32);
    if (v13)
      objc_setProperty_atomic_copy(v13, v12, v10, 144);

  }
}

@end
