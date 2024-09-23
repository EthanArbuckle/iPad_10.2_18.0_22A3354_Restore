uint64_t CFStringHashNSString(void *a1)
{
  uint64_t v2;
  unsigned __int16 *v3;
  unsigned __int16 *v4;
  unsigned __int16 *v5;
  int v6;
  int v7;
  _WORD v9[32];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "length");
  v3 = v9;
  if (v2 >= 97)
  {
    objc_msgSend(a1, "getCharacters:range:", v9, 0, 32);
    objc_msgSend(a1, "getCharacters:range:", &v10, ((unint64_t)v2 >> 1) - 16, 32);
    objc_msgSend(a1, "getCharacters:range:", &v11, v2 - 32, 32);
    v4 = (unsigned __int16 *)&v12;
    v5 = (unsigned __int16 *)&v12;
LABEL_5:
    v3 = v9;
    v6 = v2;
    do
    {
      v6 = 67503105 * v6 + 16974593 * *v3 + 66049 * v3[1] + 257 * v3[2] + v3[3];
      v3 += 4;
    }
    while (v3 < v5);
    goto LABEL_10;
  }
  objc_msgSend(a1, "getCharacters:range:", v9, 0, v2);
  v4 = &v9[v2];
  if ((uint64_t)(v2 & 0xFFFFFFFFFFFFFFFCLL) >= 1)
  {
    v5 = &v9[v2 & 0xFFFFFFFFFFFFFFFCLL];
    goto LABEL_5;
  }
  v6 = v2;
LABEL_10:
  while (v3 < v4)
  {
    v7 = *v3++;
    v6 = 257 * v6 + v7;
  }
  return ((v6 << v2) + v6);
}

uint64_t _NSConstantDictionaryKeyHash(void *a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return CFStringHashNSString(a1);
  else
    return objc_msgSend(a1, "hash");
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

