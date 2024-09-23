@implementation NSKeyValueMethodSetter

- (NSKeyValueMethodSetter)initWithContainerClassID:(id)a3 key:(id)a4 method:(objc_method *)a5
{
  SEL Name;
  char *v10;
  char *v11;
  int v12;
  void *Implementation;
  objc_method *v14;
  uint64_t v15;
  NSKeyValueMethodSetter *result;
  objc_super v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  if (method_getNumberOfArguments(a5) != 3)
    goto LABEL_28;
  Name = method_getName(a5);
  v10 = method_copyArgumentType(a5, 2u);
  v11 = v10;
  v12 = *v10;
  if (v12 > 82)
  {
    switch(*v10)
    {
      case 'c':
        Implementation = _NSSetCharValueForKeyWithMethod;
        break;
      case 'd':
        Implementation = _NSSetDoubleValueForKeyWithMethod;
        break;
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
        goto LABEL_27;
      case 'f':
        Implementation = _NSSetFloatValueForKeyWithMethod;
        break;
      case 'i':
        Implementation = _NSSetIntValueForKeyWithMethod;
        break;
      case 'l':
        Implementation = _NSSetLongValueForKeyWithMethod;
        break;
      case 'q':
        Implementation = _NSSetLongLongValueForKeyWithMethod;
        break;
      case 's':
        Implementation = _NSSetShortValueForKeyWithMethod;
        break;
      default:
        if (v12 == 83)
        {
          Implementation = _NSSetUnsignedShortValueForKeyWithMethod;
        }
        else
        {
          if (v12 != 123)
            goto LABEL_27;
          if (!strcmp(v10, "{CGPoint=dd}") || !strcmp(v11, "{_NSPoint=ff}"))
          {
            Implementation = _NSSetPointValueForKeyWithMethod;
          }
          else if (!strcmp(v11, "{_NSRange=QQ}"))
          {
            Implementation = _NSSetRangeValueForKeyWithMethod;
          }
          else if (!strcmp(v11, "{CGRect={CGPoint=dd}{CGSize=dd}}")
                 || !strcmp(v11, "{_NSRect={_NSPoint=ff}{_NSSize=ff}}"))
          {
            Implementation = _NSSetRectValueForKeyWithMethod;
          }
          else
          {
            Implementation = _NSSetSizeValueForKeyWithMethod;
            if (strcmp(v11, "{CGSize=dd}") && strcmp(v11, "{_NSSize=ff}"))
              Implementation = _NSSetValueWithMethod;
          }
        }
        break;
    }
  }
  else
  {
    if (v12 <= 75)
    {
      Implementation = _NSSetBoolValueForKeyWithMethod;
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
          goto LABEL_37;
        case 'C':
          Implementation = _NSSetUnsignedCharValueForKeyWithMethod;
          goto LABEL_37;
        case 'I':
          Implementation = _NSSetUnsignedIntValueForKeyWithMethod;
          goto LABEL_37;
        default:
          if (v12 != 35)
            goto LABEL_27;
          break;
      }
      Implementation = method_getImplementation(a5);
      free(v11);
      if (Implementation)
      {
        v14 = 0;
        v15 = 0;
        goto LABEL_38;
      }
LABEL_28:

      return 0;
    }
    if (v12 == 76)
    {
      Implementation = _NSSetUnsignedLongValueForKeyWithMethod;
    }
    else
    {
      if (v12 != 81)
      {
LABEL_27:
        free(v10);
        goto LABEL_28;
      }
      Implementation = _NSSetUnsignedLongLongValueForKeyWithMethod;
    }
  }
LABEL_37:
  free(v11);
  v15 = 2;
  v14 = a5;
LABEL_38:
  v18[0] = a4;
  v18[1] = v14;
  v18[2] = 0;
  v17.receiver = self;
  v17.super_class = (Class)NSKeyValueMethodSetter;
  result = -[NSKeyValueAccessor initWithContainerClassID:key:implementation:selector:extraArguments:count:](&v17, sel_initWithContainerClassID_key_implementation_selector_extraArguments_count_, a3, a4, Implementation, Name, v18, v15);
  if (result)
    result->_method = a5;
  return result;
}

- (objc_method)method
{
  return self->_method;
}

@end
