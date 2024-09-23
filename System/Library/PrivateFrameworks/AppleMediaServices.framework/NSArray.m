@implementation NSArray

BOOL __68__NSArray_AppleMediaServices__ams_nonEmptyComponentsJoinedByString___block_invoke(void *a1)
{
  id v1;
  id v2;
  _BOOL4 v3;
  _BOOL8 v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v3 = (objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v1, "length") != 0;
  v4 = v2 != v1 && v3;

  return v4;
}

id __59__NSArray_AppleMediaServices__ams_sanitizedForSecureCoding__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "ams_sanitizedForSecureCoding");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_opt_class(), "supportsSecureCoding"))
    {
      v3 = v2;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v4 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v2, "description");
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v4 = v3;
LABEL_9:

  return v4;
}

void __72__NSArray_AppleMediaServices__ams_enumerateObjectsForArrays_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__NSArray_AppleMediaServices__ams_enumerateObjectsForArrays_usingBlock___block_invoke_2;
  v7[3] = &unk_1E2547880;
  v8 = *(id *)(a1 + 32);
  v9 = a3;
  v10 = a4;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __72__NSArray_AppleMediaServices__ams_enumerateObjectsForArrays_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  char v7;

  v7 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  **(_BYTE **)(a1 + 48) = v7;
  *a4 = v7;
  return result;
}

id __68__NSArray_AppleMediaServices__ams_invertedDictionaryUsingTransform___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v7;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You cannot return nil from the block."), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v5 = (void *)v4;

  return v5;
}

@end
