@implementation NSNumber(ML3Comparing)

- (uint64_t)ml_matchesValue:()ML3Comparing usingComparison:
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    v8 = objc_msgSend(a1, "compare:", v7);
    switch(a4)
    {
      case 1:
      case 7:
      case 8:
      case 9:
        v9 = objc_msgSend(a1, "isEqualToNumber:", v7);
        break;
      case 2:
        v9 = objc_msgSend(a1, "isEqualToNumber:", v7) ^ 1;
        break;
      case 3:
        v10 = v8 == 1;
        goto LABEL_10;
      case 4:
        v11 = v8 >= 2;
        goto LABEL_14;
      case 5:
        v10 = v8 == -1;
LABEL_10:
        v9 = v10;
        break;
      case 6:
        v11 = v8 + 1 >= 2;
LABEL_14:
        v9 = !v11;
        break;
      case 10:
        v12 = objc_msgSend(a1, "longLongValue");
        v9 = (objc_msgSend(v7, "longLongValue") & v12) != 0;
        break;
      default:
        v9 = 0;
        break;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
