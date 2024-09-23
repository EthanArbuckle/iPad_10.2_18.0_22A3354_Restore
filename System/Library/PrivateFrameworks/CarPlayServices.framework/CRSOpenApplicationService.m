@implementation CRSOpenApplicationService

+ (id)defaultService
{
  void *v2;
  CRSOpenApplicationService *v3;

  objc_msgSend(MEMORY[0x24BE38490], "dashboardService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(CRSOpenApplicationService);
    objc_storeStrong((id *)&v3->_openService, v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)openApplication:(id)a3 completion:(id)a4
{
  id v6;
  FBSOpenApplicationService *openService;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  openService = self->_openService;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__CRSOpenApplicationService_openApplication_completion___block_invoke;
  v9[3] = &unk_24CD38F10;
  v10 = v6;
  v8 = v6;
  -[FBSOpenApplicationService openApplication:withOptions:completion:](openService, "openApplication:withOptions:completion:", a3, 0, v9);

}

uint64_t __56__CRSOpenApplicationService_openApplication_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openService, 0);
}

@end
