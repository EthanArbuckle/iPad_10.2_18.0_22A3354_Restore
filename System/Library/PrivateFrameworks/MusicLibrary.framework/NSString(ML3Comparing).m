@implementation NSString(ML3Comparing)

- (uint64_t)ml_matchesValue:()ML3Comparing usingComparison:
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    v8 = objc_msgSend(a1, "compare:", v7);
    switch(a4)
    {
      case 1:
        v9 = objc_msgSend(a1, "isEqualToString:", v7);
        goto LABEL_20;
      case 2:
        v10 = objc_msgSend(a1, "isEqualToString:", v7) ^ 1;
        break;
      case 3:
        v11 = v8 == 1;
        goto LABEL_10;
      case 4:
        v12 = v8 >= 2;
        goto LABEL_14;
      case 5:
        v11 = v8 == -1;
LABEL_10:
        v10 = v11;
        break;
      case 6:
        v12 = v8 + 1 >= 2;
LABEL_14:
        v10 = !v12;
        break;
      case 7:
        v9 = objc_msgSend(a1, "containsString:", v7);
        goto LABEL_20;
      case 8:
        v9 = objc_msgSend(a1, "hasPrefix:", v7);
        goto LABEL_20;
      case 9:
        v9 = objc_msgSend(a1, "hasSuffix:", v7);
LABEL_20:
        v10 = v9;
        break;
      default:
        v10 = 0;
        break;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
