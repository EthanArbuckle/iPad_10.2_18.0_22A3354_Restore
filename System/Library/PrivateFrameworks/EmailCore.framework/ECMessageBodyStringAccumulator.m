@implementation ECMessageBodyStringAccumulator

- (ECMessageBodyStringAccumulator)initWithOptions:(unint64_t)a3 lengthLimit:(unint64_t)a4
{
  ECMessageBodyStringAccumulator *v6;
  ECMessageBodyStringAccumulator *v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  NSMutableString *accumulatedString;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ECMessageBodyStringAccumulator;
  v6 = -[ECMessageBodyStringAccumulator init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_remainingLength = a4;
    v6->_options = a3;
    v8 = objc_alloc(MEMORY[0x1E0CB37A0]);
    if ((a3 & 8) != 0)
      v9 = 2;
    else
      v9 = a4;
    v10 = objc_msgSend(v8, "initWithCapacity:", v9);
    accumulatedString = v7->_accumulatedString;
    v7->_accumulatedString = (NSMutableString *)v10;

    v7->_lastEntity = 0;
    v7->_lastCustomEntityTag = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  __CFString *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  BOOL (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  ECMessageBodyStringAccumulator *v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;

  -[ECMessageBodyStringAccumulator accumulatedString](self, "accumulatedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("␊"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\r"), CFSTR("␍"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\t"), CFSTR("␉"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), CFSTR("␠"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), CFSTR("␢"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("​"), CFSTR("␢"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("‌"), CFSTR("␢"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("‍"), CFSTR("␢"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("⁠"), CFSTR("␢"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("["));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __50__ECMessageBodyStringAccumulator_debugDescription__block_invoke;
  v14 = &unk_1E7121428;
  v15 = self;
  v17 = v18;
  v6 = v5;
  v16 = v6;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCC97B8](&v11);
  if ((((uint64_t (*)(_QWORD, uint64_t, const __CFString *))v7[2])(v7, 17, CFSTR(".condenseWhitespace")) & 1) == 0)
  {
    ((void (**)(_QWORD, uint64_t, const __CFString *))v7)[2](v7, 16, CFSTR(".condenseVerticalWhitespace"));
    ((void (**)(_QWORD, uint64_t, const __CFString *))v7)[2](v7, 1, CFSTR(".condenseHorizontalWhitespace"));
  }
  ((void (**)(_QWORD, uint64_t, const __CFString *))v7)[2](v7, 2, CFSTR(".resolveHTMLEntities"));
  ((void (**)(_QWORD, uint64_t, const __CFString *))v7)[2](v7, 4, CFSTR(".parseSingleLine"));
  ((void (**)(_QWORD, uint64_t, const __CFString *))v7)[2](v7, 8, CFSTR(".parseSingleNonWhitespaceCharacter"));
  ((void (**)(_QWORD, uint64_t, const __CFString *))v7)[2](v7, 32, CFSTR(".condenseEmptyLines"));
  objc_msgSend(v6, "appendString:", CFSTR("]"));
  if (self->_remainingLength == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = CFSTR("unlimited");
  }
  else if (-[ECMessageBodyStringAccumulator isFull](self, "isFull"))
  {
    v8 = CFSTR("full");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("remaining=%llu"), self->_remainingLength);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> %@ %@\n\t%@"), objc_opt_class(), self, v6, v8, v4, v11, v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v18, 8);
  return (NSString *)v9;
}

BOOL __50__ECMessageBodyStringAccumulator_debugDescription__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v7 = v6 & a2;
  if ((v6 & a2) == a2)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR(", "));
    objc_msgSend(*(id *)(a1 + 40), "appendString:", v5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

  return v7 == a2;
}

- (BOOL)isFull
{
  return self->_isFull;
}

- (void)appendNewline
{
  const __CFString *v2;

  if ((self->_options & 0x10) != 0)
    v2 = CFSTR(" ");
  else
    v2 = CFSTR("\n");
  -[ECMessageBodyStringAccumulator appendString:](self, "appendString:", v2);
}

- (void)appendString:(id)a3
{
  id v4;

  v4 = a3;
  -[ECMessageBodyStringAccumulator appendRange:ofString:](self, "appendRange:ofString:", 0, objc_msgSend(v4, "length"), v4);

}

- (void)appendRange:(_NSRange)a3 ofString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  size_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  length = a3.length;
  location = a3.location;
  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (length >= 0x3200001)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[ECMessageBodyStringAccumulator appendRange:ofString:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("ECMessageBodyStringAccumulator.m"), 124, CFSTR("Temporary buffer too large or with a negative count (%zu)."), length);

  }
  if (length <= 1)
    v8 = 1;
  else
    v8 = length;
  MEMORY[0x1E0C80A78]();
  v10 = (char *)v15 - v9;
  memset((char *)v15 - v9, 170, v11);
  if (length > 0x400)
  {
    v12 = (char *)malloc_type_calloc(v8, 2uLL, 0x1000040BDFB0063uLL);
  }
  else
  {
    bzero(v10, 2 * v8);
    v12 = 0;
  }
  if (length >= 0x401)
    v10 = v12;
  objc_msgSend(v7, "getCharacters:range:", v10, location, length);
  -[ECMessageBodyStringAccumulator appendCharacters:length:](self, "appendCharacters:length:", v10, length);
  free(v12);

}

- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  __CFString *v7;
  unint64_t v8;
  unint64_t options;
  _BOOL4 v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t remainingLength;
  int v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  unsigned int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  unint64_t v28;
  unint64_t lastEntity;
  int v30;
  char v31;
  void *v32;
  int v33;
  int v34;
  char v35;
  void *v36;
  int v37;
  unint64_t v40;
  CFIndex v41;
  _BOOL4 v42;
  char v43;
  unint64_t v44;
  UniChar v45[3];
  UniChar v46;
  UniChar v47;
  UniChar chars;

  if (a4)
  {
    v7 = 0;
    v8 = 0;
    options = self->_options;
    v11 = (options & 9) == 0 || (self->_options & 0x18) == 0;
    v44 = self->_options & 0x19;
    v42 = v11;
    v12 = (options & 1) == 0 || v11;
    v43 = v12;
    while (1)
    {
      if (self->_isFull)
      {
LABEL_140:

        return;
      }
      v13 = a3[v8];
      v14 = v8 + 1;
      if (!self->_options)
      {
        *(_DWORD *)v45 = (unsigned __int16)v13;
        goto LABEL_19;
      }
      if ((options & 0xA) == 2 && (_DWORD)v13 == 38)
      {
        if (v7)
          -[__CFString setString:](v7, "setString:", &stru_1E7123500);
        else
          v7 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 20);
        if (v8 + 21 >= a4)
          v18 = a4;
        else
          v18 = v8 + 21;
        if (v14 >= v18)
        {
          v18 = v14;
        }
        else
        {
          v19 = v14;
          while (1)
          {
            chars = a3[v19];
            v20 = chars;
            v21 = v19 + 1;
            if (chars <= 0x3Bu && ((1 << chars) & 0x800004100002600) != 0)
              break;
            CFStringAppendCharacters(v7, &chars, 1);
            ++v19;
            if (v18 == v21)
              goto LABEL_42;
          }
          v47 = 59;
          CFStringAppendCharacters(v7, &v47, 1);
          if (v20 == 59)
            v18 = v19 + 1;
          else
            v18 = v19;
        }
LABEL_42:
        v23 = -[__CFString ec_parseHTMLEntityCharacter](v7, "ec_parseHTMLEntityCharacter");
        if (v23)
        {
          v14 = v18;
          v13 = v23;
        }
        else
        {
          v13 = 38;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3500], "ec_whitespaceNewlineAndTagCharacterSet");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "longCharacterIsMember:", v13);

      if (!v25)
        break;
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "longCharacterIsMember:", v13);

      if (v27)
        v28 = 2;
      else
        v28 = 1;
      if ((options & 0x39) == 0)
      {
        v35 = 0;
        lastEntity = self->_lastEntity;
        v34 = 1;
        goto LABEL_82;
      }
      lastEntity = self->_lastEntity;
      if (options & ((options & 0x10) != 0) | options & (v27 ^ 1) & 1
        || (v27 & (options >> 4)) != 0)
      {
        v34 = 0;
        if (!lastEntity)
          v28 = 0;
        v35 = 1;
        goto LABEL_82;
      }
      if (lastEntity != v28)
      {
        v35 = 0;
        v34 = 1;
        if ((options & 0x20) != 0 && lastEntity != 3)
        {
          if (lastEntity == 1 && self->_beforeLastEntity == 3)
            v34 = v27;
          else
            v34 = 0;
          v35 = v34 ^ 1;
        }
        goto LABEL_82;
      }
      if ((options & 0x20) != 0)
      {
        self->_lastEntity = v28;
        self->_beforeLastEntity = v28;
        goto LABEL_139;
      }
      if ((options & 9) != 0)
        v30 = v27;
      else
        v30 = 1;
      if ((options & 0x18) != 0)
        v31 = v27;
      else
        v31 = 0;
      self->_lastEntity = v28;
      self->_beforeLastEntity = v28;
      if (v30 != 1 || (v31 & 1) != 0)
        goto LABEL_139;
      v17 = 1;
LABEL_124:
      *(_DWORD *)v45 = 0;
      if ((v13 - 0x10000) >= 0x100000)
      {
        v45[0] = v13;
        if (!v17)
        {
LABEL_127:
          v41 = 1;
          goto LABEL_128;
        }
LABEL_19:
        remainingLength = self->_remainingLength;
        if (remainingLength <= 1 && (v13 & 0xFC00) == 55296)
        {
          self->_isFull = 1;
          goto LABEL_132;
        }
        v17 = 1;
        goto LABEL_127;
      }
      v45[0] = ((v13 + 67043328) >> 10) - 10240;
      v45[1] = v13 & 0x3FF | 0xDC00;
      v41 = 2;
LABEL_128:
      CFStringAppendCharacters((CFMutableStringRef)self->_accumulatedString, v45, v41);
      remainingLength = self->_remainingLength;
      if (v17 && remainingLength && remainingLength != 0x7FFFFFFFFFFFFFFFLL)
        self->_remainingLength = --remainingLength;
LABEL_132:
      if (remainingLength)
      {
        if ((options & 8) != 0)
          goto LABEL_136;
      }
      else
      {
        self->_isFull = 1;
        if ((options & 8) != 0)
        {
LABEL_136:
          if (self->_lastEntity == 3
            && (-[NSMutableString ec_isWhitespace](self->_accumulatedString, "ec_isWhitespace") & 1) == 0)
          {
            self->_isFull = 1;
          }
        }
      }
LABEL_139:
      v8 = v14;
      if (v14 >= a4)
        goto LABEL_140;
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "ec_ignorableCharacterSet");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "longCharacterIsMember:", v13);

    if (v33)
    {
      v17 = 0;
      v34 = 0;
      v28 = self->_lastEntity;
      lastEntity = v28;
      goto LABEL_120;
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "ec_zeroWidthCharacterSet");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "longCharacterIsMember:", v13);

    lastEntity = self->_lastEntity;
    if ((v37 & 1) != 0)
    {
      self->_beforeLastEntity = lastEntity;
      v17 = 0;
      if (lastEntity == 3)
        self->_lastCustomEntityTag = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_124;
    }
    v35 = 0;
    v34 = 1;
    v28 = 3;
LABEL_82:
    v17 = 1;
    if (v28 == lastEntity || lastEntity - 1 > 1)
    {
LABEL_120:
      self->_lastEntity = v28;
      self->_beforeLastEntity = lastEntity;
      if (v28 == 3)
      {
        self->_lastCustomEntityTag = 0x7FFFFFFFFFFFFFFFLL;
        if ((v34 & 1) == 0)
          goto LABEL_139;
      }
      else if (!v34)
      {
        goto LABEL_139;
      }
      goto LABEL_124;
    }
    if ((options & 4) != 0 && lastEntity == 2)
    {
      v34 = 0;
      v17 = 1;
      self->_isFull = 1;
      goto LABEL_120;
    }
    if (v44 == 16)
    {
      if (v28 == 2 || lastEntity != 2)
      {
LABEL_99:
        if ((options & 0x20) == 0 || self->_beforeLastEntity == 2)
          goto LABEL_119;
        if (v28 == 3 || lastEntity == 1)
          v35 = 1;
        if ((v35 & 1) != 0)
          goto LABEL_119;
        lastEntity = 2;
LABEL_109:
        v46 = -21846;
        if (!v42)
          goto LABEL_112;
        goto LABEL_110;
      }
    }
    else if (v44 != 1 || v28 == 1 || lastEntity != 1)
    {
      if ((v43 & 1) == 0 && (options & 0x10) != 0 && v28 - 3 < 0xFFFFFFFFFFFFFFFELL)
        goto LABEL_109;
      goto LABEL_99;
    }
    v46 = -21846;
LABEL_110:
    if (lastEntity == 2)
    {
      v46 = 10;
LABEL_115:
      CFStringAppendCharacters((CFMutableStringRef)self->_accumulatedString, &v46, 1);
      v40 = self->_remainingLength;
      if (v40 && v40 != 0x7FFFFFFFFFFFFFFFLL)
        self->_remainingLength = v40 - 1;
      lastEntity = self->_lastEntity;
LABEL_119:
      v17 = 1;
      goto LABEL_120;
    }
    if (lastEntity != 1)
      goto LABEL_115;
LABEL_112:
    v46 = 32;
    goto LABEL_115;
  }
}

- (void)appendCustomEntityWithTag:(unint64_t)a3 stringRepresentation:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  if (self->_lastCustomEntityTag != a3)
  {
    v7 = v6;
    if (self->_lastEntity == 3)
      -[ECMessageBodyStringAccumulator appendString:](self, "appendString:", CFSTR(" "));
    -[ECMessageBodyStringAccumulator appendString:](self, "appendString:", v7);
    -[ECMessageBodyStringAccumulator appendString:](self, "appendString:", CFSTR(" "));
    self->_lastCustomEntityTag = a3;
    v6 = v7;
  }

}

- (void)appendInnerTextWithConsumableNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v4, 0);
  while (objc_msgSend(v5, "count") && !-[ECMessageBodyStringAccumulator isFull](self, "isFull"))
  {
    v6 = (void *)MEMORY[0x1BCCC9614]();
    objc_msgSend(v5, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copyConsumableNodesAndAppendInnerTextToStringAccumulator:", self);
    objc_msgSend(v5, "removeLastObject");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v8, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

    objc_autoreleasePoolPop(v6);
  }

}

- (NSString)accumulatedString
{
  return (NSString *)self->_accumulatedString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulatedString, 0);
}

@end
