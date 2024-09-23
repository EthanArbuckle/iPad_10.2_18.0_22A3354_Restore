id getDataFromFile(NSString *a1, NSString *a2)
{
  NSString *v3;
  NSString *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundlePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/%@"), v9, v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v5, "fileExistsAtPath:", v6))
    v10 = v6;
  else
    v10 = 0;
  if (v10)
  {
    v11 = v6;
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resourcePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@/%@"), v14, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "fileExistsAtPath:", v11))
      v15 = v11;
    else
      v15 = 0;
    v6 = v15;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void sub_23453F5D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

id getDataFromData(void *a1, int a2, int a3, void *a4)
{
  id v7;
  id v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  id v15;
  float *v16;
  unint64_t v17;
  unint64_t v18;
  _WORD *v19;
  uint64_t v20;
  _WORD *v21;
  float v22;
  _BYTE *v28;
  uint64_t v29;
  _BYTE *v30;
  float v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a4;
  v9 = objc_msgSend(v7, "length");
  if (v8)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v10);
          v14 = *(id *)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v14, "unsignedLongValue", (_QWORD)v34);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v11);
    }

  }
  if (a3 == a2)
  {
    v15 = v7;
  }
  else
  {
    v16 = (float *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
    v17 = (unsigned __int16)a2 >> 3;
    v18 = v9 / v17;
    if (a3 == 536870920)
    {
      v28 = malloc_type_malloc(v9 / v17, 0x100004077774924uLL);
      if (v9 >= v17)
      {
        if (v18 <= 1)
          v29 = 1;
        else
          v29 = v9 / v17;
        v30 = v28;
        do
        {
          v31 = *v16++;
          *v30++ = (int)v31;
          --v29;
        }
        while (v29);
      }
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v28, v9 / v17, 1, (_QWORD)v34);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 268435472)
      {
        v32 = 0;
        goto LABEL_29;
      }
      v19 = malloc_type_malloc(2 * v18, 0x1000040BDFB0063uLL);
      if (v9 >= v17)
      {
        if (v18 <= 1)
          v20 = 1;
        else
          v20 = v9 / v17;
        v21 = v19;
        do
        {
          v22 = *v16++;
          _S0 = v22;
          __asm { FCVT            H0, S0 }
          *v21++ = LOWORD(_S0);
          --v20;
        }
        while (v20);
      }
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v19, 2 * v18, 1, (_QWORD)v34);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v32 = v15;
LABEL_29:

  return v32;
}

void sub_23453F890(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id getDataFromFile(NSString *a1, NSString *a2, int a3, int a4, void *a5)
{
  id v9;
  void *v10;
  void *v11;

  v9 = a5;
  getDataFromFile(a1, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  getDataFromData(v10, a3, a4, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_23453F950(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id makeMPSTensorDataWithData(MPSGraphDevice *a1, uint64_t a2, uint64_t a3, uint64_t a4, NSString *a5, int *a6, int a7)
{
  MPSGraphDevice *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  v12 = a1;
  v23[0] = &unk_2505A6DA0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v14;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a7)
    v17 = 268435472;
  else
    v17 = 8;
  v18 = (((v17 >> 3) & 3) * (uint64_t)(int)a2 + 63) & 0xFFFFFFFFFFFFFFC0;
  if (a6)
    *a6 = v18;
  -[MPSGraphDevice metalDevice](v12, "metalDevice");
  if (a7)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    createMetalBufferRand<half>(v19, a2, a3, a4, v18, 1.0);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    createMetalBufferRand<unsigned char>(v19, a2, a3, a4, v18, 255.0);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE580]), "initWithMTLBuffer:shape:dataType:rowBytes:", v20, v16, v17, v18);
  return v21;
}

void sub_23453FB48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id createMetalBufferRand<half>(void *a1, int a2, int a3, int a4, uint64_t a5, float a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _WORD *v15;
  uint64_t v16;
  _WORD *v17;
  uint64_t v18;
  void *v24;
  size_t v26;
  id v27;
  char *v28;
  uint64_t v29;
  int v30;

  v27 = a1;
  srand(1u);
  v26 = a3 * a5 * a4;
  v28 = (char *)malloc_type_malloc(v26, 0xE7AFA5C9uLL);
  if (a4 >= 1)
  {
    v11 = 0;
    v12 = a3;
    v29 = a5 * a3;
    v13 = v28;
    v30 = a3;
    do
    {
      if (a3 >= 1)
      {
        v14 = 0;
        v15 = v13;
        do
        {
          v16 = a2;
          v17 = v15;
          if (a2 >= 1)
          {
            do
            {
              v18 = rand();
              _S0 = (float)(int)((((v18 << 32 >> 2) + (int)v18) >> 61)
                               + ((unint64_t)((v18 << 32 >> 2) + (int)v18) >> 63))
                  * a6;
              __asm { FCVT            H0, S0 }
              *v17++ = LOWORD(_S0);
              --v16;
            }
            while (v16);
          }
          ++v14;
          v15 = (_WORD *)((char *)v15 + a5);
        }
        while (v14 != v12);
      }
      ++v11;
      v13 += v29;
      a3 = v30;
    }
    while (v11 != a4);
  }
  v24 = (void *)objc_msgSend(v27, "newBufferWithBytes:length:options:", v28, v26, 0, v26);
  free(v28);

  return v24;
}

void sub_23453FD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

id createMetalBufferRand<unsigned char>(void *a1, int a2, int a3, int a4, uint64_t a5, float a6)
{
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  void *v19;
  size_t v21;
  id v22;
  _BYTE *v23;
  uint64_t v24;
  int v25;

  v22 = a1;
  srand(1u);
  v21 = a3 * a5 * a4;
  v23 = malloc_type_malloc(v21, 0xE7AFA5C9uLL);
  if (a4 >= 1)
  {
    v11 = 0;
    v12 = a3;
    v24 = a5 * a3;
    v13 = v23;
    v25 = a3;
    do
    {
      if (a3 >= 1)
      {
        v14 = 0;
        v15 = v13;
        do
        {
          v16 = a2;
          v17 = v15;
          if (a2 >= 1)
          {
            do
            {
              v18 = rand();
              *v17++ = (int)(float)((float)(int)((((v18 << 32 >> 2) + (int)v18) >> 61)
                                               + ((unint64_t)((v18 << 32 >> 2) + (int)v18) >> 63))
                                  * a6);
              --v16;
            }
            while (v16);
          }
          ++v14;
          v15 += a5;
        }
        while (v14 != v12);
      }
      ++v11;
      v13 += v24;
      a3 = v25;
    }
    while (v11 != a4);
  }
  v19 = (void *)objc_msgSend(v22, "newBufferWithBytes:length:options:", v23, v21, 0, v21);
  free(v23);

  return v19;
}

void sub_23453FE7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t getModelFilePath()
{
  return 0;
}

id getModelFileURL()
{
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id getEmitModelWeightsPath(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourcePath");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("emit_v35_constants.dat");
  if (a3)
    v8 = CFSTR("emit_v35_constants_2x.dat");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/%@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_23453FF70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id getEmitModelWeightsData(uint64_t a1, uint64_t a2, int a3)
{
  void *v3;
  void *v4;

  getEmitModelWeightsPath(a1, 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_23453FFD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t parseNum<unsigned long long>(const char *a1, uint64_t a2)
{
  uint64_t result;

  result = sscanf(a1, "0x%llx", a2);
  if ((_DWORD)result != 1)
    return sscanf(a1, "%llu", a2) == 1;
  return result;
}

uint64_t parseNum<unsigned int>(const char *a1, uint64_t a2)
{
  uint64_t result;

  result = sscanf(a1, "0x%x", a2);
  if ((_DWORD)result != 1)
    return sscanf(a1, "%u", a2) == 1;
  return result;
}

BOOL parseNum<int>(const char *a1, uint64_t a2)
{
  return sscanf(a1, "%i", a2) == 1;
}

BOOL findEnvVarNum<int>(const char *a1, _DWORD *a2, int a3, int a4)
{
  char *v8;
  int v9;
  _BOOL8 v10;

  v8 = getenv(a1);
  if (!v8 || !*v8)
  {
    v10 = 0;
    *a2 = a3;
    return v10;
  }
  v9 = sscanf(v8, "%i", a2);
  v10 = v9 == 1;
  if (v9 != 1)
  {
    *a2 = a3;
    if (!a4)
      return v10;
    goto LABEL_5;
  }
  if (a4)
LABEL_5:
    setenv(a1, "", 1);
  return v10;
}

{
  return __Z13findEnvVarNumIiEbPKcRT_S2_b(a1, a2, a3, a4);
}

uint64_t findEnvVarNum<unsigned int>(const char *a1, _DWORD *a2, int a3, int a4)
{
  char *v8;
  uint64_t v9;

  v8 = getenv(a1);
  if (!v8 || !*v8)
  {
    v9 = 0;
    *a2 = a3;
    return v9;
  }
  v9 = parseNum<unsigned int>(v8, (uint64_t)a2);
  if ((v9 & 1) == 0)
  {
    *a2 = a3;
    if (!a4)
      return v9;
    goto LABEL_5;
  }
  if (a4)
LABEL_5:
    setenv(a1, "", 1);
  return v9;
}

{
  return __Z13findEnvVarNumIjEbPKcRT_S2_b(a1, a2, a3, a4);
}

uint64_t findEnvVarNum<unsigned long long>(const char *a1, _QWORD *a2, uint64_t a3, int a4)
{
  char *v8;
  uint64_t v9;

  v8 = getenv(a1);
  if (!v8 || !*v8)
  {
    v9 = 0;
    *a2 = a3;
    return v9;
  }
  v9 = parseNum<unsigned long long>(v8, (uint64_t)a2);
  if ((v9 & 1) == 0)
  {
    *a2 = a3;
    if (!a4)
      return v9;
    goto LABEL_5;
  }
  if (a4)
LABEL_5:
    setenv(a1, "", 1);
  return v9;
}

void sub_2345405F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v6;

  _Unwind_Resume(a1);
}

void sub_23454084C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_234540B84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_234540F08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id computeKernel(void *a1, void *a2, void *a3, _QWORD *a4, void *a5, unint64_t a6, uint64_t a7)
{
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v13 = a2;
  functionFromLibrary(a1, a3, (uint64_t)a4, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14 || a4 && *a4)
  {
    v15 = 0;
  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x24BDDD550]);
    objc_msgSend(v16, "setThreadGroupSizeIsMultipleOfThreadExecutionWidth:", a7);
    objc_msgSend(v16, "setComputeFunction:", v14);
    if (a6)
      objc_msgSend(v16, "setMaxTotalThreadsPerThreadgroup:", a6);
    v17 = (void *)objc_msgSend(v13, "newComputePipelineStateWithDescriptor:error:", v16, a4);
    v18 = v17;
    if (v17 && objc_msgSend(v17, "maxTotalThreadsPerThreadgroup") >= a6)
      v15 = v18;
    else
      v15 = 0;

  }
  return v15;
}

void sub_234541050(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id tileKernel(void *a1, void *a2, void *a3, _QWORD *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t *v23;
  void *v24;
  id v25;
  uint64_t *v27;

  v15 = a2;
  functionFromLibrary(a1, a3, (uint64_t)a4, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16 || a4 && *a4)
  {
    v17 = 0;
  }
  else
  {
    v18 = objc_alloc_init(MEMORY[0x24BDDD760]);
    objc_msgSend(v18, "setSampleCount:", 1);
    objc_msgSend(v18, "setTileFunction:", v16);
    if (a6)
      objc_msgSend(v18, "setMaxTotalThreadsPerThreadgroup:", a6);
    v27 = &a10;
    v19 = a9;
    if (a9)
    {
      v20 = 0;
      do
      {
        objc_msgSend(v18, "colorAttachments");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setPixelFormat:", v19);

        v23 = v27++;
        v19 = *v23;
        ++v20;
      }
      while (*v23);
    }
    v24 = (void *)objc_msgSend(v15, "newRenderPipelineStateWithTileDescriptor:error:", v18, a4);
    v17 = v24;
    if (v24)
      v25 = v24;

  }
  return v17;
}

void sub_2345411D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2345424D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  void *v22;
  uint64_t v23;
  uint64_t i;

  for (i = 16; i != -8; i -= 8)
  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)(v23 - 216));

  _Unwind_Resume(a1);
}

void checkInputOutputTextures(void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  id v23;

  v23 = a1;
  v19 = a2;
  v20 = a3;
  v21 = a4;
  if (!v23)
    MTLReportFailure();
  if (objc_msgSend(v23, "textureType", a9) != 2)
    MTLReportFailure();
  if (objc_msgSend(v23, "width") != a5)
    MTLReportFailure();
  if (objc_msgSend(v23, "height") != a6)
    MTLReportFailure();
  if (v19)
  {
    if (objc_msgSend(v19, "textureType") != 2)
      MTLReportFailure();
    if (objc_msgSend(v19, "width") != a5)
      MTLReportFailure();
    if (objc_msgSend(v19, "height") != a6)
      MTLReportFailure();
  }
  if (v20)
  {
    if (objc_msgSend(v20, "textureType") != 2)
      MTLReportFailure();
    if (objc_msgSend(v20, "width") != a5)
      MTLReportFailure();
    if (objc_msgSend(v20, "height") != a6)
      MTLReportFailure();
  }
  if (!v21)
    MTLReportFailure();
  if (objc_msgSend(v21, "textureType") != 2)
    MTLReportFailure();
  if (objc_msgSend(v21, "width") != a10)
    MTLReportFailure();
  if (objc_msgSend(v21, "height") != a11)
    MTLReportFailure();
  if (objc_msgSend(v23, "pixelFormat") != a7)
    MTLReportFailure();
  if (objc_msgSend(v21, "pixelFormat") != a12)
    MTLReportFailure();
  if (objc_msgSend(v23, "width") < a8)
    MTLReportFailure();
  if (objc_msgSend(v23, "height") < v22)
    MTLReportFailure();

}

void sub_234542A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_234542B08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id functionFromLibrary(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v7 = a1;
  v8 = a2;
  v9 = a4;
  if (v9)
    v10 = objc_msgSend(v7, "newFunctionWithName:constantValues:error:", v8, v9, a3);
  else
    v10 = objc_msgSend(v7, "newFunctionWithName:", v8);
  v11 = (void *)v10;

  return v11;
}

void sub_23454311C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void MetalFxScopedSignpost::MetalFxScopedSignpost(MetalFxScopedSignpost *this, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_DWORD *)this = a2;
  *((_QWORD *)this + 1) = a3;
  *((_QWORD *)this + 2) = a4;
  *((_QWORD *)this + 3) = a5;
  *((_QWORD *)this + 4) = a6;
  if (MTLTraceEnabledSPI())
  {
    if (MTLTraceEnabled())
      kdebug_trace();
  }
}

void MetalFxScopedSignpost::~MetalFxScopedSignpost(MetalFxScopedSignpost *this)
{
  if (MTLTraceEnabledSPI())
  {
    if (MTLTraceEnabled())
      kdebug_trace();
  }
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

id EmitBR_Net_V35_getMPSGraphExecutable(NSData *a1, const BRNetDescriptor *a2, MPSGraphCompilationDescriptor *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  MPSGraphCompilationDescriptor *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  NSData *v328;
  void *v329;
  void *v330;
  void *v331;
  _QWORD v332[4];
  _QWORD v333[4];
  _QWORD v334[4];
  _QWORD v335[6];

  v335[4] = *MEMORY[0x24BDAC8D0];
  v328 = a1;
  v258 = a3;
  v5 = (void *)objc_opt_new();
  v335[0] = &unk_2505A6DB8;
  v335[1] = &unk_2505A6DD0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2->input_height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v335[2] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2->input_width);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v335[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v335, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeholderWithShape:dataType:name:", v8, 8, CFSTR("tensor0"));
  v318 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.007843);
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v328, "subdataWithRange:", 0, 1440);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v9, &unk_2505A7C78, 536870920);
  v312 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 1440, 16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v10, &unk_2505A7C90, 268435472);
  v311 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 1456, 16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v11, &unk_2505A7CA8, 268435472);
  v310 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A7CC0, 268435472, 0.0);
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A7CD8, 268435472, 1.0);
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.216797);
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v328, "subdataWithRange:", 1472, 9216);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v12, &unk_2505A7CF0, 536870920);
  v306 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 10688, 64);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v13, &unk_2505A7D08, 268435472);
  v305 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 10752, 64);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v14, &unk_2505A7D20, 268435472);
  v304 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 10816, 9216);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v15, &unk_2505A7D38, 536870920);
  v303 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 20032, 64);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v16, &unk_2505A7D50, 268435472);
  v302 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 20096, 64);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v17, &unk_2505A7D68, 268435472);
  v301 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 20160, 18432);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v18, &unk_2505A7D80, 536870920);
  v300 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 38592, 128);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v19, &unk_2505A7D98, 268435472);
  v299 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 38720, 128);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v20, &unk_2505A7DB0, 268435472);
  v298 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 38848, 73728);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v21, &unk_2505A7DC8, 536870920);
  v297 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 112576, 256);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v22, &unk_2505A7DE0, 268435472);
  v296 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 112832, 256);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v23, &unk_2505A7DF8, 268435472);
  v295 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 162.75);
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v328, "subdataWithRange:", 113088, 0x4000);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v24, &unk_2505A7E10, 536870920);
  v293 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 129472, 256);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v25, &unk_2505A7E28, 268435472);
  v292 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 129728, 256);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v26, &unk_2505A7E40, 268435472);
  v291 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A7E58, 268435472, 0.0);
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A7E70, 268435472, 1.0);
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 232.75);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v328, "subdataWithRange:", 129984, 0x2000);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v27, &unk_2505A7E88, 536870920);
  v288 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 138176, 128);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v28, &unk_2505A7EA0, 268435472);
  v287 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 138304, 128);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v29, &unk_2505A7EB8, 268435472);
  v285 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 169.0);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v328, "subdataWithRange:", 138432, 16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v30, &unk_2505A7ED0, 536870944);
  v194 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 138448, 1024);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v31, &unk_2505A7EE8, 536870920);
  v283 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 139472, 128);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v32, &unk_2505A7F00, 268435472);
  v282 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 172.0);
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 32.8125);
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v328, "subdataWithRange:", 139600, 4096);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v33, &unk_2505A7F18, 536870920);
  v278 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 143696, 128);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v34, &unk_2505A7F30, 268435472);
  v277 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 143824, 128);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v35, &unk_2505A7F48, 268435472);
  v274 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A7F60, 268435472, 0.0);
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A7F78, 268435472, 1.0);
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 43.71875);
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v328, "subdataWithRange:", 143952, 2048);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v36, &unk_2505A7F90, 536870920);
  v272 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 146000, 64);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v37, &unk_2505A7FA8, 268435472);
  v269 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 146064, 64);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v38, &unk_2505A7FC0, 268435472);
  v268 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 18.65625);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v328, "subdataWithRange:", 146128, 16);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v39, &unk_2505A7FD8, 536870944);
  v193 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 146144, 512);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v40, &unk_2505A7FF0, 536870920);
  v264 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 146656, 64);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v41, &unk_2505A8008, 268435472);
  v263 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 12.539062);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 5.898438);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A8020, 536870944, 1.0);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A8038, 536870944, 0.0);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A8050, 536870944, 16.0);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 1.546875);
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v328, "subdataWithRange:", 146720, 1024);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v42, &unk_2505A8068, 536870920);
  v256 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 147744, 64);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v43, &unk_2505A8080, 268435472);
  v255 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 147808, 64);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v44, &unk_2505A8098, 268435472);
  v251 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 5.726562);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v328, "subdataWithRange:", 147872, 512);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v45, &unk_2505A80B0, 536870920);
  v248 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 148384, 32);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v46, &unk_2505A80C8, 268435472);
  v247 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 148416, 32);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v47, &unk_2505A80E0, 268435472);
  v246 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 5.152344);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v328, "subdataWithRange:", 148448, 32);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v48, &unk_2505A80F8, 536870944);
  v189 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 536870944, 0.0);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v328, "subdataWithRange:", 148480, 16);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v49, &unk_2505A8110, 536870944);
  v187 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 148496, 256);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v50, &unk_2505A8128, 536870920);
  v240 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 148752, 32);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v51, &unk_2505A8140, 268435472);
  v239 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 5.457031);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 49.75);
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v328, "subdataWithRange:", 148784, 512);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v52, &unk_2505A8158, 536870920);
  v232 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 149296, 64);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v53, &unk_2505A8170, 268435472);
  v231 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 149360, 64);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v54, &unk_2505A8188, 268435472);
  v230 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A81A0, 268435472, 0.0);
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A81B8, 268435472, 1.0);
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 2.353516);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v328, "subdataWithRange:", 149424, 512);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v55, &unk_2505A81D0, 536870920);
  v226 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 149936, 32);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v56, &unk_2505A81E8, 268435472);
  v225 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 149968, 32);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v57, &unk_2505A8200, 268435472);
  v222 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.471436);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v328, "subdataWithRange:", 150000, 256);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v58, &unk_2505A8218, 536870920);
  v220 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 150256, 32);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v59, &unk_2505A8230, 268435472);
  v216 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 150288, 32);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v60, &unk_2505A8248, 268435472);
  v214 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A8260, 268435472, 0.0);
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A8278, 268435472, 1.0);
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.063416);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v328, "subdataWithRange:", 150320, 6336);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v61, &unk_2505A8290, 536870920);
  v211 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 156656, 88);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v62, &unk_2505A82A8, 268435472);
  v210 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v328, "subdataWithRange:", 156744, 88);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v63, &unk_2505A82C0, 268435472);
  v207 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A82D8, 268435472, 0.0);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A82F0, 268435472, 1.0);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.003922);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 8, 0.0);
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 536870944, 3.0);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 536870944, 2.0);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 536870944, 1.0);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 536870920, 0.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v318, v313, v314, 268435472, 0, CFSTR("tensor97"));
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v312, v311, v64, 268435472, 0, CFSTR("tensor98"));
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 2, 2, 1, 1, 1, 2, 2, 2, 2, 0, 0, 2);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v280, v279);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v65) = 925353388;
  objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v65);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v306, v305, v64, 268435472, 0, CFSTR("tensor104"));
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 2, 2, 1, 1, 1, 2, 2, 2, 2, 0, 0, 2);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v276, v275);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v66) = 925353388;
  objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v66);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v303, v302, v64, 268435472, 0, CFSTR("tensor110"));
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 2, 2, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v271, v270);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v67) = 925353388;
  objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v67);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v300, v299, v64, 268435472, 0, CFSTR("tensor116"));
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 2, 2, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v315, v267);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v68) = 925353388;
  objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v68);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v297, v296, v64, 268435472, 0, CFSTR("tensor122"));
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 2, 2, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v316, v265);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v69) = 925353388;
  objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v69);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v293, v292, v64, 268435472, 0, CFSTR("tensor128"));
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v262, v261);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v70) = 925353388;
  objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v70);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v288, v287, v64, 268435472, 0, CFSTR("tensor134"));
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v260, v259);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v71) = 925353388;
  objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v71);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "padTensor:withPaddingMode:leftPadding:rightPadding:constantValue:name:", 0.0);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v283, v282, v64, 268435472, 0, CFSTR("tensor141"));
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 2, 2, 1, 1, 64, 3, 3, 3, 3, 0, 0, 2);
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  v334[0] = &unk_2505A6DB8;
  v334[1] = &unk_2505A6E48;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2->output_height >> 3);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v334[2] = v72;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2->output_width >> 3);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v334[3] = v73;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v334, 4);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolutionTranspose2DWithSourceTensor:weightsTensor:outputShape:descriptor:name:", v252, v253, v74, v254, CFSTR("tensor142"));
  v249 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v249, v281, v64, 536870920, 0, CFSTR("tensor143"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v278, v277, v64, 268435472, 0, CFSTR("tensor148"));
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v245, v244);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v75) = 925353388;
  objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v75);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v272, v269, v64, 268435472, 0, CFSTR("tensor154"));
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v242, v241);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v76) = 925353388;
  objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v76);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "padTensor:withPaddingMode:leftPadding:rightPadding:constantValue:name:", 0.0);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v264, v263, v64, 268435472, 0, CFSTR("tensor161"));
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 2, 2, 1, 1, 32, 3, 3, 3, 3, 0, 0, 2);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  v333[0] = &unk_2505A6DB8;
  v333[1] = &unk_2505A6E18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2->output_height >> 2);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v333[2] = v77;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2->output_width >> 2);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v333[3] = v78;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v333, 4);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolutionTranspose2DWithSourceTensor:weightsTensor:outputShape:descriptor:name:", v236, v237, v79, v238, CFSTR("tensor162"));
  v233 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v233, v257, v64, 536870920, 0, CFSTR("tensor163"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sliceTensor:dimension:start:length:name:", v235, 1, 0, 16, CFSTR("tensor168"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v256, v255, v64, 268435472, 0, CFSTR("tensor170"));
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v229, v228);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v80) = 925353388;
  objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v80);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v248, v247, v64, 268435472, 0, CFSTR("tensor176"));
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v224, v223);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v81) = 925353388;
  objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v81);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "padTensor:withPaddingMode:leftPadding:rightPadding:constantValue:name:", 0.0);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v240, v239, v64, 268435472, 0, CFSTR("tensor183"));
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 2, 2, 1, 1, 16, 3, 3, 3, 3, 0, 0, 2);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v332[0] = &unk_2505A6DB8;
  v332[1] = &unk_2505A6E90;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2->output_height >> 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v332[2] = v82;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2->output_width >> 1);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v332[3] = v83;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v332, 4);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolutionTranspose2DWithSourceTensor:weightsTensor:outputShape:descriptor:name:", v217, v218, v84, v219, CFSTR("tensor184"));
  v213 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v213, v234, v64, 536870920, 0, CFSTR("tensor185"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v120, v234, v64, 268435472, 0, CFSTR("tensor186"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v232, v231, v64, 268435472, 0, CFSTR("tensor190"));
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v209, v208);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v85) = 925353388;
  objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v85);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v226, v225, v64, 268435472, 0, CFSTR("tensor196"));
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v200, v199);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v86) = 925353388;
  objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v86);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v220, v216, v64, 268435472, 0, CFSTR("tensor202"));
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v198, v197);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v87) = 925353388;
  objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v87);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v211, v210, v64, 268435472, 0, CFSTR("tensor208"));
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v196, v195);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v88) = 925353388;
  objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sigmoidWithTensor:name:", v89, CFSTR("tensor211"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v90, v204, v314, 8, 0, CFSTR("tensor212"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "depthToSpace2DTensor:widthAxisTensor:heightAxisTensor:depthAxisTensor:blockSize:usePixelShuffleOrder:name:", v91, v203, v202, v201, 2, 1, CFSTR("tensor213"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v331 = v92;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v331, 1);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v329 = v318;
  v94 = objc_alloc(MEMORY[0x24BDDE570]);
  objc_msgSend(v318, "shape");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)objc_msgSend(v94, "initWithShape:dataType:", v95, objc_msgSend(v318, "dataType"));
  v330 = v96;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v330, &v329, 1);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "compileWithDevice:feeds:targetTensors:targetOperations:compilationDescriptor:", 0, v97, v93, 0, v258);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  return v98;
}

void sub_23454690C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41,void *a42,void *a43,void *a44,void *a45,void *a46,void *a47,void *a48,void *a49,void *a50,void *a51,void *a52,void *a53,void *a54,void *a55,void *a56,void *a57,void *a58,void *a59,void *a60,void *a61,void *a62,void *a63)
{
  void *a64;
  void *a65;
  void *a66;
  void *a67;
  void *a68;
  void *a69;
  void *a70;
  void *a71;
  void *a72;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;

  _Unwind_Resume(a1);
}

id EmitBR_Net_V35_2x_getMPSGraphExecutable(NSData *a1, const BRNetDescriptor *a2, MPSGraphCompilationDescriptor *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  MPSGraphCompilationDescriptor *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  NSData *v316;
  void *v317;
  void *v318;
  void *v319;
  _QWORD v320[4];
  _QWORD v321[4];
  _QWORD v322[4];
  _QWORD v323[6];

  v323[4] = *MEMORY[0x24BDAC8D0];
  v316 = a1;
  v248 = a3;
  v5 = (void *)objc_opt_new();
  v323[0] = &unk_2505A6DB8;
  v323[1] = &unk_2505A6DD0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2->input_height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v323[2] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2->input_width);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v323[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v323, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeholderWithShape:dataType:name:", v8, 8, CFSTR("tensor0"));
  v314 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.007843);
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v316, "subdataWithRange:", 0, 1440);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v9, &unk_2505A8398, 536870920);
  v308 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 1440, 16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v10, &unk_2505A83B0, 268435472);
  v307 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 1456, 16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v11, &unk_2505A83C8, 268435472);
  v306 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.089966);
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v316, "subdataWithRange:", 1472, 18432);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v12, &unk_2505A83E0, 536870920);
  v304 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 19904, 128);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v13, &unk_2505A83F8, 268435472);
  v303 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 20032, 128);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v14, &unk_2505A8410, 268435472);
  v302 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 20160, 36864);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v15, &unk_2505A8428, 536870920);
  v301 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 57024, 128);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v16, &unk_2505A8440, 268435472);
  v300 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 57152, 128);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v17, &unk_2505A8458, 268435472);
  v299 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 57280, 73728);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v18, &unk_2505A8470, 536870920);
  v298 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 131008, 256);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v19, &unk_2505A8488, 268435472);
  v297 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 131264, 256);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v20, &unk_2505A84A0, 268435472);
  v296 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 131520, 294912);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v21, &unk_2505A84B8, 536870920);
  v295 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 426432, 512);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v22, &unk_2505A84D0, 268435472);
  v294 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 426944, 512);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v23, &unk_2505A84E8, 268435472);
  v293 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 1.224609);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v316, "subdataWithRange:", 427456, 0x10000);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v24, &unk_2505A8500, 536870920);
  v291 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 492992, 512);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v25, &unk_2505A8518, 268435472);
  v290 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 493504, 512);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v26, &unk_2505A8530, 268435472);
  v288 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.895996);
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v316, "subdataWithRange:", 494016, 0x8000);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v27, &unk_2505A8548, 536870920);
  v286 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 526784, 256);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v28, &unk_2505A8560, 268435472);
  v285 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 527040, 256);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v29, &unk_2505A8578, 268435472);
  v283 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.808105);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v316, "subdataWithRange:", 527296, 16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v30, &unk_2505A8590, 536870944);
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 527312, 2048);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v31, &unk_2505A85A8, 536870920);
  v281 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 529360, 256);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v32, &unk_2505A85C0, 268435472);
  v280 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.729004);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.556152);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v316, "subdataWithRange:", 529616, 0x4000);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v33, &unk_2505A85D8, 536870920);
  v275 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 546000, 256);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v34, &unk_2505A85F0, 268435472);
  v272 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 546256, 256);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v35, &unk_2505A8608, 268435472);
  v270 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.465576);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v316, "subdataWithRange:", 546512, 0x2000);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v36, &unk_2505A8620, 536870920);
  v265 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 554704, 128);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v37, &unk_2505A8638, 268435472);
  v264 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 554832, 128);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v38, &unk_2505A8650, 268435472);
  v261 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.366455);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v316, "subdataWithRange:", 554960, 16);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v39, &unk_2505A8668, 536870944);
  v178 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 554976, 1024);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v40, &unk_2505A8680, 536870920);
  v257 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 556000, 128);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v41, &unk_2505A8698, 268435472);
  v254 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.297607);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.359131);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A86B0, 536870944, 1.0);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A86C8, 536870944, 0.0);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", &unk_2505A86E0, 536870944, 32.0);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.167603);
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v316, "subdataWithRange:", 556128, 4096);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v42, &unk_2505A86F8, 536870920);
  v247 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 560224, 128);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v43, &unk_2505A8710, 268435472);
  v243 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 560352, 128);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v44, &unk_2505A8728, 268435472);
  v242 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.186157);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v316, "subdataWithRange:", 560480, 2048);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v45, &unk_2505A8740, 536870920);
  v239 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 562528, 64);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v46, &unk_2505A8758, 268435472);
  v238 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 562592, 64);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v47, &unk_2505A8770, 268435472);
  v234 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.189941);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v316, "subdataWithRange:", 562656, 32);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v48, &unk_2505A8788, 536870944);
  v174 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 536870944, 0.0);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v316, "subdataWithRange:", 562688, 16);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v49, &unk_2505A87A0, 536870944);
  v172 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 562704, 512);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v50, &unk_2505A87B8, 536870920);
  v229 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 563216, 64);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v51, &unk_2505A87D0, 268435472);
  v228 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.153076);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.501953);
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v316, "subdataWithRange:", 563280, 2048);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v52, &unk_2505A87E8, 536870920);
  v221 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 565328, 128);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v53, &unk_2505A8800, 268435472);
  v220 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 565456, 128);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v54, &unk_2505A8818, 268435472);
  v217 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.106323);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v316, "subdataWithRange:", 565584, 2048);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v55, &unk_2505A8830, 536870920);
  v214 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 567632, 64);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v56, &unk_2505A8848, 268435472);
  v211 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 567696, 64);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v57, &unk_2505A8860, 268435472);
  v209 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.083557);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v316, "subdataWithRange:", 567760, 1024);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v58, &unk_2505A8878, 536870920);
  v204 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 568784, 64);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v59, &unk_2505A8890, 268435472);
  v203 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 568848, 64);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v60, &unk_2505A88A8, 268435472);
  v200 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.077332);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData subdataWithRange:](v316, "subdataWithRange:", 568912, 12672);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v61, &unk_2505A88C0, 536870920);
  v198 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 581584, 88);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v62, &unk_2505A88D8, 268435472);
  v195 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData subdataWithRange:](v316, "subdataWithRange:", 581672, 88);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithData:shape:dataType:", v63, &unk_2505A88F0, 268435472);
  v193 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 268435472, 0.003922);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 8, 0.0);
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 536870944, 3.0);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 536870944, 2.0);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 536870944, 1.0);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantWithScalar:shape:dataType:", MEMORY[0x24BDBD1A8], 536870920, 0.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v314, v309, v310, 268435472, 0, CFSTR("tensor85"));
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v308, v307, v64, 268435472, 0, CFSTR("tensor86"));
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 2, 2, 1, 1, 1, 2, 2, 2, 2, 0, 0, 2);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v279, v278);
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reshapeTensor:withShape:name:", v306, &unk_2505A8908, CFSTR("tensor88_biasReshape"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v277);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v304, v303, v64, 268435472, 0, CFSTR("tensor92"));
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 2, 2, 1, 1, 1, 2, 2, 2, 2, 0, 0, 2);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v274, v273);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reshapeTensor:withShape:name:", v302, &unk_2505A8920, CFSTR("tensor94_biasReshape"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v271);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v301, v300, v64, 268435472, 0, CFSTR("tensor98"));
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 2, 2, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v269, v268);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reshapeTensor:withShape:name:", v299, &unk_2505A8938, CFSTR("tensor100_biasReshape"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v267);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v298, v297, v64, 268435472, 0, CFSTR("tensor104"));
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 2, 2, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v311, v263);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reshapeTensor:withShape:name:", v296, &unk_2505A8950, CFSTR("tensor106_biasReshape"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v262);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v295, v294, v64, 268435472, 0, CFSTR("tensor110"));
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 2, 2, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v312, v260);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reshapeTensor:withShape:name:", v293, &unk_2505A8968, CFSTR("tensor112_biasReshape"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v258);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v291, v290, v64, 268435472, 0, CFSTR("tensor116"));
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v256, v255);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reshapeTensor:withShape:name:", v288, &unk_2505A8980, CFSTR("tensor118_biasReshape"));
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v253);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v286, v285, v64, 268435472, 0, CFSTR("tensor122"));
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v252, v251);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reshapeTensor:withShape:name:", v283, &unk_2505A8998, CFSTR("tensor124_biasReshape"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v250);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "padTensor:withPaddingMode:leftPadding:rightPadding:constantValue:name:", 0.0);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v281, v280, v64, 268435472, 0, CFSTR("tensor129"));
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 2, 2, 1, 1, 128, 3, 3, 3, 3, 0, 0, 2);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v322[0] = &unk_2505A6DB8;
  v322[1] = &unk_2505A6E60;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2->output_height >> 3);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v322[2] = v65;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2->output_width >> 3);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v322[3] = v66;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v322, 4);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolutionTranspose2DWithSourceTensor:weightsTensor:outputShape:descriptor:name:", v244, v245, v67, v246, CFSTR("tensor130"));
  v241 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v241, v276, v64, 536870920, 0, CFSTR("tensor131"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v275, v272, v64, 268435472, 0, CFSTR("tensor136"));
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v237, v236);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reshapeTensor:withShape:name:", v270, &unk_2505A89E0, CFSTR("tensor138_biasReshape"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v235);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v265, v264, v64, 268435472, 0, CFSTR("tensor142"));
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v232, v231);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reshapeTensor:withShape:name:", v261, &unk_2505A89F8, CFSTR("tensor144_biasReshape"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v230);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "padTensor:withPaddingMode:leftPadding:rightPadding:constantValue:name:", 0.0);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v257, v254, v64, 268435472, 0, CFSTR("tensor149"));
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 2, 2, 1, 1, 64, 3, 3, 3, 3, 0, 0, 2);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  v321[0] = &unk_2505A6DB8;
  v321[1] = &unk_2505A6E48;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2->output_height >> 2);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v321[2] = v68;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2->output_width >> 2);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v321[3] = v69;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v321, 4);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolutionTranspose2DWithSourceTensor:weightsTensor:outputShape:descriptor:name:", v225, v226, v70, v227, CFSTR("tensor150"));
  v223 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v223, v249, v64, 536870920, 0, CFSTR("tensor151"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sliceTensor:dimension:start:length:name:", v224, 1, 0, 32, CFSTR("tensor156"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v247, v243, v64, 268435472, 0, CFSTR("tensor158"));
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v219, v218);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reshapeTensor:withShape:name:", v242, &unk_2505A8A40, CFSTR("tensor160_biasReshape"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v216);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v239, v238, v64, 268435472, 0, CFSTR("tensor164"));
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v213, v212);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reshapeTensor:withShape:name:", v234, &unk_2505A8A58, CFSTR("tensor166_biasReshape"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v210);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "padTensor:withPaddingMode:leftPadding:rightPadding:constantValue:name:", 0.0);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v229, v228, v64, 268435472, 0, CFSTR("tensor171"));
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 2, 2, 1, 1, 32, 3, 3, 3, 3, 0, 0, 2);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v320[0] = &unk_2505A6DB8;
  v320[1] = &unk_2505A6E18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2->output_height >> 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v320[2] = v71;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2->output_width >> 1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v320[3] = v72;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v320, 4);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolutionTranspose2DWithSourceTensor:weightsTensor:outputShape:descriptor:name:", v205, v206, v73, v207, CFSTR("tensor172"));
  v201 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v201, v222, v64, 536870920, 0, CFSTR("tensor173"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v221, v220, v64, 268435472, 0, CFSTR("tensor178"));
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v197, v196);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reshapeTensor:withShape:name:", v217, &unk_2505A8AA0, CFSTR("tensor180_biasReshape"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v194);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v214, v211, v64, 268435472, 0, CFSTR("tensor184"));
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v192, v191);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reshapeTensor:withShape:name:", v209, &unk_2505A8AB8, CFSTR("tensor186_biasReshape"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v189);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v204, v203, v64, 268435472, 0, CFSTR("tensor190"));
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v185, v184);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reshapeTensor:withShape:name:", v200, &unk_2505A8AD0, CFSTR("tensor192_biasReshape"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v183);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reLUWithTensor:name:");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v198, v195, v64, 268435472, 0, CFSTR("tensor196"));
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDE528], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v182, v181);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reshapeTensor:withShape:name:", v193, &unk_2505A8AE8, CFSTR("tensor198_biasReshape"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v180);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sigmoidWithTensor:name:", v74, CFSTR("tensor199"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v75, v190, v310, 8, 0, CFSTR("tensor200"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "depthToSpace2DTensor:widthAxisTensor:heightAxisTensor:depthAxisTensor:blockSize:usePixelShuffleOrder:name:", v76, v188, v187, v186, 2, 1, CFSTR("tensor201"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v319 = v77;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v319, 1);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v317 = v314;
  v79 = objc_alloc(MEMORY[0x24BDDE570]);
  objc_msgSend(v314, "shape");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = (void *)objc_msgSend(v79, "initWithShape:dataType:", v80, objc_msgSend(v314, "dataType"));
  v318 = v81;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v318, &v317, 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "compileWithDevice:feeds:targetTensors:targetOperations:compilationDescriptor:", 0, v82, v78, 0, v248);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  return v83;
}

void sub_23454B1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41,void *a42,void *a43,void *a44,void *a45,void *a46,void *a47,void *a48,void *a49,void *a50,void *a51,void *a52,void *a53,void *a54,void *a55,void *a56,void *a57,void *a58,void *a59,void *a60,void *a61,void *a62,void *a63)
{
  void *a64;
  void *a65;
  void *a66;
  void *a67;
  void *a68;
  void *a69;
  void *a70;
  void *a71;
  void *a72;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;

  _Unwind_Resume(a1);
}

BOOL isAtLeast2160p(unsigned int a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;

  if (a1 <= a2)
    v2 = a2;
  else
    v2 = a1;
  if (a1 >= a2)
    v3 = a2;
  else
    v3 = a1;
  return v2 > 0xEFF && v3 > 0x86F;
}

void sub_23454D2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23,uint64_t a24,void *a25,void *a26,void *a27)
{
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;

  _Unwind_Resume(a1);
}

void MPSGraphMPSGraphExecutableWrapper::prewarm(uint64_t a1, void *a2, void *a3, void *a4, char a5, uint64_t a6, void *a7, void *a8, uint64_t a9, uint64_t a10)
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  dispatch_group_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  _QWORD block[6];

  v17 = a2;
  v18 = a3;
  v19 = a4;
  v20 = a7;
  v21 = a8;
  if ((a5 & 1) != 0)
  {
    v22 = dispatch_group_create();
    v23 = *(void **)(a1 + 120);
    *(_QWORD *)(a1 + 120) = v22;

    *(_BYTE *)(a1 + 128) = 0;
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 120));
    v24 = *(NSObject **)(a1 + 120);
    dispatch_get_global_queue(25, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZN33MPSGraphMPSGraphExecutableWrapper7prewarmEPU26objcproto15MTLCommandQueue11objc_objectP18MPSGraphTensorDataS3_byPU25objcproto14MTLSharedEvent11objc_objectS5_yy_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_group_notify(v24, v25, block);

    v27[0] = v26;
    v27[1] = 3221225472;
    v27[2] = ___ZN33MPSGraphMPSGraphExecutableWrapper7prewarmEPU26objcproto15MTLCommandQueue11objc_objectP18MPSGraphTensorDataS3_byPU25objcproto14MTLSharedEvent11objc_objectS5_yy_block_invoke_2;
    v27[3] = &unk_2505A0608;
    v33 = a1;
    v34 = a6;
    v28 = v19;
    v29 = v18;
    v37 = 1;
    v30 = v20;
    v35 = a9;
    v31 = v21;
    v36 = a10;
    v32 = v17;
    dispatch_async(v25, v27);

  }
  else
  {
    *(_BYTE *)(a1 + 128) = 1;
  }

}

void MPSGraphMPSGraphExecutableWrapper::run(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, int a6, void *a7, void *a8, uint64_t a9, uint64_t a10)
{
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v31 = a2;
  v30 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  if (*(_QWORD *)a1)
  {
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "setWaitUntilCompleted:", a5);
    if (v18 && a6)
      objc_msgSend(v20, "waitForANEPrePowerUpEvent:value:", v18, a9);
    if (v19)
    {
      objc_msgSend(v20, "waitForEvent:value:", v19, a9);
      objc_msgSend(v20, "signalEvent:atExecutionEvent:value:", v19, 0, a10);
    }
    if (a6)
    {
      NSSelectorFromString(CFSTR("compilationDescriptor"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v21 = (void *)objc_opt_new();
        objc_msgSend(v21, "setOptimizationLevel:", 1);
        objc_msgSend(v21, "setOptimizationProfile:", 1);
        objc_msgSend(v21, "setAneCompilerSpatialSplitting:", 3);
        objc_msgSend(v21, "setEnableANELateLatch:", 1);
        objc_msgSend(v21, "setEnableANEFWToFWSignal:", 1);
        objc_msgSend(v20, "setCompilationDescriptor:", v21);

      }
    }
    v36 = *(_QWORD *)(a1 + 32);
    v37[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v30;
    v23 = v31;
    v34 = *(_QWORD *)(a1 + 24);
    v35 = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)a1, "runAsyncWithMTLCommandQueue:feeds:targetOperations:resultsDictionary:executionDescriptor:", v31, v25, 0, v22, v20);
  }
  else
  {
    if (!*(_QWORD *)(a1 + 8))
      __assert_rtn("run", "MetalFXTemporalScalingEffectV3.h", 198, "0");
    v26 = objc_alloc(MEMORY[0x24BDDE540]);
    v27 = (void *)objc_opt_new();
    v20 = (void *)objc_msgSend(v26, "initWithGraphExecutionDescriptor:", v27);

    objc_msgSend(v20, "setWaitUntilCompleted:", a5);
    if (v18 && a6 && *(_BYTE *)(a1 + 128))
      objc_msgSend(v20, "waitForANEPrePowerUpEvent:value:", v18, a9);
    if (v19)
    {
      objc_msgSend(v20, "waitForEvent:value:", v19, a9);
      objc_msgSend(v20, "signalEvent:atExecutionEvent:value:", v19, 0, a10);
    }
    v33 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v30;
    v23 = v31;
    v32 = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 8;
    if (!*(_BYTE *)(a1 + 128))
      v28 = 16;
    v29 = (id)objc_msgSend(*(id *)(a1 + v28), "runAsyncWithMTLCommandQueue:inputsArray:resultsArray:executionDescriptor:", v31, v25, v22, v20);
  }

}

void sub_23454D944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_23454DA9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_23454E080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41)
{
  void *v41;
  uint64_t v42;

  _Block_object_dispose((const void *)(v42 - 184), 8);
  _Block_object_dispose((const void *)(v42 - 152), 8);

  _Unwind_Resume(a1);
}

void sub_23454E818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  uint64_t v18;

  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)(v18 - 128));
  _Unwind_Resume(a1);
}

void sub_23454E8F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_23454EB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t ___ZL15isInternalBuildv_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isInternalBuild(void)::isInternal = result;
  return result;
}

uint64_t ___ZN33MPSGraphMPSGraphExecutableWrapper7prewarmEPU26objcproto15MTLCommandQueue11objc_objectP18MPSGraphTensorDataS3_byPU25objcproto14MTLSharedEvent11objc_objectS5_yy_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 128) = 1;
  return result;
}

void ___ZN33MPSGraphMPSGraphExecutableWrapper7prewarmEPU26objcproto15MTLCommandQueue11objc_objectP18MPSGraphTensorDataS3_byPU25objcproto14MTLSharedEvent11objc_objectS5_yy_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _BYTE v10[40];
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 72);
  MetalFxScopedSignpost::MetalFxScopedSignpost((MetalFxScopedSignpost *)v10, 3, *(_QWORD *)(a1 + 80), 6, 0, 0);
  v3 = objc_alloc(MEMORY[0x24BDDE540]);
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(v3, "initWithGraphExecutionDescriptor:", v4);

  objc_msgSend(v5, "setWaitUntilCompleted:", 1);
  v12[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 48) && *(_BYTE *)(a1 + 104) && *(_BYTE *)(v2 + 128))
    objc_msgSend(v5, "waitForANEPrePowerUpEvent:value:");
  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
  {
    objc_msgSend(v5, "waitForEvent:value:", v8, *(_QWORD *)(a1 + 88));
    objc_msgSend(v5, "signalEvent:atExecutionEvent:value:", *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 96));
  }
  v9 = (id)objc_msgSend(*(id *)(v2 + 8), "runAsyncWithMTLCommandQueue:inputsArray:resultsArray:executionDescriptor:", *(_QWORD *)(a1 + 64), v7, v6, v5);
  dispatch_group_leave(*(dispatch_group_t *)(v2 + 120));

  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)v10);
}

void sub_23454F2F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;

  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)&a9);
  _Unwind_Resume(a1);
}

void BRNet_v3_Filter::~BRNet_v3_Filter(BRNet_v3_Filter *this)
{
  uint64_t i;
  uint64_t j;
  uint64_t k;

  for (i = 256; i != 240; i -= 8)
  for (j = 224; j != 208; j -= 8)

  do
  {

    j -= 8;
  }
  while (j != 192);
  do
  {

    j -= 8;
  }
  while (j != 176);

  for (k = 120; k != 104; k -= 8)
  do
  {

    k -= 8;
  }
  while (k != 88);

}

CHistoryRecord *CHistoryRecord::UpdateMinMax(CHistoryRecord *this)
{
  int v1;
  float v2;
  float v3;
  uint64_t i;
  float v5;
  float v6;
  float v7;

  v1 = 0;
  v2 = 0.0;
  v3 = 999.99;
  for (i = 20; i != 500; i += 4)
  {
    v5 = *(float *)((char *)&this->var0 + i);
    v6 = fminf(v3, v5);
    v7 = fmaxf(v2, v5);
    if (v5 > 0.0)
    {
      v3 = v6;
      v2 = v7;
      ++v1;
    }
  }
  if (!v1)
  {
    v2 = 0.0;
    v3 = 0.0;
  }
  this->var7 = v2;
  this->var6 = v3;
  return this;
}

void MPSGraphMPSGraphExecutableWrapper::~MPSGraphMPSGraphExecutableWrapper(MPSGraphMPSGraphExecutableWrapper *this)
{
  if (!this->_prewarmComplete)
    dispatch_group_wait((dispatch_group_t)this->_prewarm_group, 0xFFFFFFFFFFFFFFFFLL);

}

void sub_23454F66C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_23454F6E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_23454F75C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_23454F90C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23454F9E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23454FBD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23454FC8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23454FF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_23455021C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_234550838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v16 = v15;

  _Unwind_Resume(a1);
}

void sub_2345512A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  uint64_t v18;

  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)(v18 - 160));
  _Unwind_Resume(a1);
}

void sub_23455138C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_234552494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  _Unwind_Resume(a1);
}

void sub_2345526B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_234552FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  uint64_t v18;

  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)(v18 - 128));
  _Unwind_Resume(a1);
}

void sub_234553418(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_234553494(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23455368C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_2345539A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

int *BRNet_v3_Filter::BRNet_v3_Filter(int *a1, void *a2, void *a3, int a4, int a5, int a6, int a7, uint64_t a8, int a9, int a10, char a11, char a12, char a13, char a14)
{
  id v21;
  id *v22;
  __int128 v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  char v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  id v114;
  char v115;
  __int16 v116;
  char v117;
  int v118;
  char v119;

  v114 = a2;
  v21 = a3;
  *(_OWORD *)(a1 + 18) = 0u;
  *(_OWORD *)(a1 + 34) = 0u;
  v22 = (id *)(a1 + 34);
  *(_OWORD *)(a1 + 22) = 0u;
  *(_OWORD *)(a1 + 26) = 0u;
  *((_QWORD *)a1 + 15) = 0;
  *(_OWORD *)(a1 + 38) = 0u;
  *(_OWORD *)(a1 + 42) = 0u;
  *(_OWORD *)(a1 + 46) = 0u;
  *(_OWORD *)(a1 + 50) = 0u;
  *(_OWORD *)(a1 + 54) = 0u;
  *(_OWORD *)(a1 + 58) = 0u;
  *(_OWORD *)(a1 + 62) = 0u;
  *(_OWORD *)(a1 + 66) = 0u;
  *(_OWORD *)(a1 + 70) = 0u;
  *(_OWORD *)(a1 + 74) = 0u;
  *(_OWORD *)(a1 + 78) = 0u;
  *(_OWORD *)(a1 + 82) = 0u;
  *(_OWORD *)(a1 + 86) = 0u;
  *(_OWORD *)(a1 + 90) = 0u;
  *(_OWORD *)(a1 + 94) = 0u;
  *(_OWORD *)(a1 + 98) = 0u;
  *(_OWORD *)(a1 + 102) = 0u;
  *(_OWORD *)(a1 + 106) = 0u;
  *a1 = a4;
  a1[1] = a5;
  *((_QWORD *)a1 + 1) = *(_QWORD *)(a8 + 4);
  a1[4] = a6;
  a1[5] = a7;
  v23 = *(_OWORD *)(a8 + 12);
  *((_QWORD *)&v23 + 1) = *(_QWORD *)(a8 + 44);
  *((_BYTE *)a1 + 60) = a14;
  v119 = a13;
  *(_OWORD *)(a1 + 6) = v23;
  v24 = *(_DWORD *)(a8 + 20);
  *((_WORD *)a1 + 26) = *(_DWORD *)(a8 + 24);
  *((_WORD *)a1 + 27) = *(_DWORD *)(a8 + 40);
  a1[10] = v24;
  a1[11] = a9;
  a1[12] = a10;
  a1[16] = *(_DWORD *)a8;
  *((_BYTE *)a1 + 58) = a11;
  *((_BYTE *)a1 + 59) = a13;
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 65, a4, a5, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setUsage:", 3);
  objc_msgSend(v25, "setCompressionMode:", 1);
  v26 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v27 = (void *)*((_QWORD *)a1 + 9);
  *((_QWORD *)a1 + 9) = v26;

  objc_msgSend(v25, "setPixelFormat:", 115);
  v28 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v29 = (void *)*((_QWORD *)a1 + 10);
  *((_QWORD *)a1 + 10) = v28;

  objc_msgSend(v25, "setWidth:", a1[4]);
  objc_msgSend(v25, "setHeight:", a1[5]);
  v30 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v31 = (void *)*((_QWORD *)a1 + 11);
  *((_QWORD *)a1 + 11) = v30;

  *((_BYTE *)a1 + 128) = 0;
  objc_msgSend(v25, "setPixelFormat:", 25);
  objc_msgSend(v25, "setTextureType:", 2);
  objc_msgSend(v25, "setWidth:", (uint64_t)(a1[2] + (a1[2] < 0)) >> 1);
  objc_msgSend(v25, "setHeight:", (uint64_t)(a1[3] + (a1[3] < 0)) >> 1);
  objc_msgSend(v25, "setArrayLength:", 1);
  v32 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v33 = (void *)*((_QWORD *)a1 + 12);
  *((_QWORD *)a1 + 12) = v32;

  v34 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v35 = (void *)*((_QWORD *)a1 + 13);
  *((_QWORD *)a1 + 13) = v34;

  v36 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v37 = (void *)*((_QWORD *)a1 + 14);
  *((_QWORD *)a1 + 14) = v36;

  v38 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v39 = (void *)*((_QWORD *)a1 + 15);
  *((_QWORD *)a1 + 15) = v38;

  if (v119)
    v40 = 30;
  else
    v40 = 65;
  objc_msgSend(v25, "setPixelFormat:", v40);
  v41 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v42 = *v22;
  *v22 = (id)v41;

  objc_msgSend(v25, "setPixelFormat:", 25);
  v43 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v44 = (void *)*((_QWORD *)a1 + 22);
  *((_QWORD *)a1 + 22) = v43;

  if (v119)
    v45 = 70;
  else
    v45 = 115;
  objc_msgSend(v25, "setPixelFormat:", v45);
  objc_msgSend(v25, "setWidth:", (unint64_t)objc_msgSend(*v22, "width") >> 1);
  objc_msgSend(v25, "setHeight:", (unint64_t)objc_msgSend(*v22, "height") >> 1);
  v46 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v47 = (void *)*((_QWORD *)a1 + 18);
  *((_QWORD *)a1 + 18) = v46;

  objc_msgSend(v25, "setWidth:", (uint64_t)(a1[2] + (a1[2] < 0)) >> 1);
  objc_msgSend(v25, "setHeight:", (uint64_t)(a1[3] + (a1[3] < 0)) >> 1);
  v48 = objc_msgSend(v114, "newBufferWithLength:options:", 4 * a1[1] * *a1, 0);
  v49 = (void *)*((_QWORD *)a1 + 19);
  *((_QWORD *)a1 + 19) = v48;

  objc_msgSend(v25, "setPixelFormat:", 25);
  v50 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v51 = (void *)*((_QWORD *)a1 + 23);
  *((_QWORD *)a1 + 23) = v50;

  v52 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v53 = (void *)*((_QWORD *)a1 + 24);
  *((_QWORD *)a1 + 24) = v52;

  v54 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v55 = (void *)*((_QWORD *)a1 + 25);
  *((_QWORD *)a1 + 25) = v54;

  v56 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v57 = (void *)*((_QWORD *)a1 + 26);
  *((_QWORD *)a1 + 26) = v56;

  objc_msgSend(v25, "setPixelFormat:", 23);
  v58 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v59 = (void *)*((_QWORD *)a1 + 27);
  *((_QWORD *)a1 + 27) = v58;

  v60 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v61 = (void *)*((_QWORD *)a1 + 28);
  *((_QWORD *)a1 + 28) = v60;

  objc_msgSend(v25, "setPixelFormat:", 115);
  v62 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v63 = (void *)*((_QWORD *)a1 + 29);
  *((_QWORD *)a1 + 29) = v62;

  v64 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v65 = (void *)*((_QWORD *)a1 + 30);
  *((_QWORD *)a1 + 30) = v64;

  objc_msgSend(v25, "setPixelFormat:", 65);
  objc_msgSend(v25, "setWidth:", *a1);
  objc_msgSend(v25, "setHeight:", a1[1]);
  v66 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v67 = (void *)*((_QWORD *)a1 + 20);
  *((_QWORD *)a1 + 20) = v66;

  objc_msgSend(v25, "setPixelFormat:", 25);
  v68 = objc_msgSend(v114, "newTextureWithDescriptor:", v25);
  v69 = (void *)*((_QWORD *)a1 + 21);
  *((_QWORD *)a1 + 21) = v68;

  v70 = objc_msgSend(v114, "newBufferWithLength:options:", 2, 0);
  v71 = (void *)*((_QWORD *)a1 + 31);
  *((_QWORD *)a1 + 31) = v70;

  v72 = objc_msgSend(v114, "newBufferWithLength:options:", 2, 0);
  v73 = (void *)*((_QWORD *)a1 + 32);
  *((_QWORD *)a1 + 32) = v72;

  *(_WORD *)objc_msgSend(objc_retainAutorelease(*((id *)a1 + 31)), "contents") = 15360;
  *(_WORD *)objc_msgSend(objc_retainAutorelease(*((id *)a1 + 32)), "contents") = 15360;
  v74 = objc_msgSend(v114, "newBufferWithLength:options:", 1, 32);
  v75 = (void *)*((_QWORD *)a1 + 33);
  *((_QWORD *)a1 + 33) = v74;

  v76 = objc_msgSend(v114, "newBufferWithLength:options:", 0x2000, 0);
  v77 = (void *)*((_QWORD *)a1 + 34);
  *((_QWORD *)a1 + 34) = v76;

  v78 = (void *)objc_opt_new();
  v79 = v78;
  v80 = a12;
  if (a12)
    v80 = *((_BYTE *)a1 + 58);
  *((_BYTE *)a1 + 56) = v80;
  objc_msgSend(v78, "setConstantValue:type:atIndex:", a1 + 14, 53, 10);
  objc_msgSend(v79, "setConstantValue:type:atIndex:", &v119, 53, 13);
  objc_msgSend(v79, "setConstantValue:type:atIndex:", a1 + 15, 53, 14);
  v118 = 1023826251;
  objc_msgSend(v79, "setConstantValue:type:atIndex:", &v118, 3, 9);
  computeKernel(v21, v114, CFSTR("luma_log_sum"), 0, v79, 0, 1);
  v81 = objc_claimAutoreleasedReturnValue();
  v82 = (void *)*((_QWORD *)a1 + 35);
  *((_QWORD *)a1 + 35) = v81;

  computeKernel(v21, v114, CFSTR("luma_log_sum_to_exposure"), 0, v79, 0, 1);
  v83 = objc_claimAutoreleasedReturnValue();
  v84 = (void *)*((_QWORD *)a1 + 36);
  *((_QWORD *)a1 + 36) = v83;

  computeKernel(v21, v114, CFSTR("exposure_texture_to_buffer"), 0, v79, 0, 1);
  v85 = objc_claimAutoreleasedReturnValue();
  v86 = (void *)*((_QWORD *)a1 + 37);
  *((_QWORD *)a1 + 37) = v85;

  computeKernel(v21, v114, CFSTR("brnetv3_build_tensors_low_resolution"), 0, v79, 0, 1);
  v87 = objc_claimAutoreleasedReturnValue();
  v88 = (void *)*((_QWORD *)a1 + 38);
  *((_QWORD *)a1 + 38) = v87;

  v117 = 0;
  objc_msgSend(v79, "setConstantValue:type:atIndex:", &v117, 53, 12);
  computeKernel(v21, v114, CFSTR("brnetv3_lowres_signals"), 0, v79, 0, 1);
  v89 = objc_claimAutoreleasedReturnValue();
  v90 = (void *)*((_QWORD *)a1 + 41);
  *((_QWORD *)a1 + 41) = v89;

  v117 = 1;
  objc_msgSend(v79, "setConstantValue:type:atIndex:", &v117, 53, 12);
  computeKernel(v21, v114, CFSTR("brnetv3_lowres_signals"), 0, v79, 0, 1);
  v91 = objc_claimAutoreleasedReturnValue();
  v92 = (void *)*((_QWORD *)a1 + 54);
  *((_QWORD *)a1 + 54) = v91;

  computeKernel(v21, v114, CFSTR("brnetv3_warp_history_high_resolution"), 0, v79, 0, 1);
  v93 = objc_claimAutoreleasedReturnValue();
  v94 = (void *)*((_QWORD *)a1 + 40);
  *((_QWORD *)a1 + 40) = v93;

  computeKernel(v21, v114, CFSTR("brnetv3_anisotropic_gaussian_filter"), 0, v79, 0x400uLL, 1);
  v95 = objc_claimAutoreleasedReturnValue();
  v96 = (void *)*((_QWORD *)a1 + 42);
  *((_QWORD *)a1 + 42) = v95;

  v116 = 4;
  objc_msgSend(v79, "setConstantValue:type:atIndex:", &v116, 41, 0);
  computeKernel(v21, v114, CFSTR("brnetv3_output_spatial_lr"), 0, v79, 0, 1);
  v97 = objc_claimAutoreleasedReturnValue();
  v98 = (void *)*((_QWORD *)a1 + 43);
  *((_QWORD *)a1 + 43) = v97;

  computeKernel(v21, v114, CFSTR("brnetv3_output_temporal"), 0, v79, 0, 1);
  v99 = objc_claimAutoreleasedReturnValue();
  v100 = (void *)*((_QWORD *)a1 + 44);
  *((_QWORD *)a1 + 44) = v99;

  v115 = 1;
  objc_msgSend(v79, "setConstantValue:type:atIndex:", &v115, 53, 5);
  computeKernel(v21, v114, CFSTR("brnetv3_flow_splat"), 0, v79, 0, 1);
  v101 = objc_claimAutoreleasedReturnValue();
  v102 = (void *)*((_QWORD *)a1 + 48);
  *((_QWORD *)a1 + 48) = v101;

  v115 = 0;
  objc_msgSend(v79, "setConstantValue:type:atIndex:", &v115, 53, 5);
  computeKernel(v21, v114, CFSTR("brnetv3_flow_splat"), 0, v79, 0, 1);
  v103 = objc_claimAutoreleasedReturnValue();
  v104 = (void *)*((_QWORD *)a1 + 49);
  *((_QWORD *)a1 + 49) = v103;

  computeKernel(v21, v114, CFSTR("brnetv3_flow_splat_texture"), 0, v79, 0, 1);
  v105 = objc_claimAutoreleasedReturnValue();
  v106 = (void *)*((_QWORD *)a1 + 50);
  *((_QWORD *)a1 + 50) = v105;

  computeKernel(v21, v114, CFSTR("brnetv3_flow_diff_texture"), 0, v79, 0, 1);
  v107 = objc_claimAutoreleasedReturnValue();
  v108 = (void *)*((_QWORD *)a1 + 51);
  *((_QWORD *)a1 + 51) = v107;

  computeKernel(v21, v114, CFSTR("brnetv3_flow_splat_init_forward_z"), 0, v79, 0, 1);
  v109 = objc_claimAutoreleasedReturnValue();
  v110 = (void *)*((_QWORD *)a1 + 52);
  *((_QWORD *)a1 + 52) = v109;

  computeKernel(v21, v114, CFSTR("brnetv3_update_sample_statistics"), 0, v79, 0, 1);
  v111 = objc_claimAutoreleasedReturnValue();
  v112 = (void *)*((_QWORD *)a1 + 53);
  *((_QWORD *)a1 + 53) = v111;

  return a1;
}

{
  return BRNet_v3_Filter::BRNet_v3_Filter(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

void sub_234554458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  id *v12;
  void *v13;
  void *v14;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  uint64_t n;
  uint64_t ii;

  for (i = 0; i != -2; --i)
  for (j = 0; j != -2; --j)

  for (k = 0; k != -2; --k)
  for (m = 0; m != -2; --m)

  for (n = 0; n != -2; --n)
  for (ii = 0; ii != -2; --ii)

  _Unwind_Resume(a1);
}

void BRNet_v3_Filter::encodePre(uint32x2_t *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, float32x2_t a9, float32x2_t a10, float a11, double a12, float a13, void *a14, char a15, char a16, char a17, unsigned int a18)
{
  unsigned int v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  __int32 v35;
  int v36;
  __int32 v37;
  int v38;
  float v39;
  uint32x2_t v40;
  __int128 v41;
  uint64_t v42;
  uint32x2_t v43;
  uint32x2_t v44;
  __int128 v45;
  unsigned int v47;
  id v49;
  id v50;
  int64x2_t v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  _WORD v55[2];
  int64x2_t v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  _QWORD v60[2];
  __int32 v61;
  __int16 v62;
  int64x2_t v63;
  uint64_t v64;
  _QWORD v65[3];
  float v66;
  __int128 v67;
  uint64_t v68;
  int64x2_t v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  int64x2_t v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  float v79;
  _BYTE v80[9];

  v28 = a18;
  v49 = a2;
  v29 = a3;
  v30 = a4;
  v31 = a5;
  v32 = a6;
  v33 = a7;
  v50 = a8;
  v34 = a14;
  v80[0] = a15;
  v79 = a13;
  a1[7].i8[1] = 0;
  v35 = a1[1].i32[0];
  v36 = (unsigned __int16)v28 - v35 / 2;
  if (v36 < 0)
    v36 = v35 / 2 - (unsigned __int16)v28;
  if (v36 <= 2)
  {
    v37 = a1[1].i32[1];
    v38 = HIWORD(v28) - v37 / 2;
    if (v38 < 0)
      v38 = v37 / 2 - HIWORD(v28);
    if (v38 <= 2)
      a1[7].i8[1] = 1;
  }
  if (a17)
  {
    objc_msgSend(v29, "setComputePipelineState:", *(_QWORD *)&a1[35]);
    objc_msgSend(v29, "setTexture:atIndex:", v30, 0);
    objc_msgSend(v29, "setBytes:length:atIndex:", &a18, 4, 1);
    objc_msgSend(v29, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[34], 0, 0);
    v77 = xmmword_23455A840;
    v78 = 1;
    v75 = xmmword_23455AA40;
    v76 = 1;
    objc_msgSend(v29, "dispatchThreadgroups:threadsPerThreadgroup:", &v77, &v75);
    objc_msgSend(v29, "setComputePipelineState:", *(_QWORD *)&a1[36]);
    objc_msgSend(v29, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[34], 0, 0);
    LODWORD(v60[0]) = (unsigned __int16)a18 * HIWORD(a18);
    objc_msgSend(v29, "setBytes:length:atIndex:", v60, 4, 1);
    objc_msgSend(v29, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[a1[16].u8[0] + 31], 0, 2);
    objc_msgSend(v29, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[(a1[16].i8[0] == 0) + 31], 0, 3);
    objc_msgSend(v29, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[33], 0, 4);
    objc_msgSend(v29, "setBytes:length:atIndex:", v80, 1, 5);
    v73 = vdupq_n_s64(1uLL);
    v74 = 1;
    v71 = xmmword_23455A850;
    v72 = 1;
    objc_msgSend(v29, "dispatchThreadgroups:threadsPerThreadgroup:", &v73, &v71);
  }
  else
  {
    objc_msgSend(v29, "setComputePipelineState:", *(_QWORD *)&a1[37]);
    objc_msgSend(v29, "setTexture:atIndex:", v50, 0);
    objc_msgSend(v29, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[a1[16].u8[0] + 31], 0, 0);
    objc_msgSend(v29, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[(a1[16].i8[0] == 0) + 31], 0, 1);
    objc_msgSend(v29, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[33], 0, 2);
    objc_msgSend(v29, "setBytes:length:atIndex:", v80, 1, 3);
    v69 = vdupq_n_s64(1uLL);
    v70 = 1;
    v67 = xmmword_23455AA30;
    v68 = 1;
    objc_msgSend(v29, "dispatchThreads:threadsPerThreadgroup:", &v69, &v67);
  }
  objc_msgSend(v29, "setComputePipelineState:", *(_QWORD *)&a1[38], *(_QWORD *)&a12);
  objc_msgSend(v29, "setTexture:atIndex:", v30, 0);
  objc_msgSend(v29, "setTexture:atIndex:", v31, 1);
  objc_msgSend(v29, "setTexture:atIndex:", v32, 2);
  objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[10], 3);
  objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[9], 4);
  v39 = -1.0;
  if (a16)
    v39 = 1.0;
  v66 = v39;
  objc_msgSend(v29, "setBytes:length:atIndex:", &v66, 4, 0);
  objc_msgSend(v29, "setBytes:length:atIndex:", &a18, 4, 1);
  objc_msgSend(v29, "setBytes:length:atIndex:", &v79, 4, 2);
  objc_msgSend(v29, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[a1[16].u8[0] + 31], 0, 3);
  objc_msgSend(v29, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[(a1[16].i8[0] == 0) + 31], 0, 4);
  v65[0] = (unsigned __int16)a18 + 2;
  v65[1] = HIWORD(a18) + 2;
  v65[2] = 1;
  v63 = vdupq_n_s64(8uLL);
  v64 = 1;
  objc_msgSend(v29, "dispatchThreads:threadsPerThreadgroup:", v65, &v63);
  v60[0] = vmul_f32(a9, a10);
  v60[1] = __PAIR64__(v47, LODWORD(a11));
  if (!a1[7].i8[0])
  {
    objc_msgSend(v29, "setComputePipelineState:", *(_QWORD *)&a1[40]);
    objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[10], 0);
    objc_msgSend(v29, "setTexture:atIndex:", v33, 1);
    objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[9], 2);
    objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[11], 3);
    objc_msgSend(v29, "setBytes:length:atIndex:", v60, 24, 0);
    objc_msgSend(v29, "setBytes:length:atIndex:", &a18, 4, 1);
    objc_msgSend(v29, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[a1[16].u8[0] + 31], 0, 2);
    objc_msgSend(v29, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[(a1[16].i8[0] == 0) + 31], 0, 3);
    objc_msgSend(v29, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[33], 0, 4);
    v40 = a1[2];
    *(_QWORD *)&v41 = v40.i32[0];
    *((_QWORD *)&v41 + 1) = v40.i32[1];
    v58 = v41;
    v59 = 1;
    v56 = vdupq_n_s64(8uLL);
    v57 = 1;
    objc_msgSend(v29, "dispatchThreads:threadsPerThreadgroup:", &v58, &v56);
  }
  v42 = 54;
  if (!a1[7].i8[1])
    v42 = 41;
  objc_msgSend(v29, "setComputePipelineState:", *(_QWORD *)&a1[v42]);
  objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[10], 0);
  objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[11], 1);
  objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[9], 2);
  objc_msgSend(v29, "setTexture:atIndex:", v33, 3);
  objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[a1[16].u8[0] + 12], 4);
  objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[a1[16].u8[0] + 14], 5);
  objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[(a1[16].i8[0] == 0) + 12], 6);
  objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[(a1[16].i8[0] == 0) + 14], 7);
  objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[17], 8);
  objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[22], 9);
  objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[a1[16].u8[0] + 23], 12);
  objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[a1[16].u8[0] + 25], 13);
  objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[a1[16].u8[0] + 27], 14);
  objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[29], 15);
  objc_msgSend(v29, "setTexture:atIndex:", *(_QWORD *)&a1[30], 16);
  objc_msgSend(v29, "setBytes:length:atIndex:", &a18, 4, 1);
  v62 = a1[3].i32[1];
  v61 = a1[5].i32[1];
  objc_msgSend(v29, "setBytes:length:atIndex:", v60, 24, 0);
  objc_msgSend(v29, "setBuffer:offset:atIndex:", v34, 0, 2);
  objc_msgSend(v29, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[a1[16].u8[0] + 31], 0, 3);
  objc_msgSend(v29, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[(a1[16].i8[0] == 0) + 31], 0, 4);
  objc_msgSend(v29, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[33], 0, 5);
  objc_msgSend(v29, "setThreadgroupMemoryLength:atIndex:", 0x1000uLL / objc_msgSend(*(id *)&a1[41], "threadExecutionWidth"), 0);
  v43 = vshr_n_u32(vsra_n_u32(a1[1], a1[1], 0x1FuLL), 1uLL);
  v55[1] = v43.i16[2];
  v55[0] = v43.i16[0];
  objc_msgSend(v29, "setBytes:length:atIndex:", v55, 4, 6);
  v44 = a1[3];
  *(_QWORD *)&v45 = v44.i32[0];
  *((_QWORD *)&v45 + 1) = v44.i32[1];
  v53 = v45;
  v54 = 1;
  v51 = vdupq_n_s64(8uLL);
  v52 = 1;
  objc_msgSend(v29, "dispatchThreads:threadsPerThreadgroup:", &v53, &v51);

}

void sub_234554EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void BRNet_v3_Filter::encodeMid(int *a1, void *a2, void *a3, void *a4, void *a5, char a6, unsigned int a7, float32x2_t a8, float32x2_t a9, float a10, double a11, double a12)
{
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  __int128 v26;
  int v27;
  uint64_t v28;
  __int128 v29;
  unsigned int v31;
  int64x2_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  _QWORD v37[3];
  int64x2_t v38;
  uint64_t v39;
  _QWORD v40[3];
  float32x2_t v41;
  int64x2_t v42;
  uint64_t v43;
  _QWORD v44[3];
  int64x2_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  int64x2_t v49;
  uint64_t v50;
  _QWORD v51[3];
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  int64x2_t v55;
  double v56;
  unsigned int v57;
  float32x2_t v58;

  v21 = a2;
  v22 = a3;
  v23 = a4;
  v24 = a5;
  v58 = a8;
  v57 = a7;
  v56 = a12;
  if ((a6 & 1) != 0)
  {
    v25 = a1 + 96;
  }
  else
  {
    objc_msgSend(v22, "setComputePipelineState:", *((_QWORD *)a1 + 52));
    objc_msgSend(v22, "setBuffer:offset:atIndex:", *((_QWORD *)a1 + 19), 0, 0);
    v54 = a1[1] * (uint64_t)*a1;
    v55 = vdupq_n_s64(1uLL);
    v52 = xmmword_23455AA10;
    v53 = 1;
    objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", &v54, &v52);
    v25 = a1 + 98;
  }
  objc_msgSend(v22, "setComputePipelineState:", *v25, *(_QWORD *)&a11);
  objc_msgSend(v22, "setTexture:atIndex:", *((_QWORD *)a1 + 9), 0);
  objc_msgSend(v22, "setTexture:atIndex:", v24, 1);
  objc_msgSend(v22, "setBuffer:offset:atIndex:", *((_QWORD *)a1 + 19), 0, 0);
  objc_msgSend(v22, "setBytes:length:atIndex:", &v58, 8, 1);
  v51[0] = (unsigned __int16)a7;
  v51[1] = HIWORD(a7);
  v51[2] = 1;
  v49 = vdupq_n_s64(8uLL);
  v50 = 1;
  objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v51, &v49);
  objc_msgSend(v22, "setComputePipelineState:", *((_QWORD *)a1 + 50));
  objc_msgSend(v22, "setTexture:atIndex:", *((_QWORD *)a1 + 9), 0);
  objc_msgSend(v22, "setTexture:atIndex:", *((_QWORD *)a1 + 20), 1);
  objc_msgSend(v22, "setBuffer:offset:atIndex:", *((_QWORD *)a1 + 19), 0, 0);
  objc_msgSend(v22, "setBytes:length:atIndex:", &v58, 8, 1);
  *(_QWORD *)&v26 = (int)*(_QWORD *)a1;
  *((_QWORD *)&v26 + 1) = (int)HIDWORD(*(_QWORD *)a1);
  v47 = v26;
  v48 = 1;
  v45 = vdupq_n_s64(8uLL);
  v46 = 1;
  objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", &v47, &v45);
  objc_msgSend(v22, "setComputePipelineState:", *((_QWORD *)a1 + 51));
  objc_msgSend(v22, "setTexture:atIndex:", *((_QWORD *)a1 + 9), 0);
  objc_msgSend(v22, "setTexture:atIndex:", *((_QWORD *)a1 + 20), 1);
  objc_msgSend(v22, "setTexture:atIndex:", *((_QWORD *)a1 + 21), 2);
  objc_msgSend(v22, "setBytes:length:atIndex:", &v58, 8, 0);
  v44[0] = (unsigned __int16)a7;
  v44[1] = HIWORD(a7);
  v44[2] = 1;
  v42 = vdupq_n_s64(8uLL);
  v43 = 1;
  objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v44, &v42);
  objc_msgSend(v22, "setComputePipelineState:", *((_QWORD *)a1 + 53));
  objc_msgSend(v22, "setTexture:atIndex:", *((_QWORD *)a1 + 9), 0);
  objc_msgSend(v22, "setTexture:atIndex:", *((_QWORD *)a1 + 21), 1);
  objc_msgSend(v22, "setTexture:atIndex:", *(_QWORD *)&a1[2 * *((unsigned __int8 *)a1 + 128) + 46], 2);
  objc_msgSend(v22, "setTexture:atIndex:", *(_QWORD *)&a1[2 * *((unsigned __int8 *)a1 + 128) + 50], 3);
  objc_msgSend(v22, "setTexture:atIndex:", *(_QWORD *)&a1[2 * (*((_BYTE *)a1 + 128) == 0) + 46], 4);
  objc_msgSend(v22, "setTexture:atIndex:", *(_QWORD *)&a1[2 * (*((_BYTE *)a1 + 128) == 0) + 50], 5);
  objc_msgSend(v22, "setTexture:atIndex:", *(_QWORD *)&a1[2 * *((unsigned __int8 *)a1 + 128) + 54], 6);
  objc_msgSend(v22, "setTexture:atIndex:", *(_QWORD *)&a1[2 * (*((_BYTE *)a1 + 128) == 0) + 54], 8);
  objc_msgSend(v22, "setTexture:atIndex:", *((_QWORD *)a1 + 10), 10);
  v41 = vmul_f32(v58, a9);
  objc_msgSend(v22, "setBytes:length:atIndex:", &v41, 8, 0);
  objc_msgSend(v22, "setBytes:length:atIndex:", &v57, 4, 1);
  objc_msgSend(v22, "setBytes:length:atIndex:", &v56, 8, 2);
  v27 = a1[3];
  v40[0] = (uint64_t)(a1[2] + (a1[2] < 0)) >> 1;
  v40[1] = (uint64_t)(v27 + (v27 < 0)) >> 1;
  v40[2] = 1;
  v38 = vdupq_n_s64(8uLL);
  v39 = 1;
  objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v40, &v38);
  if (*((_BYTE *)a1 + 56))
  {
    v37[0] = vmul_f32(v58, a9);
    v37[1] = __PAIR64__(v31, LODWORD(a10));
    objc_msgSend(v22, "setComputePipelineState:", *((_QWORD *)a1 + 40));
    objc_msgSend(v22, "setTexture:atIndex:", *((_QWORD *)a1 + 10), 0);
    objc_msgSend(v22, "setTexture:atIndex:", v23, 1);
    objc_msgSend(v22, "setTexture:atIndex:", *((_QWORD *)a1 + 9), 2);
    objc_msgSend(v22, "setTexture:atIndex:", *((_QWORD *)a1 + 11), 3);
    objc_msgSend(v22, "setBytes:length:atIndex:", v37, 24, 0);
    objc_msgSend(v22, "setBytes:length:atIndex:", &v57, 4, 1);
    objc_msgSend(v22, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[2 * *((unsigned __int8 *)a1 + 128) + 62], 0, 2);
    objc_msgSend(v22, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[2 * (*((_BYTE *)a1 + 128) == 0) + 62], 0, 3);
    objc_msgSend(v22, "setBuffer:offset:atIndex:", *((_QWORD *)a1 + 33), 0, 4);
    v28 = *((_QWORD *)a1 + 2);
    *(_QWORD *)&v29 = (int)v28;
    *((_QWORD *)&v29 + 1) = SHIDWORD(v28);
    v35 = v29;
    v36 = 1;
    v33 = vdupq_n_s64(8uLL);
    v34 = 1;
    objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", &v35, &v33);
  }

}

void sub_234555414(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void BRNet_v3_Filter::encodePost(int32x2_t *a1, float32x2_t a2, float32x2_t a3, float a4, double a5, float a6, uint64_t a7, void *a8, void *a9, void *a10, void *a11, void *a12, void *a13, int a14, unsigned __int16 a15, unsigned __int16 a16)
{
  uint32x2_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int32x2_t v36;
  __int128 v37;
  uint32x2_t v40;
  int64x2_t v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  unint64_t v45;
  int64x2_t v46;
  uint64_t v47;
  _QWORD v48[3];
  int64x2_t v49;
  uint64_t v50;
  _QWORD v51[3];
  __int32 v52;
  __int16 v53;
  float32x2_t v54;
  float v55;
  float32x2_t v56;

  v25.i32[0] = a15;
  v25.i32[1] = a16;
  v40 = v25;
  v26 = a8;
  v27 = a9;
  v28 = a10;
  v29 = a11;
  v30 = a12;
  v31 = a13;
  v56 = a2;
  v55 = a6;
  v54 = vdiv_f32(vcvt_f32_u32(v40), vcvt_f32_s32(a1[2]));
  v53 = a1[4].i32[1];
  v52 = a1[6].i32[0];
  objc_msgSend(v26, "setComputePipelineState:", *(_QWORD *)&a1[43]);
  objc_msgSend(v26, "setBuffer:offset:atIndex:", v27, 0, 0);
  objc_msgSend(v26, "setTexture:atIndex:", *(_QWORD *)&a1[18], 0);
  objc_msgSend(v26, "setBytes:length:atIndex:", &v52, 8, 1);
  v32 = objc_msgSend(*(id *)&a1[18], "width");
  v33 = objc_msgSend(*(id *)&a1[18], "height");
  v51[0] = v32;
  v51[1] = v33;
  v51[2] = 1;
  v49 = vdupq_n_s64(8uLL);
  v50 = 1;
  objc_msgSend(v26, "dispatchThreads:threadsPerThreadgroup:", v51, &v49);
  objc_msgSend(v26, "setComputePipelineState:", *(_QWORD *)&a1[44]);
  objc_msgSend(v26, "setTexture:atIndex:", *(_QWORD *)&a1[17], 0);
  objc_msgSend(v26, "setBuffer:offset:atIndex:", v27, 0, 0);
  objc_msgSend(v26, "setBytes:length:atIndex:", &v52, 8, 1);
  v34 = objc_msgSend(*(id *)&a1[17], "width");
  v35 = objc_msgSend(*(id *)&a1[17], "height");
  v48[0] = v34;
  v48[1] = v35;
  v48[2] = 1;
  v46 = vdupq_n_s64(8uLL);
  v47 = 1;
  objc_msgSend(v26, "dispatchThreads:threadsPerThreadgroup:", v48, &v46);
  objc_msgSend(v26, "setComputePipelineState:", *(_QWORD *)&a1[42]);
  objc_msgSend(v26, "setTexture:atIndex:", *(_QWORD *)&a1[10], 0);
  objc_msgSend(v26, "setTexture:atIndex:", *(_QWORD *)&a1[11], 1);
  objc_msgSend(v26, "setTexture:atIndex:", v28, 3);
  objc_msgSend(v26, "setTexture:atIndex:", v31, 4);
  objc_msgSend(v26, "setTexture:atIndex:", *(_QWORD *)&a1[21], 5);
  objc_msgSend(v26, "setTexture:atIndex:", *(_QWORD *)&a1[22], 6);
  objc_msgSend(v26, "setTexture:atIndex:", *(_QWORD *)&a1[9], 7);
  objc_msgSend(v26, "setTexture:atIndex:", *(_QWORD *)&a1[18], 11);
  objc_msgSend(v26, "setTexture:atIndex:", *(_QWORD *)&a1[17], 12);
  objc_msgSend(v26, "setTexture:atIndex:", *(_QWORD *)&a1[29], 13);
  objc_msgSend(v26, "setTexture:atIndex:", *(_QWORD *)&a1[30], 14);
  objc_msgSend(v26, "setTexture:atIndex:", *(_QWORD *)&a1[(a1[16].i8[0] == 0) + 23], 15);
  objc_msgSend(v26, "setTexture:atIndex:", *(_QWORD *)&a1[(a1[16].i8[0] == 0) + 25], 16);
  if (a1[7].i8[4])
  {
    v45 = (unint64_t)vmul_f32(a2, a3);
    objc_msgSend(v26, "setBytes:length:atIndex:", &v45, 8, 6);
    objc_msgSend(v26, "setTexture:atIndex:", v29, 17);
    objc_msgSend(v26, "setTexture:atIndex:", v30, 18);
  }
  v45 = __PAIR64__(LODWORD(a5), LODWORD(a4));
  objc_msgSend(v26, "setBytes:length:atIndex:", &v45, 8, 0, *(_QWORD *)&a5);
  objc_msgSend(v26, "setBytes:length:atIndex:", &v54, 8, 1);
  objc_msgSend(v26, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[33], 0, 2);
  objc_msgSend(v26, "setBytes:length:atIndex:", &v55, 4, 3);
  objc_msgSend(v26, "setBuffer:offset:atIndex:", *(_QWORD *)&a1[a1[16].u8[0] + 31], 0, 4);
  objc_msgSend(v26, "setBytes:length:atIndex:", &v56, 8, 5);
  v36 = a1[2];
  *(_QWORD *)&v37 = v36.i32[0];
  *((_QWORD *)&v37 + 1) = v36.i32[1];
  v43 = v37;
  v44 = 1;
  v41 = vdupq_n_s64(0x20uLL);
  v42 = 1;
  objc_msgSend(v26, "dispatchThreads:threadsPerThreadgroup:", &v43, &v41);
  a1[16].i8[0] = a1[16].i8[0] == 0;

}

void sub_234555858(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBAC8](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x24BDBBAD8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x24BDDD388]();
}

uint64_t MTLReportFailure()
{
  return MEMORY[0x24BDDD3F0]();
}

uint64_t MTLReportFailureTypeEnabled()
{
  return MEMORY[0x24BDDD3F8]();
}

uint64_t MTLTraceEnabled()
{
  return MEMORY[0x24BDDD458]();
}

uint64_t MTLTraceEnabledSPI()
{
  return MEMORY[0x24BDDD460]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete()
{
  return off_2505A0270();
}

uint64_t operator new()
{
  return off_2505A0278();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x24BDAFD10](__name, __value, *(_QWORD *)&__overwrite);
}

void srand(unsigned int a1)
{
  MEMORY[0x24BDAFE80](*(_QWORD *)&a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

