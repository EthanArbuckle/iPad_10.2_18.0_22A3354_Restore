@implementation _NUChannelPort

- (_NUChannelPort)initWithChannel:(id)a3
{
  id v5;
  _NUChannelPort *v6;
  NUMediaNode *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  NUSettingNode *v19;
  NUSchemaNode *v20;
  NUPipelineNode *node;
  uint64_t v22;
  NSHashTable *outputPorts;
  uint64_t v24;
  NSHashTable *subports;
  NSObject *v27;
  void *v28;
  void *specific;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  objc_super v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v52.receiver = self;
  v52.super_class = (Class)_NUChannelPort;
  v6 = -[_NUChannelPort init](&v52, sel_init);
  objc_storeStrong((id *)&v6->_channel, a3);
  switch(objc_msgSend(v5, "type"))
  {
    case 0:
    case 3:
      NUAssertLogger_4813();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid type for channel: %@"), v5);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v54 = v28;
        _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_4813();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v31)
        {
          v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v35 = (void *)MEMORY[0x1E0CB3978];
          v36 = v34;
          objc_msgSend(v35, "callStackSymbols");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = v34;
          v55 = 2114;
          v56 = v38;
          _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v31)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v54 = v33;
        _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[_NUChannelPort initWithChannel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 53, CFSTR("Invalid type for channel: %@"), v39, v40, v41, v42, (uint64_t)v5);
    case 1:
      v7 = [NUMediaNode alloc];
      +[NUPlaceholderNode emptyNode](NUPlaceholderNode, "emptyNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NURenderTagNode initWithInput:name:](v7, "initWithInput:name:", v8, v9);
      goto LABEL_13;
    case 2:
      objc_msgSend(v5, "format");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "controlType");
      switch(v11)
      {
        case 1:
          v19 = [NUSettingNode alloc];
          objc_msgSend(v8, "dataModel");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[NUSettingNode initWithSetting:](v19, "initWithSetting:", v9);
LABEL_13:
          node = v6->_node;
          v6->_node = (NUPipelineNode *)v10;

          break;
        case 2:
          v20 = [NUSchemaNode alloc];
          objc_msgSend(v8, "dataModel");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[NUSchemaNode initWithSchema:](v20, "initWithSchema:", v9);
          goto LABEL_13;
        case 0:
          NUAssertLogger_4813();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported channel control format: %@"), v8);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v54 = v13;
            _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

          }
          v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          NUAssertLogger_4813();
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
          if (v14)
          {
            if (v16)
            {
              v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
              v44 = (void *)MEMORY[0x1E0CB3978];
              v45 = v43;
              objc_msgSend(v44, "callStackSymbols");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v54 = v43;
              v55 = 2114;
              v56 = v47;
              _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

            }
          }
          else if (v16)
          {
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v54 = v18;
            _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          }
          _NUAssertFailHandler((uint64_t)"-[_NUChannelPort initWithChannel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 47, CFSTR("Unsupported channel control format: %@"), v48, v49, v50, v51, (uint64_t)v8);
      }

LABEL_15:
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 2);
      outputPorts = v6->_outputPorts;
      v6->_outputPorts = (NSHashTable *)v22;

      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 512, 2);
      subports = v6->_subports;
      v6->_subports = (NSHashTable *)v24;

      return v6;
    default:
      goto LABEL_15;
  }
}

- (NSArray)outputPorts
{
  void *v3;
  void *v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSHashTable allObjects](self->_outputPorts, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_subports;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "outputPorts", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (void)setInputPort:(id)a3
{
  _NUChannelPort *v4;
  _NUChannelPort *inputPort;
  void *v6;
  _NUChannelPort *v7;

  v4 = (_NUChannelPort *)a3;
  -[_NUChannelPort _removeOutputPort:](self->_inputPort, "_removeOutputPort:", self);
  inputPort = self->_inputPort;
  self->_inputPort = v4;
  v7 = v4;

  -[_NUChannelPort node](self->_inputPort, "node");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUPipelineNode setInputNode:](self->_node, "setInputNode:", v6);

  -[_NUChannelPort _addOutputPort:](self->_inputPort, "_addOutputPort:", self);
}

- (void)_addOutputPort:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *specific;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_4813();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "port != nil");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v6;
      _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4813();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v19;
        v40 = 2114;
        v41 = v23;
        _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v11;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUChannelPort _addOutputPort:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 79, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"port != nil");
  }
  v37 = v4;
  if (-[NSHashTable containsObject:](self->_outputPorts, "containsObject:", v4))
  {
    NUAssertLogger_4813();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Port is already connected: %@"), v37);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4813();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v16)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E0CB3978];
        v30 = v28;
        objc_msgSend(v29, "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v28;
        v40 = 2114;
        v41 = v32;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUChannelPort _addOutputPort:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 80, CFSTR("Port is already connected: %@"), v33, v34, v35, v36, (uint64_t)v37);
  }
  -[NSHashTable addObject:](self->_outputPorts, "addObject:", v37);

}

- (void)_removeOutputPort:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *specific;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_4813();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "port != nil");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v6;
      _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4813();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v19;
        v40 = 2114;
        v41 = v23;
        _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v11;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUChannelPort _removeOutputPort:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 85, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"port != nil");
  }
  v37 = v4;
  if (!-[NSHashTable containsObject:](self->_outputPorts, "containsObject:", v4))
  {
    NUAssertLogger_4813();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not a connected port: %@"), v37);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4813();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v16)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E0CB3978];
        v30 = v28;
        objc_msgSend(v29, "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v28;
        v40 = 2114;
        v41 = v32;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUChannelPort _removeOutputPort:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 86, CFSTR("Not a connected port: %@"), v33, v34, v35, v36, (uint64_t)v37);
  }
  -[NSHashTable removeObject:](self->_outputPorts, "removeObject:", v37);

}

- (id)subportForKey:(id)a3
{
  id v4;
  id v5;
  _NUChannelPort *v6;
  void *v7;
  void *v8;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_4813();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "key != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4813();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E0CB3978];
        v19 = v17;
        objc_msgSend(v18, "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v17;
        v28 = 2114;
        v29 = v21;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUChannelPort subportForKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 91, CFSTR("Invalid parameter not satisfying: %s"), v22, v23, v24, v25, (uint64_t)"key != nil");
  }
  v5 = v4;
  PFFind();
  v6 = (_NUChannelPort *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[NUChannel subchannelForKey:](self->_channel, "subchannelForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v6 = -[_NUChannelPort initWithChannel:]([_NUChannelPort alloc], "initWithChannel:", v7);
    else
      v6 = 0;
    -[_NUChannelPort setSuperport:](v6, "setSuperport:", self);
    -[_NUChannelPort pipeline](self, "pipeline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NUChannelPort setPipeline:](v6, "setPipeline:", v8);

    -[NSHashTable addObject:](self->_subports, "addObject:", v6);
  }

  return v6;
}

- (NSArray)subports
{
  void *v2;
  void *v3;

  -[NSHashTable allObjects](self->_subports, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_4811);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (_NUChannelPort)rootPort
{
  _NUChannelPort *v2;
  void *v3;
  _NUChannelPort *v4;
  void *v5;

  v2 = self;
  -[_NUChannelPort superport](v2, "superport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      -[_NUChannelPort superport](v2, "superport");
      v4 = (_NUChannelPort *)objc_claimAutoreleasedReturnValue();

      -[_NUChannelPort superport](v4, "superport");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  return v4;
}

- (NSString)name
{
  id v3;
  _NUChannelPort *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = self;
  do
  {
    -[_NUChannelPort channel](v4, "channel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "insertObject:atIndex:", v6, 0);

    -[_NUChannelPort superport](v4, "superport");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (_NUChannelPort *)v7;
  }
  while (v7);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_NUChannelPort pipeline](self, "pipeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUChannelPort name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_NUChannelPort pipeline](self, "pipeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUChannelPort name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p pipeline:'%@' name:'%@' node:%@>"), v4, self, v6, v7, self->_node);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)address
{
  id v3;
  _NUChannelPort *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _NUChannelPort *v10;
  void *v11;
  void *v12;
  void *v13;
  _NUChannelPort *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = self;
  -[_NUChannelPort superport](v4, "superport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    do
    {
      -[_NUChannelPort superport](v4, "superport");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "subports");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v4);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "insertObject:atIndex:", v9, 0);

      -[_NUChannelPort superport](v4, "superport");
      v10 = (_NUChannelPort *)objc_claimAutoreleasedReturnValue();

      -[_NUChannelPort superport](v10, "superport");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v10;
    }
    while (v11);
  }
  else
  {
    v10 = v4;
  }
  -[_NUChannelPort pipeline](v10, "pipeline");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUChannelPort channel](v10, "channel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "outputPortForChannel:", v13);
  v14 = (_NUChannelPort *)objc_claimAutoreleasedReturnValue();

  -[_NUChannelPort pipeline](v10, "pipeline");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 == v10)
    objc_msgSend(v15, "outputChannels");
  else
    objc_msgSend(v15, "inputChannels");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUChannelPort channel](v10, "channel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "indexOfObject:", v18);

  if (v14 == v10)
  {

    -[_NUChannelPort pipeline](v10, "pipeline");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inputChannels");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "count");
  }
  else
  {
    v20 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20 + v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertObject:atIndex:", v21, 0);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("."));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v22;
}

- (NSString)compactDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_NUChannelPort pipeline](self, "pipeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alias");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUChannelPort address](self, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)bindTo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[_NUChannelPort node](self, "node");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "bindTo:error:", v6, a4);

  return (char)a4;
}

- (id)evaluate:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[_NUChannelPort node](self, "node");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUChannelPort channel](self, "channel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "evaluateDataWithFormat:error:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NUChannel)channel
{
  return self->_channel;
}

- (NUPipelineNode)node
{
  return self->_node;
}

- (_NUChannelPort)inputPort
{
  return self->_inputPort;
}

- (_NUPipeline)pipeline
{
  return self->_pipeline;
}

- (void)setPipeline:(id)a3
{
  self->_pipeline = (_NUPipeline *)a3;
}

- (_NUChannelPort)superport
{
  return self->_superport;
}

- (void)setSuperport:(id)a3
{
  self->_superport = (_NUChannelPort *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputPort, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_subports, 0);
  objc_storeStrong((id *)&self->_outputPorts, 0);
}

@end
