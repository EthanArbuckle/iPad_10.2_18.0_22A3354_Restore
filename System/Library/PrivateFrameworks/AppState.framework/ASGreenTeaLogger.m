@implementation ASGreenTeaLogger

- (ASGreenTeaLogger)init
{
  ASGreenTeaLogger *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASGreenTeaLogger;
  v2 = -[ASGreenTeaLogger init](&v4, sel_init);
  if (v2)
    v2->_logger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)ASGreenTeaLogger;
  -[ASGreenTeaLogger dealloc](&v3, sel_dealloc);
}

- (void)willAccessLocationForSearch
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];

  -[ASGreenTeaLogger logger](self, "logger");
  getCTGreenTeaOsLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_222A6F000, v3, OS_LOG_TYPE_INFO, "Accessing location for search ad targeting", v4, 2u);
  }

}

- (void)willTransmitLocationForSearch
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];

  -[ASGreenTeaLogger logger](self, "logger");
  getCTGreenTeaOsLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_222A6F000, v3, OS_LOG_TYPE_INFO, "Transmitting location to store platform for search ad targeting", v4, 2u);
  }

}

- (void)willRequestAppList
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];

  -[ASGreenTeaLogger logger](self, "logger");
  getCTGreenTeaOsLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_222A6F000, v3, OS_LOG_TYPE_INFO, "Accessing application list to update installed status", v4, 2u);
  }

}

- (ct_green_tea_logger_s)logger
{
  return self->_logger;
}

@end
