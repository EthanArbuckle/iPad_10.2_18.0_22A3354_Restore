@implementation CADPropertyFilter(EKPredicateEvaluating)

- (uint64_t)ekPredicateFilterMatches:()EKPredicateEvaluating
{
  id v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  BOOL v13;
  char v14;
  char v15;
  BOOL v16;

  v4 = a3;
  v5 = objc_msgSend(a1, "property");
  if (v5 > 0xE)
    v6 = 0;
  else
    v6 = off_1E4785B58[v5];
  objc_msgSend(v4, "valueForKeyPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "isInteger"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "integerValue"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(a1, "isString"))
  {
    objc_msgSend(a1, "stringValue");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(a1, "isDate") & 1) == 0)
    {
      v9 = 0;
      v10 = v7 == 0;
      v11 = 1;
      goto LABEL_18;
    }
    objc_msgSend(a1, "dateValue");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  v10 = v7 == 0;
  v11 = v8 == 0;
  if (v7 && v8)
  {
    v12 = objc_msgSend(v7, "compare:", v8);
    switch(objc_msgSend(a1, "comparison"))
    {
      case 0:
        v13 = v12 == 0;
        goto LABEL_25;
      case 1:
        v16 = v12 == 0;
        goto LABEL_29;
      case 2:
        v13 = v12 == -1;
        goto LABEL_25;
      case 3:
        v16 = v12 == 1;
        goto LABEL_29;
      case 4:
        v13 = v12 == 1;
LABEL_25:
        LOBYTE(a1) = v13;
        break;
      case 5:
        v16 = v12 == -1;
LABEL_29:
        LOBYTE(a1) = !v16;
        break;
      default:
        goto LABEL_32;
    }
    goto LABEL_32;
  }
  if (v8 && !v7)
  {
    LOBYTE(a1) = 0;
    goto LABEL_32;
  }
LABEL_18:
  v14 = objc_msgSend(a1, "comparison");
  v15 = v10 ^ v11;
  if (((1 << v14) & 0x16) == 0)
    v15 = v10 ^ v11 ^ 1;
  LOBYTE(a1) = v15;
LABEL_32:

  return a1 & 1;
}

@end
