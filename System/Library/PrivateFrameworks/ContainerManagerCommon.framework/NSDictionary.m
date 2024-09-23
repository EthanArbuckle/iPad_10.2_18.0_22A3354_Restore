@implementation NSDictionary

id __94__NSDictionary_MobileContainerManagerAdditions__MCM_writeToURL_withOptions_fileManager_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Attempting to write a zero-length plist file at [%@]"), v3);

  v13[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[NSDictionary(MobileContainerManagerAdditions) MCM_writeToURL:withOptions:fileManager:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = &unk_1E8CD6240;
  v6 = *MEMORY[0x1E0CB2D50];
  v13[1] = CFSTR("SourceFileLine");
  v13[2] = v6;
  v14[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v4;
    _os_log_error_impl(&dword_1CF807000, v8, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 34, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
