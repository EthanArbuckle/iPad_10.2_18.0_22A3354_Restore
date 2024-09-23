@implementation NSTokenMatchingPredicateOperator

- (id)symbol
{
  return (id)objc_msgSend(CFSTR("TOKENMATCHES"), "stringByAppendingString:", -[NSStringPredicateOperator _modifierString](self, "_modifierString"));
}

- (SEL)selector
{
  return sel_tokenmatches_;
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  char v6;
  uint64_t v7;
  __CFLocale *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (!a3 || !a4)
    return 0;
  v6 = -[NSStringPredicateOperator flags](self, "flags");
  if ((v6 & 4) != 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = v6 & 3;
    if ((v6 & 8) != 0)
    {
      v8 = +[_NSPredicateOperatorUtilities retainedLocale](_NSPredicateOperatorUtilities, "retainedLocale");
      goto LABEL_9;
    }
  }
  v8 = 0;
LABEL_9:
  if (_NSIsNSString())
  {
    v10 = +[_NSPredicateUtilities _processAndTokenize:flags:locale:]((uint64_t)_NSPredicateUtilities, (__CFString *)a3, v7, v8);
  }
  else
  {
    if ((_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && !_NSIsNSOrderedSet())
      goto LABEL_22;
    v10 = +[_NSPredicateUtilities _collapseAndTokenize:flags:locale:]((uint64_t)_NSPredicateUtilities, a3, v7, v8);
  }
  v11 = v10;
  if (!_NSIsNSString())
  {
    if ((_NSIsNSArray() & 1) != 0 || (_NSIsNSSet() & 1) != 0 || _NSIsNSOrderedSet())
    {
      v12 = +[_NSPredicateUtilities _collapseAndTokenize:flags:locale:]((uint64_t)_NSPredicateUtilities, a4, v7, v8);
      goto LABEL_21;
    }
LABEL_22:

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to tokenize : %@"), 0), 0));
  }
  v12 = +[_NSPredicateUtilities _processAndTokenize:flags:locale:]((uint64_t)_NSPredicateUtilities, (__CFString *)a4, v7, v8);
LABEL_21:
  v13 = v12;

  return objc_msgSend(v11, "intersectsSet:", v13);
}

@end
