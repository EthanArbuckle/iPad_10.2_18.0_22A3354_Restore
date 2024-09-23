@implementation CHUISWidgetLaunchRequest

- (CHUISWidgetLaunchRequest)initWithLaunchAction:(id)a3 effectiveContainerBundleIdentifier:(id)a4 isEntitledToOpenSystemProcesses:(BOOL)a5
{
  id v9;
  id v10;
  CHUISWidgetLaunchRequest *v11;
  CHUISWidgetLaunchRequest *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHUISWidgetLaunchRequest;
  v11 = -[CHUISWidgetLaunchRequest init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_launchAction, a3);
    objc_storeStrong((id *)&v12->_effectiveContainerBundleIdentifier, a4);
    v12->_isEntitledToOpenSystemProcesses = a5;
  }

  return v12;
}

- (NSURL)url
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[BSAction url](self->_launchAction, "url");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSURL *)v3;
}

- (id)userActivityData
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[BSAction userActivityData](self->_launchAction, "userActivityData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSUserActivity)newUserActivity
{
  void *v2;
  NSUserActivity *v3;

  -[CHUISWidgetLaunchRequest userActivityData](self, "userActivityData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (NSUserActivity *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityData:", v2);
  else
    v3 = 0;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHUISWidgetLaunchRequest initWithLaunchAction:effectiveContainerBundleIdentifier:isEntitledToOpenSystemProcesses:]([CHUISWidgetLaunchRequest alloc], "initWithLaunchAction:effectiveContainerBundleIdentifier:isEntitledToOpenSystemProcesses:", self->_launchAction, self->_effectiveContainerBundleIdentifier, self->_isEntitledToOpenSystemProcesses);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (CHUISWidgetLaunchRequest)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CHUISWidgetLaunchRequest *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("effectiveContainerBundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEntitledToOpenSystemProcesses"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launchAction"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CHUISWidgetLaunchRequest initWithLaunchAction:effectiveContainerBundleIdentifier:isEntitledToOpenSystemProcesses:](self, "initWithLaunchAction:effectiveContainerBundleIdentifier:isEntitledToOpenSystemProcesses:", v7, v5, v6);

  return v8;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_effectiveContainerBundleIdentifier, CFSTR("effectiveContainerBundleIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_launchAction, CFSTR("launchAction"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isEntitledToOpenSystemProcesses, CFSTR("isEntitledToOpenSystemProcesses"));

}

- (id)_stateDumpDescription
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  CHUISWidgetLaunchRequest *v16;
  _QWORD v17[4];
  id v18;
  CHUISWidgetLaunchRequest *v19;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__CHUISWidgetLaunchRequest__stateDumpDescription__block_invoke;
  v17[3] = &unk_1E6B84B40;
  v5 = v3;
  v18 = v5;
  v19 = self;
  v6 = (id)objc_msgSend(v5, "modifyProem:", v17);
  v11 = v4;
  v12 = 3221225472;
  v13 = __49__CHUISWidgetLaunchRequest__stateDumpDescription__block_invoke_2;
  v14 = &unk_1E6B84B40;
  v7 = v5;
  v15 = v7;
  v16 = self;
  v8 = (id)objc_msgSend(v7, "modifyBody:", &v11);
  objc_msgSend(v7, "build", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __49__CHUISWidgetLaunchRequest__stateDumpDescription__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("launchAction"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("effectiveContainerBundleIdentifier"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("isEntitledToOpenSystemProcesses"));
}

void __49__CHUISWidgetLaunchRequest__stateDumpDescription__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "appendObject:withName:");

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "effectiveContainerBundleIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:");

  v6 = *(void **)(a1 + 32);
  v10 = (id)objc_msgSend(*(id *)(a1 + 40), "newUserActivity");
  v7 = (id)objc_msgSend(v6, "appendObject:withName:");

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  NSString *effectiveContainerBundleIdentifier;
  uint64_t v11;
  id v12;
  id v13;
  _BOOL8 isEntitledToOpenSystemProcesses;
  id v15;
  id v16;
  BSAction *launchAction;
  id v18;
  char v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v4;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (v9)
  {
    effectiveContainerBundleIdentifier = self->_effectiveContainerBundleIdentifier;
    v11 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __36__CHUISWidgetLaunchRequest_isEqual___block_invoke;
    v25[3] = &unk_1E6B84D88;
    v12 = v9;
    v26 = v12;
    v13 = (id)objc_msgSend(v5, "appendString:counterpart:", effectiveContainerBundleIdentifier, v25);
    isEntitledToOpenSystemProcesses = self->_isEntitledToOpenSystemProcesses;
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __36__CHUISWidgetLaunchRequest_isEqual___block_invoke_2;
    v23[3] = &unk_1E6B84C90;
    v15 = v12;
    v24 = v15;
    v16 = (id)objc_msgSend(v5, "appendBool:counterpart:", isEntitledToOpenSystemProcesses, v23);
    launchAction = self->_launchAction;
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __36__CHUISWidgetLaunchRequest_isEqual___block_invoke_3;
    v21[3] = &unk_1E6B84D50;
    v22 = v15;
    v18 = (id)objc_msgSend(v5, "appendObject:counterpart:", launchAction, v21);
    v19 = objc_msgSend(v5, "isEqual");

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

id __36__CHUISWidgetLaunchRequest_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

uint64_t __36__CHUISWidgetLaunchRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
}

id __36__CHUISWidgetLaunchRequest_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_launchAction);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_effectiveContainerBundleIdentifier);
  v6 = (id)objc_msgSend(v3, "appendBool:", self->_isEntitledToOpenSystemProcesses);
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (NSString)effectiveContainerBundleIdentifier
{
  return self->_effectiveContainerBundleIdentifier;
}

- (BOOL)isEntitledToOpenSystemProcesses
{
  return self->_isEntitledToOpenSystemProcesses;
}

- (BSAction)launchAction
{
  return self->_launchAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchAction, 0);
  objc_storeStrong((id *)&self->_effectiveContainerBundleIdentifier, 0);
}

@end
