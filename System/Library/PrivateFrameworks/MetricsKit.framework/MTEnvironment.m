@implementation MTEnvironment

- (void)setDelegate:(id)a3
{
  MTEnvironmentDelegate **p_delegate;
  id v5;
  char isKindOfClass;
  void *v7;
  id WeakRetained;
  id v9;

  p_delegate = &self->_delegate;
  v9 = a3;
  v5 = objc_storeWeak((id *)p_delegate, v9);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MTObject metricsKit](self, "metricsKit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "setMetricsKit:", v7);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)isAnonymous
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[MTEnvironment delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAnonymous");

  return v6;
}

- (id)osVersion
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "osVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment osVersion]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)osBuildNumber
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "osBuildNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment osBuildNumber]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)os
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "os");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment os]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)app
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "app");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment app]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (MTEnvironmentDelegate)delegate
{
  return (MTEnvironmentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)hardwareFamily
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hardwareFamily");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment hardwareFamily]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)connectionType
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "connectionType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment connectionType]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)appVersion
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment appVersion]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)capacityData
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "capacityData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment capacityData]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)capacityDataAvailable
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "capacityDataAvailable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment capacityDataAvailable]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)capacityDisk
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "capacityDisk");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment capacityDisk]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)capacitySystem
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "capacitySystem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment capacitySystem]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)capacitySystemAvailable
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "capacitySystemAvailable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment capacitySystemAvailable]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)cookies
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cookies");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment cookies]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)dsId
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dsId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment dsId]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)environmentBuild
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "environmentBuild");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)environmentDataCenter
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "environmentDataCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)environmentInstance
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "environmentDataCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)hardwareModel
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hardwareModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment hardwareModel]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)hostApp
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hostApp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment hostApp]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)hostAppVersion
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hostAppVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)osLanguages
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "osLanguages");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment osLanguages]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)pageUrl
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pageUrl");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment pageUrl]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)parentPageUrl
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parentPageUrl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)pixelRatio
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pixelRatio");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment pixelRatio]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)resourceRevNum
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resourceRevNum");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment resourceRevNum]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)screenHeight
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "screenHeight");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment screenHeight]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)screenWidth
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "screenWidth");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment screenWidth]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)storeFrontHeader
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "storeFrontHeader");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment storeFrontHeader]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)userAgent
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userAgent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment userAgent]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)windowInnerHeight
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "windowInnerHeight");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment windowInnerHeight]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)windowInnerWidth
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "windowInnerWidth");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment windowInnerWidth]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)windowOuterHeight
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "windowOuterHeight");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment windowOuterHeight]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)windowOuterWidth
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEnvironment delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEnvironment delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "windowOuterWidth");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment windowOuterWidth]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

@end
