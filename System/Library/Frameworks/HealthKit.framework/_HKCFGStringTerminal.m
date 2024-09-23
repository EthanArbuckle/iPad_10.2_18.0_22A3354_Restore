@implementation _HKCFGStringTerminal

- (BOOL)_scanValue:(id *)a3 withScanner:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  id v13;

  v6 = a4;
  v7 = objc_msgSend(v6, "caseSensitive");
  objc_msgSend(v6, "setCaseSensitive:", *((unsigned __int8 *)&self->super.super._isPrivate + 1));
  v8 = *(_QWORD *)&self->_caseSensitive;
  v13 = 0;
  v9 = objc_msgSend(v6, "scanString:intoString:", v8, &v13);
  v10 = v13;
  v11 = v10;
  if (v9)
    *a3 = objc_retainAutorelease(v10);
  objc_msgSend(v6, "setCaseSensitive:", v7);

  return v9;
}

- (id)_label
{
  return *(id *)&self->_caseSensitive;
}

- (unint64_t)_minimumLength
{
  return objc_msgSend(*(id *)&self->_caseSensitive, "length");
}

- (id)characterSet
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  v4 = v3;
  if (*(&self->super.super._isPrivate + 1))
  {
    objc_msgSend(v3, "addCharactersInString:", *(_QWORD *)&self->_caseSensitive);
  }
  else
  {
    objc_msgSend(*(id *)&self->_caseSensitive, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addCharactersInString:", v5);

    objc_msgSend(*(id *)&self->_caseSensitive, "uppercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addCharactersInString:", v6);

  }
  return v4;
}

- (NSString)string
{
  return *(NSString **)&self->_caseSensitive;
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)caseSensitive
{
  return *(&self->super.super._isPrivate + 1);
}

- (void)setCaseSensitive:(BOOL)a3
{
  *(&self->super.super._isPrivate + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caseSensitive, 0);
}

@end
