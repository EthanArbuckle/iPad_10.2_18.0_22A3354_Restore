@implementation _HKCFGCharacterSequenceTerminal

- (BOOL)_scanValue:(id *)a3 withScanner:(id)a4
{
  NSCharacterSet *characterSet;
  int v6;
  id v7;
  void *v8;
  id v10;

  characterSet = self->_characterSet;
  v10 = 0;
  v6 = objc_msgSend(a4, "scanCharactersFromSet:intoString:", characterSet, &v10);
  v7 = v10;
  v8 = v7;
  if (v6)
    *a3 = objc_retainAutorelease(v7);

  return v6;
}

- (id)_label
{
  return CFSTR("<c+>");
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
