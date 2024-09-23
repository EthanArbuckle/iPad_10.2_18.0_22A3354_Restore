@implementation NMSSHConfig

- (NMSSHConfig)initWithFile:(id)a3
{
  void *v4;
  NMSSHConfig *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", a3, 4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NMSSHConfig initWithString:](self, "initWithString:", v4);

  return v5;
}

- (NMSSHConfig)initWithString:(id)a3
{
  id v4;
  NMSSHConfig *v5;
  void *v6;
  NMSSHConfig *v7;
  objc_super v9;

  v4 = a3;
  if (!v4)
    goto LABEL_5;
  v9.receiver = self;
  v9.super_class = (Class)NMSSHConfig;
  v5 = -[NMSSHConfig init](&v9, sel_init);
  self = v5;
  if (!v5
    || (-[NMSSHConfig arrayFromString:](v5, "arrayFromString:", v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NMSSHConfig setHostConfigs:](self, "setHostConfigs:", v6),
        v6,
        self->_hostConfigs))
  {
    self = self;
    v7 = self;
  }
  else
  {
LABEL_5:
    v7 = 0;
  }

  return v7;
}

- (id)arrayFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    return 0;
  v5 = v4;
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\r\n"), CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[NMSSHConfig parseLine:intoArray:](self, "parseLine:intoArray:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), v8, (_QWORD)v16);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  v14 = (void *)objc_msgSend(v8, "copy");
  return v14;
}

- (void)parseLine:(id)a3 intoArray:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD14A8];
  v8 = a3;
  objc_msgSend(v7, "whitespaceCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v11 = -[NMSSHConfig rangeOfFirstTokenInString:suffix:](self, "rangeOfFirstTokenInString:suffix:", v10, &v16);
  v13 = v12;
  v14 = v16;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v10, "substringWithRange:", v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "hasPrefix:", CFSTR("#")) & 1) == 0 && objc_msgSend(v15, "length"))
    {
      if (objc_msgSend(v15, "localizedCaseInsensitiveCompare:", CFSTR("host")))
      {
        if (objc_msgSend(v15, "localizedCaseInsensitiveCompare:", CFSTR("hostname")))
        {
          if (objc_msgSend(v15, "localizedCaseInsensitiveCompare:", CFSTR("user")))
          {
            if (objc_msgSend(v15, "localizedCaseInsensitiveCompare:", CFSTR("port")))
            {
              if (!objc_msgSend(v15, "localizedCaseInsensitiveCompare:", CFSTR("identityfile")))
                -[NMSSHConfig parseIdentityFileWithArguments:intoArray:](self, "parseIdentityFileWithArguments:intoArray:", v14, v6);
            }
            else
            {
              -[NMSSHConfig parsePortWithArguments:intoArray:](self, "parsePortWithArguments:intoArray:", v14, v6);
            }
          }
          else
          {
            -[NMSSHConfig parseUserWithArguments:intoArray:](self, "parseUserWithArguments:intoArray:", v14, v6);
          }
        }
        else
        {
          -[NMSSHConfig parseHostNameWithArguments:intoArray:](self, "parseHostNameWithArguments:intoArray:", v14, v6);
        }
      }
      else
      {
        -[NMSSHConfig parseHostWithArguments:intoArray:](self, "parseHostWithArguments:intoArray:", v14, v6);
      }
    }

  }
}

- (void)parseHostWithArguments:(id)a3 intoArray:(id)a4
{
  id v6;
  id v7;
  NMSSHHostConfig *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(NMSSHHostConfig);
  v21 = 0;
  v9 = -[NMSSHConfig rangeOfFirstTokenInString:suffix:](self, "rangeOfFirstTokenInString:suffix:", v6, &v21);
  v11 = v10;
  v12 = v21;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = v6;
  }
  else
  {
    do
    {
      if (v11)
      {
        objc_msgSend(v6, "substringWithRange:", v9, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NMSSHHostConfig hostPatterns](v8, "hostPatterns");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "arrayByAddingObject:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NMSSHHostConfig setHostPatterns:](v8, "setHostPatterns:", v16);

      }
      v13 = v12;

      v20 = v13;
      v9 = -[NMSSHConfig rangeOfFirstTokenInString:suffix:](self, "rangeOfFirstTokenInString:suffix:", v13, &v20);
      v11 = v17;
      v12 = v20;

      v6 = v13;
    }
    while (v9 != 0x7FFFFFFFFFFFFFFFLL);
  }
  -[NMSSHHostConfig hostPatterns](v8, "hostPatterns");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
    objc_msgSend(v7, "addObject:", v8);

}

- (void)parseHostNameWithArguments:(id)a3 intoArray:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NMSSHConfig rangeOfFirstTokenInString:suffix:](self, "rangeOfFirstTokenInString:suffix:", v11, 0);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9)
    {
      objc_msgSend(v11, "substringWithRange:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHostname:", v10);

    }
  }

}

- (void)parseUserWithArguments:(id)a3 intoArray:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NMSSHConfig rangeOfFirstTokenInString:suffix:](self, "rangeOfFirstTokenInString:suffix:", v11, 0);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9)
    {
      objc_msgSend(v11, "substringWithRange:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUser:", v10);

    }
  }

}

- (void)parsePortWithArguments:(id)a3 intoArray:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NMSSHConfig rangeOfFirstTokenInString:suffix:](self, "rangeOfFirstTokenInString:suffix:", v13, 0);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9)
    {
      objc_msgSend(v13, "substringWithRange:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "intValue");
      if ((v11 & 0x80000000) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (unsigned __int16)v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setPort:", v12);

      }
    }

  }
}

- (void)parseIdentityFileWithArguments:(id)a3 intoArray:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NMSSHConfig rangeOfFirstTokenInString:suffix:](self, "rangeOfFirstTokenInString:suffix:", v14, 0);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9)
    {
      objc_msgSend(v14, "substringWithRange:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByExpandingTildeInPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "identityFiles");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "arrayByAddingObject:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setIdentityFiles:", v13);

    }
  }

}

- (id)blanksCharacterSet
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend(v2, "addCharactersInRange:", 32, 1);
  objc_msgSend(v2, "addCharactersInRange:", 9, 1);
  return v2;
}

- (_NSRange)rangeOfQuotedSubstringInString:(id)a3 startingAtIndex:(unint64_t)a4
{
  unint64_t v5;
  id v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v5 = a4 + 1;
  v6 = a3;
  v7 = objc_msgSend(v6, "rangeOfString:options:range:", CFSTR("\"), 0, v5, objc_msgSend(v6, "length") - v5);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v8 = a4 + 1;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = 0;
  else
    v9 = v7 - v5;
  result.length = v9;
  result.location = v8;
  return result;
}

- (_NSRange)rangeInString:(id)a3 fromLocationUntilBlankOrEnd:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  v6 = a3;
  v7 = objc_msgSend(v6, "length") - a4;
  -[NMSSHConfig blanksCharacterSet](self, "blanksCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", v8, 0, a4, v7);
  v11 = v10;

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    v12 = v7;
  else
    v12 = v11 + ~a4 + v9;
  v13 = a4;
  result.length = v12;
  result.location = v13;
  return result;
}

- (_NSRange)rangeOfFirstTokenInString:(id)a3 suffix:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  _NSRange result;

  v6 = a3;
  -[NMSSHConfig blanksCharacterSet](self, "blanksCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v8, "invert");
  v9 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v8);
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v10;
    goto LABEL_10;
  }
  v13 = v9;
  if (objc_msgSend(v6, "characterAtIndex:", v9) != 34)
  {
    v17 = -[NMSSHConfig rangeInString:fromLocationUntilBlankOrEnd:](self, "rangeInString:fromLocationUntilBlankOrEnd:", v6, v13);
    v11 = v17;
    v12 = v18;
    if (!a4)
      goto LABEL_10;
    v16 = v17 + v18;
LABEL_9:
    objc_msgSend(v6, "substringFromIndex:", v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v14 = -[NMSSHConfig rangeOfQuotedSubstringInString:startingAtIndex:](self, "rangeOfQuotedSubstringInString:startingAtIndex:", v6, v13);
  v11 = v14;
  v12 = v15;
  if (a4 && v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = v15 + v14 + 1;
    goto LABEL_9;
  }
LABEL_10:

  v19 = v11;
  v20 = v12;
  result.length = v20;
  result.location = v19;
  return result;
}

- (id)hostConfigForHost:(id)a3
{
  id v4;
  NMSSHHostConfig *v5;
  NSArray *v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t j;
  int v15;
  NMSSHHostConfig *v16;
  NMSSHHostConfig *v17;
  char v19;
  NMSSHHostConfig *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(NMSSHHostConfig);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = self->_hostConfigs;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v22)
  {
    v19 = 0;
    v20 = v5;
    v21 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v6);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v8, "hostPatterns");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v24;
          v13 = 2;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v24 != v12)
                objc_enumerationMutation(v9);
              v15 = -[NMSSHConfig host:matchesPatternList:](self, "host:matchesPatternList:", v4, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
              if (v15)
              {
                if (v15 == 1)
                  goto LABEL_19;
              }
              else
              {
                v13 = 0;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v11);

          if (!v13)
          {
            -[NMSSHHostConfig mergeFrom:](v20, "mergeFrom:", v8);
            v19 = 1;
          }
        }
        else
        {
LABEL_19:

        }
      }
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v22);

    v5 = v20;
    if ((v19 & 1) != 0)
      v16 = v20;
    else
      v16 = 0;
  }
  else
  {

    v16 = 0;
  }
  v17 = v16;

  return v17;
}

- (int)host:(id)a3 matchesPatternList:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  void *v13;
  int v14;
  uint64_t v15;
  _BOOL4 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(a4, "componentsSeparatedByString:", CFSTR(","));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    v11 = 2;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "lowercaseString", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("!"));
        if (v14)
        {
          objc_msgSend(v13, "substringFromIndex:", 1);
          v15 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v15;
        }
        v16 = -[NMSSHConfig host:matchesSubpattern:](self, "host:matchesSubpattern:", v6, v13);

        if ((v14 & v16 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_16;
        }
        if (v16)
          v11 = 0;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v11 = 2;
  }
LABEL_16:

  return v11;
}

- (BOOL)host:(id)a3 matchesSubpattern:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  int v15;
  unint64_t v16;
  int v17;
  int v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v23;
  int v24;
  void *v25;
  void *v26;
  BOOL v27;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (!v6 || !v7)
    goto LABEL_28;
  v10 = objc_msgSend(v7, "length");
  v11 = objc_msgSend(v6, "length");
  if (!v10)
  {
LABEL_10:
    v9 = v10 == v11;
    goto LABEL_28;
  }
  v12 = 0;
  while (1)
  {
    v13 = objc_msgSend(v8, "characterAtIndex:", v12);
    if (v13 == 42)
      break;
    if (v11 == v12)
      goto LABEL_27;
    v14 = v13;
    v15 = objc_msgSend(v6, "characterAtIndex:", v12);
    if (v14 != 63 && v14 != v15)
      goto LABEL_27;
    if (v10 == ++v12)
      goto LABEL_10;
  }
  v16 = v12 + 1;
  if (v12 + 1 == v10)
  {
LABEL_12:
    v9 = 1;
    goto LABEL_28;
  }
  v17 = objc_msgSend(v8, "characterAtIndex:", v12 + 1);
  if (v17 != 63)
  {
    v18 = v17;
    if (v17 != 42)
    {
      if (v12 < v11)
      {
        v23 = v12 + 2;
        while (1)
        {
          v24 = objc_msgSend(v6, "characterAtIndex:", v12++);
          if (v24 == v18)
          {
            objc_msgSend(v6, "substringFromIndex:", v12);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "substringFromIndex:", v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = -[NMSSHConfig host:matchesSubpattern:](self, "host:matchesSubpattern:", v25, v26);

            if (v27)
              goto LABEL_12;
          }
          v9 = 0;
          if (v11 == v12)
            goto LABEL_28;
        }
      }
      goto LABEL_27;
    }
  }
  if (v12 >= v11)
  {
LABEL_27:
    v9 = 0;
    goto LABEL_28;
  }
  v19 = v11 - 1;
  do
  {
    objc_msgSend(v6, "substringFromIndex:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "substringFromIndex:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NMSSHConfig host:matchesSubpattern:](self, "host:matchesSubpattern:", v20, v21);

    if (v9)
      break;
  }
  while (v19 != v12++);
LABEL_28:

  return v9;
}

- (NSArray)hostConfigs
{
  return self->_hostConfigs;
}

- (void)setHostConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_hostConfigs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostConfigs, 0);
}

+ (id)configFromFile:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFile:", v4);

  return v5;
}

@end
