@implementation MTRDeviceConnectivityMonitor

- (MTRDeviceConnectivityMonitor)initWithInstanceName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  MTRDeviceConnectivityMonitor *v7;
  uint64_t v8;
  NSString *instanceName;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *connections;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MTRDeviceConnectivityMonitor;
  v7 = -[MTRDeviceConnectivityMonitor init](&v15, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_copy(v4, v5, v6);
    instanceName = v7->_instanceName;
    v7->_instanceName = (NSString *)v8;

    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    connections = v7->_connections;
    v7->_connections = (NSMutableDictionary *)v12;

  }
  return v7;
}

- (MTRDeviceConnectivityMonitor)initWithCompressedFabricID:(id)a3 nodeID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  MTRDeviceConnectivityMonitor *v15;
  void *v16;
  const char *v17;
  _QWORD v19[3];
  _QWORD v20[2];
  uint8_t buf[4];
  MTRDeviceConnectivityMonitor *v22;
  char v23[53];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v10 = objc_msgSend_unsignedLongLongValue(v6, v8, v9);
  v20[0] = objc_msgSend_unsignedLongLongValue(v7, v11, v12);
  v20[1] = v10;
  memset(v19, 0, sizeof(v19));
  sub_2341C4CC8(v23, 0x35uLL, v20, (uint64_t)v19);
  if (LODWORD(v19[0]))
  {
    sub_234117B80(0, "NotSpecified");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = self;
      _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_ERROR, "%@ could not make instance name", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v15 = 0;
  }
  else
  {
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v13, (uint64_t)v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self = (MTRDeviceConnectivityMonitor *)(id)objc_msgSend_initWithInstanceName_(self, v17, (uint64_t)v16);

    v15 = self;
  }

  return v15;
}

- (void)dealloc
{
  _DNSServiceRef_t **begin;
  _DNSServiceRef_t **end;
  objc_super v5;

  begin = self->_resolvers.__begin_;
  end = self->_resolvers.__end_;
  while (begin != end)
    DNSServiceRefDeallocate(*begin++);
  v5.receiver = self;
  v5.super_class = (Class)MTRDeviceConnectivityMonitor;
  -[MTRDeviceConnectivityMonitor dealloc](&v5, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("<MTRDeviceConnectivityMonitor: %@>"), self->_instanceName);
}

+ (_DNSServiceRef_t)_sharedResolverConnection
{
  _DNSServiceRef_t *result;
  DNSServiceErrorType Connection;
  DNSServiceErrorType v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner((const os_unfair_lock *)&unk_256159200);
  result = (_DNSServiceRef_t *)qword_256159208;
  if (!qword_256159208)
  {
    Connection = DNSServiceCreateConnection((DNSServiceRef *)&qword_256159208);
    if (Connection)
    {
      v5 = Connection;
      sub_234117B80(0, "NotSpecified");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v13) = v5;
        _os_log_impl(&dword_233BF3000, v6, OS_LOG_TYPE_ERROR, "MTRDeviceConnectivityMonitor: DNSServiceCreateConnection failed %d", buf, 8u);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
    }
    else
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = dispatch_queue_create("MTRDeviceConnectivityMonitor", v7);
      v9 = (void *)qword_256159210;
      qword_256159210 = (uint64_t)v8;

      if (!DNSServiceSetDispatchQueue((DNSServiceRef)qword_256159208, (dispatch_queue_t)qword_256159210))
        return (_DNSServiceRef_t *)qword_256159208;
      sub_234117B80(0, "NotSpecified");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = a1;
        _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_ERROR, "%@ cannot set dispatch queue on resolve", buf, 0xCu);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
      DNSServiceRefDeallocate((DNSServiceRef)qword_256159208);
      qword_256159208 = 0;
      v11 = (void *)qword_256159210;
      qword_256159210 = 0;

    }
    return 0;
  }
  return result;
}

- (void)_callHandler
{
  void *v3;
  void *v4;

  os_unfair_lock_assert_owner((const os_unfair_lock *)&unk_256159200);
  v3 = (void *)MEMORY[0x23493EEA8](self->_monitorHandler);
  if (v3)
  {
    v4 = v3;
    dispatch_async((dispatch_queue_t)self->_handlerQueue, v3);
    v3 = v4;
  }

}

- (void)handleResolvedHostname:(const char *)a3 port:(unsigned __int16)a4 error:(int)a5
{
  unsigned int v6;
  const char *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  NSObject *host;
  NSObject *secure_udp;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  MTRDeviceConnectivityMonitor *v25;
  _QWORD v26[4];
  id v27;
  _QWORD handler[4];
  id v29;
  char __str[6];
  uint8_t buf[4];
  MTRDeviceConnectivityMonitor *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  char *v36;
  uint64_t v37;

  v6 = a4;
  v37 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_256159200);
  if (a5 == -65563)
  {
    sub_234117B80(0, "NotSpecified");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = self;
      _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_ERROR, "%@ disconnected from dns-sd subsystem", buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v25 = self;
      sub_2341147D0(0, 1);
    }
    objc_msgSend__stopMonitoring(self, v11, v12, v25);
  }
  else
  {
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v9, (uint64_t)a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(self->_connections, v14, (uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      snprintf(__str, 6uLL, "%d", __rev16(v6));
      host = nw_endpoint_create_host(a3, __str);
      if (host)
      {
        secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0880], (nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0870]);
        if (secure_udp)
        {
          v18 = nw_connection_create(host, secure_udp);
          v19 = v18;
          if (v18)
          {
            nw_connection_set_queue(v18, (dispatch_queue_t)qword_256159210);
            objc_initWeak((id *)buf, self);
            v20 = MEMORY[0x24BDAC760];
            handler[0] = MEMORY[0x24BDAC760];
            handler[1] = 3221225472;
            handler[2] = sub_23400D068;
            handler[3] = &unk_250500AD8;
            objc_copyWeak(&v29, (id *)buf);
            nw_connection_set_path_changed_handler(v19, handler);
            v26[0] = v20;
            v26[1] = 3221225472;
            v26[2] = sub_23400D1C4;
            v26[3] = &unk_250500B00;
            objc_copyWeak(&v27, (id *)buf);
            nw_connection_set_viability_changed_handler(v19, v26);
            nw_connection_start(v19);
            objc_msgSend_setObject_forKeyedSubscript_(self->_connections, v21, (uint64_t)v19, v13);
            objc_destroyWeak(&v27);
            objc_destroyWeak(&v29);
            objc_destroyWeak((id *)buf);
          }
          else
          {
            sub_234117B80(0, "NotSpecified");
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v32 = self;
              v33 = 2080;
              v34 = a3;
              v35 = 2080;
              v36 = __str;
              _os_log_impl(&dword_233BF3000, v24, OS_LOG_TYPE_ERROR, "%@ failed to create connection for %s:%s", buf, 0x20u);
            }

            if (sub_234114844(1u))
              sub_2341147D0(0, 1);
          }

        }
        else
        {
          sub_234117B80(0, "NotSpecified");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v32 = self;
            _os_log_impl(&dword_233BF3000, v23, OS_LOG_TYPE_ERROR, "%@ failed to create udp parameters", buf, 0xCu);
          }

          if (sub_234114844(1u))
            sub_2341147D0(0, 1);
        }

      }
      else
      {
        sub_234117B80(0, "NotSpecified");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v32 = self;
          v33 = 2080;
          v34 = a3;
          v35 = 2080;
          v36 = __str;
          _os_log_impl(&dword_233BF3000, v22, OS_LOG_TYPE_ERROR, "%@ failed to create endpoint for %s:%s", buf, 0x20u);
        }

        if (sub_234114844(1u))
          sub_2341147D0(0, 1);
      }

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_256159200);
}

- (void)startMonitoringWithHandler:(id)a3 queue:(id)a4
{
  id v6;
  void *v7;
  id monitorHandler;
  vector<_DNSServiceRef_t *, std::allocator<_DNSServiceRef_t *>> *p_resolvers;
  NSObject *v10;
  NSObject *v11;
  NSString *instanceName;
  const char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _DNSServiceRef_t *v17;
  char **v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  _DNSServiceRef_t **value;
  _DNSServiceRef_t **end;
  _DNSServiceRef_t **v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  _DNSServiceRef_t **v32;
  _DNSServiceRef_t **v33;
  _DNSServiceRef_t **begin;
  _DNSServiceRef_t *v35;
  NSObject *v36;
  MTRDeviceConnectivityMonitor *v37;
  MTRDeviceConnectivityMonitor *v38;
  NSString *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  DNSServiceRef sdRef;
  uint8_t buf[4];
  MTRDeviceConnectivityMonitor *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v44 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_256159200);
  v43 = v6;
  v7 = (void *)MEMORY[0x23493EEA8](v6);
  monitorHandler = self->_monitorHandler;
  self->_monitorHandler = v7;

  objc_storeStrong((id *)&self->_handlerQueue, a4);
  p_resolvers = &self->_resolvers;
  if (self->_resolvers.__end_ == self->_resolvers.__begin_)
  {
    sub_234117B80(0, "NotSpecified");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      instanceName = self->_instanceName;
      *(_DWORD *)buf = 138412802;
      v47 = self;
      v48 = 2112;
      v49 = instanceName;
      v50 = 2048;
      v51 = qword_256159218;
      _os_log_impl(&dword_233BF3000, v11, OS_LOG_TYPE_DEFAULT, "%@ start connectivity monitoring for %@ (%lu monitoring objects)", buf, 0x20u);
    }

    if (sub_234114844(2u))
    {
      v39 = self->_instanceName;
      v41 = qword_256159218;
      v37 = self;
      sub_2341147D0(0, 2);
    }
    v17 = (_DNSServiceRef_t *)objc_msgSend__sharedResolverConnection(MTRDeviceConnectivityMonitor, v13, v14, v37, v39, v41);
    if (v17)
    {
      v18 = off_250500B20;
      do
      {
        v19 = *v18;
        sdRef = v17;
        v20 = (const char *)objc_msgSend_UTF8String(self->_instanceName, (const char *)v15, v16, v38, v40, v42);
        v21 = DNSServiceResolve(&sdRef, 0x4000u, 0, v20, "_matter._tcp", v19, (DNSServiceResolveReply)sub_23400D7FC, self);
        if ((_DWORD)v21)
        {
          sub_234117B80(0, "NotSpecified");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v23 = "(null)";
            if (v19)
              v23 = v19;
            v47 = self;
            v48 = 2080;
            v49 = (void *)v23;
            v50 = 1024;
            LODWORD(v51) = v21;
            _os_log_impl(&dword_233BF3000, v22, OS_LOG_TYPE_ERROR, "%@ failed to create resolver for \"%s\" domain: %d", buf, 0x1Cu);
          }

          if (sub_234114844(1u))
          {
            v24 = "(null)";
            if (v19)
              v24 = v19;
            v40 = v24;
            v42 = v21;
            v38 = self;
            sub_2341147D0(0, 1);
          }
        }
        else
        {
          end = self->_resolvers.__end_;
          value = self->_resolvers.__end_cap_.__value_;
          if (end >= value)
          {
            v28 = end - p_resolvers->__begin_;
            if ((unint64_t)(v28 + 1) >> 61)
              sub_233C04968();
            v29 = (char *)value - (char *)p_resolvers->__begin_;
            v30 = v29 >> 2;
            if (v29 >> 2 <= (unint64_t)(v28 + 1))
              v30 = v28 + 1;
            if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8)
              v15 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v15 = v30;
            if (v15)
              v31 = (char *)sub_233CF5774((uint64_t)&self->_resolvers.__end_cap_, v15);
            else
              v31 = 0;
            v32 = (_DNSServiceRef_t **)&v31[8 * v28];
            *v32 = sdRef;
            v27 = v32 + 1;
            begin = self->_resolvers.__begin_;
            v33 = self->_resolvers.__end_;
            if (v33 != begin)
            {
              do
              {
                v35 = *--v33;
                *--v32 = v35;
              }
              while (v33 != begin);
              v33 = p_resolvers->__begin_;
            }
            self->_resolvers.__begin_ = v32;
            self->_resolvers.__end_ = v27;
            self->_resolvers.__end_cap_.__value_ = (_DNSServiceRef_t **)&v31[8 * v15];
            if (v33)
              operator delete(v33);
          }
          else
          {
            *end = sdRef;
            v27 = end + 1;
          }
          self->_resolvers.__end_ = v27;
        }
        ++v18;
      }
      while (v18 != (char **)&unk_250500B30);
      if (self->_resolvers.__end_ != self->_resolvers.__begin_)
        ++qword_256159218;
    }
    else
    {
      sub_234117B80(0, "NotSpecified");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v47 = self;
        _os_log_impl(&dword_233BF3000, v36, OS_LOG_TYPE_ERROR, "%@ failed to get shared resolver connection", buf, 0xCu);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
    }
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = self;
      _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_DEFAULT, "%@ connectivity monitor already running", buf, 0xCu);
    }

    if (sub_234114844(2u))
      sub_2341147D0(0, 2);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_256159200);

}

- (void)_stopMonitoring
{
  NSMutableDictionary *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  id monitorHandler;
  OS_dispatch_queue *handlerQueue;
  _DNSServiceRef_t **end;
  _DNSServiceRef_t **begin;
  dispatch_time_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner((const os_unfair_lock *)&unk_256159200);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_connections;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend_objectForKeyedSubscript_(self->_connections, v5, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8), (_QWORD)v17);
        v9 = objc_claimAutoreleasedReturnValue();
        nw_connection_cancel(v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v17, v21, 16);
    }
    while (v6);
  }

  objc_msgSend_removeAllObjects(self->_connections, v10, v11);
  monitorHandler = self->_monitorHandler;
  self->_monitorHandler = 0;

  handlerQueue = self->_handlerQueue;
  self->_handlerQueue = 0;

  begin = self->_resolvers.__begin_;
  end = self->_resolvers.__end_;
  if (end != begin)
  {
    do
      DNSServiceRefDeallocate(*begin++);
    while (begin != end);
    self->_resolvers.__end_ = self->_resolvers.__begin_;
    if (!--qword_256159218)
    {
      v16 = dispatch_time(0, 10000000000);
      dispatch_after(v16, (dispatch_queue_t)qword_256159210, &unk_250500B30);
    }
  }
}

- (void)stopMonitoring
{
  NSObject *v3;
  NSString *instanceName;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  MTRDeviceConnectivityMonitor *v8;
  __int16 v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  sub_234117B80(0, "NotSpecified");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    instanceName = self->_instanceName;
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = instanceName;
    _os_log_impl(&dword_233BF3000, v3, OS_LOG_TYPE_DEFAULT, "%@ stop connectivity monitoring for %@", buf, 0x16u);
  }

  if (sub_234114844(2u))
    sub_2341147D0(0, 2);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_256159200);
  if (!qword_256159208 || !qword_256159210)
  {
    sub_234117B80(0, "NotSpecified");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = self;
      _os_log_impl(&dword_233BF3000, v5, OS_LOG_TYPE_DEFAULT, "%@ shared resolver connection already stopped - nothing to do", buf, 0xCu);
    }

    if (sub_234114844(2u))
      sub_2341147D0(0, 2);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_23400DCCC;
  block[3] = &unk_2504EE8C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_256159210, block);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_256159200);
}

- (void).cxx_destruct
{
  _DNSServiceRef_t **begin;

  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong(&self->_monitorHandler, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  begin = self->_resolvers.__begin_;
  if (begin)
  {
    self->_resolvers.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_instanceName, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
