@implementation NSKeyValueMethodGetter

- (NSKeyValueMethodGetter)initWithContainerClassID:(id)a3 key:(id)a4 method:(objc_method *)a5
{
  objc_method *v5;
  SEL Name;
  char *v10;
  char *v11;
  int v12;
  void *Implementation;
  uint64_t v14;
  objc_super v16;
  _QWORD v17[4];

  v5 = a5;
  v17[3] = *MEMORY[0x1E0C80C00];
  if (method_getNumberOfArguments(a5) != 2)
    goto LABEL_28;
  Name = method_getName(v5);
  v10 = method_copyReturnType(v5);
  v11 = v10;
  v12 = *v10;
  if (v12 > 82)
  {
    switch(*v10)
    {
      case 'c':
        Implementation = _NSGetCharValueWithMethod;
        goto LABEL_38;
      case 'd':
        Implementation = _NSGetDoubleValueWithMethod;
        goto LABEL_38;
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
      case 't':
      case 'u':
        goto LABEL_27;
      case 'f':
        Implementation = _NSGetFloatValueWithMethod;
        goto LABEL_38;
      case 'i':
        Implementation = _NSGetIntValueWithMethod;
        goto LABEL_38;
      case 'l':
        Implementation = _NSGetLongValueWithMethod;
        goto LABEL_38;
      case 'q':
        Implementation = _NSGetLongLongValueWithMethod;
        goto LABEL_38;
      case 's':
        Implementation = _NSGetShortValueWithMethod;
        goto LABEL_38;
      case 'v':
        Implementation = _NSGetVoidValueWithMethod;
        goto LABEL_38;
      default:
        if (v12 == 83)
        {
          Implementation = _NSGetUnsignedShortValueWithMethod;
        }
        else
        {
          if (v12 != 123)
            goto LABEL_27;
          if (!strcmp(v10, "{CGPoint=dd}") || !strcmp(v11, "{_NSPoint=ff}"))
          {
            Implementation = _NSGetPointValueWithMethod;
          }
          else if (!strcmp(v11, "{_NSRange=QQ}"))
          {
            Implementation = _NSGetRangeValueWithMethod;
          }
          else if (!strcmp(v11, "{CGRect={CGPoint=dd}{CGSize=dd}}")
                 || !strcmp(v11, "{_NSRect={_NSPoint=ff}{_NSSize=ff}}"))
          {
            Implementation = _NSGetRectValueWithMethod;
          }
          else
          {
            Implementation = _NSGetSizeValueWithMethod;
            if (strcmp(v11, "{CGSize=dd}"))
            {
              if (strcmp(v11, "{_NSSize=ff}"))
                Implementation = _NSGetValueWithMethod;
            }
          }
        }
        break;
    }
    goto LABEL_38;
  }
  if (v12 > 75)
  {
    if (v12 == 76)
    {
      Implementation = _NSGetUnsignedLongValueWithMethod;
      goto LABEL_38;
    }
    if (v12 == 81)
    {
      Implementation = _NSGetUnsignedLongLongValueWithMethod;
LABEL_38:
      free(v11);
      v14 = 1;
      goto LABEL_39;
    }
LABEL_27:
    free(v10);
LABEL_28:

    return 0;
  }
  Implementation = _NSGetBoolValueWithMethod;
  switch(*v10)
  {
    case '@':
      break;
    case 'A':
    case 'D':
    case 'E':
    case 'F':
    case 'G':
    case 'H':
      goto LABEL_27;
    case 'B':
      goto LABEL_38;
    case 'C':
      Implementation = _NSGetUnsignedCharValueWithMethod;
      goto LABEL_38;
    case 'I':
      Implementation = _NSGetUnsignedIntValueWithMethod;
      goto LABEL_38;
    default:
      if (v12 != 35)
        goto LABEL_27;
      break;
  }
  Implementation = method_getImplementation(v5);
  free(v11);
  if (!Implementation)
    goto LABEL_28;
  v5 = 0;
  v14 = 0;
LABEL_39:
  v17[1] = 0;
  v17[2] = 0;
  v16.receiver = self;
  v16.super_class = (Class)NSKeyValueMethodGetter;
  v17[0] = v5;
  return -[NSKeyValueAccessor initWithContainerClassID:key:implementation:selector:extraArguments:count:](&v16, sel_initWithContainerClassID_key_implementation_selector_extraArguments_count_, a3, a4, Implementation, Name, v17, v14);
}

@end
