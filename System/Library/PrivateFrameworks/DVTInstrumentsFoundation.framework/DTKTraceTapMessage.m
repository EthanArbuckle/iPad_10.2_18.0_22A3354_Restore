@implementation DTKTraceTapMessage

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

- (NSDictionary)sessionMetadata
{
  void *v2;
  void *v3;

  -[DTTapMessage plist](self, "plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("sm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
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

- (unint64_t)coreCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[DTTapMessage plist](self, "plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)setCoreCount:(unint64_t)a3
{
  void *v4;
  id v5;

  -[DTTapMessage plist](self, "plist");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("cc"));

}

- (unint64_t)triggerCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[DTTapMessage plist](self, "plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("tc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)setTriggerCount:(unint64_t)a3
{
  void *v4;
  id v5;

  -[DTTapMessage plist](self, "plist");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("tc"));

}

- (unint64_t)triggerIndex
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[DTTapMessage plist](self, "plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ti"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)setTriggerIndex:(unint64_t)a3
{
  void *v4;
  id v5;

  -[DTTapMessage plist](self, "plist");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("ti"));

}

- (unint64_t)logicalProcessorCore
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[DTTapMessage plist](self, "plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)setLogicalProcessorCore:(unint64_t)a3
{
  void *v4;
  id v5;

  -[DTTapMessage plist](self, "plist");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("lc"));

}

- (unint64_t)recordCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[DTTapMessage plist](self, "plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("rc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)setRecordCount:(unint64_t)a3
{
  void *v4;
  id v5;

  -[DTTapMessage plist](self, "plist");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("rc"));

}

- (NSDictionary)triggerMetadata
{
  void *v2;
  void *v3;

  -[DTTapMessage plist](self, "plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("tm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setTriggerMetadata:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DTTapMessage plist](self, "plist");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("tm"));
}

- (NSString)localFilePath
{
  void *v2;
  void *v3;

  -[DTTapMessage plist](self, "plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lfp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLocalFilePath:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DTTapMessage plist](self, "plist");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("lfp"));
}

@end
