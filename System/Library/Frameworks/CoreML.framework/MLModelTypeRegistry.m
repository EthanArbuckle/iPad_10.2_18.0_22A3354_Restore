@implementation MLModelTypeRegistry

- (id)classesForLoadingModelType:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  +[MLModelConfiguration defaultConfiguration](MLModelConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelTypeRegistry classesForLoadingModelType:configuration:isUpdatable:isEncrypted:](self, "classesForLoadingModelType:configuration:isUpdatable:isEncrypted:", v3, v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)classesForLoadingModelType:(int)a3 configuration:(id)a4 isUpdatable:(BOOL)a5 isEncrypted:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[2];

  v6 = a6;
  v7 = a5;
  v51[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = v10;
  if (a3 > 555)
  {
    if (a3 > 899)
    {
      switch(a3)
      {
        case 2000:
          v26 = objc_opt_class();
          v12 = &v26;
          goto LABEL_61;
        case 2001:
          v27 = objc_opt_class();
          v12 = &v27;
          goto LABEL_61;
        case 2002:
          v23 = objc_opt_class();
          v12 = &v23;
          goto LABEL_61;
        case 2003:
          v19 = objc_opt_class();
          v12 = &v19;
          goto LABEL_61;
        case 2004:
          v25 = objc_opt_class();
          v12 = &v25;
          goto LABEL_61;
        case 2005:
          v24 = objc_opt_class();
          v12 = &v24;
          goto LABEL_61;
        case 2006:
          v22 = objc_opt_class();
          v12 = &v22;
          goto LABEL_61;
        default:
          if (a3 != 900)
            goto LABEL_31;
          v29 = objc_opt_class();
          v12 = &v29;
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 600:
          v49 = objc_opt_class();
          v12 = &v49;
          goto LABEL_61;
        case 601:
          v41 = objc_opt_class();
          v12 = &v41;
          goto LABEL_61;
        case 602:
          v43 = objc_opt_class();
          v12 = &v43;
          goto LABEL_61;
        case 603:
          v40 = objc_opt_class();
          v12 = &v40;
          goto LABEL_61;
        case 604:
          v39 = objc_opt_class();
          v12 = &v39;
          goto LABEL_61;
        case 605:
        case 608:
          goto LABEL_31;
        case 606:
          v36 = objc_opt_class();
          v12 = &v36;
          goto LABEL_61;
        case 607:
          v37 = objc_opt_class();
          v12 = &v37;
          goto LABEL_61;
        case 609:
          v42 = objc_opt_class();
          v12 = &v42;
          goto LABEL_61;
        case 610:
          v38 = objc_opt_class();
          v12 = &v38;
          goto LABEL_61;
        default:
          if (a3 == 556)
          {
            v18 = objc_opt_class();
            v12 = &v18;
          }
          else
          {
            if (a3 != 560)
              goto LABEL_31;
            v17 = objc_opt_class();
            v12 = &v17;
          }
          break;
      }
    }
    goto LABEL_61;
  }
  if (a3 > 399)
  {
    if (a3 <= 499)
    {
      switch(a3)
      {
        case 400:
          v47 = objc_opt_class();
          v12 = &v47;
          goto LABEL_61;
        case 401:
          v35 = objc_opt_class();
          v12 = &v35;
          goto LABEL_61;
        case 402:
          if (v7)
          {
            v46 = objc_opt_class();
            v12 = &v46;
          }
          else
          {
            v45 = objc_opt_class();
            v12 = &v45;
          }
          goto LABEL_61;
        case 403:
          goto LABEL_19;
        case 404:
          v21 = objc_opt_class();
          v12 = &v21;
          goto LABEL_61;
        default:
          goto LABEL_31;
      }
    }
    if (a3 <= 501)
    {
      if (a3 == 500)
      {
LABEL_19:
        -[MLModelTypeRegistry loadNeuralNetworkClasses:trainWithMLCompute:](self, "loadNeuralNetworkClasses:trainWithMLCompute:", v7, objc_msgSend(v10, "trainWithMLCompute"));
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_63:
        v14 = (void *)v13;
        goto LABEL_64;
      }
      v20 = objc_opt_class();
      v12 = &v20;
      goto LABEL_61;
    }
    if (a3 == 502)
    {
      if (objc_msgSend(v10, "experimentalMLE5EngineUsage") == 2)
      {
        v33 = objc_opt_class();
        v12 = &v33;
      }
      else
      {
        if (!v6 || (_os_feature_enabled_impl() & 1) != 0)
        {
          v31[0] = objc_opt_class();
          v31[1] = objc_opt_class();
          v12 = v31;
          v15 = 2;
LABEL_62:
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, v15);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_63;
        }
        v32 = objc_opt_class();
        v12 = &v32;
      }
    }
    else
    {
      if (a3 != 555)
      {
LABEL_31:
        v14 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_64;
      }
      v28 = objc_opt_class();
      v12 = &v28;
    }
LABEL_61:
    v15 = 1;
    goto LABEL_62;
  }
  switch(a3)
  {
    case 300:
      v48 = objc_opt_class();
      v12 = &v48;
      goto LABEL_61;
    case 301:
      v34 = objc_opt_class();
      v12 = &v34;
      goto LABEL_61;
    case 302:
      v44 = objc_opt_class();
      v12 = &v44;
      goto LABEL_61;
    case 303:
      goto LABEL_19;
    case 304:
      v30 = objc_opt_class();
      v12 = &v30;
      goto LABEL_61;
    default:
      if ((a3 - 200) < 3)
      {
        if (v7)
        {
          v51[0] = objc_opt_class();
          v12 = v51;
        }
        else
        {
          v50 = objc_opt_class();
          v12 = &v50;
        }
        goto LABEL_61;
      }
      if (a3)
        goto LABEL_31;
      v14 = 0;
      break;
  }
LABEL_64:

  return v14;
}

- (id)loadNeuralNetworkClasses:(BOOL)a3 trainWithMLCompute:(BOOL)a4
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
    {
      v7 = objc_opt_class();
      v4 = &v7;
    }
    else
    {
      v6 = objc_opt_class();
      v4 = &v6;
    }
  }
  else
  {
    v8 = objc_opt_class();
    v4 = &v8;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1, v6, v7, v8, v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__MLModelTypeRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[MLModelTypeRegistry sharedInstance]::onceToken != -1)
    dispatch_once(&+[MLModelTypeRegistry sharedInstance]::onceToken, block);
  return (id)+[MLModelTypeRegistry sharedInstance]::shared;
}

void __37__MLModelTypeRegistry_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[MLModelTypeRegistry sharedInstance]::shared;
  +[MLModelTypeRegistry sharedInstance]::shared = (uint64_t)v1;

}

- (MLModelTypeRegistry)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MLModelTypeRegistry;
  return -[MLModelTypeRegistry init](&v3, sel_init);
}

- (Class)classForCompilingModelType:(int)a3
{
  void *v3;

  v3 = 0;
  if (a3 > 559)
  {
    if (a3 > 899)
    {
      switch(a3)
      {
        case 2000:
        case 2001:
        case 2002:
        case 2003:
        case 2004:
        case 2005:
        case 2006:
          goto LABEL_14;
        default:
          if (a3 == 900)
            goto LABEL_14;
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 600:
        case 601:
        case 602:
        case 603:
        case 604:
        case 606:
        case 607:
        case 609:
        case 610:
          goto LABEL_14;
        case 605:
        case 608:
          return (Class)v3;
        default:
          if (a3 == 560)
            goto LABEL_14;
          break;
      }
    }
  }
  else if (a3 <= 399)
  {
    switch(a3)
    {
      case 300:
      case 301:
      case 302:
      case 303:
      case 304:
        goto LABEL_14;
      default:
        if ((a3 - 200) < 3)
          goto LABEL_14;
        break;
    }
  }
  else if (a3 > 499)
  {
    if (a3 <= 502 || a3 == 555 || a3 == 556)
    {
LABEL_14:
      objc_opt_class();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    switch(a3)
    {
      case 400:
      case 401:
      case 402:
      case 403:
      case 404:
        goto LABEL_14;
      default:
        return (Class)v3;
    }
  }
  return (Class)v3;
}

@end
