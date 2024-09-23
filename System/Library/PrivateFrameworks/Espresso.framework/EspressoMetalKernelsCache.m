@implementation EspressoMetalKernelsCache

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 850045863;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_QWORD *)self + 15) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 17, 0);
  objc_storeStrong((id *)self + 16, 0);
  std::mutex::~mutex((std::mutex *)self + 1);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 2, 0);
  objc_storeStrong((id *)self + 1, 0);
}

- (void)setKernelPrefix:(id)a3
{
  objc_storeStrong((id *)self + 16, a3);
}

- (EspressoMetalKernelsCache)initWithDevice:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EspressoMetalKernelsCache;
  v6 = -[EspressoMetalKernelsCache init](&v14, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.espresso.EspressoMetalKernelsCache", v7);
    v9 = (void *)*((_QWORD *)v6 + 5);
    *((_QWORD *)v6 + 5) = v8;

    objc_storeStrong((id *)v6 + 3, a3);
    *((_BYTE *)v6 + 32) = 1;
    v10 = (void *)*((_QWORD *)v6 + 16);
    *((_QWORD *)v6 + 16) = CFSTR("T2D_");

    if ((objc_msgSend(v6, "shouldUseTexArray") & 1) == 0)
    {
      v11 = (void *)*((_QWORD *)v6 + 16);
      *((_QWORD *)v6 + 16) = CFSTR("T3D_");

    }
    v12 = v6;
  }

  return (EspressoMetalKernelsCache *)v6;
}

- (BOOL)shouldUseTexArray
{
  return *((_BYTE *)self + 32);
}

- (void)lazySetup
{
  std::mutex *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  std::runtime_error *exception;
  char *v58;
  std::string *v59;
  __int128 v60;
  std::string v61;
  std::string v62;

  v3 = (std::mutex *)((char *)self + 64);
  std::mutex::lock((std::mutex *)self + 1);
  if (!-[EspressoMetalKernelsCache wasSetup](self, "wasSetup"))
  {
    v4 = (void *)*((_QWORD *)self + 17);
    *((_QWORD *)self + 17) = 0;

    v5 = objc_opt_new();
    v6 = (void *)*((_QWORD *)self + 7);
    *((_QWORD *)self + 7) = v5;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resourcePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("/Frameworks/Espresso.framework/default.metallib"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)*((_QWORD *)self + 3);
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "newLibraryWithURL:error:", v11, 0);
      v13 = (void *)*((_QWORD *)self + 1);
      *((_QWORD *)self + 1) = v12;

    }
    if (!*((_QWORD *)self + 1))
    {
      objc_msgSend(v7, "resourcePath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingString:", CFSTR("/Frameworks/ExternalLibraryWrapper.framework/default.metallib"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = (void *)*((_QWORD *)self + 3);
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "newLibraryWithURL:error:", v17, 0);
        v19 = (void *)*((_QWORD *)self + 1);
        *((_QWORD *)self + 1) = v18;

      }
      if (!*((_QWORD *)self + 1))
      {
        objc_msgSend(v7, "resourcePath");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringByAppendingString:", CFSTR("/Espresso.framework/default.metallib"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = (void *)*((_QWORD *)self + 3);
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "newLibraryWithURL:error:", v23, 0);
          v25 = (void *)*((_QWORD *)self + 1);
          *((_QWORD *)self + 1) = v24;

        }
        if (!*((_QWORD *)self + 1))
        {
          objc_msgSend(v7, "resourcePath");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringByAppendingString:", CFSTR("/Frameworks/Espresso.framework/default.metallib"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            v28 = (void *)*((_QWORD *)self + 3);
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v28, "newLibraryWithURL:error:", v29, 0);
            v31 = (void *)*((_QWORD *)self + 1);
            *((_QWORD *)self + 1) = v30;

          }
          if (!*((_QWORD *)self + 1))
          {
            objc_msgSend(v7, "bundlePath");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "stringByAppendingString:", CFSTR("/Contents/Frameworks/Espresso.framework/Versions/Current/Resources/default.metallib"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v33)
            {
              v34 = (void *)*((_QWORD *)self + 3);
              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v33);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v34, "newLibraryWithURL:error:", v35, 0);
              v37 = (void *)*((_QWORD *)self + 1);
              *((_QWORD *)self + 1) = v36;

            }
            if (!*((_QWORD *)self + 1))
            {
              objc_msgSend(v7, "bundlePath");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "stringByAppendingString:", CFSTR("/Resources/default.metallib"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              if (v39)
              {
                v40 = (void *)*((_QWORD *)self + 3);
                objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v39);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = objc_msgSend(v40, "newLibraryWithURL:error:", v41, 0);
                v43 = (void *)*((_QWORD *)self + 1);
                *((_QWORD *)self + 1) = v42;

              }
              if (!*((_QWORD *)self + 1))
              {
                objc_msgSend(v7, "bundlePath");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "stringByAppendingString:", CFSTR("/default.metallib"));
                v45 = (void *)objc_claimAutoreleasedReturnValue();

                if (v45)
                {
                  v46 = (void *)*((_QWORD *)self + 3);
                  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v45);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = objc_msgSend(v46, "newLibraryWithURL:error:", v47, 0);
                  v49 = (void *)*((_QWORD *)self + 1);
                  *((_QWORD *)self + 1) = v48;

                }
                if (!*((_QWORD *)self + 1))
                {
                  v50 = objc_msgSend(*((id *)self + 3), "newDefaultLibrary");
                  v51 = (void *)*((_QWORD *)self + 1);
                  *((_QWORD *)self + 1) = v50;

                }
              }
            }
          }
        }
      }
    }
    v52 = objc_msgSend(*((id *)self + 3), "newDefaultLibrary");
    v53 = (void *)*((_QWORD *)self + 2);
    *((_QWORD *)self + 2) = v52;

    if (!*((_QWORD *)self + 1))
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      objc_msgSend(v7, "bundlePath");
      v58 = (char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      std::string::basic_string[abi:ne180100]<0>(&v61, v58);
      v59 = std::string::insert(&v61, 0, "Espresso: Failed creating a default shader library! GPU mode won't work");
      v60 = *(_OWORD *)&v59->__r_.__value_.__l.__data_;
      v62.__r_.__value_.__r.__words[2] = v59->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v62.__r_.__value_.__l.__data_ = v60;
      v59->__r_.__value_.__l.__size_ = 0;
      v59->__r_.__value_.__r.__words[2] = 0;
      v59->__r_.__value_.__r.__words[0] = 0;
      std::runtime_error::runtime_error(exception, &v62);
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    -[EspressoMetalKernelsCache addLibraryAtPath:](self, "addLibraryAtPath:", CFSTR("espressotrain.metallib"));
    objc_msgSend(v7, "bundlePath");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "stringByDeletingLastPathComponent");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "stringByAppendingPathComponent:", CFSTR("espressotrain.metallib"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[EspressoMetalKernelsCache addLibraryAtPath:](self, "addLibraryAtPath:", v56);

  }
  std::mutex::unlock(v3);
}

- (BOOL)wasSetup
{
  return *((_QWORD *)self + 7) != 0;
}

- (void)loadLibraryNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  std::runtime_error *exception;
  id v19;

  v4 = a3;
  v5 = (void *)*((_QWORD *)self + 3);
  v19 = v4;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "newLibraryWithURL:error:", v6, 0);
  v8 = (void *)*((_QWORD *)self + 1);
  *((_QWORD *)self + 1) = v7;

  if (!*((_QWORD *)self + 1))
  {
    v9 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundlePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(*((id *)self + 3), "newLibraryWithURL:error:", v13, 0);
    v15 = (void *)*((_QWORD *)self + 1);
    *((_QWORD *)self + 1) = v14;

    if (!*((_QWORD *)self + 1))
    {
      v16 = objc_msgSend(*((id *)self + 3), "newDefaultLibrary");
      v17 = (void *)*((_QWORD *)self + 1);
      *((_QWORD *)self + 1) = v16;

      if (!*((_QWORD *)self + 1))
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Espresso: Failed creating a default shader library! GPU mode won't work");
        __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
    }
  }

}

- (void)addLibraryAtPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v15 = v4;
  if (!*((_QWORD *)self + 6))
  {
    v5 = objc_opt_new();
    v6 = (void *)*((_QWORD *)self + 6);
    *((_QWORD *)self + 6) = v5;

    v4 = v15;
  }
  v7 = (void *)*((_QWORD *)self + 3);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "newLibraryWithURL:error:", v8, 0);

  if (!v9)
  {
    v10 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundlePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLWithString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(*((id *)self + 3), "newLibraryWithURL:error:", v14, 0);
  }
  objc_msgSend(*((id *)self + 6), "setObject:forKeyedSubscript:", v9, v15);

}

- (id)kernelForFunction:(const char *)a3
{
  return -[EspressoMetalKernelsCache kernelForFunction:cacheString:withConstants:](self, "kernelForFunction:cacheString:withConstants:", a3, 0, 0);
}

- (id)kernelForFunction:(const char *)a3 cacheString:(const char *)a4 withConstants:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  std::runtime_error *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  id v48;
  void *v49;
  void *v51;
  std::runtime_error *v52;
  void *v53;
  std::runtime_error *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  std::runtime_error *exception;
  id obj;
  id obja;
  id v63;
  void *v64;
  id v65;
  _QWORD v66[5];
  id v67;
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD block[5];
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  char v87[4];
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  _BYTE v95[128];
  char v96[128];
  char __dst[8];
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v65 = a5;
  -[EspressoMetalKernelsCache lazySetup](self, "lazySetup");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%s"), *((_QWORD *)self + 16), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  strncpy(__dst, a3, 0x40uLL);
  v8 = v7;
  v9 = v8;
  v64 = v8;
  if (v65)
  {
    v63 = v8;
    if (a4)
    {
      objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("%s"), a4);
      v63 = (id)objc_claimAutoreleasedReturnValue();

      -[EspressoMetalKernelsCache m_kernelCache](self, "m_kernelCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v63);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = 0;
LABEL_47:

        goto LABEL_48;
      }
    }
    v87[0] = 1;
    v89 = *(_QWORD *)__dst;
    v90 = v98;
    v91 = v99;
    v92 = v100;
    v93 = v101;
    v94 = v102;
    v88 = 723714064;
    kdebug_trace();
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    obj = *((id *)self + 6);
    v13 = 0;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v84;
LABEL_7:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v84 != v15)
          objc_enumerationMutation(obj);
        objc_msgSend(*((id *)self + 6), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v13;
        v19 = (void *)objc_msgSend(v17, "newFunctionWithName:constantValues:error:", v18, v65, &v82);
        v20 = v82;

        if (v19)
          break;
        v81 = v20;
        v19 = (void *)objc_msgSend(v17, "newFunctionWithName:constantValues:error:", v64, v65, &v81);
        v13 = v81;

        if (v19)
        {
          v20 = v13;
          goto LABEL_34;
        }
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
          if (v14)
            goto LABEL_7;
          goto LABEL_14;
        }
      }

LABEL_34:
      v23 = 0;
      goto LABEL_35;
    }
LABEL_14:

    v21 = (void *)*((_QWORD *)self + 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0;
    v19 = (void *)objc_msgSend(v21, "newFunctionWithName:constantValues:error:", v22, v65, &v80);
    v23 = v80;

    if (v19)
    {
      v20 = v13;
    }
    else
    {
      v42 = (void *)*((_QWORD *)self + 1);
      v79 = v13;
      v19 = (void *)objc_msgSend(v42, "newFunctionWithName:constantValues:error:", v64, v65, &v79);
      v20 = v79;

      if (!v19)
      {
        v43 = (void *)*((_QWORD *)self + 2);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v23;
        v19 = (void *)objc_msgSend(v43, "newFunctionWithName:constantValues:error:", v44, v65, &v78);
        obja = v78;

        if (!v19)
        {
          v55 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v20, "localizedDescription");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obja, "localizedDescription");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "stringWithFormat:", CFSTR(">> ERROR: Failed creating a new function w constants %s err=%@ e1=%@!"), a3, v56, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(exception, (const char *)objc_msgSend(objc_retainAutorelease(v58), "UTF8String"));
          __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        v23 = obja;
      }
    }
LABEL_35:
    v39 = (void *)objc_opt_new();
    objc_msgSend(v39, "setComputeFunction:", v19);
    v40 = (void *)*((_QWORD *)self + 3);
    v77 = v20;
    v11 = (id)objc_msgSend(v40, "newComputePipelineStateWithDescriptor:options:reflection:error:", v39, 0, 0, &v77);
    v12 = v77;

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(">> ERROR: Failed creating a compute kernel: %@ %s"), v12, a3);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v52, (const char *)objc_msgSend(objc_retainAutorelease(v51), "UTF8String"));
      __cxa_throw(v52, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (a4)
    {
      v41 = *((_QWORD *)self + 5);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__EspressoMetalKernelsCache_kernelForFunction_cacheString_withConstants___block_invoke;
      block[3] = &unk_1E2DD7818;
      block[4] = self;
      v75 = v63;
      v76 = v11;
      dispatch_sync(v41, block);

    }
LABEL_46:
    Espresso_scoped_signpost::~Espresso_scoped_signpost((Espresso_scoped_signpost *)v87);
    goto LABEL_47;
  }
  -[EspressoMetalKernelsCache m_kernelCache](self, "m_kernelCache");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v87[0] = 1;
    v89 = *(_QWORD *)__dst;
    v90 = v98;
    v91 = v99;
    v92 = v100;
    v93 = v101;
    v94 = v102;
    v88 = 723714064;
    kdebug_trace();
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v25 = *((id *)self + 6);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v70, v95, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v71;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v71 != v27)
            objc_enumerationMutation(v25);
          objc_msgSend(*((id *)self + 6), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(v29, "newFunctionWithName:", v64);
          if (v30)
          {

LABEL_43:
            v32 = v64;
            goto LABEL_44;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(v29, "newFunctionWithName:", v31);

          if (v30)
            goto LABEL_43;
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v70, v95, 16);
        if (v26)
          continue;
        break;
      }
    }

    v32 = v64;
    v30 = (void *)objc_msgSend(*((id *)self + 1), "newFunctionWithName:", v64);
    if (!v30)
    {
      v33 = (void *)*((_QWORD *)self + 1);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v33, "newFunctionWithName:", v34);

      v32 = v64;
      if (!v30)
      {
        v30 = (void *)objc_msgSend(*((id *)self + 2), "newFunctionWithName:", v64);
        if (!v30)
        {
          v35 = (void *)*((_QWORD *)self + 2);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(v35, "newFunctionWithName:", v36);

          v32 = v64;
          if (!v30)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(">> ERROR: Failed creating a new function %s %@!"), a3, v64);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("%@"), v37);
            v38 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::runtime_error::runtime_error(v38, (const char *)objc_msgSend(objc_retainAutorelease(v37), "UTF8String"));
            __cxa_throw(v38, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
          }
        }
      }
    }
LABEL_44:
    v45 = (void *)*((_QWORD *)self + 3);
    v69 = 0;
    v46 = (void *)objc_msgSend(v45, "newComputePipelineStateWithFunction:error:", v30, &v69);
    v12 = v69;
    if (!v46)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(">> ERROR: Failed creating a compute kernel: %@ %s %@"), v12, a3, v32);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v54, (const char *)objc_msgSend(objc_retainAutorelease(v53), "UTF8String"));
      __cxa_throw(v54, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    v47 = *((_QWORD *)self + 5);
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __73__EspressoMetalKernelsCache_kernelForFunction_cacheString_withConstants___block_invoke_2;
    v66[3] = &unk_1E2DD7818;
    v66[4] = self;
    v63 = v32;
    v67 = v63;
    v48 = v46;
    v68 = v48;
    dispatch_sync(v47, v66);
    v49 = v68;
    v11 = v48;

    goto LABEL_46;
  }
  v12 = 0;

LABEL_48:
  return v11;
}

- (NSString)kernelPrefix
{
  return (NSString *)*((_QWORD *)self + 16);
}

- (NSDictionary)m_kernelCache
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setM_kernelCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

void __73__EspressoMetalKernelsCache_kernelForFunction_cacheString_withConstants___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setM_kernelCache:");

}

void __73__EspressoMetalKernelsCache_kernelForFunction_cacheString_withConstants___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 56), "setObject:forKeyedSubscript:", a1[6], a1[5]);
  v2 = objc_msgSend(*(id *)(a1[4] + 56), "copy");
  v3 = a1[4];
  v4 = *(void **)(v3 + 136);
  *(_QWORD *)(v3 + 136) = v2;

}

@end
