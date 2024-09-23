@implementation MLE5ProgramLibraryE5BundleImpl

- (MLE5ProgramLibraryE5BundleImpl)initWithE5BundleAtURL:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  MLE5ProgramLibraryE5BundleImpl *v9;
  MLE5ProgramLibraryE5BundleImpl *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLE5ProgramLibraryE5BundleImpl;
  v9 = -[MLE5ProgramLibraryE5BundleImpl init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_e5BundleURL, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
  }

  return v10;
}

- (e5rt_program_library)createProgramLibraryHandleWithRespecialization:(BOOL)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  uint64_t last_error_message;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MLE5ProgramLibraryE5BundleImpl e5BundleURL](self, "e5BundleURL", a3);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "fileSystemRepresentation");

  v7 = e5rt_program_library_create();
  if (!(_DWORD)v7)
    return 0;
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    last_error_message = e5rt_get_last_error_message();
    v13 = 1024;
    v14 = v7;
    _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
  }

  if (a4)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 3, v9, CFSTR("Unable to load a specialized model at %s"), v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (NSString)modelDisplayName
{
  void *v2;
  void *v3;

  -[MLE5ProgramLibraryE5BundleImpl configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)serializedMILText
{
  return 0;
}

- (NSURL)e5BundleURL
{
  return self->_e5BundleURL;
}

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_e5BundleURL, 0);
}

@end
