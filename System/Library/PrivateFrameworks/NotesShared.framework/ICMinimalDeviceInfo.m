@implementation ICMinimalDeviceInfo

- (ICMinimalDeviceInfo)init
{
  -[ICMinimalDeviceInfo doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICMinimalDeviceInfo)initWithName:(id)a3 upgradable:(BOOL)a4 upgraded:(BOOL)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICMinimalDeviceInfo;
  return -[ICMigrationDeviceInfo initWithName:upgradable:upgraded:](&v6, sel_initWithName_upgradable_upgraded_, a3, a4, a5);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICMinimalDeviceInfo;
  -[ICMinimalDeviceInfo description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[ICMigrationDeviceInfo name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICMigrationDeviceInfo upgradable](self, "upgradable"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[ICMigrationDeviceInfo upgraded](self, "upgraded"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ <name: %@, Upgradable: %@, Upgraded: %@"), v3, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)loggableDescription
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICMinimalDeviceInfo;
  -[ICMinimalDeviceInfo description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (-[ICMigrationDeviceInfo upgradable](self, "upgradable"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[ICMigrationDeviceInfo upgraded](self, "upgraded"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ <Upgradable: %@, Upgraded: %@"), v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
