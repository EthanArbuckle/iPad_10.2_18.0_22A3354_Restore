@implementation MTLSerializePluginDataDictionary

void *__MTLSerializePluginDataDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  size_t v6;
  void *result;
  size_t v8;
  uint64_t v9;
  _WORD *v10;
  _WORD *v11;

  v6 = objc_msgSend(a2, "length");
  result = (void *)objc_msgSend(a3, "length");
  v8 = (size_t)result;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    v10 = (_WORD *)(v9 + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    *v10 = v6;
    v10[1] = (_WORD)result;
    v11 = v10 + 2;
    memcpy(v10 + 2, (const void *)objc_msgSend(a2, "UTF8String"), v6);
    result = memcpy((char *)v11 + v6, (const void *)objc_msgSend(a3, "bytes"), v8);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v6 + v8 + 4;
  return result;
}

@end
