@implementation SRSiriPresentationPluginHost

+ (id)_defaultURL
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("com.apple.siri.PresentationPluginCache.plist")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 0));

  return v6;
}

+ (id)sharedSiriPresentationPluginHost
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A100;
  block[3] = &unk_100123C20;
  block[4] = a1;
  if (qword_1001503E0 != -1)
    dispatch_once(&qword_1001503E0, block);
  return (id)qword_1001503D8;
}

- (SRSiriPresentationPluginHost)initWithURL:(id)a3
{
  id v4;
  SRSiriPresentationPluginHost *v5;
  NSURL *v6;
  NSURL *URL;
  uint64_t v8;
  NSMutableDictionary *bundleURLsByBundleIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SRSiriPresentationPluginHost;
  v5 = -[SRSiriPresentationPluginHost init](&v11, "init");
  if (v5)
  {
    v6 = (NSURL *)objc_msgSend(v4, "copy");
    URL = v5->_URL;
    v5->_URL = v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    bundleURLsByBundleIdentifier = v5->_bundleURLsByBundleIdentifier;
    v5->_bundleURLsByBundleIdentifier = (NSMutableDictionary *)v8;

  }
  return v5;
}

- (SRSiriPresentationPluginHost)init
{
  double v3;
  id v4;
  void *v5;
  SRSiriPresentationPluginHost *v6;

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_defaultURL", v3));
  v6 = -[SRSiriPresentationPluginHost initWithURL:](self, "initWithURL:", v5);

  return v6;
}

- (id)_classNameForBuiltInPresentationWithIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1001503F0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1001503F0, &stru_100123C40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001503E8, "objectForKey:", v4));

  return v5;
}

- (id)_builtInPresentationWithIdentifier:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v8 = a4;
  v9 = a5;
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _classNameForBuiltInPresentationWithIdentifier:](self, "_classNameForBuiltInPresentationWithIdentifier:", a3));
  v11 = objc_alloc(NSClassFromString(v10));

  if (!objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___SiriUIPresentation))
    goto LABEL_5;
  v12 = v11;
  if ((objc_opt_respondsToSelector(v12, "initWithDelegate:dataSource:") & 1) == 0)
  {

LABEL_5:
    v13 = objc_msgSend(v11, "init");
    goto LABEL_6;
  }
  v13 = objc_msgSend(v12, "initWithDelegate:dataSource:", v8, v9);
LABEL_6:
  v14 = v13;

  return v14;
}

- (void)_rescanBundles
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void **v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, void *, void *);
  void *v28;
  id v29;
  _BYTE v30[128];
  NSURLResourceKey v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _bundleURLsByBundleIdentifier](self, "_bundleURLsByBundleIdentifier"));
  objc_msgSend(v3, "removeAllObjects");

  v4 = AFPresentationPluginsURL();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_alloc_init((Class)NSFileManager);
  v31 = NSURLNameKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
  v25 = _NSConcreteStackBlock;
  v26 = 3221225472;
  v27 = sub_10005A5B8;
  v28 = &unk_100123C68;
  v29 = v5;
  v20 = v29;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:"));

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pathExtension"));
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("siriUIPresentationBundle"));

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", v14));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _bundleURLsByBundleIdentifier](self, "_bundleURLsByBundleIdentifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleIdentifier"));
          objc_msgSend(v18, "setObject:forKey:", v14, v19);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v11);
  }

  -[SRSiriPresentationPluginHost _save](self, "_save");
}

- (id)_cachedURLForBundleWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SRSiriPresentationPluginHost _load](self, "_load");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _bundleURLsByBundleIdentifier](self, "_bundleURLsByBundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (!v6)
  {
    -[SRSiriPresentationPluginHost _rescanBundles](self, "_rescanBundles");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _bundleURLsByBundleIdentifier](self, "_bundleURLsByBundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v4));

  }
  return v6;
}

- (id)_siriPresentationPluginBundleWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _cachedURLForBundleWithIdentifier:](self, "_cachedURLForBundleWithIdentifier:", v4));
  if (v5)
    v6 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", v5));
  else
    v6 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", v4));
  v7 = (void *)v6;

  return v7;
}

- (void)preloadPresentationBundleWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SRSiriPresentationPluginHost preloadPresentationBundleWithIdentifier:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _siriPresentationPluginBundleWithIdentifier:](self, "_siriPresentationPluginBundleWithIdentifier:", v4));
  if ((objc_msgSend(v6, "isLoaded") & 1) == 0)
    objc_msgSend(v6, "load");

}

- (id)presentationWithIdentifier:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _builtInPresentationWithIdentifier:delegate:dataSource:](self, "_builtInPresentationWithIdentifier:delegate:dataSource:", v8, v9, v10));
  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _siriPresentationPluginBundleWithIdentifier:](self, "_siriPresentationPluginBundleWithIdentifier:", v8));
    v13 = objc_alloc((Class)objc_msgSend(v12, "principalClass"));
    if ((objc_opt_respondsToSelector(v13, "initWithDelegate:dataSource:") & 1) != 0)
      v14 = objc_msgSend(v13, "initWithDelegate:dataSource:", v9, v10);
    else
      v14 = objc_msgSend(v13, "init");
    v11 = v14;

  }
  return v11;
}

- (id)_propertyListRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _bundleURLsByBundleIdentifier](self, "_bundleURLsByBundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v3, "count")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _bundleURLsByBundleIdentifier](self, "_bundleURLsByBundleIdentifier"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005AA34;
  v8[3] = &unk_100123C90;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

- (void)_loadFromPropertyListRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005AB54;
  v7[3] = &unk_100123CB8;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
  v6 = v8;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _bundleURLsByBundleIdentifier](self, "_bundleURLsByBundleIdentifier"));
  objc_msgSend(v5, "setDictionary:", v6);

}

- (void)_load
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  if (!-[SRSiriPresentationPluginHost _isLoaded](self, "_isLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _URL](self, "_URL"));
    v13 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v3, 1, &v13));
    v5 = v13;

    if (v4)
    {
      v12 = 0;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v4, 0, 0, &v12));
      v7 = v12;

      if (v6)
      {
        -[SRSiriPresentationPluginHost _loadFromPropertyListRepresentation:](self, "_loadFromPropertyListRepresentation:", v6);
      }
      else
      {
        v10 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
          sub_1000A0124(self, v10);
      }

      goto LABEL_15;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    if (objc_msgSend(v8, "isEqualToString:", NSCocoaErrorDomain))
    {
      v9 = objc_msgSend(v5, "code");

      if (v9 == (id)260)
      {
LABEL_14:
        v7 = v5;
LABEL_15:
        -[SRSiriPresentationPluginHost _setLoaded:](self, "_setLoaded:", 1);

        return;
      }
    }
    else
    {

    }
    v11 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_1000A0088(self, v11);
    goto LABEL_14;
  }
}

- (void)_save
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  SRSiriPresentationPluginHost *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _propertyListRepresentation](self, "_propertyListRepresentation"));
  v12 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v3, 200, 0, &v12));
  v5 = v12;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriPresentationPluginHost _URL](self, "_URL"));
    v11 = v5;
    v7 = objc_msgSend(v4, "writeToURL:options:error:", v6, 1, &v11);
    v8 = v11;

    if ((v7 & 1) == 0)
    {
      v9 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v14 = "-[SRSiriPresentationPluginHost _save]";
        v15 = 2112;
        v16 = self;
        v17 = 2112;
        v18 = v6;
        v19 = 2112;
        v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s %@ unable to write property list representation data to %@: %@", buf, 0x2Au);
      }
    }

  }
  else
  {
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v14 = "-[SRSiriPresentationPluginHost _save]";
      v15 = 2114;
      v16 = self;
      v17 = 2112;
      v18 = v3;
      v19 = 2114;
      v20 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s %{public}@ unable to create property list data from property list representation %@: %{public}@", buf, 0x2Au);
    }
    v8 = v5;
  }

}

- (NSURL)_URL
{
  return self->_URL;
}

- (BOOL)_isLoaded
{
  return self->_loaded;
}

- (void)_setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (NSMutableDictionary)_bundleURLsByBundleIdentifier
{
  return self->_bundleURLsByBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleURLsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
