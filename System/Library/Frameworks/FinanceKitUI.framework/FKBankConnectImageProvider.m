@implementation FKBankConnectImageProvider

- (FKBankConnectImageProvider)init
{
  FKBankConnectImageProvider *v2;
  uint64_t v3;
  _TtC12FinanceKitUI24BankConnectImageProvider *imageProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FKBankConnectImageProvider;
  v2 = -[FKBankConnectImageProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    imageProvider = v2->_imageProvider;
    v2->_imageProvider = (_TtC12FinanceKitUI24BankConnectImageProvider *)v3;

  }
  return v2;
}

- (void)logoForInstitutionID:(id)a3 size:(CGSize)a4 scale:(double)a5 completion:(id)a6
{
  double height;
  double width;
  id v11;
  _TtC12FinanceKitUI24BankConnectImageProvider *imageProvider;
  id v13;
  _QWORD v14[4];
  id v15;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  imageProvider = self->_imageProvider;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __73__FKBankConnectImageProvider_logoForInstitutionID_size_scale_completion___block_invoke;
  v14[3] = &unk_2504B6F70;
  v15 = v11;
  v13 = v11;
  -[BankConnectImageProvider logoFor:size:scale:completionHandler:](imageProvider, "logoFor:size:scale:completionHandler:", a3, v14, width, height, a5);

}

uint64_t __73__FKBankConnectImageProvider_logoForInstitutionID_size_scale_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
}

@end
