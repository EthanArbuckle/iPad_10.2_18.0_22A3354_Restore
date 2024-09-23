@implementation CESRSpeechProfileAdminServiceFactory

- (CESRSpeechProfileAdminServiceFactory)initWithQueue:(id)a3 speechProfileSiteManager:(id)a4
{
  id v7;
  id v8;
  CESRSpeechProfileAdminServiceFactory *v9;
  CESRSpeechProfileAdminServiceFactory *v10;
  CESRSpeechProfileAdminServiceFactory *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CESRSpeechProfileAdminServiceFactory;
  v9 = -[CESRSpeechProfileAdminServiceFactory init](&v13, sel_init);
  v10 = v9;
  if (!v9
    || (objc_storeStrong((id *)&v9->_serviceQueue, a3), v10->_serviceQueue)
    && (objc_storeStrong((id *)&v10->_speechProfileSiteManager, a4), v10->_speechProfileSiteManager))
  {
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)adminService
{
  return -[CESRSpeechProfileAdminServiceConnection initWithServiceQueue:speechProfileSiteManager:]([CESRSpeechProfileAdminServiceConnection alloc], "initWithServiceQueue:speechProfileSiteManager:", self->_serviceQueue, self->_speechProfileSiteManager);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechProfileSiteManager, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

@end
