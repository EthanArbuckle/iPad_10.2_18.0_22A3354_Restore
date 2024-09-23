@implementation OSADiagnosticsReporter

+ (void)launchAppWith:(int64_t)a3 options:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a5;
  v8 = a4;
  v12 = (id)objc_opt_new();
  objc_msgSend(v8, "files_to_attach");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFiles_to_attach:", v9);

  objc_msgSend(v8, "log_path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLog_path:", v10);

  objc_msgSend(v8, "panic_string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setPanic_string:", v11);
  +[ObjcDiagnosticsReporter launchAppWith:options:completion:](ObjcDiagnosticsReporter, "launchAppWith:options:completion:", a3, v12, v7);

}

@end
