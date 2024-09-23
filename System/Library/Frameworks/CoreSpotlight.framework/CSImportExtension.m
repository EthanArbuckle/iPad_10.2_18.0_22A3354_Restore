@implementation CSImportExtension

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CSIndexExtensionRequestHandler dealloc].cold.1((uint64_t)self, v3);

  v4.receiver = self;
  v4.super_class = (Class)CSImportExtension;
  -[CSImportExtension dealloc](&v4, sel_dealloc);
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setImportExtension:", self);

}

- (BOOL)updateAttributes:(CSSearchableItemAttributeSet *)attributes forFileAtURL:(NSURL *)contentURL error:(NSError *)error
{
  return 0;
}

@end
