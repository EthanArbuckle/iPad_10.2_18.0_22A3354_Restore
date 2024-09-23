@implementation MLDefaultCustomLayerFactory

- (id)createCustomLayer:(id)a3 withParameters:(id)a4 error:(id *)a5
{
  NSString *v7;
  id v8;
  Class v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = (NSString *)a3;
  v8 = a4;
  v9 = NSClassFromString(v7);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 50);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendString:", CFSTR("A Core ML custom neural network layer requires an implementation named '"));
    objc_msgSend(v11, "appendString:", v7);
    objc_msgSend(v11, "appendString:", CFSTR("' which was not found in the global namespace."));
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_DWORD *)buf = 136315138;
    v16 = -[NSString UTF8String](objc_retainAutorelease(v7), "UTF8String");
    v13 = "A Core ML custom neural network layer requires an implementation named '%s' which was not found in the global namespace.";
LABEL_12:
    _os_log_error_impl(&dword_19C486000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
    goto LABEL_7;
  }
  if ((-[objc_class conformsToProtocol:](v9, "conformsToProtocol:", &unk_1EE446A08) & 1) != 0)
  {
    v10 = (void *)objc_msgSend(objc_alloc(NSClassFromString(v7)), "initWithParameterDictionary:error:", v8, a5);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 50);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendString:", CFSTR("A custom neural network layer implementation class named '"));
  objc_msgSend(v11, "appendString:", v7);
  objc_msgSend(v11, "appendString:", CFSTR("' does not conform to the MLCustomLayer protocol."));
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v16 = -[NSString UTF8String](objc_retainAutorelease(v7), "UTF8String");
    v13 = "A Core ML custom neural network layer implementation class named '%s' does not conform to the MLCustomLayer protocol.";
    goto LABEL_12;
  }
LABEL_7:

  if (a5)
  {
    +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 4, CFSTR("%@"), v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  v10 = 0;
LABEL_10:

  return v10;
}

@end
