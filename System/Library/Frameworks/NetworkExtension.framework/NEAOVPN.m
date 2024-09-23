@implementation NEAOVPN

- (NEAOVPN)initWithCoder:(id)a3
{
  id v4;
  NEAOVPN *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *interfaceProtocolMapping;
  uint64_t v12;
  NSString *activeInterfaceProtocolKey;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSDictionary *serviceExceptions;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSDictionary *applicationExceptions;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSDictionary *allowedCaptiveNetworkPlugins;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)NEAOVPN;
  v5 = -[NEAOVPN init](&v33, sel_init);
  if (v5)
  {
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Enabled"));
    v5->_toggleEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ToggleEnabled"));
    v5->_allowCaptiveWebSheet = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AllowCaptiveWebSheet"));
    v5->_allowAllCaptiveNetworkPlugins = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AllowAllCaptiveNetworkPlugins"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("InterfaceProtocolMapping"));
    v10 = objc_claimAutoreleasedReturnValue();
    interfaceProtocolMapping = v5->_interfaceProtocolMapping;
    v5->_interfaceProtocolMapping = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ActiveInterfaceProtocolKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    activeInterfaceProtocolKey = v5->_activeInterfaceProtocolKey;
    v5->_activeInterfaceProtocolKey = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("ServiceExceptions"));
    v18 = objc_claimAutoreleasedReturnValue();
    serviceExceptions = v5->_serviceExceptions;
    v5->_serviceExceptions = (NSDictionary *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("ApplicationExceptions"));
    v24 = objc_claimAutoreleasedReturnValue();
    applicationExceptions = v5->_applicationExceptions;
    v5->_applicationExceptions = (NSDictionary *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("AllowedCaptiveNetworkPlugins"));
    v30 = objc_claimAutoreleasedReturnValue();
    allowedCaptiveNetworkPlugins = v5->_allowedCaptiveNetworkPlugins;
    v5->_allowedCaptiveNetworkPlugins = (NSDictionary *)v30;

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
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NEAOVPN isEnabled](self, "isEnabled"), CFSTR("Enabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEAOVPN isToggleEnabled](self, "isToggleEnabled"), CFSTR("ToggleEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEAOVPN isAllowCaptiveWebSheet](self, "isAllowCaptiveWebSheet"), CFSTR("AllowCaptiveWebSheet"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEAOVPN isAllowAllCaptiveNetworkPlugins](self, "isAllowAllCaptiveNetworkPlugins"), CFSTR("AllowAllCaptiveNetworkPlugins"));
  -[NEAOVPN interfaceProtocolMapping](self, "interfaceProtocolMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("InterfaceProtocolMapping"));

  -[NEAOVPN activeInterfaceProtocolKey](self, "activeInterfaceProtocolKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ActiveInterfaceProtocolKey"));

  -[NEAOVPN serviceExceptions](self, "serviceExceptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ServiceExceptions"));

  -[NEAOVPN applicationExceptions](self, "applicationExceptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ApplicationExceptions"));

  -[NEAOVPN allowedCaptiveNetworkPlugins](self, "allowedCaptiveNetworkPlugins");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("AllowedCaptiveNetworkPlugins"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NEAOVPN *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[NEAOVPN init](+[NEAOVPN allocWithZone:](NEAOVPN, "allocWithZone:", a3), "init");
  -[NEAOVPN setEnabled:](v4, "setEnabled:", -[NEAOVPN isEnabled](self, "isEnabled"));
  -[NEAOVPN setToggleEnabled:](v4, "setToggleEnabled:", -[NEAOVPN isToggleEnabled](self, "isToggleEnabled"));
  -[NEAOVPN setAllowCaptiveWebSheet:](v4, "setAllowCaptiveWebSheet:", -[NEAOVPN isAllowCaptiveWebSheet](self, "isAllowCaptiveWebSheet"));
  -[NEAOVPN setAllowAllCaptiveNetworkPlugins:](v4, "setAllowAllCaptiveNetworkPlugins:", -[NEAOVPN isAllowAllCaptiveNetworkPlugins](self, "isAllowAllCaptiveNetworkPlugins"));
  -[NEAOVPN interfaceProtocolMapping](self, "interfaceProtocolMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAOVPN setInterfaceProtocolMapping:](v4, "setInterfaceProtocolMapping:", v5);

  -[NEAOVPN activeInterfaceProtocolKey](self, "activeInterfaceProtocolKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAOVPN setActiveInterfaceProtocolKey:](v4, "setActiveInterfaceProtocolKey:", v6);

  -[NEAOVPN serviceExceptions](self, "serviceExceptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAOVPN setServiceExceptions:](v4, "setServiceExceptions:", v7);

  -[NEAOVPN applicationExceptions](self, "applicationExceptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAOVPN setApplicationExceptions:](v4, "setApplicationExceptions:", v8);

  -[NEAOVPN allowedCaptiveNetworkPlugins](self, "allowedCaptiveNetworkPlugins");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAOVPN setAllowedCaptiveNetworkPlugins:](v4, "setAllowedCaptiveNetworkPlugins:", v9);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _UNKNOWN **v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NEAOVPN *v20;
  _UNKNOWN **v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v53;
  id obj;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NEAOVPN interfaceProtocolMapping](self, "interfaceProtocolMapping");
  v5 = objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing interface to protocol mapping"), v4);
    goto LABEL_25;
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  -[NEAOVPN interfaceProtocolMapping](self, "interfaceProtocolMapping");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
  if (!v6)
  {
    LODWORD(v5) = 1;
    goto LABEL_24;
  }
  v7 = v6;
  LODWORD(v5) = 1;
  v8 = &off_1E3CBB000;
  v55 = v4;
  v56 = *(id *)v73;
  do
  {
    v9 = 0;
    v53 = v7;
    do
    {
      if (*(id *)v73 != v56)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v9);
      if ((isa_nsstring(v10) & 1) == 0)
      {
        +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid interface name in interface to protocol mapping"), v4);
        LODWORD(v5) = 0;
      }
      -[NEAOVPN interfaceProtocolMapping](self, "interfaceProtocolMapping");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        LODWORD(v5) = objc_msgSend(v12, "checkValidityAndCollectErrors:", v4) & v5;
      }
      else
      {
        +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid protocol"), v4);
        LODWORD(v5) = 0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        objc_msgSend(v13, "IKESecurityAssociationParameters");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "diffieHellmanGroup") <= 13)
        {

        }
        else
        {
          objc_msgSend(v13, "childSecurityAssociationParameters");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "diffieHellmanGroup");

          if (v16 > 13)
            goto LABEL_18;
        }
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v13, "IKESecurityAssociationParameters");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "diffieHellmanGroup");
        objc_msgSend(v13, "childSecurityAssociationParameters");
        v20 = self;
        v21 = v8;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("Invalid DH group (parent %ld child %ld), minimum allowed is %ld"), v19, objc_msgSend(v22, "diffieHellmanGroup"), 14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v23, v55);

        v8 = v21;
        self = v20;

        LODWORD(v5) = 0;
LABEL_18:

        v4 = v55;
        v7 = v53;
      }

      ++v9;
    }
    while (v7 != v9);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
  }
  while (v7);
LABEL_24:

LABEL_25:
  -[NEAOVPN serviceExceptions](self, "serviceExceptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    -[NEAOVPN serviceExceptions](self, "serviceExceptions");
    v57 = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v69 != v27)
            objc_enumerationMutation(v57);
          v29 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          if ((isa_nsstring(v29) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid service name for service exceptions"), v4);
            LODWORD(v5) = 0;
          }
          -[NEAOVPN serviceExceptions](self, "serviceExceptions");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            LODWORD(v5) = objc_msgSend(v31, "checkValidityAndCollectErrors:", v4) & v5;
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid service exception"), v4);
            LODWORD(v5) = 0;
          }

        }
        v26 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
      }
      while (v26);
    }

  }
  -[NEAOVPN applicationExceptions](self, "applicationExceptions");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    -[NEAOVPN applicationExceptions](self, "applicationExceptions");
    v58 = (id)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v65 != v35)
            objc_enumerationMutation(v58);
          v37 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
          if ((isa_nsstring(v37) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid bundle identifier for application exception"), v4);
            LODWORD(v5) = 0;
          }
          -[NEAOVPN applicationExceptions](self, "applicationExceptions");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKeyedSubscript:", v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            LODWORD(v5) = objc_msgSend(v39, "checkValidityAndCollectErrors:", v4) & v5;
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid application exception"), v4);
            LODWORD(v5) = 0;
          }
          objc_msgSend(v39, "limitToProtocols");
          v40 = objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            v41 = (void *)v40;
            objc_msgSend(v39, "limitToProtocols");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v42, "count"))
            {
              v43 = objc_msgSend(v39, "isLimitedToUDP");

              if ((v43 & 1) == 0)
              {
                +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid application exception LimitToProtocol specified"), v4);
                LODWORD(v5) = 0;
              }
            }
            else
            {

            }
          }

        }
        v34 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
      }
      while (v34);
    }

  }
  -[NEAOVPN allowedCaptiveNetworkPlugins](self, "allowedCaptiveNetworkPlugins");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    -[NEAOVPN allowedCaptiveNetworkPlugins](self, "allowedCaptiveNetworkPlugins");
    v59 = (id)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v61;
      do
      {
        for (k = 0; k != v46; ++k)
        {
          if (*(_QWORD *)v61 != v47)
            objc_enumerationMutation(v59);
          v49 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * k);
          if ((isa_nsstring(v49) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid bundle identifier for allowed Captive network plugin"), v4);
            LODWORD(v5) = 0;
          }
          -[NEAOVPN allowedCaptiveNetworkPlugins](self, "allowedCaptiveNetworkPlugins");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "objectForKeyedSubscript:", v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            LODWORD(v5) = objc_msgSend(v51, "checkValidityAndCollectErrors:", v4) & v5;
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid Captive network plugin exception"), v4);
            LODWORD(v5) = 0;
          }

        }
        v46 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
      }
      while (v46);
    }

  }
  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEAOVPN isEnabled](self, "isEnabled"), CFSTR("enabled"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEAOVPN isToggleEnabled](self, "isToggleEnabled"), CFSTR("toggle-enabled"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEAOVPN isAllowCaptiveWebSheet](self, "isAllowCaptiveWebSheet"), CFSTR("allow-captive-websheet"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEAOVPN isAllowAllCaptiveNetworkPlugins](self, "isAllowAllCaptiveNetworkPlugins"), CFSTR("allow-all-captive-network-plugins"), v5, a4);
  -[NEAOVPN interfaceProtocolMapping](self, "interfaceProtocolMapping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("interface-to-protocol-mapping"), v5, a4);

  -[NEAOVPN activeInterfaceProtocolKey](self, "activeInterfaceProtocolKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("active-interface-protocol-key"), v5, a4);

  -[NEAOVPN serviceExceptions](self, "serviceExceptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("service-exceptions"), v5, a4);

  -[NEAOVPN applicationExceptions](self, "applicationExceptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("application-exceptions"), v5, a4);

  -[NEAOVPN allowedCaptiveNetworkPlugins](self, "allowedCaptiveNetworkPlugins");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("allowed-captive-network-plugins"), v5, a4);

  return v7;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isToggleEnabled
{
  return self->_toggleEnabled;
}

- (void)setToggleEnabled:(BOOL)a3
{
  self->_toggleEnabled = a3;
}

- (BOOL)isAllowCaptiveWebSheet
{
  return self->_allowCaptiveWebSheet;
}

- (void)setAllowCaptiveWebSheet:(BOOL)a3
{
  self->_allowCaptiveWebSheet = a3;
}

- (BOOL)isAllowAllCaptiveNetworkPlugins
{
  return self->_allowAllCaptiveNetworkPlugins;
}

- (void)setAllowAllCaptiveNetworkPlugins:(BOOL)a3
{
  self->_allowAllCaptiveNetworkPlugins = a3;
}

- (NSDictionary)interfaceProtocolMapping
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInterfaceProtocolMapping:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)activeInterfaceProtocolKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActiveInterfaceProtocolKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSDictionary)serviceExceptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServiceExceptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSDictionary)applicationExceptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setApplicationExceptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSDictionary)allowedCaptiveNetworkPlugins
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAllowedCaptiveNetworkPlugins:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedCaptiveNetworkPlugins, 0);
  objc_storeStrong((id *)&self->_applicationExceptions, 0);
  objc_storeStrong((id *)&self->_serviceExceptions, 0);
  objc_storeStrong((id *)&self->_activeInterfaceProtocolKey, 0);
  objc_storeStrong((id *)&self->_interfaceProtocolMapping, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
