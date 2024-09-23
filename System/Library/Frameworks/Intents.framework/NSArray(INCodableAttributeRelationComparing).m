@implementation NSArray(INCodableAttributeRelationComparing)

- (uint64_t)_intents_compareValue:()INCodableAttributeRelationComparing relation:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v6 = a3;
  v7 = 0;
  switch(a4)
  {
    case 1:
      v7 = 1;
      break;
    case 2:
      v7 = objc_msgSend(a1, "isEqual:", v6);
      break;
    case 3:
      v7 = objc_msgSend(a1, "isEqual:", v6) ^ 1;
      break;
    case 9:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0C99E60];
      v10 = v6;
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
      }
      else
      {
        v11 = 0;
      }
      v15 = v11;

      objc_msgSend(v9, "setWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v8, "isSubsetOfSet:", v16);
      goto LABEL_17;
    case 10:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0C99E60];
      v13 = v6;
      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v17 = v14;

      objc_msgSend(v12, "setWithArray:", v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v8, "isSubsetOfSet:", v16) ^ 1;
LABEL_17:

      break;
    default:
      break;
  }

  return v7;
}

@end
