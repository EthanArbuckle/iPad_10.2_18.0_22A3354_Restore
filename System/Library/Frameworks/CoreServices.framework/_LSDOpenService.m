@implementation _LSDOpenService

+ (unsigned)connectionType
{
  return 3;
}

+ (id)XPCInterface
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31___LSDOpenService_XPCInterface__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (+[_LSDOpenService XPCInterface]::once != -1)
    dispatch_once(&+[_LSDOpenService XPCInterface]::once, v3);
  return (id)+[_LSDOpenService XPCInterface]::result;
}

+ (Class)clientClass
{
  return (Class)objc_opt_class();
}

- (_LSDOpenService)initWithXPCListener:(id)a3
{
  id v4;
  _LSDOpenService *v5;
  NSObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_LSDOpenService;
  v5 = -[_LSDService initWithXPCListener:](&v8, sel_initWithXPCListener_, v4);
  if (v5)
  {
    _LSServer_GetIOQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v6, &__block_literal_global_33);

  }
  return v5;
}

@end
