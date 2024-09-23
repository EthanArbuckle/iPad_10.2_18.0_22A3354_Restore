@implementation COKeyPath

- (COKeyPath)initWithComponents:(id)a3
{
  id v5;
  COKeyPath *v6;
  COKeyPath *v7;
  NSString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  NSString *absoluteString;
  NSString *v16;
  COKeyPath *v17;
  uint64_t v19;
  NSObject *v20;
  id obj;
  COKeyPath *v22;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)COKeyPath;
  v6 = -[COKeyPath init](&v23, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_10;
  obj = a3;
  v22 = v6;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
LABEL_9:
    v7 = v22;
    absoluteString = v22->_absoluteString;
    v22->_absoluteString = v8;
    v16 = v8;

    objc_storeStrong((id *)&v22->_components, obj);
LABEL_10:
    v17 = v7;
    goto LABEL_11;
  }
  v9 = 0;
  while (1)
  {
    objc_msgSend(v5, "objectAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[COKeyPath allowedCharacterSet](COKeyPath, "allowedCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invertedSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v10, "rangeOfCharacterFromSet:", v12);
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      break;
    if (v9)
      v14 = CFSTR(".%@");
    else
      v14 = CFSTR("%@");
    -[NSString appendFormat:](v8, "appendFormat:", v14, v10);

    if (++v9 >= (unint64_t)objc_msgSend(v5, "count"))
      goto LABEL_9;
  }
  v19 = v13;
  COLogForCategory(4);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[COKeyPath initWithComponents:].cold.1(v10, v19, v20);

  v17 = 0;
  v7 = v22;
LABEL_11:

  return v17;
}

+ (id)createWithString:(id)a3
{
  id v3;
  COKeyPath *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(COKeyPath);
  -[COKeyPath setAbsoluteString:](v4, "setAbsoluteString:", v3);
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[COKeyPath setComponents:](v4, "setComponents:", v5);
  return v4;
}

+ (id)allowedCharacterSet
{
  if (allowedCharacterSet_onceToken != -1)
    dispatch_once(&allowedCharacterSet_onceToken, &__block_literal_global_6);
  return (id)allowedCharacterSet_allowedCharacterSet;
}

void __32__COKeyPath_allowedCharacterSet__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v1);

  objc_msgSend(MEMORY[0x24BDD14A8], "lowercaseLetterCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v2);

  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v3);

  objc_msgSend(v0, "addCharactersInString:", CFSTR("_"));
  objc_msgSend(v0, "addCharactersInString:", CFSTR("-"));
  v4 = (void *)allowedCharacterSet_allowedCharacterSet;
  allowedCharacterSet_allowedCharacterSet = (uint64_t)v0;

}

+ (id)predicateWithComponents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF contains %@"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, v4);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  COKeyPath *v4;
  NSString *absoluteString;
  void *v6;
  char v7;

  v4 = (COKeyPath *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    absoluteString = self->_absoluteString;
    -[COKeyPath absoluteString](v4, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqualToString:](absoluteString, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[COKeyPath absoluteString](self, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[COKeyPath absoluteString](self, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)absoluteString
{
  return self->_absoluteString;
}

- (void)setAbsoluteString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_absoluteString, 0);
}

- (void)initWithComponents:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v4[0] = 67109120;
  v4[1] = objc_msgSend(a1, "characterAtIndex:", a2);
  _os_log_error_impl(&dword_21214B000, a3, OS_LOG_TYPE_ERROR, "COKeyPath components contains an invalid character '%c'", (uint8_t *)v4, 8u);
}

@end
