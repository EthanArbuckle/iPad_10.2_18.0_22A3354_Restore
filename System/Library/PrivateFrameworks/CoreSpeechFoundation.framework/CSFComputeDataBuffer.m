@implementation CSFComputeDataBuffer

- (CSFComputeDataBuffer)initWithProperties:(id)a3 name:(id)a4 errOut:(id *)a5
{
  id v9;
  id v10;
  CSFComputeDataBuffer *v11;
  CSFComputeDataBuffer *v12;
  NSData *v13;
  id v14;
  void *v15;
  CSFComputeDataBuffer *v16;
  NSData *data;
  NSData *v18;
  id v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CSFComputeDataBuffer;
  v11 = -[CSFComputeDataBuffer init](&v21, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_7;
  v20 = 0;
  -[CSFComputeDataBuffer _allocateDataWithTensorProperties:error:](v11, "_allocateDataWithTensorProperties:error:", v9, &v20);
  v13 = (NSData *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  if (!v14)
  {
    objc_storeStrong((id *)&v12->_tensorProperties, a3);
    data = v12->_data;
    v12->_data = v13;
    v18 = v13;

    objc_storeStrong((id *)&v12->_tensorName, a4);
LABEL_7:
    v16 = v12;
    goto LABEL_8;
  }
  v15 = v14;
  if (a5)
    *a5 = objc_retainAutorelease(v14);

  v16 = 0;
LABEL_8:

  return v16;
}

- (CSFComputeDataBuffer)initWithInputArray:(id)a3 name:(id)a4 properties:(id)a5 errOut:(id *)a6
{
  id v10;
  CSFComputeDataBuffer *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  CSFComputeDataBuffer *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t i;
  void *v28;
  int v29;
  void *v30;
  int v31;
  int v32;
  uint64_t v33;
  unint64_t j;
  void *v35;
  int v36;
  void *v37;
  int v38;
  int v39;
  NSData *data;
  NSData *v41;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  unint64_t v49;
  void *v50;
  NSData *v51;
  void *v52;
  id v53;
  id v54;
  int v55;
  id v56;
  objc_super v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v54 = a4;
  v53 = a5;
  v57.receiver = self;
  v57.super_class = (Class)CSFComputeDataBuffer;
  v11 = -[CSFComputeDataBuffer init](&v57, sel_init);
  if (!v11)
    goto LABEL_36;
  if (!v10 || (v12 = objc_msgSend(v10, "count"), !v54) || !v12)
  {
    if (a6)
    {
      v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v66 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("initialize with inputArray: %@"), v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *a6 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2458, v20);

    }
    goto LABEL_15;
  }
  v13 = +[CSFModelComputeBackendUtils getRankOfTensor:](CSFModelComputeBackendUtils, "getRankOfTensor:", v10);
  if (v13 < 1
    || (objc_msgSend(v53, "shape"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = v13 == objc_msgSend(v14, "count"),
        v14,
        !v15))
  {
    if (a6)
    {
      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v64 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("initialize with inputArray: %@"), v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *a6 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2458, v23);

    }
    goto LABEL_15;
  }
  v56 = 0;
  -[CSFComputeDataBuffer _allocateDataWithTensorProperties:error:](v11, "_allocateDataWithTensorProperties:error:", v53, &v56);
  v51 = (NSData *)objc_claimAutoreleasedReturnValue();
  v16 = v56;
  if (!v16)
  {
    objc_msgSend(v53, "shape");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v53, "dataType");
    if (objc_msgSend(v50, "count") == 1)
    {
      v26 = 0;
      for (i = 0; i < objc_msgSend(v10, "count"); ++i)
      {
        if (v25 == 1)
        {
          v55 = 0;
          objc_msgSend(v10, "objectAtIndexedSubscript:", i);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "floatValue");
          v32 = v31;

          v55 = v32;
          -[NSData replaceBytesInRange:withBytes:](v51, "replaceBytesInRange:withBytes:", v26, 4, &v55);
        }
        else
        {
          if (v25)
          {
            if (!a6)
              goto LABEL_47;
            v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v62 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Compute data type not supported"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v52;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2458, v44);
            goto LABEL_44;
          }
          v55 = 0;
          objc_msgSend(v10, "objectAtIndexedSubscript:", i);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "intValue");

          v55 = v29;
          -[NSData replaceBytesInRange:withBytes:](v51, "replaceBytesInRange:withBytes:", v26, 4, &v55);
        }
        v26 += 4;
      }
    }
    else
    {
      if (objc_msgSend(v50, "count") != 2)
      {
        if (a6)
        {
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v58 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rank > 0 not supported"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v52;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2458, v44);
LABEL_44:
          *a6 = v45;
LABEL_45:

LABEL_46:
        }
LABEL_47:

        goto LABEL_15;
      }
      v33 = 0;
      v49 = 0;
LABEL_26:
      if (v49 < objc_msgSend(v10, "count"))
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        for (j = 0; ; ++j)
        {
          if (j >= objc_msgSend(v52, "count"))
          {

            ++v49;
            goto LABEL_26;
          }
          if (v25 == 1)
          {
            v55 = 0;
            objc_msgSend(v52, "objectAtIndexedSubscript:", j);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "floatValue");
            v39 = v38;

            v55 = v39;
            -[NSData replaceBytesInRange:withBytes:](v51, "replaceBytesInRange:withBytes:", v33, 4, &v55);
          }
          else
          {
            if (v25)
            {
              if (a6)
              {
                v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v60 = *MEMORY[0x1E0CB2D50];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Compute data type not supported"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = v44;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                *a6 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2458, v47);

                goto LABEL_45;
              }
              goto LABEL_46;
            }
            v55 = 0;
            objc_msgSend(v52, "objectAtIndexedSubscript:", j);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "intValue");

            v55 = v36;
            -[NSData replaceBytesInRange:withBytes:](v51, "replaceBytesInRange:withBytes:", v33, 4, &v55);
          }
          v33 += 4;
        }
      }
    }
    objc_storeStrong((id *)&v11->_tensorProperties, a5);
    data = v11->_data;
    v11->_data = v51;
    v41 = v51;

    objc_storeStrong((id *)&v11->_tensorName, a4);
LABEL_36:
    v24 = v11;
    goto LABEL_37;
  }
  v17 = v16;
  if (a6)
    *a6 = objc_retainAutorelease(v16);

LABEL_15:
  v24 = 0;
LABEL_37:

  return v24;
}

- (void)getWritableDataPtr
{
  return (void *)-[NSData bytes](self->_data, "bytes");
}

- (id)convertDataToArray
{
  CSFTensorProperties **p_tensorProperties;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  _DWORD *v8;
  unsigned int *v9;
  unint64_t i;
  void *v11;
  unint64_t v12;
  double v13;
  unint64_t elementSize;
  void *v15;
  NSObject *v16;
  id v17;
  const char *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  id v23;
  unint64_t v24;
  char *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  double v29;
  unint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  _DWORD *v35;
  unsigned int *v36;
  void *v37;
  unint64_t v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  unint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  p_tensorProperties = &self->_tensorProperties;
  -[CSFTensorProperties shape](self->_tensorProperties, "shape");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CSFTensorProperties dataType](*p_tensorProperties, "dataType");
  if ((unint64_t)objc_msgSend(v4, "count") <= 2 && objc_msgSend(v4, "count"))
  {
    if (self->_data)
    {
      v6 = 0x1E0C99000uLL;
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = -[NSData bytes](self->_data, "bytes");
      v9 = -[NSData bytes](self->_data, "bytes");
      if (objc_msgSend(v4, "count") == 1)
      {
        for (i = 0; ; ++i)
        {
          objc_msgSend(v4, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "unsignedLongValue");

          if (i >= v12)
            break;
          elementSize = self->_elementSize;
          if (i >= elementSize)
          {
            v34 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v40 = "-[CSFComputeDataBuffer convertDataToArray]";
              v41 = 2048;
              v42 = i;
              v43 = 2048;
              v44 = elementSize;
              _os_log_error_impl(&dword_1B502E000, v34, OS_LOG_TYPE_ERROR, "%s index: %lu out of bound: %lu", buf, 0x20u);
            }
            goto LABEL_33;
          }
          if (v5)
          {
            LODWORD(v13) = v8[i];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9[i]);
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      else
      {
        v36 = v9;
        v37 = v7;
        v20 = 0;
        v38 = 0;
        v35 = v8;
LABEL_18:
        objc_msgSend(v4, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "unsignedLongValue");

        if (v38 < v22)
        {
          v23 = objc_alloc_init(*(Class *)(v6 + 3560));
          v24 = 0;
          v25 = (char *)&v8[v20];
          while (1)
          {
            objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "unsignedLongValue");
            v28 = v20 + v24;

            if (v24 >= v27)
            {
              v32 = (void *)objc_msgSend(v23, "copy");
              v7 = v37;
              objc_msgSend(v37, "addObject:", v32);
              v8 = v35;
              v6 = 0x1E0C99000;

              ++v38;
              v20 = v28;
              goto LABEL_18;
            }
            v30 = self->_elementSize;
            if (v28 >= v30)
              break;
            if (v5)
            {
              LODWORD(v29) = *(_DWORD *)&v25[4 * v24];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v36[v20 + v24]);
            }
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v31);

            ++v24;
          }
          v33 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v40 = "-[CSFComputeDataBuffer convertDataToArray]";
            v41 = 2048;
            v42 = v20 + v24;
            v43 = 2048;
            v44 = v30;
            _os_log_error_impl(&dword_1B502E000, v33, OS_LOG_TYPE_ERROR, "%s index: %lu out of bound: %lu", buf, 0x20u);
          }

          v7 = v37;
LABEL_33:
          v17 = 0;
          goto LABEL_34;
        }
      }
      v17 = v7;
LABEL_34:

      goto LABEL_14;
    }
    v16 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[CSFComputeDataBuffer convertDataToArray]";
      v19 = "%s data is empty, Cannot convert ComputeData buffer to NSArray";
LABEL_36:
      _os_log_error_impl(&dword_1B502E000, v16, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
    }
  }
  else
  {
    v16 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[CSFComputeDataBuffer convertDataToArray]";
      v19 = "%s rank > 2 or == 0 is not supported";
      goto LABEL_36;
    }
  }
  v17 = 0;
LABEL_14:

  return v17;
}

- (id)description
{
  void *v2;
  NSString *tensorName;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  tensorName = self->_tensorName;
  -[CSFTensorProperties description](self->_tensorProperties, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<Name:%@ Properties: %@>"), tensorName, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)_getTensorSizeWithProperties:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  objc_msgSend(v3, "shape");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0;
  if (v3)
  {
    if (v4)
    {
      v6 = 0;
      if (objc_msgSend(v4, "count"))
      {
        v7 = 1;
        while (v6 < objc_msgSend(v5, "count"))
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v7 *= (int)objc_msgSend(v8, "intValue");

          ++v6;
        }
        if (objc_msgSend(v3, "dataType") && objc_msgSend(v3, "dataType") != 1)
          v9 = 0;
        else
          v9 = 4;
        v6 = v9 * v7;
      }
    }
  }

  return v6;
}

- (id)_allocateDataWithTensorProperties:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[CSFComputeDataBuffer _getTensorSizeWithProperties:](self, "_getTensorSizeWithProperties:", v6);
  self->_elementSize = v7;
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", self->_elementSize);
  }
  else
  {
    if (a4)
    {
      v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v15 = *MEMORY[0x1E0CB2D50];
      v10 = (void *)MEMORY[0x1E0CB3940];
      -[CSFTensorProperties description](self->_tensorProperties, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("cannot get element size with property: %@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2458, v13);

    }
    v8 = 0;
  }

  return v8;
}

- (CSFTensorProperties)tensorProperties
{
  return self->_tensorProperties;
}

- (NSString)tensorName
{
  return self->_tensorName;
}

- (void)setTensorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)elementSize
{
  return self->_elementSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_tensorName, 0);
  objc_storeStrong((id *)&self->_tensorProperties, 0);
}

@end
