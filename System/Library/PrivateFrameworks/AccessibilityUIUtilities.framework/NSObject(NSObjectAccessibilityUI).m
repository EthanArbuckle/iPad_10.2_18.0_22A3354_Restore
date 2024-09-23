@implementation NSObject(NSObjectAccessibilityUI)

- (id)_accessibilityUIFindAnyAXDescendant:()NSObjectAccessibilityUI byAddingElements:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v14;

  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__NSObject_NSObjectAccessibilityUI___accessibilityUIFindAnyAXDescendant_byAddingElements___block_invoke;
  aBlock[3] = &unk_1E76ABDB0;
  v14 = v6;
  v7 = v6;
  v8 = a4;
  v9 = _Block_copy(aBlock);
  objc_msgSend(a1, "_accessibilityUIFindAXDescendants:byAddingElements:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_accessibilityUIFindAXDescendants:()NSObjectAccessibilityUI byAddingElements:
{
  unsigned int (**v6)(id, void *, _BYTE *);
  void (**v7)(id, void *, void *);
  void *v8;
  void *v9;
  void *v10;
  char v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "init");
  objc_msgSend(v8, "addObject:", a1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  while (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeLastObject");
    v12 = 0;
    if (v6[2](v6, v10, &v12))
      objc_msgSend(v9, "addObject:", v10);
    if (v12)
    {

      break;
    }
    v7[2](v7, v8, v10);

  }
  return v9;
}

- (uint64_t)_accessibilityUIFindSubviewDescendant:()NSObjectAccessibilityUI
{
  return objc_msgSend(a1, "_accessibilityUIFindAnyAXDescendant:byAddingElements:", a3, &__block_literal_global_11);
}

@end
