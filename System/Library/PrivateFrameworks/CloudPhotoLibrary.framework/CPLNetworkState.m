@implementation CPLNetworkState

- (CPLNetworkState)initWithNetworkPath:(id)a3 cellularRestricted:(BOOL)a4 inAirplaneMode:(BOOL)a5
{
  id v9;
  CPLNetworkState *v10;
  CPLNetworkState *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLNetworkState;
  v10 = -[CPLNetworkState init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_networkPath, a3);
    v11->_cellularRestricted = a4;
    v11->_inAirplaneMode = a5;
  }

  return v11;
}

- (BOOL)isConnected
{
  NSObject *networkPath;

  networkPath = self->_networkPath;
  return !networkPath || ((nw_path_get_status(networkPath) - 1) & 0xFFFFFFFD) == 0;
}

- (BOOL)isCellular
{
  NSObject *networkPath;

  networkPath = self->_networkPath;
  return !networkPath || nw_path_uses_interface_type(networkPath, nw_interface_type_cellular);
}

- (BOOL)isConstrained
{
  NSObject *networkPath;

  networkPath = self->_networkPath;
  if (networkPath)
    LOBYTE(networkPath) = nw_path_is_constrained(networkPath);
  return (char)networkPath;
}

- (BOOL)canUseNetwork
{
  _BOOL4 v3;

  v3 = -[CPLNetworkState isConnected](self, "isConnected");
  if (v3)
  {
    if (-[CPLNetworkState isConstrained](self, "isConstrained")
      || -[CPLNetworkState isInAirplaneMode](self, "isInAirplaneMode"))
    {
      LOBYTE(v3) = 0;
    }
    else if (-[CPLNetworkState isCellular](self, "isCellular"))
    {
      LOBYTE(v3) = !-[CPLNetworkState isCellularRestricted](self, "isCellularRestricted");
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (id)description
{
  id v3;
  const __CFString *v4;
  __CFString *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  if (self->_networkPath)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[CPLNetworkState isInAirplaneMode](self, "isInAirplaneMode"))
      objc_msgSend(v3, "addObject:", CFSTR("airplane mode"));
    if (!-[CPLNetworkState isConnected](self, "isConnected"))
    {
      if (!objc_msgSend(v3, "count"))
      {
        v5 = CFSTR("not connected to network");
        goto LABEL_21;
      }
      v6 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "initWithFormat:", CFSTR("not connected to network (%@)"), v7);
LABEL_18:
      v5 = (__CFString *)v8;

LABEL_21:
      return v5;
    }
    if (-[CPLNetworkState isCellular](self, "isCellular"))
    {
      objc_msgSend(v3, "addObject:", CFSTR("cellular"));
      if (-[CPLNetworkState isCellularRestricted](self, "isCellularRestricted"))
      {
        v4 = CFSTR("restricted");
LABEL_13:
        objc_msgSend(v3, "addObject:", v4);
      }
    }
    else if (nw_path_is_expensive((nw_path_t)self->_networkPath))
    {
      v4 = CFSTR("expensive");
      goto LABEL_13;
    }
    if (-[CPLNetworkState isConstrained](self, "isConstrained"))
      objc_msgSend(v3, "addObject:", CFSTR("save data"));
    if (!objc_msgSend(v3, "count"))
    {
      v5 = CFSTR("connected to network");
      goto LABEL_21;
    }
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "initWithFormat:", CFSTR("connected to network (%@)"), v7);
    goto LABEL_18;
  }
  v5 = CFSTR("unknown network state");
  return v5;
}

- (NSDictionary)plistDescription
{
  const __CFString *v3;
  _BOOL4 is_expensive;
  void *v6;
  void *v7;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  if (!self->_networkPath)
    return (NSDictionary *)&unk_1E611B758;
  if (!-[CPLNetworkState isConnected](self, "isConnected"))
    return (NSDictionary *)&unk_1E611B730;
  v9[0] = CFSTR("connected");
  v8[0] = CFSTR("state");
  v8[1] = CFSTR("path");
  if (-[CPLNetworkState isCellular](self, "isCellular"))
  {
    v3 = CFSTR("cellular");
  }
  else
  {
    is_expensive = nw_path_is_expensive((nw_path_t)self->_networkPath);
    v3 = CFSTR("normal");
    if (is_expensive)
      v3 = CFSTR("expensive");
  }
  v9[1] = v3;
  v8[2] = CFSTR("saveData");
  if (-[CPLNetworkState isConstrained](self, "isConstrained"))
    v6 = &unk_1E6119EB0;
  else
    v6 = &unk_1E6119EC8;
  v9[2] = v6;
  v8[3] = CFSTR("airplane");
  if (-[CPLNetworkState isInAirplaneMode](self, "isInAirplaneMode"))
    v7 = &unk_1E6119EB0;
  else
    v7 = &unk_1E6119EC8;
  v9[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  OS_nw_path *networkPath;
  uint64_t v6;
  void *v7;
  int v8;
  BOOL v9;
  int v10;
  int v11;
  int v12;
  int v13;
  _BOOL4 v15;

  v4 = a3;
  networkPath = self->_networkPath;
  objc_msgSend(v4, "networkPath");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  LOBYTE(v8) = ((unint64_t)networkPath | v6) == 0;
  if (networkPath)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v10 = -[CPLNetworkState isConnected](self, "isConnected");
    if (v10 == objc_msgSend(v4, "isConnected")
      && (v11 = -[CPLNetworkState isCellular](self, "isCellular"), v11 == objc_msgSend(v4, "isCellular"))
      && (v12 = -[CPLNetworkState isConstrained](self, "isConstrained"),
          v12 == objc_msgSend(v4, "isConstrained"))
      && (v13 = -[CPLNetworkState isCellularRestricted](self, "isCellularRestricted"),
          v13 == objc_msgSend(v4, "isCellularRestricted")))
    {
      v15 = -[CPLNetworkState isInAirplaneMode](self, "isInAirplaneMode");
      v8 = v15 ^ objc_msgSend(v4, "isInAirplaneMode") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return v8;
}

- (BOOL)isFunctionallyEqual:(id)a3
{
  id v4;
  OS_nw_path *networkPath;
  uint64_t v6;
  int v7;
  BOOL v8;
  int v9;
  int v10;
  int v11;
  int v12;
  _BOOL4 v14;

  v4 = a3;
  networkPath = self->_networkPath;
  objc_msgSend(v4, "networkPath");
  v6 = objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = ((unint64_t)networkPath | v6) == 0;
  if (networkPath)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = -[CPLNetworkState isCellular](self, "isCellular");
    if (v9 == objc_msgSend(v4, "isCellular")
      && (!v9
       || (v10 = -[CPLNetworkState isCellularRestricted](self, "isCellularRestricted"),
           v10 == objc_msgSend(v4, "isCellularRestricted")))
      && (v11 = -[CPLNetworkState isConnected](self, "isConnected"), v11 == objc_msgSend(v4, "isConnected"))&& (v12 = -[CPLNetworkState isConstrained](self, "isConstrained"), v12 == objc_msgSend(v4, "isConstrained")))
    {
      v14 = -[CPLNetworkState isInAirplaneMode](self, "isInAirplaneMode");
      v7 = v14 ^ objc_msgSend(v4, "isInAirplaneMode") ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (BOOL)isCellularRestricted
{
  return self->_cellularRestricted;
}

- (BOOL)isInAirplaneMode
{
  return self->_inAirplaneMode;
}

- (OS_nw_path)networkPath
{
  return self->_networkPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkPath, 0);
}

@end
