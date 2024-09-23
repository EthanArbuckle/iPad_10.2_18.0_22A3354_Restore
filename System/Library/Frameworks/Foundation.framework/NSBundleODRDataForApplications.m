@implementation NSBundleODRDataForApplications

void __50___NSBundleODRDataForApplications_initWithBundle___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[8];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = _NSOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_1817D9000, v2, OS_LOG_TYPE_ERROR, "NSBundleResourceRequest could not connect to its helper daemon", v3, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 64));
}

void __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_171(uint64_t a1, void *a2, NSError *a3)
{
  NSError *v5;
  NSObject *v6;
  int v8;
  NSError *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = a3;
    if (!-[NSString isEqualToString:](-[NSError domain](a3, "domain"), "isEqualToString:", CFSTR("NSCocoaErrorDomain")))
    {
      v10 = CFSTR("NSUnderlyingError");
      v11[0] = a3;
      v5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4994, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lock");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = -[NSError copy](v5, "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unlock");
    v6 = _NSOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = a3;
      _os_log_error_impl(&dword_1817D9000, v6, OS_LOG_TYPE_ERROR, "NSBundleResourceRequest helper daemon reports an error in parsing the on demand resources information: %@", (uint8_t *)&v8, 0xCu);
    }
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 64));
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lock");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = a2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unlock");
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 64));
  }
}

void __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_173(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[8];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = _NSOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_1817D9000, v2, OS_LOG_TYPE_ERROR, "NSBundleResourceRequest could not connect to its helper daemon", v3, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 64));
}

void __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_174(uint64_t a1, void *a2, NSError *a3)
{
  NSError *v5;
  uint64_t *v6;
  NSObject *v7;
  uint64_t v8;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  NSError *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = a3;
    if (!-[NSString isEqualToString:](-[NSError domain](a3, "domain"), "isEqualToString:", CFSTR("NSCocoaErrorDomain")))
    {
      v23 = CFSTR("NSUnderlyingError");
      v24[0] = a3;
      v5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4994, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1));
    }
    v6 = (uint64_t *)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lock");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = -[NSError copy](v5, "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unlock");
    v7 = _NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(*(id *)(a1 + 40), "bundleURL");
      *(_DWORD *)buf = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = a3;
      _os_log_error_impl(&dword_1817D9000, v7, OS_LOG_TYPE_ERROR, "NSBundleResourceRequest helper daemon reports an error beginning for bundle %@: %@", buf, 0x16u);
    }
  }
  else
  {
    v10 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("_NSODRSandboxExtensionKey"));
    if (v10)
    {
      objc_msgSend(v10, "UTF8String");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = sandbox_extension_consume();
      if ((*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) & 0x8000000000000000) != 0)
      {
        v11 = *__error();
        v12 = _NSOSLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v17 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v20 = v17;
          v21 = 1024;
          LODWORD(v22) = v11;
          _os_log_error_impl(&dword_1817D9000, v12, OS_LOG_TYPE_ERROR, "NSBundleResourceRequest encountered a sandboxing error for bundle %@: %d", buf, 0x12u);
        }
      }
    }
    v14 = *(_QWORD *)(a1 + 32);
    v13 = (uint64_t *)(a1 + 32);
    objc_msgSend(*(id *)(v14 + 16), "lock");
    *(_QWORD *)(*v13 + 72) = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("_NSODRSandboxRootPathKey")), "copy");
    v15 = *v13;
    v16 = *(void **)(*v13 + 48);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_175;
    v18[3] = &unk_1E0F50D28;
    v18[4] = v15;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v18);
    objc_msgSend(*(id *)(*v13 + 16), "unlock");
    v6 = v13;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*v6 + 64));
}

uint64_t __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_175(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "UTF8String");
  return objc_msgSend((id)objc_msgSend(a2, "remoteObjectProxy"), "accessSandboxExtension:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sandbox_extension_issue_file()));
}

uint64_t __42___NSBundleODRDataForApplications_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __67___NSBundleODRDataForApplications_assetPacksBecameAvailable_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "remoteObjectProxy"), "hostApplicationAssetPacksBecameAvailable:", *(_QWORD *)(a1 + 32));
}

uint64_t __69___NSBundleODRDataForApplications_assetPacksBecameUnavailable_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "remoteObjectProxy"), "hostApplicationAssetPacksBecameUnavailable:", *(_QWORD *)(a1 + 32));
}

uint64_t __56___NSBundleODRDataForApplications_addExtensionEndpoint___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unlock");
}

@end
