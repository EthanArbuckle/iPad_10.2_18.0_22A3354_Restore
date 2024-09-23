@implementation CardDAVFolderMultiGetTask

- (CardDAVFolderMultiGetTask)initWithURLs:(id)a3 atContainerURL:(id)a4 appSpecificDataItemClass:(Class)a5
{
  CardDAVFolderMultiGetTask *v5;
  CardDAVFolderMultiGetTask *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CardDAVFolderMultiGetTask;
  v5 = -[CoreDAVContainerMultiGetTask initWithURLs:atContainerURL:appSpecificDataItemClass:](&v8, sel_initWithURLs_atContainerURL_appSpecificDataItemClass_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->super._appSpecificNamespace, CFSTR("urn:ietf:params:xml:ns:carddav"));
    objc_storeStrong((id *)&v6->super._appSpecificMultiGetCommand, CFSTR("addressbook-multiget"));
    objc_storeStrong((id *)&v6->super._appSpecificDataProp, CFSTR("address-data"));
  }
  return v6;
}

@end
