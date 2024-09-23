@implementation _NSJSONReader

+ (BOOL)validForJSON:(id)a3 depth:(unint64_t)a4 allowFragments:(BOOL)a5
{
  BOOL v5;
  _BOOL4 v6;
  BOOL v10;
  int v11;
  float v12;
  double v13;
  _QWORD v14[6];
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a4 > 0x1FF)
    return 0;
  v6 = a5;
  if (_NSIsNSDictionary())
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 1;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51___NSJSONReader_validForJSON_depth_allowFragments___block_invoke;
    v15[3] = &unk_1E0F51D70;
    v15[4] = &v16;
    v15[5] = a4;
    objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v15);
LABEL_7:
    v5 = *((_BYTE *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
    return v5;
  }
  if (_NSIsNSArray())
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 1;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51___NSJSONReader_validForJSON_depth_allowFragments___block_invoke_2;
    v14[3] = &unk_1E0F51D98;
    v14[4] = &v16;
    v14[5] = a4;
    objc_msgSend(a3, "enumerateObjectsUsingBlock:", v14);
    goto LABEL_7;
  }
  if (!v6)
    return 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  if (_NSIsNSString())
  {
    v10 = objc_msgSend(a3, "dataUsingEncoding:allowLossyConversion:", 4, 0) == 0;
    return !v10;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (_NSIsNSNumber())
    {
      v11 = *(char *)objc_msgSend(a3, "objCType");
      if (v11 == 100)
      {
        objc_msgSend(a3, "doubleValue");
        objc_msgSend(a3, "doubleValue");
        if (fabs(v13) != INFINITY)
          return 1;
      }
      else
      {
        if (v11 != 102)
          return 1;
        objc_msgSend(a3, "floatValue");
        objc_msgSend(a3, "floatValue");
        if (fabsf(v12) != INFINITY)
          return 1;
      }
    }
    return 0;
  }
  v16 = 0;
  v17 = 0;
  LODWORD(v18) = 0;
  if (!a3)
    return 1;
  objc_msgSend(a3, "decimalValue");
  v10 = (v16 & 0x1F00) == 4096;
  return !v10;
}

- (id)parseData:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7;
  unsigned __int8 *v9;
  unint64_t v10;
  int v11;
  void *v12;
  const __CFString **v13;
  const __CFString **v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  int v19;
  id result;
  int v21;
  NSString *v22;
  uint64_t v23;
  NSError *v24;
  NSString *v25;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  objc_class *v29;
  Class isa;
  Class v31;
  BOOL v32;
  int64_t v33;
  int64_t v34;
  NSString *v35;
  NSString *v36;
  NSNumber *v37;
  id v38;
  uint64_t i;
  Class v40;
  objc_class *v41;
  Class v42;
  int64_t v43;
  int64_t v44;
  NSString *v45;
  NSNumber *v46;
  int v47;
  Class v48;
  int64_t v49;
  int64_t v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  NSString *v57;
  NSNumber *v58;
  uint64_t v59;

  v7 = a3;
  v59 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "length"))
  {
    if ((a4 & 0x10) != 0)
    {
      if ((a4 & 1) != 0)
        v18 = (objc_class *)MEMORY[0x1E0C99E08];
      else
        v18 = (objc_class *)MEMORY[0x1E0C99D80];
      return objc_alloc_init(v18);
    }
    if (!a5)
      return 0;
    v53 = CFSTR("NSDebugDescription");
    v54 = CFSTR("Unable to parse empty data.");
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = &v54;
    v14 = &v53;
    goto LABEL_54;
  }
  if (!self)
  {
    v16 = 0;
    v17 = 0;
    goto LABEL_49;
  }
  v9 = (unsigned __int8 *)objc_msgSend(v7, "bytes");
  v10 = objc_msgSend(v7, "length");
  if (v10 >= 5)
  {
    v11 = *v9;
    if (v11 == 254)
    {
      v19 = v9[1];
      if (v19 != 255)
        goto LABEL_58;
      if (v9[2] || v9[3] != 255)
      {
        v16 = 2;
        goto LABEL_25;
      }
      v17 = 2617245952;
    }
    else
    {
      if (*v9)
        goto LABEL_15;
      v15 = v9[2];
      if (v9[1])
      {
LABEL_12:
        if (v15)
          goto LABEL_59;
        v16 = 0;
        if (!v9[3])
          goto LABEL_60;
LABEL_25:
        v17 = 2415919360;
LABEL_49:
        v22 = -[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", objc_msgSend(v7, "bytes") + v16, objc_msgSend(v7, "length") - v16, v17);
        if (v22)
        {
          v23 = -[NSString dataUsingEncoding:](v22, "dataUsingEncoding:", 4);
          if (self)
          {
            v7 = (id)v23;
            goto LABEL_59;
          }
          return 0;
        }
        if (!a5)
          return 0;
        v51 = CFSTR("NSDebugDescription");
        v52 = CFSTR("Unable to convert data to a string using the detected encoding. The data may be corrupt.");
        v12 = (void *)MEMORY[0x1E0C99D80];
        v13 = &v52;
        v14 = &v51;
LABEL_54:
        v24 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3840, objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1));
        result = 0;
        *a5 = v24;
        return result;
      }
      if (!v9[2])
      {
LABEL_99:
        v16 = 0;
        if (!v9[3])
          goto LABEL_60;
        v17 = 2550137088;
        goto LABEL_49;
      }
      if (v15 != 254 || v9[3] != 255)
        goto LABEL_59;
      v17 = 2550137088;
    }
    v16 = 4;
    goto LABEL_49;
  }
  if (v10 < 3)
    goto LABEL_59;
  v11 = *v9;
LABEL_15:
  if (v11 == 254)
  {
    if (v9[1] == 255)
    {
      v17 = 2415919360;
      goto LABEL_48;
    }
  }
  else if (v11 == 255 && v9[1] == 254)
  {
    v17 = 2483028224;
LABEL_48:
    v16 = 2;
    goto LABEL_49;
  }
  if (v10 < 4)
    goto LABEL_59;
  if (v11 == 239)
  {
    if (v9[1] == 187)
    {
      v21 = v9[2];
      if (v21 == 191)
        v16 = 3;
      else
        v16 = 0;
      if (v10 < 5 || v21 == 191)
        goto LABEL_60;
    }
    else if (v10 < 5)
    {
      goto LABEL_59;
    }
    goto LABEL_57;
  }
  if (v10 < 5)
    goto LABEL_59;
  if (!v11)
  {
    v15 = v9[2];
    if (!v9[1])
    {
      if (!v9[2])
        goto LABEL_99;
LABEL_59:
      v16 = 0;
      goto LABEL_60;
    }
    goto LABEL_12;
  }
LABEL_57:
  v19 = v9[1];
LABEL_58:
  if (v19)
    goto LABEL_59;
  v16 = 0;
  v47 = v9[3];
  if (v9[2])
    v17 = 2483028224;
  else
    v17 = 2617245952;
  if (!v47)
    goto LABEL_49;
LABEL_60:
  v25 = (NSString *)malloc_type_calloc(1uLL, 0x2038uLL, 0x109004015BCA0ECuLL);
  v25->super.isa = (Class)objc_msgSend(v7, "bytes");
  v26 = objc_msgSend(v7, "length");
  v25[5].super.isa = (Class)1;
  v25[2].super.isa = (Class)v26;
  v25[3].super.isa = (Class)v16;
  v25[1].super.isa = (Class)a4;
  if (!skipJSONWhitespace((uint64_t)v25, a5, (a4 & 0x10) != 0)
    || (v27 = v25[3].super.isa, v25[2].super.isa <= v27))
  {
    if ((a4 & 0x10) != 0)
    {
      if ((a4 & 1) != 0)
        v29 = (objc_class *)MEMORY[0x1E0C99E08];
      else
        v29 = (objc_class *)MEMORY[0x1E0C99D80];
      v38 = objc_alloc_init(v29);
      goto LABEL_76;
    }
    if (!a5)
    {
LABEL_73:
      v38 = 0;
      goto LABEL_76;
    }
    isa = v25[3].super.isa;
    v31 = v25[6].super.isa;
    v32 = isa >= v31;
    v33 = isa - v31;
    if (v32)
      v34 = v33;
    else
      v34 = 0;
    v35 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("%@ around line %lu, column %lu."), CFSTR("JSON text did not have any content"), v25[5].super.isa, v34);
LABEL_72:
    v36 = v35;
    v37 = -[NSNumber initWithUnsignedInteger:]([NSNumber alloc], "initWithUnsignedInteger:", v25[3].super.isa);
    v55 = CFSTR("NSDebugDescription");
    v56 = CFSTR("NSJSONSerializationErrorIndex");
    v57 = v36;
    v58 = v37;
    *a5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3840, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v55, 2));

    goto LABEL_73;
  }
  if ((a4 & 0x10) == 0)
  {
    if ((a4 & 4) != 0 || (*((unsigned __int8 *)v25->super.isa + (unint64_t)v27) | 0x20) == 0x7B)
    {
      v28 = newJSONValue(v25, a5);
      goto LABEL_84;
    }
    if (!a5)
      goto LABEL_73;
    v48 = v25[6].super.isa;
    v32 = v27 >= v48;
    v49 = v27 - v48;
    if (v32)
      v50 = v49;
    else
      v50 = 0;
    v35 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("%@ around line %lu, column %lu."), CFSTR("JSON text did not start with array or object and option to allow fragments not set."), v25[5].super.isa, v50);
    goto LABEL_72;
  }
  v28 = newJSONObject((uint64_t)v25, 1, a5);
LABEL_84:
  v38 = v28;
  if (v28 && v25[3].super.isa < v25[2].super.isa)
  {
    if ((skipJSONWhitespace((uint64_t)v25, a5, 1) & 1) == 0)
    {
LABEL_93:

      goto LABEL_73;
    }
    v41 = v25[3].super.isa;
    if (v41 != v25[2].super.isa)
    {
      if (a5)
      {
        v42 = v25[6].super.isa;
        v32 = v41 >= v42;
        v43 = v41 - v42;
        if (v32)
          v44 = v43;
        else
          v44 = 0;
        v45 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("%@ around line %lu, column %lu."), CFSTR("Garbage at end"), v25[5].super.isa, v44);
        v46 = -[NSNumber initWithUnsignedInteger:]([NSNumber alloc], "initWithUnsignedInteger:", v25[3].super.isa);
        v55 = CFSTR("NSDebugDescription");
        v56 = CFSTR("NSJSONSerializationErrorIndex");
        v57 = v45;
        v58 = v46;
        *a5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3840, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v55, 2));

      }
      goto LABEL_93;
    }
  }
LABEL_76:
  for (i = 9; i != 1033; i += 4)
  {
    v40 = v25[i].super.isa;
    if (v40)

  }
  free(v25);
  return v38;
}

- (id)parseStream:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v10 = malloc_type_malloc(0x1000uLL, 0x100004077774924uLL);
  while (1)
  {
    do
    {
      if (objc_msgSend(a3, "streamStatus") != 2 && objc_msgSend(a3, "streamStatus") != 3)
      {
        free(v10);
        return -[_NSJSONReader parseData:options:error:](self, "parseData:options:error:", v9, a4, a5);
      }
    }
    while (!objc_msgSend(a3, "hasBytesAvailable"));
    v11 = objc_msgSend(a3, "read:maxLength:", v10, 4096);
    if (v11 < 0)
      break;
    if (v11)
      objc_msgSend(v9, "appendBytes:length:", v10, v11);
  }
  if (a5)
  {
    v13 = CFSTR("NSUnderlyingError");
    v14[0] = objc_msgSend(a3, "streamError");
    *a5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3840, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1));
  }
  free(v10);
  return 0;
}

@end
