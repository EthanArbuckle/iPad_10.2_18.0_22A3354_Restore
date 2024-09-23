@implementation AMDFeature

- (AMDFeature)initWithValue:(id)a3
{
  AMDFeature *v3;
  AMDFeature *v5;
  objc_super v6;
  id location[2];
  AMDFeature *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)AMDFeature;
  v8 = -[AMDFeature init](&v6, sel_init);
  objc_storeStrong((id *)&v8, v8);
  -[AMDFeature set_value:](v8, "set_value:", location[0]);
  -[AMDFeature set_dataType:](v8, "set_dataType:", 0);
  -[AMDFeature set_remapInfo:](v8, "set_remapInfo:", 0);
  -[AMDFeature set_postRemapOperation:](v8, "set_postRemapOperation:", 0);
  -[AMDFeature set_shape:](v8, "set_shape:", 0);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (int64_t)getDataType
{
  return -[AMDFeature _dataType](self, "_dataType", a2, self);
}

- (void)setDataType:(int64_t)a3
{
  -[AMDFeature set_dataType:](self, "set_dataType:", a3);
}

- (id)getRemapInfo
{
  return -[AMDFeature _remapInfo](self, "_remapInfo", a2, self);
}

- (void)setRemapInfo:(id)a3
{
  id location[2];
  AMDFeature *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[AMDFeature set_remapInfo:](v4, "set_remapInfo:", location[0]);
  objc_storeStrong(location, 0);
}

- (id)getPostRemapOperation
{
  return -[AMDFeature _postRemapOperation](self, "_postRemapOperation", a2, self);
}

- (void)setPostRemapOperation:(id)a3
{
  id location[2];
  AMDFeature *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[AMDFeature set_postRemapOperation:](v4, "set_postRemapOperation:", location[0]);
  objc_storeStrong(location, 0);
}

- (id)getShape
{
  return -[AMDFeature _shape](self, "_shape", a2, self);
}

- (void)setShape:(id)a3
{
  id location[2];
  AMDFeature *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[AMDFeature set_shape:](v4, "set_shape:", location[0]);
  objc_storeStrong(location, 0);
}

- (id)getValue
{
  return -[AMDFeature _value](self, "_value", a2, self);
}

- (unint64_t)getCount
{
  id v2;
  unint64_t v4;

  v2 = -[AMDFeature _value](self, "_value");
  v4 = v2 != 0;

  return v4;
}

- (id)stringValue
{
  id v2;
  id v4;
  char v5;
  id v6;
  char v7;
  id v8;
  void *v10;

  v4 = -[AMDFeature _value](self, "_value");
  v7 = 0;
  v5 = 0;
  if (v4)
  {
    v8 = -[AMDFeature _value](self, "_value");
    v7 = 1;
    v6 = (id)objc_msgSend(v8, "stringValue");
    v5 = 1;
    v2 = v6;
  }
  else
  {
    v2 = 0;
  }
  v10 = v2;
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  return v10;
}

- (void)copyInt32Values:(int)a3 toBuffer:(int *)a4 withDefaultValue:(int)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  id v10;
  id v11;
  id location;
  int v13;
  int *v14;
  int v15;
  SEL v16;
  AMDFeature *v17;

  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  v13 = a5;
  location = 0;
  objc_storeStrong(&location, a6);
  v11 = 0;
  objc_storeStrong(&v11, a7);
  v10 = 0;
  objc_storeStrong(&v10, a8);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyInt32Values:(int)a3 toBuffer:(int *)a4 withDefaultValue:(int)a5 withMapOp:(id)a6 withRemapInfo:(id)a7 andPostRemapOperation:(id)a8
{
  id v10;
  id v11;
  id location;
  int v13;
  int *v14;
  int v15;
  SEL v16;
  AMDFeature *v17;

  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  v13 = a5;
  location = 0;
  objc_storeStrong(&location, a6);
  v11 = 0;
  objc_storeStrong(&v11, a7);
  v10 = 0;
  objc_storeStrong(&v10, a8);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyFloat32Values:(int)a3 toBuffer:(float *)a4 withDefaultValue:(float)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  id v10;
  id v11;
  id location;
  float v13;
  float *v14;
  int v15;
  SEL v16;
  AMDFeature *v17;

  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  v13 = a5;
  location = 0;
  objc_storeStrong(&location, a6);
  v11 = 0;
  objc_storeStrong(&v11, a7);
  v10 = 0;
  objc_storeStrong(&v10, a8);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyDoubleValues:(int)a3 toBuffer:(double *)a4 withDefaultValue:(double)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  id v10;
  id v11;
  id location[3];
  int v13;
  SEL v14;
  AMDFeature *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  location[2] = a4;
  location[1] = *(id *)&a5;
  location[0] = 0;
  objc_storeStrong(location, a6);
  v11 = 0;
  objc_storeStrong(&v11, a7);
  v10 = 0;
  objc_storeStrong(&v10, a8);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

+ (id)featureFromValue:(id)a3
{
  AMDScalarFeature *v3;
  AMDListFeature *v4;
  AMDMapFeature *v5;
  id v7;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;
  char isKindOfClass;
  id v14;
  id v15;
  id v16;
  int v17;
  id location[3];
  AMDListFeature *v19;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v3 = [AMDScalarFeature alloc];
      v19 = -[AMDScalarFeature initWithValue:](v3, "initWithValue:", location[0]);
      v17 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_29;
      v16 = location[0];
      if (objc_msgSend(v16, "count"))
      {
        v12 = (id)objc_msgSend(v16, "firstObject");
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0
          || (v10 = (id)objc_msgSend(v16, "firstObject"),
              objc_opt_class(),
              v11 = objc_opt_isKindOfClass(),
              v10,
              (v11 & 1) != 0))
        {
          v19 = -[AMDListFeature initWithValue:]([AMDListFeature alloc], "initWithValue:", v16);
          v17 = 1;
        }
        else
        {
          v8 = (id)objc_msgSend(v16, "firstObject");
          objc_opt_class();
          v9 = objc_opt_isKindOfClass();

          if ((v9 & 1) != 0)
          {
            v19 = -[AMDMultiArrayFeature initWithValue:]([AMDMultiArrayFeature alloc], "initWithValue:", v16);
            v17 = 1;
          }
          else
          {
            v17 = 0;
          }
        }
      }
      else
      {
        v4 = [AMDListFeature alloc];
        v19 = -[AMDListFeature initWithValue:](v4, "initWithValue:", MEMORY[0x1E0C9AA60]);
        v17 = 1;
      }
      objc_storeStrong(&v16, 0);
      if (!v17)
      {
LABEL_29:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_25;
        v15 = location[0];
        if (objc_msgSend(v15, "count"))
        {
          v7 = (id)objc_msgSend(v15, "allValues");
          v14 = (id)objc_msgSend(v7, "firstObject");

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v19 = -[AMDMapFeature initWithValue:]([AMDMapFeature alloc], "initWithValue:", v15);
            v17 = 1;
          }
          else
          {
            v17 = 0;
          }
          objc_storeStrong(&v14, 0);
        }
        else
        {
          v5 = [AMDMapFeature alloc];
          v19 = -[AMDMapFeature initWithValue:](v5, "initWithValue:", MEMORY[0x1E0C9AA70]);
          v17 = 1;
        }
        objc_storeStrong(&v15, 0);
        if (!v17)
        {
LABEL_25:
          v19 = 0;
          v17 = 1;
        }
      }
    }
  }
  else
  {
    v19 = 0;
    v17 = 1;
  }
  objc_storeStrong(location, 0);
  return v19;
}

+ (BOOL)getIntFromObject:(id)a3 copyToValue:(int *)a4 withRemapDictionary:(id)a5 andPostRemapOperation:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  BOOL v12;
  id v13;
  id v14;
  id v18;
  id v19;
  id v20;
  char v21;
  id v22;
  int v23;
  int v24;
  id v25;
  id v26;
  id v27;
  int *v28;
  id location[3];
  char v30;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = a4;
  v27 = 0;
  objc_storeStrong(&v27, a5);
  v26 = 0;
  objc_storeStrong(&v26, a6);
  v25 = location[0];
  if (v27)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (id)objc_msgSend(v27, "objectForKey:", location[0]);
      v7 = v25;
      v25 = v6;

    }
    else
    {
      v13 = v27;
      v14 = (id)objc_msgSend(location[0], "stringValue");
      v8 = (id)objc_msgSend(v13, "objectForKey:");
      v9 = v25;
      v25 = v8;

    }
  }
  if (v25)
  {
    v23 = objc_msgSend(v25, "intValue");
    v21 = 0;
    v12 = 0;
    if (v26)
    {
      v22 = (id)objc_msgSend(v26, "getPostRemapOperationName");
      v21 = 1;
      v12 = v22 != 0;
    }
    if ((v21 & 1) != 0)

    if (!v12)
      goto LABEL_26;
    v20 = (id)objc_msgSend(v26, "getPostRemapOperationName");
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("hash")) & 1) != 0)
    {
      v11 = (id)objc_msgSend(v26, "getHashOpModValue");
      v23 %= (int)objc_msgSend(v11, "intValue");

    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("truncate")) & 1) != 0)
    {
      v19 = (id)objc_msgSend(v26, "getTruncateOpMinValue");
      if (v19 && v23 < (int)objc_msgSend(v19, "intValue"))
      {
        v30 = 0;
        v24 = 1;
      }
      else
      {
        v18 = (id)objc_msgSend(v26, "getTruncateOpMaxValue");
        if (v18 && v23 > (int)objc_msgSend(v18, "intValue"))
        {
          v30 = 0;
          v24 = 1;
        }
        else
        {
          v24 = 0;
        }
        objc_storeStrong(&v18, 0);
      }
      objc_storeStrong(&v19, 0);
      if (v24)
      {
LABEL_25:
        objc_storeStrong(&v20, 0);
        if (v24)
          goto LABEL_27;
LABEL_26:
        *v28 = v23;
        v30 = 1;
        v24 = 1;
        goto LABEL_27;
      }
    }
    v24 = 0;
    goto LABEL_25;
  }
  v30 = 0;
  v24 = 1;
LABEL_27:
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  return v30 & 1;
}

+ (BOOL)getFloatFromObject:(id)a3 copyToValue:(float *)a4 withRemapDictionary:(id)a5 andPostRemapOperation:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  float v10;
  float v11;
  float v12;
  char v14;
  id v15;
  id v16;
  id v20;
  id v21;
  char v22;
  id v23;
  float v24;
  int v25;
  id v26;
  id v27;
  id v28;
  float *v29;
  id location[3];
  char v31;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = a4;
  v28 = 0;
  objc_storeStrong(&v28, a5);
  v27 = 0;
  objc_storeStrong(&v27, a6);
  v26 = location[0];
  if (v28)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (id)objc_msgSend(v28, "objectForKey:", location[0]);
      v7 = v26;
      v26 = v6;

    }
    else
    {
      v15 = v28;
      v16 = (id)objc_msgSend(location[0], "stringValue");
      v8 = (id)objc_msgSend(v15, "objectForKey:");
      v9 = v26;
      v26 = v8;

    }
  }
  if (v26)
  {
    objc_msgSend(v26, "floatValue");
    v24 = v10;
    v22 = 0;
    v14 = 0;
    if (v27)
    {
      v23 = (id)objc_msgSend(v27, "getPostRemapOperationName");
      v22 = 1;
      v14 = objc_msgSend(v23, "isEqualToString:", CFSTR("truncate"));
    }
    if ((v22 & 1) != 0)

    if ((v14 & 1) == 0)
      goto LABEL_21;
    v21 = (id)objc_msgSend(v27, "getTruncateOpMinValue");
    if (v21 && (objc_msgSend(v21, "floatValue"), v24 < v11))
    {
      v31 = 0;
      v25 = 1;
    }
    else
    {
      v20 = (id)objc_msgSend(v27, "getTruncateOpMaxValue");
      if (v20 && (objc_msgSend(v20, "floatValue"), v24 > v12))
      {
        v31 = 0;
        v25 = 1;
      }
      else
      {
        v25 = 0;
      }
      objc_storeStrong(&v20, 0);
    }
    objc_storeStrong(&v21, 0);
    if (!v25)
    {
LABEL_21:
      *v29 = v24;
      v31 = 1;
      v25 = 1;
    }
  }
  else
  {
    v31 = 0;
    v25 = 1;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
  return v31 & 1;
}

+ (BOOL)getDoubleFromObject:(id)a3 copyToValue:(double *)a4 withRemapDictionary:(id)a5 andPostRemapOperation:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  char v14;
  id v15;
  id v16;
  id v20;
  id v21;
  char v22;
  id v23;
  double v24;
  int v25;
  id v26;
  id v27;
  id v28;
  double *v29;
  id location[3];
  char v31;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = a4;
  v28 = 0;
  objc_storeStrong(&v28, a5);
  v27 = 0;
  objc_storeStrong(&v27, a6);
  v26 = location[0];
  if (v28)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (id)objc_msgSend(v28, "objectForKey:", location[0]);
      v7 = v26;
      v26 = v6;

    }
    else
    {
      v15 = v28;
      v16 = (id)objc_msgSend(location[0], "stringValue");
      v8 = (id)objc_msgSend(v15, "objectForKey:");
      v9 = v26;
      v26 = v8;

    }
  }
  if (v26)
  {
    objc_msgSend(v26, "doubleValue");
    v24 = v10;
    v22 = 0;
    v14 = 0;
    if (v27)
    {
      v23 = (id)objc_msgSend(v27, "getPostRemapOperationName");
      v22 = 1;
      v14 = objc_msgSend(v23, "isEqualToString:", CFSTR("truncate"));
    }
    if ((v22 & 1) != 0)

    if ((v14 & 1) == 0)
      goto LABEL_21;
    v21 = (id)objc_msgSend(v27, "getTruncateOpMinValue");
    if (v21 && (objc_msgSend(v21, "doubleValue"), v24 < v11))
    {
      v31 = 0;
      v25 = 1;
    }
    else
    {
      v20 = (id)objc_msgSend(v27, "getTruncateOpMaxValue");
      if (v20 && (objc_msgSend(v20, "doubleValue"), v24 > v12))
      {
        v31 = 0;
        v25 = 1;
      }
      else
      {
        v25 = 0;
      }
      objc_storeStrong(&v20, 0);
    }
    objc_storeStrong(&v21, 0);
    if (!v25)
    {
LABEL_21:
      *v29 = v24;
      v31 = 1;
      v25 = 1;
    }
  }
  else
  {
    v31 = 0;
    v25 = 1;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
  return v31 & 1;
}

+ (void)copyInt32Values:(int)a3 fromArray:(id)a4 toBuffer:(int *)a5 withDefaultValue:(int)a6 withRemapInfo:(id)a7 andPostRemapOperation:(id)a8
{
  id v12;
  id v13;
  unsigned int v14;
  int *v15;
  id location;
  unsigned int v17;
  SEL v18;
  id v19;

  v19 = a1;
  v18 = a2;
  v17 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v15 = a5;
  v14 = a6;
  v13 = 0;
  objc_storeStrong(&v13, a7);
  v12 = 0;
  objc_storeStrong(&v12, a8);
  if (v17)
  {
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      objc_msgSend(v19, "copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapData:andPostRemapOperation:", v17, location, v15, v14, v13, v12);
    else
      objc_msgSend(v19, "copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:", v17, location, v15, v14, v13, v12);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

+ (void)copyInt32Values:(int)a3 fromArray:(id)a4 toBuffer:(int *)a5 withDefaultValue:(int)a6 withRemapData:(id)a7 andPostRemapOperation:(id)a8
{
  int *v8;
  int v9;
  int v10;
  int v11;
  id v12;
  BOOL v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  char v41;
  id v42;
  int v43;
  id v44;
  _QWORD v45[8];
  id v46;
  os_log_type_t v47;
  os_log_t v48;
  int v49;
  id v50;
  unsigned int i;
  int v52;
  int v53;
  os_log_type_t type;
  os_log_t oslog;
  unsigned int v56;
  unsigned int *v57;
  _QWORD *v58;
  _QWORD __b[8];
  id v60;
  id v61;
  id v62;
  id v63;
  int v64;
  int *v65;
  id location;
  int v67;
  SEL v68;
  id v69;
  _BYTE v70[128];
  uint8_t v71[32];
  uint8_t v72[24];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v69 = a1;
  v68 = a2;
  v67 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v65 = a5;
  v64 = a6;
  v63 = 0;
  objc_storeStrong(&v63, a7);
  v62 = 0;
  objc_storeStrong(&v62, a8);
  v35 = objc_alloc(MEMORY[0x1E0C99E08]);
  v61 = (id)objc_msgSend(v35, "initWithCapacity:", objc_msgSend(location, "count"));
  memset(__b, 0, sizeof(__b));
  v36 = location;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", __b, v73, 16);
  if (v37)
  {
    v28 = *(_QWORD *)__b[2];
    v29 = 0;
    v30 = v37;
    while (1)
    {
      v27 = v29;
      if (*(_QWORD *)__b[2] != v28)
        objc_enumerationMutation(v36);
      v60 = *(id *)(__b[1] + 8 * v29);
      v25 = v61;
      v26 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v60, "longLongValue"));
      objc_msgSend(v25, "setObject:forKey:", &unk_1EA4CEC20);

      ++v29;
      if (v27 + 1 >= v30)
      {
        v29 = 0;
        v30 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", __b, v73, 16);
        if (!v30)
          break;
      }
    }
  }

  v58 = (_QWORD *)objc_msgSend(objc_retainAutorelease(v63), "bytes");
  v57 = 0;
  v56 = 0;
  v56 = *(_DWORD *)v58;
  oslog = (os_log_t)MEMORY[0x1E0C81028];
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v72, v67, v56);
    _os_log_debug_impl(&dword_1DC678000, oslog, type, "copyInt32Values: %d values, remap from binary data (%d entries)", v72, 0xEu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v58 = (_QWORD *)((char *)v58 + 4);
  v53 = 0;
  v52 = objc_msgSend(v61, "count");
  for (i = 0; i < v56; ++i)
  {
    v57 = (unsigned int *)v58;
    v58 = (_QWORD *)((char *)v58 + 4);
    v50 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *v58++);
    v24 = (id)objc_msgSend(v61, "objectForKey:", v50);

    if (!v24)
      goto LABEL_14;
    v22 = v61;
    v23 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *v57);
    objc_msgSend(v22, "setObject:forKey:");

    if (++v53 == v52)
      v49 = 4;
    else
LABEL_14:
      v49 = 0;
    objc_storeStrong(&v50, 0);
    if (v49)
      break;
  }
  v48 = (os_log_t)MEMORY[0x1E0C81028];
  v47 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_2_4_0_8_0((uint64_t)v71, v53, objc_msgSend(location, "count"));
    _os_log_debug_impl(&dword_1DC678000, v48, v47, "Mapped %d of %lu input values", v71, 0x12u);
  }
  objc_storeStrong((id *)&v48, 0);
  v53 = 0;
  memset(v45, 0, sizeof(v45));
  v20 = location;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", v45, v70, 16);
  if (v21)
  {
    v17 = *(_QWORD *)v45[2];
    v18 = 0;
    v19 = v21;
    while (1)
    {
      v16 = v18;
      if (*(_QWORD *)v45[2] != v17)
        objc_enumerationMutation(v20);
      v46 = *(id *)(v45[1] + 8 * v18);
      v14 = v61;
      v15 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v46, "longLongValue"));
      v44 = (id)objc_msgSend(v14, "objectForKey:");

      v43 = 0;
      v43 = objc_msgSend(v44, "intValue");
      if (v43 == -1)
      {
        v49 = 8;
        goto LABEL_47;
      }
      v41 = 0;
      v13 = 0;
      if (v62)
      {
        v42 = (id)objc_msgSend(v62, "getPostRemapOperationName");
        v41 = 1;
        v13 = v42 != 0;
      }
      if ((v41 & 1) != 0)

      if (v13)
        break;
LABEL_44:
      *v65++ = v43;
      if (++v53 == v67)
        v49 = 7;
      else
        v49 = 0;
LABEL_47:
      objc_storeStrong(&v44, 0);
      if (v49 && v49 != 8)
        goto LABEL_52;
      ++v18;
      if (v16 + 1 >= v19)
      {
        v18 = 0;
        v19 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", v45, v70, 16);
        if (!v19)
          goto LABEL_51;
      }
    }
    v40 = (id)objc_msgSend(v62, "getPostRemapOperationName");
    if ((objc_msgSend(v40, "isEqualToString:", CFSTR("hash")) & 1) != 0)
    {
      v11 = v43;
      v12 = (id)objc_msgSend(v62, "getHashOpModValue");
      v43 = v11 % (int)objc_msgSend(v12, "intValue");

    }
    else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("truncate")) & 1) != 0)
    {
      v39 = (id)objc_msgSend(v62, "getTruncateOpMinValue");
      if (v39 && (v10 = v43, v10 < (int)objc_msgSend(v39, "intValue")))
      {
        v49 = 8;
      }
      else
      {
        v38 = (id)objc_msgSend(v62, "getTruncateOpMaxValue");
        if (v38 && (v9 = v43, v9 > (int)objc_msgSend(v38, "intValue")))
          v49 = 8;
        else
          v49 = 0;
        objc_storeStrong(&v38, 0);
      }
      objc_storeStrong(&v39, 0);
      if (v49)
      {
LABEL_43:
        objc_storeStrong(&v40, 0);
        if (v49)
          goto LABEL_47;
        goto LABEL_44;
      }
    }
    v49 = 0;
    goto LABEL_43;
  }
LABEL_51:
  v49 = 0;
LABEL_52:

  while (v53 < v67)
  {
    v8 = v65++;
    *v8 = v64;
    ++v53;
  }
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v63, 0);
  objc_storeStrong(&location, 0);
}

+ (void)copyInt32Values:(int)a3 fromArray:(id)a4 toBuffer:(int *)a5 withDefaultValue:(int)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  _BOOL4 v17;
  _QWORD __b[8];
  uint64_t v23;
  int v24;
  os_log_type_t type;
  os_log_t oslog;
  id v27;
  id v28;
  int v29;
  int *v30;
  id location;
  int v32;
  SEL v33;
  id v34;
  _BYTE v35[128];
  uint8_t v36[24];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v34 = a1;
  v33 = a2;
  v32 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v30 = a5;
  v29 = a6;
  v28 = 0;
  objc_storeStrong(&v28, a7);
  v27 = 0;
  objc_storeStrong(&v27, a8);
  oslog = (os_log_t)MEMORY[0x1E0C81028];
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    v16 = v32;
    v17 = v28 != 0;
    if (v28)
      v15 = objc_msgSend(v28, "count");
    else
      v15 = 0;
    __os_log_helper_16_0_3_4_0_4_0_8_0((uint64_t)v36, v16, v17, v15);
    _os_log_debug_impl(&dword_1DC678000, oslog, type, "copyInt32Values: %d values, remap from dict, has remap dict: %d, sizee: %lu", v36, 0x18u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v24 = 0;
  memset(__b, 0, sizeof(__b));
  v13 = location;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
  if (v14)
  {
    v10 = *(_QWORD *)__b[2];
    v11 = 0;
    v12 = v14;
    while (1)
    {
      v9 = v11;
      if (*(_QWORD *)__b[2] != v10)
        objc_enumerationMutation(v13);
      v23 = *(_QWORD *)(__b[1] + 8 * v11);
      if (+[AMDFeature getIntFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "getIntFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:", v23, v30, v28, v27))
      {
        ++v30;
        if (++v24 == v32)
          break;
      }
      ++v11;
      if (v9 + 1 >= v12)
      {
        v11 = 0;
        v12 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
        if (!v12)
          break;
      }
    }
  }

  while (v24 < v32)
  {
    v8 = v30++;
    *v8 = v29;
    ++v24;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&location, 0);
}

+ (void)copyFloat32Values:(int)a3 fromArray:(id)a4 toBuffer:(float *)a5 withDefaultValue:(float)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  float *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD __b[8];
  uint64_t v20;
  int v21;
  int v22;
  id v23;
  id v24;
  float v25;
  float *v26;
  id location;
  int v28;
  SEL v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v30 = a1;
  v29 = a2;
  v28 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v26 = a5;
  v25 = a6;
  v24 = 0;
  objc_storeStrong(&v24, a7);
  v23 = 0;
  objc_storeStrong(&v23, a8);
  if (v28)
  {
    v21 = 0;
    memset(__b, 0, sizeof(__b));
    v13 = location;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
    if (v14)
    {
      v10 = *(_QWORD *)__b[2];
      v11 = 0;
      v12 = v14;
      while (1)
      {
        v9 = v11;
        if (*(_QWORD *)__b[2] != v10)
          objc_enumerationMutation(v13);
        v20 = *(_QWORD *)(__b[1] + 8 * v11);
        if (+[AMDFeature getFloatFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "getFloatFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:", v20, v26, v24, v23))
        {
          ++v26;
          if (++v21 == v28)
            break;
        }
        ++v11;
        if (v9 + 1 >= v12)
        {
          v11 = 0;
          v12 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
          if (!v12)
            goto LABEL_12;
        }
      }
      v22 = 2;
    }
    else
    {
LABEL_12:
      v22 = 0;
    }

    while (v21 < v28)
    {
      v8 = v26++;
      *v8 = v25;
      ++v21;
    }
    v22 = 0;
  }
  else
  {
    v22 = 1;
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&location, 0);
}

+ (void)copyDoubleValues:(int)a3 fromArray:(id)a4 toBuffer:(double *)a5 withDefaultValue:(double)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  double *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD __b[8];
  uint64_t v20;
  int v21;
  int v22;
  id v23;
  id v24;
  double v25;
  double *v26;
  id location;
  int v28;
  SEL v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v30 = a1;
  v29 = a2;
  v28 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v26 = a5;
  v25 = a6;
  v24 = 0;
  objc_storeStrong(&v24, a7);
  v23 = 0;
  objc_storeStrong(&v23, a8);
  if (v28)
  {
    v21 = 0;
    memset(__b, 0, sizeof(__b));
    v13 = location;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
    if (v14)
    {
      v10 = *(_QWORD *)__b[2];
      v11 = 0;
      v12 = v14;
      while (1)
      {
        v9 = v11;
        if (*(_QWORD *)__b[2] != v10)
          objc_enumerationMutation(v13);
        v20 = *(_QWORD *)(__b[1] + 8 * v11);
        if (+[AMDFeature getDoubleFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "getDoubleFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:", v20, v26, v24, v23))
        {
          ++v26;
          if (++v21 == v28)
            break;
        }
        ++v11;
        if (v9 + 1 >= v12)
        {
          v11 = 0;
          v12 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
          if (!v12)
            goto LABEL_12;
        }
      }
      v22 = 2;
    }
    else
    {
LABEL_12:
      v22 = 0;
    }

    while (v21 < v28)
    {
      v8 = v26++;
      *v8 = v25;
      ++v21;
    }
    v22 = 0;
  }
  else
  {
    v22 = 1;
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&location, 0);
}

- (id)_value
{
  return self->__value;
}

- (void)set_value:(id)a3
{
  objc_storeStrong(&self->__value, a3);
}

- (int64_t)_dataType
{
  return self->__dataType;
}

- (void)set_dataType:(int64_t)a3
{
  self->__dataType = a3;
}

- (id)_remapInfo
{
  return self->__remapInfo;
}

- (void)set_remapInfo:(id)a3
{
  objc_storeStrong(&self->__remapInfo, a3);
}

- (PostRemapOperation)_postRemapOperation
{
  return self->__postRemapOperation;
}

- (void)set_postRemapOperation:(id)a3
{
  objc_storeStrong((id *)&self->__postRemapOperation, a3);
}

- (NSArray)_shape
{
  return self->__shape;
}

- (void)set_shape:(id)a3
{
  objc_storeStrong((id *)&self->__shape, a3);
}

- (NSMutableArray)_actualShape
{
  return self->__actualShape;
}

- (void)set_actualShape:(id)a3
{
  objc_storeStrong((id *)&self->__actualShape, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__actualShape, 0);
  objc_storeStrong((id *)&self->__shape, 0);
  objc_storeStrong((id *)&self->__postRemapOperation, 0);
  objc_storeStrong(&self->__remapInfo, 0);
  objc_storeStrong(&self->__value, 0);
}

@end
