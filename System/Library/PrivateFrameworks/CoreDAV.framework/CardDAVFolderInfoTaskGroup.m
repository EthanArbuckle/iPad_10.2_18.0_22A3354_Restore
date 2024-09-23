@implementation CardDAVFolderInfoTaskGroup

- (CardDAVFolderInfoTaskGroup)initWithAccountInfoProvider:(id)a3 containerURLs:(id)a4 directoryGatewayURLs:(id)a5 taskManager:(id)a6
{
  id v11;
  CardDAVFolderInfoTaskGroup *v12;
  CardDAVFolderInfoTaskGroup *v13;
  objc_super v15;

  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CardDAVFolderInfoTaskGroup;
  v12 = -[CoreDAVContainerInfoTaskGroup initWithAccountInfoProvider:containerURLs:taskManager:](&v15, sel_initWithAccountInfoProvider_containerURLs_taskManager_, a3, a4, a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->super._appSpecificHomeSetPropNameSpace, CFSTR("urn:ietf:params:xml:ns:carddav"));
    objc_storeStrong((id *)&v13->super._appSpecificHomeSetPropName, CFSTR("addressbook-home-set"));
    objc_storeStrong((id *)&v13->_directoryGatewayURLs, a5);
  }

  return v13;
}

- (int)containerInfoDepthForURL:(id)a3
{
  if (-[NSSet containsObject:](self->_directoryGatewayURLs, "containsObject:", a3))
    return 2;
  else
    return -[CoreDAVContainerInfoTaskGroup containerInfoDepth](self, "containerInfoDepth");
}

- (id)_copyContainerWithURL:(id)a3 andProperties:(id)a4
{
  id v5;
  id v6;
  CardDAVAddressBookContainer *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CoreDAVContainer initWithURL:andProperties:]([CardDAVAddressBookContainer alloc], "initWithURL:andProperties:", v6, v5);

  return v7;
}

- (id)_copyContainerParserMappings
{
  return +[CardDAVAddressBookContainer copyPropertyMappingsForParser](CardDAVAddressBookContainer, "copyPropertyMappingsForParser");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryGatewayURLs, 0);
}

@end
