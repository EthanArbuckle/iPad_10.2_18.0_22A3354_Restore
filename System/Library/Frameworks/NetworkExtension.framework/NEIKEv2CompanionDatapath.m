@implementation NEIKEv2CompanionDatapath

- (id)description
{
  NSString *v2;
  id v4;
  void *v5;
  unint64_t identifier;
  NWHostEndpoint *v7;
  NSString *v8;
  const char *v9;
  const char *v10;
  NSString *v11;
  NSString *v12;
  unint64_t state;
  __CFString *v14;
  void *v15;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = v4;
  if (!self)
  {
    v15 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("Cmpn[%llu %@%s%s %@]"), 0, 0, ", ", 0);
    v2 = 0;
    v12 = 0;
    v7 = 0;
    v8 = 0;
LABEL_12:

    goto LABEL_13;
  }
  identifier = self->_identifier;
  v7 = self->_remoteEndpoint;
  v8 = self->_connectedEndpointString;
  v9 = "";
  if (v8)
    v10 = " vpn-server ";
  else
    v10 = "";
  v11 = self->_connectedEndpointString;
  if (v11)
  {
    v2 = objc_retainAutorelease(self->_connectedEndpointString);
    v9 = -[NSString UTF8String](v2, "UTF8String");
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }
  state = self->_state;
  if (state >= 4)
    v14 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown(%u)"), self->_state);
  else
    v14 = off_1E3CC1610[state];
  v15 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("Cmpn[%llu %@%s%s %@]"), identifier, v7, v10, v9, v14);

  if (v11)
    goto LABEL_12;
LABEL_13:

  return v15;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  NEIKEv2CompanionDatapath *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self && self->_state == 3)
  {
    ne_log_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v6 = self;
      _os_log_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEFAULT, "%@: dealloc", buf, 0xCu);
    }
  }
  else
  {
    ne_log_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v6 = self;
      _os_log_fault_impl(&dword_19BD16000, v3, OS_LOG_TYPE_FAULT, "%@: dealloc without cancellation", buf, 0xCu);
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)NEIKEv2CompanionDatapath;
  -[NEIKEv2CompanionDatapath dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastConnectionError, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localEndpointForDatapath, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_resolvedEndpoints, 0);
  objc_storeStrong((id *)&self->_connectedEndpointString, 0);
  objc_storeStrong((id *)&self->_datapathConnection, 0);
}

- (void)cancelLocked
{
  id WeakRetained;
  int v3;
  _QWORD v4[4];
  id v5;
  int v6;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 12));
  *(_BYTE *)(a1 + 9) = 3;
  -[NEIKEv2CompanionDatapath resetConnectionLocked](a1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    v3 = -[NEIKEv2CompanionDatapath getStopReasonFromConnectionError:](a1, *(void **)(a1 + 96));
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __40__NEIKEv2CompanionDatapath_cancelLocked__block_invoke;
    v4[3] = &unk_1E3CC1388;
    v5 = WeakRetained;
    v6 = v3;
    objc_msgSend(v5, "stopTunnelWithReason:completionHandler:", 14, v4);
    -[NEIKEv2CompanionDatapath signalCompletionSemaphoreLocked](a1);

  }
}

- (void)resetConnectionLocked
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 12));
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = a1;
    _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEFAULT, "%@: reset-connection", (uint8_t *)&v5, 0xCu);
  }

  v3 = *(NSObject **)(a1 + 32);
  if (v3)
  {
    nw_connection_cancel(v3);
    v4 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

  }
}

- (uint64_t)getStopReasonFromConnectionError:(uint64_t)a1
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
      goto LABEL_9;
    if (nw_error_get_error_domain(v3) == nw_error_domain_dns)
    {
      a1 = 17;
      goto LABEL_10;
    }
    if (nw_error_get_error_domain(v4) != nw_error_domain_posix)
    {
LABEL_9:
      a1 = 7;
      goto LABEL_10;
    }
    a1 = 7;
    v5 = (nw_error_get_error_code(v4) - 32);
    if (v5 <= 0x21)
    {
      if (((1 << v5) & 0x2026C0001) != 0)
      {
        a1 = 4;
      }
      else if (v5 == 28)
      {
        a1 = 12;
      }
    }
  }
LABEL_10:

  return a1;
}

void __40__NEIKEv2CompanionDatapath_cancelLocked__block_invoke(uint64_t a1)
{
  -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(a1 + 32), (const char *)*(unsigned int *)(a1 + 40));
}

- (void)signalCompletionSemaphoreLocked
{
  NSObject *v2;
  void *v3;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 12));
  v2 = *(NSObject **)(a1 + 80);
  if (v2)
  {
    dispatch_semaphore_signal(v2);
    v3 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

  }
}

- (os_unfair_lock_s)connected
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 3;
    os_unfair_lock_lock(a1 + 3);
    v1 = (os_unfair_lock_s *)(BYTE1(v1[2]._os_unfair_lock_opaque) == 2);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)setupConnectionLocked
{
  NSObject *v2;
  NSObject *legacy_tcp_socket;
  NSObject *v4;
  NSObject *options;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 12));
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = a1;
    _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEFAULT, "%@: starting", buf, 0xCu);
  }

  legacy_tcp_socket = nw_parameters_create_legacy_tcp_socket();
  v4 = nw_parameters_copy_default_protocol_stack(legacy_tcp_socket);
  options = nw_udp_create_options();
  nw_protocol_stack_set_transport_protocol(v4, options);

  nw_parameters_set_required_interface_subtype();
  nw_parameters_set_effective_bundle_id();
  v6 = objc_msgSend(*(id *)(a1 + 64), "copyCEndpoint");
  nw_parameters_set_local_endpoint(legacy_tcp_socket, v6);

  nw_parameters_set_reuse_local_address(legacy_tcp_socket, 1);
  v7 = objc_msgSend(*(id *)(a1 + 56), "copyCEndpoint");
  v8 = nw_connection_create(v7, legacy_tcp_socket);

  nw_connection_set_queue(v8, *(dispatch_queue_t *)(a1 + 72));
  objc_initWeak((id *)buf, (id)a1);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__NEIKEv2CompanionDatapath_setupConnectionLocked__block_invoke;
  v15[3] = &unk_1E3CC13D8;
  objc_copyWeak(&v17, (id *)buf);
  v9 = v8;
  v16 = v9;
  MEMORY[0x1A1ACED54](v9, v15, v10, v11);
  nw_connection_start(v9);
  v12 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v9;
  v13 = v9;

  ++*(_BYTE *)(a1 + 10);
  v14 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = 0;

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

void __49__NEIKEv2CompanionDatapath_setupConnectionLocked__block_invoke(uint64_t a1, int a2, void *a3)
{
  NSObject *v6;
  os_unfair_lock_s *WeakRetained;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  nw_protocol_metadata_t v11;
  NSObject *v12;
  void *v13;
  id *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  dispatch_time_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  uint8_t v29[4];
  id *v30;
  __int16 v31;
  id v32;
  _BYTE buf[24];
  uint64_t v34;
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 3);
    if (*(_BYTE *)(v8 + 9) == 3 || *(_QWORD *)(v8 + 32) != *(_QWORD *)(a1 + 32))
      goto LABEL_4;
    if (v6 || (a2 & 0xFFFFFFFE) == 4)
    {
      objc_storeStrong((id *)(v8 + 96), a3);
      ne_log_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2080;
        v34 = nw_connection_state_to_string();
        _os_log_impl(&dword_19BD16000, v17, OS_LOG_TYPE_DEFAULT, "%@: connection error %@ state %s", buf, 0x20u);
      }

      if (nw_error_get_error_code(v6) == 48)
      {
        -[NEIKEv2CompanionDatapath resetConnectionLocked](v8);
        if (*(unsigned __int8 *)(v8 + 10) <= 5u)
        {
          objc_initWeak((id *)buf, (id)v8);
          v18 = dispatch_time(0x8000000000000000, 1000000000 * *(unsigned __int8 *)(v8 + 10));
          v19 = *(void **)(v8 + 72);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __49__NEIKEv2CompanionDatapath_setupConnectionLocked__block_invoke_20;
          block[3] = &unk_1E3CC1AB0;
          v20 = v19;
          objc_copyWeak(&v28, (id *)buf);
          v27 = *(id *)(a1 + 32);
          dispatch_after(v18, v20, block);

          os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 12));
          objc_destroyWeak(&v28);
          objc_destroyWeak((id *)buf);
          goto LABEL_5;
        }
      }
      else if (a2 == 4)
      {
        if (*(_BYTE *)(v8 + 8))
        {
          v21 = objc_loadWeakRetained((id *)(v8 + 88));
          v22 = v21;
          if (v21)
          {
            -[NEIKEv2PacketTunnelProvider handleCompanionProxyDatapathFailure:](v21, *(const char **)(v8 + 16));
            os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 12));

            goto LABEL_5;
          }
        }
      }
      -[NEIKEv2CompanionDatapath cancelLocked](v8);
      goto LABEL_4;
    }
    if (a2 != 3)
    {
LABEL_4:
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 12));
      goto LABEL_5;
    }
    objc_storeStrong((id *)(v8 + 96), 0);
    *(_WORD *)(v8 + 8) = 513;
    v9 = *(NSObject **)(a1 + 32);
    v10 = nw_proxy_copy_shoes_definition();
    v11 = nw_connection_copy_protocol_metadata(v9, v10);

    if (!v11)
    {
      ne_log_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v8;
        _os_log_fault_impl(&dword_19BD16000, v23, OS_LOG_TYPE_FAULT, "%@: no connection metadata found", buf, 0xCu);
      }

      -[NEIKEv2CompanionDatapath cancelLocked](v8);
      goto LABEL_33;
    }
    v12 = nw_shoes_metadata_copy_remote_endpoint();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_endpoint_get_hostname(v12));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v8 + 40), v13);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v34 = (uint64_t)__Block_byref_object_copy__11403;
    v35 = __Block_byref_object_dispose__11404;
    v36 = 0;
    v14 = (id *)(id)v8;
    nw_shoes_metadata_enumerate_resolved_endpoints();
    objc_storeStrong(v14 + 6, *(id *)(*(_QWORD *)&buf[8] + 40));
    v15 = nw_connection_copy_current_path(*(nw_connection_t *)(a1 + 32));
    if (nw_path_uses_interface_type(v15, nw_interface_type_wifi))
    {
      v16 = 1;
    }
    else
    {
      if (!nw_path_uses_interface_type(v15, nw_interface_type_cellular))
      {
LABEL_28:
        if (nw_path_uses_interface_type(v15, nw_interface_type_wired))
          v14[3] = (id)3;
        ne_log_obj();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = v14[6];
          *(_DWORD *)v29 = 138412546;
          v30 = v14;
          v31 = 2112;
          v32 = v25;
          _os_log_impl(&dword_19BD16000, v24, OS_LOG_TYPE_DEFAULT, "%@: connected w/resolved endpoints %@", v29, 0x16u);
        }

        _Block_object_dispose(buf, 8);
LABEL_33:
        -[NEIKEv2CompanionDatapath signalCompletionSemaphoreLocked](v8);

        goto LABEL_4;
      }
      v16 = 2;
    }
    v14[3] = (id)v16;
    goto LABEL_28;
  }
LABEL_5:

}

void __49__NEIKEv2CompanionDatapath_setupConnectionLocked__block_invoke_20(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  os_unfair_lock_s *v8;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained + 3;
    v8 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 3);
    if (BYTE1(v8[2]._os_unfair_lock_opaque) != 3)
    {
      v5 = *(id *)&v8[8]._os_unfair_lock_opaque;
      if (!v5 || (v6 = *(_QWORD *)&v8[8]._os_unfair_lock_opaque, v7 = *(_QWORD *)(a1 + 32), v5, v6 == v7))
        -[NEIKEv2CompanionDatapath setupConnectionLocked](v8);
    }
    os_unfair_lock_unlock(v4);
    v3 = v8;
  }

}

uint64_t __49__NEIKEv2CompanionDatapath_setupConnectionLocked__block_invoke_21(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  if (nw_endpoint_get_type(v3) == nw_endpoint_type_address)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_endpoint_get_hostname(v3));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      v7 = *(_QWORD *)(v6 + 40);
    else
      v7 = 0;
    if ((objc_msgSend(v4, "isEqualToString:", v7) & 1) == 0)
    {
      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v8)
      {
        v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

        v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
      objc_msgSend(v8, "addObject:", v5);
    }

  }
  return 1;
}

@end
