@implementation NSKeyValueIvarSetter

- (NSKeyValueIvarSetter)initWithContainerClassID:(id)a3 key:(id)a4 containerIsa:(Class)a5 ivar:(objc_ivar *)a6
{
  char *TypeEncoding;
  int v12;
  uint64_t (*v13)(int, int, int, int, Ivar);
  const char *v14;
  char *v15;
  size_t v16;
  unsigned int IvarMemoryManagement;
  objc_super v19;
  objc_super v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  TypeEncoding = (char *)ivar_getTypeEncoding(a6);
  v12 = *TypeEncoding;
  if (v12 > 82)
  {
    switch(*TypeEncoding)
    {
      case 'c':
        v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetCharValueForKeyInIvar;
        break;
      case 'd':
        v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetDoubleValueForKeyInIvar;
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
        goto LABEL_26;
      case 'f':
        v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetFloatValueForKeyInIvar;
        break;
      case 'i':
        v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetIntValueForKeyInIvar;
        break;
      case 'l':
        v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetLongValueForKeyInIvar;
        break;
      case 'q':
        v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetLongLongValueForKeyInIvar;
        break;
      case 's':
        v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetShortValueForKeyInIvar;
        break;
      default:
        if (v12 == 83)
        {
          v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetUnsignedShortValueForKeyInIvar;
          break;
        }
        if (v12 != 123)
          goto LABEL_26;
        v14 = TypeEncoding;
        v15 = strchr(TypeEncoding, 61);
        if (!v15)
          goto LABEL_20;
        v16 = v15 - v14;
        if (!strncmp(v14, "{CGPoint=dd}", v15 - v14) || !strncmp(v14, "{_NSPoint=ff}", v16))
        {
          v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetPointValueForKeyInIvar;
        }
        else if (!strncmp(v14, "{_NSRange=QQ}", v16))
        {
          v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetRangeValueForKeyInIvar;
        }
        else if (!strncmp(v14, "{CGRect={CGPoint=dd}{CGSize=dd}}", v16)
               || !strncmp(v14, "{_NSRect={_NSPoint=ff}{_NSSize=ff}}", v16))
        {
          v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetRectValueForKeyInIvar;
        }
        else
        {
          if (strncmp(v14, "{CGSize=dd}", v16) && strncmp(v14, "{_NSSize=ff}", v16))
          {
LABEL_20:
            v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetValueInIvar;
            break;
          }
          v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetSizeValueForKeyInIvar;
        }
        break;
    }
  }
  else if (v12 > 75)
  {
    if (v12 == 76)
    {
      v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetUnsignedLongValueForKeyInIvar;
    }
    else
    {
      if (v12 != 81)
      {
LABEL_26:

        return 0;
      }
      v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetUnsignedLongLongValueForKeyInIvar;
    }
  }
  else
  {
    v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetBoolValueForKeyInIvar;
    switch(*TypeEncoding)
    {
      case '@':
        break;
      case 'A':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
        goto LABEL_26;
      case 'B':
        goto LABEL_36;
      case 'C':
        v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetUnsignedCharValueForKeyInIvar;
        goto LABEL_36;
      case 'I':
        v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetUnsignedIntValueForKeyInIvar;
        goto LABEL_36;
      default:
        if (v12 != 35)
          goto LABEL_26;
        break;
    }
    IvarMemoryManagement = _class_getIvarMemoryManagement();
    if (IvarMemoryManagement >= 4)
      v13 = (uint64_t (*)(int, int, int, int, Ivar))_NSSetObjectSetIvarValueForKeyInIvar;
    else
      v13 = off_1E0F4ECC0[IvarMemoryManagement];
  }
LABEL_36:
  if (_NSKVONotifyingMutatorsShouldNotifyForIsaAndKey(a5, a4))
    return -[NSKeyValueAccessor initWithContainerClassID:key:implementation:selector:extraArguments:count:](&v20, sel_initWithContainerClassID_key_implementation_selector_extraArguments_count_, a3, a4, _NSSetValueAndNotifyForKeyInIvar, 0, &v21, 3, v19.receiver, v19.super_class, self, NSKeyValueIvarSetter, a4, a6, v13, v22);
  else
    return -[NSKeyValueAccessor initWithContainerClassID:key:implementation:selector:extraArguments:count:](&v19, sel_initWithContainerClassID_key_implementation_selector_extraArguments_count_, a3, a4, v13, 0, &v21, 2, self, NSKeyValueIvarSetter, v20.receiver, v20.super_class, a4, a6, 0, v22);
}

@end
