@implementation LNDaemonConnectionListener

- (LNDaemonConnectionListener)initWithBundleIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  LNDaemonConnectionListener *v9;
  objc_super v11;

  v4 = (objc_class *)MEMORY[0x24BDD1998];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.private.appintents.delegate.%@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithMachServiceName:", v7);
  v11.receiver = self;
  v11.super_class = (Class)LNDaemonConnectionListener;
  v9 = -[LNConnectionListener initWithListener:](&v11, sel_initWithListener_, v8);

  return v9;
}

@end
