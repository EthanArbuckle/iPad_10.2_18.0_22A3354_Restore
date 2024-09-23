@implementation NSJSONReader

BOOL __51___NSJSONReader_validForJSON_depth_allowFragments___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _BOOL8 result;

  result = +[_NSJSONReader validForJSON:depth:allowFragments:](_NSJSONReader, "validForJSON:depth:allowFragments:", a2, *(_QWORD *)(a1 + 40) + 1, 1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a4 = 1;
  return result;
}

uint64_t __51___NSJSONReader_validForJSON_depth_allowFragments___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    result = +[_NSJSONReader validForJSON:depth:allowFragments:](_NSJSONReader, "validForJSON:depth:allowFragments:", a3, *(_QWORD *)(a1 + 40) + 1, 1);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      return result;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  *a4 = 1;
  return result;
}

@end
