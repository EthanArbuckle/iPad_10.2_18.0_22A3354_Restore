@implementation NRParametersPhoneCallRelay

- (NRParametersPhoneCallRelay)initWithLocalPort:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *legacy_tcp_socket;
  NSObject *v11;
  NSObject *options;
  nw_endpoint_t host;
  xpc_object_t v14;
  void *v15;
  xpc_object_t v16;
  void *v17;
  xpc_object_t v18;
  void *v19;
  xpc_object_t v20;
  void *v21;
  NRParametersPhoneCallRelay *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NRParametersPhoneCallRelay *v28;
  NRParametersPhoneCallRelay *v29;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  _BOOL4 v35;
  NSObject *v36;
  NSObject *v37;
  _BOOL4 v38;
  NSObject *v39;
  NSObject *v40;
  _BOOL4 v41;
  NSObject *v42;
  NSObject *v43;
  _BOOL4 v44;
  _BOOL4 v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  objc_super v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    legacy_tcp_socket = nw_parameters_create_legacy_tcp_socket();
    if (!legacy_tcp_socket)
    {
      if (nrCopyLogObj_onceToken_2257 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2257, &__block_literal_global_2258);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2259, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2259, 17, (uint64_t)"nw_parameters_create_legacy_tcp_socket failed", v5, v6, v7, v8, v9, v74);
        v29 = 0;
      }
      else
      {
        v29 = 0;
      }
      goto LABEL_20;
    }
    nw_parameters_set_indefinite();
    v11 = nw_parameters_copy_default_protocol_stack(legacy_tcp_socket);
    options = nw_udp_create_options();
    nw_protocol_stack_set_transport_protocol(v11, options);

    nw_parameters_set_data_mode();
    host = nw_endpoint_create_host("::", (const char *)objc_msgSend(v4, "UTF8String"));
    MEMORY[0x1DF0BA100](legacy_tcp_socket, host);
    v14 = xpc_string_create("com.apple.networkrelay");
    if (v14)
    {
      v15 = v14;
      v16 = xpc_string_create("PhoneCallRelayAgent");
      if (v16)
      {
        v17 = v16;
        v18 = xpc_array_create(0, 0);
        if (v18)
        {
          v19 = v18;
          xpc_array_append_value(v18, v15);
          v20 = xpc_array_create(0, 0);
          if (v20)
          {
            v21 = v20;
            xpc_array_append_value(v20, v17);
            nw_parameters_set_required_netagent_classes();
            nw_parameters_set_reuse_local_address(legacy_tcp_socket, 1);
            nw_parameters_set_no_proxy();
            v75.receiver = self;
            v75.super_class = (Class)NRParametersPhoneCallRelay;
            v22 = -[NRParameters initWithParameters:](&v75, sel_initWithParameters_, legacy_tcp_socket);
            self = v22;
            if (v22)
            {
              -[NRParameters setServiceClass:](v22, "setServiceClass:", 3);
              v28 = self;
            }
            else
            {
              if (nrCopyLogObj_onceToken_2257 != -1)
                dispatch_once(&nrCopyLogObj_onceToken_2257, &__block_literal_global_2258);
              if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2259, OS_LOG_TYPE_FAULT))
                _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2259, 17, (uint64_t)"[super initWithParameters:] failed", v23, v24, v25, v26, v27, v74);
            }

            v29 = self;
LABEL_20:

            goto LABEL_21;
          }
          v42 = nrCopyLogObj_2253();
          v43 = v42;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v44 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);

            if (!v44)
              goto LABEL_49;
          }
        }
        else
        {
          v39 = nrCopyLogObj_2253();
          v40 = v39;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v41 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);

            if (!v41)
              goto LABEL_49;
          }
        }
        v66 = nrCopyLogObj_2253();
        _NRLogWithArgs((uint64_t)v66, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_array_create(%p, %u) failed", v67, v68, v69, v70, v71, (uint64_t)");

LABEL_49:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v72 = _os_log_pack_fill();
        __os_log_helper_1_2_3_8_34_8_0_4_0(v72, (uint64_t)"nr_xpc_array_create");
LABEL_50:
        v73 = nrCopyLogObj_2253();
        _NRLogAbortWithPack(v73);
      }
      v36 = nrCopyLogObj_2253();
      v37 = v36;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v38 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);

        if (!v38)
          goto LABEL_44;
      }
      v59 = nrCopyLogObj_2253();
      _NRLogWithArgs((uint64_t)v59, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_string_create(%s) failed", v60, v61, v62, v63, v64, (uint64_t)");

LABEL_44:
      _os_log_pack_size();
      MEMORY[0x1E0C80A78]();
      __error();
      v65 = _os_log_pack_fill();
      *(_DWORD *)v65 = 136446466;
      *(_QWORD *)(v65 + 4) = "nr_xpc_string_create";
      *(_WORD *)(v65 + 12) = 2080;
      *(_QWORD *)(v65 + 14) = "PhoneCallRelayAgent";
      goto LABEL_50;
    }
    v33 = nrCopyLogObj_2253();
    v34 = v33;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v35 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);

      if (!v35)
        goto LABEL_41;
    }
    v52 = nrCopyLogObj_2253();
    _NRLogWithArgs((uint64_t)v52, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_string_create(%s) failed", v53, v54, v55, v56, v57, (uint64_t)");

LABEL_41:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v58 = _os_log_pack_fill();
    *(_DWORD *)v58 = 136446466;
    *(_QWORD *)(v58 + 4) = "nr_xpc_string_create";
    *(_WORD *)(v58 + 12) = 2080;
    *(_QWORD *)(v58 + 14) = "com.apple.networkrelay";
    goto LABEL_50;
  }
  v31 = nrCopyLogObj_2253();
  v32 = v31;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v45 = os_log_type_enabled(v31, OS_LOG_TYPE_FAULT);

    if (!v45)
    {
      v29 = 0;
      goto LABEL_21;
    }
  }
  v46 = nrCopyLogObj_2253();
  _NRLogWithArgs((uint64_t)v46, 17, (uint64_t)"%s called with null localPortString", v47, v48, v49, v50, v51, (uint64_t)"-[NRParametersPhoneCallRelay initWithLocalPort:]");

  v29 = 0;
LABEL_21:

  return v29;
}

@end
