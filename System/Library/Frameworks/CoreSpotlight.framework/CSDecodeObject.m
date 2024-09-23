@implementation CSDecodeObject

void ___CSDecodeObject_block_invoke_4(uint64_t a1, const char *a2, uint64_t a3, __int128 *a4)
{
  uint64_t v6;
  void *v7;
  BOOL v8;
  __CFString *v9;
  __int128 v10;
  uint64_t v11;

  v9 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, 0x8000100u);
  v6 = *(_QWORD *)(a1 + 32);
  v10 = *a4;
  v11 = *((_QWORD *)a4 + 2);
  _CSDecodeObject(&v10, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v9);

}

void ___CSDecodeObject_block_invoke_3(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = *a2;
  v7 = *((_QWORD *)a2 + 2);
  _CSDecodeObject(&v6, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    v4 = v5;
  }

}

void ___CSDecodeObject_block_invoke(uint64_t a1, const char *a2, uint64_t a3, __int128 *a4)
{
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __int128 v9;
  uint64_t v10;

  v8 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, 0x8000100u);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = *a4;
  v10 = *((_QWORD *)a4 + 2);
  _CSDecodeObject(&v9, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(*(id *)(a1 + 40), "setAttribute:forKey:", v7, v8);

}

void ___CSDecodeObject_block_invoke_2(uint64_t a1, const char *a2, uint64_t a3, __int128 *a4)
{
  __CFString *v6;
  unint64_t IntValue;
  void *v8;
  CSCustomAttributeKey *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v6 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, 0x8000100u);
  v11 = *a4;
  v12 = *((_QWORD *)a4 + 2);
  if (_MDPlistGetPlistObjectType() == 240)
  {
    v11 = *a4;
    v12 = *((_QWORD *)a4 + 2);
    if (_MDPlistArrayGetCount() == 2)
    {
      v11 = *a4;
      v12 = *((_QWORD *)a4 + 2);
      _MDPlistArrayGetPlistObjectAtIndex();
      IntValue = _MDPlistNumberGetIntValue();
      v11 = *a4;
      v12 = *((_QWORD *)a4 + 2);
      _MDPlistArrayGetPlistObjectAtIndex();
      _CSDecodeObject(&v10, *(_QWORD *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = -[CSCustomAttributeKey initWithKeyName:searchable:searchableByDefault:unique:multiValued:]([CSCustomAttributeKey alloc], "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", v6, IntValue & 1, (IntValue >> 1) & 1, (IntValue >> 2) & 1, (IntValue >> 3) & 1);
        objc_msgSend(*(id *)(a1 + 40), "setValue:forCustomKey:", v8, v9);

      }
    }
  }

}

@end
