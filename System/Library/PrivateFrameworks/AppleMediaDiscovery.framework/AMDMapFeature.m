@implementation AMDMapFeature

- (AMDMapFeature)initWithValue:(id)a3
{
  AMDMapFeature *v3;
  AMDMapFeature *v5;
  objc_super v6;
  id location[2];
  AMDMapFeature *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)AMDMapFeature;
  v8 = -[AMDFeature initWithValue:](&v6, sel_initWithValue_, location[0]);
  objc_storeStrong((id *)&v8, v8);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (unint64_t)getCount
{
  unint64_t v3;
  id v4;
  char v5;
  id v6;

  v4 = -[AMDFeature _value](self, "_value");
  v5 = 0;
  if (v4)
  {
    v6 = -[AMDFeature _value](self, "_value");
    v5 = 1;
    v3 = objc_msgSend(v6, "count");
  }
  else
  {
    v3 = 0;
  }
  if ((v5 & 1) != 0)

  return v3;
}

- (void)copyInt32Values:(int)a3 toBuffer:(int *)a4 withDefaultValue:(int)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  id v10;
  id v11;
  id v12;
  id location;
  unsigned int v14;
  int *v15;
  unsigned int v16;
  SEL v17;
  AMDMapFeature *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  v14 = a5;
  location = 0;
  objc_storeStrong(&location, a6);
  v12 = 0;
  objc_storeStrong(&v12, a7);
  v11 = 0;
  objc_storeStrong(&v11, a8);
  v10 = -[AMDMapFeature getArrayForOp:](v18, "getArrayForOp:", location);
  if (v10)
    +[AMDFeature copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapInfo:andPostRemapOperation:](AMDFeature, "copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapInfo:andPostRemapOperation:", v16, v10, v15, v14, v12, v11);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyInt32Values:(int)a3 toBuffer:(int *)a4 withDefaultValue:(int)a5 withMapOp:(id)a6 withRemapInfo:(id)a7 andPostRemapOperation:(id)a8
{
  id v10;
  id v11;
  id v12;
  id location;
  unsigned int v14;
  int *v15;
  unsigned int v16;
  SEL v17;
  AMDMapFeature *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  v14 = a5;
  location = 0;
  objc_storeStrong(&location, a6);
  v12 = 0;
  objc_storeStrong(&v12, a7);
  v11 = 0;
  objc_storeStrong(&v11, a8);
  v10 = -[AMDMapFeature getArrayForOp:](v18, "getArrayForOp:", location);
  if (v10)
    +[AMDFeature copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapInfo:andPostRemapOperation:](AMDFeature, "copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapInfo:andPostRemapOperation:", v16, v10, v15, v14, v12, v11);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyFloat32Values:(int)a3 toBuffer:(float *)a4 withDefaultValue:(float)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  double v8;
  id v11;
  id v12;
  id v13;
  id location;
  float v15;
  float *v16;
  unsigned int v17;
  SEL v18;
  AMDMapFeature *v19;

  v19 = self;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  v15 = a5;
  location = 0;
  objc_storeStrong(&location, a6);
  v13 = 0;
  objc_storeStrong(&v13, a7);
  v12 = 0;
  objc_storeStrong(&v12, a8);
  v11 = -[AMDMapFeature getArrayForOp:](v19, "getArrayForOp:", location);
  if (v11)
  {
    *(float *)&v8 = v15;
    +[AMDFeature copyFloat32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "copyFloat32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:", v17, v11, v16, v13, v12, v8);
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyDoubleValues:(int)a3 toBuffer:(double *)a4 withDefaultValue:(double)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  id v10;
  id v11;
  id v12;
  id location;
  double v14;
  double *v15;
  unsigned int v16;
  SEL v17;
  AMDMapFeature *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  v14 = a5;
  location = 0;
  objc_storeStrong(&location, a6);
  v12 = 0;
  objc_storeStrong(&v12, a7);
  v11 = 0;
  objc_storeStrong(&v11, a8);
  v10 = -[AMDMapFeature getArrayForOp:](v18, "getArrayForOp:", location);
  if (v10)
    +[AMDFeature copyDoubleValues:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "copyDoubleValues:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:", v16, v10, v15, v12, v11, v14);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
}

- (id)getArrayForOp:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  id v36;
  id obj;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[8];
  uint64_t v50;
  id v51;
  id v52;
  _QWORD __b[8];
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  id location[2];
  AMDMapFeature *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v59 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v57 = 0;
  if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("keys_order_asc_by_value")) & 1) != 0)
  {
    v48 = -[AMDFeature _value](v59, "_value");
    v3 = (id)objc_msgSend(v48, "keysSortedByValueUsingComparator:", &__block_literal_global_1);
    v4 = v57;
    v57 = v3;

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("keys_order_desc_by_value")) & 1) != 0)
  {
    v47 = -[AMDFeature _value](v59, "_value");
    v5 = (id)objc_msgSend(v47, "keysSortedByValueUsingComparator:", &__block_literal_global_100);
    v6 = v57;
    v57 = v5;

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("values_order_asc_by_value")) & 1) != 0)
  {
    v46 = -[AMDFeature _value](v59, "_value");
    v45 = (id)objc_msgSend(v46, "allValues");
    v7 = (id)objc_msgSend(v45, "sortedArrayUsingComparator:", &__block_literal_global_103);
    v8 = v57;
    v57 = v7;

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("values_order_desc_by_value")) & 1) != 0)
  {
    v44 = -[AMDFeature _value](v59, "_value");
    v43 = (id)objc_msgSend(v44, "allValues");
    v9 = (id)objc_msgSend(v43, "sortedArrayUsingComparator:", &__block_literal_global_106);
    v10 = v57;
    v57 = v9;

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("keys_order_asc_by_key")) & 1) != 0)
  {
    v42 = -[AMDFeature _value](v59, "_value");
    v41 = (id)objc_msgSend(v42, "allKeys");
    v11 = (id)objc_msgSend(v41, "sortedArrayUsingComparator:", &__block_literal_global_109);
    v12 = v57;
    v57 = v11;

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("keys_order_desc_by_key")) & 1) != 0)
  {
    v40 = -[AMDFeature _value](v59, "_value");
    v39 = (id)objc_msgSend(v40, "allKeys");
    v13 = (id)objc_msgSend(v39, "sortedArrayUsingComparator:", &__block_literal_global_112);
    v14 = v57;
    v57 = v13;

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("values_order_asc_by_key")) & 1) != 0)
  {
    v36 = -[AMDFeature _value](v59, "_value");
    v35 = (id)objc_msgSend(v36, "allKeys");
    v56 = (id)objc_msgSend(v35, "sortedArrayUsingComparator:", &__block_literal_global_115);

    v55 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v56, "count"));
    memset(__b, 0, sizeof(__b));
    obj = v56;
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v61, 16);
    if (v38)
    {
      v32 = *(_QWORD *)__b[2];
      v33 = 0;
      v34 = v38;
      while (1)
      {
        v31 = v33;
        if (*(_QWORD *)__b[2] != v32)
          objc_enumerationMutation(obj);
        v54 = *(_QWORD *)(__b[1] + 8 * v33);
        v28 = v55;
        v30 = -[AMDFeature _value](v59, "_value");
        v29 = (id)objc_msgSend(v30, "objectForKey:", v54);
        objc_msgSend(v28, "addObject:");

        ++v33;
        if (v31 + 1 >= v34)
        {
          v33 = 0;
          v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v61, 16);
          if (!v34)
            break;
        }
      }
    }

    objc_storeStrong(&v57, v55);
    objc_storeStrong(&v55, 0);
    objc_storeStrong(&v56, 0);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("values_order_desc_by_key")) & 1) != 0)
  {
    v25 = -[AMDFeature _value](v59, "_value");
    v24 = (id)objc_msgSend(v25, "allKeys");
    v52 = (id)objc_msgSend(v24, "sortedArrayUsingComparator:", &__block_literal_global_119);

    v51 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v52, "count"));
    memset(v49, 0, sizeof(v49));
    v26 = v52;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", v49, v60, 16);
    if (v27)
    {
      v21 = *(_QWORD *)v49[2];
      v22 = 0;
      v23 = v27;
      while (1)
      {
        v20 = v22;
        if (*(_QWORD *)v49[2] != v21)
          objc_enumerationMutation(v26);
        v50 = *(_QWORD *)(v49[1] + 8 * v22);
        v17 = v51;
        v19 = -[AMDFeature _value](v59, "_value");
        v18 = (id)objc_msgSend(v19, "objectForKey:", v50);
        objc_msgSend(v17, "addObject:");

        ++v22;
        if (v20 + 1 >= v23)
        {
          v22 = 0;
          v23 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", v49, v60, 16);
          if (!v23)
            break;
        }
      }
    }

    objc_storeStrong(&v57, v51);
    objc_storeStrong(&v51, 0);
    objc_storeStrong(&v52, 0);
  }
  v16 = v57;
  objc_storeStrong(&v57, 0);
  objc_storeStrong(location, 0);
  return v16;
}

BOOL __31__AMDMapFeature_getArrayForOp___block_invoke(void *a1, void *a2, void *a3)
{
  double v3;
  double v4;
  double v7;
  _BOOL8 v8;
  id v9;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = 0;
  objc_storeStrong(&v9, a3);
  objc_msgSend(location[0], "doubleValue");
  v7 = v3;
  objc_msgSend(v9, "doubleValue");
  v8 = v7 >= v4;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8;
}

BOOL __31__AMDMapFeature_getArrayForOp___block_invoke_2(void *a1, void *a2, void *a3)
{
  double v3;
  double v4;
  double v7;
  _BOOL8 v8;
  id v9;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = 0;
  objc_storeStrong(&v9, a3);
  objc_msgSend(location[0], "doubleValue");
  v7 = v3;
  objc_msgSend(v9, "doubleValue");
  v8 = v7 <= v4;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8;
}

BOOL __31__AMDMapFeature_getArrayForOp___block_invoke_3(void *a1, void *a2, void *a3)
{
  double v3;
  double v4;
  double v7;
  _BOOL8 v8;
  id v9;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = 0;
  objc_storeStrong(&v9, a3);
  objc_msgSend(location[0], "doubleValue");
  v7 = v3;
  objc_msgSend(v9, "doubleValue");
  v8 = v7 >= v4;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8;
}

BOOL __31__AMDMapFeature_getArrayForOp___block_invoke_4(void *a1, void *a2, void *a3)
{
  double v3;
  double v4;
  double v7;
  _BOOL8 v8;
  id v9;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = 0;
  objc_storeStrong(&v9, a3);
  objc_msgSend(location[0], "doubleValue");
  v7 = v3;
  objc_msgSend(v9, "doubleValue");
  v8 = v7 <= v4;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8;
}

uint64_t __31__AMDMapFeature_getArrayForOp___block_invoke_5(void *a1, void *a2, void *a3)
{
  double v3;
  double v4;
  double v6;
  id v8;
  id location[2];
  uint64_t v10;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = 0;
  objc_storeStrong(&v8, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v8, "compare:", location[0]);
  }
  else
  {
    objc_msgSend(location[0], "doubleValue");
    v6 = v3;
    objc_msgSend(v8, "doubleValue");
    v10 = v6 <= v4;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
}

uint64_t __31__AMDMapFeature_getArrayForOp___block_invoke_6(void *a1, void *a2, void *a3)
{
  double v3;
  double v4;
  double v6;
  id v8;
  id location[2];
  uint64_t v10;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = 0;
  objc_storeStrong(&v8, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(location[0], "compare:", v8);
  }
  else
  {
    objc_msgSend(location[0], "doubleValue");
    v6 = v3;
    objc_msgSend(v8, "doubleValue");
    v10 = v6 >= v4;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
}

uint64_t __31__AMDMapFeature_getArrayForOp___block_invoke_7(void *a1, void *a2, void *a3)
{
  double v3;
  double v4;
  double v6;
  id v8;
  id location[2];
  uint64_t v10;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = 0;
  objc_storeStrong(&v8, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v8, "compare:", location[0]);
  }
  else
  {
    objc_msgSend(location[0], "doubleValue");
    v6 = v3;
    objc_msgSend(v8, "doubleValue");
    v10 = v6 <= v4;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
}

uint64_t __31__AMDMapFeature_getArrayForOp___block_invoke_8(void *a1, void *a2, void *a3)
{
  double v3;
  double v4;
  double v6;
  id v8;
  id location[2];
  uint64_t v10;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = 0;
  objc_storeStrong(&v8, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(location[0], "compare:", v8);
  }
  else
  {
    objc_msgSend(location[0], "doubleValue");
    v6 = v3;
    objc_msgSend(v8, "doubleValue");
    v10 = v6 >= v4;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
}

@end
