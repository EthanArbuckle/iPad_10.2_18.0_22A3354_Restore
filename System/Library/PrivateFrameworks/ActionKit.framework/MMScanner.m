@implementation MMScanner

- (MMScanner)initWithString:(id)a3
{
  id v4;
  void *v5;
  MMScanner *v6;

  v4 = a3;
  -[MMScanner _lineRangesForString:](self, "_lineRangesForString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MMScanner initWithString:lineRanges:](self, "initWithString:lineRanges:", v4, v5);

  return v6;
}

- (MMScanner)initWithString:(id)a3 lineRanges:(id)a4
{
  id v8;
  id v9;
  MMScanner *v10;
  MMScanner *v11;
  uint64_t v12;
  NSMutableArray *transactions;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MMScanner.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("theLineRanges.count > 0"));

  }
  v18.receiver = self;
  v18.super_class = (Class)MMScanner;
  v10 = -[MMScanner init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_string, a3);
    objc_storeStrong((id *)&v11->_lineRanges, a4);
    v11->_rangeIndex = 0;
    v12 = objc_opt_new();
    transactions = v11->_transactions;
    v11->_transactions = (NSMutableArray *)v12;

    -[MMScanner setStartLocation:](v11, "setStartLocation:", 0);
    v14 = -[MMScanner currentLineRange](v11, "currentLineRange");
    -[MMScanner setCurrentRange:](v11, "setCurrentRange:", v14, v15);
  }

  return v11;
}

- (void)beginTransaction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("rangeIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MMScanner rangeIndex](self, "rangeIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("location");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MMScanner location](self, "location"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("startLocation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MMScanner startLocation](self, "startLocation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MMScanner transactions](self, "transactions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

  -[MMScanner setStartLocation:](self, "setStartLocation:", -[MMScanner location](self, "location"));
}

- (void)commitTransaction:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[MMScanner transactions](self, "transactions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Transaction underflow"), CFSTR("Could not commit transaction because the stack is empty"));
  -[MMScanner transactions](self, "transactions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[MMScanner transactions](self, "transactions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeLastObject");

  objc_msgSend(v12, "objectForKey:", CFSTR("startLocation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MMScanner setStartLocation:](self, "setStartLocation:", objc_msgSend(v9, "unsignedIntegerValue"));

  if (!a3)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("rangeIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MMScanner setRangeIndex:](self, "setRangeIndex:", objc_msgSend(v10, "unsignedIntegerValue"));

    objc_msgSend(v12, "objectForKey:", CFSTR("location"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MMScanner setLocation:](self, "setLocation:", objc_msgSend(v11, "unsignedIntegerValue"));

  }
}

- (BOOL)atBeginningOfLine
{
  unint64_t v3;

  v3 = -[MMScanner location](self, "location");
  return v3 == -[MMScanner currentLineRange](self, "currentLineRange");
}

- (BOOL)atEndOfLine
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[MMScanner location](self, "location");
  v4 = -[MMScanner currentLineRange](self, "currentLineRange");
  return v3 == v4 + v5;
}

- (BOOL)atEndOfString
{
  unint64_t v3;
  void *v4;
  BOOL v5;

  if (!-[MMScanner atEndOfLine](self, "atEndOfLine"))
    return 0;
  v3 = -[MMScanner rangeIndex](self, "rangeIndex");
  -[MMScanner lineRanges](self, "lineRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == objc_msgSend(v4, "count") - 1;

  return v5;
}

- (unsigned)previousCharacter
{
  void *v4;
  unsigned __int16 v5;

  if (-[MMScanner atBeginningOfLine](self, "atBeginningOfLine"))
    return 0;
  -[MMScanner string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "characterAtIndex:", -[MMScanner location](self, "location") - 1);

  return v5;
}

- (unsigned)nextCharacter
{
  void *v4;
  unsigned __int16 v5;

  if (-[MMScanner atEndOfLine](self, "atEndOfLine"))
    return 10;
  -[MMScanner string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "characterAtIndex:", -[MMScanner location](self, "location"));

  return v5;
}

- (id)previousWord
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MMScanner previousWordWithCharactersFromSet:](self, "previousWordWithCharactersFromSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nextWord
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MMScanner nextWordWithCharactersFromSet:](self, "nextWordWithCharactersFromSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)previousWordWithCharactersFromSet:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = -[MMScanner currentLineRange](self, "currentLineRange");
  v6 = -[MMScanner startLocation](self, "startLocation");
  if (v5 <= v6)
    v5 = v6;
  v7 = -[MMScanner currentRange](self, "currentRange");
  v8 = v7 - v5;
  -[MMScanner string](self, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invertedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "rangeOfCharacterFromSet:options:range:", v10, 4, v5, v7 - v5);
  v13 = v12;

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v11 + v13;
    v8 = v7 - (v11 + v13);
  }
  -[MMScanner string](self, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "substringWithRange:", v5, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)nextWordWithCharactersFromSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  -[MMScanner string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MMScanner currentRange](self, "currentRange");
  v9 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", v6, 0, v7, v8);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[MMScanner string](self, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MMScanner currentRange](self, "currentRange");
    v12 = v10;
    v14 = v13;
  }
  else
  {
    v15 = -[MMScanner currentRange](self, "currentRange");
    v16 = v9 - v15;
    -[MMScanner string](self, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    v11 = v15;
    v14 = v16;
  }
  objc_msgSend(v12, "substringWithRange:", v11, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)advance
{
  if (!-[MMScanner atEndOfLine](self, "atEndOfLine"))
    -[MMScanner setLocation:](self, "setLocation:", -[MMScanner location](self, "location") + 1);
}

- (void)advanceToNextLine
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[MMScanner rangeIndex](self, "rangeIndex");
  -[MMScanner lineRanges](self, "lineRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") - 1;

  if (v3 == v5)
  {
    v6 = -[MMScanner currentLineRange](self, "currentLineRange");
    -[MMScanner setLocation:](self, "setLocation:", v6 + v7);
  }
  else
  {
    -[MMScanner setRangeIndex:](self, "setRangeIndex:", -[MMScanner rangeIndex](self, "rangeIndex") + 1);
    v8 = -[MMScanner currentLineRange](self, "currentLineRange");
    -[MMScanner setCurrentRange:](self, "setCurrentRange:", v8, v9);
  }
}

- (BOOL)matchString:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  int v11;

  v4 = a3;
  -[MMScanner currentRange](self, "currentRange");
  if (v5 >= objc_msgSend(v4, "length"))
  {
    v7 = -[MMScanner location](self, "location");
    if (!objc_msgSend(v4, "length"))
    {
LABEL_7:
      -[MMScanner setLocation:](self, "setLocation:", -[MMScanner location](self, "location") + objc_msgSend(v4, "length"));
      v6 = 1;
      goto LABEL_8;
    }
    v8 = 0;
    while (1)
    {
      v9 = objc_msgSend(v4, "characterAtIndex:", v8);
      -[MMScanner string](self, "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "characterAtIndex:", v7 + v8);

      if (v9 != v11)
        break;
      if (++v8 >= (unint64_t)objc_msgSend(v4, "length"))
        goto LABEL_7;
    }
  }
  v6 = 0;
LABEL_8:

  return v6;
}

- (unint64_t)skipCharactersFromSet:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v5 = -[MMScanner currentRange](self, "currentRange");
  v7 = v6;
  -[MMScanner string](self, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invertedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v9, 0, v5, v7);
  v11 = -[MMScanner location](self, "location");
  v12 = -[MMScanner currentRange](self, "currentRange");
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    v14 = v12 + v13;
  else
    v14 = v10;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    v15 = 0;
  else
    v15 = v13 - v10 + v12;
  -[MMScanner setCurrentRange:](self, "setCurrentRange:", v14, v15);
  return -[MMScanner location](self, "location") - v11;
}

- (unint64_t)skipCharactersFromSet:(id)a3 max:(unint64_t)a4
{
  id v6;
  unint64_t v7;

  v6 = a3;
  v7 = 0;
  if (a4)
  {
    while (objc_msgSend(v6, "characterIsMember:", -[MMScanner nextCharacter](self, "nextCharacter")))
    {
      -[MMScanner advance](self, "advance");
      if (a4 == ++v7)
      {
        v7 = a4;
        break;
      }
    }
  }

  return v7;
}

- (unint64_t)skipEmptyLines
{
  unint64_t v3;

  v3 = 0;
  if (!-[MMScanner atEndOfString](self, "atEndOfString"))
  {
    while (1)
    {
      -[MMScanner beginTransaction](self, "beginTransaction");
      -[MMScanner skipWhitespace](self, "skipWhitespace");
      if (!-[MMScanner atEndOfLine](self, "atEndOfLine"))
        break;
      -[MMScanner commitTransaction:](self, "commitTransaction:", 1);
      -[MMScanner advanceToNextLine](self, "advanceToNextLine");
      ++v3;
      if (-[MMScanner atEndOfString](self, "atEndOfString"))
        return v3;
    }
    -[MMScanner commitTransaction:](self, "commitTransaction:", 0);
  }
  return v3;
}

- (unint64_t)skipIndentationUpTo:(unint64_t)a3
{
  unint64_t v5;
  int v6;

  -[MMScanner beginTransaction](self, "beginTransaction");
  v5 = 0;
  if (!-[MMScanner atEndOfLine](self, "atEndOfLine") && a3)
  {
    v5 = 0;
    do
    {
      v6 = -[MMScanner nextCharacter](self, "nextCharacter");
      if (v6 == 9)
      {
        v5 = (v5 & 0xFFFFFFFFFFFFFFFCLL) + 4;
      }
      else
      {
        if (v6 != 32)
          break;
        ++v5;
      }
      -[MMScanner advance](self, "advance");
    }
    while (!-[MMScanner atEndOfLine](self, "atEndOfLine") && v5 < a3);
  }
  -[MMScanner commitTransaction:](self, "commitTransaction:", v5 <= a3);
  return v5;
}

- (unint64_t)skipNestedBracketsWithDelimiter:(unsigned __int16)a3
{
  char v4;
  __CFString *v5;
  int v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;

  v4 = a3 - 40;
  if ((a3 - 40) <= 0x35)
  {
    if (((1 << v4) & 3) != 0)
    {
      v5 = CFSTR("()");
      goto LABEL_12;
    }
    if (((1 << v4) & 0x500000) != 0)
    {
      v5 = CFSTR("<>");
      goto LABEL_12;
    }
    if (((1 << v4) & 0x28000000000000) != 0)
    {
      v5 = CFSTR("[]");
      goto LABEL_12;
    }
  }
  if (a3 == 123 || a3 == 125)
  {
    v5 = CFSTR("{}");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Invalid delimiter character"), CFSTR("Character '%C' is not a valid delimiter"), a3);
    v5 = 0;
  }
LABEL_12:
  v6 = -[__CFString characterAtIndex:](v5, "characterAtIndex:", 0);
  v7 = -[__CFString characterAtIndex:](v5, "characterAtIndex:", 1);
  v8 = 0;
  if (-[MMScanner nextCharacter](self, "nextCharacter") == v6)
  {
    -[MMScanner beginTransaction](self, "beginTransaction");
    v9 = -[MMScanner location](self, "location");
    -[MMScanner advance](self, "advance");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\\"), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invertedSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 1;
    while (!-[MMScanner atEndOfLine](self, "atEndOfLine"))
    {
      -[MMScanner skipCharactersFromSet:](self, "skipCharactersFromSet:", v12);
      v14 = -[MMScanner nextCharacter](self, "nextCharacter");
      -[MMScanner advance](self, "advance");
      if (v14 == v6)
      {
        ++v13;
      }
      else if (v14 == v7)
      {
        --v13;
      }
      else if (v14 == 92)
      {
        -[MMScanner advance](self, "advance");
      }
      if (!v13)
      {
        -[MMScanner commitTransaction:](self, "commitTransaction:", 1);
        v8 = -[MMScanner location](self, "location") - v9;
        goto LABEL_24;
      }
    }
    -[MMScanner commitTransaction:](self, "commitTransaction:", 0);
    v8 = 0;
LABEL_24:

  }
  return v8;
}

- (unint64_t)skipToEndOfLine
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[MMScanner currentRange](self, "currentRange");
  v4 = v3;
  v5 = -[MMScanner currentRange](self, "currentRange");
  -[MMScanner setLocation:](self, "setLocation:", v5 + v6);
  return v4;
}

- (unint64_t)skipToLastCharacterOfLine
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[MMScanner currentRange](self, "currentRange");
  v4 = v3 - 1;
  v5 = -[MMScanner currentRange](self, "currentRange");
  -[MMScanner setLocation:](self, "setLocation:", v6 + v5 - 1);
  return v4;
}

- (unint64_t)skipWhitespace
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MMScanner skipCharactersFromSet:](self, "skipCharactersFromSet:", v3);

  return v4;
}

- (unint64_t)skipWhitespaceAndNewlines
{
  void *v3;
  unint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  if (!-[MMScanner atEndOfString](self, "atEndOfString"))
  {
    do
    {
      if (-[MMScanner atEndOfLine](self, "atEndOfLine"))
      {
        -[MMScanner advanceToNextLine](self, "advanceToNextLine");
        ++v4;
      }
      else
      {
        v5 = -[MMScanner skipCharactersFromSet:](self, "skipCharactersFromSet:", v3);
        v4 += v5;
        if (!v5)
          break;
      }
    }
    while (!-[MMScanner atEndOfString](self, "atEndOfString"));
  }

  return v4;
}

- (void)setLocation:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = -[MMScanner currentLineRange](self, "currentLineRange");
  if (a3 < v5 || a3 - v5 >= v6)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    -[MMScanner lineRanges](self, "lineRanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __25__MMScanner_setLocation___block_invoke;
    v10[3] = &unk_24F8B5348;
    v10[4] = &v11;
    v10[5] = a3;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

    -[MMScanner setRangeIndex:](self, "setRangeIndex:", v12[3]);
    _Block_object_dispose(&v11, 8);
  }
  v8 = -[MMScanner currentLineRange](self, "currentLineRange");
  -[MMScanner setCurrentRange:](self, "setCurrentRange:", a3, v9 - a3 + v8);
}

- (id)_lineRangesForString:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = objc_msgSend(v3, "characterAtIndex:", v5);
      v8 = v7;
      if (v7 == 10 || v7 == 13)
      {
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v6, v5 - v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v9);

        if (v8 == 13
          && v5 + 1 < objc_msgSend(v3, "length")
          && objc_msgSend(v3, "characterAtIndex:", v5 + 1) == 10)
        {
          ++v5;
        }
        v6 = ++v5;
      }
      else
      {
        ++v5;
      }
    }
    while (v5 < objc_msgSend(v3, "length"));
  }
  else
  {
    v6 = 0;
  }
  if (v6 < objc_msgSend(v3, "length"))
  {
    v10 = objc_msgSend(v3, "length");
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v6, v10 - v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

  }
  return v4;
}

- (unint64_t)_locationOfCharacter:(unsigned __int16)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unsigned __int16 v12;

  length = a4.length;
  location = a4.location;
  v12 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MMScanner string](self, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "rangeOfCharacterFromSet:options:range:", v8, 0, location, length);

  return v10;
}

- (_NSRange)currentLineRange
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  -[MMScanner lineRanges](self, "lineRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", -[MMScanner rangeIndex](self, "rangeIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeValue");
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (NSString)string
{
  return self->_string;
}

- (NSArray)lineRanges
{
  return self->_lineRanges;
}

- (unint64_t)startLocation
{
  return self->_startLocation;
}

- (void)setStartLocation:(unint64_t)a3
{
  self->_startLocation = a3;
}

- (_NSRange)currentRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_currentRange.length;
  location = self->_currentRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setCurrentRange:(_NSRange)a3
{
  self->_currentRange = a3;
}

- (unint64_t)rangeIndex
{
  return self->_rangeIndex;
}

- (void)setRangeIndex:(unint64_t)a3
{
  self->_rangeIndex = a3;
}

- (NSMutableArray)transactions
{
  return self->_transactions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_lineRanges, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

unint64_t __25__MMScanner_setLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  unint64_t result;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  BOOL v12;
  char v13;

  result = objc_msgSend(a2, "rangeValue");
  v9 = *(_QWORD *)(a1 + 40);
  v10 = v9 == result + v8;
  v12 = v9 >= result;
  v11 = v9 - result;
  v12 = !v12 || v11 >= v8;
  v13 = !v12 || v10;
  *a4 = v13;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  return result;
}

+ (id)scannerWithString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithString:", v3);

  return v4;
}

+ (id)scannerWithString:(id)a3 lineRanges:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithString:lineRanges:", v6, v5);

  return v7;
}

@end
