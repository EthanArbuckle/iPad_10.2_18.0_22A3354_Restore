uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  objc_class *v11;
  NSString *v12;
  NSString *v13;
  uint64_t v14;

  v4 = objc_autoreleasePoolPush();
  v5 = _SFSafariContainerPath();
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v5));
  v7 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");
  setenv("HOME", v7, 1);
  v8 = setenv("CFFIXED_USER_HOME", v7, 1);
  v9 = _SFSafariTemporaryDirectoryPath(v8);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v9));
  setenv("TMPDIR", (const char *)objc_msgSend(v10, "fileSystemRepresentation"), 1);

  v11 = (objc_class *)objc_opt_class(SafariViewServiceApplication);
  v12 = NSStringFromClass(v11);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue(v12);

  objc_autoreleasePoolPop(v4);
  v14 = UIApplicationMain(a1, a2, v13, v13);

  return v14;
}

id objc_msgSend__sf_registerSafariDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sf_registerSafariDefaults");
}

id objc_msgSend__sf_safariDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sf_safariDefaults");
}

id objc_msgSend_addSuiteNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSuiteNamed:");
}

id objc_msgSend_createDefaultWebsiteDataStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDefaultWebsiteDataStore");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_initWithInjectedBundleURL_imageCacheDirectoryURL_cacheIsReadOnly_metadataType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInjectedBundleURL:imageCacheDirectoryURL:cacheIsReadOnly:metadataType:");
}

id objc_msgSend_mainSystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainSystem");
}

id objc_msgSend_modifierFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifierFlags");
}

id objc_msgSend_registerReaderCustomProtocols(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerReaderCustomProtocols");
}

id objc_msgSend_safari_safariInjectedBundleURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safari_safariInjectedBundleURL");
}

id objc_msgSend_setMenusIfNecessaryForSafariViewServiceWithBuilder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMenusIfNecessaryForSafariViewServiceWithBuilder:");
}

id objc_msgSend_setSharedSiteMetadataManagerProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSharedSiteMetadataManagerProvider:");
}

id objc_msgSend_sharedProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedProvider");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_system(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "system");
}
