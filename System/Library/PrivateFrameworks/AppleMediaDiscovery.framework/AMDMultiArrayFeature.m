@implementation AMDMultiArrayFeature

- (AMDMultiArrayFeature)initWithValue:(id)a3
{
  AMDMultiArrayFeature *v3;
  AMDMultiArrayFeature *v5;
  objc_super v6;
  id location[2];
  AMDMultiArrayFeature *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)AMDMultiArrayFeature;
  v8 = -[AMDFeature initWithValue:](&v6, sel_initWithValue_, location[0]);
  objc_storeStrong((id *)&v8, v8);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (id)getMultiArray:(id *)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v9;
  id v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  NSMutableArray *v14;
  NSMutableArray *v15;
  BOOL v16;
  NSMutableArray *v17;
  BOOL v18;
  id v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  char isKindOfClass;
  id v24;
  NSMutableArray *v25;
  NSArray *v26;
  BOOL v27;
  id v28;
  NSArray *v29;
  uint64_t v30;
  void *v31;
  id v32;
  NSArray *v33;
  uint64_t v34;
  id v35;
  NSArray *v36;
  BOOL v37;
  id v38;
  NSArray *v39;
  BOOL v40;
  NSArray *v41;
  BOOL v42;
  id v43;
  id v44;
  NSArray *v45;
  id v46;
  int k;
  uint64_t v48;
  int j;
  id v50;
  id v51;
  os_log_type_t v52;
  id v53;
  __CFString *v54;
  os_log_type_t v55;
  id v56;
  id v57;
  uint64_t v58;
  int v59;
  os_log_type_t v60;
  id location;
  id v62;
  unsigned int i;
  uint64_t v64;
  id v65;
  id *v66;
  SEL v67;
  AMDMultiArrayFeature *v68;
  id v69;
  uint8_t v70[16];
  uint8_t v71[16];
  uint8_t v72[24];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v68 = self;
  v67 = a2;
  v66 = a3;
  v43 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v45 = -[AMDFeature _shape](v68, "_shape");
  v44 = (id)objc_msgSend(v43, "initWithCapacity:", -[NSArray count](v45, "count"));
  -[AMDFeature set_actualShape:](v68, "set_actualShape:");

  v65 = -[AMDFeature _value](v68, "_value");
  v64 = 1;
  for (i = 0; ; ++i)
  {
    v41 = -[AMDFeature _shape](v68, "_shape");
    v42 = i >= -[NSArray count](v41, "count");

    if (v42)
    {
      v21 = -[AMDFeature _value](v68, "_value");
      v51 = -[AMDMultiArrayFeature buildMultiArrayBufferFrom:andCapacity:error:](v68, "buildMultiArrayBufferFrom:andCapacity:error:");

      if (*v66)
      {
        v69 = 0;
        v59 = 1;
      }
      else
      {
        v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v20 = -[AMDFeature _actualShape](v68, "_actualShape");
        v50 = (id)objc_msgSend(v19, "initWithCapacity:", -[NSMutableArray count](v20, "count"));

        for (j = 0; ; ++j)
        {
          v17 = -[AMDFeature _actualShape](v68, "_actualShape");
          v18 = j >= (unint64_t)-[NSMutableArray count](v17, "count");

          if (v18)
            break;
          v48 = 1;
          for (k = j + 1; ; ++k)
          {
            v15 = -[AMDFeature _actualShape](v68, "_actualShape");
            v16 = k >= (unint64_t)-[NSMutableArray count](v15, "count");

            if (v16)
              break;
            v14 = -[AMDFeature _actualShape](v68, "_actualShape");
            v13 = (id)-[NSMutableArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", k);
            v48 *= objc_msgSend(v13, "longValue");

          }
          v12 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v48);
          objc_msgSend(v50, "addObject:");

        }
        v10 = objc_alloc(MEMORY[0x1E0C9E970]);
        v9 = objc_msgSend(objc_retainAutorelease(v51), "bytes");
        v11 = -[AMDFeature _actualShape](v68, "_actualShape");
        v46 = (id)objc_msgSend(v10, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v9, v11, -[AMDFeature _dataType](v68, "_dataType"), v50, 0, v66);

        if (*v66)
          v69 = 0;
        else
          v69 = v46;
        v59 = 1;
        objc_storeStrong(&v46, 0);
        objc_storeStrong(&v50, 0);
      }
      objc_storeStrong(&v51, 0);
      goto LABEL_35;
    }
    if (!v65 || !objc_msgSend(v65, "count"))
    {
      v62 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Empty array at depth %u"), i);
      location = MEMORY[0x1E0C81028];
      v60 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v72, (uint64_t)v62);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)location, v60, "%@", v72, 0xCu);
      }
      objc_storeStrong(&location, 0);
      v3 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v62);
      *v66 = v3;
      v69 = 0;
      v59 = 1;
      objc_storeStrong(&v62, 0);
      goto LABEL_35;
    }
    v58 = 0;
    v39 = -[AMDFeature _shape](v68, "_shape");
    v38 = -[NSArray objectAtIndexedSubscript:](v39, "objectAtIndexedSubscript:", i);
    v40 = (int)objc_msgSend(v38, "intValue") >= 0;

    if (!v40)
    {
      v58 = objc_msgSend(v65, "count");
      goto LABEL_15;
    }
    v34 = objc_msgSend(v65, "count");
    v36 = -[AMDFeature _shape](v68, "_shape");
    v35 = -[NSArray objectAtIndexedSubscript:](v36, "objectAtIndexedSubscript:", i);
    v37 = v34 == objc_msgSend(v35, "unsignedIntValue");

    if (!v37)
      break;
    v29 = -[AMDFeature _shape](v68, "_shape");
    v28 = -[NSArray objectAtIndexedSubscript:](v29, "objectAtIndexedSubscript:", i);
    v58 = (int)objc_msgSend(v28, "intValue");

LABEL_15:
    v25 = -[AMDFeature _actualShape](v68, "_actualShape");
    v24 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v58);
    -[NSMutableArray addObject:](v25, "addObject:");

    v64 *= v58;
    v26 = -[AMDFeature _shape](v68, "_shape");
    v27 = i + 1 >= -[NSArray count](v26, "count");

    if (v27)
    {
      v22 = (id)objc_msgSend(v65, "firstObject");
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v54 = CFSTR("MultiArray does not contain numbers");
        v53 = MEMORY[0x1E0C81028];
        v52 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v70, (uint64_t)v54);
          _os_log_error_impl(&dword_1DC678000, (os_log_t)v53, v52, "%@", v70, 0xCu);
        }
        objc_storeStrong(&v53, 0);
        v7 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v54);
        *v66 = v7;
        v69 = 0;
        v59 = 1;
        objc_storeStrong((id *)&v54, 0);
        goto LABEL_35;
      }
    }
    else
    {
      v5 = (id)objc_msgSend(v65, "firstObject");
      v6 = v65;
      v65 = v5;

    }
  }
  v31 = (void *)MEMORY[0x1E0CB3940];
  v30 = objc_msgSend(v65, "count");
  v33 = -[AMDFeature _shape](v68, "_shape");
  v32 = -[NSArray objectAtIndexedSubscript:](v33, "objectAtIndexedSubscript:", i);
  v57 = (id)objc_msgSend(v31, "stringWithFormat:", CFSTR("Unexpected size at depth %u, found: %lu, expected: %@"), i, v30, v32);

  v56 = MEMORY[0x1E0C81028];
  v55 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled((os_log_t)v56, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v71, (uint64_t)v57);
    _os_log_error_impl(&dword_1DC678000, (os_log_t)v56, v55, "%@", v71, 0xCu);
  }
  objc_storeStrong(&v56, 0);
  v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v57);
  *v66 = v4;
  v69 = 0;
  v59 = 1;
  objc_storeStrong(&v57, 0);
LABEL_35:
  objc_storeStrong(&v65, 0);
  return v69;
}

- (id)buildMultiArrayBufferFrom:(id)a3 andCapacity:(unint64_t)a4 error:(id *)a5
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  AMDMultiArrayFeature *v16;
  AMDMultiArrayFeature *v17;
  AMDMultiArrayFeature *v18;
  uint64_t v21;
  os_log_t oslog;
  id v23[3];
  int v24;
  uint64_t v25;
  id v26;
  id *v27;
  unint64_t v28;
  id location[2];
  AMDMultiArrayFeature *v30;
  id v31;
  uint8_t v32[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = a4;
  v27 = a5;
  v26 = 0;
  v21 = -[AMDFeature _dataType](v30, "_dataType");
  if (v21 == 65568)
  {
    v11 = (id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * v28);
    v12 = v26;
    v26 = v11;

    v16 = v30;
    v13 = objc_msgSend(objc_retainAutorelease(v26), "mutableBytes");
    v23[1] = -[AMDMultiArrayFeature fillFloat32MultiArray:fromSource:atDepth:error:](v16, "fillFloat32MultiArray:fromSource:atDepth:error:", v13, location[0], 0, v27);
    if (*v27)
    {
      v31 = 0;
      v24 = 1;
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v21 != 65600)
  {
    if (v21 != 131104)
    {
      v23[0] = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown data type: %ldd"), -[AMDFeature _dataType](v30, "_dataType"));
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v32, (uint64_t)v23[0]);
        _os_log_error_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_ERROR, "%@", v32, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v14 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v23[0]);
      *v27 = v14;
      objc_storeStrong(v23, 0);
      goto LABEL_17;
    }
    v8 = (id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * v28);
    v9 = v26;
    v26 = v8;

    v17 = v30;
    v10 = objc_msgSend(objc_retainAutorelease(v26), "mutableBytes");
    v23[2] = -[AMDMultiArrayFeature fillInt32MultiArray:fromSource:atDepth:error:](v17, "fillInt32MultiArray:fromSource:atDepth:error:", v10, location[0], 0, v27);
    if (*v27)
    {
      v31 = 0;
      v24 = 1;
      goto LABEL_18;
    }
LABEL_17:
    v31 = v26;
    v24 = 1;
    goto LABEL_18;
  }
  v5 = (id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 8 * v28);
  v6 = v26;
  v26 = v5;

  v18 = v30;
  v7 = objc_msgSend(objc_retainAutorelease(v26), "mutableBytes");
  v25 = -[AMDMultiArrayFeature fillDoubleMultiArray:fromSource:atDepth:error:](v18, "fillDoubleMultiArray:fromSource:atDepth:error:", v7, location[0], 0, v27);
  if (!*v27)
    goto LABEL_17;
  v31 = 0;
  v24 = 1;
LABEL_18:
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return v31;
}

- (int)fillInt32MultiArray:(int *)a3 fromSource:(id)a4 atDepth:(unsigned int)a5 error:(id *)a6
{
  id v6;
  id v7;
  AMDMultiArrayFeature *v9;
  id v10;
  id v11;
  id v12;
  PostRemapOperation *v13;
  id v14;
  id v15;
  NSMutableArray *v16;
  BOOL v17;
  id v20;
  NSMutableArray *v21;
  unsigned int v22;
  unsigned int i;
  uint64_t v24;
  uint64_t v25;
  unsigned int j;
  id v27;
  __CFString *v28;
  id v29;
  int *v30;
  int v31;
  os_log_type_t v32;
  id v33;
  id v34;
  unsigned int v35;
  id *v36;
  unsigned int v37;
  id location;
  int *v39;
  SEL v40;
  AMDMultiArrayFeature *v41;
  int *v42;
  uint8_t v43[16];
  uint8_t v44[24];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v41 = self;
  v40 = a2;
  v39 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v37 = a5;
  v36 = a6;
  v21 = -[AMDFeature _actualShape](v41, "_actualShape");
  v20 = (id)-[NSMutableArray objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", a5);
  v22 = objc_msgSend(v20, "unsignedIntValue");

  v35 = v22;
  if (objc_msgSend(location, "count") == v22)
  {
    v16 = -[AMDFeature _actualShape](v41, "_actualShape");
    v17 = v37 + 1 != -[NSMutableArray count](v16, "count");

    if (v17)
    {
      v25 = (uint64_t)v39;
      v24 = 0;
      for (i = 0; i < v35; ++i)
      {
        v9 = v41;
        v10 = (id)objc_msgSend(location, "objectAtIndexedSubscript:", i);
        v24 = -[AMDMultiArrayFeature fillInt32MultiArray:fromSource:atDepth:error:](v9, "fillInt32MultiArray:fromSource:atDepth:error:", v25);

        if (*v36)
        {
          v42 = 0;
          v31 = 1;
          goto LABEL_23;
        }
        v25 = v24;
      }
      v42 = (int *)v24;
      v31 = 1;
    }
    else
    {
      v30 = v39;
      v29 = (id)objc_msgSend(location, "firstObject");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = -[AMDFeature _remapInfo](v41, "_remapInfo");

        if (v15)
        {
          v12 = location;
          v14 = -[AMDFeature _remapInfo](v41, "_remapInfo");
          v13 = -[AMDFeature _postRemapOperation](v41, "_postRemapOperation");
          +[AMDFeature copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapData:andPostRemapOperation:](AMDFeature, "copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapData:andPostRemapOperation:", v35, v12, v30, 0, v14);

          v30 += v35;
        }
        else
        {
          for (j = 0; j < v35; ++j)
          {
            v11 = (id)objc_msgSend(location, "objectAtIndexedSubscript:", j);
            *v30 = objc_msgSend(v11, "intValue");

            ++v30;
          }
        }
        v42 = v30;
        v31 = 1;
      }
      else
      {
        v28 = CFSTR("Data is not int32");
        v27 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v43, (uint64_t)v28);
          _os_log_error_impl(&dword_1DC678000, (os_log_t)v27, OS_LOG_TYPE_ERROR, "%@", v43, 0xCu);
        }
        objc_storeStrong(&v27, 0);
        v7 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v28);
        *v36 = v7;
        v42 = 0;
        v31 = 1;
        objc_storeStrong((id *)&v28, 0);
      }
      objc_storeStrong(&v29, 0);
    }
  }
  else
  {
    v34 = objc_retainAutoreleasedReturnValue((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Size mismatch while copying int32s at level %u: expected; %u, got: %lu"),
                                                   v37,
                                                   v35,
                                                   objc_msgSend(location, "count")));
    v33 = MEMORY[0x1E0C81028];
    v32 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v44, (uint64_t)v34);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v33, v32, "%@", v44, 0xCu);
    }
    objc_storeStrong(&v33, 0);
    v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v34);
    *v36 = v6;
    v42 = 0;
    v31 = 1;
    objc_storeStrong(&v34, 0);
  }
LABEL_23:
  objc_storeStrong(&location, 0);
  return v42;
}

- (float)fillFloat32MultiArray:(float *)a3 fromSource:(id)a4 atDepth:(unsigned int)a5 error:(id *)a6
{
  id v6;
  id v7;
  int v8;
  AMDMultiArrayFeature *v10;
  id v11;
  id v12;
  NSMutableArray *v13;
  BOOL v14;
  id v17;
  NSMutableArray *v18;
  unsigned int v19;
  unsigned int i;
  uint64_t v21;
  uint64_t v22;
  unsigned int j;
  id v24;
  __CFString *v25;
  id v26;
  float *v27;
  int v28;
  os_log_type_t v29;
  id v30;
  id v31;
  unsigned int v32;
  id *v33;
  unsigned int v34;
  id location;
  float *v36;
  SEL v37;
  AMDMultiArrayFeature *v38;
  float *v39;
  uint8_t v40[16];
  uint8_t v41[24];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v38 = self;
  v37 = a2;
  v36 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v34 = a5;
  v33 = a6;
  v18 = -[AMDFeature _actualShape](v38, "_actualShape");
  v17 = (id)-[NSMutableArray objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", a5);
  v19 = objc_msgSend(v17, "unsignedIntValue");

  v32 = v19;
  if (objc_msgSend(location, "count") == v19)
  {
    v13 = -[AMDFeature _actualShape](v38, "_actualShape");
    v14 = v34 + 1 != -[NSMutableArray count](v13, "count");

    if (v14)
    {
      v22 = (uint64_t)v36;
      v21 = 0;
      for (i = 0; i < v32; ++i)
      {
        v10 = v38;
        v11 = (id)objc_msgSend(location, "objectAtIndexedSubscript:", i);
        v21 = -[AMDMultiArrayFeature fillFloat32MultiArray:fromSource:atDepth:error:](v10, "fillFloat32MultiArray:fromSource:atDepth:error:", v22);

        if (*v33)
        {
          v39 = 0;
          v28 = 1;
          goto LABEL_21;
        }
        v22 = v21;
      }
      v39 = (float *)v21;
      v28 = 1;
    }
    else
    {
      v27 = v36;
      v26 = (id)objc_msgSend(location, "firstObject");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        for (j = 0; j < v32; ++j)
        {
          v12 = (id)objc_msgSend(location, "objectAtIndexedSubscript:", j);
          objc_msgSend(v12, "floatValue");
          *(_DWORD *)v27 = v8;

          ++v27;
        }
        v39 = v27;
        v28 = 1;
      }
      else
      {
        v25 = CFSTR("Data is not Float32");
        v24 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v40, (uint64_t)v25);
          _os_log_error_impl(&dword_1DC678000, (os_log_t)v24, OS_LOG_TYPE_ERROR, "%@", v40, 0xCu);
        }
        objc_storeStrong(&v24, 0);
        v7 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v25);
        *v33 = v7;
        v39 = 0;
        v28 = 1;
        objc_storeStrong((id *)&v25, 0);
      }
      objc_storeStrong(&v26, 0);
    }
  }
  else
  {
    v31 = objc_retainAutoreleasedReturnValue((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Size mismatch while copying float32s at level %u: expected; %u, got: %lu"),
                                                   v34,
                                                   v32,
                                                   objc_msgSend(location, "count")));
    v30 = MEMORY[0x1E0C81028];
    v29 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v41, (uint64_t)v31);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v30, v29, "%@", v41, 0xCu);
    }
    objc_storeStrong(&v30, 0);
    v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v31);
    *v33 = v6;
    v39 = 0;
    v28 = 1;
    objc_storeStrong(&v31, 0);
  }
LABEL_21:
  objc_storeStrong(&location, 0);
  return v39;
}

- (double)fillDoubleMultiArray:(double *)a3 fromSource:(id)a4 atDepth:(unsigned int)a5 error:(id *)a6
{
  id v6;
  id v7;
  uint64_t v8;
  AMDMultiArrayFeature *v10;
  id v11;
  id v12;
  NSMutableArray *v13;
  BOOL v14;
  id v17;
  NSMutableArray *v18;
  unsigned int v19;
  unsigned int i;
  uint64_t v21;
  uint64_t v22;
  unsigned int j;
  id v24;
  __CFString *v25;
  id v26;
  double *v27;
  int v28;
  os_log_type_t v29;
  id v30;
  id v31;
  unsigned int v32;
  id *v33;
  unsigned int v34;
  id location;
  double *v36;
  SEL v37;
  AMDMultiArrayFeature *v38;
  double *v39;
  uint8_t v40[16];
  uint8_t v41[24];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v38 = self;
  v37 = a2;
  v36 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v34 = a5;
  v33 = a6;
  v18 = -[AMDFeature _actualShape](v38, "_actualShape");
  v17 = (id)-[NSMutableArray objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", a5);
  v19 = objc_msgSend(v17, "unsignedIntValue");

  v32 = v19;
  if (objc_msgSend(location, "count") == v19)
  {
    v13 = -[AMDFeature _actualShape](v38, "_actualShape");
    v14 = v34 + 1 != -[NSMutableArray count](v13, "count");

    if (v14)
    {
      v22 = (uint64_t)v36;
      v21 = 0;
      for (i = 0; i < v32; ++i)
      {
        v10 = v38;
        v11 = (id)objc_msgSend(location, "objectAtIndexedSubscript:", i);
        v21 = -[AMDMultiArrayFeature fillDoubleMultiArray:fromSource:atDepth:error:](v10, "fillDoubleMultiArray:fromSource:atDepth:error:", v22);

        if (*v33)
        {
          v39 = 0;
          v28 = 1;
          goto LABEL_21;
        }
        v22 = v21;
      }
      v39 = (double *)v21;
      v28 = 1;
    }
    else
    {
      v27 = v36;
      v26 = (id)objc_msgSend(location, "firstObject");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        for (j = 0; j < v32; ++j)
        {
          v12 = (id)objc_msgSend(location, "objectAtIndexedSubscript:", j);
          objc_msgSend(v12, "doubleValue");
          *(_QWORD *)v27 = v8;

          ++v27;
        }
        v39 = v27;
        v28 = 1;
      }
      else
      {
        v25 = CFSTR("Data is not Float32");
        v24 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v40, (uint64_t)v25);
          _os_log_error_impl(&dword_1DC678000, (os_log_t)v24, OS_LOG_TYPE_ERROR, "%@", v40, 0xCu);
        }
        objc_storeStrong(&v24, 0);
        v7 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v25);
        *v33 = v7;
        v39 = 0;
        v28 = 1;
        objc_storeStrong((id *)&v25, 0);
      }
      objc_storeStrong(&v26, 0);
    }
  }
  else
  {
    v31 = objc_retainAutoreleasedReturnValue((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Size mismatch while copying doubles at level %u: expected; %u, got: %lu"),
                                                   v34,
                                                   v32,
                                                   objc_msgSend(location, "count")));
    v30 = MEMORY[0x1E0C81028];
    v29 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v41, (uint64_t)v31);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v30, v29, "%@", v41, 0xCu);
    }
    objc_storeStrong(&v30, 0);
    v6 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v31);
    *v33 = v6;
    v39 = 0;
    v28 = 1;
    objc_storeStrong(&v31, 0);
  }
LABEL_21:
  objc_storeStrong(&location, 0);
  return v39;
}

@end
