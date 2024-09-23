@implementation CAPackage

- (id)unarchiver:(id)a3 didDecodeObject:(id)a4
{
  return a4;
}

- (void)dealloc
{
  _CAPackageData *data;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  data = self->_data;
  if (data)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction activateBackground:](CATransaction, "activateBackground:", pthread_main_np() == 0);

    +[CATransaction commit](CATransaction, "commit");
    free(data);
  }
  v4.receiver = self;
  v4.super_class = (Class)CAPackage;
  -[CAPackage dealloc](&v4, sel_dealloc);
}

- (CALayer)rootLayer
{
  CALayer **data;

  data = (CALayer **)self->_data;
  if (data)
    return *data;
  else
    return 0;
}

- (id)publishedObjectWithName:(id)a3
{
  _CAPackageData *data;

  data = self->_data;
  if (data)
    return (id)objc_msgSend(data->var1, "objectForKey:", a3);
  else
    return 0;
}

- (id)publishedObjectNames
{
  _CAPackageData *data;
  id var1;

  data = self->_data;
  if (data && (var1 = data->var1) != 0)
    return (id)objc_msgSend(var1, "allKeys");
  else
    return (id)MEMORY[0x1E0C9AA60];
}

+ (id)packageWithContentsOfURL:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6
{
  if (a3)
    return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithContentsOfURL:type:options:error:", a3, a4, a5, a6);
  else
    return 0;
}

- (id)_initWithContentsOfURL:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6
{
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  objc_super v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.coreanimation-archive")))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", a3, 0, a6);
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to load CAPackage from URL: %@"), a3);
    if (a6)
    {
      v13 = *a6;
      if (*a6)
      {
        v14 = *MEMORY[0x1E0CB3388];
        v17[0] = *MEMORY[0x1E0CB2D50];
        v17[1] = v14;
        v18[0] = v12;
        v18[1] = v13;
        *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreAnimationErrorDomain"), 2, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
      }
    }
    if (v11)
    {
      self = -[CAPackage _initWithData:type:options:error:](self, "_initWithData:type:options:error:", v11, a4, a5, a6);

      return self;
    }
LABEL_14:

    return 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)CAPackage;
  self = -[CAPackage init](&v16, sel_init);
  if (!self)
    return self;
  self->_data = (_CAPackageData *)malloc_type_calloc(1uLL, 0x30uLL, 0x1080040EEFF6A89uLL);
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.coreanimation-bundle")) & 1) != 0
    || objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.coreanimation-xml")))
  {
    -[CAPackage _readFromCAMLURL:type:options:error:](self, "_readFromCAMLURL:type:options:error:", a3, a4, a5, a6);
  }
  if (!self->_data->var0)
    goto LABEL_14;
  if (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("prepareContents")), "BOOLValue"))recursively_prepare_contents((CALayer *)self->_data->var0);
  return self;
}

- (Class)CAMLParser:(id)a3 didFailToFindClassWithName:(id)a4
{
  return (Class)objc_msgSend(-[CAPackage substitutedClasses](self, "substitutedClasses", a3), "objectForKey:", a4);
}

+ (id)packageWithData:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6
{
  if (a3)
    return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithData:type:options:error:", a3, a4, a5, a6);
  else
    return 0;
}

- (id)_initWithData:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)CAPackage;
  v10 = -[CAPackage init](&v12, sel_init);
  if (v10)
  {
    *((_QWORD *)v10 + 1) = malloc_type_calloc(1uLL, 0x30uLL, 0x1080040EEFF6A89uLL);
    if (objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.coreanimation-archive")))
    {
      objc_msgSend(v10, "_readFromArchiveData:options:error:", a3, a5, a6);
    }
    else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.coreanimation-bundle")) & 1) != 0
           || objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.coreanimation-xml")))
    {
      objc_msgSend(v10, "_readFromCAMLData:type:options:error:", a3, a4, a5, a6);
    }
    if (**((_QWORD **)v10 + 1))
    {
      if (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("prepareContents")), "BOOLValue"))recursively_prepare_contents(**((CALayer ***)v10 + 1));
    }
    else
    {

      return 0;
    }
  }
  return v10;
}

- (void)_readFromArchiveData:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v7 = (void *)MEMORY[0x186DBE2E4](self, a2, a3, a4);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", a3, 0);
  v9 = v8;
  if (v8)
  {
    self->_data->var4 = 0;
    objc_msgSend(v8, "_allowDecodingCyclesInSecureMode");
    objc_msgSend(v9, "setDelegate:", self);
    -[CAPackage _addClassSubstitutions:](self, "_addClassSubstitutions:", v9);
    v10 = (void *)objc_msgSend(v9, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0CB3510], "CA_supportedClasses"), CFSTR("root"));
    objc_msgSend(v9, "finishDecoding");

    v11 = objc_msgSend(v10, "objectForKey:", CFSTR("rootLayer"));
    if (!self->_data->var4)
    {
      v12 = (void *)v11;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        self->_data->var0 = v12;
        self->_data->var3 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", CFSTR("geometryFlipped")), "BOOLValue");
        self->_data->var1 = (id)objc_msgSend(v10, "objectForKey:", CFSTR("publishedObjects"));
      }
    }
  }
  objc_autoreleasePoolPop(v7);
}

- (void)_addClassSubstitutions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = -[CAPackage substitutedClasses](self, "substitutedClasses");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(a3, "setClass:forClassName:", objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8)), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
}

- (id)substitutedClasses
{
  unsigned __int8 v2;

  {
    -[CAPackage substitutedClasses]::dict = class_substitutions();
  }
  return (id)-[CAPackage substitutedClasses]::dict;
}

- (void)_readFromCAMLURL:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  id var5;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  char v44;
  _CAPackageData *data;
  id v46;
  id v47;
  void *v48;
  id *v49;
  void *context;
  _BYTE v52[128];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x186DBE2E4](self, a2, a3, a4, a5);
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.coreanimation-xml")))
  {
    v9 = +[CAMLParser parser](CAMLParser, "parser");
    objc_msgSend(v9, "setDelegate:", self);
    objc_msgSend(v9, "setBaseURL:", objc_msgSend(a3, "URLByDeletingLastPathComponent"));
    objc_msgSend(v9, "parseContentsOfURL:", a3);
    v10 = (void *)objc_msgSend(v9, "error");
    if (a6 && v10 && !*a6)
      *a6 = v10;
    v11 = (void *)objc_msgSend(v9, "result");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self->_data->var0 = v11;
    }
    else
    {
      v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to parse CAPackage: %@"), CFSTR("Expected CALayer at root"));
      if (a6 && !*a6)
      {
        v62 = *MEMORY[0x1E0CB2D50];
        v64 = v19;
        *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreAnimationErrorDomain"), 3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v62, 1));
      }
    }
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.coreanimation-bundle")))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", objc_msgSend(a3, "path"), 1);
    self->_data->var2 = (id)objc_msgSend((id)objc_msgSend(v12, "path"), "stringByAppendingPathComponent:", CFSTR("assets"));
    v13 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("index.xml"), v12);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v13, 0, a6);
    if (v14)
    {
      v15 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v14, 0, 0, a6);
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to parse CAPackage from URL: %@"), v13);
      if (a6)
      {
        v17 = *a6;
        if (*a6)
        {
          v18 = *MEMORY[0x1E0CB3388];
          v62 = *MEMORY[0x1E0CB2D50];
          v63 = v18;
          v64 = v16;
          v65 = v17;
          *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreAnimationErrorDomain"), 3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v62, 2));
        }
      }

    }
    else
    {
      v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to load CAPackage from URL: %@"), v13);
      if (a6)
      {
        v21 = *a6;
        if (*a6)
        {
          v22 = *MEMORY[0x1E0CB3388];
          v62 = *MEMORY[0x1E0CB2D50];
          v63 = v22;
          v64 = v20;
          v65 = v21;
          *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreAnimationErrorDomain"), 2, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v62, 2));
        }
      }
      v15 = 0;
    }
    self->_data->var5 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    self->_data->var6 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = objc_msgSend(v15, "objectForKey:", CFSTR("stylesDocument"));
    if (v23)
    {
      v24 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v23, v12);
      v25 = +[CAMLParser parser](CAMLParser, "parser");
      objc_msgSend(self->_data->var5, "addObject:", v25);
      objc_msgSend(v25, "setDelegate:", self);
      objc_msgSend(v25, "setBaseURL:", v12);
      objc_msgSend(v25, "parseContentsOfURL:", v24);
      v26 = (void *)objc_msgSend(v25, "error");
      if (a6)
      {
        if (v26 && !*a6)
          *a6 = v26;
      }
    }
    v27 = objc_msgSend(v15, "objectForKey:", CFSTR("rootDocument"));
    if (v27)
    {
      v28 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v27, v12);
      v29 = +[CAMLParser parser](CAMLParser, "parser");
      objc_msgSend(self->_data->var5, "addObject:", v29);
      objc_msgSend(v29, "setDelegate:", self);
      objc_msgSend(v29, "setBaseURL:", v12);
      objc_msgSend(v29, "parseContentsOfURL:", v28);
      v30 = (void *)objc_msgSend(v29, "error");
      if (a6 && v30 && !*a6)
        *a6 = v30;
      v31 = (void *)objc_msgSend(v29, "result");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        self->_data->var0 = v31;
      }
      else
      {
        v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to parse CAPackage: %@"), CFSTR("Expected CALayer at root."));
        if (a6 && !*a6)
        {
          v62 = *MEMORY[0x1E0CB2D50];
          v64 = v32;
          *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreAnimationErrorDomain"), 3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v62, 1));
        }
      }
    }
    v33 = (void *)objc_msgSend(v15, "objectForKey:", CFSTR("publishedObjectNames"));
    if (v33)
    {
      v34 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v48 = v15;
      v49 = a6;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, v57, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v59 != v36)
              objc_enumerationMutation(v33);
            v38 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
            v55 = 0u;
            v56 = 0u;
            v53 = 0u;
            v54 = 0u;
            var5 = self->_data->var5;
            v40 = objc_msgSend(var5, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
            if (v40)
            {
              v41 = *(_QWORD *)v54;
              while (2)
              {
                for (j = 0; j != v40; ++j)
                {
                  if (*(_QWORD *)v54 != v41)
                    objc_enumerationMutation(var5);
                  v43 = objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * j), "objectById:", v38);
                  if (v43)
                  {
                    objc_msgSend(v34, "setObject:forKey:", v43, v38);
                    goto LABEL_52;
                  }
                }
                v40 = objc_msgSend(var5, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
                if (v40)
                  continue;
                break;
              }
            }
LABEL_52:
            ;
          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, v57, 16);
        }
        while (v35);
      }
      v15 = v48;
      a6 = v49;
      self->_data->var1 = (id)objc_msgSend(v34, "copy");
    }
    v44 = objc_msgSend((id)objc_msgSend(v15, "objectForKey:", CFSTR("geometryFlipped")), "BOOLValue");
    data = self->_data;
    data->var3 = v44;
    data->var5 = 0;
    data->var6 = 0;
  }
  if (a6)
  {
    if (*a6)
      v46 = *a6;
    objc_autoreleasePoolPop(context);
    if (*a6)
      v47 = *a6;
  }
  else
  {
    objc_autoreleasePoolPop(context);
  }
}

- (BOOL)isGeometryFlipped
{
  _CAPackageData *data;

  data = self->_data;
  return data && !data->var3;
}

- (void)_readFromCAMLData:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x186DBE2E4](self, a2, a3, a4, a5);
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.coreanimation-xml")))
  {
    v11 = +[CAMLParser parser](CAMLParser, "parser");
    objc_msgSend(v11, "setDelegate:", self);
    objc_msgSend(v11, "parseData:", a3);
    v12 = (void *)objc_msgSend(v11, "error");
    if (a6 && v12 && !*a6)
      *a6 = v12;
    v13 = (void *)objc_msgSend(v11, "result");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self->_data->var0 = v13;
    }
    else
    {
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to parse CAPackage: %@"), CFSTR("Expected CALayer at root"));
      if (a6 && !*a6)
      {
        v15 = *MEMORY[0x1E0CB2D50];
        v16[0] = v14;
        *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreAnimationErrorDomain"), 3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1));
      }
    }
  }
  objc_autoreleasePoolPop(v10);
}

- (void)foreachLayer:(id)a3
{
  foreachLayer(-[CAPackage rootLayer](self, "rootLayer"), (uint64_t)a3);
}

- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  id v6;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  Class v12;
  Class v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  CAPackage *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v6 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a5, "count", a3, a4);
  if (v8 < 2)
  {
LABEL_14:
    v13 = 0;
    self->_data->var4 = 1;
  }
  else
  {
    v9 = v8;
    v10 = 1;
    v11 = 0x1E0DE7000uLL;
    while (1)
    {
      v12 = NSClassFromString((NSString *)objc_msgSend(a5, "objectAtIndex:", v10));
      if (v12)
      {
        v13 = v12;
        if (v12 != (Class)objc_opt_class())
        {
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v14 = (void *)objc_msgSend(v6, "allowedClasses");
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
          if (v15)
            break;
        }
      }
LABEL_13:
      if (++v10 == v9)
        goto LABEL_14;
    }
    v16 = v15;
    v17 = *(_QWORD *)v26;
    v23 = v9;
LABEL_7:
    v18 = v6;
    v19 = self;
    v20 = v11;
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v17)
        objc_enumerationMutation(v14);
      if ((-[objc_class isSubclassOfClass:](v13, "isSubclassOfClass:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v21)) & 1) != 0)
        break;
      if (v16 == ++v21)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
        v11 = v20;
        self = v19;
        v6 = v18;
        v9 = v23;
        if (v16)
          goto LABEL_7;
        goto LABEL_13;
      }
    }
  }
  return v13;
}

- (id)CAMLParser:(id)a3 resourceForURL:(id)a4
{
  _CAPackageData *data;

  data = self->_data;
  if (data)
    return (id)objc_msgSend(data->var6, "objectForKey:", a4);
  else
    return 0;
}

- (void)CAMLParser:(id)a3 didLoadResource:(id)a4 fromURL:(id)a5
{
  _CAPackageData *data;

  data = self->_data;
  if (data)
    objc_msgSend(data->var6, "setObject:forKey:", a4, a5);
}

@end
