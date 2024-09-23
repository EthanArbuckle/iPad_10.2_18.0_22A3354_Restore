@implementation CCUICameraModule

- (void)handleTouchDownWithTouchType:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[8];
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE19AA0];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x24BE19AA0]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_230FA2000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CCUI_MODULE_DID_BEGIN_INTERACTION_EVENT", " enableTelemetry=YES ", buf, 2u);
  }
  kdebug_trace();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", mach_absolute_time());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", mach_continuous_time());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDB1AA0];
  v9 = *MEMORY[0x24BDB1AB0];
  v14[0] = *MEMORY[0x24BDB1AA8];
  v14[1] = v9;
  v15[0] = v8;
  v15[1] = v6;
  v14[2] = *MEMORY[0x24BDB1AB8];
  v15[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIAppLauncherModule applicationIdentifier](self, "applicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AVCapturePrewarmWithOptions();

  v12.receiver = self;
  v12.super_class = (Class)CCUICameraModule;
  -[CCUIAppLauncherModule handleTouchDownWithTouchType:](&v12, sel_handleTouchDownWithTouchType_, a3);

}

- (void)handleTapWithTouchType:(int64_t)a3
{
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];

  v5 = *MEMORY[0x24BE19AA0];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x24BE19AA0]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_230FA2000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CCUI_MODULE_HANDLE_TAP_EVENT", " enableTelemetry=YES ", buf, 2u);
  }
  kdebug_trace();
  v6.receiver = self;
  v6.super_class = (Class)CCUICameraModule;
  -[CCUIAppLauncherModule handleTapWithTouchType:](&v6, sel_handleTapWithTouchType_, a3);
}

@end
