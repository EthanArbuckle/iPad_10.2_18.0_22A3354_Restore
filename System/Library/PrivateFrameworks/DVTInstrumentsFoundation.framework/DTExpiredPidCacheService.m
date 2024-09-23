@implementation DTExpiredPidCacheService

- (DTExpiredPidCacheService)init
{
  DTExpiredPidCacheService *v2;
  DTExpiredPidCacheService *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DTExpiredPidCacheService;
  v2 = -[XRExpiredPidCacheServiceProtected init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[XRExpiredPidCacheServiceProtected _performOnCache:](v2, "_performOnCache:", &unk_24EB275D0);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[XRExpiredPidCacheServiceProtected _performOnCache:](self, "_performOnCache:", &unk_24EB27D30);
  v3.receiver = self;
  v3.super_class = (Class)DTExpiredPidCacheService;
  -[DTExpiredPidCacheService dealloc](&v3, sel_dealloc);
}

+ (void)disableExpiredPidCaching
{
  void *v2;

  byte_25576F910 = 1;
  objc_msgSend(a1, "defaultCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    NSLog(CFSTR("Possible race condition or code ordering issued caused a failure to globally disable the expired pid cache #Developer"));
}

+ (id)defaultCache
{
  if (qword_25576F918 != -1)
    dispatch_once(&qword_25576F918, &unk_24EB27D70);
  return (id)qword_25576F920;
}

- (id)signatureForExpiredPid:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_222B1A490;
  v15 = sub_222B1A4A0;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_222B1A83C;
  v8[3] = &unk_24EB27DC0;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[XRExpiredPidCacheServiceProtected _performOnCache:](self, "_performOnCache:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)allExpiredSignatures
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_222B1A490;
  v9 = sub_222B1A4A0;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_222B1AB20;
  v4[3] = &unk_24EB27DE8;
  v4[4] = &v5;
  -[XRExpiredPidCacheServiceProtected _performOnCache:](self, "_performOnCache:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)enableCaching:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_222B1ABB0;
  v3[3] = &unk_24EB27E08;
  v4 = a3;
  -[XRExpiredPidCacheServiceProtected _performOnCache:](self, "_performOnCache:", v3);
}

@end
