@implementation MPStoreItemLibraryImport

- (MPStoreItemLibraryImport)initWithImportElements:(id)a3 usingCloudLibraryDestination:(BOOL)a4
{
  return (MPStoreItemLibraryImport *)-[MPStoreItemLibraryImport _initWithImportElements:referralObject:usingCloudLibraryDestination:localLibraryDestination:](self, "_initWithImportElements:referralObject:usingCloudLibraryDestination:localLibraryDestination:", a3, 0, a4, a4);
}

- (id)initUsingLocalDeviceLibraryDestinationWithImportElements:(id)a3 usingLocalLibraryDestination:(BOOL)a4 usingCloudLibraryDestination:(BOOL)a5
{
  return -[MPStoreItemLibraryImport _initWithImportElements:referralObject:usingCloudLibraryDestination:localLibraryDestination:](self, "_initWithImportElements:referralObject:usingCloudLibraryDestination:localLibraryDestination:", a3, 0, a5, a4);
}

- (MPStoreItemLibraryImport)initWithImportElements:(id)a3 referralObject:(id)a4 usingCloudLibraryDestination:(BOOL)a5
{
  return (MPStoreItemLibraryImport *)-[MPStoreItemLibraryImport _initWithImportElements:referralObject:usingCloudLibraryDestination:localLibraryDestination:](self, "_initWithImportElements:referralObject:usingCloudLibraryDestination:localLibraryDestination:", a3, a4, a5, a5);
}

- (id)initUsingLocalDeviceLibraryDestinationWithImportElements:(id)a3 referralObject:(id)a4 usingLocalLibraryDestination:(BOOL)a5 usingCloudLibraryDestination:(BOOL)a6
{
  return -[MPStoreItemLibraryImport _initWithImportElements:referralObject:usingCloudLibraryDestination:localLibraryDestination:](self, "_initWithImportElements:referralObject:usingCloudLibraryDestination:localLibraryDestination:", a3, a4, a6, a5);
}

- (id)_initWithImportElements:(id)a3 referralObject:(id)a4 usingCloudLibraryDestination:(BOOL)a5 localLibraryDestination:(BOOL)a6
{
  id v10;
  id v11;
  MPStoreItemLibraryImport *v12;
  MPStoreItemLibraryImport *v13;
  uint64_t v14;
  NSArray *importElements;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MPStoreItemLibraryImport;
  v12 = -[MPStoreItemLibraryImport init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_referralObject, a4);
    v14 = objc_msgSend(v10, "copy");
    importElements = v13->_importElements;
    v13->_importElements = (NSArray *)v14;

    v13->_addToCloudLibrary = a5;
    v13->_addToDeviceLibraryOnly = a6;
  }

  return v13;
}

- (NSArray)importElements
{
  return self->_importElements;
}

- (BOOL)addToCloudLibrary
{
  return self->_addToCloudLibrary;
}

- (BOOL)addToDeviceLibraryOnly
{
  return self->_addToDeviceLibraryOnly;
}

- (MPModelObject)referralObject
{
  return self->_referralObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referralObject, 0);
  objc_storeStrong((id *)&self->_importElements, 0);
}

@end
