@implementation _NSExtensionContextVendor

+ (void)_startListening:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (qword_1ECD09D48 != -1)
    dispatch_once(&qword_1ECD09D48, &__block_literal_global_22);
  objc_msgSend((id)_MergedGlobals_105, "_startListening:", v3);
}

+ (id)_sharedExtensionContextVendor
{
  if (qword_1ECD09D68 != -1)
    dispatch_once(&qword_1ECD09D68, &__block_literal_global_2_1);
  return (id)qword_1ECD09D60;
}

- (id)_init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_NSExtensionContextVendor;
  return -[_NSExtensionContextVendor init](&v3, sel_init);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_class *v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (_NSExtensionContextVendor == a1)
  {
    v6 = NSClassFromString((NSString *)CFSTR("_NSExtensionContextVendor"));
    NSRequestConcreteImplementation((uint64_t)a1, a2, v6);
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS____NSExtensionContextVendor;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

+ (void)_startListening
{
  if (qword_1ECD09D48 != -1)
    dispatch_once(&qword_1ECD09D48, &__block_literal_global_22);
  objc_msgSend((id)_MergedGlobals_105, "_startListening");
}

+ (id)_extensionDictionary
{
  if (qword_1ECD09D48 != -1)
    dispatch_once(&qword_1ECD09D48, &__block_literal_global_22);
  return (id)objc_msgSend((id)_MergedGlobals_105, "_extensionDictionary");
}

+ (Class)_extensionPrincipalClass
{
  if (qword_1ECD09D48 != -1)
    dispatch_once(&qword_1ECD09D48, &__block_literal_global_22);
  return (Class)objc_msgSend((id)_MergedGlobals_105, "_extensionPrincipalClass");
}

+ (id)_extensionMainStoryboard
{
  if (qword_1ECD09D48 != -1)
    dispatch_once(&qword_1ECD09D48, &__block_literal_global_22);
  return (id)objc_msgSend((id)_MergedGlobals_105, "_extensionMainStoryboard");
}

+ (Class)_extensionContextClass
{
  if (qword_1ECD09D48 != -1)
    dispatch_once(&qword_1ECD09D48, &__block_literal_global_22);
  return (Class)objc_msgSend((id)_MergedGlobals_105, "_extensionContextClass");
}

- (_NSExtensionContextVendor)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_NSExtensionContextVendor;
  return -[_NSExtensionContextVendor init](&v3, sel_init);
}

- (void)_tearDownContextWithUUID:(id)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("_NSExtensionContextVendor"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (id)_extensionContextForUUID:(id)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("_NSExtensionContextVendor"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_setPrincipalObject:(id)a3 forUUID:(id)a4
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("_NSExtensionContextVendor"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

@end
