@implementation ComponentMagsafe

- (BOOL)isPresent
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  id v18;
  uint8_t buf[4];
  unsigned int v20;
  __int16 v21;
  NSObject *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NFAccessoryHardwareManager sharedHardwareManager](NFAccessoryHardwareManager, "sharedHardwareManager"));
  -[ComponentMagsafe setHwManager:](self, "setHwManager:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentMagsafe hwManager](self, "hwManager"));
  if (!v4)
  {
    v10 = DiagnosticLogHandleForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to get NFAccessoryHardwareManager to check for Magsafe presence", buf, 2u);
    }
    goto LABEL_12;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentMagsafe hwManager](self, "hwManager"));
  v18 = 0;
  v6 = objc_msgSend(v5, "getHwSupport:error:", 1, &v18);
  v7 = v18;

  if (v6 != 2 || v7)
  {
    v11 = DiagnosticLogHandleForCategory(6);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

LABEL_12:
      v9 = 0;
      goto LABEL_13;
    }
    *(_DWORD *)buf = 67109378;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    v13 = "Failed to find magsafe support. Supported: %d Error: %@";
    v14 = v12;
    v15 = 18;
LABEL_15:
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentMagsafe dieId](self, "dieId"));

  if (!v8)
  {
    v16 = DiagnosticLogHandleForCategory(6);
    v12 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v13 = "Magsafe is supported but unable to get die ID";
    v14 = v12;
    v15 = 2;
    goto LABEL_15;
  }
  v7 = 0;
  v9 = 1;
LABEL_13:

  return v9;
}

- (void)populateAttributes:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentMagsafe dieId](self, "dieId"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("dieId"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ComponentMagsafe controllerInfo](self, "controllerInfo"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("controllerInfo"));

}

- (id)dieId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentMagsafe hwManager](self, "hwManager"));
  v9 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getDieId:", &v9));
  v4 = v9;

  if (!v3 || v4)
  {
    v6 = DiagnosticLogHandleForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to get die ID. Error: %@", buf, 0xCu);
    }

    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "base64EncodedStringWithOptions:", 0));
  }

  return v5;
}

- (id)controllerInfo
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentMagsafe hwManager](self, "hwManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getInfo"));

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Controller")));
    if (v6)
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("firmwareVersion")));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("firmwareVersion"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("firmwareRevision")));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("firmwareRevision"));

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("ROMVersion")));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("romVersion"));

    }
    else
    {
      v12 = DiagnosticLogHandleForCategory(6);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to get magsafe controller info", buf, 2u);
      }

      v7 = 0;
    }
  }
  else
  {
    v11 = DiagnosticLogHandleForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to get magsafe hardware info", v15, 2u);
    }
  }

  return v3;
}

- (NFAccessoryHardwareManager)hwManager
{
  return self->_hwManager;
}

- (void)setHwManager:(id)a3
{
  objc_storeStrong((id *)&self->_hwManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hwManager, 0);
}

@end
