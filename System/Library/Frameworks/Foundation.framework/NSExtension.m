@implementation NSExtension

- (id)_init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSExtension;
  return -[NSExtension init](&v3, sel_init);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__NSExtension_allocWithZone___block_invoke;
    block[3] = &unk_1E0F4EE20;
    block[4] = a1;
    block[5] = a3;
    if (qword_1ECD0A190 != -1)
      dispatch_once(&qword_1ECD0A190, block);
    return (id)qword_1ECD0A188;
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___NSExtension;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

+ (id)beginMatchingExtensionsWithAttributes:(id)a3 completion:(id)a4
{
  if (qword_1ECD0A170 != -1)
    dispatch_once(&qword_1ECD0A170, &__block_literal_global_46);
  return (id)objc_msgSend((id)_MergedGlobals_119, "beginMatchingExtensionsWithAttributes:completion:", a3, a4);
}

+ (id)globalStateQueueForExtension:(id)a3
{
  id result;

  if (qword_1ECD0A170 != -1)
    dispatch_once(&qword_1ECD0A170, &__block_literal_global_46);
  result = (id)objc_msgSend((id)_MergedGlobals_119, "globalStateQueueForExtension:", a3);
  if (!result)
  {
    if (qword_1ECD0A180 != -1)
      dispatch_once(&qword_1ECD0A180, &__block_literal_global_1_1);
    return (id)qword_1ECD0A178;
  }
  return result;
}

+ (void)extensionsWithMatchingAttributes:(id)a3 completion:(id)a4
{
  if (qword_1ECD0A170 != -1)
    dispatch_once(&qword_1ECD0A170, &__block_literal_global_46);
  objc_msgSend((id)_MergedGlobals_119, "extensionsWithMatchingAttributes:completion:", a3, a4);
}

+ (id)extensionsWithMatchingAttributes:(id)a3 error:(id *)a4
{
  id result;

  if (qword_1ECD0A170 != -1)
    dispatch_once(&qword_1ECD0A170, &__block_literal_global_46);
  result = (id)objc_msgSend((id)_MergedGlobals_119, "extensionsWithMatchingAttributes:error:", a3, a4);
  if (!result)
    return (id)MEMORY[0x1E0C9AA60];
  return result;
}

+ (void)endMatchingExtensions:(id)a3
{
  if (qword_1ECD0A170 != -1)
    dispatch_once(&qword_1ECD0A170, &__block_literal_global_46);
  objc_msgSend((id)_MergedGlobals_119, "endMatchingExtensions:", a3);
}

+ (id)extensionWithIdentifier:(id)a3 error:(id *)a4
{
  if (qword_1ECD0A170 != -1)
    dispatch_once(&qword_1ECD0A170, &__block_literal_global_46);
  return (id)objc_msgSend((id)_MergedGlobals_119, "extensionWithIdentifier:error:", a3, a4);
}

+ (id)extensionWithIdentifier:(id)a3 excludingDisabledExtensions:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;

  v6 = a4;
  if (qword_1ECD0A170 != -1)
    dispatch_once(&qword_1ECD0A170, &__block_literal_global_46);
  return (id)objc_msgSend((id)_MergedGlobals_119, "extensionWithIdentifier:excludingDisabledExtensions:error:", a3, v6, a5);
}

+ (void)extensionWithUUID:(id)a3 completion:(id)a4
{
  if (qword_1ECD0A170 != -1)
    dispatch_once(&qword_1ECD0A170, &__block_literal_global_46);
  if (_MergedGlobals_119)
    objc_msgSend((id)_MergedGlobals_119, "extensionWithUUID:completion:", a3, a4);
  else
    (*((void (**)(id, _QWORD, NSError *))a4 + 2))(a4, 0, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSOSStatusErrorDomain"), -4, 0));
}

+ (void)extensionWithURL:(id)a3 completion:(id)a4
{
  if (qword_1ECD0A170 != -1)
    dispatch_once(&qword_1ECD0A170, &__block_literal_global_46);
  if (_MergedGlobals_119)
    objc_msgSend((id)_MergedGlobals_119, "extensionWithURL:completion:", a3, a4);
  else
    (*((void (**)(id, _QWORD, NSError *))a4 + 2))(a4, 0, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSOSStatusErrorDomain"), -4, 0));
}

+ (BOOL)_shouldLogExtensionDiscovery
{
  if (qword_1ECD0A170 != -1)
    dispatch_once(&qword_1ECD0A170, &__block_literal_global_46);
  return objc_msgSend((id)_MergedGlobals_119, "_shouldLogExtensionDiscovery");
}

dispatch_queue_t __44__NSExtension_globalStateQueueForExtension___block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("NSExtension global state queue", 0);
  qword_1ECD0A178 = (uint64_t)result;
  return result;
}

id __29__NSExtension_allocWithZone___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___NSExtension;
  result = objc_msgSendSuper2(&v3, sel_allocWithZone_, v1);
  qword_1ECD0A188 = (uint64_t)result;
  return result;
}

- (NSExtension)init
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Unable to create null NSExtensions!"), 0));
}

- (id)_initWithPKPlugin:(id)a3
{
  if (qword_1ECD0A170 != -1)
    dispatch_once(&qword_1ECD0A170, &__block_literal_global_46);
  return (id)objc_msgSend(objc_alloc((Class)_MergedGlobals_119), "_initWithPKPlugin:", a3);
}

- (id)objectForInfoDictionaryKey:(id)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 completion:(id)a5
{
  objc_class *v7;

  v7 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (id)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 error:(id *)a5
{
  objc_class *v7;

  v7 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (void)beginExtensionRequestWithInputItems:(id)a3 listenerEndpoint:(id)a4 completion:(id)a5
{
  objc_class *v7;

  v7 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (void)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 listenerEndpoint:(id)a5 completion:(id)a6
{
  objc_class *v8;

  v8 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v8);
}

- (void)beginExtensionRequestWithInputItems:(id)a3 completion:(id)a4
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)beginExtensionRequestWithInputItems:(id)a3 error:(id *)a4
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)cancelExtensionRequestWithIdentifier:(id)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)attemptOptIn:(id *)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)attemptOptOut:(id *)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_setAllowedErrorClasses:(id)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (id)_extensionContextForUUID:(id)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (int)pidForRequestIdentifier:(id)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_safelyBeginUsing:(id)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_safelyEndUsing:(id)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)_isPhotoServiceAccessGranted
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)_kill:(int)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_hostWillEnterForegroundNote:(id)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_hostDidEnterBackgroundNote:(id)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_hostWillResignActiveNote:(id)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_hostDidBecomeActiveNote:(id)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_dropAssertion
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSExtension"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

+ (BOOL)evaluateActivationRule:(id)a3 withExtensionItemsRepresentation:(id)a4
{
  return objc_msgSend((id)_NSExtensionClass(), "evaluateActivationRule:withExtensionItemsRepresentation:", a3, a4);
}

+ (id)predicateForActivationRule:(id)a3
{
  return (id)objc_msgSend((id)_NSExtensionClass(), "predicateForActivationRule:", a3);
}

+ (BOOL)_evaluateActivationRuleWithoutWorkarounds:(id)a3 withExtensionItemsRepresentation:(id)a4
{
  return objc_msgSend((id)_NSExtensionClass(), "_evaluateActivationRuleWithoutWorkarounds:withExtensionItemsRepresentation:", a3, a4);
}

@end
