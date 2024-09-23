@implementation NSString(CGAdditions)

- (uint64_t)enumerateComponentsSeparatedByCharactersInSet:()CGAdditions usingBlock:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v16 = 0;
  v7 = objc_msgSend(a1, "length");
  v8 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", a3, 0, 0, v7);
  if (v9)
  {
    v10 = v8;
    v11 = v9;
    v12 = 0;
    while (1)
    {
      if (v10 != v12)
      {
        result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(a4 + 16))(a4, v12, v10 - v12, &v16);
        if (v16)
          break;
      }
      v12 = v10 + v11;
      v14 = v7 - (v10 + v11);
      result = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", a3, 0, v10 + v11, v14);
      v10 = result;
      v11 = v15;
      if (!v15)
      {
        if (v7 == v12)
          return result;
        v7 = v14;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(a4 + 16))(a4, v12, v7, &v16);
      }
    }
  }
  else
  {
    v12 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(a4 + 16))(a4, v12, v7, &v16);
  }
  return result;
}

@end
