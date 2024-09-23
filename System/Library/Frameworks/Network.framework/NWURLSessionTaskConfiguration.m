@implementation NWURLSessionTaskConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalActivity, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_atsState, 0);
}

- (id)initWithConfiguration:(void *)a3 task:(void *)a4 request:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  objc_super v13;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)NWURLSessionTaskConfiguration;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a4);
    }
  }

  return a1;
}

- (void)configureParameters:(id *)a1
{
  unint64_t v2;
  NSObject *v4;
  id *v5;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id *v11;
  int v12;
  id *v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  id *v17;
  id *v18;
  id *v19;
  id *v20;
  char *v21;
  xpc_object_t v22;
  void *v23;
  id v24;
  id *v25;
  id v26;
  void *v27;
  void *v28;
  xpc_object_t v29;
  void *v30;
  id v31;
  void *v32;
  id *v33;
  void *v34;
  void *v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _OWORD *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  xpc_object_t v45;
  xpc_object_t v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  BOOL v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  char *v59;
  void *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  _BOOL4 v64;
  void *v65;
  BOOL v66;
  char v67;
  const __CFURL *v68;
  NSObject *v69;
  NSObject *v70;
  _BOOL8 v71;
  Class isa;
  void *v73;
  BOOL v74;
  void *v75;
  NWConcrete_nw_interface *v76;
  int v77;
  int v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  char *v86;
  NSObject *v87;
  void *v88;
  char *v89;
  NSObject *v90;
  os_log_type_t v91;
  void *v92;
  char *v93;
  NSObject *v94;
  os_log_type_t v95;
  void *v96;
  char *v97;
  NSObject *v98;
  os_log_type_t v99;
  os_log_type_t v100;
  _BOOL4 v101;
  char *v102;
  _BOOL4 v103;
  char *v104;
  os_log_type_t v105;
  _BOOL4 v106;
  char *v107;
  _BOOL4 v108;
  char *backtrace_string;
  _BOOL4 v110;
  os_log_type_t v111;
  os_log_type_t v112;
  os_log_type_t v113;
  _BYTE *v114;
  _BYTE *v115;
  _BYTE *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  os_log_type_t v120;
  NSObject *v121;
  os_log_type_t v122;
  os_log_type_t v123;
  os_log_type_t v124;
  const char *v125;
  id v126;
  uint64_t v127;
  char v128;
  os_log_type_t type;
  _BYTE objects[32];
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    v5 = (id *)a1[3];
    v6 = v5;
    if (v5)
    {
      v7 = v5[49];
      v8 = v7;
      if (v7)
        v9 = (void *)*((_QWORD *)v7 + 17);
      else
        v9 = 0;
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    v10 = v9;
    nw_parameters_set_context(v4, v10);

    v11 = a1 + 4;
    v12 = objc_msgSend(a1[4], "_explicitlySetNetworkServiceType");
    v13 = a1 + 2;
    v14 = 2;
    if (v12)
      v14 = 4;
    v15 = objc_msgSend(a1[v14], "networkServiceType");
    if (v15 > 0xB)
      v16 = 0;
    else
      v16 = dword_183BA8BF0[v15];
    nw_parameters_set_traffic_class(v4, v16);
    if (objc_msgSend(*v11, "_explicitlySetAllowsCellularAccess"))
      v17 = a1 + 4;
    else
      v17 = a1 + 2;
    if ((objc_msgSend(*v17, "allowsCellularAccess") & 1) == 0)
      nw_parameters_prohibit_interface_type(v4, nw_interface_type_cellular);
    if (objc_msgSend(*v11, "_explicitlySetAllowsExpensiveNetworkAccess"))
      v18 = a1 + 4;
    else
      v18 = a1 + 2;
    if ((objc_msgSend(*v18, "allowsExpensiveNetworkAccess") & 1) == 0)
      nw_parameters_set_prohibit_expensive(v4, 1);
    if (objc_msgSend(*v11, "_explicitlySetAllowsConstrainedNetworkAccess"))
      v19 = a1 + 4;
    else
      v19 = a1 + 2;
    if ((objc_msgSend(*v19, "allowsConstrainedNetworkAccess") & 1) == 0)
      nw_parameters_set_prohibit_constrained(v4, 1);
    if (objc_msgSend(*v11, "_explicitlySetAllowsUCA"))
      v20 = a1 + 4;
    else
      v20 = a1 + 2;
    if (objc_msgSend(*v20, "_allowsUCA"))
      nw_parameters_set_allow_ultra_constrained(v4, 1);
    if ((objc_msgSend(*v13, "waitsForConnectivity") & 1) == 0)
      nw_parameters_set_indefinite(v4, 0);
    if (!*v11)
      goto LABEL_231;
    CFURLRequestGetProxySettings();
    v21 = (char *)objc_claimAutoreleasedReturnValue();
    if (!v21)
      goto LABEL_231;
    *(_QWORD *)objects = _CFXPCCreateXPCObjectFromCFObject();
    v22 = xpc_array_create((xpc_object_t *)objects, 1uLL);
    v23 = v22;
    v24 = v22 ? nw_proxy_configs_create_with_schema_array(v22) : 0;

    if (!v24)
    {
LABEL_231:
      v25 = (id *)a1[3];
      if (v25)
      {
        v26 = v25[49];
        v21 = (char *)v26;
        if (v26)
        {
          v27 = (void *)*((_QWORD *)v26 + 9);
          if (!v27)
          {
            objc_msgSend(*((id *)v26 + 11), "connectionProxyDictionary");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              *(_QWORD *)objects = _CFXPCCreateXPCObjectFromCFObject();
              v29 = xpc_array_create((xpc_object_t *)objects, 1uLL);
              v30 = v29;
              if (v29)
              {
                v31 = nw_proxy_configs_create_with_schema_array(v29);
                v32 = (void *)*((_QWORD *)v21 + 9);
                *((_QWORD *)v21 + 9) = v31;

              }
            }

            v27 = (void *)*((_QWORD *)v21 + 9);
          }
          v24 = v27;
        }
        else
        {
          v24 = 0;
        }
      }
      else
      {
        v21 = 0;
        v24 = 0;
      }

      if (!v24)
      {
        v126 = 0;
LABEL_52:
        nw_parameters_set_multipath_service(v4, (nw_multipath_service_t)objc_msgSend(*v13, "multipathServiceType", v114, v117));
        objc_msgSend(*v13, "_sourceApplicationBundleIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend(*v13, "_sourceApplicationBundleIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*v13, "_sourceApplicationAuditTokenData");
          v24 = (id)objc_claimAutoreleasedReturnValue();

          v36 = (const char *)objc_msgSend(v35, "UTF8String");
          if (v24)
            nw_parameters_set_effective_bundle_id(v4, v36);
          else
            nw_parameters_set_source_application_by_bundle_id_internal(v4, v36);

        }
        objc_msgSend(*v13, "_sourceApplicationSecondaryIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(*v13, "_sourceApplicationSecondaryIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          nw_parameters_set_account_id(v4, (const char *)objc_msgSend(v38, "UTF8String"));

        }
        objc_msgSend(*v13, "_sourceApplicationAuditTokenData");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          objc_msgSend(*v13, "_sourceApplicationAuditTokenData");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v40, "length") != 32)
          {
            _os_crash();
            __break(1u);
            goto LABEL_87;
          }
          v41 = (_OWORD *)objc_msgSend(v40, "bytes");
          *(_OWORD *)objects = *v41;
          *(_OWORD *)&objects[16] = v41[1];
          nw_parameters_set_source_application(v4, (__int128 *)objects);

        }
        objc_msgSend(*v13, "_CTDataConnectionServiceType");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          objc_msgSend(*v11, "boundInterfaceIdentifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v43 == 0;

          if (v44)
          {
            v45 = xpc_array_create(0, 0);
            xpc_array_set_string(v45, 0xFFFFFFFFFFFFFFFFLL, "Cellular");
            v46 = xpc_array_create(0, 0);
            objc_msgSend(*v13, "_CTDataConnectionServiceType");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v47, "hasPrefix:", CFSTR("kCTDataConnectionServiceType")))
              v48 = objc_msgSend(CFSTR("kCTDataConnectionServiceType"), "length");
            else
              v48 = 0;
            xpc_array_set_string(v46, 0xFFFFFFFFFFFFFFFFLL, (const char *)(objc_msgSend(v47, "UTF8String") + v48));
            nw_parameters_set_required_netagent_classes(v4, v45, v46);

          }
        }
        if (objc_msgSend(*v13, "_requiresSecureHTTPSProxyConnection"))
          nw_parameters_set_https_proxy_over_tls(v4, 1);
        if (!objc_msgSend(*v13, "_preventsSystemHTTPProxyAuthentication"))
        {
LABEL_74:
          objc_msgSend(*v13, "_attributedBundleIdentifier", v115, v118);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v51 == 0;

          if (!v52)
          {
            objc_msgSend(*v13, "_attributedBundleIdentifier");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            nw_parameters_set_attributed_bundle_identifier(v4, (const char *)objc_msgSend(v53, "UTF8String"));

          }
          nw_parameters_set_skip_stack_trace_capture(v4, 1);
          v54 = objc_msgSend(a1[3], "countOfBytesClientExpectsToSend");
          v55 = objc_msgSend(a1[3], "countOfBytesClientExpectsToReceive");
          nw_parameters_set_expected_workload(v4, (v55 & ~(v55 >> 63)) + (v54 & ~(v54 >> 63)));
          if (objc_msgSend(a1[4], "attribution") == 1)
            nw_parameters_set_attribution(v4, nw_parameters_attribution_user);
          objc_msgSend(*v11, "mainDocumentURL");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "host");
          v21 = (char *)objc_claimAutoreleasedReturnValue();

          -[NWURLSessionTaskConfiguration createRegistrableDomain:](v21);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = *v11;
          objc_msgSend(v57, "URL");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "host");
          v24 = (id)objc_claimAutoreleasedReturnValue();

          -[NWURLSessionTaskConfiguration createRegistrableDomain:](v24);
          v127 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*v11, "_trackerContext");
          v59 = (char *)objc_claimAutoreleasedReturnValue();
          v2 = (unint64_t)v59;
          if (v59)
            goto LABEL_79;
          objc_msgSend(*v11, "mainDocumentURL");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v60;
          if (v60)
          {
            objc_msgSend(v60, "scheme");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend(v62, "length") - 2;
            if (v63 >= 4)
            {

            }
            else
            {
              v64 = objc_msgSend(v62, "caseInsensitiveCompare:", off_1E149C2F8[v63]) == 0;

              if (v64)
              {
                v59 = (char *)v40;
                if (v40 || (v59 = v21) != 0)
LABEL_79:
                  nw_parameters_set_attribution_context(v4, (const char *)objc_msgSend(v59, "UTF8String"));
              }
            }
          }
LABEL_87:
          objc_msgSend(*v11, "mainDocumentURL");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = v65 == 0;

          if (v66)
            goto LABEL_100;
          if (v40 && v127)
            v67 = objc_msgSend(v40, "isEqualToString:", v127);
          else
            v67 = objc_msgSend(v21, "isEqualToString:", v24);
          if ((v67 & 1) == 0)
            nw_parameters_set_is_third_party_web_content(v4, 1);
          objc_msgSend(*v11, "mainDocumentURL");
          v68 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
          v69 = v4;
          v70 = v69;
          if (v69)
          {
            if (v68)
            {
              v71 = -[NWConcrete_nw_url_endpoint initWithURL:]([NWConcrete_nw_url_endpoint alloc], v68);
              isa = v70[26].isa;
              v70[26].isa = (Class)v71;
            }
            else
            {
              isa = v69[26].isa;
              v69[26].isa = 0;
            }

LABEL_99:
LABEL_100:
            objc_msgSend(*v11, "boundInterfaceIdentifier", v115, v118);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = v73 == 0;

            if (!v74)
            {
              objc_msgSend(*v11, "boundInterfaceIdentifier");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = nw_interface_create_with_name((char *)objc_msgSend(v75, "UTF8String"));
              nw_parameters_require_interface(v4, &v76->super);

            }
            if (objc_msgSend(*v11, "_prohibitPrivacyProxy"))
              nw_parameters_set_prohibit_privacy_proxy(v4, 1);
            if (objc_msgSend(*v11, "_privacyProxyFailClosed"))
              nw_parameters_set_privacy_proxy_fail_closed(v4, 1);
            if (objc_msgSend(*v11, "_privacyProxyFailClosedForUnreachableHosts"))
              nw_parameters_set_privacy_proxy_fail_closed_for_unreachable_hosts(v4, 1);
            v77 = objc_msgSend(*v11, "_privacyProxyFailClosedForUnreachableNonMainHosts");
            if (v21)
              v78 = v77;
            else
              v78 = 0;
            if (v78 == 1 && objc_msgSend(v21, "caseInsensitiveCompare:", v24))
              nw_parameters_set_privacy_proxy_fail_closed_for_unreachable_hosts(v4, 1);
            if (objc_msgSend(*v11, "_needsNetworkTrackingPrevention"))
              nw_parameters_set_is_known_tracker(v4, 1);
            if (objc_msgSend(*v11, "_useEnhancedPrivacyMode"))
              nw_parameters_set_use_enhanced_privacy_mode(v4, 1);
            if (objc_msgSend(*v11, "_blockTrackers"))
              nw_parameters_set_block_trackers(v4, 1);
            if (objc_msgSend(*v11, "_isWebSearchContent"))
              nw_parameters_set_web_search_content(v4, 1);
            if (!objc_msgSend(*v11, "_allowPrivateAccessTokensForThirdParty"))
            {
LABEL_126:
              if (!objc_msgSend(*v13, "_inPrivateBrowsing", v116, v119))
              {
LABEL_130:

                goto LABEL_131;
              }
              v81 = v4;
              v82 = v81;
              if (v81)
              {
                v81[12].isa = (Class)((unint64_t)v81[12].isa | 0x40000000000);
LABEL_129:

                goto LABEL_130;
              }
              __nwlog_obj();
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)objects = 136446210;
              *(_QWORD *)&objects[4] = "nw_parameters_set_using_ephemeral_configuration";
              v97 = (char *)_os_log_send_and_compose_impl();

              type = OS_LOG_TYPE_ERROR;
              v128 = 0;
              if (__nwlog_fault(v97, &type, &v128))
              {
                if (type == OS_LOG_TYPE_FAULT)
                {
                  __nwlog_obj();
                  v98 = objc_claimAutoreleasedReturnValue();
                  v99 = type;
                  if (os_log_type_enabled(v98, type))
                  {
                    *(_DWORD *)objects = 136446210;
                    *(_QWORD *)&objects[4] = "nw_parameters_set_using_ephemeral_configuration";
                    _os_log_impl(&dword_182FBE000, v98, v99, "%{public}s called with null parameters", objects, 0xCu);
                  }
                }
                else if (v128)
                {
                  backtrace_string = (char *)__nw_create_backtrace_string();
                  __nwlog_obj();
                  v98 = objc_claimAutoreleasedReturnValue();
                  v124 = type;
                  v110 = os_log_type_enabled(v98, type);
                  if (backtrace_string)
                  {
                    if (v110)
                    {
                      *(_DWORD *)objects = 136446466;
                      *(_QWORD *)&objects[4] = "nw_parameters_set_using_ephemeral_configuration";
                      *(_WORD *)&objects[12] = 2082;
                      *(_QWORD *)&objects[14] = backtrace_string;
                      _os_log_impl(&dword_182FBE000, v98, v124, "%{public}s called with null parameters, dumping backtrace:%{public}s", objects, 0x16u);
                    }

                    free(backtrace_string);
                    goto LABEL_221;
                  }
                  if (v110)
                  {
                    *(_DWORD *)objects = 136446210;
                    *(_QWORD *)&objects[4] = "nw_parameters_set_using_ephemeral_configuration";
                    _os_log_impl(&dword_182FBE000, v98, v124, "%{public}s called with null parameters, no backtrace", objects, 0xCu);
                  }
                }
                else
                {
                  __nwlog_obj();
                  v98 = objc_claimAutoreleasedReturnValue();
                  v113 = type;
                  if (os_log_type_enabled(v98, type))
                  {
                    *(_DWORD *)objects = 136446210;
                    *(_QWORD *)&objects[4] = "nw_parameters_set_using_ephemeral_configuration";
                    _os_log_impl(&dword_182FBE000, v98, v113, "%{public}s called with null parameters, backtrace limit exceeded", objects, 0xCu);
                  }
                }

              }
LABEL_221:
              if (v97)
                free(v97);
              goto LABEL_129;
            }
            v79 = v4;
            v80 = v79;
            if (v79)
            {
              v79[12].isa = (Class)((unint64_t)v79[12].isa | 0x20000000000);
LABEL_125:

              goto LABEL_126;
            }
            __nwlog_obj();
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)objects = 136446210;
            *(_QWORD *)&objects[4] = "nw_parameters_set_allow_private_access_tokens_for_third_party";
            LODWORD(v119) = 12;
            v116 = objects;
            v93 = (char *)_os_log_send_and_compose_impl();

            type = OS_LOG_TYPE_ERROR;
            v128 = 0;
            if (__nwlog_fault(v93, &type, &v128))
            {
              if (type == OS_LOG_TYPE_FAULT)
              {
                __nwlog_obj();
                v94 = objc_claimAutoreleasedReturnValue();
                v95 = type;
                if (os_log_type_enabled(v94, type))
                {
                  *(_DWORD *)objects = 136446210;
                  *(_QWORD *)&objects[4] = "nw_parameters_set_allow_private_access_tokens_for_third_party";
                  _os_log_impl(&dword_182FBE000, v94, v95, "%{public}s called with null parameters", objects, 0xCu);
                }
              }
              else if (v128)
              {
                v107 = (char *)__nw_create_backtrace_string();
                __nwlog_obj();
                v94 = objc_claimAutoreleasedReturnValue();
                v123 = type;
                v108 = os_log_type_enabled(v94, type);
                if (v107)
                {
                  if (v108)
                  {
                    *(_DWORD *)objects = 136446466;
                    *(_QWORD *)&objects[4] = "nw_parameters_set_allow_private_access_tokens_for_third_party";
                    *(_WORD *)&objects[12] = 2082;
                    *(_QWORD *)&objects[14] = v107;
                    _os_log_impl(&dword_182FBE000, v94, v123, "%{public}s called with null parameters, dumping backtrace:%{public}s", objects, 0x16u);
                  }

                  free(v107);
                  goto LABEL_216;
                }
                if (v108)
                {
                  *(_DWORD *)objects = 136446210;
                  *(_QWORD *)&objects[4] = "nw_parameters_set_allow_private_access_tokens_for_third_party";
                  _os_log_impl(&dword_182FBE000, v94, v123, "%{public}s called with null parameters, no backtrace", objects, 0xCu);
                }
              }
              else
              {
                __nwlog_obj();
                v94 = objc_claimAutoreleasedReturnValue();
                v112 = type;
                if (os_log_type_enabled(v94, type))
                {
                  *(_DWORD *)objects = 136446210;
                  *(_QWORD *)&objects[4] = "nw_parameters_set_allow_private_access_tokens_for_third_party";
                  _os_log_impl(&dword_182FBE000, v94, v112, "%{public}s called with null parameters, backtrace limit exceeded", objects, 0xCu);
                }
              }

            }
LABEL_216:
            if (v93)
              free(v93);
            goto LABEL_125;
          }
          __nwlog_obj();
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)objects = 136446210;
          *(_QWORD *)&objects[4] = "nw_parameters_set_main_document_cfurl";
          LODWORD(v118) = 12;
          v115 = objects;
          v125 = (const char *)_os_log_send_and_compose_impl();

          type = OS_LOG_TYPE_ERROR;
          v128 = 0;
          v86 = (char *)v125;
          if (!__nwlog_fault(v125, &type, &v128))
          {
LABEL_206:
            if (v86)
              free(v86);
            goto LABEL_99;
          }
          if (type == OS_LOG_TYPE_FAULT)
          {
            __nwlog_obj();
            v87 = objc_claimAutoreleasedReturnValue();
            v120 = type;
            if (os_log_type_enabled(v87, type))
            {
              *(_DWORD *)objects = 136446210;
              *(_QWORD *)&objects[4] = "nw_parameters_set_main_document_cfurl";
              _os_log_impl(&dword_182FBE000, v87, v120, "%{public}s called with null parameters", objects, 0xCu);
            }
          }
          else
          {
            if (v128)
            {
              v102 = (char *)__nw_create_backtrace_string();
              __nwlog_obj();
              v121 = objc_claimAutoreleasedReturnValue();
              HIDWORD(v118) = type;
              v103 = os_log_type_enabled(v121, type);
              if (v102)
              {
                if (v103)
                {
                  *(_DWORD *)objects = 136446466;
                  *(_QWORD *)&objects[4] = "nw_parameters_set_main_document_cfurl";
                  *(_WORD *)&objects[12] = 2082;
                  *(_QWORD *)&objects[14] = v102;
                  _os_log_impl(&dword_182FBE000, v121, BYTE4(v118), "%{public}s called with null parameters, dumping backtrace:%{public}s", objects, 0x16u);
                }

                free(v102);
              }
              else
              {
                if (v103)
                {
                  *(_DWORD *)objects = 136446210;
                  *(_QWORD *)&objects[4] = "nw_parameters_set_main_document_cfurl";
                  _os_log_impl(&dword_182FBE000, v121, BYTE4(v118), "%{public}s called with null parameters, no backtrace", objects, 0xCu);
                }

              }
              goto LABEL_205;
            }
            __nwlog_obj();
            v87 = objc_claimAutoreleasedReturnValue();
            v122 = type;
            if (os_log_type_enabled(v87, type))
            {
              *(_DWORD *)objects = 136446210;
              *(_QWORD *)&objects[4] = "nw_parameters_set_main_document_cfurl";
              _os_log_impl(&dword_182FBE000, v87, v122, "%{public}s called with null parameters, backtrace limit exceeded", objects, 0xCu);
            }
          }

LABEL_205:
          v86 = (char *)v125;
          goto LABEL_206;
        }
        v49 = v4;
        v50 = v49;
        if (v49)
        {
          v49[12].isa = (Class)((unint64_t)v49[12].isa | 0x80000000000);
LABEL_73:

          goto LABEL_74;
        }
        __nwlog_obj();
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)objects = 136446210;
        *(_QWORD *)&objects[4] = "nw_parameters_set_prevents_system_http_proxy_authentication";
        LODWORD(v118) = 12;
        v115 = objects;
        v89 = (char *)_os_log_send_and_compose_impl();

        type = OS_LOG_TYPE_ERROR;
        v128 = 0;
        if (__nwlog_fault(v89, &type, &v128))
        {
          if (type == OS_LOG_TYPE_FAULT)
          {
            __nwlog_obj();
            v90 = objc_claimAutoreleasedReturnValue();
            v91 = type;
            if (os_log_type_enabled(v90, type))
            {
              *(_DWORD *)objects = 136446210;
              *(_QWORD *)&objects[4] = "nw_parameters_set_prevents_system_http_proxy_authentication";
              _os_log_impl(&dword_182FBE000, v90, v91, "%{public}s called with null parameters", objects, 0xCu);
            }
          }
          else if (v128)
          {
            v104 = (char *)__nw_create_backtrace_string();
            __nwlog_obj();
            v90 = objc_claimAutoreleasedReturnValue();
            v105 = type;
            v106 = os_log_type_enabled(v90, type);
            if (v104)
            {
              if (v106)
              {
                *(_DWORD *)objects = 136446466;
                *(_QWORD *)&objects[4] = "nw_parameters_set_prevents_system_http_proxy_authentication";
                *(_WORD *)&objects[12] = 2082;
                *(_QWORD *)&objects[14] = v104;
                _os_log_impl(&dword_182FBE000, v90, v105, "%{public}s called with null parameters, dumping backtrace:%{public}s", objects, 0x16u);
              }

              free(v104);
              goto LABEL_211;
            }
            if (v106)
            {
              *(_DWORD *)objects = 136446210;
              *(_QWORD *)&objects[4] = "nw_parameters_set_prevents_system_http_proxy_authentication";
              _os_log_impl(&dword_182FBE000, v90, v105, "%{public}s called with null parameters, no backtrace", objects, 0xCu);
            }
          }
          else
          {
            __nwlog_obj();
            v90 = objc_claimAutoreleasedReturnValue();
            v111 = type;
            if (os_log_type_enabled(v90, type))
            {
              *(_DWORD *)objects = 136446210;
              *(_QWORD *)&objects[4] = "nw_parameters_set_prevents_system_http_proxy_authentication";
              _os_log_impl(&dword_182FBE000, v90, v111, "%{public}s called with null parameters, backtrace limit exceeded", objects, 0xCu);
            }
          }

        }
LABEL_211:
        if (v89)
          free(v89);
        goto LABEL_73;
      }
    }
    v33 = v4;
    v126 = v24;
    if (v33)
    {
      objc_storeStrong(v33 + 22, v24);
LABEL_50:

      goto LABEL_52;
    }
    __nwlog_obj();
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = 136446210;
    *(_DWORD *)objects = 136446210;
    v21 = "nw_parameters_set_custom_proxy_config_array";
    *(_QWORD *)&objects[4] = "nw_parameters_set_custom_proxy_config_array";
    LODWORD(v117) = 12;
    v114 = objects;
    v2 = 16;
    v24 = (id)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v128 = 0;
    if (__nwlog_fault((const char *)v24, &type, &v128))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v84 = objc_claimAutoreleasedReturnValue();
        v2 = type;
        if (os_log_type_enabled(v84, type))
        {
          *(_DWORD *)objects = 136446210;
          *(_QWORD *)&objects[4] = "nw_parameters_set_custom_proxy_config_array";
          _os_log_impl(&dword_182FBE000, v84, (os_log_type_t)v2, "%{public}s called with null parameters", objects, 0xCu);
        }
      }
      else if (v128)
      {
        v2 = (unint64_t)__nw_create_backtrace_string();
        __nwlog_obj();
        v84 = objc_claimAutoreleasedReturnValue();
        v100 = type;
        v101 = os_log_type_enabled(v84, type);
        if (v2)
        {
          if (v101)
          {
            *(_DWORD *)objects = 136446466;
            *(_QWORD *)&objects[4] = "nw_parameters_set_custom_proxy_config_array";
            *(_WORD *)&objects[12] = 2082;
            *(_QWORD *)&objects[14] = v2;
            _os_log_impl(&dword_182FBE000, v84, v100, "%{public}s called with null parameters, dumping backtrace:%{public}s", objects, 0x16u);
          }

          free((void *)v2);
          goto LABEL_200;
        }
        if (v101)
        {
          *(_DWORD *)objects = 136446210;
          *(_QWORD *)&objects[4] = "nw_parameters_set_custom_proxy_config_array";
          _os_log_impl(&dword_182FBE000, v84, v100, "%{public}s called with null parameters, no backtrace", objects, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v84 = objc_claimAutoreleasedReturnValue();
        v2 = type;
        if (os_log_type_enabled(v84, type))
        {
          *(_DWORD *)objects = 136446210;
          *(_QWORD *)&objects[4] = "nw_parameters_set_custom_proxy_config_array";
          _os_log_impl(&dword_182FBE000, v84, (os_log_type_t)v2, "%{public}s called with null parameters, backtrace limit exceeded", objects, 0xCu);
        }
      }

    }
LABEL_200:
    if (v24)
      free(v24);
    goto LABEL_50;
  }
LABEL_131:

}

- (id)createRegistrableDomain:(void *)a1
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int16 *v7;
  uint64_t v8;
  char v9;
  char v10;
  int v11;
  void *v12;
  UChar *v13;
  unint64_t v14;
  int32_t v15;
  void *v16;
  size_t v17;
  unint64_t TopLevelDomain;
  UChar *v19;
  UChar *v20;
  id result;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  UChar *v26;
  uint64_t v27;
  UIDNAInfo pInfo;
  UErrorCode pErrorCode;
  UChar dest[2];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v3 = 0;
LABEL_35:

    return v3;
  }
  v4 = v1;
  v5 = objc_msgSend(v4, "length");
  if (v5 >= 0x101)
    goto LABEL_22;
  v6 = v5;
  if (!v5)
  {
    __nwlog_obj();
    v22 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    *(_DWORD *)dest = 136446210;
    v31 = "strict_malloc";
    LODWORD(v27) = 12;
    v26 = dest;
    v23 = (void *)_os_log_send_and_compose_impl();

    result = (id)__nwlog_abort((uint64_t)v23);
    if ((_DWORD)result)
      goto LABEL_41;
    free(v23);
  }
  v7 = (unsigned __int16 *)malloc_type_malloc(2 * v6, 0xF2B69DE5uLL);
  if (v7)
  {
    objc_msgSend(v4, "getCharacters:range:", v7, 0, v6);
    if (!v6)
    {
LABEL_21:
      free(v7);
      goto LABEL_22;
    }
LABEL_7:
    v8 = 0;
    v9 = 0;
    v10 = 1;
    do
    {
      v11 = v7[v8];
      if ((v11 - 65) <= 0x19)
      {
        v11 += 32;
        v7[v8] = v11;
        v9 = 1;
      }
      v10 &= (v11 - 32) < 0x60;
      ++v8;
    }
    while (v6 != v8);
    if ((v10 & 1) != 0)
    {
      if ((v9 & 1) != 0)
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        v13 = v7;
        v14 = v6;
        goto LABEL_19;
      }
    }
    else
    {
      if (createIDNAEncodedDomain__onceToken != -1)
        dispatch_once(&createIDNAEncodedDomain__onceToken, &__block_literal_global_15780);
      pErrorCode = U_ZERO_ERROR;
      pInfo = (UIDNAInfo)xmmword_183C6F240;
      v15 = uidna_nameToASCII((const UIDNA *)createIDNAEncodedDomain__idna, v7, v6, dest, 256, &pInfo, &pErrorCode);
      if (pErrorCode <= U_ZERO_ERROR && pInfo.errors < 0x40)
      {
        v14 = v15;
        v13 = dest;
        v12 = (void *)MEMORY[0x1E0CB3940];
LABEL_19:
        objc_msgSend(v12, "stringWithCharacters:length:", v13, v14, v26, v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        free(v7);

        if (!v16)
          goto LABEL_33;
LABEL_23:
        if (objc_msgSend(v16, "getCString:maxLength:encoding:", dest, 256, 1))
        {
          v17 = strlen((const char *)dest);
          if (v17 && *((_BYTE *)dest + v17 - 1) == 46)
            *((_BYTE *)dest + v17 - 1) = 0;
          TopLevelDomain = _CFHostGetTopLevelDomain();
          v3 = 0;
          if (TopLevelDomain && TopLevelDomain > (unint64_t)dest + 1)
          {
            v19 = (UChar *)(TopLevelDomain - 2);
            do
            {
              v20 = v19;
              if (v19 < dest)
                break;
              v19 = (UChar *)((char *)v19 - 1);
            }
            while (*(_BYTE *)v20 != 46);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", (char *)v20 + 1, 1);
            v3 = (void *)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_34;
        }
LABEL_33:
        v3 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    goto LABEL_21;
  }
  __nwlog_obj();
  v24 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
  *(_DWORD *)dest = 136446466;
  v31 = "strict_malloc";
  v32 = 2048;
  v33 = 2 * v6;
  LODWORD(v27) = 22;
  v25 = (void *)_os_log_send_and_compose_impl();

  result = (id)__nwlog_abort((uint64_t)v25);
  if (!(_DWORD)result)
  {
    free(v25);
    objc_msgSend(v4, "getCharacters:range:", 0, 0, v6, dest, v27);
    if (v6)
      goto LABEL_7;
LABEL_22:
    v16 = (void *)objc_msgSend(v4, "copy", v26, v27);

    if (!v16)
      goto LABEL_33;
    goto LABEL_23;
  }
LABEL_41:
  __break(1u);
  return result;
}

void __57__NWURLSessionTaskConfiguration_createIDNAEncodedDomain___block_invoke()
{
  NSObject *v0;
  const char *v1;
  void *v2;
  UErrorCode code[2];
  const char *v4;
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  code[0] = U_ZERO_ERROR;
  createIDNAEncodedDomain__idna = MEMORY[0x186DB5810](60, code);
  if (code[0] >= U_ILLEGAL_ARGUMENT_ERROR)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v0 = (id)gLogObj;
    os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
    v1 = u_errorName(code[0]);
    code[1] = 136446466;
    v4 = "-[NWURLSessionTaskConfiguration createIDNAEncodedDomain:]_block_invoke";
    v5 = 2080;
    v6 = v1;
    v2 = (void *)_os_log_send_and_compose_impl();

    if (__nwlog_abort((uint64_t)v2))
      __break(1u);
    else
      free(v2);
  }
}

- (void)configureSecProtocolOptions:(uint64_t)a1
{
  NSObject *options;

  options = a2;
  if (a1)
  {
    sec_protocol_options_set_min_tls_protocol_version(options, (tls_protocol_version_t)objc_msgSend(*(id *)(a1 + 16), "TLSMinimumSupportedProtocolVersion"));
    sec_protocol_options_set_max_tls_protocol_version(options, (tls_protocol_version_t)objc_msgSend(*(id *)(a1 + 16), "TLSMaximumSupportedProtocolVersion"));
    if (objc_msgSend(*(id *)(a1 + 16), "_allowsTLSSessionTickets"))
      sec_protocol_options_set_tls_tickets_enabled(options, 1);
  }

}

- (void)configureConnection:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    -[NWURLSessionTaskConfiguration activity](a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    nw_connection_start_activity(v6, v3);

    v4 = objc_msgSend(*(id *)(a1 + 24), "countOfBytesClientExpectsToSend");
    if (v4 >= 1)
      nw_connection_increment_estimated_bytes(v6, 0, v4);
    v5 = objc_msgSend(*(id *)(a1 + 24), "countOfBytesClientExpectsToReceive");
    if (v5 >= 1)
      nw_connection_increment_estimated_bytes(v6, 1, v5);
  }

}

- (id)activity
{
  void *v1;
  id *v2;
  id v3;
  id v4;

  if (a1)
  {
    v2 = (id *)(a1 + 40);
    v1 = *(void **)(a1 + 40);
    if (v1)
    {
      v3 = v1;
    }
    else
    {
      v4 = *(id *)(a1 + 24);
      objc_msgSend(v4, "_nw_activity");
      v3 = (id)objc_claimAutoreleasedReturnValue();

      if (!v3)
      {
        v3 = nw_activity_create(12, 2);
        nw_activity_activate(v3);
      }
      objc_storeStrong(v2, v3);
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)URLCredentialStorage
{
  uint64_t v1;
  id v2;
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  NSURLCredentialStorage *v8;
  NWConcrete_nw_authentication_credential_storage *v9;
  NSURLCredentialStorage *credentialStorage;
  void *v11;

  if (!a1)
    goto LABEL_4;
  v1 = *(_QWORD *)(a1 + 24);
  if (!v1)
  {
    v4 = 0;
    goto LABEL_14;
  }
  if (!*(_BYTE *)(v1 + 21))
  {
    v3 = *(id *)(v1 + 392);
    v4 = v3;
    if (v3)
    {
      v5 = (void *)*((_QWORD *)v3 + 6);
      if (!v5)
      {
        objc_msgSend(*((id *)v3 + 11), "URLCredentialStorage");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (v6)
        {
          v8 = v6;
          v9 = objc_alloc_init(NWConcrete_nw_authentication_credential_storage);
          credentialStorage = v9->credentialStorage;
          v9->credentialStorage = v8;

          v11 = (void *)v4[6];
          v4[6] = v9;

        }
        v5 = (void *)v4[6];
      }
      v2 = v5;
      goto LABEL_11;
    }
LABEL_14:
    v2 = 0;
LABEL_11:

    return v2;
  }
LABEL_4:
  v2 = 0;
  return v2;
}

@end
