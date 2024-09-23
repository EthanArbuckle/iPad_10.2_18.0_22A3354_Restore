@implementation APGreenTeaLogger

- (APGreenTeaLogger)init
{
  APGreenTeaLogger *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)APGreenTeaLogger;
  v2 = -[APGreenTeaLogger init](&v4, sel_init);
  if (v2)
    v2->_logger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
  return v2;
}

- (void)willAccessLocation
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  -[APGreenTeaLogger logger](self, "logger");
  getCTGreenTeaOsLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227BED000, v3, OS_LOG_TYPE_INFO, "Accessing location for ad targeting", buf, 2u);
  }

  APLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_227BED000, v4, OS_LOG_TYPE_INFO, "Accessing location for ad targeting", v5, 2u);
  }

}

- (ct_green_tea_logger_s)logger
{
  return self->_logger;
}

- (void)dealloc
{
  objc_super v3;

  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)APGreenTeaLogger;
  -[APGreenTeaLogger dealloc](&v3, sel_dealloc);
}

- (void)willTransmitLocationFor:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint64_t v16;
  uint64_t v17;

  v16 = v3;
  v17 = v4;
  switch(a3)
  {
    case 0uLL:
      -[APGreenTeaLogger logger](self, "logger");
      getCTGreenTeaOsLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_227BED000, v6, OS_LOG_TYPE_INFO, "Transmitting location to store platform for ad targeting", v15, 2u);
        }
      }

      APLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        goto LABEL_23;
      *(_WORD *)v15 = 0;
      v8 = "Transmitting location to store platform ad targeting (SLP)";
      break;
    case 1uLL:
      -[APGreenTeaLogger logger](self, "logger");
      getCTGreenTeaOsLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_227BED000, v10, OS_LOG_TYPE_INFO, "Transmitting location to store platform for ad targeting", v15, 2u);
      }

      APLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        goto LABEL_23;
      *(_WORD *)v15 = 0;
      v8 = "Transmitting location to store platform for ad targeting (TT)";
      break;
    case 2uLL:
      -[APGreenTeaLogger logger](self, "logger");
      getCTGreenTeaOsLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_227BED000, v12, OS_LOG_TYPE_INFO, "Transmitting location to store platform for ad targeting", v15, 2u);
      }

      APLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        goto LABEL_23;
      *(_WORD *)v15 = 0;
      v8 = "Transmitting location to store platform for ad targeting (PP)";
      break;
    case 3uLL:
      -[APGreenTeaLogger logger](self, "logger");
      getCTGreenTeaOsLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_227BED000, v14, OS_LOG_TYPE_INFO, "Transmitting location to store platform for ad targeting", v15, 2u);
      }

      APLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        goto LABEL_23;
      *(_WORD *)v15 = 0;
      v8 = "Transmitting location to store platform for ad targeting (DP)";
      break;
    default:
      return;
  }
  _os_log_impl(&dword_227BED000, v7, OS_LOG_TYPE_INFO, v8, v15, 2u);
LABEL_23:

}

@end
