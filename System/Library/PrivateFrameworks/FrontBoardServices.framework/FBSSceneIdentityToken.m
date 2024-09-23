@implementation FBSSceneIdentityToken

- (BOOL)isEqual:(id)a3
{
  FBSSceneIdentityToken *v4;
  FBSSceneIdentityToken *v5;
  FBSSceneIdentityToken *v6;
  char v7;

  v4 = (FBSSceneIdentityToken *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  if (self == v4)
  {
    v7 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    if (self->_host == v6->_host
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualStrings())
    {
      v7 = BSEqualStrings();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
LABEL_9:
    v7 = 0;
  }
LABEL_13:

  return v7;
}

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (NSString)description
{
  return self->_stringRepresentation;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_stringRepresentation, "hash");
}

+ (FBSSceneIdentityToken)tokenWithHostEndpoint:(id)a3 workspace:(id)a4 identifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  id v15;
  id v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v7;
  NSClassFromString(CFSTR("BSServiceConnectionEndpoint"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneIdentityToken tokenWithHostEndpoint:workspace:identifier:].cold.1();
LABEL_29:
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E7340);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSServiceConnectionEndpointClass]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneIdentityToken tokenWithHostEndpoint:workspace:identifier:].cold.1();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E73A4);
  }

  +[FBSWorkspaceServiceSpecification identifier](FBSWorkspaceServiceSpecification, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("endpoint specified the wrong service : %@"), v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneIdentityToken tokenWithHostEndpoint:workspace:identifier:].cold.6();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E7400);
  }
  v14 = v8;
  NSClassFromString(CFSTR("NSString"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneIdentityToken tokenWithHostEndpoint:workspace:identifier:].cold.2();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E7464);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneIdentityToken tokenWithHostEndpoint:workspace:identifier:].cold.2();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E74C8);
  }

  v15 = v9;
  NSClassFromString(CFSTR("NSString"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneIdentityToken tokenWithHostEndpoint:workspace:identifier:].cold.3();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E752CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneIdentityToken tokenWithHostEndpoint:workspace:identifier:].cold.3();
    goto LABEL_29;
  }

  v16 = -[FBSSceneIdentityToken _initWithHost:endpoint:target:workspace:identifier:]([FBSSceneIdentityToken alloc], 0, v10, 0, v14, v15);
  return (FBSSceneIdentityToken *)v16;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (FBSSceneIdentityToken)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FBSSceneIdentityToken *v10;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("h"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("e"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("t"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("w"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("i"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (FBSSceneIdentityToken *)-[FBSSceneIdentityToken _initWithHost:endpoint:target:workspace:identifier:](self, v5, v6, v7, v8, v9);
  return v10;
}

- (FBSSceneIdentityToken)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FBSSceneIdentityToken *v10;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("h"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("e"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("t"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("w"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (FBSSceneIdentityToken *)-[FBSSceneIdentityToken _initWithHost:endpoint:target:workspace:identifier:](self, v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  BSServiceConnectionEndpoint *endpoint;
  RBSProcessIdentity *target;
  NSString *workspace;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_host >= 1)
  {
    objc_msgSend(v4, "encodeInt64:forKey:");
    v4 = v8;
  }
  endpoint = self->_endpoint;
  if (endpoint)
  {
    objc_msgSend(v8, "encodeObject:forKey:", endpoint, CFSTR("e"));
    v4 = v8;
  }
  target = self->_target;
  if (target)
  {
    objc_msgSend(v8, "encodeObject:forKey:", target, CFSTR("t"));
    v4 = v8;
  }
  workspace = self->_workspace;
  if (workspace)
  {
    objc_msgSend(v8, "encodeObject:forKey:", workspace, CFSTR("w"));
    v4 = v8;
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("i"));

}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  BSServiceConnectionEndpoint *endpoint;
  RBSProcessIdentity *target;
  NSString *workspace;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_host >= 1)
  {
    objc_msgSend(v4, "encodeInt64:forKey:");
    v4 = v8;
  }
  endpoint = self->_endpoint;
  if (endpoint)
  {
    objc_msgSend(v8, "encodeObject:forKey:", endpoint, CFSTR("e"));
    v4 = v8;
  }
  target = self->_target;
  if (target)
  {
    objc_msgSend(v8, "encodeObject:forKey:", target, CFSTR("t"));
    v4 = v8;
  }
  workspace = self->_workspace;
  if (workspace)
  {
    objc_msgSend(v8, "encodeObject:forKey:", workspace, CFSTR("w"));
    v4 = v8;
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("i"));

}

- (FBSSceneIdentityToken)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSSceneIdentityToken *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSSceneIdentityToken *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on FBSSceneIdentityToken"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("FBSSceneIdentityToken.m");
    v17 = 1024;
    v18 = 43;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSSceneIdentityToken *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (FBSSceneIdentityToken)tokenWithHostPID:(int)a3 viewServiceSessionIdentifier:(id)a4
{
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v9;
  void *v10;

  v4 = *(void **)&a3;
  v5 = a4;
  if ((int)v4 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid host pid : %i"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneIdentityToken tokenWithHostPID:viewServiceSessionIdentifier:].cold.1();
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71658CLL);
  }
  v6 = v5;
  NSClassFromString(CFSTR("NSString"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneIdentityToken tokenWithHostPID:viewServiceSessionIdentifier:].cold.2();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7165F0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneIdentityToken tokenWithHostPID:viewServiceSessionIdentifier:].cold.2();
    goto LABEL_13;
  }

  v7 = -[FBSSceneIdentityToken _initWithHost:endpoint:target:workspace:identifier:]([FBSSceneIdentityToken alloc], v4, 0, 0, 0, v6);
  return (FBSSceneIdentityToken *)v7;
}

- (id)_initWithHost:(void *)a3 endpoint:(void *)a4 target:(void *)a5 workspace:(void *)a6 identifier:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  _DWORD *v54;
  id v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  int v80;
  objc_super v81;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!a1)
  {
    v64 = 0;
    goto LABEL_45;
  }
  if ((int)a2 < 1)
  {
    if ((_DWORD)a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithHost_endpoint_target_workspace_identifier_, a1, CFSTR("FBSSceneIdentityToken.m"), 79, CFSTR("invalid host pid=%i"), a2);

      if (!v11)
        goto LABEL_52;
    }
    else if (!v11)
    {
      goto LABEL_52;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
LABEL_19:
      +[FBSWorkspaceServiceSpecification identifier](FBSWorkspaceServiceSpecification, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "service");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqualToString:", v31);

      if ((v32 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithHost_endpoint_target_workspace_identifier_, a1, CFSTR("FBSSceneIdentityToken.m"), 81, CFSTR("endpoint specified the wrong service : %@"), v11);

      }
      v80 = (int)a2;
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithHost_endpoint_target_workspace_identifier_, a1, CFSTR("FBSSceneIdentityToken.m"), 82, CFSTR("invalid target : %@"), v12);

      }
      if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithHost_endpoint_target_workspace_identifier_, a1, CFSTR("FBSSceneIdentityToken.m"), 83, CFSTR("invalid workspace : %@"), v13);

      }
      if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithHost_endpoint_target_workspace_identifier_, a1, CFSTR("FBSSceneIdentityToken.m"), 84, CFSTR("invalid identifier='%@'"), v14);

      }
      v78 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v11, "targetDescription");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x1E0CB3500];
      v34 = v13;
      v35 = v13;
      v36 = v11;
      v37 = a1;
      v38 = v34;
      objc_msgSend(v33, "URLHostAllowedCharacterSet");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringByAddingPercentEncodingWithAllowedCharacters:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v40, "isEqualToString:", v38))
        v41 = v38;
      else
        v41 = v40;
      v42 = v41;

      v43 = (void *)MEMORY[0x1E0CB3500];
      v44 = v14;
      objc_msgSend(v43, "URLHostAllowedCharacterSet");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringByAddingPercentEncodingWithAllowedCharacters:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v46, "isEqualToString:", v44))
        v47 = v44;
      else
        v47 = v46;
      a2 = v47;

      a1 = v37;
      v11 = v36;
      v13 = v35;
      objc_msgSend(v78, "stringWithFormat:", CFSTR("%@/%@:%@"), v22, v42, a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(a2) = v80;
      goto LABEL_42;
    }
LABEL_52:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithHost_endpoint_target_workspace_identifier_, a1, CFSTR("FBSSceneIdentityToken.m"), 80, CFSTR("invalid endpoint : %@"), v11);

    goto LABEL_19;
  }
  if (v12)
  {
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithHost_endpoint_target_workspace_identifier_, a1, CFSTR("FBSSceneIdentityToken.m"), 68, CFSTR("invalid direct identity endpoint : %@"), v11);

      if (v13)
      {
LABEL_6:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_7;
      }
    }
    else if (v13)
    {
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithHost_endpoint_target_workspace_identifier_, a1, CFSTR("FBSSceneIdentityToken.m"), 69, CFSTR("invalid direct identity workspace : %@"), v13);

LABEL_7:
    v79 = v11;
    if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithHost_endpoint_target_workspace_identifier_, a1, CFSTR("FBSSceneIdentityToken.m"), 70, CFSTR("invalid direct identity identifier='%@'"), v14);

    }
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (void *)MEMORY[0x1E0CB3500];
    v17 = v13;
    objc_msgSend(v16, "URLHostAllowedCharacterSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAddingPercentEncodingWithAllowedCharacters:", v18);
    v19 = a1;
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "isEqualToString:", v17))
      v21 = v17;
    else
      v21 = v20;
    v22 = v21;

    v23 = (void *)MEMORY[0x1E0CB3500];
    v24 = v14;
    objc_msgSend(v23, "URLHostAllowedCharacterSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByAddingPercentEncodingWithAllowedCharacters:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "isEqualToString:", v24))
      v27 = v24;
    else
      v27 = v26;
    v28 = v27;

    a1 = v19;
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%i->%@/%@:%@"), a2, v12, v22, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v79;
    goto LABEL_42;
  }
  if (!v11)
  {
    if (!v13)
      goto LABEL_36;
LABEL_54:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithHost_endpoint_target_workspace_identifier_, a1, CFSTR("FBSSceneIdentityToken.m"), 74, CFSTR("invalid view-service identity workspace : %@"), v13);

    if (!v14)
      goto LABEL_55;
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithHost_endpoint_target_workspace_identifier_, a1, CFSTR("FBSSceneIdentityToken.m"), 73, CFSTR("invalid view-service identity endpoint : %@"), v11);

  if (v13)
    goto LABEL_54;
LABEL_36:
  if (!v14)
  {
LABEL_55:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithHost_endpoint_target_workspace_identifier_, a1, CFSTR("FBSSceneIdentityToken.m"), 75, CFSTR("invalid view-service identifier='%@'"), v14);

    goto LABEL_38;
  }
LABEL_37:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_55;
LABEL_38:
  v48 = (void *)MEMORY[0x1E0CB3940];
  v49 = (void *)MEMORY[0x1E0CB3500];
  v50 = v14;
  objc_msgSend(v49, "URLHostAllowedCharacterSet");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "stringByAddingPercentEncodingWithAllowedCharacters:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v52, "isEqualToString:", v50))
    v53 = v50;
  else
    v53 = v52;
  v22 = v53;

  objc_msgSend(v48, "stringWithFormat:", CFSTR("%i/view-service:%@"), a2, v22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_42:

  v81.receiver = a1;
  v81.super_class = (Class)FBSSceneIdentityToken;
  v54 = objc_msgSendSuper2(&v81, sel_init);
  v55 = v54;
  if (v54)
  {
    v54[12] = (_DWORD)a2;
    v56 = objc_msgSend(v11, "copy");
    v57 = (void *)*((_QWORD *)v55 + 1);
    *((_QWORD *)v55 + 1) = v56;

    v58 = objc_msgSend(v12, "copy");
    v59 = (void *)*((_QWORD *)v55 + 2);
    *((_QWORD *)v55 + 2) = v58;

    v60 = objc_msgSend(v13, "copy");
    v61 = (void *)*((_QWORD *)v55 + 3);
    *((_QWORD *)v55 + 3) = v60;

    v62 = objc_msgSend(v14, "copy");
    v63 = (void *)*((_QWORD *)v55 + 4);
    *((_QWORD *)v55 + 4) = v62;

    objc_storeStrong((id *)v55 + 5, v29);
  }
  v64 = v55;

LABEL_45:
  return v64;
}

+ (FBSSceneIdentityToken)tokenWithHostPID:(int)a3 directEndpointTarget:(id)a4 workspace:(id)a5 identifier:(id)a6
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v8 = *(void **)&a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if ((int)v8 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid host pid : %i"), v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneIdentityToken tokenWithHostPID:directEndpointTarget:workspace:identifier:].cold.1();
LABEL_29:
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A716FBCLL);
  }
  v12 = v11;
  v13 = v9;
  NSClassFromString(CFSTR("RBSProcessIdentity"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneIdentityToken tokenWithHostPID:directEndpointTarget:workspace:identifier:].cold.2();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A717020);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:RBSProcessIdentityClass]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneIdentityToken tokenWithHostPID:directEndpointTarget:workspace:identifier:].cold.2();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A717084);
  }

  v14 = v10;
  NSClassFromString(CFSTR("NSString"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneIdentityToken tokenWithHostPID:directEndpointTarget:workspace:identifier:].cold.3();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7170E8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneIdentityToken tokenWithHostPID:directEndpointTarget:workspace:identifier:].cold.3();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71714CLL);
  }

  v15 = v12;
  NSClassFromString(CFSTR("NSString"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneIdentityToken tokenWithHostPID:directEndpointTarget:workspace:identifier:].cold.4();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7171B0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneIdentityToken tokenWithHostPID:directEndpointTarget:workspace:identifier:].cold.4();
    goto LABEL_29;
  }

  v16 = -[FBSSceneIdentityToken _initWithHost:endpoint:target:workspace:identifier:]([FBSSceneIdentityToken alloc], v8, 0, v13, v14, v15);
  return (FBSSceneIdentityToken *)v16;
}

+ (id)pseudoTokenWithIdentifier:(id)a3
{
  id v3;
  FBSSceneIdentityToken *v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;

  v3 = a3;
  v4 = [FBSSceneIdentityToken alloc];
  v5 = (void *)getpid();
  v6 = -[FBSSceneIdentityToken _initWithHost:endpoint:target:workspace:identifier:](v4, v5, 0, 0, 0, v3);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (void *)MEMORY[0x1E0CB3500];
    v10 = *((unsigned int *)v6 + 12);
    v11 = v3;
    objc_msgSend(v9, "URLHostAllowedCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "isEqualToString:", v11))
      v14 = v11;
    else
      v14 = v13;
    v15 = v14;

    objc_msgSend(v8, "stringWithFormat:", CFSTR("%i/psuedo:%@"), v10, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v7[5];
    v7[5] = v16;

  }
  return v7;
}

- (BSServiceConnectionEndpoint)hostEndpoint
{
  return self->_endpoint;
}

- (NSString)debugDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, self->_stringRepresentation);
}

- (FBSSceneIdentityToken)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *int64;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FBSSceneIdentityToken *v11;

  v4 = a3;
  objc_msgSend(CFSTR("t"), "UTF8String");
  BSDeserializeDataFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  int64 = (void *)xpc_dictionary_get_int64(v4, (const char *)objc_msgSend(CFSTR("h"), "UTF8String"));
  objc_msgSend(CFSTR("e"), "UTF8String");
  BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D87D80], "bs_secureDecodedFromData:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(CFSTR("w"), "UTF8String");
  BSDeserializeStringFromXPCDictionaryWithKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("i"), "UTF8String");
  BSDeserializeStringFromXPCDictionaryWithKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (FBSSceneIdentityToken *)-[FBSSceneIdentityToken _initWithHost:endpoint:target:workspace:identifier:](self, int64, v7, v8, v9, v10);

  if (v5)
  return v11;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  RBSProcessIdentity *target;
  void *v6;
  xpc_object_t xdict;

  v4 = a3;
  if (v4)
  {
    xdict = v4;
    if (self->_host >= 1)
      xpc_dictionary_set_int64(v4, (const char *)objc_msgSend(CFSTR("h"), "UTF8String"), self->_host);
    if (self->_endpoint)
    {
      objc_msgSend(CFSTR("e"), "UTF8String");
      BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    }
    target = self->_target;
    if (target)
    {
      -[RBSProcessIdentity bs_secureEncoded](target, "bs_secureEncoded");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("t"), "UTF8String");
      BSSerializeDataToXPCDictionaryWithKey();

    }
    if (self->_workspace)
    {
      objc_msgSend(CFSTR("w"), "UTF8String");
      BSSerializeStringToXPCDictionaryWithKey();
    }
    objc_msgSend(CFSTR("i"), "UTF8String");
    BSSerializeStringToXPCDictionaryWithKey();
    v4 = xdict;
  }

}

+ (void)tokenWithHostPID:viewServiceSessionIdentifier:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)tokenWithHostPID:viewServiceSessionIdentifier:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)tokenWithHostEndpoint:workspace:identifier:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)tokenWithHostEndpoint:workspace:identifier:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)tokenWithHostEndpoint:workspace:identifier:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)tokenWithHostEndpoint:workspace:identifier:.cold.6()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)tokenWithHostPID:directEndpointTarget:workspace:identifier:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)tokenWithHostPID:directEndpointTarget:workspace:identifier:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)tokenWithHostPID:directEndpointTarget:workspace:identifier:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)tokenWithHostPID:directEndpointTarget:workspace:identifier:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
