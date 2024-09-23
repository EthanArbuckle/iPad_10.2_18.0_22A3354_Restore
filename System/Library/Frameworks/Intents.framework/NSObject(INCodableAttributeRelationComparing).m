@implementation NSObject(INCodableAttributeRelationComparing)

- (uint64_t)_intents_compareValue:()INCodableAttributeRelationComparing relation:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = v6;
  v8 = 0;
  switch(a4)
  {
    case 1:
      v8 = 1;
      break;
    case 2:
    case 9:
      v8 = objc_msgSend(a1, "isEqual:", v6);
      break;
    case 3:
    case 10:
      v8 = objc_msgSend(a1, "isEqual:", v6) ^ 1;
      break;
    case 8:
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = v7;
        else
          v9 = 0;
      }
      else
      {
        v9 = 0;
      }
      v10 = v9;
      v8 = objc_msgSend(v10, "containsObject:", a1);

      break;
    default:
      break;
  }

  return v8;
}

@end
