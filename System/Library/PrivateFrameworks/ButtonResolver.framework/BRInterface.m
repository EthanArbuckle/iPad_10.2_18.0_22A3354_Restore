@implementation BRInterface

- (BRInterface)init
{
  BRInterface *v2;
  NSMutableDictionary *v3;
  NSObject *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRInterface;
  v2 = -[BRInterface init](&v6, sel_init);
  if (v2)
  {
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create(0, 0);
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v2->_timestampDict = v3;
    if (!v3)
    {
      v5 = _BRLog_log_3;
      if (!_BRLog_log_3)
      {
        v5 = os_log_create("com.apple.ButtonResolver", "default");
        _BRLog_log_3 = (uint64_t)v5;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[BRInterface init].cold.1(v5);

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRInterface;
  -[BRInterface dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  _BOOL4 v4;
  const char *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRInterface;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", -[BRInterface description](&v7, sel_description));
  v4 = -[BRInterface isReady](self, "isReady");
  v5 = "N";
  if (v4)
    v5 = "Y";
  objc_msgSend(v3, "appendFormat:", CFSTR("IsReady: %s;\n"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("MaxSlots: %lu;\n"), -[BRInterface maxAssetSlots](self, "maxAssetSlots"));
  objc_msgSend(v3, "appendFormat:", CFSTR("UnusedSlots: %lu;\n"),
    -[BRInterface unusedAssetSlots](self, "unusedAssetSlots"));
  objc_msgSend(v3, "appendFormat:", CFSTR("RecentActionTimestamps: %@;\n"), self->_timestampDict);
  return v3;
}

- (id)propertyList
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const char *v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = -[BRInterface isReady](self, "isReady");
  v6 = "N";
  if (v5)
    v6 = "Y";
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v4, "stringWithFormat:", CFSTR("%s;"), v6), CFSTR("IsReady"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[BRInterface maxAssetSlots](self, "maxAssetSlots")), CFSTR("MaxSlots"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[BRInterface unusedAssetSlots](self, "unusedAssetSlots")), CFSTR("UnusedSlots"));
  objc_msgSend(v3, "setObject:forKey:", self->_timestampDict, CFSTR("RecentActionTimestamps"));
  return v3;
}

- (void)timestampWithLabel:(id)a3
{
  void *v5;

  if (a3)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_timestampDict, "setObject:forKeyedSubscript:", objc_msgSend(v5, "numberWithDouble:"), a3);
  }
}

+ (id)interface
{
  return 0;
}

+ (id)interfaces
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = +[BRInterfaceLegacy interface](BRInterfaceLegacy, "interface");
  v4 = +[BRInterfaceKeyboard interface](BRInterfaceKeyboard, "interface");
  v5 = +[BRInterfaceAOP interface](BRInterfaceAOP, "interface");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v3, "setTapOnly:", 1);
    objc_msgSend(v2, "addObject:", v6);
  }
  objc_msgSend(v2, "addObject:", v3);
  objc_msgSend(v2, "addObject:", v4);
  return v2;
}

- (BOOL)setGlobalConfigs:(id)a3 error:(id *)a4
{
  if (a4)
    *a4 = 0;
  return 1;
}

- (BOOL)setConfigs:(id)a3 withAssets:(id)a4 forStates:(id)a5 error:(id *)a6
{
  if (a6)
    *a6 = 0;
  return 1;
}

- (BOOL)enableStates:(id)a3 error:(id *)a4
{
  if (a4)
    *a4 = 0;
  return 1;
}

- (BOOL)disableStates:(id)a3 clearAsset:(BOOL)a4 error:(id *)a5
{
  if (a5)
    *a5 = 0;
  return 1;
}

- (BOOL)playState:(unint64_t)a3 forSpeed:(unint64_t)a4 error:(id *)a5
{
  if (a5)
    *a5 = 0;
  return 1;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)maxAssetSlots
{
  return self->_maxAssetSlots;
}

- (unint64_t)unusedAssetSlots
{
  return self->_unusedAssetSlots;
}

- (void)init
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[BRInterface init]";
  _os_log_error_impl(&dword_215E56000, log, OS_LOG_TYPE_ERROR, "%s failed!", (uint8_t *)&v1, 0xCu);
}

@end
