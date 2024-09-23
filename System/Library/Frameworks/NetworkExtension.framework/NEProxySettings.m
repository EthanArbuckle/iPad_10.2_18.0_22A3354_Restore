@implementation NEProxySettings

- (NEProxySettings)init
{
  NEProxySettings *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEProxySettings;
  result = -[NEProxySettings init](&v3, sel_init);
  if (result)
    result->_usePassiveFTP = 1;
  return result;
}

- (NEProxySettings)initWithCoder:(id)a3
{
  id v4;
  NEProxySettings *v5;
  uint64_t v6;
  NSURL *proxyAutoConfigURL;
  uint64_t v8;
  NSString *proxyAutoConfigJavaScript;
  uint64_t v10;
  NEProxyServer *HTTPServer;
  uint64_t v12;
  NEProxyServer *HTTPSServer;
  uint64_t v14;
  NEProxyServer *FTPServer;
  uint64_t v16;
  NEProxyServer *SOCKSServer;
  uint64_t v18;
  NEProxyServer *RTSPServer;
  uint64_t v20;
  NEProxyServer *gopherServer;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *exceptionList;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *supplementalMatchDomains;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSArray *supplementalMatchOrders;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)NEProxySettings;
  v5 = -[NEProxySettings init](&v38, sel_init);
  if (v5)
  {
    v5->_autoProxyDiscovery = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AutoProxyDiscovery"));
    v5->_autoProxyConfigurationEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AutoProxyConfigurationEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AutoConfigURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    proxyAutoConfigURL = v5->_proxyAutoConfigURL;
    v5->_proxyAutoConfigURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AutoConfigJavaScript"));
    v8 = objc_claimAutoreleasedReturnValue();
    proxyAutoConfigJavaScript = v5->_proxyAutoConfigJavaScript;
    v5->_proxyAutoConfigJavaScript = (NSString *)v8;

    v5->_HTTPEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HTTPEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HTTPServer"));
    v10 = objc_claimAutoreleasedReturnValue();
    HTTPServer = v5->_HTTPServer;
    v5->_HTTPServer = (NEProxyServer *)v10;

    v5->_HTTPSEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HTTPSEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HTTPSServer"));
    v12 = objc_claimAutoreleasedReturnValue();
    HTTPSServer = v5->_HTTPSServer;
    v5->_HTTPSServer = (NEProxyServer *)v12;

    v5->_FTPEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FTPEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FTPServer"));
    v14 = objc_claimAutoreleasedReturnValue();
    FTPServer = v5->_FTPServer;
    v5->_FTPServer = (NEProxyServer *)v14;

    v5->_SOCKSEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SOCKSEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SOCKSServer"));
    v16 = objc_claimAutoreleasedReturnValue();
    SOCKSServer = v5->_SOCKSServer;
    v5->_SOCKSServer = (NEProxyServer *)v16;

    v5->_RTSPEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RTSPEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RTSPServer"));
    v18 = objc_claimAutoreleasedReturnValue();
    RTSPServer = v5->_RTSPServer;
    v5->_RTSPServer = (NEProxyServer *)v18;

    v5->_gopherEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("GopherEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GopherServer"));
    v20 = objc_claimAutoreleasedReturnValue();
    gopherServer = v5->_gopherServer;
    v5->_gopherServer = (NEProxyServer *)v20;

    v5->_excludeSimpleHostnames = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ExcludeSimpleHostnames"));
    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("ExceptionList"));
    v25 = objc_claimAutoreleasedReturnValue();
    exceptionList = v5->_exceptionList;
    v5->_exceptionList = (NSArray *)v25;

    v5->_usePassiveFTP = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UsePassiveFTP"));
    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("SupplementalMatchDomains"));
    v30 = objc_claimAutoreleasedReturnValue();
    supplementalMatchDomains = v5->_supplementalMatchDomains;
    v5->_supplementalMatchDomains = (NSArray *)v30;

    v32 = (void *)MEMORY[0x1E0C99E60];
    v33 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("SupplementalMatchOrders"));
    v35 = objc_claimAutoreleasedReturnValue();
    supplementalMatchOrders = v5->_supplementalMatchOrders;
    v5->_supplementalMatchOrders = (NSArray *)v35;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings autoProxyDiscovery](self, "autoProxyDiscovery"), CFSTR("AutoProxyDiscovery"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings autoProxyConfigurationEnabled](self, "autoProxyConfigurationEnabled"), CFSTR("AutoProxyConfigurationEnabled"));
  -[NEProxySettings proxyAutoConfigURL](self, "proxyAutoConfigURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("AutoConfigURL"));

  -[NEProxySettings proxyAutoConfigJavaScript](self, "proxyAutoConfigJavaScript");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("AutoConfigJavaScript"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings HTTPEnabled](self, "HTTPEnabled"), CFSTR("HTTPEnabled"));
  -[NEProxySettings HTTPServer](self, "HTTPServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HTTPServer"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings HTTPSEnabled](self, "HTTPSEnabled"), CFSTR("HTTPSEnabled"));
  -[NEProxySettings HTTPSServer](self, "HTTPSServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HTTPSServer"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings FTPEnabled](self, "FTPEnabled"), CFSTR("FTPEnabled"));
  -[NEProxySettings FTPServer](self, "FTPServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("FTPServer"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings SOCKSEnabled](self, "SOCKSEnabled"), CFSTR("SOCKSEnabled"));
  -[NEProxySettings SOCKSServer](self, "SOCKSServer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("SOCKSServer"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings RTSPEnabled](self, "RTSPEnabled"), CFSTR("RTSPEnabled"));
  -[NEProxySettings RTSPServer](self, "RTSPServer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("RTSPServer"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings gopherEnabled](self, "gopherEnabled"), CFSTR("GopherEnabled"));
  -[NEProxySettings gopherServer](self, "gopherServer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("GopherServer"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings excludeSimpleHostnames](self, "excludeSimpleHostnames"), CFSTR("ExcludeSimpleHostnames"));
  -[NEProxySettings exceptionList](self, "exceptionList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("ExceptionList"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings usePassiveFTP](self, "usePassiveFTP"), CFSTR("UsePassiveFTP"));
  -[NEProxySettings supplementalMatchDomains](self, "supplementalMatchDomains");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("SupplementalMatchDomains"));

  -[NEProxySettings supplementalMatchOrders](self, "supplementalMatchOrders");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("SupplementalMatchOrders"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NEProxySettings *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = -[NEProxySettings init](+[NEProxySettings allocWithZone:](NEProxySettings, "allocWithZone:", a3), "init");
  -[NEProxySettings setAutoProxyDiscovery:](v4, "setAutoProxyDiscovery:", -[NEProxySettings autoProxyDiscovery](self, "autoProxyDiscovery"));
  -[NEProxySettings setAutoProxyConfigurationEnabled:](v4, "setAutoProxyConfigurationEnabled:", -[NEProxySettings autoProxyConfigurationEnabled](self, "autoProxyConfigurationEnabled"));
  -[NEProxySettings proxyAutoConfigURL](self, "proxyAutoConfigURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxySettings setProxyAutoConfigURL:](v4, "setProxyAutoConfigURL:", v5);

  -[NEProxySettings proxyAutoConfigJavaScript](self, "proxyAutoConfigJavaScript");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxySettings setProxyAutoConfigJavaScript:](v4, "setProxyAutoConfigJavaScript:", v6);

  -[NEProxySettings setHTTPEnabled:](v4, "setHTTPEnabled:", -[NEProxySettings HTTPEnabled](self, "HTTPEnabled"));
  -[NEProxySettings HTTPServer](self, "HTTPServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxySettings setHTTPServer:](v4, "setHTTPServer:", v7);

  -[NEProxySettings setHTTPSEnabled:](v4, "setHTTPSEnabled:", -[NEProxySettings HTTPSEnabled](self, "HTTPSEnabled"));
  -[NEProxySettings HTTPSServer](self, "HTTPSServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxySettings setHTTPSServer:](v4, "setHTTPSServer:", v8);

  -[NEProxySettings setFTPEnabled:](v4, "setFTPEnabled:", -[NEProxySettings FTPEnabled](self, "FTPEnabled"));
  -[NEProxySettings FTPServer](self, "FTPServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxySettings setFTPServer:](v4, "setFTPServer:", v9);

  -[NEProxySettings setSOCKSEnabled:](v4, "setSOCKSEnabled:", -[NEProxySettings SOCKSEnabled](self, "SOCKSEnabled"));
  -[NEProxySettings SOCKSServer](self, "SOCKSServer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxySettings setSOCKSServer:](v4, "setSOCKSServer:", v10);

  -[NEProxySettings setRTSPEnabled:](v4, "setRTSPEnabled:", -[NEProxySettings RTSPEnabled](self, "RTSPEnabled"));
  -[NEProxySettings RTSPServer](self, "RTSPServer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxySettings setRTSPServer:](v4, "setRTSPServer:", v11);

  -[NEProxySettings setGopherEnabled:](v4, "setGopherEnabled:", -[NEProxySettings gopherEnabled](self, "gopherEnabled"));
  -[NEProxySettings gopherServer](self, "gopherServer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxySettings setGopherServer:](v4, "setGopherServer:", v12);

  -[NEProxySettings setExcludeSimpleHostnames:](v4, "setExcludeSimpleHostnames:", -[NEProxySettings excludeSimpleHostnames](self, "excludeSimpleHostnames"));
  -[NEProxySettings exceptionList](self, "exceptionList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxySettings setExceptionList:](v4, "setExceptionList:", v13);

  -[NEProxySettings setUsePassiveFTP:](v4, "setUsePassiveFTP:", -[NEProxySettings usePassiveFTP](self, "usePassiveFTP"));
  -[NEProxySettings supplementalMatchDomains](self, "supplementalMatchDomains");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxySettings setSupplementalMatchDomains:](v4, "setSupplementalMatchDomains:", v14);

  -[NEProxySettings supplementalMatchOrders](self, "supplementalMatchOrders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxySettings setSupplementalMatchOrders:](v4, "setSupplementalMatchOrders:", v15);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NEProxySettings HTTPServer](self, "HTTPServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NEProxySettings HTTPServer](self, "HTTPServer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "checkValidityAndCollectErrors:", v4);

  }
  else
  {
    v7 = 1;
  }

  -[NEProxySettings HTTPSServer](self, "HTTPSServer");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[NEProxySettings HTTPSServer](self, "HTTPSServer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "checkValidityAndCollectErrors:", v4);

    v7 &= v11;
  }
  -[NEProxySettings FTPServer](self, "FTPServer");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[NEProxySettings FTPServer](self, "FTPServer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "checkValidityAndCollectErrors:", v4);

    v7 &= v15;
  }
  -[NEProxySettings SOCKSServer](self, "SOCKSServer");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[NEProxySettings SOCKSServer](self, "SOCKSServer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "checkValidityAndCollectErrors:", v4);

    v7 &= v19;
  }
  -[NEProxySettings RTSPServer](self, "RTSPServer");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[NEProxySettings RTSPServer](self, "RTSPServer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "checkValidityAndCollectErrors:", v4);

    v7 &= v23;
  }
  -[NEProxySettings gopherServer](self, "gopherServer");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[NEProxySettings gopherServer](self, "gopherServer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "checkValidityAndCollectErrors:", v4);

    v7 &= v27;
  }
  -[NEProxySettings exceptionList](self, "exceptionList");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    -[NEProxySettings exceptionList](self, "exceptionList");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v56 != v32)
            objc_enumerationMutation(v29);
          if ((isa_nsstring(*(void **)(*((_QWORD *)&v55 + 1) + 8 * i)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Non-string for proxy exception"), v4);
            v7 = 0;
          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v31);
    }

  }
  -[NEProxySettings supplementalMatchDomains](self, "supplementalMatchDomains");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[NEProxySettings supplementalMatchDomains](self, "supplementalMatchDomains");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v52 != v38)
            objc_enumerationMutation(v35);
          if ((isa_nsstring(*(void **)(*((_QWORD *)&v51 + 1) + 8 * j)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Non-string for proxy supplemental match domain"), v4);
            v7 = 0;
          }
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v37);
    }

  }
  -[NEProxySettings supplementalMatchOrders](self, "supplementalMatchOrders");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[NEProxySettings supplementalMatchOrders](self, "supplementalMatchOrders", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v48;
      do
      {
        for (k = 0; k != v43; ++k)
        {
          if (*(_QWORD *)v48 != v44)
            objc_enumerationMutation(v41);
          if ((isa_nsnumber(*(void **)(*((_QWORD *)&v47 + 1) + 8 * k)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Non-number for proxy supplemental match order"), v4);
            v7 = 0;
          }
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
      }
      while (v43);
    }

  }
  return v7 & 1;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = a4 & 0xFFFFFFFFFFFFFFF7;
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings autoProxyDiscovery](self, "autoProxyDiscovery"), CFSTR("autoProxyDiscovery"), v5, a4 & 0xFFFFFFFFFFFFFFF7);
  a4 |= 8uLL;
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings autoProxyConfigurationEnabled](self, "autoProxyConfigurationEnabled"), CFSTR("autoProxyConfigurationEnabled"), v5, a4);
  -[NEProxySettings proxyAutoConfigURL](self, "proxyAutoConfigURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("proxyAutoConfigurationURL"), v5, a4);

  -[NEProxySettings proxyAutoConfigJavaScript](self, "proxyAutoConfigJavaScript");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("proxyAutoConfigurationJavaScript"), v5, a4);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings HTTPEnabled](self, "HTTPEnabled"), CFSTR("HTTPEnabled"), v5, a4);
  -[NEProxySettings HTTPServer](self, "HTTPServer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("HTTPServer"), v5, a4);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings HTTPSEnabled](self, "HTTPSEnabled"), CFSTR("HTTPSEnabled"), v5, a4);
  -[NEProxySettings HTTPSServer](self, "HTTPSServer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("HTTPSServer"), v5, a4);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings FTPEnabled](self, "FTPEnabled"), CFSTR("FTPEnabled"), v5, v8);
  -[NEProxySettings FTPServer](self, "FTPServer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("FTPServer"), v5, v8);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings SOCKSEnabled](self, "SOCKSEnabled"), CFSTR("SOCKSEnabled"), v5, v8);
  -[NEProxySettings SOCKSServer](self, "SOCKSServer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("SOCKSServer"), v5, v8);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings RTSPEnabled](self, "RTSPEnabled"), CFSTR("RTSPEnabled"), v5, v8);
  -[NEProxySettings RTSPServer](self, "RTSPServer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v16, CFSTR("RTSPServer"), v5, v8);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings gopherEnabled](self, "gopherEnabled"), CFSTR("gopherEnabled"), v5, v8);
  -[NEProxySettings gopherServer](self, "gopherServer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v17, CFSTR("gopherServer"), v5, v8);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings excludeSimpleHostnames](self, "excludeSimpleHostnames"), CFSTR("excludeSimpleHostnames"), v5, v8);
  -[NEProxySettings exceptionList](self, "exceptionList");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v18, CFSTR("exceptionList"), v5, v8);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings usePassiveFTP](self, "usePassiveFTP"), CFSTR("usePassiveFTP"), v5, v8);
  -[NEProxySettings supplementalMatchDomains](self, "supplementalMatchDomains");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v19, CFSTR("supplementalMatchDomains"), v5, a4);

  -[NEProxySettings supplementalMatchOrders](self, "supplementalMatchOrders");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v20, CFSTR("supplementalMatchOrders"), v5, a4);

  return v7;
}

- (id)copyLegacyDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[NEProxySettings autoProxyDiscovery](self, "autoProxyDiscovery"))
    v4 = &unk_1E3D037C0;
  else
    v4 = &unk_1E3D037D8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CE8F08]);
  if (-[NEProxySettings autoProxyConfigurationEnabled](self, "autoProxyConfigurationEnabled"))
    v5 = &unk_1E3D037C0;
  else
    v5 = &unk_1E3D037D8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CE8EF0]);
  -[NEProxySettings proxyAutoConfigURL](self, "proxyAutoConfigURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEProxySettings proxyAutoConfigURL](self, "proxyAutoConfigURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CE8F00]);

  }
  else
  {
    -[NEProxySettings proxyAutoConfigJavaScript](self, "proxyAutoConfigJavaScript");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_12;
    -[NEProxySettings proxyAutoConfigJavaScript](self, "proxyAutoConfigJavaScript");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CE8EF8]);
  }

LABEL_12:
  if (-[NEProxySettings HTTPEnabled](self, "HTTPEnabled"))
    v10 = &unk_1E3D037C0;
  else
    v10 = &unk_1E3D037D8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CE8EB0]);
  -[NEProxySettings HTTPServer](self, "HTTPServer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NEProxySettings HTTPServer](self, "HTTPServer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "address");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CE8EC0]);

    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[NEProxySettings HTTPServer](self, "HTTPServer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "port"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CE8EB8]);

    -[NEProxySettings HTTPServer](self, "HTTPServer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "username");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[NEProxySettings HTTPServer](self, "HTTPServer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "username");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0CE8EE8]);

    }
  }
  if (-[NEProxySettings HTTPSEnabled](self, "HTTPSEnabled"))
    v21 = &unk_1E3D037C0;
  else
    v21 = &unk_1E3D037D8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CE8EC8]);
  -[NEProxySettings HTTPSServer](self, "HTTPSServer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[NEProxySettings HTTPSServer](self, "HTTPSServer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "address");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CE8ED8]);

    v25 = (void *)MEMORY[0x1E0CB37E8];
    -[NEProxySettings HTTPSServer](self, "HTTPSServer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v26, "port"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0CE8ED0]);

    -[NEProxySettings HTTPSServer](self, "HTTPSServer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "username");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[NEProxySettings HTTPSServer](self, "HTTPSServer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "username");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0CE8EE0]);

    }
  }
  if (-[NEProxySettings FTPEnabled](self, "FTPEnabled"))
    v32 = &unk_1E3D037C0;
  else
    v32 = &unk_1E3D037D8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0CE8E60]);
  if (-[NEProxySettings usePassiveFTP](self, "usePassiveFTP"))
    v33 = &unk_1E3D037C0;
  else
    v33 = &unk_1E3D037D8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0CE8E68]);
  -[NEProxySettings FTPServer](self, "FTPServer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[NEProxySettings FTPServer](self, "FTPServer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "address");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0CE8E78]);

    v37 = (void *)MEMORY[0x1E0CB37E8];
    -[NEProxySettings FTPServer](self, "FTPServer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v38, "port"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0CE8E70]);

    -[NEProxySettings FTPServer](self, "FTPServer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "username");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      -[NEProxySettings FTPServer](self, "FTPServer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "username");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, *MEMORY[0x1E0CE8E80]);

    }
  }
  if (-[NEProxySettings gopherEnabled](self, "gopherEnabled"))
    v44 = &unk_1E3D037C0;
  else
    v44 = &unk_1E3D037D8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, *MEMORY[0x1E0CE8E90]);
  -[NEProxySettings gopherServer](self, "gopherServer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[NEProxySettings gopherServer](self, "gopherServer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "address");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, *MEMORY[0x1E0CE8EA0]);

    v48 = (void *)MEMORY[0x1E0CB37E8];
    -[NEProxySettings gopherServer](self, "gopherServer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "numberWithInteger:", objc_msgSend(v49, "port"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, *MEMORY[0x1E0CE8E98]);

    -[NEProxySettings gopherServer](self, "gopherServer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "username");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      -[NEProxySettings gopherServer](self, "gopherServer");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "username");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, *MEMORY[0x1E0CE8EA8]);

    }
  }
  if (-[NEProxySettings RTSPEnabled](self, "RTSPEnabled"))
    v55 = &unk_1E3D037C0;
  else
    v55 = &unk_1E3D037D8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, *MEMORY[0x1E0CE8F10]);
  -[NEProxySettings RTSPServer](self, "RTSPServer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[NEProxySettings RTSPServer](self, "RTSPServer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "address");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, *MEMORY[0x1E0CE8F20]);

    v59 = (void *)MEMORY[0x1E0CB37E8];
    -[NEProxySettings RTSPServer](self, "RTSPServer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "numberWithInteger:", objc_msgSend(v60, "port"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, *MEMORY[0x1E0CE8F18]);

    -[NEProxySettings RTSPServer](self, "RTSPServer");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "username");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63)
    {
      -[NEProxySettings RTSPServer](self, "RTSPServer");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "username");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, *MEMORY[0x1E0CE8F28]);

    }
  }
  if (-[NEProxySettings SOCKSEnabled](self, "SOCKSEnabled"))
    v66 = &unk_1E3D037C0;
  else
    v66 = &unk_1E3D037D8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, *MEMORY[0x1E0CE8F30]);
  -[NEProxySettings SOCKSServer](self, "SOCKSServer");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    -[NEProxySettings SOCKSServer](self, "SOCKSServer");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "address");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, *MEMORY[0x1E0CE8F40]);

    v70 = (void *)MEMORY[0x1E0CB37E8];
    -[NEProxySettings SOCKSServer](self, "SOCKSServer");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "numberWithInteger:", objc_msgSend(v71, "port"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, *MEMORY[0x1E0CE8F38]);

    -[NEProxySettings SOCKSServer](self, "SOCKSServer");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "username");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
    {
      -[NEProxySettings SOCKSServer](self, "SOCKSServer");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "username");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, *MEMORY[0x1E0CE8F48]);

    }
  }
  if (-[NEProxySettings excludeSimpleHostnames](self, "excludeSimpleHostnames"))
    v77 = &unk_1E3D037C0;
  else
    v77 = &unk_1E3D037D8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, *MEMORY[0x1E0CE8E58]);
  -[NEProxySettings exceptionList](self, "exceptionList");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    -[NEProxySettings exceptionList](self, "exceptionList");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v79, *MEMORY[0x1E0CE8E50]);

  }
  -[NEProxySettings supplementalMatchDomains](self, "supplementalMatchDomains");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    -[NEProxySettings supplementalMatchDomains](self, "supplementalMatchDomains");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, *MEMORY[0x1E0CE8F50]);

  }
  -[NEProxySettings supplementalMatchOrders](self, "supplementalMatchOrders");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    -[NEProxySettings supplementalMatchOrders](self, "supplementalMatchOrders");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, *MEMORY[0x1E0CE8F58]);

  }
  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4;
  NEProxySettings *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSURL *proxyAutoConfigURL;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  NEProxyServer *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NEProxyServer *HTTPServer;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  int v49;
  NEProxyServer *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NEProxyServer *HTTPSServer;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  int v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  int v65;
  NEProxyServer *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NEProxyServer *FTPServer;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  int v75;
  void *v76;
  uint64_t v77;
  void *v78;
  int v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  int v85;
  NEProxyServer *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  NEProxyServer *gopherServer;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  int v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  int v101;
  NEProxyServer *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  NEProxyServer *RTSPServer;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  int v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  int v117;
  NEProxyServer *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  NEProxyServer *SOCKSServer;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  int v127;
  void *v128;
  uint64_t v129;
  void *v130;
  int v131;
  void *v132;
  uint64_t v133;
  NSArray *exceptionList;
  uint64_t v135;
  void *v136;
  int v137;
  void *v138;
  uint64_t v139;
  NSArray *supplementalMatchDomains;
  uint64_t v141;
  void *v142;
  int v143;
  void *v144;
  uint64_t v145;
  NSArray *supplementalMatchOrders;

  v4 = a3;
  v5 = -[NEProxySettings init](self, "init");
  if (!v5)
    goto LABEL_63;
  v6 = *MEMORY[0x1E0CE8F08];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8F08]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = isa_nsnumber(v7);

  if (v8)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoProxyDiscovery = objc_msgSend(v9, "BOOLValue");

  }
  v10 = *MEMORY[0x1E0CE8EF0];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8EF0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = isa_nsnumber(v11);

  if (v12)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoProxyConfigurationEnabled = objc_msgSend(v13, "BOOLValue");

  }
  v14 = *MEMORY[0x1E0CE8F00];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8F00]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = isa_nsstring(v15);

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "objectForKeyedSubscript:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLWithString:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    proxyAutoConfigURL = v5->_proxyAutoConfigURL;
    v5->_proxyAutoConfigURL = (NSURL *)v19;
  }
  else
  {
    v21 = *MEMORY[0x1E0CE8EF8];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8EF8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = isa_nsstring(v22);

    if (!v23)
      goto LABEL_11;
    objc_msgSend(v4, "objectForKeyedSubscript:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v18, "copy");
    proxyAutoConfigURL = (NSURL *)v5->_proxyAutoConfigJavaScript;
    v5->_proxyAutoConfigJavaScript = (NSString *)v24;
  }

LABEL_11:
  v25 = *MEMORY[0x1E0CE8EB0];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8EB0]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = isa_nsnumber(v26);

  if (v27)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_HTTPEnabled = objc_msgSend(v28, "BOOLValue");

  }
  v29 = *MEMORY[0x1E0CE8EC0];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8EC0]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isa_nsstring(v30))
    goto LABEL_17;
  v31 = *MEMORY[0x1E0CE8EB8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8EB8]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = isa_nsnumber(v32);

  if (v33)
  {
    v34 = [NEProxyServer alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", v29);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v31);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[NEProxyServer initWithType:address:port:](v34, "initWithType:address:port:", 1, v35, (int)objc_msgSend(v36, "intValue"));
    HTTPServer = v5->_HTTPServer;
    v5->_HTTPServer = (NEProxyServer *)v37;

    v39 = *MEMORY[0x1E0CE8EE8];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8EE8]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v36) = isa_nsstring(v40);

    if ((_DWORD)v36)
    {
      -[NEProxyServer setAuthenticationRequired:](v5->_HTTPServer, "setAuthenticationRequired:", 1);
      objc_msgSend(v4, "objectForKeyedSubscript:", v39);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer setUsername:](v5->_HTTPServer, "setUsername:", v30);
LABEL_17:

    }
  }
  v41 = *MEMORY[0x1E0CE8EC8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8EC8]);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = isa_nsnumber(v42);

  if (v43)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v41);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_HTTPSEnabled = objc_msgSend(v44, "BOOLValue");

  }
  v45 = *MEMORY[0x1E0CE8ED8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8ED8]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isa_nsstring(v46))
    goto LABEL_24;
  v47 = *MEMORY[0x1E0CE8ED0];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8ED0]);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = isa_nsnumber(v48);

  if (v49)
  {
    v50 = [NEProxyServer alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", v45);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v47);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[NEProxyServer initWithType:address:port:](v50, "initWithType:address:port:", 2, v51, (int)objc_msgSend(v52, "intValue"));
    HTTPSServer = v5->_HTTPSServer;
    v5->_HTTPSServer = (NEProxyServer *)v53;

    v55 = *MEMORY[0x1E0CE8EE0];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8EE0]);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v52) = isa_nsstring(v56);

    if ((_DWORD)v52)
    {
      -[NEProxyServer setAuthenticationRequired:](v5->_HTTPSServer, "setAuthenticationRequired:", 1);
      objc_msgSend(v4, "objectForKeyedSubscript:", v55);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer setUsername:](v5->_HTTPSServer, "setUsername:", v46);
LABEL_24:

    }
  }
  v57 = *MEMORY[0x1E0CE8E60];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8E60]);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = isa_nsnumber(v58);

  if (v59)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v57);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_FTPEnabled = objc_msgSend(v60, "BOOLValue");

  }
  v61 = *MEMORY[0x1E0CE8E78];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8E78]);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isa_nsstring(v62))
    goto LABEL_31;
  v63 = *MEMORY[0x1E0CE8E70];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8E70]);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = isa_nsnumber(v64);

  if (v65)
  {
    v66 = [NEProxyServer alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", v61);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v63);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = -[NEProxyServer initWithType:address:port:](v66, "initWithType:address:port:", 3, v67, (int)objc_msgSend(v68, "intValue"));
    FTPServer = v5->_FTPServer;
    v5->_FTPServer = (NEProxyServer *)v69;

    v71 = *MEMORY[0x1E0CE8E80];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8E80]);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v68) = isa_nsstring(v72);

    if ((_DWORD)v68)
    {
      -[NEProxyServer setAuthenticationRequired:](v5->_FTPServer, "setAuthenticationRequired:", 1);
      objc_msgSend(v4, "objectForKeyedSubscript:", v71);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer setUsername:](v5->_FTPServer, "setUsername:", v62);
LABEL_31:

    }
  }
  v73 = *MEMORY[0x1E0CE8E68];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8E68]);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = isa_nsnumber(v74);

  if (v75)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v73);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_usePassiveFTP = objc_msgSend(v76, "BOOLValue");

  }
  v77 = *MEMORY[0x1E0CE8E90];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8E90]);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = isa_nsnumber(v78);

  if (v79)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v77);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_gopherEnabled = objc_msgSend(v80, "BOOLValue");

  }
  v81 = *MEMORY[0x1E0CE8EA0];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8EA0]);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isa_nsstring(v82))
    goto LABEL_40;
  v83 = *MEMORY[0x1E0CE8E98];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8E98]);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = isa_nsnumber(v84);

  if (v85)
  {
    v86 = [NEProxyServer alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", v81);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v83);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = -[NEProxyServer initWithType:address:port:](v86, "initWithType:address:port:", 6, v87, (int)objc_msgSend(v88, "intValue"));
    gopherServer = v5->_gopherServer;
    v5->_gopherServer = (NEProxyServer *)v89;

    v91 = *MEMORY[0x1E0CE8EA8];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8EA8]);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v88) = isa_nsstring(v92);

    if ((_DWORD)v88)
    {
      -[NEProxyServer setAuthenticationRequired:](v5->_gopherServer, "setAuthenticationRequired:", 1);
      objc_msgSend(v4, "objectForKeyedSubscript:", v91);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer setUsername:](v5->_gopherServer, "setUsername:", v82);
LABEL_40:

    }
  }
  v93 = *MEMORY[0x1E0CE8F10];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8F10]);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = isa_nsnumber(v94);

  if (v95)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v93);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_RTSPEnabled = objc_msgSend(v96, "BOOLValue");

  }
  v97 = *MEMORY[0x1E0CE8F20];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8F20]);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isa_nsstring(v98))
    goto LABEL_47;
  v99 = *MEMORY[0x1E0CE8F18];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8F18]);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = isa_nsnumber(v100);

  if (v101)
  {
    v102 = [NEProxyServer alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", v97);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v99);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = -[NEProxyServer initWithType:address:port:](v102, "initWithType:address:port:", 4, v103, (int)objc_msgSend(v104, "intValue"));
    RTSPServer = v5->_RTSPServer;
    v5->_RTSPServer = (NEProxyServer *)v105;

    v107 = *MEMORY[0x1E0CE8F28];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8F28]);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v104) = isa_nsstring(v108);

    if ((_DWORD)v104)
    {
      -[NEProxyServer setAuthenticationRequired:](v5->_RTSPServer, "setAuthenticationRequired:", 1);
      objc_msgSend(v4, "objectForKeyedSubscript:", v107);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer setUsername:](v5->_RTSPServer, "setUsername:", v98);
LABEL_47:

    }
  }
  v109 = *MEMORY[0x1E0CE8F30];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8F30]);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = isa_nsnumber(v110);

  if (v111)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v109);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_SOCKSEnabled = objc_msgSend(v112, "BOOLValue");

  }
  v113 = *MEMORY[0x1E0CE8F40];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8F40]);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsstring(v114))
  {
    v115 = *MEMORY[0x1E0CE8F38];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8F38]);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = isa_nsnumber(v116);

    if (!v117)
      goto LABEL_55;
    v118 = [NEProxyServer alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", v113);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v115);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = -[NEProxyServer initWithType:address:port:](v118, "initWithType:address:port:", 5, v119, (int)objc_msgSend(v120, "intValue"));
    SOCKSServer = v5->_SOCKSServer;
    v5->_SOCKSServer = (NEProxyServer *)v121;

    v123 = *MEMORY[0x1E0CE8F48];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8F48]);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v120) = isa_nsstring(v124);

    if (!(_DWORD)v120)
      goto LABEL_55;
    -[NEProxyServer setAuthenticationRequired:](v5->_SOCKSServer, "setAuthenticationRequired:", 1);
    objc_msgSend(v4, "objectForKeyedSubscript:", v123);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEProxyServer setUsername:](v5->_SOCKSServer, "setUsername:", v114);
  }

LABEL_55:
  v125 = *MEMORY[0x1E0CE8E58];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8E58]);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = isa_nsnumber(v126);

  if (v127)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v125);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_excludeSimpleHostnames = objc_msgSend(v128, "BOOLValue");

  }
  v129 = *MEMORY[0x1E0CE8E50];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8E50]);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = isa_nsarray(v130);

  if (v131)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v129);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend(v132, "copy");
    exceptionList = v5->_exceptionList;
    v5->_exceptionList = (NSArray *)v133;

  }
  v135 = *MEMORY[0x1E0CE8F50];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8F50]);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = isa_nsarray(v136);

  if (v137)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v135);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = objc_msgSend(v138, "copy");
    supplementalMatchDomains = v5->_supplementalMatchDomains;
    v5->_supplementalMatchDomains = (NSArray *)v139;

  }
  v141 = *MEMORY[0x1E0CE8F58];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8F58]);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = isa_nsarray(v142);

  if (v143)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v141);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = objc_msgSend(v144, "copy");
    supplementalMatchOrders = v5->_supplementalMatchOrders;
    v5->_supplementalMatchOrders = (NSArray *)v145;

  }
LABEL_63:

  return v5;
}

- (void)copyPasswordsFromKeychain
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  id v32;

  -[NEProxySettings HTTPServer](self, "HTTPServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "authenticationRequired");

  if (v4)
  {
    -[NEProxySettings HTTPServer](self, "HTTPServer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copyPassword");
    -[NEProxySettings HTTPServer](self, "HTTPServer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPassword:", v6);

  }
  -[NEProxySettings HTTPSServer](self, "HTTPSServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "authenticationRequired");

  if (v9)
  {
    -[NEProxySettings HTTPSServer](self, "HTTPSServer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copyPassword");
    -[NEProxySettings HTTPSServer](self, "HTTPSServer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPassword:", v11);

  }
  -[NEProxySettings FTPServer](self, "FTPServer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "authenticationRequired");

  if (v14)
  {
    -[NEProxySettings FTPServer](self, "FTPServer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copyPassword");
    -[NEProxySettings FTPServer](self, "FTPServer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPassword:", v16);

  }
  -[NEProxySettings RTSPServer](self, "RTSPServer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "authenticationRequired");

  if (v19)
  {
    -[NEProxySettings RTSPServer](self, "RTSPServer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copyPassword");
    -[NEProxySettings RTSPServer](self, "RTSPServer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPassword:", v21);

  }
  -[NEProxySettings gopherServer](self, "gopherServer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "authenticationRequired");

  if (v24)
  {
    -[NEProxySettings gopherServer](self, "gopherServer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copyPassword");
    -[NEProxySettings gopherServer](self, "gopherServer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setPassword:", v26);

  }
  -[NEProxySettings SOCKSServer](self, "SOCKSServer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "authenticationRequired");

  if (v29)
  {
    -[NEProxySettings SOCKSServer](self, "SOCKSServer");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v32, "copyPassword");
    -[NEProxySettings SOCKSServer](self, "SOCKSServer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setPassword:", v30);

  }
}

- (NEProxyServer)HTTPServer
{
  NEProxySettings *v2;
  NEProxyServer *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_HTTPServer;
  objc_sync_exit(v2);

  return v3;
}

- (void)setHTTPServer:(NEProxyServer *)HTTPServer
{
  NEProxySettings *v4;
  uint64_t v5;
  NEProxyServer *v6;
  NEProxyServer *v7;

  v7 = HTTPServer;
  v4 = self;
  objc_sync_enter(v4);
  -[NEProxyServer setType:](v7, "setType:", 1);
  v5 = -[NEProxyServer copy](v7, "copy");
  v6 = v4->_HTTPServer;
  v4->_HTTPServer = (NEProxyServer *)v5;

  objc_sync_exit(v4);
}

- (NEProxyServer)HTTPSServer
{
  NEProxySettings *v2;
  NEProxyServer *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_HTTPSServer;
  objc_sync_exit(v2);

  return v3;
}

- (void)setHTTPSServer:(NEProxyServer *)HTTPSServer
{
  NEProxySettings *v4;
  uint64_t v5;
  NEProxyServer *v6;
  NEProxyServer *v7;

  v7 = HTTPSServer;
  v4 = self;
  objc_sync_enter(v4);
  -[NEProxyServer setType:](v7, "setType:", 2);
  v5 = -[NEProxyServer copy](v7, "copy");
  v6 = v4->_HTTPSServer;
  v4->_HTTPSServer = (NEProxyServer *)v5;

  objc_sync_exit(v4);
}

- (BOOL)enabled
{
  return -[NEProxySettings HTTPEnabled](self, "HTTPEnabled")
      || -[NEProxySettings HTTPSEnabled](self, "HTTPSEnabled")
      || -[NEProxySettings autoProxyConfigurationEnabled](self, "autoProxyConfigurationEnabled");
}

- (BOOL)useForAllDomains
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[NEProxySettings matchDomains](self, "matchDomains");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NEProxySettings matchDomains](self, "matchDomains");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[NEProxySettings matchDomains](self, "matchDomains");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count") == 1)
      {
        -[NEProxySettings matchDomains](self, "matchDomains");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "length") == 0;

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)autoProxyConfigurationEnabled
{
  return self->_autoProxyConfigurationEnabled;
}

- (void)setAutoProxyConfigurationEnabled:(BOOL)autoProxyConfigurationEnabled
{
  self->_autoProxyConfigurationEnabled = autoProxyConfigurationEnabled;
}

- (BOOL)HTTPEnabled
{
  return self->_HTTPEnabled;
}

- (void)setHTTPEnabled:(BOOL)HTTPEnabled
{
  self->_HTTPEnabled = HTTPEnabled;
}

- (BOOL)HTTPSEnabled
{
  return self->_HTTPSEnabled;
}

- (void)setHTTPSEnabled:(BOOL)HTTPSEnabled
{
  self->_HTTPSEnabled = HTTPSEnabled;
}

- (BOOL)excludeSimpleHostnames
{
  return self->_excludeSimpleHostnames;
}

- (void)setExcludeSimpleHostnames:(BOOL)excludeSimpleHostnames
{
  self->_excludeSimpleHostnames = excludeSimpleHostnames;
}

- (NSArray)exceptionList
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExceptionList:(NSArray *)exceptionList
{
  objc_setProperty_atomic_copy(self, a2, exceptionList, 40);
}

- (BOOL)autoProxyDiscovery
{
  return self->_autoProxyDiscovery;
}

- (void)setAutoProxyDiscovery:(BOOL)a3
{
  self->_autoProxyDiscovery = a3;
}

- (NSURL)proxyAutoConfigURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProxyAutoConfigURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)proxyAutoConfigJavaScript
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProxyAutoConfigJavaScript:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (BOOL)FTPEnabled
{
  return self->_FTPEnabled;
}

- (void)setFTPEnabled:(BOOL)a3
{
  self->_FTPEnabled = a3;
}

- (NEProxyServer)FTPServer
{
  return (NEProxyServer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFTPServer:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (BOOL)SOCKSEnabled
{
  return self->_SOCKSEnabled;
}

- (void)setSOCKSEnabled:(BOOL)a3
{
  self->_SOCKSEnabled = a3;
}

- (NEProxyServer)SOCKSServer
{
  return (NEProxyServer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSOCKSServer:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (BOOL)RTSPEnabled
{
  return self->_RTSPEnabled;
}

- (void)setRTSPEnabled:(BOOL)a3
{
  self->_RTSPEnabled = a3;
}

- (NEProxyServer)RTSPServer
{
  return (NEProxyServer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRTSPServer:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (BOOL)gopherEnabled
{
  return self->_gopherEnabled;
}

- (void)setGopherEnabled:(BOOL)a3
{
  self->_gopherEnabled = a3;
}

- (NEProxyServer)gopherServer
{
  return (NEProxyServer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setGopherServer:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (BOOL)usePassiveFTP
{
  return self->_usePassiveFTP;
}

- (void)setUsePassiveFTP:(BOOL)a3
{
  self->_usePassiveFTP = a3;
}

- (NSArray)supplementalMatchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSupplementalMatchDomains:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSArray)supplementalMatchOrders
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSupplementalMatchOrders:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalMatchOrders, 0);
  objc_storeStrong((id *)&self->_supplementalMatchDomains, 0);
  objc_storeStrong((id *)&self->_gopherServer, 0);
  objc_storeStrong((id *)&self->_RTSPServer, 0);
  objc_storeStrong((id *)&self->_SOCKSServer, 0);
  objc_storeStrong((id *)&self->_FTPServer, 0);
  objc_storeStrong((id *)&self->_proxyAutoConfigJavaScript, 0);
  objc_storeStrong((id *)&self->_proxyAutoConfigURL, 0);
  objc_storeStrong((id *)&self->_exceptionList, 0);
  objc_storeStrong((id *)&self->_HTTPSServer, 0);
  objc_storeStrong((id *)&self->_HTTPServer, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
