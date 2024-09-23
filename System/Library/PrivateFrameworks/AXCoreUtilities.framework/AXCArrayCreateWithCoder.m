@implementation AXCArrayCreateWithCoder

void __AXCArrayCreateWithCoder_block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  void (**v6)(id, id);
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("%@.%@"), *(_QWORD *)(a1 + 32), v7);

  v6[2](v6, v8);
}

uint64_t __AXCArrayCreateWithCoder_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __AXCArrayCreateWithCoder_block_invoke_3;
  v7[3] = &unk_1E28C28C0;
  v9 = &v10;
  v4 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, id, _QWORD *))(v4 + 16))(v4, v3, v7);
  v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __AXCArrayCreateWithCoder_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "decodeInt32ForKey:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (int)result;
  return result;
}

void __AXCArrayCreateWithCoder_block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  const void *v4;
  void *v5;
  size_t size;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsValueForKey:", v3))
  {
    size = 0;
    v4 = (const void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "decodeBytesForKey:returnedLength:", v3, &size);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 16) = malloc_type_malloc(size, 0x4A618A81uLL);
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 16);
    if (v5)
    {
      memcpy(v5, v4, size);
    }
    else
    {
      CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }

}

@end
