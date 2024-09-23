@implementation BRLTBrailleString

- (BRLTBrailleString)init
{
  return -[BRLTBrailleString initWithBrailleChars:](self, "initWithBrailleChars:", 0);
}

- (BRLTBrailleString)initWithBrailleChars:(id)a3
{
  id v4;
  BRLTBrailleString *v5;
  uint64_t v6;
  NSMutableArray *brailleChars;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTBrailleString;
  v5 = -[BRLTBrailleString init](&v9, sel_init);
  if (v4)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  brailleChars = v5->_brailleChars;
  v5->_brailleChars = (NSMutableArray *)v6;

  return v5;
}

- (BRLTBrailleString)initWithUnicode:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  BRLTBrailleString *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v6 = 0;
    do
    {
      +[BRLTBrailleChar charWithUnichar:](BRLTBrailleChar, "charWithUnichar:", objc_msgSend(v4, "characterAtIndex:", v6));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

      ++v6;
    }
    while (v6 < objc_msgSend(v4, "length"));
  }
  v8 = -[BRLTBrailleString initWithBrailleChars:](self, "initWithBrailleChars:", v5);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BRLTBrailleString initWithBrailleChars:](+[BRLTBrailleString allocWithZone:](BRLTBrailleString, "allocWithZone:", a3), "initWithBrailleChars:", self->_brailleChars);
}

- (NSString)unicode
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_brailleChars;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "unicode", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSString *)v3;
}

- (BRLTBrailleString)initWithBrf:(id)a3
{
  void *v4;
  void *v5;
  BRLTBrailleString *v6;

  objc_msgSend(a3, "uppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRLTBrailleString brfToUnicode:](BRLTBrailleString, "brfToUnicode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BRLTBrailleString initWithUnicode:](self, "initWithUnicode:", v5);

  return v6;
}

- (NSArray)brailleChars
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_brailleChars, "copy");
}

+ (id)dinToUnicode:(id)a3
{
  id v3;
  unint64_t v4;
  __CFString *v5;
  int v6;
  int v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  __CFString *v11;
  __int16 v13;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = 0;
    v5 = &stru_24CBF1330;
    do
    {
      v6 = objc_msgSend(v3, "characterAtIndex:", v4);
      if (v6 == 32)
      {
        LOWORD(v7) = 10240;
      }
      else
      {
        v8 = qword_2114E73A8[v6];
        v7 = 10240;
        do
        {
          v7 += 1 << (~(10 * (v8 / 0xA)) + v8);
          v9 = v8 > 9;
          v8 /= 0xAuLL;
        }
        while (v9);
      }
      v13 = v7;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v4;
      v5 = v11;
    }
    while (objc_msgSend(v3, "length") > v4);
  }
  else
  {
    v11 = &stru_24CBF1330;
  }

  return v11;
}

+ (id)unicodeToDin:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  __CFString *v10;
  __int16 v11;
  void *v12;
  __CFString *v13;
  _WORD v15[256];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  for (i = 0; i != 256; ++i)
  {
    if (i == 32)
    {
      v6 = 0;
    }
    else
    {
      v6 = 0;
      v7 = qword_2114E73A8[i];
      do
      {
        v6 += (1 << (~(10 * (v7 / 0xA)) + v7));
        v8 = v7 > 9;
        v7 /= 0xAuLL;
      }
      while (v8);
    }
    v15[v6] = i;
  }
  if (objc_msgSend(v3, "length"))
  {
    v9 = 0;
    v10 = &stru_24CBF1330;
    do
    {
      v11 = objc_msgSend(v4, "characterAtIndex:", v9);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v15[(unsigned __int16)(v11 - 10240)], 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v9;
      v10 = v13;
    }
    while (objc_msgSend(v4, "length") > v9);
  }
  else
  {
    v13 = &stru_24CBF1330;
  }

  return v13;
}

+ (id)brfTable
{
  return CFSTR(" A1B'K2L@CIF/MSP\"E3H9O6R^DJG>NTQ,*5<-U8V.%[$+X!&;:4\\0Z7(_?W]#Y)=");
}

+ (id)brfToUnicode:(id)a3
{
  void *v4;
  void *v5;
  _WORD *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "uppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "brfTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = malloc_type_malloc(2 * objc_msgSend(v4, "length"), 0x1000040BDFB0063uLL);
  if (objc_msgSend(v4, "length"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(v4, "substringWithRange:", v7, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6[v7] = objc_msgSend(v5, "rangeOfString:", v8) + 10240;

      ++v7;
    }
    while (objc_msgSend(v4, "length") > v7);
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v6, objc_msgSend(v4, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  free(v6);

  return v9;
}

+ (BOOL)isValidBRF:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  BOOL v6;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__BRLTBrailleString_isValidBRF___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = isValidBRF__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isValidBRF__onceToken, block);
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "rangeOfCharacterFromSet:", isValidBRF__nonBrfSet) == 0x7FFFFFFFFFFFFFFFLL;
  return v6;
}

void __32__BRLTBrailleString_isValidBRF___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "brfTable");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v5);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)isValidBRF__brfSet;
  isValidBRF__brfSet = v1;

  objc_msgSend((id)isValidBRF__brfSet, "invertedSet");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)isValidBRF__nonBrfSet;
  isValidBRF__nonBrfSet = v3;

}

+ (id)unicodeToBestEffortBrf:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (unicodeToBestEffortBrf__onceToken != -1)
    dispatch_once(&unicodeToBestEffortBrf__onceToken, &__block_literal_global_3);
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v5 = 0;
    do
    {
      v6 = objc_msgSend(v3, "characterAtIndex:", v5);
      v7 = v6 - 10240;
      if (v7 >= 0x40)
        v8 = v5;
      else
        v8 = v6 - 10240;
      if (v7 >= 0x40)
        v9 = v3;
      else
        v9 = (void *)unicodeToBestEffortBrf__brfTable;
      objc_msgSend(v9, "substringWithRange:", v8, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendString:", v10);

      ++v5;
    }
    while (v5 < objc_msgSend(v3, "length"));
  }

  return v4;
}

void __44__BRLTBrailleString_unicodeToBestEffortBrf___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)unicodeToBestEffortBrf__brfTable;
  unicodeToBestEffortBrf__brfTable = (uint64_t)CFSTR(" A1B'K2L@CIF/MSP\"E3H9O6R^DJG>NTQ,*5<-U8V.%[$+X!&;:4\\0Z7(_?W]#Y)=");

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(" A1B'K2L@CIF/MSP\"E3H9O6R^DJG>NTQ,*5<-U8V.%[$+X!&;:4\\0Z7(_?W]#Y)="));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)unicodeToBestEffortBrf__brfSet;
  unicodeToBestEffortBrf__brfSet = v1;

  objc_msgSend((id)unicodeToBestEffortBrf__brfSet, "invertedSet");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)unicodeToBestEffortBrf__nonBrfSet;
  unicodeToBestEffortBrf__nonBrfSet = v3;

}

- (id)bestEffortBrf
{
  void *v2;
  void *v3;

  -[BRLTBrailleString unicode](self, "unicode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRLTBrailleString unicodeToBestEffortBrf:](BRLTBrailleString, "unicodeToBestEffortBrf:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqualToBrailleString:(id)a3
{
  NSMutableArray *brailleChars;
  void *v4;

  brailleChars = self->_brailleChars;
  objc_msgSend(a3, "brailleChars");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(brailleChars) = -[NSMutableArray isEqualToArray:](brailleChars, "isEqualToArray:", v4);

  return (char)brailleChars;
}

- (BOOL)isEqual:(id)a3
{
  BRLTBrailleString *v4;
  BOOL v5;

  v4 = (BRLTBrailleString *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[BRLTBrailleString isEqualToBrailleString:](self, "isEqualToBrailleString:", v4);
  }

  return v5;
}

- (unint64_t)length
{
  return -[NSMutableArray count](self->_brailleChars, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brailleChars, 0);
}

@end
