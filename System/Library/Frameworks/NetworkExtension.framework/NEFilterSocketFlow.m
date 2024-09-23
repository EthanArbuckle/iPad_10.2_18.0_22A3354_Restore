@implementation NEFilterSocketFlow

- (NEFilterSocketFlow)initWithCoder:(id)a3
{
  id v4;
  NEFilterSocketFlow *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NEFilterSocketFlow;
  v5 = -[NEFilterFlow initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    -[NEFilterSocketFlow setSocketFamily:](v5, "setSocketFamily:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("SocketFamily")));
    -[NEFilterSocketFlow setSocketType:](v5, "setSocketType:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("SocketType")));
    -[NEFilterSocketFlow setSocketProtocol:](v5, "setSocketProtocol:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("SocketProtocol")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEFilterSocketFlow setUuid:](v5, "setUuid:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEFilterSocketFlow setEuuid:](v5, "setEuuid:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LocalEndpoint"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyCEndpoint");
    -[NEFilterSocketFlow setLocalFlowEndpoint:](v5, "setLocalFlowEndpoint:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RemoteEndpoint"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copyCEndpoint");
    -[NEFilterSocketFlow setRemoteFlowEndpoint:](v5, "setRemoteFlowEndpoint:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RemoteHostname"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEFilterSocketFlow setRemoteHostname:](v5, "setRemoteHostname:", v12);

    v5->_socketID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SocketID"));
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
  void *v15;
  unint64_t socketID;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NEFilterSocketFlow;
  -[NEFilterFlow encodeWithCoder:](&v17, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt:forKey:", -[NEFilterSocketFlow socketFamily](self, "socketFamily"), CFSTR("SocketFamily"));
  objc_msgSend(v4, "encodeInt:forKey:", -[NEFilterSocketFlow socketType](self, "socketType"), CFSTR("SocketType"));
  objc_msgSend(v4, "encodeInt:forKey:", -[NEFilterSocketFlow socketProtocol](self, "socketProtocol"), CFSTR("SocketProtocol"));
  -[NEFilterSocketFlow uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UUID"));

  -[NEFilterSocketFlow euuid](self, "euuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("EUUID"));

  -[NEFilterSocketFlow localFlowEndpoint](self, "localFlowEndpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CCEC78];
    -[NEFilterSocketFlow localFlowEndpoint](self, "localFlowEndpoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endpointWithCEndpoint:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("LocalEndpoint"));

  }
  -[NEFilterSocketFlow remoteFlowEndpoint](self, "remoteFlowEndpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CCEC78];
    -[NEFilterSocketFlow remoteFlowEndpoint](self, "remoteFlowEndpoint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endpointWithCEndpoint:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("RemoteEndpoint"));

  }
  -[NEFilterSocketFlow remoteHostname](self, "remoteHostname");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("RemoteHostname"));

  if (self)
    socketID = self->_socketID;
  else
    socketID = 0;
  objc_msgSend(v4, "encodeInt64:forKey:", socketID, CFSTR("SocketID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t socketID;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NEFilterSocketFlow;
  v4 = -[NEFilterFlow copyWithZone:](&v12, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setSocketFamily:", -[NEFilterSocketFlow socketFamily](self, "socketFamily"));
  objc_msgSend(v4, "setSocketType:", -[NEFilterSocketFlow socketType](self, "socketType"));
  objc_msgSend(v4, "setSocketProtocol:", -[NEFilterSocketFlow socketProtocol](self, "socketProtocol"));
  -[NEFilterSocketFlow uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUuid:", v5);

  -[NEFilterSocketFlow euuid](self, "euuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEuuid:", v6);

  -[NEFilterSocketFlow localFlowEndpoint](self, "localFlowEndpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalFlowEndpoint:", v7);

  -[NEFilterSocketFlow remoteFlowEndpoint](self, "remoteFlowEndpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteFlowEndpoint:", v8);

  -[NEFilterSocketFlow remoteHostname](self, "remoteHostname");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteHostname:", v9);

  if (!self)
  {
    socketID = 0;
    if (!v4)
      return v4;
    goto LABEL_3;
  }
  socketID = self->_socketID;
  if (v4)
LABEL_3:
    v4[24] = socketID;
  return v4;
}

- (NWEndpoint)remoteEndpoint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NEFilterSocketFlow remoteFlowEndpoint](self, "remoteFlowEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CCEC78];
    -[NEFilterSocketFlow remoteFlowEndpoint](self, "remoteFlowEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointWithCEndpoint:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NWEndpoint *)v6;
}

- (NWEndpoint)localEndpoint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NEFilterSocketFlow localFlowEndpoint](self, "localFlowEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CCEC78];
    -[NEFilterSocketFlow localFlowEndpoint](self, "localFlowEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointWithCEndpoint:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NWEndpoint *)v6;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  id v8;
  unint64_t socketID;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v5 = *(_QWORD *)&a3;
  v17.receiver = self;
  v17.super_class = (Class)NEFilterSocketFlow;
  -[NEFilterFlow descriptionWithIndent:options:](&v17, sel_descriptionWithIndent_options_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    socketID = 0;
    goto LABEL_4;
  }
  if (self->_socketID != -1)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    socketID = self->_socketID;
LABEL_4:
    v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%llx"), socketID);
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("socketID"), v5, a4);

  }
  -[NEFilterSocketFlow localFlowEndpoint](self, "localFlowEndpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("localEndpoint"), v5, a4 | 1);

  -[NEFilterSocketFlow remoteFlowEndpoint](self, "remoteFlowEndpoint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("remoteEndpoint"), v5, a4 | 1);

  -[NEFilterSocketFlow remoteHostname](self, "remoteHostname");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("remoteHostname"), v5, a4 | 1);

  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterSocketFlow socketProtocol](self, "socketProtocol"), CFSTR("protocol"), v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterSocketFlow socketFamily](self, "socketFamily"), CFSTR("family"), v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterSocketFlow socketType](self, "socketType"), CFSTR("type"), v5, a4);
  -[NEFilterSocketFlow uuid](self, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("procUUID"), v5, a4);

  -[NEFilterSocketFlow euuid](self, "euuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("eprocUUID"), v5, a4);

  return v7;
}

- (id)identifier
{
  unint64_t socketID;
  int64_t *p_generateIdentifierOnce;
  id v5;
  objc_super v7;
  _QWORD block[6];

  if (self)
  {
    socketID = self->_socketID;
    if (socketID == -1)
    {
      v7.receiver = self;
      v7.super_class = (Class)NEFilterSocketFlow;
      -[NEFilterFlow identifier](&v7, sel_identifier);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      return v5;
    }
  }
  else
  {
    socketID = 0;
  }
  p_generateIdentifierOnce = &self->_generateIdentifierOnce;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__NEFilterSocketFlow_identifier__block_invoke;
  block[3] = &unk_1E3CC14D0;
  block[4] = self;
  block[5] = socketID;
  if (self->_generateIdentifierOnce != -1)
    dispatch_once(p_generateIdentifierOnce, block);
  v5 = objc_getProperty(self, a2, 200, 1);
  return v5;
}

- (id)identifierString
{
  id v3;
  unint64_t socketID;
  void *v5;
  objc_super v7;

  if (self)
  {
    if (self->_socketID == -1)
    {
      v7.receiver = self;
      v7.super_class = (Class)NEFilterSocketFlow;
      -[NEFilterFlow identifierString](&v7, sel_identifierString);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    socketID = self->_socketID;
  }
  else
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    socketID = 0;
  }
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%llx"), socketID);
  return v5;
}

- (BOOL)createNewFlowReply:(id)a3 controlSocket:(int)a4 verdict:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  unint64_t socketID;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  const char *v20;
  NSObject *v21;
  unsigned __int8 v22;
  NEFilterAbsoluteVerdict *v23;
  const char *v24;
  NEFilterAbsoluteVerdict *v25;
  uint64_t v26;
  SEL v27;
  id Property;
  const char *v29;
  uint64_t v30;
  id v31;
  void *v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!v11)
  {
    +[NEFilterNewFlowVerdict allowVerdict](NEFilterNewFlowVerdict, "allowVerdict");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v11, "drop"))
  {
    if (self)
    {
      socketID = self->_socketID;
      if (socketID == -1)
      {
        -[NEFilterSocketFlow writeXPCMessage:drop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:](self, v10, 0, objc_msgSend(v11, "filterInbound") - 1, objc_msgSend(v11, "peekInboundBytes"), objc_msgSend(v11, "filterOutbound") - 1, objc_msgSend(v11, "peekOutboundBytes"), objc_msgSend(v11, "statisticsReportFrequency"));
        goto LABEL_17;
      }
    }
    else
    {
      socketID = 0;
    }
    +[NEFilterSocketFlow writeMessageWithControlSocket:drop:socketID:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:]((uint64_t)NEFilterSocketFlow, a4, 0, socketID, objc_msgSend(v11, "filterInbound") - 1, objc_msgSend(v11, "peekInboundBytes"), objc_msgSend(v11, "filterOutbound") - 1, objc_msgSend(v11, "peekOutboundBytes"), objc_msgSend(v11, "statisticsReportFrequency"));
LABEL_17:
    v23 = -[NEFilterAbsoluteVerdict initWithDrop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:]([NEFilterAbsoluteVerdict alloc], "initWithDrop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:", 0, objc_msgSend(v11, "filterInbound") - 1, objc_msgSend(v11, "peekInboundBytes"), objc_msgSend(v11, "filterOutbound") - 1, objc_msgSend(v11, "peekOutboundBytes"));
    v25 = v23;
    if (self)
    {
      objc_setProperty_atomic(self, v24, v23, 104);

      v26 = objc_msgSend(v11, "shouldReport");
      Property = objc_getProperty(self, v27, 104, 1);
    }
    else
    {

      v26 = objc_msgSend(v11, "shouldReport");
      Property = 0;
    }
    objc_msgSend(Property, "setShouldReport:", v26);
    v30 = objc_msgSend(v11, "statisticsReportFrequency");
    if (self)
      v31 = objc_getProperty(self, v29, 104, 1);
    else
      v31 = 0;
    objc_msgSend(v31, "setStatisticsReportFrequency:", v30);
    v22 = -[NEFilterFlow shouldCloseWithVerdict:](self, v11);
    goto LABEL_22;
  }
  if (self)
  {
    v13 = self->_socketID;
    if (v13 == -1)
    {
      -[NEFilterSocketFlow writeXPCMessage:drop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:](self, v10, 1, 0, 0, 0, 0, 0);
      objc_msgSend(v12, "_principalObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "filterConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "organization");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v15, "filterConfiguration");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "organization");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v20 = (const char *)objc_msgSend(v19, "cStringUsingEncoding:", 4);

        xpc_dictionary_set_string(v10, "organization", v20);
      }

      goto LABEL_13;
    }
  }
  else
  {
    v13 = 0;
  }
  +[NEFilterSocketFlow writeMessageWithControlSocket:drop:socketID:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:]((uint64_t)NEFilterSocketFlow, a4, 1, v13, 0, 0, 0, 0, 0);
LABEL_13:
  ne_log_obj();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    -[NEFilterSocketFlow identifierString](self, "identifierString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v33;
    _os_log_debug_impl(&dword_19BD16000, v21, OS_LOG_TYPE_DEBUG, "Dropping new flow %@", buf, 0xCu);

  }
  v22 = 1;
LABEL_22:

  return v22;
}

- (BOOL)createDataReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7
{
  id v11;
  char v12;
  const char *v13;
  id v14;
  int v15;
  unint64_t socketID;
  SEL v17;
  char v18;
  uint64_t v19;
  SEL v20;
  uint64_t v21;
  SEL v22;
  uint64_t v23;
  SEL v24;
  uint64_t v25;
  SEL v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  SEL v30;
  uint64_t v31;
  SEL v32;
  uint64_t v33;
  SEL v34;
  uint64_t v35;
  SEL v36;
  uint64_t v37;
  SEL v38;
  uint64_t v39;

  v11 = a3;
  v12 = -[NEFilterFlow updateCurrentVerdictFromDataVerdict:direction:](self, a6, a5);
  v14 = v11;
  if (self)
  {
    if (self->_socketID == -1)
    {
      v29 = objc_msgSend(objc_getProperty(self, v13, 104, 1), "drop");
      v31 = objc_msgSend(objc_getProperty(self, v30, 104, 1), "inboundPassOffset");
      v33 = objc_msgSend(objc_getProperty(self, v32, 104, 1), "inboundPeekOffset");
      v35 = objc_msgSend(objc_getProperty(self, v34, 104, 1), "outboundPassOffset");
      v37 = objc_msgSend(objc_getProperty(self, v36, 104, 1), "outboundPeekOffset");
      v39 = objc_msgSend(objc_getProperty(self, v38, 104, 1), "statisticsReportFrequency");
      -[NEFilterSocketFlow writeXPCMessage:drop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:](self, v14, v29, v31, v33, v35, v37, v39);
    }
    else
    {
      v15 = objc_msgSend(objc_getProperty(self, v13, 104, 1), "drop");
      socketID = self->_socketID;
      v18 = v12;
      v19 = objc_msgSend(objc_getProperty(self, v17, 104, 1), "inboundPassOffset");
      v21 = objc_msgSend(objc_getProperty(self, v20, 104, 1), "inboundPeekOffset");
      v23 = objc_msgSend(objc_getProperty(self, v22, 104, 1), "outboundPassOffset");
      v25 = objc_msgSend(objc_getProperty(self, v24, 104, 1), "outboundPeekOffset");
      v27 = objc_msgSend(objc_getProperty(self, v26, 104, 1), "statisticsReportFrequency");
      v28 = v19;
      v12 = v18;
      +[NEFilterSocketFlow writeMessageWithControlSocket:drop:socketID:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:]((uint64_t)NEFilterSocketFlow, a4, v15, socketID, v28, v21, v23, v25, v27);
    }
  }

  return v12;
}

- (BOOL)createDataCompleteReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  void *v14;
  BOOL v15;

  v9 = *(_QWORD *)&a4;
  v12 = a7;
  v13 = a3;
  if ((objc_msgSend(a6, "drop") & 1) != 0)
    +[NEFilterDataVerdict dropVerdict](NEFilterDataVerdict, "dropVerdict");
  else
    +[NEFilterDataVerdict allowVerdict](NEFilterDataVerdict, "allowVerdict");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[NEFilterSocketFlow createDataReply:controlSocket:direction:verdict:context:](self, "createDataReply:controlSocket:direction:verdict:context:", v13, v9, a5, v14, v12);

  return v15;
}

- (OS_nw_endpoint)remoteFlowEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 168, 1);
}

- (void)setRemoteFlowEndpoint:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (NSString)remoteHostname
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setRemoteHostname:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (OS_nw_endpoint)localFlowEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLocalFlowEndpoint:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (int)socketFamily
{
  return self->_socketFamily;
}

- (void)setSocketFamily:(int)a3
{
  self->_socketFamily = a3;
}

- (int)socketType
{
  return self->_socketType;
}

- (void)setSocketType:(int)a3
{
  self->_socketType = a3;
}

- (int)socketProtocol
{
  return self->_socketProtocol;
}

- (void)setSocketProtocol:(int)a3
{
  self->_socketProtocol = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSUUID)euuid
{
  return self->_euuid;
}

- (void)setEuuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_euuid, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_socketUUID, 0);
  objc_storeStrong((id *)&self->_localFlowEndpoint, 0);
  objc_storeStrong((id *)&self->_remoteHostname, 0);
  objc_storeStrong((id *)&self->_remoteFlowEndpoint, 0);
}

+ (void)writeMessageWithControlSocket:(int)a3 drop:(uint64_t)a4 socketID:(uint64_t)a5 inboundPassOffset:(uint64_t)a6 inboundPeekOffset:(uint64_t)a7 outboundPassOffset:(uint64_t)a8 outboundPeekOffset:(uint64_t)a9 statsReportFrequency:
{
  int v16;
  int v17;
  unint64_t v18;
  ssize_t v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  char *v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (a2 < 0)
    return;
  v25 = 0x100000040;
  if (a3)
    v16 = 17;
  else
    v16 = 16;
  v26 = 2;
  v27 = v16;
  v28 = a4;
  v29 = a5;
  v30 = a6;
  v31 = a7;
  v32 = a8;
  v33 = 0;
  objc_opt_self();
  if ((unint64_t)(a9 - 1) > 2)
    v17 = 0;
  else
    v17 = dword_19BED60B0[a9 - 1];
  v18 = 0;
  LODWORD(v33) = v17;
  while (1)
  {
    v19 = write(a2, (char *)&v25 + v18, 64 - v18);
    if (v19 < 1)
      break;
    v18 += v19;
LABEL_13:
    if (v18 > 0x3F)
      return;
  }
  if ((v19 & 0x8000000000000000) == 0 || *__error() == 35)
    goto LABEL_13;
  v20 = *__error();
  ne_log_obj();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20 == 22)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v35 = v27;
      _os_log_debug_impl(&dword_19BD16000, v22, OS_LOG_TYPE_DEBUG, "Sent a %d message for a non-existent socket", buf, 8u);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v23 = v27;
    v24 = strerror(v20);
    *(_DWORD *)buf = 67109378;
    v35 = v23;
    v36 = 2080;
    v37 = v24;
    _os_log_error_impl(&dword_19BD16000, v22, OS_LOG_TYPE_ERROR, "Write operation on the control socket failed while sending a %d message (%s)", buf, 0x12u);
  }

}

- (void)writeXPCMessage:(int)a3 drop:(uint64_t)a4 inboundPassOffset:(uint64_t)a5 inboundPeekOffset:(uint64_t)a6 outboundPassOffset:(uint64_t)a7 outboundPeekOffset:(uint64_t)a8 statsReportFrequency:
{
  id v15;
  NSObject *v16;
  const char *v17;
  SEL v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  id Property;
  const char *v23;
  _BYTE v24[22];
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  ne_log_obj();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    Property = objc_getProperty(a1, v17, 120, 1);
    v23 = "allow";
    *(_DWORD *)v24 = 138413570;
    *(_QWORD *)&v24[4] = Property;
    *(_WORD *)&v24[12] = 2080;
    if (a3)
      v23 = "drop";
    *(_QWORD *)&v24[14] = v23;
    v25 = 2048;
    v26 = a4;
    v27 = 2048;
    v28 = a5;
    v29 = 2048;
    v30 = a6;
    v31 = 2048;
    v32 = a7;
    _os_log_debug_impl(&dword_19BD16000, v16, OS_LOG_TYPE_DEBUG, "%@ send verdict: %s, in (%lld/%lld), out (%lld/%lld)", v24, 0x3Eu);
  }

  *(_QWORD *)v24 = 0;
  *(_QWORD *)&v24[8] = 0;
  uuid_clear(v24);
  objc_msgSend(objc_getProperty(a1, v18, 120, 1), "getUUIDBytes:", v24);
  xpc_dictionary_set_uuid(v15, "flow-uuid", v24);
  v19 = 3;
  if ((a6 & a4) == 0xFFFFFFFFFFFFFFFFLL)
    v19 = 1;
  if (a3)
    v20 = 2;
  else
    v20 = v19;
  xpc_dictionary_set_int64(v15, "verdict-value", v20);
  xpc_dictionary_set_uint64(v15, "input-pass-offset", a4);
  xpc_dictionary_set_uint64(v15, "input-peek-offset", a5);
  xpc_dictionary_set_uint64(v15, "output-pass-offset", a6);
  xpc_dictionary_set_uint64(v15, "output-peek-offset", a7);
  objc_opt_self();
  v21 = 0;
  if ((unint64_t)(a8 - 1) <= 2)
    v21 = dword_19BED60B0[a8 - 1];
  xpc_dictionary_set_uint64(v15, "stats-report-frequency", v21);

}

void __32__NEFilterSocketFlow_identifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uuid_t dst;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(dst, 0, sizeof(dst));
  uuid_copy(dst, "؛[]y<I@");
  *(_QWORD *)&dst[8] = *(_QWORD *)(a1 + 40);
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", dst);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 200);
  *(_QWORD *)(v3 + 200) = v2;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)initWithSocketFamily:(int)a3 socketType:(int)a4 socketProtocol:(uint64_t)a5 pid:(uint64_t)a6 epid:(uint64_t)a7 uuid:(uint64_t)a8 euuid:(uint64_t)a9 socketID:
{
  id v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  if (!a1)
    return 0;
  v21.receiver = a1;
  v21.super_class = (Class)NEFilterSocketFlow;
  v16 = objc_msgSendSuper2(&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    *((_DWORD *)v16 + 38) = a2;
    *((_DWORD *)v16 + 39) = a3;
    *((_DWORD *)v16 + 40) = a4;
    *((_QWORD *)v16 + 24) = a9;
    objc_msgSend(v16, "setPid:", a5);
    objc_msgSend(v17, "setEpid:", a6);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a7);
    objc_msgSend(v17, "setUuid:", v18);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a8);
    objc_msgSend(v17, "setEuuid:", v19);

  }
  return v17;
}

- (void)setRemoteAddress:(void *)a1
{
  int sa_family;
  nw_endpoint_t v5;
  NSObject *v6;

  if (address)
  {
    sa_family = address->sa_family;
    if (sa_family == 30 || sa_family == 2)
    {
      v5 = nw_endpoint_create_address(address);
      if (v5)
      {
        v6 = v5;
        objc_msgSend(a1, "setRemoteFlowEndpoint:", v5);
        v5 = v6;
      }

    }
  }
}

- (void)setLocalAddress:(void *)a1
{
  int sa_family;
  nw_endpoint_t v5;
  NSObject *v6;

  if (address)
  {
    sa_family = address->sa_family;
    if (sa_family == 30 || sa_family == 2)
    {
      v5 = nw_endpoint_create_address(address);
      if (v5)
      {
        v6 = v5;
        objc_msgSend(a1, "setLocalFlowEndpoint:", v5);
        v5 = v6;
      }

    }
  }
}

@end
