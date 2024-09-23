@implementation HPSEngravingService

- (BOOL)isEngravingSupported
{
  void *v3;
  int v4;
  BOOL v5;
  void *v6;

  -[BTSDevice classicDevice](self->_device, "classicDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "productId");

  if (v4 == 8212)
    return 1;
  -[BTSDevice classicDevice](self->_device, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "productId") == 8228;

  return v5;
}

- (HPSEngravingService)initWithDevice:(id)a3
{
  id v5;
  HPSEngravingService *v6;
  HPSEngravingService *v7;
  void *v8;
  uint64_t v9;
  NSString *engravingData;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HPSEngravingService;
  v6 = -[HPSEngravingService init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    -[BTSDevice classicDevice](v7->_device, "classicDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "address");
    v9 = objc_claimAutoreleasedReturnValue();
    engravingData = v7->_engravingData;
    v7->_engravingData = (NSString *)v9;

  }
  return v7;
}

- (void)getEngravedCaseView:(id)a3
{
  id v4;
  NSString *engravingData;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  engravingData = self->_engravingData;
  -[BTSDevice classicDevice](self->_device, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "productId");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__HPSEngravingService_getEngravedCaseView___block_invoke;
  v9[3] = &unk_1EA29AC30;
  v10 = v4;
  v8 = v4;
  +[HPSCaseEngravingView getEngravedCaseImage:productID:completionHandler:](_TtC16HeadphoneConfigs20HPSCaseEngravingView, "getEngravedCaseImage:productID:completionHandler:", engravingData, v7, v9);

}

void __43__HPSEngravingService_getEngravedCaseView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__HPSEngravingService_getEngravedCaseView___block_invoke_2;
  v5[3] = &unk_1EA29AC08;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __43__HPSEngravingService_getEngravedCaseView___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Headphone Engraving: retrieving engraved case image %@"), v2);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engravingData, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
