@implementation HIDEvent(HIDEventDesc)

- (void)enumerateFieldsWithBlock:()HIDEventDesc
{
  uint64_t v4;
  uint64_t i;
  void (**v6)(id, _QWORD);

  v6 = a3;
  if (v6)
  {
    v4 = objc_msgSend(a1, "getEventFields");
    if (v4)
    {
      for (i = v4; *(_DWORD *)i || (*(_BYTE *)(i + 4) & 0x3F) != 0 || *(_QWORD *)(i + 8); i += 16)
        v6[2](v6, i);
    }
  }

}

- (uint64_t)getEventFields
{
  uint64_t i;
  int v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *j;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  for (i = 0; i != 39; ++i)
  {
    v3 = *((_DWORD *)&hidEventFieldDescTable + 6 * i);
    if (v3 == objc_msgSend(a1, "type"))
    {
      if (((0xFCFFFEFFBFuLL >> i) & 1) != 0)
      {
        result = *((_QWORD *)&hidEventFieldDescTable + 3 * i + 1);
        goto LABEL_15;
      }
      v4 = *((_QWORD *)&hidEventFieldDescTable + 3 * i + 2);
      v5 = (_QWORD *)(v4 + 8);
      if (*(_QWORD *)(v4 + 8))
      {
        v6 = 0;
        do
        {
          v7 = objc_msgSend(a1, "integerValueForField:", *(unsigned int *)(v4 + 16 * v6));
          for (j = (uint64_t *)(*v5 + 8); ; j += 2)
          {
            result = *j;
            if (!*j)
              break;
            v10 = *((unsigned int *)j - 2);
            if (v7 == v10)
              return result;
          }
          ++v6;
          v11 = v4 + 16 * v6;
          v12 = *(_QWORD *)(v11 + 8);
          v5 = (_QWORD *)(v11 + 8);
        }
        while (v12);
        goto LABEL_15;
      }
    }
    result = 0;
LABEL_15:
    if (result)
      return result;
  }
  return 0;
}

@end
