@implementation BKSSystemService

- (int)pidForApplication:(id)a3
{
  return -[FBSSystemService pidForApplication:](self->_fbsSystemService, "pidForApplication:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fbsSystemService, 0);
}

- (BKSSystemService)init
{
  BKSSystemService *v2;
  void *v3;
  objc_class *v4;
  FBSSystemService *v5;
  FBSSystemService *fbsSystemService;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)BKSSystemService;
  v2 = -[BKSSystemService init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getFBSSystemServiceClass_softClass;
    v13 = getFBSSystemServiceClass_softClass;
    if (!getFBSSystemServiceClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getFBSSystemServiceClass_block_invoke;
      v9[3] = &unk_1E1EA0D38;
      v9[4] = &v10;
      __getFBSSystemServiceClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = (FBSSystemService *)objc_alloc_init(v4);
    fbsSystemService = v2->_fbsSystemService;
    v2->_fbsSystemService = v5;

  }
  return v2;
}

- (id)systemApplicationBundleIdentifier
{
  return (id)-[FBSSystemService systemApplicationBundleIdentifier](self->_fbsSystemService, "systemApplicationBundleIdentifier");
}

- (BOOL)canOpenApplication:(id)a3 reason:(int *)a4
{
  BOOL result;
  uint64_t v6;

  if (a4)
  {
    v6 = *a4;
    result = -[FBSSystemService canOpenApplication:reason:](self->_fbsSystemService, "canOpenApplication:reason:", a3, &v6);
    *a4 = v6;
  }
  else
  {
    v6 = 0;
    return -[FBSSystemService canOpenApplication:reason:](self->_fbsSystemService, "canOpenApplication:reason:", a3, &v6);
  }
  return result;
}

- (void)openApplication:(id)a3 options:(id)a4 withResult:(id)a5
{
  id v8;
  FBSSystemService *fbsSystemService;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  fbsSystemService = self->_fbsSystemService;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__BKSSystemService_openApplication_options_withResult___block_invoke;
  v11[3] = &unk_1E1EA08E8;
  v12 = v8;
  v10 = v8;
  -[FBSSystemService openApplication:options:withResult:](fbsSystemService, "openApplication:options:withResult:", a3, a4, v11);

}

- (void)terminateApplication:(id)a3 forReason:(int)a4 andReport:(BOOL)a5 withDescription:(id)a6
{
  -[FBSSystemService terminateApplication:forReason:andReport:withDescription:](self->_fbsSystemService, "terminateApplication:forReason:andReport:withDescription:", a3, a4, a5, a6);
}

- (void)openApplication:(id)a3 options:(id)a4 clientPort:(unsigned int)a5 withResult:(id)a6
{
  uint64_t v6;
  id v10;
  FBSSystemService *fbsSystemService;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = *(_QWORD *)&a5;
  v10 = a6;
  fbsSystemService = self->_fbsSystemService;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__BKSSystemService_openApplication_options_clientPort_withResult___block_invoke;
  v13[3] = &unk_1E1EA08E8;
  v14 = v10;
  v12 = v10;
  -[FBSSystemService openApplication:options:clientPort:withResult:](fbsSystemService, "openApplication:options:clientPort:withResult:", a3, a4, v6, v13);

}

- (void)openURL:(id)a3 application:(id)a4 options:(id)a5 clientPort:(unsigned int)a6 withResult:(id)a7
{
  uint64_t v7;
  id v12;
  FBSSystemService *fbsSystemService;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = *(_QWORD *)&a6;
  v12 = a7;
  fbsSystemService = self->_fbsSystemService;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__BKSSystemService_openURL_application_options_clientPort_withResult___block_invoke;
  v15[3] = &unk_1E1EA08E8;
  v16 = v12;
  v14 = v12;
  -[FBSSystemService openURL:application:options:clientPort:withResult:](fbsSystemService, "openURL:application:options:clientPort:withResult:", a3, a4, a5, v7, v15);

}

- (unsigned)createClientPort
{
  return -[FBSSystemService createClientPort](self->_fbsSystemService, "createClientPort");
}

- (void)cleanupClientPort:(unsigned int)a3
{
  -[FBSSystemService cleanupClientPort:](self->_fbsSystemService, "cleanupClientPort:", *(_QWORD *)&a3);
}

uint64_t __70__BKSSystemService_openURL_application_options_clientPort_withResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __66__BKSSystemService_openApplication_options_clientPort_withResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __55__BKSSystemService_openApplication_options_withResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
