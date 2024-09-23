@implementation CRKStudentdTransportProvider

- (void)fetchTransportWithCompletion:(id)a3
{
  void *v3;
  void (**v4)(id, void *, _QWORD);
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD1988];
  v4 = (void (**)(id, void *, _QWORD))a3;
  objc_msgSend(v3, "crk_studentDaemonConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2C7B0]), "initWithXPCConnection:", v6);
  v4[2](v4, v5, 0);

}

@end
