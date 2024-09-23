@implementation MKDisplay

- (MKDisplay)initWithData:(id)a3
{
  id v4;
  MKDisplay *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  MKDisplay *v12;
  id v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MKDisplay;
  v5 = -[MKDisplay init](&v15, sel_init);
  if (v5)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (v7)
    {
      +[MKLog log](MKLog, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[MKAccount initWithData:].cold.2((uint64_t)v5, (uint64_t)v7, v8);
LABEL_10:

      v12 = 0;
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[MKLog log](MKLog, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[MKAccount initWithData:].cold.1((uint64_t)v5, v8);
      goto LABEL_10;
    }
    v9 = v6;
    objc_msgSend(v9, "objectForKey:", CFSTR("display_zoom_enabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKDisplay setEnableDisplayZoom:](v5, "setEnableDisplayZoom:", objc_msgSend(v10, "BOOLValue"));

    objc_msgSend(v9, "objectForKey:", CFSTR("dark_mode_enabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKDisplay setEnableDisplayDarkMode:](v5, "setEnableDisplayDarkMode:", objc_msgSend(v11, "BOOLValue"));
  }
  v12 = v5;
LABEL_11:

  return v12;
}

- (BOOL)enableDisplayZoom
{
  return self->_enableDisplayZoom;
}

- (void)setEnableDisplayZoom:(BOOL)a3
{
  self->_enableDisplayZoom = a3;
}

- (BOOL)enableDisplayDarkMode
{
  return self->_enableDisplayDarkMode;
}

- (void)setEnableDisplayDarkMode:(BOOL)a3
{
  self->_enableDisplayDarkMode = a3;
}

@end
