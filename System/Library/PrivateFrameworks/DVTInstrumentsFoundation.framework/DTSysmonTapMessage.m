@implementation DTSysmonTapMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)tapVersion
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[DTTapMessage plist](self, "plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("tv"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (void)setTapVersion:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[DTTapMessage plist](self, "plist");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("tv"));

}

- (id)sessionMetadata
{
  void *v2;
  void *v3;

  -[DTTapMessage plist](self, "plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("sm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSessionMetadata:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DTTapMessage plist](self, "plist");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("sm"));
}

- (NSDictionary)runningMetadata
{
  return self->_runningMetadata;
}

- (void)setRunningMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningMetadata, 0);
}

@end
