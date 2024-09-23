@implementation NSString(HTMLStrings)

- (uint64_t)ic_HTMLInsertionPoint
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char v16;

  v2 = objc_msgSend(a1, "length");
  v3 = objc_msgSend(a1, "_HTMLRangeOfLastTagBeforeIndex:", objc_msgSend(a1, "length"));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3;
    objc_msgSend(a1, "substringWithRange:", v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v6, "_HTMLTagNameClosing:", &v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v16)
    {
      if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("html")))
      {
        v9 = v5;
        v5 = v2;
      }
      else
      {
        v10 = objc_msgSend(a1, "_HTMLRangeOfLastTagBeforeIndex:", v5);
        v9 = 0x7FFFFFFFFFFFFFFFLL;
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = v10;
          objc_msgSend(a1, "substringWithRange:", v10, v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "_HTMLTagNameClosing:", &v16);
          v14 = objc_claimAutoreleasedReturnValue();

          v6 = v13;
          v8 = (void *)v14;
          v9 = v12;
        }
      }
      if (v16)
      {
        if (objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("body")))
          v2 = v5;
        else
          v2 = v9;
      }
      else
      {
        v2 = v5;
      }
    }

  }
  return v2;
}

- (uint64_t)_HTMLRangeOfLastTagBeforeIndex:()HTMLStrings
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;

  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v6, "addCharactersInString:", CFSTR(">"));
  v7 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v6, 4, 0, a3);
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v7;
    objc_msgSend(a1, "substringWithRange:", v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR(">"));

    v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v12)
    {
      v13 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("<"), 4, 0, v10);
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        v9 = v13;
    }
  }

  return v9;
}

- (id)_HTMLTagNameClosing:()HTMLStrings
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  id v17;
  _QWORD aBlock[4];
  id v19;

  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v6, "addCharactersInString:", CFSTR("/>"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", a1);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__NSString_HTMLStrings___HTMLTagNameClosing___block_invoke;
  aBlock[3] = &unk_1EA825178;
  v8 = v7;
  v19 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v8, "setCharactersToBeSkipped:", 0);
  objc_msgSend(v8, "scanUpToCharactersFromSet:intoString:", v6, 0);
  objc_msgSend(v6, "removeCharactersInString:", CFSTR("/"));
  v9[2](v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("/"));

  if (v11)
  {
    if (a3)
      *a3 = 1;
    objc_msgSend(v8, "scanUpToCharactersFromSet:intoString:", v6, 0);
  }
  else if (a3)
  {
    *a3 = 0;
  }
  v9[2](v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "length"))
    goto LABEL_11;
  v13 = 0;
  if (objc_msgSend(v5, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", 0)))
  {
    objc_msgSend(v5, "invertedSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v15 = objc_msgSend(v8, "scanUpToCharactersFromSet:intoString:", v14, &v17);
    v13 = v17;

    if ((v15 & 1) == 0)
    {

LABEL_11:
      v13 = 0;
    }
  }

  return v13;
}

@end
