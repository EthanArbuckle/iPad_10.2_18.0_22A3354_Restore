@implementation NSNumber(INCodableAttributeRelationComparing)

- (uint64_t)_intents_compareValue:()INCodableAttributeRelationComparing relation:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  BOOL v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = v6;
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
    case 4:
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
      v14 = v9;
      v15 = objc_msgSend(a1, "compare:", v14);

      v16 = v15 == 1;
      goto LABEL_33;
    case 5:
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v7;
        else
          v10 = 0;
      }
      else
      {
        v10 = 0;
      }
      v17 = v10;
      if (objc_msgSend(a1, "compare:", v17) == 1)
        goto LABEL_30;
      goto LABEL_38;
    case 6:
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v7;
        else
          v11 = 0;
      }
      else
      {
        v11 = 0;
      }
      v18 = v11;
      v19 = objc_msgSend(a1, "compare:", v18);

      v16 = v19 == -1;
LABEL_33:
      v8 = v16;
      break;
    case 7:
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v7;
        else
          v12 = 0;
      }
      else
      {
        v12 = 0;
      }
      v17 = v12;
      if (objc_msgSend(a1, "compare:", v17) == -1)
LABEL_30:
        v8 = 1;
      else
LABEL_38:
        v8 = objc_msgSend(a1, "isEqual:", v7);
      goto LABEL_46;
    case 8:
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v7;
        else
          v13 = 0;
      }
      else
      {
        v13 = 0;
      }
      v17 = v13;
      if (objc_msgSend(v17, "count") == 2)
      {
        objc_msgSend(v17, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(a1, "_intents_compareValue:relation:", v20, 5))
          v8 = objc_msgSend(a1, "_intents_compareValue:relation:", v21, 7);
        else
          v8 = 0;

      }
      else
      {
        v8 = 0;
      }
LABEL_46:

      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

@end
