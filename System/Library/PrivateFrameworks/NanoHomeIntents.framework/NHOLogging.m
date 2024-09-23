@implementation NHOLogging

- (NHOLogging)init
{
  NHOLogging *v2;
  NHOLogging *v3;
  uint64_t v4;
  NSDictionary *categoryMap;
  objc_super v7;
  _QWORD v8[9];
  _QWORD v9[10];

  v9[9] = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)NHOLogging;
  v2 = -[NHOLogging init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v8[0] = &unk_251369400;
    v8[1] = &unk_251369418;
    v9[0] = CFSTR("general");
    v9[1] = CFSTR("home");
    v8[2] = &unk_251369430;
    v8[3] = &unk_251369448;
    v9[2] = CFSTR("notification");
    v9[3] = CFSTR("radar76496236");
    v8[4] = &unk_251369460;
    v8[5] = &unk_251369478;
    v9[4] = CFSTR("invitation");
    v9[5] = CFSTR("onboarding");
    v8[6] = &unk_251369490;
    v8[7] = &unk_2513694A8;
    v9[6] = CFSTR("settings");
    v9[7] = CFSTR("contacts");
    v8[8] = &unk_2513694C0;
    v9[8] = CFSTR("camera");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 9);
    v4 = objc_claimAutoreleasedReturnValue();
    categoryMap = v3->_categoryMap;
    v3->_categoryMap = (NSDictionary *)v4;

  }
  return v3;
}

- (id)logForCategory:(unint64_t)a3
{
  void *v3;
  id v4;
  os_unfair_lock_s *p_lock;
  void *v8;
  id v9;

  if (a3 < 9)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_logs, "objectForKeyedSubscript:", v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_categoryMap, "objectForKeyedSubscript:", v8);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v3 = os_log_create("com.apple.NanoHome", (const char *)objc_msgSend(v9, "cStringUsingEncoding:", 4));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_logs, "setObject:forKeyedSubscript:", v3, v8);

    }
    os_unfair_lock_unlock(p_lock);

  }
  else
  {
    v3 = (void *)MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logs, 0);
  objc_storeStrong((id *)&self->_categoryMap, 0);
}

@end
