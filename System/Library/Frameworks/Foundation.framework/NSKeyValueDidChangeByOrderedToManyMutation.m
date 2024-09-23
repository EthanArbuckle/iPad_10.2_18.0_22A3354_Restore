@implementation NSKeyValueDidChangeByOrderedToManyMutation

uint64_t __NSKeyValueDidChangeByOrderedToManyMutation_block_invoke_2(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  void *v7;

  v4 = a2 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v4 >= *(_QWORD *)(a1 + 64))
    v5 = 0;
  else
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8 * v4);
  if (*(_QWORD *)(a1 + 80) <= a2)
    result = 0;
  else
    result = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  if (v5 == result)
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v7)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    return objc_msgSend(v7, "removeIndex:", a2);
  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  return result;
}

uint64_t __NSKeyValueDidChangeByOrderedToManyMutation_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  void *v6;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * a2);
  result = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  if (v4 == result)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v6)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    return objc_msgSend(v6, "removeIndex:", a2);
  }
  return result;
}

@end
