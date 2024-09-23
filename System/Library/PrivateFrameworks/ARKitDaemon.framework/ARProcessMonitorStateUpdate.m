@implementation ARProcessMonitorStateUpdate

- (ARProcessMonitorStateUpdate)initWithRBSProcessStateUpdate:(id)a3
{
  id v5;
  ARProcessMonitorStateUpdate *v6;
  ARProcessMonitorStateUpdate *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *name;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 isVisible;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ARProcessMonitorStateUpdate;
  v6 = -[ARProcessMonitorStateUpdate init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_update, a3);
    objc_msgSend(v5, "process");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_pid = objc_msgSend(v8, "pid");

    objc_msgSend(v5, "process");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    name = v7->_name;
    v7->_name = (NSString *)v11;

    objc_msgSend(v5, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endowmentNamespaces");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_isVisible = objc_msgSend(v14, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

    objc_msgSend(v5, "state");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    isVisible = v7->_isVisible;
    switch(objc_msgSend(v15, "taskState"))
    {
      case 1u:
        v17 = 1;
        break;
      case 2u:
      case 4u:
        v17 = 3;
        if (!isVisible)
          v17 = 4;
        break;
      case 3u:
        v17 = 2;
        break;
      default:
        v17 = 0;
        break;
    }
    v7->_taskState = v17;

    objc_msgSend(v5, "state");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "debugState");
    if ((v19 - 1) < 3)
      v20 = (v19 - 1) + 1;
    else
      v20 = 0;
    v7->_debugState = v20;

  }
  return v7;
}

- (ARProcessMonitorStateUpdate)initWithARProcessTaskState:(int64_t)a3
{
  ARProcessMonitorStateUpdate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARProcessMonitorStateUpdate;
  result = -[ARProcessMonitorStateUpdate init](&v5, sel_init);
  if (result)
    result->_taskState = a3;
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = self->_taskState - 1;
  if (v7 > 3)
    v8 = CFSTR("ARProcessTaskStateUnknown");
  else
    v8 = off_250702880[v7];
  v9 = self->_debugState - 1;
  if (v9 > 2)
    v10 = CFSTR("ARProcessDebugStateUnknown");
  else
    v10 = off_2507028A0[v9];
  if (self->_isVisible)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p | %@(%d) visible=%@ taskState=%@ debugState=%@"), v5, self, self->_name, self->_pid, v11, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (int)pid
{
  return self->_pid;
}

- (int64_t)taskState
{
  return self->_taskState;
}

- (int64_t)debugState
{
  return self->_debugState;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_update, 0);
}

@end
