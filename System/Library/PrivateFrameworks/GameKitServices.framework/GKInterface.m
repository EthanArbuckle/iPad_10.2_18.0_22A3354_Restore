@implementation GKInterface

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKInterface;
  -[GKInterface dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  const char *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[NSNumber intValue](-[GKInterface index](self, "index"), "intValue");
  if (-[GKInterface bsdName](self, "bsdName"))
    v5 = -[NSString UTF8String](-[NSString description](-[GKInterface bsdName](self, "bsdName"), "description"), "UTF8String");
  else
    v5 = "<nil>";
  if (-[GKInterface type](self, "type"))
    v6 = -[NSString UTF8String](-[NSString description](-[GKInterface type](self, "type"), "description"), "UTF8String");
  else
    v6 = "<nil>";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("GKInterface [%p] index [%d] bsdName [%s] type [%s] priority [%d]"), self, v4, v5, v6, -[GKInterface priority](self, "priority"));
}

+ (id)interfaceWithInterfaceIndex:(id)a3
{
  GKInterface *v4;

  v4 = objc_alloc_init(GKInterface);
  -[GKInterface setIndex:](v4, "setIndex:", a3);
  -[GKInterface setBsdName:](v4, "setBsdName:", +[GKInterface bsdNameForIndex:](GKInterface, "bsdNameForIndex:", a3));
  return v4;
}

+ (id)bsdNameForIndex:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  char v7[16];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((int)objc_msgSend(a3, "intValue") < 1)
    return CFSTR("GKInterfaceBSDNameNone");
  memset(v7, 170, sizeof(v7));
  if (if_indextoname(objc_msgSend(a3, "intValue"), v7))
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      +[GKInterface bsdNameForIndex:].cold.1(v5, a3, v6);
  }
  return 0;
}

- (NSNumber)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)bsdName
{
  return self->_bsdName;
}

- (void)setBsdName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)priority
{
  return self->_priority;
}

- (void)setPriority:(unsigned int)a3
{
  self->_priority = a3;
}

+ (void)bsdNameForIndex:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "+[GKInterface bsdNameForIndex:]";
  v8 = 1024;
  v9 = 70;
  v10 = 1024;
  v11 = objc_msgSend(a2, "intValue");
  _os_log_error_impl(&dword_215C5C000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d failed for interface index %d", (uint8_t *)&v4, 0x22u);
}

@end
