@implementation NSMeasurement(INCodableAttributeRelationComparing)

- (uint64_t)_intents_compareValue:()INCodableAttributeRelationComparing relation:
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  double v32;
  double v33;
  void *v34;
  BOOL v35;
  id v36;
  void *v37;
  id v38;
  double v39;
  double v40;
  void *v42;
  _QWORD v43[5];

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "unit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "measurementByConvertingToUnit:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v8;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v6;
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
      }
      else
      {
        v10 = 0;
      }
      v11 = v10;

      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __85__NSMeasurement_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke;
      v43[3] = &unk_1E2293880;
      v43[4] = a1;
      objc_msgSend(v11, "if_flatMap:", v43);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  switch(a4)
  {
    case 1:
      v12 = 1;
      break;
    case 2:
    case 9:
      v12 = objc_msgSend(a1, "isEqual:", v6);
      break;
    case 3:
    case 10:
      v12 = objc_msgSend(a1, "isEqual:", v6) ^ 1;
      break;
    case 4:
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a1, "doubleValue");
      objc_msgSend(v13, "numberWithDouble:");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB37E8];
      v16 = v6;
      if (v16)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
      }
      else
      {
        v17 = 0;
      }
      v31 = v17;

      objc_msgSend(v31, "doubleValue");
      v33 = v32;

      objc_msgSend(v15, "numberWithDouble:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v14, "compare:", v34) == 1;
      goto LABEL_42;
    case 5:
      v18 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a1, "doubleValue");
      objc_msgSend(v18, "numberWithDouble:");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB37E8];
      v20 = v6;
      if (v20)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v21 = v20;
        else
          v21 = 0;
      }
      else
      {
        v21 = 0;
      }
      v36 = v21;

      objc_msgSend(v36, "doubleValue");
      objc_msgSend(v19, "numberWithDouble:");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "compare:", v37) == 1)
        goto LABEL_39;
      goto LABEL_48;
    case 6:
      v22 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a1, "doubleValue");
      objc_msgSend(v22, "numberWithDouble:");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0CB37E8];
      v24 = v6;
      if (v24)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = v24;
        else
          v25 = 0;
      }
      else
      {
        v25 = 0;
      }
      v38 = v25;

      objc_msgSend(v38, "doubleValue");
      v40 = v39;

      objc_msgSend(v23, "numberWithDouble:", v40);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v14, "compare:", v34) == -1;
LABEL_42:
      v12 = v35;
      goto LABEL_45;
    case 7:
      v26 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a1, "doubleValue");
      objc_msgSend(v26, "numberWithDouble:");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0CB37E8];
      v20 = v6;
      if (v20)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v28 = v20;
        else
          v28 = 0;
      }
      else
      {
        v28 = 0;
      }
      v36 = v28;

      objc_msgSend(v36, "doubleValue");
      objc_msgSend(v27, "numberWithDouble:");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "compare:", v37) == -1)
LABEL_39:
        v12 = 1;
      else
LABEL_48:
        v12 = objc_msgSend(a1, "isEqual:", v20);

      goto LABEL_50;
    case 8:
      v29 = v6;
      if (v29)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v30 = v29;
        else
          v30 = 0;
      }
      else
      {
        v30 = 0;
      }
      v14 = v30;

      if (objc_msgSend(v14, "count") == 2)
      {
        objc_msgSend(v14, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastObject");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(a1, "_intents_compareValue:relation:", v34, 5))
          v12 = objc_msgSend(a1, "_intents_compareValue:relation:", v42, 7);
        else
          v12 = 0;

LABEL_45:
      }
      else
      {
        v12 = 0;
      }
LABEL_50:

      break;
    default:
      v12 = 0;
      break;
  }

  return v12;
}

@end
