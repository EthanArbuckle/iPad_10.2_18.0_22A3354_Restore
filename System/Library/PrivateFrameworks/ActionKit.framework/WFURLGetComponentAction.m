@implementation WFURLGetComponentAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v4 = a3;
  v5 = objc_opt_class();
  v6[4] = self;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__WFURLGetComponentAction_runAsynchronouslyWithInput___block_invoke;
  v7[3] = &unk_24F8B93F8;
  v7[4] = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__WFURLGetComponentAction_runAsynchronouslyWithInput___block_invoke_2;
  v6[3] = &unk_24F8BAFA8;
  objc_msgSend(v4, "transformFirstObjectRepresentationForClass:usingBlock:completionHandler:", v5, v7, v6);

}

void __54__WFURLGetComponentAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  void (**v9)(id, void *, id);
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v8 = a4;
  v9 = a5;
  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFURLComponent"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("Scheme")))
    {
      objc_msgSend(v14, "scheme");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("User")))
    {
      objc_msgSend(v14, "user");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Password")))
    {
      objc_msgSend(v14, "password");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Host")))
    {
      objc_msgSend(v14, "host");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("Port")))
      {
        objc_msgSend(v14, "port");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
        v9[2](v9, v13, v8);

        goto LABEL_21;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("Path")))
      {
        objc_msgSend(v14, "path");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Query")))
      {
        objc_msgSend(v14, "query");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("Fragment")))
        {
          v13 = 0;
          goto LABEL_20;
        }
        objc_msgSend(v14, "fragment");
        v11 = objc_claimAutoreleasedReturnValue();
      }
    }
    v13 = (void *)v11;
    goto LABEL_20;
  }
  v9[2](v9, 0, v8);
LABEL_21:

}

void __54__WFURLGetComponentAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end
