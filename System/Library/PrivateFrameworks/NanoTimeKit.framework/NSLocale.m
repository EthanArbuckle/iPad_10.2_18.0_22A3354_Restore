@implementation NSLocale

void __66__NSLocale_NTKLocaleOverride____loadSwizzledCurrentLocaleIfNeeded__block_invoke()
{
  objc_class *v0;
  objc_method *ClassMethod;
  objc_method *v2;
  uint64_t v3;
  void *v4;

  v0 = (objc_class *)objc_opt_class();
  ClassMethod = class_getClassMethod(v0, sel_currentLocale);
  v2 = class_getClassMethod(v0, sel___userCurrentLocale);
  method_exchangeImplementations(ClassMethod, v2);
  objc_msgSend(MEMORY[0x1E0C99DC8], "__userCurrentLocale");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)__currentLocaleOverride;
  __currentLocaleOverride = v3;

}

@end
