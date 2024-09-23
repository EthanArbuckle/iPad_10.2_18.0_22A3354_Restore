@implementation CIGenericMetalProcessor

+ (BOOL)skipFormatChecks
{
  return 1;
}

+ (id)applyWithExtent:(CGRect)a3 shader:(id)a4 inputs:(id)a5 roiMethods:(id)a6 insetRects:(id)a7 scaleFactors:(id)a8 arguments:(id)a9 error:(id *)a10
{
  double height;
  double width;
  double y;
  double x;
  void *v19;

  if (!a4)
    return +[CIImage emptyImage](CIImage, "emptyImage", 0, a5, a6, a7, a8, a9, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a9);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", a4, CFSTR("_shader"));
  if (a6)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", a6, CFSTR("_roiMethods"));
  if (a7)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", a7, CFSTR("_insetRects"));
  if (a8)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", a8, CFSTR("_scaleFactors"));
  return (id)objc_msgSend((id)objc_opt_class(), "applyWithExtent:inputs:arguments:error:", a5, v19, a10, x, y, width, height);
}

+ (id)applyWithExtent:(CGRect)a3 shader:(id)a4 inputs:(id)a5 insetRects:(id)a6 arguments:(id)a7 error:(id *)a8
{
  double height;
  double width;
  double y;
  double x;
  void *v16;

  if (!a4)
    return +[CIImage emptyImage](CIImage, "emptyImage", 0, a5, a6, a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a7);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", a4, CFSTR("_shader"));
  if (a6)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", a6, CFSTR("_insetRects"));
  return (id)objc_msgSend((id)objc_opt_class(), "applyWithExtent:inputs:arguments:error:", a5, v16, a8, x, y, width, height);
}

+ (id)applyWithExtent:(CGRect)a3 shader:(id)a4 inputs:(id)a5 scaleFactors:(id)a6 arguments:(id)a7 error:(id *)a8
{
  double height;
  double width;
  double y;
  double x;
  void *v16;

  if (!a4)
    return +[CIImage emptyImage](CIImage, "emptyImage", 0, a5, a6, a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a7);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", a4, CFSTR("_shader"));
  if (a6)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", a6, CFSTR("_scaleFactors"));
  return (id)objc_msgSend((id)objc_opt_class(), "applyWithExtent:inputs:arguments:error:", a5, v16, a8, x, y, width, height);
}

+ (id)applyWithExtent:(CGRect)a3 shader:(id)a4 inputs:(id)a5 arguments:(id)a6 error:(id *)a7
{
  double height;
  double width;
  double y;
  double x;
  void *v14;

  if (!a4)
    return +[CIImage emptyImage](CIImage, "emptyImage", 0, a5, a6, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a6);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", a4, CFSTR("_shader"));
  return (id)objc_msgSend((id)objc_opt_class(), "applyWithExtent:inputs:arguments:error:", a5, v14, a7, x, y, width, height);
}

+ (id)applyWithExtent:(CGRect)a3 shader:(id)a4 inputs:(id)a5 className:(id)a6 arguments:(id)a7 error:(id *)a8
{
  double height;
  double width;
  double y;
  double x;
  void *v16;

  if (!a4)
    return +[CIImage emptyImage](CIImage, "emptyImage", 0, a5, a6, a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a7);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", a4, CFSTR("_shader"));
  if (a6)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", a6, CFSTR("_class"));
  return (id)objc_msgSend((id)objc_opt_class(), "applyWithExtent:inputs:arguments:error:", a5, v16, a8, x, y, width, height);
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  unint64_t v6;
  unint64_t v7;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  unsigned int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  char v33;
  uint64_t v34;
  size_t v35;
  float *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  float *v42;
  double v43;
  double v44;
  double v45;
  float v46;
  double v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  int v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t i;
  double v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void **v73;
  unint64_t v75;
  void *v76;
  void **v77;
  unsigned int v78;
  id v79;
  void *v80;
  unsigned int v81;
  id obj;
  id v84[3];
  id v85[3];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v10 = (void *)objc_msgSend(a5, "metalCommandBuffer");
  v11 = (void *)objc_msgSend(v10, "device");
  v79 = a4;
  v12 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("_shader"));
  if (!v12)
  {
    NSLog(CFSTR("shader name not specified."));
    return 0;
  }
  v13 = v12;
  if (processWithInputs_arguments_output_error__onceToken != -1)
    dispatch_once(&processWithInputs_arguments_output_error__onceToken, &__block_literal_global_35);
  v14 = (void *)processWithInputs_arguments_output_error__shaderDict;
  objc_sync_enter((id)processWithInputs_arguments_output_error__shaderDict);
  v15 = (void *)objc_msgSend((id)processWithInputs_arguments_output_error__shaderDict, "objectForKey:", v13);
  obj = (id)objc_msgSend((id)processWithInputs_arguments_output_error__reflectionDict, "objectForKey:", v13);
  objc_sync_exit(v14);
  if (!v15)
  {
    v85[0] = 0;
    if (!v11)
    {
      v15 = 0;
      goto LABEL_5;
    }
    v66 = (void *)objc_msgSend(v11, "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), 0);
    v67 = (void *)objc_msgSend(v66, "newFunctionWithName:", v13);
    v84[0] = 0;
    v15 = (void *)objc_msgSend((id)objc_msgSend(v66, "device"), "newComputePipelineStateWithFunction:options:reflection:error:", v67, 3, v84, v85);

    if (!v85[0] && v84[0] && v15)
    {
      v68 = (void *)processWithInputs_arguments_output_error__shaderDict;
      objc_sync_enter((id)processWithInputs_arguments_output_error__shaderDict);
      objc_msgSend((id)processWithInputs_arguments_output_error__shaderDict, "setObject:forKeyedSubscript:", v15, v13);

      objc_sync_exit(v68);
      v69 = (void *)processWithInputs_arguments_output_error__reflectionDict;
      objc_sync_enter((id)processWithInputs_arguments_output_error__reflectionDict);
      if (v84[0])
      {
        v70 = objc_msgSend(v84[0], "arguments");
        objc_msgSend((id)processWithInputs_arguments_output_error__reflectionDict, "setObject:forKeyedSubscript:", v70, v13);
        obj = (id)objc_msgSend(v84[0], "arguments");
      }
      objc_sync_exit(v69);

      goto LABEL_5;
    }
    v71 = objc_msgSend(v85[0], "localizedDescription");
    NSLog(CFSTR("Failed to initialize %@: %@; %@"), v13, v71, objc_msgSend(v85[0], "localizedFailureReason"));
    if (v15)

    return 0;
  }
LABEL_5:
  v16 = 0;
  if (v15 && obj)
  {
    v80 = (void *)objc_msgSend(v10, "computeCommandEncoder");
    objc_msgSend(v80, "setComputePipelineState:", v15);
    v90 = 0;
    v17 = objc_msgSend(v15, "maxTotalThreadsPerThreadgroup");
    v18 = objc_msgSend(v15, "threadExecutionWidth");
    objc_msgSend(a5, "region");
    v20 = v19;
    objc_msgSend(a5, "region");
    mtlutl_ComputeThreadGroupParameters(v17, v18, (_DWORD *)&v90 + 1, &v90, v20, v21);
    v76 = (void *)HIDWORD(v90);
    v75 = v90;
    objc_msgSend(a5, "region");
    v23 = v22;
    LODWORD(v6) = HIDWORD(v90);
    objc_msgSend(a5, "region");
    v25 = v24;
    LODWORD(v7) = v90;
    v77 = (void **)malloc_type_calloc(8uLL, objc_msgSend(obj, "count") + 1, 0xE9557640uLL);
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
    if (v26)
    {
      v78 = 0;
      v81 = 0;
      v27 = *(_QWORD *)v87;
      while (1)
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v87 != v27)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v28);
          v30 = objc_msgSend(v29, "type");
          if (v30 == 2)
          {
            if (objc_msgSend(v29, "access"))
            {
              v48 = objc_msgSend(v29, "access");
              v49 = a5;
              if (v48 != 2)
              {
                NSLog(CFSTR("read write texture unexpected."));
LABEL_62:
                v16 = 0;
                goto LABEL_63;
              }
            }
            else
            {
              v49 = (id)objc_msgSend(a3, "objectAtIndexedSubscript:", v78++);
            }
            v53 = objc_msgSend(v49, "metalTexture");
            v54 = objc_msgSend(v29, "index");
            if (!v53)
            {
              NSLog(CFSTR("Couldn't find texture at index %lu with name %@"), v54, objc_msgSend(v29, "name"));
              goto LABEL_62;
            }
            objc_msgSend(v80, "setTexture:atIndex:", v53, v54);
          }
          else
          {
            if (v30)
              goto LABEL_40;
            v31 = objc_msgSend(v79, "objectForKeyedSubscript:", objc_msgSend(v29, "name"));
            v32 = objc_msgSend((id)objc_msgSend(v29, "name"), "isEqualToString:", CFSTR("_regions"));
            if (v31)
              v33 = 1;
            else
              v33 = v32;
            if ((v33 & 1) == 0)
            {
              NSLog(CFSTR("couldn't find data for %@"), objc_msgSend(v29, "name"));
              goto LABEL_62;
            }
            if (v32)
            {
              v34 = objc_msgSend(a3, "count");
              v35 = 16 * (v34 + 1);
              v36 = (float *)malloc_type_malloc(v35, 0x15448152uLL);
              v77[v81] = v36;
              objc_msgSend(a5, "region");
              ++v81;
              *(float *)&v37 = v37;
              *(float *)&v38 = v38;
              *v36 = *(float *)&v37;
              v36[1] = *(float *)&v38;
              *(float *)&v37 = v39;
              *(float *)&v38 = v40;
              v36[2] = *(float *)&v37;
              v36[3] = *(float *)&v38;
              if ((unint64_t)(v34 + 1) >= 2)
              {
                v41 = 0;
                v42 = v36 + 7;
                do
                {
                  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v41), "region");
                  *(float *)&v43 = v43;
                  *(float *)&v44 = v44;
                  *(v42 - 3) = *(float *)&v43;
                  *(v42 - 2) = *(float *)&v44;
                  v46 = v45;
                  *(float *)&v43 = v47;
                  *(v42 - 1) = v46;
                  *v42 = *(float *)&v43;
                  ++v41;
                  v42 += 4;
                }
                while (v34 != v41);
              }
            }
            else
            {
              v50 = objc_opt_self();
              v51 = (void *)unarchiveObjectOfClass(v50, v31);
              v52 = v51;
              if (v51)
              {
                v36 = (float *)objc_msgSend(v51, "bytes");
                v35 = objc_msgSend(v52, "length");
              }
              else
              {
                v55 = objc_opt_self();
                v56 = (void *)unarchiveObjectOfClass(v55, v31);
                if (v56)
                {
                  objc_msgSend(v56, "floatValue");
                  v58 = v57;
                  v36 = (float *)malloc_type_malloc(4uLL, 0xE9EF513DuLL);
                  *(_DWORD *)v36 = v58;
                  v77[v81++] = v36;
                  v35 = 4;
                }
                else
                {
                  v59 = objc_opt_self();
                  v60 = (void *)unarchiveObjectOfClass(v59, v31);
                  v61 = v60;
                  if (!v60)
                  {
                    NSLog(CFSTR("don't know how to decode value for %@"), objc_msgSend(v29, "name"));
                    goto LABEL_62;
                  }
                  v62 = objc_msgSend(v60, "count");
                  v35 = 4 * v62;
                  v36 = (float *)malloc_type_malloc(4 * v62, 0xCEE2BF77uLL);
                  v77[v81] = v36;
                  if (!v62)
                  {
                    ++v81;
                    goto LABEL_40;
                  }
                  ++v81;
                  for (i = 0; i != v62; ++i)
                  {
                    objc_msgSend(v61, "valueAtIndex:", i);
                    *(float *)&v64 = v64;
                    v36[i] = *(float *)&v64;
                  }
                }
              }
            }
            if (v35 && v36)
              objc_msgSend(v80, "setBytes:length:atIndex:", v36, v35, objc_msgSend(v29, "index"));
          }
LABEL_40:
          ++v28;
        }
        while (v28 != v26);
        v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
        v26 = v65;
        if (!v65)
          goto LABEL_55;
      }
    }
    v81 = 0;
LABEL_55:
    v85[0] = (id)(v23 / (double)v6);
    v85[1] = (id)(v25 / (double)v7);
    v85[2] = (id)1;
    v84[0] = v76;
    v84[1] = (id)v75;
    v84[2] = (id)1;
    objc_msgSend(v80, "dispatchThreadgroups:threadsPerThreadgroup:", v85, v84);
    objc_msgSend(v80, "endEncoding");
    v16 = 1;
LABEL_63:
    if (v77)
    {
      if (v81)
      {
        v72 = v81;
        v73 = v77;
        do
        {
          if (*v73)
            free(*v73);
          ++v73;
          --v72;
        }
        while (v72);
      }
      free(v77);
    }
  }
  return v16;
}

id __68__CIGenericMetalProcessor_processWithInputs_arguments_output_error___block_invoke()
{
  id result;

  processWithInputs_arguments_output_error__shaderDict = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  result = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  processWithInputs_arguments_output_error__reflectionDict = (uint64_t)result;
  return result;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  NSString *v34;
  id v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  _BOOL4 v43;
  double v44;
  double v45;
  double v46;
  double v47;
  int v48;
  double v49;
  double height;
  double width;
  double y;
  double x;
  double rect;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect result;
  CGRect v59;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v6 = *(_QWORD *)&a3;
  v7 = *MEMORY[0x1E0C9D628];
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v11 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("_roiMethods"));
  v12 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("_insetRects"));
  v13 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("_scaleFactors"));
  v14 = v10;
  v15 = v9;
  v16 = v8;
  rect = v7;
  if (!v11
    || (v17 = objc_opt_self(),
        v18 = (void *)objc_msgSend((id)unarchiveObjectOfClassAllowCommon(v17, v11), "objectAtIndexedSubscript:", (int)v6), v14 = v10, v15 = v9, v16 = v8, rect = v7, (objc_msgSend(v18, "isEqualToString:", CFSTR("halfInput")) & 1) != 0))
  {
LABEL_8:
    if (!v13)
      goto LABEL_11;
    goto LABEL_9;
  }
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("halfOutput")))
  {
    rect = x * 0.5;
    v16 = y * 0.5;
    v15 = width * 0.5;
    v14 = height * 0.5;
    if (!v13)
      goto LABEL_11;
    goto LABEL_9;
  }
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("doubleOutput")))
  {
    rect = x + x;
    v16 = y + y;
    v15 = width + width;
    v14 = height + height;
    goto LABEL_8;
  }
  v48 = objc_msgSend(v18, "isEqualToString:", CFSTR("identity"));
  if (v48)
    v14 = height;
  else
    v14 = v10;
  if (v48)
    v15 = width;
  else
    v15 = v9;
  if (v48)
    v16 = y;
  else
    v16 = v8;
  v49 = x;
  if (!v48)
    v49 = v7;
  rect = v49;
  if (v13)
  {
LABEL_9:
    v19 = objc_opt_self();
    v20 = (void *)objc_msgSend((id)unarchiveObjectOfClassAllowCommon(v19, v13), "objectAtIndexedSubscript:", (int)v6);
    if (v20)
    {
      v21 = v20;
      objc_msgSend(v20, "X");
      rect = x * v22;
      objc_msgSend(v21, "Y");
      v16 = y * v23;
      objc_msgSend(v21, "X");
      v15 = width * v24;
      objc_msgSend(v21, "Y");
      v14 = height * v25;
    }
  }
LABEL_11:
  if (v12)
  {
    v26 = objc_opt_self();
    v27 = (void *)objc_msgSend((id)unarchiveObjectOfClassAllowCommon(v26, v12), "objectAtIndexedSubscript:", (int)v6);
    objc_msgSend(v27, "X");
    v28 = v15;
    v29 = v16;
    v31 = v30;
    objc_msgSend(v27, "Y");
    v33 = v32;
    v55.origin.x = rect;
    v55.origin.y = v29;
    v55.size.width = v28;
    v55.size.height = v14;
    v56 = CGRectInset(v55, v31, v33);
    rect = v56.origin.x;
    v16 = v56.origin.y;
    v15 = v56.size.width;
    v14 = v56.size.height;
  }
  v34 = (NSString *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("_class"));
  if (v34 && (v35 = objc_alloc_init(NSClassFromString(v34))) != 0)
  {
    v36 = v35;
    NSSelectorFromString(CFSTR("roiForInput:arguments:outputRect:"));
    objc_opt_class();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "roiForInput:arguments:outputRect:", v6, a4, x, y, width, height);
      rect = v37;
      v16 = v38;
      v15 = v39;
      v14 = v40;
    }
    v41 = v15;
    v42 = v16;

  }
  else
  {
    v41 = v15;
    v42 = v16;
  }
  v57.origin.x = rect;
  v57.origin.y = v42;
  v57.size.width = v41;
  v57.size.height = v14;
  v59.origin.x = v7;
  v59.origin.y = v8;
  v59.size.width = v9;
  v59.size.height = v10;
  v43 = CGRectEqualToRect(v57, v59);
  if (v43)
    v44 = height;
  else
    v44 = v14;
  if (v43)
    v45 = width;
  else
    v45 = v41;
  if (v43)
    v46 = y;
  else
    v46 = v42;
  v47 = x;
  if (!v43)
    v47 = rect;
  result.size.height = v44;
  result.size.width = v45;
  result.origin.y = v46;
  result.origin.x = v47;
  return result;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 0;
}

+ (BOOL)outputIsOpaque
{
  return 0;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (id)applyWithExtent:(CGRect)a3 inputs:(id)a4 arguments:(id)a5 error:(id *)a6
{
  double height;
  double width;
  double y;
  double x;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v28 = *MEMORY[0x1E0C80C00];
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a5, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(a5);
        v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = objc_msgSend(a5, "objectForKey:", v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = archivedDataWithRootObject(v19);
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v18);
      }
      v15 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }
  v22.receiver = a1;
  v22.super_class = (Class)&OBJC_METACLASS___CIGenericMetalProcessor;
  return objc_msgSendSuper2(&v22, sel_applyWithExtent_inputs_arguments_error_, a4, v13, a6, x, y, width, height);
}

@end
