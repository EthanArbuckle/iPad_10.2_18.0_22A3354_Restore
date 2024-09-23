@implementation VNRequestInstanceCreator

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)newRequestInstanceOfClass:(Class)a3 withCompletionHandler:(id)a4 revision:(unint64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  id WeakRetained;
  void *v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  NSString *v21;
  SEL v22;
  uint64_t v23;
  objc_class *v24;
  id v25;
  void *v26;
  NSString *v27;
  SEL v28;
  id v29;
  id v30;
  id *v32;
  id v33;
  id v34;

  v10 = a4;
  v11 = (void *)MEMORY[0x1A1B0B060]();
  v33 = 0;
  v12 = v10;
  if (self)
  {
    if (!-[VNRequestInstanceCreator _isValidRequestClass:](a3))
    {
      -[VNRequestInstanceCreator errorForFailedInstanceCreationOfRequestClass:withCompletionHandler:](self, "errorForFailedInstanceCreationOfRequestClass:withCompletionHandler:", a3, v12);
      v17 = 0;
      v33 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = WeakRetained;
    if (WeakRetained)
    {
      v34 = 0;
      v15 = objc_msgSend(WeakRetained, "requestInstanceCreator:newRequestInstance:ofClass:withCompletionHandler:revision:error:", self, &v34, a3, v12, a5, &v33);
      v16 = v34;
      v17 = v16;
      if (v15)
      {
        if (v16)
        {
          v18 = v16;
        }
        else
        {
          -[VNRequestInstanceCreator errorForFailedInstanceCreationOfRequestClass:withCompletionHandler:](self, "errorForFailedInstanceCreationOfRequestClass:withCompletionHandler:", a3, v12);
          v33 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_21;
      }

    }
    v32 = a6;
    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    NSStringFromClass(a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (NSString *)objc_msgSend(v19, "initWithFormat:", CFSTR("new%@InstanceWithCompletionHandler:revision:error:"), v20);

    v22 = NSSelectorFromString(v21);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v23 = ((uint64_t (*)(VNRequestInstanceCreator *, SEL, id, unint64_t, id *))-[VNRequestInstanceCreator methodForSelector:](self, "methodForSelector:", v22))(self, v22, v12, a5, &v33);
    }
    else
    {
      if (!a3)
        goto LABEL_17;
      v24 = a3;
      while (1)
      {
        if (-[VNRequestInstanceCreator _isValidRequestClass:](a3))
        {
          v25 = objc_alloc(MEMORY[0x1E0CB3940]);
          NSStringFromClass(v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (NSString *)objc_msgSend(v25, "initWithFormat:", CFSTR("_new%@InstanceOfClass:withCompletionHandler:revision:error:"), v26);

          v28 = NSSelectorFromString(v27);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            break;
        }
        v24 = (objc_class *)-[objc_class superclass](v24, "superclass");
        if (!v24)
          goto LABEL_17;
      }
      if (!v28)
      {
LABEL_17:
        -[VNRequestInstanceCreator errorForFailedInstanceCreationOfRequestClass:withCompletionHandler:](self, "errorForFailedInstanceCreationOfRequestClass:withCompletionHandler:", a3, v12);
        v17 = 0;
        v33 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      v23 = ((uint64_t (*)(VNRequestInstanceCreator *, SEL, Class, id, unint64_t, id *))-[VNRequestInstanceCreator methodForSelector:](self, "methodForSelector:", v28))(self, v28, a3, v12, a5, &v33);
    }
    v17 = (void *)v23;
LABEL_18:
    a6 = v32;
LABEL_21:

    goto LABEL_22;
  }
  v17 = 0;
LABEL_22:

  v29 = v33;
  objc_autoreleasePoolPop(v11);
  if (v17)
  {
    v30 = v17;
  }
  else if (a6)
  {
    *a6 = objc_retainAutorelease(v29);
  }

  return v17;
}

- (BOOL)_isValidRequestClass:(void *)a1
{
  uint64_t v2;
  int v3;
  BOOL v4;
  Class v5;
  _BOOL8 result;

  v2 = objc_opt_class();
  v3 = objc_msgSend(a1, "isSubclassOfClass:", v2);
  v4 = (void *)v2 == a1 || v3 == 0;
  result = 0;
  if (!v4)
  {
    v5 = NSClassFromString(CFSTR("VNCompoundRequest"));
    if (!v5 || (objc_msgSend(a1, "isSubclassOfClass:", v5) & 1) == 0)
      return 1;
  }
  return result;
}

- (VNRequestInstanceCreator)init
{
  return -[VNRequestInstanceCreator initWithDelegate:](self, "initWithDelegate:", 0);
}

- (VNRequestInstanceCreator)initWithDelegate:(id)a3
{
  id v4;
  VNRequestInstanceCreator *v5;
  VNRequestInstanceCreator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VNRequestInstanceCreator;
  v5 = -[VNRequestInstanceCreator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (id)_newVNRequestInstanceOfClass:(Class)a3 withCompletionHandler:(id)a4 revision:(unint64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;

  v10 = a4;
  v11 = (void *)objc_msgSend([a3 alloc], "initWithCompletionHandler:", v10);
  v12 = v11;
  if (!v11)
  {
    if (a6)
    {
      -[VNRequestInstanceCreator errorForFailedInstanceCreationOfRequestClass:withCompletionHandler:](self, "errorForFailedInstanceCreationOfRequestClass:withCompletionHandler:", a3, v10);
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  if (a5 && !objc_msgSend(v11, "setRevision:error:", a5, a6))
    goto LABEL_7;
  v13 = v12;
LABEL_8:

  return v13;
}

- (id)newRequestInstanceForSpecifier:(id)a3 withCompletionHandler:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "requestClassAndReturnError:", a5);
  if (v10)
    v11 = -[VNRequestInstanceCreator newRequestInstanceOfClass:withCompletionHandler:revision:error:](self, "newRequestInstanceOfClass:withCompletionHandler:revision:error:", v10, v9, objc_msgSend(v8, "requestRevision"), a5);
  else
    v11 = 0;

  return v11;
}

- (id)errorForFailedInstanceCreationOfRequestClass:(Class)a3 withCompletionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  NSStringFromClass(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("A new %@ instance cannot be created"), v6);

  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.VN.Tests"), 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_newVNTargetedImageRequestInstanceOfClass:(Class)a3 withCompletionHandler:(id)a4 revision:(unint64_t)a5 error:(id *)a6
{
  if (a6)
  {
    -[VNRequestInstanceCreator errorForFailedInstanceCreationOfRequestClass:withCompletionHandler:](self, "errorForFailedInstanceCreationOfRequestClass:withCompletionHandler:", a3, a4, a5);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (id)defaultCreator
{
  if (defaultCreator_onceToken != -1)
    dispatch_once(&defaultCreator_onceToken, &__block_literal_global_1107);
  return (id)defaultCreator_defaultCreator;
}

void __42__VNRequestInstanceCreator_defaultCreator__block_invoke()
{
  VNRequestInstanceCreator *v0;
  void *v1;

  v0 = objc_alloc_init(VNRequestInstanceCreator);
  v1 = (void *)defaultCreator_defaultCreator;
  defaultCreator_defaultCreator = (uint64_t)v0;

}

@end
