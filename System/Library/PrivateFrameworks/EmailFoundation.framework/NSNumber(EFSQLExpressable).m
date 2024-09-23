@implementation NSNumber(EFSQLExpressable)

- (void)ef_renderSQLExpressionInto:()EFSQLExpressable
{
  id v4;
  int v5;
  double v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  float v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  v4 = objc_retainAutorelease(a1);
  v5 = *(char *)objc_msgSend(v4, "objCType");
  if (v5 <= 80)
  {
    if (v5 > 72)
    {
      if (v5 == 73)
      {
        v8 = objc_msgSend(v4, "unsignedIntValue");
        goto LABEL_16;
      }
      if (v5 == 76)
      {
        v8 = objc_msgSend(v4, "unsignedLongValue");
        v9 = CFSTR("%lu");
        goto LABEL_26;
      }
    }
    else
    {
      if (v5 == 66)
      {
LABEL_11:
        v8 = objc_msgSend(v4, "charValue");
LABEL_21:
        v9 = CFSTR("%d");
        goto LABEL_26;
      }
      if (v5 == 67)
      {
        v8 = objc_msgSend(v4, "unsignedCharValue");
LABEL_16:
        v9 = CFSTR("%u");
        goto LABEL_26;
      }
    }
LABEL_28:
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_retainAutorelease(v4);
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: unexpected type '%s'"), v13, objc_msgSend(v13, "objCType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v14, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  switch(v5)
  {
    case 'c':
      goto LABEL_11;
    case 'd':
      objc_msgSend(v4, "doubleValue");
      v7 = CFSTR("%0.16g");
      goto LABEL_24;
    case 'e':
    case 'g':
    case 'h':
    case 'j':
    case 'k':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'r':
      goto LABEL_28;
    case 'f':
      objc_msgSend(v4, "floatValue");
      v6 = v10;
      v7 = CFSTR("%0.7g");
LABEL_24:
      objc_msgSend(v16, "appendFormat:", v7, *(_QWORD *)&v6);
      goto LABEL_27;
    case 'i':
      v8 = objc_msgSend(v4, "intValue");
      goto LABEL_21;
    case 'l':
      v8 = objc_msgSend(v4, "longValue");
      v9 = CFSTR("%ld");
      break;
    case 'q':
      v8 = objc_msgSend(v4, "longLongValue");
      v9 = CFSTR("%lld");
      break;
    case 's':
      v8 = objc_msgSend(v4, "shortValue");
      v9 = CFSTR("%hi");
      break;
    default:
      if (v5 == 81)
      {
        v8 = objc_msgSend(v4, "unsignedLongLongValue");
        v9 = CFSTR("%llu");
        break;
      }
      if (v5 != 83)
        goto LABEL_28;
      v8 = objc_msgSend(v4, "unsignedShortValue");
      v9 = CFSTR("%hu");
      break;
  }
LABEL_26:
  objc_msgSend(v16, "appendFormat:", v9, v8);
LABEL_27:

}

- (id)ef_SQLExpression
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ef_renderSQLExpressionInto:", v2);
  return v2;
}

@end
