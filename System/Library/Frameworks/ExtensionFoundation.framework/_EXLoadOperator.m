@implementation _EXLoadOperator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;
  _QWORD block[6];

  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33___EXLoadOperator_allocWithZone___block_invoke;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = a3;
    block[5] = a1;
    if (allocWithZone__onceToken_0 != -1)
      dispatch_once(&allocWithZone__onceToken_0, block);
    return (id)allocWithZone__factory_0;
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS____EXLoadOperator;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_EXLoadOperator;
  return -[_EXLoadOperator init](&v3, sel_init);
}

- (_EXLoadOperator)initWithItemProvider:(id)a3
{
  id v4;
  _EXSourceLoadOperator *v5;

  v4 = a3;
  v5 = -[_EXSourceLoadOperator initWithItemProvider:]([_EXSourceLoadOperator alloc], "initWithItemProvider:", v4);

  return &v5->super;
}

- (_EXLoadOperator)initWithCoder:(id)a3
{
  id v3;
  NSObject *v4;
  _EXLoadOperator *result;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;

  v3 = a3;
  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315650;
    v7 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSup"
         "port/ItemProvider/EXLoadOperator.m";
    v8 = 1024;
    v9 = 78;
    v10 = 2080;
    v11 = "-[_EXLoadOperator initWithCoder:]";
  }

  __break(1u);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;

  v3 = a3;
  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315650;
    v6 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSup"
         "port/ItemProvider/EXLoadOperator.m";
    v7 = 1024;
    v8 = 83;
    v9 = 2080;
    v10 = "-[_EXLoadOperator encodeWithCoder:]";
  }

  __break(1u);
}

- (void)loadItemForTypeIdentifier:(id)a3 completionHandler:(id)a4 expectedValueClass:(Class)a5 options:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  _BYTE v18[18];
  __int16 v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  _EXDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromClass(a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315906;
    v16 = "-[_EXLoadOperator loadItemForTypeIdentifier:completionHandler:expectedValueClass:options:]";
    v17 = 2112;
    *(_QWORD *)v18 = v9;
    *(_WORD *)&v18[8] = 2112;
    *(_QWORD *)&v18[10] = v13;
    v19 = 2112;
    v20 = v11;
    _os_log_debug_impl(&dword_190C25000, v12, OS_LOG_TYPE_DEBUG, "%s typeIdentifier: %@ expectedValueClass: %@ options: %@", (uint8_t *)&v15, 0x2Au);

  }
  _EXDefaultLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
  {
    v15 = 136315650;
    v16 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSu"
          "pport/ItemProvider/EXLoadOperator.m";
    v17 = 1024;
    *(_DWORD *)v18 = 89;
    *(_WORD *)&v18[4] = 2080;
    *(_QWORD *)&v18[6] = "-[_EXLoadOperator loadItemForTypeIdentifier:completionHandler:expectedValueClass:options:]";
  }

  __break(1u);
}

- (void)loadPreviewImageWithCompletionHandler:(id)a3 expectedValueClass:(Class)a4 options:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  _BYTE v15[18];

  v7 = a3;
  v8 = a5;
  _EXDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromClass(a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[_EXLoadOperator loadPreviewImageWithCompletionHandler:expectedValueClass:options:]";
    v14 = 2112;
    *(_QWORD *)v15 = v10;
    *(_WORD *)&v15[8] = 2112;
    *(_QWORD *)&v15[10] = v8;
    _os_log_debug_impl(&dword_190C25000, v9, OS_LOG_TYPE_DEBUG, "%s expectedValueClass: %@ options: %@", (uint8_t *)&v12, 0x20u);

  }
  _EXDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    v12 = 136315650;
    v13 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSu"
          "pport/ItemProvider/EXLoadOperator.m";
    v14 = 1024;
    *(_DWORD *)v15 = 94;
    *(_WORD *)&v15[4] = 2080;
    *(_QWORD *)&v15[6] = "-[_EXLoadOperator loadPreviewImageWithCompletionHandler:expectedValueClass:options:]";
  }

  __break(1u);
}

@end
