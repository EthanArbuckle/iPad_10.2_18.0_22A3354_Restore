@implementation SGStringPreprocessor

- (SGStringPreprocessor)init
{
  SGStringPreprocessor *v2;
  uint64_t v3;
  NSMutableData *buffer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGStringPreprocessor;
  v2 = -[SGStringPreprocessor init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    buffer = v2->_buffer;
    v2->_buffer = (NSMutableData *)v3;

  }
  return v2;
}

- (unsigned)bufferPtrWithMinimumLength:(unint64_t)a3
{
  unint64_t v4;
  NSUInteger v5;
  unint64_t v6;

  v4 = 2 * a3;
  v5 = -[NSMutableData length](self->_buffer, "length");
  v6 = v4 - v5;
  if (v4 > v5)
    -[NSMutableData increaseLengthBy:](self->_buffer, "increaseLengthBy:", v6);
  return (unsigned __int16 *)-[NSMutableData mutableBytes](self->_buffer, "mutableBytes", v6);
}

- (void)replace:(id)a3 withBuffer:(unsigned __int16 *)a4 toIndex:(unint64_t)a5
{
  objc_class *v7;
  __CFString *v8;
  __CFString *v9;

  v7 = (objc_class *)MEMORY[0x24BDD17C8];
  v8 = (__CFString *)a3;
  v9 = (__CFString *)objc_msgSend([v7 alloc], "initWithCharactersNoCopy:length:freeWhenDone:", a4, a5, 0);
  CFStringReplaceAll(v8, v9);

}

- (void)removeCharacters:(id)a3 withExceptions:(id)a4 fromString:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int16 *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "length");
  if (v11)
  {
    v12 = v11;
    v13 = -[SGStringPreprocessor bufferPtrWithMinimumLength:](self, "bufferPtrWithMinimumLength:", v11);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v14 = MEMORY[0x24BDAC760];
    v15 = v8;
    v16 = v9;
    _PASIterateLongChars();
    if (v18[3] != v12)
      -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v10, v13, v14, 3221225472, __67__SGStringPreprocessor_removeCharacters_withExceptions_fromString___block_invoke, &unk_24DDC4058, v15, v16, &v17, v13);

    _Block_object_dispose(&v17, 8);
  }

}

- (id)characterSetFromString:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 1)
  {
    v4 = (void *)MEMORY[0x24BDD14A8];
    v5 = objc_msgSend(v3, "characterAtIndex:", 0);

    objc_msgSend(v4, "characterSetWithRange:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _PASCharacterSetWithCharactersInString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)lowerCase:(id)a3
{
  CFStringLowercase((CFMutableStringRef)a3, 0);
}

- (void)separateCharacter:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned __int16 *v11;
  __CFString *v12;
  void *v13;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v17;
  int64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFIndex v23;
  UniChar v24;
  unsigned __int16 *v25;
  int64_t v26;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  CFIndex v31;
  void *v32;
  void *v33;
  __CFString *v34;
  id v35;
  id v36;
  char v37;
  const __CFCharacterSet *theSet;
  UniChar buffer[8];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CFStringRef theString;
  const UniChar *v49;
  const char *v50;
  uint64_t v51;
  CFIndex v52;
  int64_t v53;
  int64_t v54;
  CFRange v55;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGStringPreprocessingTransformer.m"), 256, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value.length == 1"));

  }
  v8 = objc_msgSend(v6, "length");
  if (!v8)
    goto LABEL_43;
  v9 = v8;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  theSet = (const __CFCharacterSet *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "characterAtIndex:", 0);
  if ((v10 & 0xF800 | 0x400) == 0xDC00)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGStringPreprocessingTransformer.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!CFUniCharIsSurrogateHighCharacter(separator) && !CFUniCharIsSurrogateLowCharacter(separator)"));

  }
  v11 = -[SGStringPreprocessor bufferPtrWithMinimumLength:](self, "bufferPtrWithMinimumLength:", v9);
  v12 = (__CFString *)v6;
  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_39;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  *(_OWORD *)buffer = 0u;
  v41 = 0u;
  Length = CFStringGetLength(v12);
  theString = v12;
  v51 = 0;
  v52 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v12);
  CStringPtr = 0;
  v49 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v12, 0x600u);
  v53 = 0;
  v54 = 0;
  v50 = CStringPtr;
  if (Length < 1)
  {
LABEL_39:

    goto LABEL_42;
  }
  v34 = v12;
  v35 = v7;
  v36 = v6;
  v17 = 0;
  v18 = 0;
  v37 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 64;
  do
  {
    if ((unint64_t)v18 >= 4)
      v22 = 4;
    else
      v22 = v18;
    v23 = v52;
    if (v52 <= v18)
    {
      v24 = 0;
    }
    else if (v49)
    {
      v24 = v49[v18 + v51];
    }
    else if (v50)
    {
      v24 = v50[v51 + v18];
    }
    else
    {
      v26 = v53;
      if (v54 <= v18 || v53 > v18)
      {
        v28 = v22 + v17;
        v29 = v21 - v22;
        v30 = v18 - v22;
        v31 = v30 + 64;
        if (v30 + 64 >= v52)
          v31 = v52;
        v53 = v30;
        v54 = v31;
        if (v52 >= v29)
          v23 = v29;
        v55.length = v23 + v28;
        v55.location = v30 + v51;
        CFStringGetCharacters(theString, v55, buffer);
        v26 = v53;
      }
      v24 = buffer[v18 - v26];
    }
    if (v10 == v24 || (v19 & 1) == 0)
    {
      if (v10 != v24)
      {
LABEL_24:
        v19 = 0;
        v11[v20++] = v24;
        goto LABEL_25;
      }
    }
    else if (!CFCharacterSetIsCharacterMember(theSet, v24))
    {
      goto LABEL_24;
    }
    if ((v19 & 1) == 0)
    {
      v9 += 2;
      v11 = -[SGStringPreprocessor bufferPtrWithMinimumLength:](self, "bufferPtrWithMinimumLength:", v9);
      v25 = &v11[v20];
      *v25 = 32;
      v25[1] = v10;
      v20 += 3;
      v25[2] = 32;
      v37 = 1;
    }
    v19 = 1;
LABEL_25:
    ++v18;
    --v17;
    ++v21;
  }
  while (Length != v18);

  v7 = v35;
  v6 = v36;
  if ((v37 & 1) != 0)
    -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v34, v11, v20);
LABEL_42:

LABEL_43:
}

- (void)separateFrenchElisions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int16 *v7;
  __CFString *v8;
  void *v9;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFIndex v16;
  UniChar *v17;
  int64_t v18;
  unsigned __int16 v19;
  _QWORD *v20;
  int64_t v22;
  int64_t v24;
  uint64_t i;
  id v26;
  SGStringPreprocessor *v27;
  UniChar buffer[8];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CFStringRef theString;
  UniChar *v37;
  const char *v38;
  uint64_t v39;
  CFIndex v40;
  int64_t v41;
  int64_t v42;
  _OWORD v43[7];
  uint64_t v44;
  uint64_t v45;
  CFRange v46;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v6 = v5;
    v43[4] = xmmword_24DDC40B8;
    v43[5] = *(_OWORD *)&off_24DDC40C8;
    v43[6] = xmmword_24DDC40D8;
    v44 = 0;
    v43[0] = xmmword_24DDC4078;
    v43[1] = *(_OWORD *)&off_24DDC4088;
    v43[2] = xmmword_24DDC4098;
    v43[3] = *(_OWORD *)&off_24DDC40A8;
    v7 = -[SGStringPreprocessor bufferPtrWithMinimumLength:](self, "bufferPtrWithMinimumLength:", v5);
    v8 = (__CFString *)v4;
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      *(_OWORD *)buffer = 0u;
      v29 = 0u;
      Length = CFStringGetLength(v8);
      theString = v8;
      v39 = 0;
      v40 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v8);
      CStringPtr = 0;
      v37 = (UniChar *)CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
      v26 = v4;
      v27 = self;
      v41 = 0;
      v42 = 0;
      v38 = CStringPtr;
      if (Length >= 1)
      {
        v13 = 0;
        v14 = 0;
        v15 = v6;
        while (1)
        {
          v16 = v40;
          if (v40 <= v13)
          {
            v19 = 0;
            goto LABEL_24;
          }
          v17 = v37;
          if (v37)
          {
            v18 = v39 + v13;
          }
          else
          {
            if (v38)
            {
              v19 = v38[v39 + v13];
              goto LABEL_14;
            }
            v22 = v41;
            if (v42 <= v13 || v41 > v13)
            {
              v24 = v13 - 4;
              if ((unint64_t)v13 < 4)
                v24 = 0;
              if (v24 + 64 < v40)
                v16 = v24 + 64;
              v41 = v24;
              v42 = v16;
              v46.location = v39 + v24;
              v46.length = v16 - v24;
              CFStringGetCharacters(theString, v46, buffer);
              v22 = v41;
            }
            v18 = v13 - v22;
            v17 = buffer;
          }
          v19 = v17[v18];
LABEL_14:
          if (v19 > 0x2017u)
          {
            if (v19 - 8216 > 1)
              goto LABEL_24;
          }
          else if (v19 != 39 && v19 != 96 && v19 != 180)
          {
            goto LABEL_24;
          }
          if (*(_QWORD *)&v43[0])
          {
            v20 = (_QWORD *)v43 + 1;
            while (-[__CFString rangeOfString:options:range:](v8, "rangeOfString:options:range:") == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (!*v20++)
                goto LABEL_24;
            }
            v7 = -[SGStringPreprocessor bufferPtrWithMinimumLength:](v27, "bufferPtrWithMinimumLength:", ++v15);
            v7[v14++] = 39;
            v7[v14] = 32;
            goto LABEL_25;
          }
LABEL_24:
          v7[v14] = v19;
LABEL_25:
          ++v14;
          if (++v13 == Length)
            goto LABEL_40;
        }
      }
      v14 = 0;
LABEL_40:
      v4 = v26;
      self = v27;
    }
    else
    {
      v14 = 0;
    }

    if (v14 != v6)
      -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v8, v7, v14);
    for (i = 112; i != -8; i -= 8)

  }
}

- (void)removeCharacters:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[SGStringPreprocessor characterSetFromString:](self, "characterSetFromString:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SGStringPreprocessor removeCharacters:withExceptions:fromString:](self, "removeCharacters:withExceptions:fromString:", v7, 0, v6);

}

- (void)replaceCharactersWithSpaces:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a3;
  -[SGStringPreprocessor characterSetFromString:](self, "characterSetFromString:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = v9;
  _PASIterateLongChars();

}

- (void)removeNonASCII:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD14A8];
  v5 = a3;
  objc_msgSend(v4, "characterSetWithRange:", 0, 128);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGStringPreprocessor removeCharacters:withExceptions:fromString:](self, "removeCharacters:withExceptions:fromString:", v6, 0, v5);

}

- (void)removePunctuation:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD14A8];
  v5 = a3;
  objc_msgSend(v4, "punctuationCharacterSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SGStringPreprocessor removeCharacters:withExceptions:fromString:](self, "removeCharacters:withExceptions:fromString:", v6, 0, v5);

}

- (void)removeSpacingModifierLetters:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD14A8];
  v5 = a3;
  objc_msgSend(v4, "characterSetWithRange:", 688, 64);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SGStringPreprocessor removeCharacters:withExceptions:fromString:](self, "removeCharacters:withExceptions:fromString:", v6, 0, v5);

}

- (void)removeDuplicateWhitespace:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned __int16 *v8;
  __CFString *v9;
  void *v10;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v14;
  int64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CFIndex v20;
  UniChar v21;
  int v22;
  int64_t v23;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  CFIndex v28;
  __CFString *v29;
  uint64_t v30;
  SGStringPreprocessor *v31;
  id v32;
  UniChar buffer[8];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  CFStringRef theString;
  const UniChar *v42;
  const char *v43;
  uint64_t v44;
  CFIndex v45;
  int64_t v46;
  int64_t v47;
  CFRange v48;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SGStringPreprocessor bufferPtrWithMinimumLength:](self, "bufferPtrWithMinimumLength:", v6);
    v9 = (__CFString *)v4;
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      *(_OWORD *)buffer = 0u;
      v34 = 0u;
      Length = CFStringGetLength(v9);
      theString = v9;
      v44 = 0;
      v45 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v9);
      CStringPtr = 0;
      v42 = CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v9, 0x600u);
      v29 = v9;
      v30 = v6;
      v31 = self;
      v32 = v4;
      v46 = 0;
      v47 = 0;
      v43 = CStringPtr;
      if (Length < 1)
      {
        v17 = 0;
      }
      else
      {
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 64;
        do
        {
          if ((unint64_t)v15 >= 4)
            v19 = 4;
          else
            v19 = v15;
          v20 = v45;
          if (v45 <= v15)
          {
            v21 = 0;
          }
          else if (v42)
          {
            v21 = v42[v15 + v44];
          }
          else if (v43)
          {
            v21 = v43[v44 + v15];
          }
          else
          {
            v23 = v46;
            if (v47 <= v15 || v46 > v15)
            {
              v25 = v19 + v14;
              v26 = v18 - v19;
              v27 = v15 - v19;
              v28 = v27 + 64;
              if (v27 + 64 >= v45)
                v28 = v45;
              v46 = v27;
              v47 = v28;
              if (v45 >= v26)
                v20 = v26;
              v48.length = v20 + v25;
              v48.location = v27 + v44;
              CFStringGetCharacters(theString, v48, buffer);
              v23 = v46;
            }
            v21 = buffer[v15 - v23];
          }
          v22 = objc_msgSend(v7, "characterIsMember:", v21, v29, v30, v31, v32, *(_QWORD *)buffer, *(_QWORD *)&buffer[4], v34, v35, v36, v37, v38, v39, v40);
          if ((v16 & v22 & 1) == 0)
            v8[v17++] = v21;
          ++v15;
          --v14;
          ++v18;
          v16 = v22;
        }
        while (Length != v15);
      }
      self = v31;
      v4 = v32;
      v9 = v29;
      v6 = v30;
    }
    else
    {
      v17 = 0;
    }

    if (v17 != v6)
      -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v9, v8, v17);

  }
}

- (void)mergeNumbersSeparatedByASCIISpace:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned __int16 *v8;
  id v9;
  _QWORD v10[3];
  int v11;
  _QWORD v12[3];
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SGStringPreprocessor bufferPtrWithMinimumLength:](self, "bufferPtrWithMinimumLength:", v6);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    v9 = v7;
    _PASIterateLongChars();
    if (v15[3] != v6)
      -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v4, v8);

    _Block_object_dispose(v10, 8);
    _Block_object_dispose(v12, 8);
    _Block_object_dispose(&v14, 8);

  }
}

- (void)replaceNumbersWithString:(id)a3 withValue:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  _QWORD v19[3];
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  unsigned __int16 *v28;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "length") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGStringPreprocessingTransformer.m"), 400, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value.length == 1"));

  }
  v9 = objc_msgSend(v7, "length");
  if (v9)
  {
    v10 = v9;
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "characterAtIndex:", 0) & 0xF800 | 0x400) == 0xDC00)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGStringPreprocessingTransformer.m"), 405, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!CFUniCharIsSurrogateHighCharacter(replacement) && !CFUniCharIsSurrogateLowCharacter(replacement)"));

    }
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v28 = -[SGStringPreprocessor bufferPtrWithMinimumLength:](self, "bufferPtrWithMinimumLength:", v10);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v20 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v12 = v11;
    _PASIterateLongChars();
    if (*((_BYTE *)v16 + 24))
      -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v7, v26[3], v22[3]);

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(v19, 8);
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);

  }
}

- (void)mergeTwoOrMoreConsecutiveCharacters:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int16 *v7;
  uint64_t v8;
  _QWORD v9[3];
  int v10;
  _QWORD v11[3];
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v6 = v5;
    v7 = -[SGStringPreprocessor bufferPtrWithMinimumLength:](self, "bufferPtrWithMinimumLength:", v5);
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v10 = 0;
    v8 = MEMORY[0x24BDAC760];
    _PASIterateLongChars();
    if (v14[3] != v6)
      -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v4, v7, v8, 3221225472, __60__SGStringPreprocessor_mergeTwoOrMoreConsecutiveCharacters___block_invoke, &unk_24DDC4170, v11, v9, &v13, v7);
    _Block_object_dispose(v9, 8);
    _Block_object_dispose(v11, 8);
    _Block_object_dispose(&v13, 8);
  }

}

- (void)mergeAnyConsecutiveCharacters:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int16 *v7;
  _QWORD v8[3];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v6 = v5;
    v7 = -[SGStringPreprocessor bufferPtrWithMinimumLength:](self, "bufferPtrWithMinimumLength:", v5);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x2020000000;
    v9 = 0;
    _PASIterateLongChars();
    if (v11[3] != v6)
      -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v4, v7);
    _Block_object_dispose(v8, 8);
    _Block_object_dispose(&v10, 8);
  }

}

- (void)mergeAnyConsecutiveNonalphabeticCharactersWithExceptions:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int16 *v12;
  id v13;
  id v14;
  _QWORD v15[3];
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v12 = -[SGStringPreprocessor bufferPtrWithMinimumLength:](self, "bufferPtrWithMinimumLength:", v9);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v16 = 0;
    v13 = v10;
    v14 = v11;
    _PASIterateLongChars();
    if (v18[3] != v9)
      -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v6, v12);

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v17, 8);

  }
}

- (void)mergeAnyConsecutiveNonalphabeticCharacters:(id)a3
{
  -[SGStringPreprocessor mergeAnyConsecutiveNonalphabeticCharactersWithExceptions:withValue:](self, "mergeAnyConsecutiveNonalphabeticCharactersWithExceptions:withValue:", a3, &stru_24DDC5810);
}

- (void)replaceLinksWithString:(id)a3 withValue:(id)a4
{
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  unsigned __int16 *v11;
  __CFString *v12;
  void *v13;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  CFIndex v20;
  UniChar *v21;
  int64_t v22;
  unsigned __int16 v23;
  const char *v24;
  char v25;
  char v26;
  int v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  int64_t v32;
  void *v33;
  char v34;
  UniChar buffer[8];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CFStringRef theString;
  UniChar *v44;
  const char *v45;
  uint64_t v46;
  CFIndex v47;
  int64_t v48;
  int64_t v49;
  CFRange v50;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "length");
  if (v9 >= 5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGStringPreprocessingTransformer.m"), 507, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueLen <= patternLen"));

  }
  v10 = objc_msgSend(v7, "length");
  if (v10)
  {
    v11 = -[SGStringPreprocessor bufferPtrWithMinimumLength:](self, "bufferPtrWithMinimumLength:", v10);
    v12 = (__CFString *)v7;
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_50;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    *(_OWORD *)buffer = 0u;
    v36 = 0u;
    Length = CFStringGetLength(v12);
    theString = v12;
    v46 = 0;
    v47 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v12);
    CStringPtr = 0;
    v44 = (UniChar *)CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v12, 0x600u);
    v48 = 0;
    v49 = 0;
    v45 = CStringPtr;
    if (Length <= 0)
    {
LABEL_50:

      goto LABEL_53;
    }
    v17 = 0;
    v34 = 0;
    v18 = 0;
    v19 = 0;
    while (1)
    {
      v20 = v47;
      if (v47 <= v17)
      {
        v23 = 0;
        goto LABEL_15;
      }
      v21 = v44;
      if (v44)
        break;
      if (!v45)
      {
        v30 = v48;
        if (v49 <= v17 || v48 > v17)
        {
          v32 = v17 - 4;
          if ((unint64_t)v17 < 4)
            v32 = 0;
          if (v32 + 64 < v47)
            v20 = v32 + 64;
          v48 = v32;
          v49 = v20;
          v50.location = v46 + v32;
          v50.length = v20 - v32;
          CFStringGetCharacters(theString, v50, buffer);
          v30 = v48;
        }
        v22 = v17 - v30;
        v21 = buffer;
LABEL_12:
        v23 = v21[v22];
        if (v18)
          goto LABEL_15;
        goto LABEL_33;
      }
      v23 = v45[v46 + v17];
      if (v18)
        goto LABEL_15;
LABEL_33:
      if (v23 == 104)
      {
        v23 = 104;
        v18 = 1u;
LABEL_36:
        v11[v19] = v23;
LABEL_37:
        ++v19;
        goto LABEL_38;
      }
LABEL_15:
      if (v18 >= 1)
      {
        if (replaceLinksWithString_withValue__pattern[v18] != v23)
          goto LABEL_35;
        ++v18;
        v11[v19] = v23;
        if (v18 != 4)
          goto LABEL_37;
        v29 = v19 - 3;
        objc_msgSend(v8, "getCharacters:range:", &v11[v29], 0, v9);
        v19 = v29 + v9;
        v34 = 1;
      }
      else
      {
        if (v18 != -1)
          goto LABEL_36;
        if (v23 - 48 < 0xA || (v23 & 0xFFDFu) - 65 < 0x1A)
          goto LABEL_38;
        v24 = ":/.?=&_-+$!*'(),;@";
        do
        {
          v26 = *v24++;
          v25 = v26;
          v27 = v26;
          if (v26)
            v28 = v27 == v23;
          else
            v28 = 1;
        }
        while (!v28);
        if (!v25)
        {
LABEL_35:
          v18 = 0;
          goto LABEL_36;
        }
      }
      v18 = 0xFFFFFFFFFFFFFFFFLL;
LABEL_38:
      if (++v17 == Length)
      {

        if ((v34 & 1) != 0)
          -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v12, v11, v19);
        goto LABEL_53;
      }
    }
    v22 = v46 + v17;
    goto LABEL_12;
  }
LABEL_53:

}

- (void)trimWhitespace:(id)a3
{
  CFStringTrimWhitespace((CFMutableStringRef)a3);
}

- (void)removeNonBasicMultilingualPlane:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int16 *v7;
  __CFString *v8;
  void *v9;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  UniChar v20;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  CFIndex v25;
  UniChar buffer[8];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CFStringRef theString;
  const UniChar *v35;
  const char *v36;
  uint64_t v37;
  CFIndex v38;
  int64_t v39;
  int64_t v40;
  CFRange v41;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v6 = v5;
    v7 = -[SGStringPreprocessor bufferPtrWithMinimumLength:](self, "bufferPtrWithMinimumLength:", v5);
    v8 = (__CFString *)v4;
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      *(_OWORD *)buffer = 0u;
      v27 = 0u;
      Length = CFStringGetLength(v8);
      theString = v8;
      v37 = 0;
      v38 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v8);
      CStringPtr = 0;
      v35 = CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
      v39 = 0;
      v40 = 0;
      v36 = CStringPtr;
      if (Length >= 1)
      {
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 64;
        while (1)
        {
          if ((unint64_t)v16 >= 4)
            v19 = 4;
          else
            v19 = v16;
          if (v38 <= v16)
          {
            v20 = 0;
          }
          else
          {
            if (v35)
            {
              v20 = v35[v16 + v37];
            }
            else if (v36)
            {
              v20 = v36[v37 + v16];
            }
            else
            {
              if (v40 <= v16 || v15 > v16)
              {
                v22 = v19 + v13;
                v23 = v18 - v19;
                v24 = v16 - v19;
                v25 = v24 + 64;
                if (v24 + 64 >= v38)
                  v25 = v38;
                v39 = v24;
                v40 = v25;
                if (v38 < v23)
                  v23 = v38;
                v41.length = v23 + v22;
                v41.location = v24 + v37;
                CFStringGetCharacters(theString, v41, buffer);
                v14 = v39;
              }
              v20 = buffer[v16 - v14];
              v15 = v14;
            }
            if ((unsigned __int16)((unsigned __int16)(v20 + 0x2000) >> 11) > 0x1Eu)
              goto LABEL_28;
          }
          v7[v17++] = v20;
LABEL_28:
          ++v16;
          --v13;
          ++v18;
          if (Length == v16)
            goto LABEL_32;
        }
      }
      v17 = 0;
    }
    else
    {
      v17 = 0;
    }
LABEL_32:

    if (v17 != v6)
      -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v8, v7, v17);
  }

}

- (void)decomposeStringWithCompatibilityMapping:(id)a3
{
  CFStringNormalize((CFMutableStringRef)a3, kCFStringNormalizationFormKD);
}

- (void)decomposeAndRecomposeStringWithCompatibilityMapping:(id)a3
{
  CFStringNormalize((CFMutableStringRef)a3, kCFStringNormalizationFormKC);
}

- (void)stripCombiningMarks:(id)a3
{
  __CFString *v3;
  CFRange v4;

  v3 = (__CFString *)a3;
  v4.location = 0;
  v4.length = -[__CFString length](v3, "length");
  CFStringTransform(v3, &v4, (CFStringRef)*MEMORY[0x24BDBD660], 0);

}

- (void)stripNonBaseCharacters:(id)a3
{
  id v4;

  v4 = a3;
  -[SGStringPreprocessor decomposeStringWithCompatibilityMapping:](self, "decomposeStringWithCompatibilityMapping:", v4);
  -[SGStringPreprocessor removeNonBaseCharacters:](self, "removeNonBaseCharacters:", v4);

}

- (void)removeNonBaseCharacters:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD14A8];
  v5 = a3;
  objc_msgSend(v4, "nonBaseCharacterSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SGStringPreprocessor removeCharacters:withExceptions:fromString:](self, "removeCharacters:withExceptions:fromString:", v6, 0, v5);

}

- (void)removeEmojiModifyingCharactersWithExceptions:(id)a3 withValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  _PASCharacterSetWithCharactersInString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    _PASCharacterSetWithCharactersInString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[SGStringPreprocessor removeCharacters:withExceptions:fromString:](self, "removeCharacters:withExceptions:fromString:", v7, v8, v9);

}

- (void)removeEmojiModifyingCharacters:(id)a3
{
  -[SGStringPreprocessor removeEmojiModifyingCharactersWithExceptions:withValue:](self, "removeEmojiModifyingCharactersWithExceptions:withValue:", a3, &stru_24DDC5810);
}

- (void)removeEmojisWithExceptions:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unsigned __int16 *v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  if (v8)
  {
    _PASCharacterSetWithCharactersInString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = -[SGStringPreprocessor bufferPtrWithMinimumLength:](self, "bufferPtrWithMinimumLength:", v8);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11 = v9;
  _PASIterateLongChars();
  if (v13[3] != v8)
    -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v6, v10);

  _Block_object_dispose(&v12, 8);
}

- (void)removeEmojis:(id)a3
{
  -[SGStringPreprocessor removeEmojisWithExceptions:withValue:](self, "removeEmojisWithExceptions:withValue:", a3, &stru_24DDC5810);
}

- (void)removeNonEmojiSymbolsWithExceptions:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int16 *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  objc_msgSend(MEMORY[0x24BDD14A8], "symbolCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    _PASCharacterSetWithCharactersInString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = -[SGStringPreprocessor bufferPtrWithMinimumLength:](self, "bufferPtrWithMinimumLength:", v8);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v14 = MEMORY[0x24BDAC760];
  v12 = v9;
  v15 = v12;
  v13 = v10;
  v16 = v13;
  _PASIterateLongChars();
  if (v18[3] != v8)
    -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v6, v11, v14, 3221225472, __70__SGStringPreprocessor_removeNonEmojiSymbolsWithExceptions_withValue___block_invoke, &unk_24DDC4058, v12, v13, &v17, v11);

  _Block_object_dispose(&v17, 8);
}

- (void)removeNonEmojiSymbols:(id)a3
{
  -[SGStringPreprocessor removeNonEmojiSymbolsWithExceptions:withValue:](self, "removeNonEmojiSymbolsWithExceptions:withValue:", a3, &stru_24DDC5810);
}

- (void)replaceAllWhitespaceWithSpaces:(id)a3
{
  id v3;
  const __CFCharacterSet *v4;
  __CFString *v5;
  void *v6;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFIndex v14;
  UniChar v15;
  int64_t v16;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  CFIndex v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CFStringRef theString;
  const UniChar *v31;
  const char *v32;
  uint64_t v33;
  CFIndex v34;
  int64_t v35;
  int64_t v36;
  CFRange v37;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v4 = (const __CFCharacterSet *)objc_claimAutoreleasedReturnValue();
  v5 = (__CFString *)v3;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    Length = CFStringGetLength(v5);
    theString = v5;
    v33 = 0;
    v34 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v5);
    CStringPtr = 0;
    v31 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    v35 = 0;
    v36 = 0;
    v32 = CStringPtr;
    if (Length >= 1)
    {
      v10 = 0;
      v11 = 0;
      v12 = 64;
      do
      {
        if ((unint64_t)v11 >= 4)
          v13 = 4;
        else
          v13 = v11;
        v14 = v34;
        if (v34 <= v11)
        {
          v15 = 0;
        }
        else if (v31)
        {
          v15 = v31[v11 + v33];
        }
        else if (v32)
        {
          v15 = v32[v33 + v11];
        }
        else
        {
          v16 = v35;
          if (v36 <= v11 || v35 > v11)
          {
            v18 = v13 + v10;
            v19 = v12 - v13;
            v20 = v11 - v13;
            v21 = v20 + 64;
            if (v20 + 64 >= v34)
              v21 = v34;
            v35 = v20;
            v36 = v21;
            if (v34 >= v19)
              v14 = v19;
            v37.length = v14 + v18;
            v37.location = v20 + v33;
            CFStringGetCharacters(theString, v37, (UniChar *)&v22);
            v16 = v35;
          }
          v15 = *((_WORD *)&v22 + v11 - v16);
        }
        if (CFCharacterSetIsCharacterMember(v4, v15))
          -[__CFString replaceCharactersInRange:withString:](v5, "replaceCharactersInRange:withString:", v11, 1, CFSTR(" "), v22, v23, v24, v25, v26, v27, v28, v29);
        ++v11;
        --v10;
        ++v12;
      }
      while (Length != v11);
    }
  }

}

- (void)removePunctuationWithExceptions:(id)a3 withValue:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BDD14A8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "punctuationCharacterSet");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SGStringPreprocessor characterSetFromString:](self, "characterSetFromString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGStringPreprocessor removeCharacters:withExceptions:fromString:](self, "removeCharacters:withExceptions:fromString:", v10, v9, v8);
}

- (void)removeSymbols:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD14A8];
  v5 = a3;
  objc_msgSend(v4, "symbolCharacterSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SGStringPreprocessor removeCharacters:withExceptions:fromString:](self, "removeCharacters:withExceptions:fromString:", v6, 0, v5);

}

- (void)removeSymbolsWithExceptions:(id)a3 withValue:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BDD14A8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "symbolCharacterSet");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SGStringPreprocessor characterSetFromString:](self, "characterSetFromString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGStringPreprocessor removeCharacters:withExceptions:fromString:](self, "removeCharacters:withExceptions:fromString:", v10, v9, v8);
}

- (void)transformFullwidthToHalfwidth:(id)a3
{
  __CFString *v3;
  CFRange v4;

  v3 = (__CFString *)a3;
  v4.location = 0;
  v4.length = -[__CFString length](v3, "length");
  CFStringTransform(v3, &v4, (CFStringRef)*MEMORY[0x24BDBD608], 0);

}

- (void)transformFullwidthToHalfwidthASCII:(id)a3
{
  __CFString *v3;
  void *v4;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v8;
  int64_t v9;
  UniChar *v10;
  uint64_t v11;
  uint64_t v12;
  CFIndex v13;
  unsigned __int16 *v14;
  unsigned __int16 v15;
  int v16;
  void *v17;
  int64_t v18;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  CFIndex v23;
  unsigned __int16 v24;
  UniChar buffer[8];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __CFString *v33;
  const UniChar *v34;
  const char *v35;
  uint64_t v36;
  CFIndex v37;
  int64_t v38;
  int64_t v39;
  CFRange v40;

  v3 = (__CFString *)a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    *(_OWORD *)buffer = 0u;
    v26 = 0u;
    Length = CFStringGetLength(v3);
    v33 = v3;
    v36 = 0;
    v37 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v3);
    CStringPtr = 0;
    v34 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
    v35 = CStringPtr;
    v38 = 0;
    v39 = 0;
    if (Length >= 1)
    {
      v8 = 0;
      v9 = 0;
      v10 = buffer;
      v11 = 64;
      do
      {
        if ((unint64_t)v9 >= 4)
          v12 = 4;
        else
          v12 = v9;
        v13 = v37;
        if (v37 > v9)
        {
          if (v34)
          {
            v14 = (unsigned __int16 *)&v34[v9 + v36];
LABEL_12:
            v15 = *v14;
            v16 = v15;
            if ((unsigned __int16)(v15 + 255) < 0x5Eu)
              v15 += 288;
            if (v16 == 12288)
              v15 = 32;
            v24 = v15;
            if (v16 != v15)
            {
              v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharactersNoCopy:length:freeWhenDone:", &v24, 1, 0);
              -[__CFString replaceCharactersInRange:withString:](v3, "replaceCharactersInRange:withString:", v9, 1, v17);

            }
            goto LABEL_19;
          }
          if (!v35)
          {
            v18 = v38;
            if (v39 <= v9 || v38 > v9)
            {
              v20 = v12 + v8;
              v21 = v11 - v12;
              v22 = v9 - v12;
              v23 = v22 + 64;
              if (v22 + 64 >= v37)
                v23 = v37;
              v38 = v22;
              v39 = v23;
              if (v37 >= v21)
                v13 = v21;
              v40.length = v13 + v20;
              v40.location = v22 + v36;
              CFStringGetCharacters(v33, v40, buffer);
              v18 = v38;
            }
            v14 = &v10[-v18];
            goto LABEL_12;
          }
        }
LABEL_19:
        ++v9;
        --v8;
        ++v11;
        ++v10;
      }
      while (Length != v9);
    }
  }

}

- (void)transformHalfwidthToFullwidthCJK:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned __int16 *v6;
  __CFString *v7;
  void *v8;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v12;
  int64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  CFIndex v17;
  UniChar v18;
  int64_t v19;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  CFIndex v24;
  int v25;
  __CFString *v26;
  UniChar buffer[8];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CFStringRef theString;
  const UniChar *v36;
  const char *v37;
  uint64_t v38;
  CFIndex v39;
  int64_t v40;
  int64_t v41;
  CFRange v42;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (!v5)
    goto LABEL_34;
  v6 = -[SGStringPreprocessor bufferPtrWithMinimumLength:](self, "bufferPtrWithMinimumLength:", v5);
  v7 = (__CFString *)v4;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_33;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  *(_OWORD *)buffer = 0u;
  v28 = 0u;
  Length = CFStringGetLength(v7);
  theString = v7;
  v38 = 0;
  v39 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v7);
  CStringPtr = 0;
  v36 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
  v40 = 0;
  v41 = 0;
  v37 = CStringPtr;
  if (Length < 1)
  {
LABEL_33:

    goto LABEL_34;
  }
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 64;
  do
  {
    if ((unint64_t)v13 >= 4)
      v16 = 4;
    else
      v16 = v13;
    v17 = v39;
    if (v39 <= v13)
    {
      v18 = 0;
      goto LABEL_30;
    }
    if (v36)
    {
      v18 = v36[v13 + v38];
    }
    else if (v37)
    {
      v18 = v37[v38 + v13];
    }
    else
    {
      v19 = v40;
      if (v41 <= v13 || v40 > v13)
      {
        v21 = v16 + v12;
        v22 = v15 - v16;
        v23 = v13 - v16;
        v24 = v23 + 64;
        if (v23 + 64 >= v39)
          v24 = v39;
        v40 = v23;
        v41 = v24;
        if (v39 >= v22)
          v17 = v22;
        v42.length = v17 + v21;
        v42.location = v23 + v38;
        CFStringGetCharacters(theString, v42, buffer);
        v19 = v40;
      }
      v18 = buffer[v13 - v19];
    }
    if ((unsigned __int16)(v18 + 159) >= 0x3Fu)
    {
      v25 = -65440;
      v26 = CFSTR("ᅠᄀᄁᆪᄂᆬᆭᄃᄄᄅᆰᆱᆲᆳᆴᆵᄚᄆᄇᄈᄡᄉᄊᄋᄌᄍᄎᄏᄐᄑ하ᅢᅣᅤᅥᅦᅧᅨᅩᅪᅫᅬᅭᅮᅯᅰᅱᅲᅳᅴᅵ");
      if ((unsigned __int16)(v18 + 96) > 0x3Cu)
        goto LABEL_30;
    }
    else
    {
      v25 = -65377;
      v26 = CFSTR("。「」、・ヲァィゥェォャュョッーアイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワン゙゚");
    }
    v18 = -[__CFString characterAtIndex:](v26, "characterAtIndex:", v25 + v18);
    v14 = 1;
LABEL_30:
    v6[v13++] = v18;
    --v12;
    ++v15;
  }
  while (Length != v13);

  if ((v14 & 1) != 0)
    -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v7, v6, Length);
LABEL_34:

}

- (void)combineDakutenAndHandakuten:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned __int16 *v6;
  __CFString *v7;
  void *v8;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  char v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;
  UniChar v21;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  CFIndex v26;
  uint64_t v27;
  __CFString *v28;
  SGStringPreprocessor *v29;
  UniChar buffer[8];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CFStringRef theString;
  const UniChar *v39;
  const char *v40;
  uint64_t v41;
  CFIndex v42;
  int64_t v43;
  int64_t v44;
  CFRange v45;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (!v5)
    goto LABEL_43;
  v6 = -[SGStringPreprocessor bufferPtrWithMinimumLength:](self, "bufferPtrWithMinimumLength:", v5);
  v7 = (__CFString *)v4;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_40;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  *(_OWORD *)buffer = 0u;
  v31 = 0u;
  Length = CFStringGetLength(v7);
  theString = v7;
  v41 = 0;
  v42 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v7);
  CStringPtr = 0;
  v39 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
  v43 = 0;
  v44 = 0;
  v40 = CStringPtr;
  if (Length < 1)
  {
LABEL_40:

    goto LABEL_43;
  }
  v28 = v7;
  v29 = self;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 64;
  do
  {
    if ((unint64_t)v15 >= 4)
      v20 = 4;
    else
      v20 = v15;
    if (v42 <= v15)
    {
      v21 = 0;
LABEL_31:
      v27 = v17++;
      v18 = v21;
      goto LABEL_32;
    }
    if (v39)
    {
      v21 = v39[v15 + v41];
    }
    else if (v40)
    {
      v21 = v40[v41 + v15];
    }
    else
    {
      if (v44 <= v15 || v14 > v15)
      {
        v23 = v20 + v12;
        v24 = v19 - v20;
        v25 = v15 - v20;
        v26 = v25 + 64;
        if (v25 + 64 >= v42)
          v26 = v42;
        v43 = v25;
        v44 = v26;
        if (v42 < v24)
          v24 = v42;
        v45.length = v24 + v23;
        v45.location = v25 + v41;
        CFStringGetCharacters(theString, v45, buffer);
        v13 = v43;
      }
      v21 = buffer[v15 - v13];
      v14 = v13;
    }
    if (v21 == 12442)
    {
      if ((unsigned __int16)(v18 - 12399) <= 0xCu)
      {
        v21 = v18 + 2;
        v27 = v17 - 1;
        v16 = 1;
        v18 = 12442;
      }
      else
      {
        v27 = v17++;
        v16 = 1;
        v18 = 12442;
        v21 = 12444;
      }
    }
    else
    {
      if (v21 != 12441)
        goto LABEL_31;
      switch(v18)
      {
        case 12358:
        case 12454:
          v6[v17 - 1] = v18 + 78;
          goto LABEL_39;
        case 12363:
        case 12364:
        case 12365:
        case 12366:
        case 12367:
        case 12368:
        case 12369:
        case 12370:
        case 12371:
        case 12372:
        case 12373:
        case 12374:
        case 12375:
        case 12376:
        case 12377:
        case 12378:
        case 12379:
        case 12380:
        case 12381:
        case 12382:
        case 12383:
        case 12384:
        case 12385:
        case 12386:
        case 12387:
        case 12388:
        case 12389:
        case 12390:
        case 12391:
        case 12392:
        case 12393:
        case 12394:
        case 12395:
        case 12396:
        case 12397:
        case 12398:
        case 12399:
        case 12400:
        case 12401:
        case 12402:
        case 12403:
        case 12404:
        case 12405:
        case 12406:
        case 12407:
        case 12408:
        case 12409:
        case 12410:
        case 12411:
        case 12445:
        case 12459:
        case 12460:
        case 12461:
        case 12462:
        case 12463:
        case 12464:
        case 12465:
        case 12466:
        case 12467:
        case 12468:
        case 12469:
        case 12470:
        case 12471:
        case 12472:
        case 12473:
        case 12474:
        case 12475:
        case 12476:
        case 12477:
        case 12478:
        case 12479:
        case 12480:
        case 12481:
        case 12482:
        case 12483:
        case 12484:
        case 12485:
        case 12486:
        case 12487:
        case 12488:
        case 12489:
        case 12490:
        case 12491:
        case 12492:
        case 12493:
        case 12494:
        case 12495:
        case 12496:
        case 12497:
        case 12498:
        case 12499:
        case 12500:
        case 12501:
        case 12502:
        case 12503:
        case 12504:
        case 12505:
        case 12506:
        case 12507:
        case 12541:
          v21 = v18 + 1;
          goto LABEL_30;
        case 12527:
        case 12528:
        case 12529:
        case 12530:
          v21 = v18 + 8;
LABEL_30:
          v27 = v17 - 1;
          v16 = 1;
          v18 = 12441;
          break;
        default:
LABEL_39:
          v27 = v17++;
          v16 = 1;
          v18 = 12441;
          v21 = 12443;
          break;
      }
    }
LABEL_32:
    v6[v27] = v21;
    ++v15;
    --v12;
    ++v19;
  }
  while (Length != v15);

  if ((v16 & 1) != 0)
    -[SGStringPreprocessor replace:withBuffer:toIndex:](v29, "replace:withBuffer:toIndex:", v28, v6, v17);
LABEL_43:

}

- (void)replaceContactNamesWithString:(id)a3 withValue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 *p_buf;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 buf;
  uint64_t v27;
  void *v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(";"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 2)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v10 = (void *)getSGNameDetectorClass_softClass;
    v25 = getSGNameDetectorClass_softClass;
    v11 = MEMORY[0x24BDAC760];
    if (!getSGNameDetectorClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v27 = (uint64_t)__getSGNameDetectorClass_block_invoke;
      v28 = &unk_24DDC44C8;
      v29 = &v22;
      __getSGNameDetectorClass_block_invoke((uint64_t)&buf);
      v10 = (void *)v23[3];
    }
    v12 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v22, 8);
    v13 = (void *)objc_msgSend([v12 alloc], "initWithLanguage:", v8);
    objc_msgSend(v13, "detectNames:algorithm:", v5, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v27 = 0x2020000000;
    v28 = 0;
    v15 = objc_msgSend(v9, "length");
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __64__SGStringPreprocessor_replaceContactNamesWithString_withValue___block_invoke;
    v17[3] = &unk_24DDC4210;
    p_buf = &buf;
    v18 = v5;
    v16 = v9;
    v19 = v16;
    v21 = v15;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);

    _Block_object_dispose(&buf, 8);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[SGStringPreprocessingTransformer replaceContactNamesWithString:withValue:] - Incorrect format for value: %@", (uint8_t *)&buf, 0xCu);
  }

}

- (void)addToStart:(id)a3 withValue:(id)a4
{
  objc_msgSend(a3, "insertString:atIndex:", a4, 0);
}

- (void)addToEnd:(id)a3 withValue:(id)a4
{
  objc_msgSend(a3, "appendString:", a4);
}

- (void)finalizeForWordPieceCaseInsensitive:(id)a3
{
  __CFString *v3;
  id v4;

  v3 = (__CFString *)a3;
  -[__CFString stringByFoldingWithOptions:locale:](v3, "stringByFoldingWithOptions:locale:", 128, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[__CFString setString:](v3, "setString:", v4);
  CFStringLowercase(v3, 0);

}

- (void)finalizeForWordPieceCaseSensitive:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "stringByFoldingWithOptions:locale:", 128, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setString:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

void __64__SGStringPreprocessor_replaceContactNamesWithString_withValue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v4 = a2;
  v5 = objc_msgSend(v4, "range") + v3;
  objc_msgSend(v4, "range");
  objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", v5, v6, *(_QWORD *)(a1 + 40));
  v7 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4, "range");
  v9 = v8;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v7 - v9;
}

const __CFCharacterSet *__70__SGStringPreprocessor_removeNonEmojiSymbolsWithExceptions_withValue___block_invoke(uint64_t a1, UTF32Char a2, const void *a3, uint64_t a4, uint64_t a5)
{
  const __CFCharacterSet *result;

  if (!CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 32), a2)
    || (SGIsEmoji(a2) & 1) != 0
    || (result = *(const __CFCharacterSet **)(a1 + 40)) != 0
    && (result = (const __CFCharacterSet *)CFCharacterSetIsLongCharacterMember(result, a2), (_DWORD)result))
  {
    result = (const __CFCharacterSet *)memcpy((void *)(*(_QWORD *)(a1 + 56)+ 2 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)), a3, 2 * a5);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += a5;
  }
  return result;
}

const __CFCharacterSet *__61__SGStringPreprocessor_removeEmojisWithExceptions_withValue___block_invoke(_QWORD *a1, UTF32Char a2, const void *a3, uint64_t a4, uint64_t a5)
{
  const __CFCharacterSet *result;

  if (!SGIsEmoji(a2)
    || (result = (const __CFCharacterSet *)a1[4]) != 0
    && (result = (const __CFCharacterSet *)CFCharacterSetIsLongCharacterMember(result, a2), (_DWORD)result))
  {
    result = (const __CFCharacterSet *)memcpy((void *)(a1[6] + 2 * *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24)), a3, 2 * a5);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += a5;
  }
  return result;
}

const __CFCharacterSet *__91__SGStringPreprocessor_mergeAnyConsecutiveNonalphabeticCharactersWithExceptions_withValue___block_invoke(uint64_t a1, UTF32Char theChar, void *__src, uint64_t a4, uint64_t a5)
{
  const __CFCharacterSet *result;

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != theChar
    || CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 32), theChar)
    || (result = *(const __CFCharacterSet **)(a1 + 40)) != 0
    && (result = (const __CFCharacterSet *)CFCharacterSetIsLongCharacterMember(result, theChar), (_DWORD)result))
  {
    result = (const __CFCharacterSet *)memcpy((void *)(*(_QWORD *)(a1 + 64)+ 2 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)), __src, 2 * a5);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += a5;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = theChar;
  return result;
}

_QWORD *__54__SGStringPreprocessor_mergeAnyConsecutiveCharacters___block_invoke(_QWORD *result, int a2, void *__src, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  _QWORD *v8;

  v6 = *(_QWORD *)(result[4] + 8);
  if (*(_DWORD *)(v6 + 24) != a2)
  {
    v8 = result;
    result = memcpy((void *)(result[6] + 2 * *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24)), __src, 2 * a5);
    *(_QWORD *)(*(_QWORD *)(v8[5] + 8) + 24) += a5;
    v6 = *(_QWORD *)(v8[4] + 8);
  }
  *(_DWORD *)(v6 + 24) = a2;
  return result;
}

_QWORD *__60__SGStringPreprocessor_mergeTwoOrMoreConsecutiveCharacters___block_invoke(_QWORD *result, int a2, void *__src, uint64_t a4, uint64_t a5)
{
  _QWORD *v7;
  uint64_t v8;
  int v9;

  v7 = result;
  if (*(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24) != a2
    || (v8 = *(_QWORD *)(result[5] + 8), v9 = a2, *(_DWORD *)(v8 + 24) != a2))
  {
    result = memcpy((void *)(result[7] + 2 * *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24)), __src, 2 * a5);
    *(_QWORD *)(*(_QWORD *)(v7[6] + 8) + 24) += a5;
    v9 = *(_DWORD *)(*(_QWORD *)(v7[4] + 8) + 24);
    v8 = *(_QWORD *)(v7[5] + 8);
  }
  *(_DWORD *)(v8 + 24) = v9;
  *(_DWORD *)(*(_QWORD *)(v7[4] + 8) + 24) = a2;
  return result;
}

void *__59__SGStringPreprocessor_replaceNumbersWithString_withValue___block_invoke(uint64_t a1, UTF32Char a2, const void *a3, uint64_t a4, uint64_t a5)
{
  void *result;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = (void *)CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 32), a2);
  v9 = (int)result;
  if ((_DWORD)result)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v10 = *(_WORD *)(a1 + 72);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = *(_QWORD *)(v12 + 24);
      *(_QWORD *)(v12 + 24) = v13 + 1;
      *(_WORD *)(v11 + 2 * v13) = v10;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    result = memcpy((void *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)+ 2 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)), a3, 2 * a5);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += a5;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v9 != 0;
  return result;
}

void *__58__SGStringPreprocessor_mergeNumbersSeparatedByASCIISpace___block_invoke(uint64_t a1, UTF32Char a2, void *__src, uint64_t a4, uint64_t a5)
{
  void *result;

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 32
    && CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 32), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))&& CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 32), a2))
  {
    --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  result = memcpy((void *)(*(_QWORD *)(a1 + 64) + 2 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)), __src, 2 * a5);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += a5;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return result;
}

uint64_t __62__SGStringPreprocessor_replaceCharactersWithSpaces_withValue___block_invoke(uint64_t a1, UTF32Char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 32), a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", a4, a5, CFSTR(" "));
  return result;
}

const __CFCharacterSet *__67__SGStringPreprocessor_removeCharacters_withExceptions_fromString___block_invoke(uint64_t a1, UTF32Char a2, const void *a3, uint64_t a4, uint64_t a5)
{
  const __CFCharacterSet *result;

  if (!CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 32), a2)
    || (result = *(const __CFCharacterSet **)(a1 + 40)) != 0
    && (result = (const __CFCharacterSet *)CFCharacterSetIsLongCharacterMember(result, a2), (_DWORD)result))
  {
    result = (const __CFCharacterSet *)memcpy((void *)(*(_QWORD *)(a1 + 56)+ 2 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)), a3, 2 * a5);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += a5;
  }
  return result;
}

@end
