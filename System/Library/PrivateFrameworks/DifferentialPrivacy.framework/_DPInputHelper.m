@implementation _DPInputHelper

- (_DPInputHelper)init
{
  _DPInputHelper *v2;
  uint64_t v3;
  NSNumberFormatter *fmt;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DPInputHelper;
  v2 = -[_DPInputHelper init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    fmt = v2->_fmt;
    v2->_fmt = (NSNumberFormatter *)v3;

    -[NSNumberFormatter setNumberStyle:](v2->_fmt, "setNumberStyle:", 1);
  }
  return v2;
}

- (id)nonEmptyStringsFromFileAtPath:(id)a3 separatedBy:(id)a4 encoding:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v7, a5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69___DPInputHelper_nonEmptyStringsFromFileAtPath_separatedBy_encoding___block_invoke;
  v15[3] = &unk_1E95D9B48;
  v13 = v12;
  v16 = v13;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);

  objc_autoreleasePoolPop(v9);
  return v13;
}

- (id)nonEmptyStringsFromFileAtPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3500];
  v5 = a3;
  objc_msgSend(v4, "newlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPInputHelper nonEmptyStringsFromFileAtPath:separatedBy:encoding:](self, "nonEmptyStringsFromFileAtPath:separatedBy:encoding:", v5, v6, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)nonEmptyStringsFromFileAtPath:(id)a3 encoding:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3500];
  v7 = a3;
  objc_msgSend(v6, "newlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPInputHelper nonEmptyStringsFromFileAtPath:separatedBy:encoding:](self, "nonEmptyStringsFromFileAtPath:separatedBy:encoding:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)nonEmptyNonWhitespaceStringsFromFileAtPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3500];
  v5 = a3;
  objc_msgSend(v4, "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPInputHelper nonEmptyStringsFromFileAtPath:separatedBy:encoding:](self, "nonEmptyStringsFromFileAtPath:separatedBy:encoding:", v5, v6, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)numbersFromFileAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8256B78]();
  -[_DPInputHelper nonEmptyNonWhitespaceStringsFromFileAtPath:](self, "nonEmptyNonWhitespaceStringsFromFileAtPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40___DPInputHelper_numbersFromFileAtPath___block_invoke;
  v10[3] = &unk_1E95D9B20;
  v10[4] = self;
  v8 = v7;
  v11 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  objc_autoreleasePoolPop(v5);
  return v8;
}

- (id)numberFromString:(id)a3
{
  return -[NSNumberFormatter numberFromString:](self->_fmt, "numberFromString:", a3);
}

- (NSNumberFormatter)fmt
{
  return self->_fmt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmt, 0);
}

@end
