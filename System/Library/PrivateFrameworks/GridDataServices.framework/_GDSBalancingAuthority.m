@implementation _GDSBalancingAuthority

- (_GDSBalancingAuthority)init
{
  _GDSBalancingAuthority *v2;
  os_log_t v3;
  OS_os_log *log;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_GDSBalancingAuthority;
  v2 = -[_GDSBalancingAuthority init](&v9, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.gds", "balancingAuthority");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.powerui.locsignalmonitor.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance_instance_0;
}

+ (id)fetchBalancingAuthorityPolygons
{
  void *v2;
  void *v3;

  +[_GDSServerConnection sharedInstance](_GDSServerConnection, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchBalancingAuthorityPolygons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)loadStringForPreferenceKey:(id)a3
{
  return (id)(id)CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.gridDataServices"), (CFStringRef)*MEMORY[0x24BDBD578], (CFStringRef)*MEMORY[0x24BDBD570]);
}

+ (id)loadNumberForPreferenceKey:(id)a3
{
  return (id)(id)CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.gridDataServices"), (CFStringRef)*MEMORY[0x24BDBD578], (CFStringRef)*MEMORY[0x24BDBD570]);
}

+ (id)currentBalancingAuthority
{
  __CFString *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  _GDSBalancingAuthorityOutput *v21;

  +[_GDSBalancingAuthority loadStringForPreferenceKey:](_GDSBalancingAuthority, "loadStringForPreferenceKey:", CFSTR("balAuthName"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  +[_GDSBalancingAuthority loadStringForPreferenceKey:](_GDSBalancingAuthority, "loadStringForPreferenceKey:", CFSTR("balAuthID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_GDSBalancingAuthority loadNumberForPreferenceKey:](_GDSBalancingAuthority, "loadNumberForPreferenceKey:", CFSTR("balAuthFetchDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  +[_GDSBalancingAuthority loadNumberForPreferenceKey:](_GDSBalancingAuthority, "loadNumberForPreferenceKey:", CFSTR("balAuthLatStart"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  +[_GDSBalancingAuthority loadNumberForPreferenceKey:](_GDSBalancingAuthority, "loadNumberForPreferenceKey:", CFSTR("balAuthLatEnd"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  +[_GDSBalancingAuthority loadNumberForPreferenceKey:](_GDSBalancingAuthority, "loadNumberForPreferenceKey:", CFSTR("balAuthLongStart"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  +[_GDSBalancingAuthority loadNumberForPreferenceKey:](_GDSBalancingAuthority, "loadNumberForPreferenceKey:", CFSTR("balAuthLongEnd"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2 || !v3)
  {

    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v20 = objc_claimAutoreleasedReturnValue();

    v2 = CFSTR("Unknown");
    v19 = (void *)v20;
  }
  v21 = -[_GDSBalancingAuthorityOutput initWithIdentifier:name:latitudeStart:latitudeEnd:longitudeStart:longitudeEnd:updateDate:]([_GDSBalancingAuthorityOutput alloc], "initWithIdentifier:name:latitudeStart:latitudeEnd:longitudeStart:longitudeEnd:updateDate:", v2, v3, v19, v9, v12, v15, v18);

  return v21;
}

+ (void)saveBalancingAuthority:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (const __CFString *)*MEMORY[0x24BDBD578];
  v6 = (const __CFString *)*MEMORY[0x24BDBD570];
  CFPreferencesSetValue(CFSTR("balAuthName"), v4, CFSTR("com.apple.gridDataServices"), (CFStringRef)*MEMORY[0x24BDBD578], (CFStringRef)*MEMORY[0x24BDBD570]);

  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetValue(CFSTR("balAuthID"), v7, CFSTR("com.apple.gridDataServices"), v5, v6);

  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "latStart");
  CFPreferencesSetValue(CFSTR("balAuthLatStart"), (CFPropertyListRef)objc_msgSend(v8, "numberWithDouble:"), CFSTR("com.apple.gridDataServices"), v5, v6);
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "latEnd");
  CFPreferencesSetValue(CFSTR("balAuthLatEnd"), (CFPropertyListRef)objc_msgSend(v9, "numberWithDouble:"), CFSTR("com.apple.gridDataServices"), v5, v6);
  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "longStart");
  CFPreferencesSetValue(CFSTR("balAuthLongStart"), (CFPropertyListRef)objc_msgSend(v10, "numberWithDouble:"), CFSTR("com.apple.gridDataServices"), v5, v6);
  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "longEnd");
  v13 = v12;

  CFPreferencesSetValue(CFSTR("balAuthLongEnd"), (CFPropertyListRef)objc_msgSend(v11, "numberWithDouble:", v13), CFSTR("com.apple.gridDataServices"), v5, v6);
  v14 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  CFPreferencesSetValue(CFSTR("balAuthFetchDate"), (CFPropertyListRef)objc_msgSend(v14, "numberWithDouble:"), CFSTR("com.apple.gridDataServices"), v5, v6);

  CFPreferencesSynchronize(CFSTR("com.apple.gridDataServices"), v5, v6);
}

+ (void)saveBalancingAuthorityStatus:(id)a3
{
  CFPreferencesSetValue(CFSTR("balAuthStatus"), a3, CFSTR("com.apple.gridDataServices"), (CFStringRef)*MEMORY[0x24BDBD578], (CFStringRef)*MEMORY[0x24BDBD570]);
}

+ (void)saveRegisteration:(id)a3 bundlePath:(id)a4
{
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  v6 = (const __CFString *)*MEMORY[0x24BDBD578];
  v7 = (const __CFString *)*MEMORY[0x24BDBD570];
  v8 = (void *)CFPreferencesCopyValue(CFSTR("registrations"), CFSTR("com.apple.gridDataServices"), (CFStringRef)*MEMORY[0x24BDBD578], (CFStringRef)*MEMORY[0x24BDBD570]);
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, v10);
  CFPreferencesSetValue(CFSTR("registrations"), v9, CFSTR("com.apple.gridDataServices"), v6, v7);

}

+ (id)loadRegistrations
{
  return (id)(id)CFPreferencesCopyValue(CFSTR("registrations"), CFSTR("com.apple.gridDataServices"), (CFStringRef)*MEMORY[0x24BDBD578], (CFStringRef)*MEMORY[0x24BDBD570]);
}

+ (id)loadBalancingAuthorityStatus
{
  return (id)(id)CFPreferencesCopyValue(CFSTR("balAuthStatus"), CFSTR("com.apple.gridDataServices"), (CFStringRef)*MEMORY[0x24BDBD578], (CFStringRef)*MEMORY[0x24BDBD570]);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
