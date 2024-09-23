@implementation NSDictionary(CBPropertyKeyExtension)

- (id)initWithPropertyKey:()CBPropertyKeyExtension andDisplay:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a1;
  v8 = a2;
  v7 = a3;
  v6 = a4;
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a4);
  if (v5)
    v9 = (id)objc_msgSend(v9, "initWithObjectsAndKeys:", v5, CFSTR("Display"), v7, CFSTR("String"), 0);
  else
    v9 = 0;

  return v9;
}

- (id)initWithPropertyKey:()CBPropertyKeyExtension display:andParameter:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a1;
  v10 = a2;
  v9 = a3;
  v8 = a4;
  v7 = a5;
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a4);
  if (v6)
    v11 = (id)objc_msgSend(v11, "initWithObjectsAndKeys:", v6, CFSTR("Display"), v9, CFSTR("String"), v7, CFSTR("Parameter"), 0);
  else
    v11 = 0;

  return v11;
}

- (uint64_t)initWithPropertyKey:()CBPropertyKeyExtension
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a1;
  v5 = a2;
  v4 = a3;
  if (a3)
    return objc_msgSend(v6, "initWithObjectsAndKeys:", v4, CFSTR("String"), 0);
  else
    return 0;
}

- (id)initWithPropertyKey:()CBPropertyKeyExtension andCategory:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a1;
  v8 = a2;
  v7 = a3;
  v6 = a4;
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a4);
  if (v5)
    v9 = (id)objc_msgSend(v9, "initWithObjectsAndKeys:", v5, CFSTR("Category"), v7, CFSTR("String"), 0);
  else
    v9 = 0;

  return v9;
}

- (uint64_t)getKeyString
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("String"), a2, a1);
}

- (uint64_t)getKeyDisplayID
{
  void *v2;
  uint64_t v3;

  v3 = 0;
  v2 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("Display"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v2, "unsignedIntegerValue");
  return v3;
}

- (uint64_t)getKeyDisplayIDRef
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("Display"), a2, a1);
}

- (uint64_t)getKeyCategory
{
  void *v2;
  uint64_t v3;

  v3 = 0;
  v2 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("Category"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v2, "unsignedIntegerValue");
  return v3;
}

- (uint64_t)getKeyCategoryRef
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("Category"), a2, a1);
}

- (uint64_t)getKeyPropertyParameter
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("Parameter"), a2, a1);
}

- (id)initWithPropertyKey:()CBPropertyKeyExtension keyboardID:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a1;
  v8 = a2;
  v7 = a3;
  v6 = a4;
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a4);
  if (v5)
    v9 = (id)objc_msgSend(v9, "initWithObjectsAndKeys:", v5, CFSTR("Keyboard"), v7, CFSTR("String"), 0);
  else
    v9 = 0;

  return v9;
}

- (uint64_t)getKeyKeyboardID
{
  void *v2;
  uint64_t v3;

  v3 = 0;
  v2 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("Keyboard"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v2, "unsignedIntegerValue");
  return v3;
}

- (uint64_t)getKeyKeyboardIDRef
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("Keyboard"), a2, a1);
}

@end
