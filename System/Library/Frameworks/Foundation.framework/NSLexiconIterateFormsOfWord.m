@implementation NSLexiconIterateFormsOfWord

uint64_t ___NSLexiconIterateFormsOfWord_block_invoke(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t ___NSLexiconIterateFormsOfWord_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "capitalizedStringWithLocale:", *(_QWORD *)(a1 + 40));
    return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  return result;
}

uint64_t ___NSLexiconIterateFormsOfWord_block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lowercaseStringWithLocale:", *(_QWORD *)(a1 + 32));
}

uint64_t ___NSLexiconIterateFormsOfWord_block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uppercaseStringWithLocale:", *(_QWORD *)(a1 + 32));
}

uint64_t ___NSLexiconIterateFormsOfWord_block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "capitalizedStringWithLocale:", *(_QWORD *)(a1 + 32));
}

@end
