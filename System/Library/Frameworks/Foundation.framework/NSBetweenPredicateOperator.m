@implementation NSBetweenPredicateOperator

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "_newOperatorWithType:modifier:options:", -[NSBetweenPredicateOperator operatorType](self, "operatorType"), -[NSPredicateOperator modifier](self, "modifier"), 0);
}

- (unint64_t)operatorType
{
  return 100;
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  BOOL result;
  const char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *v13;

  result = 0;
  if (!a3 || !a4)
    return result;
  if ((_NSIsNSArray() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't use between operator with rhs %@ (not an array)"), a4);
    goto LABEL_13;
  }
  if (objc_msgSend(a4, "count") != 2)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't use between operator with rhs %@ (wrong number of elements)"), a4);
LABEL_13:
    objc_exception_throw((id)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, 0));
  }
  v8 = -[NSPredicateOperator selector](self, "selector");
  v9 = (void *)objc_msgSend(a4, "objectAtIndex:", 0);
  v10 = objc_msgSend(a4, "objectAtIndex:", 1);
  if (objc_msgSend(v9, v8, v10) == (id)1)
  {
    v9 = (void *)objc_msgSend(a4, "objectAtIndex:", 1);
    v10 = objc_msgSend(a4, "objectAtIndex:", 0);
  }
  return (unint64_t)objc_msgSend(v9, v8, a3) + 1 <= 1 && (unint64_t)objc_msgSend(a3, v8, v10) + 1 < 2;
}

@end
