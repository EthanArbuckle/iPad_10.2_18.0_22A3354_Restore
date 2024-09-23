@implementation NSError(ATAdditions)

+ (id)at_ATErrorFromError:()ATAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  _QWORD *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  __int128 buf;
  void *(*v27)(_QWORD *);
  void *v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = v4;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ATError")) & 1) == 0)
    {
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DDBD38]))
      {
        objc_msgSend(a1, "_ATErrorFromICError:", v4);
        v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v7 = (void *)v8;

        goto LABEL_9;
      }
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DDBE40]))
      {
        objc_msgSend(a1, "_ATErrorFromICServerError:", v4);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DDBD58]))
      {
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v24 = *MEMORY[0x1E0CB3388];
        v25 = v4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ATError"), 27, v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = 0;
        v19 = &v18;
        v20 = 0x2020000000;
        v12 = (_QWORD *)getBLErrorDomainSymbolLoc_ptr;
        v21 = getBLErrorDomainSymbolLoc_ptr;
        if (!getBLErrorDomainSymbolLoc_ptr)
        {
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v27 = __getBLErrorDomainSymbolLoc_block_invoke;
          v28 = &unk_1E927E328;
          v29 = &v18;
          __getBLErrorDomainSymbolLoc_block_invoke(&buf);
          v12 = (_QWORD *)v19[3];
        }
        _Block_object_dispose(&v18, 8);
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getBLErrorDomain(void)");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("NSError+ATAdditions.m"), 19, CFSTR("%s"), dlerror());

          __break(1u);
        }
        if (objc_msgSend(v6, "isEqualToString:", *v12))
        {
          objc_msgSend(a1, "_ATErrorFromBLError:", v4);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CFD808]))
        {
          objc_msgSend(a1, "_ATErrorFromAMSError:", v4);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else if (objc_msgSend(v6, "isEqualToString:", CFSTR("MBErrorDomain")))
        {
          objc_msgSend(a1, "_ATErrorFromMBError:", v4);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else if (objc_msgSend(v6, "isEqualToString:", CFSTR("CoreMediaErrorDomain")))
        {
          objc_msgSend(a1, "_ATErrorFromCoreMediaError:", v4);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          _ATLogCategoryFramework();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v4;
            _os_log_impl(&dword_1D1868000, v13, OS_LOG_TYPE_DEFAULT, "Mapping error from unknown domain: %{public}@", (uint8_t *)&buf, 0xCu);
          }

          v14 = (void *)MEMORY[0x1E0CB35C8];
          v22 = *MEMORY[0x1E0CB3388];
          v23 = v4;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("ATError"), 0, v15);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_9:

  return v7;
}

+ (id)_ATErrorFromICError:()ATAdditions
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "code");
  v6 = (_QWORD *)MEMORY[0x1E0CB3388];
  if (v5 <= -7102)
  {
    if (v5 > -7403)
    {
      v18 = 3;
      if (v5 != -7104)
        v18 = 0;
      if (v5 == -7402)
        v12 = 4;
      else
        v12 = v18;
    }
    else if (v5 == -8302)
    {
      v12 = 27;
    }
    else if (v5 == -7403)
    {
      objc_msgSend(v4, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", *v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14
        && (objc_msgSend(v14, "domain"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CFD808]),
            v15,
            v16))
      {
        objc_msgSend(a1, "_ATErrorFromAMSError:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v17, "code");

      }
      else
      {
        v12 = 4;
      }

    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v7 = 7;
    if (v5 != -7003)
      v7 = 0;
    if (v5 == -7004)
      v8 = 2;
    else
      v8 = v7;
    if (v5 == -7006)
      v9 = 20;
    else
      v9 = v8;
    v10 = 8;
    if (v5 != -7100)
      v10 = 0;
    if (v5 == -7101)
      v11 = 23;
    else
      v11 = v10;
    if (v5 <= -7007)
      v12 = v11;
    else
      v12 = v9;
  }
  v19 = (void *)MEMORY[0x1E0CB35C8];
  v23 = *v6;
  v24[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("ATError"), v12, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)_ATErrorFromICServerError:()ATAdditions
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  v5 = 0;
  if (v4 <= 2033)
  {
    if ((unint64_t)(v4 - 1003) >= 2 && v4 != 2002)
      goto LABEL_8;
LABEL_7:
    v5 = 4;
    goto LABEL_8;
  }
  if (v4 == 2070 || v4 == 2034)
    goto LABEL_7;
LABEL_8:
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB3388];
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("ATError"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_ATErrorFromBLError:()ATAdditions
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  v5 = 14;
  v6 = 2;
  if (v4 != 16)
    v6 = 0;
  if (v4 != 103)
    v5 = v6;
  if (v4 == 4)
    v7 = 4;
  else
    v7 = v5;
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v12 = *MEMORY[0x1E0CB3388];
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("ATError"), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_ATErrorFromAMSError:()ATAdditions
{
  id v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  v5 = (_QWORD *)MEMORY[0x1E0CB3388];
  if (v4 > 99)
  {
    if (v4 == 101)
    {
      v7 = 4;
      goto LABEL_19;
    }
    if (v4 != 100)
    {
      v7 = 0;
      goto LABEL_19;
    }
    objc_msgSend(v3, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CFD808]) & 1) != 0)
      {
        v11 = objc_msgSend(v9, "code");

        if (v11 == 6)
          v7 = 2;
        else
          v7 = 4;
        goto LABEL_18;
      }

    }
    v7 = 4;
LABEL_18:

    goto LABEL_19;
  }
  v6 = 2;
  if (v4 != 6)
    v6 = 0;
  if (v4 == 1)
    v7 = 7;
  else
    v7 = v6;
LABEL_19:
  v12 = (void *)MEMORY[0x1E0CB35C8];
  v16 = *v5;
  v17[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ATError"), v7, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_ATErrorFromMBError:()ATAdditions
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  if (v4 > 201)
  {
    v5 = 2;
    switch(v4)
    {
      case 202:
        goto LABEL_17;
      case 203:
      case 206:
      case 209:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
        goto LABEL_16;
      case 204:
      case 205:
      case 210:
        goto LABEL_8;
      case 207:
LABEL_12:
        v5 = 4;
        goto LABEL_17;
      case 208:
        v5 = 20;
        goto LABEL_17;
      case 219:
        v5 = 31;
        goto LABEL_17;
      case 220:
        goto LABEL_7;
      default:
        switch(v4)
        {
          case 300:
          case 302:
          case 304:
          case 308:
            goto LABEL_7;
          case 303:
            goto LABEL_11;
          case 305:
            goto LABEL_12;
          case 306:
            goto LABEL_8;
          default:
            goto LABEL_16;
        }
    }
  }
  v6 = 0;
  switch(v4)
  {
    case 0:
      goto LABEL_18;
    case 1:
    case 2:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 16:
    case 21:
    case 22:
      goto LABEL_16;
    case 3:
    case 18:
    case 19:
    case 20:
LABEL_7:
      v5 = 8;
      goto LABEL_17;
    case 4:
    case 13:
LABEL_8:
      v5 = 10;
      goto LABEL_17;
    case 15:
      v5 = 7;
      goto LABEL_17;
    case 17:
      v5 = 25;
      goto LABEL_17;
    case 23:
      v5 = 24;
      goto LABEL_17;
    default:
      if (v4 == 105 || v4 == 106)
LABEL_11:
        v5 = 14;
      else
LABEL_16:
        v5 = 0;
LABEL_17:
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0CB3388];
      v11[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("ATError"), v5, v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
      return v6;
  }
}

+ (id)_ATErrorFromCoreMediaError:()ATAdditions
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "code") == -17760)
    v4 = 8;
  else
    v4 = 27;
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB3388];
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("ATError"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
