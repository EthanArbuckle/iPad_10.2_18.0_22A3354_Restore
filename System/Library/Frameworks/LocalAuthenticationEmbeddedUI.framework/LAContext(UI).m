@implementation LAContext(UI)

- (void)setUiHelper:()UI
{
  objc_setAssociatedObject(a1, sel_uiHelper, a3, (void *)1);
}

- (id)uiHelper
{
  return objc_getAssociatedObject(a1, sel_uiHelper);
}

- (void)evaluateAccessControl:()UI operation:options:presentationContext:reply:
{
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27[3];
  char v28;
  id location;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(v12, "objectForKeyedSubscript:", &unk_24FDDD940);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  v17 = (void *)objc_msgSend(v12, "mutableCopy");
  objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], &unk_24FDDD940);
  objc_initWeak(&location, a1);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __83__LAContext_UI__evaluateAccessControl_operation_options_presentationContext_reply___block_invoke;
  v22[3] = &unk_24FDCD690;
  v28 = v16;
  v18 = v14;
  v26 = v18;
  objc_copyWeak(v27, &location);
  v19 = v13;
  v23 = v19;
  v27[1] = a3;
  v27[2] = a4;
  v20 = v12;
  v24 = v20;
  v21 = v17;
  v25 = v21;
  objc_msgSend(a1, "evaluateAccessControl:operation:options:reply:", a3, a4, v21, v22);

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

}

- (void)_authenticateWithOptions:()UI acl:availableMechanisms:hostVC:context:operation:updatedOptions:reply:
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28[3];
  id location;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v21 = a10;
  objc_initWeak(&location, a1);
  objc_msgSend(a1, "uiHelper");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __112__LAContext_UI___authenticateWithOptions_acl_availableMechanisms_hostVC_context_operation_updatedOptions_reply___block_invoke;
  v25[3] = &unk_24FDCD6B8;
  objc_copyWeak(v28, &location);
  v23 = v21;
  v27 = v23;
  v28[1] = a4;
  v28[2] = a8;
  v24 = v20;
  v26 = v24;
  objc_msgSend(v22, "authenticateWithOptions:availableMechanisms:hostVC:context:reply:", v16, v17, v18, v19, v25);

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);

}

- (void)_validateAvailableMechanims:()UI completion:
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "containsObject:", &unk_24FDDD958))
  {
    v7 = v5;
    v8 = v6;
    TCCAccessRequest();

  }
  else
  {
    (*((void (**)(id, id))v6 + 2))(v6, v5);
  }

}

@end
