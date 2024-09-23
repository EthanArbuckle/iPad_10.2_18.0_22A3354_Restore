@implementation NSBoundedByPredicateOperator

- (id)symbol
{
  return CFSTR("BOUNDEDBY");
}

- (unint64_t)operatorType
{
  return 2000;
}

- (SEL)selector
{
  return sel_boundedBy_;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "_newOperatorWithType:modifier:options:", -[NSBoundedByPredicateOperator operatorType](self, "operatorType"), -[NSPredicateOperator modifier](self, "modifier"), 0);
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  BOOL result;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  NSString *v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  NSString *v28;

  result = 0;
  if (!a3 || !a4)
    return result;
  if ((_NSIsNSArray() & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't use boundedBy operator with rhs %@ (not an array)"), a4);
LABEL_21:
    v25 = (const __CFString *)v22;
    v23 = v20;
    v24 = v21;
    goto LABEL_25;
  }
  if (objc_msgSend(a4, "count") != 2)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't use boundedBy operator with rhs %@ (wrong number of elements)"), a4);
    goto LABEL_21;
  }
  v7 = (void *)objc_msgSend(a4, "objectAtIndex:", 0);
  v8 = (void *)objc_msgSend(a4, "objectAtIndex:", 1);
  if (!objc_lookUpClass("CLLocation"))
  {
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99768];
    v25 = CFSTR("Can't use boundedBy operator unless CLLocation is linked.");
    goto LABEL_25;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't use boundedBy operator with rhs %@ (wrong class, should be CLLocation)"), a4);
    goto LABEL_21;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1E0C99DA0];
    v27 = *MEMORY[0x1E0C99778];
    v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't use boundedBy operator with upperRight %@ (wrong class, should be CLLocation)"), v7);
LABEL_24:
    v25 = (const __CFString *)v28;
    v23 = v26;
    v24 = v27;
LABEL_25:
    objc_exception_throw((id)objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v24, v25, 0));
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1E0C99DA0];
    v27 = *MEMORY[0x1E0C99778];
    v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't use boundedBy operator with lowerRight %@ (wrong class, should be CLLocation)"), v8);
    goto LABEL_24;
  }
  objc_msgSend(v7, "coordinate");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v8, "coordinate");
  v14 = v13;
  v16 = v15;
  objc_msgSend(a3, "coordinate");
  v19 = v14 <= v18;
  if (v18 > v10)
    v19 = 0;
  if (v12 < v17)
    v19 = 0;
  return v17 >= v16 && v19;
}

@end
