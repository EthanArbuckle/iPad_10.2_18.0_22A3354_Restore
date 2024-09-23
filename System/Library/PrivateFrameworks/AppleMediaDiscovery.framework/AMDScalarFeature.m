@implementation AMDScalarFeature

- (AMDScalarFeature)initWithValue:(id)a3
{
  AMDScalarFeature *v3;
  AMDScalarFeature *v5;
  objc_super v6;
  id location[2];
  AMDScalarFeature *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)AMDScalarFeature;
  v8 = -[AMDFeature initWithValue:](&v6, sel_initWithValue_, location[0]);
  objc_storeStrong((id *)&v8, v8);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (id)stringValue
{
  id v2;
  void *v4;
  id v5;
  char v6;
  id v7;
  char v8;
  id v9;
  char v10;
  id v11;
  char v12;
  id v13;
  void *v15;

  v5 = -[AMDFeature _value](self, "_value");
  v12 = 0;
  v10 = 0;
  v8 = 0;
  v6 = 0;
  if (v5)
  {
    v13 = -[AMDFeature _value](self, "_value");
    v12 = 1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[AMDFeature _value](self, "_value");
      v10 = 1;
      v4 = v11;
    }
    else
    {
      v9 = -[AMDFeature _value](self, "_value");
      v8 = 1;
      v7 = (id)objc_msgSend(v9, "stringValue");
      v6 = 1;
      v4 = v7;
    }
    v2 = v4;
  }
  else
  {
    v2 = 0;
  }
  v15 = v2;
  if ((v6 & 1) != 0)

  if ((v8 & 1) != 0)
  if ((v10 & 1) != 0)

  if ((v12 & 1) != 0)
  return v15;
}

- (void)copyInt32Values:(int)a3 toBuffer:(int *)a4 withDefaultValue:(int)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  id v8;
  BOOL v9;
  os_log_t oslog;
  id v13;
  id v14;
  id location;
  int v16;
  int *v17;
  int v18;
  SEL v19;
  AMDScalarFeature *v20;
  uint8_t v21[8];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = self;
  v19 = a2;
  v18 = a3;
  v17 = a4;
  v16 = a5;
  location = 0;
  objc_storeStrong(&location, a6);
  v14 = 0;
  objc_storeStrong(&v14, a7);
  v13 = 0;
  objc_storeStrong(&v13, a8);
  if (v18 != 1)
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v21, v18);
      _os_log_error_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_ERROR, "trying to get %d values (!= 1) from NumericFeature", v21, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v8 = -[AMDFeature _value](v20, "_value");
  v9 = +[AMDFeature getIntFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "getIntFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:");

  if (!v9)
    *v17 = v16;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyFloat32Values:(int)a3 toBuffer:(float *)a4 withDefaultValue:(float)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  id v8;
  BOOL v9;
  os_log_t oslog;
  id v13;
  id v14;
  id location;
  float v16;
  float *v17;
  int v18;
  SEL v19;
  AMDScalarFeature *v20;
  uint8_t v21[8];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = self;
  v19 = a2;
  v18 = a3;
  v17 = a4;
  v16 = a5;
  location = 0;
  objc_storeStrong(&location, a6);
  v14 = 0;
  objc_storeStrong(&v14, a7);
  v13 = 0;
  objc_storeStrong(&v13, a8);
  if (v18 != 1)
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v21, v18);
      _os_log_error_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_ERROR, "trying to get %d values (!= 1) from NumericFeature", v21, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v8 = -[AMDFeature _value](v20, "_value");
  v9 = +[AMDFeature getFloatFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "getFloatFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:");

  if (!v9)
    *v17 = v16;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyDoubleValues:(int)a3 toBuffer:(double *)a4 withDefaultValue:(double)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  id v8;
  BOOL v9;
  os_log_t oslog;
  id v13;
  id v14;
  id location;
  double v16;
  double *v17;
  int v18;
  SEL v19;
  AMDScalarFeature *v20;
  uint8_t v21[8];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = self;
  v19 = a2;
  v18 = a3;
  v17 = a4;
  v16 = a5;
  location = 0;
  objc_storeStrong(&location, a6);
  v14 = 0;
  objc_storeStrong(&v14, a7);
  v13 = 0;
  objc_storeStrong(&v13, a8);
  if (v18 != 1)
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v21, v18);
      _os_log_error_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_ERROR, "trying to get %d values (!= 1) from NumericFeature", v21, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v8 = -[AMDFeature _value](v20, "_value");
  v9 = +[AMDFeature getDoubleFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "getDoubleFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:");

  if (!v9)
    *v17 = v16;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);
}

@end
