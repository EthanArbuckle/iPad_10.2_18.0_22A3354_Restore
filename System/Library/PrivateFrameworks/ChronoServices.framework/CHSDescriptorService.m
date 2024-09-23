@implementation CHSDescriptorService

- (CHSDescriptorService)init
{
  CHSDescriptorService *v2;
  uint64_t v3;
  CHSChronoServicesConnection *connection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHSDescriptorService;
  v2 = -[CHSDescriptorService init](&v6, sel_init);
  if (v2)
  {
    +[CHSChronoServicesConnection sharedInstance](CHSChronoServicesConnection, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    connection = v2->_connection;
    v2->_connection = (CHSChronoServicesConnection *)v3;

  }
  return v2;
}

- (void)modifyDescriptorEnablement:(id)a3 completion:(id)a4
{
  -[CHSChronoServicesConnection modifyDescriptorEnablement:completion:](self->_connection, "modifyDescriptorEnablement:completion:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
