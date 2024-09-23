@implementation DTSysmonTapConfig

- (DTSysmonTapConfig)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DTSysmonTapConfig;
  return -[DTTapConfig init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DTSysmonTapConfig;
  v4 = -[DTTapConfig copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = _Block_copy(self->_sessionHandler);
  v6 = (void *)v4[10];
  v4[10] = v5;

  return v4;
}

- (void)setSessionHandler:(id)a3
{
  void *v4;
  id sessionHandler;

  v4 = _Block_copy(a3);
  sessionHandler = self->_sessionHandler;
  self->_sessionHandler = v4;

}

- (unint64_t)sampleInterval
{
  void *v2;
  unint64_t v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("sampleInterval"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (void)setSampleInterval:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("sampleInterval"));

}

- (NSArray)processAttributes
{
  return (NSArray *)-[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("procAttrs"));
}

- (void)setProcessAttributes:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("procAttrs"));

}

- (NSArray)systemAttributes
{
  return (NSArray *)-[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("sysAttrs"));
}

- (void)setSystemAttributes:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("sysAttrs"));

}

- (NSArray)coalitionAttributes
{
  return (NSArray *)-[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("coalAttrs"));
}

- (void)setCoalitionAttributes:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("coalAttrs"));

}

- (BOOL)sampleCPUUsage
{
  void *v2;
  char v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("cpuUsage"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setSampleCPUUsage:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("cpuUsage"));

}

- (id)pids
{
  return -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("pids"));
}

- (void)setPids:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "mutableCopy");
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("pids"));

}

- (void)addPid:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("pids"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (id)objc_opt_new();
    -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:");
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

}

- (id)sessionHandler
{
  return self->_sessionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sessionHandler, 0);
}

@end
