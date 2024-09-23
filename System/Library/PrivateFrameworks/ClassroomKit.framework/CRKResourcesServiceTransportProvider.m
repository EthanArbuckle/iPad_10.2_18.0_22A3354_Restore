@implementation CRKResourcesServiceTransportProvider

- (void)fetchTransportWithCompletion:(id)a3
{
  objc_class *v3;
  void (**v4)(id, void *, _QWORD);
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x24BDD1988];
  v4 = (void (**)(id, void *, _QWORD))a3;
  v6 = (id)objc_msgSend([v3 alloc], "initWithServiceName:", CFSTR("com.apple.ClassroomKit.ResourcesService"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2C7B0]), "initWithXPCConnection:", v6);
  v4[2](v4, v5, 0);

}

@end
