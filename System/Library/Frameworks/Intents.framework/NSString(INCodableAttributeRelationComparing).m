@implementation NSString(INCodableAttributeRelationComparing)

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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  int v22;
  id v23;
  uint64_t v24;
  BOOL v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  int v29;

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 1:
      v8 = 1;
      goto LABEL_67;
    case 2:
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
      v18 = v9;
      v19 = a1;
      v20 = v18;
      goto LABEL_57;
    case 3:
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
      v21 = v10;
      v22 = objc_msgSend(a1, "isEqualToString:", v21);
      goto LABEL_66;
    case 4:
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
      v23 = v11;
      v24 = objc_msgSend(a1, "compare:", v23);

      v25 = v24 == 1;
      goto LABEL_51;
    case 5:
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
      v18 = v12;
      if (objc_msgSend(a1, "compare:", v18) == 1)
        goto LABEL_48;
      goto LABEL_56;
    case 6:
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
      v26 = v13;
      v27 = objc_msgSend(a1, "compare:", v26);

      v25 = v27 == -1;
LABEL_51:
      v8 = v25;
      goto LABEL_67;
    case 7:
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v7;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v18 = v14;
      if (objc_msgSend(a1, "compare:", v18) == -1)
      {
LABEL_48:
        v8 = 1;
      }
      else
      {
LABEL_56:
        v19 = a1;
        v20 = v7;
LABEL_57:
        v28 = objc_msgSend(v19, "isEqualToString:", v20);
LABEL_62:
        v8 = v28;
      }

LABEL_67:
      return v8;
    case 8:
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v7;
        else
          v15 = 0;
      }
      else
      {
        v15 = 0;
      }
      v18 = v15;
      v28 = objc_msgSend(v18, "containsObject:", a1);
      goto LABEL_62;
    case 9:
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v7;
        else
          v16 = 0;
      }
      else
      {
        v16 = 0;
      }
      v18 = v16;
      v28 = objc_msgSend(a1, "containsString:", v18);
      goto LABEL_62;
    case 10:
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v7;
        else
          v17 = 0;
      }
      else
      {
        v17 = 0;
      }
      v21 = v17;
      v22 = objc_msgSend(a1, "containsString:", v21);
LABEL_66:
      v29 = v22;

      v8 = v29 ^ 1u;
      goto LABEL_67;
    default:
      v8 = 0;
      goto LABEL_67;
  }
}

@end
