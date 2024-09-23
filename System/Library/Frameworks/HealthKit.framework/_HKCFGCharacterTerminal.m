@implementation _HKCFGCharacterTerminal

- (BOOL)_scanValue:(id *)a3 withScanner:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;

  v6 = a4;
  objc_msgSend(v6, "charactersToBeSkipped");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "charactersToBeSkipped");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCharactersToBeSkipped:", 0);
    objc_msgSend(v6, "scanCharactersFromSet:intoString:", v8, 0);
    objc_msgSend(v6, "setCharactersToBeSkipped:", v8);

  }
  if ((objc_msgSend(v6, "isAtEnd") & 1) != 0
    || (v9 = objc_msgSend(v6, "scanLocation"),
        objc_msgSend(v6, "string"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "characterAtIndex:", v9),
        v10,
        !-[NSCharacterSet characterIsMember:](self->_characterSet, "characterIsMember:", v11)))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v6, "setScanLocation:", v9 + 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 1;
  }

  return v12;
}

- (id)_label
{
  return CFSTR("<c>");
}

- (unint64_t)_minimumLength
{
  return 1;
}

- (NSCharacterSet)characterSet
{
  return self->_characterSet;
}

- (void)setCharacterSet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterSet, 0);
}

@end
