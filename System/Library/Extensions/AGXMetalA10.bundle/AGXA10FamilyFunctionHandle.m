@implementation AGXA10FamilyFunctionHandle

- (AGXA10FamilyFunctionHandle)initWithFunctionType:(unint64_t)a3 name:(id)a4 device:(id)a5 handle:(unint64_t)a6 dylib:(id)a7
{
  AGXA10FamilyFunctionHandle *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AGXA10FamilyFunctionHandle;
  result = -[_MTLFunctionHandle initWithFunctionType:name:device:](&v9, sel_initWithFunctionType_name_device_, a3, a4, a5, a6);
  if (result)
    result->_binary_dylib = (AGXA10FamilyDynamicLibrary *)a7;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AGXA10FamilyFunctionHandle;
  -[_MTLFunctionHandle dealloc](&v2, sel_dealloc);
}

@end
