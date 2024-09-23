@implementation HDOntologyTSVScanner

- (HDOntologyTSVScanner)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDOntologyTSVScanner)initWithString:(id)a3
{
  id v4;
  HDOntologyTSVScanner *v5;
  uint64_t v6;
  NSScanner *scanner;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDOntologyTSVScanner;
  v5 = -[HDOntologyTSVScanner init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v4);
    scanner = v5->_scanner;
    v5->_scanner = (NSScanner *)v6;

    -[NSScanner setCharactersToBeSkipped:](v5->_scanner, "setCharactersToBeSkipped:", 0);
  }

  return v5;
}

- (id)description
{
  void *v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  -[NSScanner string](self->_scanner, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSScanner scanLocation](self->_scanner, "scanLocation");
  v5 = objc_msgSend(v3, "length");
  v6 = v5 + ~v4;
  if (v6 >= 0xA)
    v7 = 10;
  else
    v7 = v5 + ~v4;
  if (v6 >= 0xA)
    v8 = CFSTR("...");
  else
    v8 = &stru_1E6D11BB8;
  objc_msgSend(v3, "substringWithRange:", v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p \"%@\"%@>"), objc_opt_class(), self, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isAtEnd
{
  return -[NSScanner isAtEnd](self->_scanner, "isAtEnd");
}

- (BOOL)scanLongLong:(int64_t *)a3
{
  BOOL v4;

  v4 = -[NSScanner scanLongLong:](self->_scanner, "scanLongLong:", a3);
  if (!-[NSScanner scanString:intoString:](self->_scanner, "scanString:intoString:", CFSTR("\t"), 0))
    -[HDOntologyTSVScanner scanString:](self, "scanString:", 0);
  return v4;
}

- (BOOL)scanString:(id *)a3
{
  _BOOL4 v5;
  BOOL v6;
  void *v7;
  void *v8;

  v5 = -[NSScanner scanUpToString:intoString:](self->_scanner, "scanUpToString:intoString:", CFSTR("\t"), a3);
  v6 = v5;
  if (a3 && v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", *a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\t"), CFSTR("\t"), 2, 0, objc_msgSend(v7, "length"));
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\n"), CFSTR("\n"), 2, 0, objc_msgSend(v7, "length"));
    v8 = (void *)objc_msgSend(v7, "copy");

    *a3 = v8;
  }
  -[NSScanner scanString:intoString:](self->_scanner, "scanString:intoString:", CFSTR("\t"), 0);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanner, 0);
}

@end
