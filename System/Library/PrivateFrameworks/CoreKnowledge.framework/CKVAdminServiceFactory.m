@implementation CKVAdminServiceFactory

- (CKVAdminServiceFactory)initWithQueue:(id)a3 semAdministrator:(id)a4 taskManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  CKVAdminServiceFactory *v12;
  CKVAdminServiceFactory *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKVAdminServiceFactory;
  v12 = -[CKVAdminServiceFactory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceQueue, a3);
    objc_storeStrong((id *)&v13->_semAdministrator, a4);
    objc_storeStrong((id *)&v13->_taskManager, a5);
  }

  return v13;
}

- (id)adminService
{
  return -[CKVAdminServiceConnection initWithServiceQueue:taskManager:semAdministrator:]([CKVAdminServiceConnection alloc], "initWithServiceQueue:taskManager:semAdministrator:", self->_serviceQueue, self->_taskManager, self->_semAdministrator);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_semAdministrator, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

@end
