@implementation NSObject

uint64_t __90__NSObject_NSObjectAccessibilityUI___accessibilityUIFindAnyAXDescendant_byAddingElements___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (a3)
  {
    if ((_DWORD)result)
      *a3 = 1;
  }
  return result;
}

void __75__NSObject_NSObjectAccessibilityUI___accessibilityUIFindSubviewDescendant___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v5, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reverseObjectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

uint64_t __53__NSObject_QSSupport__accessibilityQuickSpeakContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
  result = objc_msgSend(*(id *)(a1 + 40), "count");
  if (result - 1 != a3)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  return result;
}

BOOL __58__NSObject_QSSupport__accessibilitySentenceRectsForRange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "end");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "comparePosition:toPosition:", v4, v5);

  return v6 > 1;
}

BOOL __65__NSObject_AXATV_Extras___atvaccessibilityGeometricNearestHeader__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "accessibilityTraits");
  return (*MEMORY[0x1E0DC4670] & v2) != 0;
}

@end
