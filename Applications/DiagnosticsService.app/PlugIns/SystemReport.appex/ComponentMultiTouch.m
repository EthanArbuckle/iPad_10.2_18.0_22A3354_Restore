@implementation ComponentMultiTouch

- (id)resetCount
{
  void *v2;
  uint64_t v3;
  uint64_t Default;
  uint64_t v5;
  uint64_t v6;
  io_registry_entry_t Service;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v18[16];
  uint8_t buf[16];
  uint8_t v20[8];
  CFMutableDictionaryRef properties;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  Default = MTDeviceCreateDefault(v2, v3);
  if (Default)
  {
    v6 = Default;
    properties = 0;
    Service = MTDeviceGetService(Default, v5);
    if (IORegistryEntryCreateCFProperties(Service, &properties, kCFAllocatorDefault, 0))
    {
      v8 = DiagnosticLogHandleForCategory(6);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error: IORegistryEntryCreateCFProperties failure for AppleMultitouchSPI.", buf, 2u);
      }
    }
    else
    {
      v9 = properties;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](properties, "objectForKeyedSubscript:", CFSTR("ResetCount")));

      if (v12)
      {
        v13 = DiagnosticLogHandleForCategory(6);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v20 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "MultiTouch found", v20, 2u);
        }

        v15 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("ResetCount")));
        v2 = (void *)v15;
      }
    }

    MTDeviceRelease(v6, v16);
  }
  else
  {
    v10 = DiagnosticLogHandleForCategory(6);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error: Could not create default MTDevice.", v18, 2u);
    }

  }
  return v2;
}

- (BOOL)isPresent
{
  void *v2;
  uint64_t v3;
  char v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentMultiTouch resetCount](self, "resetCount"));
  if (v2)
  {
    v3 = objc_opt_class(NSNull);
    v4 = objc_opt_isKindOfClass(v2, v3) ^ 1;
  }
  else
  {
    v4 = 0;
  }

  return v4 & 1;
}

- (void)populateAttributes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ComponentMultiTouch resetCount](self, "resetCount"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("multitouchResetCount"));

}

- (NSMutableDictionary)tmpProfile
{
  return self->_tmpProfile;
}

- (void)setTmpProfile:(id)a3
{
  objc_storeStrong((id *)&self->_tmpProfile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tmpProfile, 0);
}

@end
