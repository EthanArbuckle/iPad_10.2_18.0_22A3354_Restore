@implementation MTLToolsDynamicLibrary

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (void)setLabel:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
}

- (MTLDevice)device
{
  return (MTLDevice *)self->super._parent;
}

- (OS_dispatch_data)binaryData
{
  return (OS_dispatch_data *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "binaryData");
}

- (OS_dispatch_data)reflectionData
{
  return (OS_dispatch_data *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "reflectionData");
}

- (NSArray)exportedFunctions
{
  return (NSArray *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "exportedFunctions");
}

- (NSArray)exportedVariables
{
  return (NSArray *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "exportedVariables");
}

- (NSArray)importedSymbols
{
  return (NSArray *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "importedSymbols");
}

- (NSArray)importedLibraries
{
  return (NSArray *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "importedLibraries");
}

- (NSString)installName
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "installName");
}

- (NSString)libraryPath
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "libraryPath");
}

- (const)libraryUUID
{
  return (const $2772B1D07D29A72E8557B2574C0AE5C1 *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "libraryUUID");
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "serializeToURL:error:", a3, a4);
}

- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "serializeToURL:options:error:", a3, a4, a5);
}

- (id)formattedDescription:(unint64_t)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "formattedDescription:", a3);
}

- (NSArray)relocations
{
  return self->_relocations;
}

- (void)setRelocations:(id)a3
{
  NSArray *relocations;
  id v6;

  relocations = self->_relocations;
  if (relocations != a3)
  {

    self->_relocations = (NSArray *)objc_msgSend(a3, "copy");
    v6 = (id)-[MTLDevice unwrapMTLRelocations:](-[MTLToolsDynamicLibrary device](self, "device"), "unwrapMTLRelocations:", a3);
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setRelocations:", v6);

  }
}

- (BOOL)shaderValidationEnabled
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "shaderValidationEnabled");
}

- (MTLDebugInstrumentationData)debugInstrumentationData
{
  return (MTLDebugInstrumentationData *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "debugInstrumentationData");
}

- (void)setDebugInstrumentationData:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDebugInstrumentationData:", a3);
}

- (void)dealloc
{
  objc_super v3;

  -[MTLToolsObjectCache removeKey:](self->super._device->dynamicLibraryObjectCache, "removeKey:", self->super._baseObject);
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsDynamicLibrary;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

@end
