@implementation NWParameters

- (unint64_t)dataMode
{
  void *v2;
  unint64_t data_mode;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  data_mode = nw_parameters_get_data_mode(v2);

  return data_mode;
}

- (unsigned)uid
{
  void *v2;
  unsigned int uid;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uid = nw_parameters_get_uid(v2);

  return uid;
}

- (BOOL)reuseLocalAddress
{
  NSObject *v2;
  BOOL reuse_local_address;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = objc_claimAutoreleasedReturnValue();
  reuse_local_address = nw_parameters_get_reuse_local_address(v2);

  return reuse_local_address;
}

- (BOOL)isDryRun
{
  void *v2;
  char dry_run;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  dry_run = nw_parameters_get_dry_run(v2);

  return dry_run;
}

- (int64_t)requiredCompanionProxyInterfaceType
{
  void *v2;
  int64_t next_hop_required_interface_type;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  next_hop_required_interface_type = nw_parameters_get_next_hop_required_interface_type(v2);

  return next_hop_required_interface_type;
}

- (BOOL)enableTFO
{
  void *v2;
  BOOL tfo;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  tfo = nw_parameters_get_tfo(v2);

  return tfo;
}

- (int)multipathService
{
  NSObject *v2;
  nw_multipath_service_t multipath_service;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = objc_claimAutoreleasedReturnValue();
  multipath_service = nw_parameters_get_multipath_service(v2);

  return multipath_service;
}

- (NSString)account
{
  void *v2;
  uint64_t account_id;
  void *v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  account_id = nw_parameters_get_account_id(v2);

  if (account_id)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", account_id);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  int is_known_tracker;
  void *v17;
  int is_third_party_web_content;
  void *v19;
  int is_approved_app_domain;
  void *v21;
  NSObject *v22;
  nw_endpoint_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 has_prohibited_interface_types;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 has_prohibited_interface_subtypes;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 has_preferred_interface_subtypes;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 has_preferred_netagents;
  void *v48;
  xpc_object_t v49;
  void *v50;
  void *v51;
  void *v52;
  xpc_object_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  _BOOL4 has_required_netagents;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  _BOOL4 has_prohibited_netagents;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  uint64_t fallback_mode;
  void *v95;
  int include_ble;
  void *v97;
  int include_screen_off_devices;
  void *v99;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NWParameters processUUID](self, "processUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v8, CFSTR("processUUID"), v5, v4);

  -[NWParameters effectiveProcessUUID](self, "effectiveProcessUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v9, CFSTR("effectiveProcessUUID"), v5, v4);

  -[NWParameters effectiveBundleID](self, "effectiveBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v10, CFSTR("effectiveBundleID"), v5, v4);

  objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWParameters pid](self, "pid"), CFSTR("pid"), v5);
  objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWParameters uid](self, "uid"), CFSTR("uid"), v5);
  -[NWParameters account](self, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v11, CFSTR("account"), v5, v4);

  -[NWParameters url](self, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v12, CFSTR("url"), v5, v4);

  -[NWParameters sanitizedURL](self, "sanitizedURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v13, CFSTR("sanitizedURL"), v5, v4);

  if (-[NWParameters dataMode](self, "dataMode") == 1)
  {
    v14 = CFSTR("Datagram");
  }
  else
  {
    if (-[NWParameters dataMode](self, "dataMode") != 2)
      goto LABEL_6;
    v14 = CFSTR("Stream");
  }
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v14, CFSTR("dataMode"), v5, v4);
LABEL_6:
  -[NWParameters internalParameters](self, "internalParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  is_known_tracker = nw_parameters_get_is_known_tracker(v15);

  if (is_known_tracker)
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", 1, CFSTR("knownTracker"), v5);
  -[NWParameters internalParameters](self, "internalParameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  is_third_party_web_content = nw_parameters_is_third_party_web_content(v17);

  if (is_third_party_web_content)
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", 1, CFSTR("thirdPartyWebContent"), v5);
  -[NWParameters internalParameters](self, "internalParameters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  is_approved_app_domain = nw_parameters_is_approved_app_domain(v19);

  if (is_approved_app_domain)
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", 1, CFSTR("approvedAppDomain"), v5);
  -[NWParameters protocolTransforms](self, "protocolTransforms");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v21, CFSTR("protocolTransforms"), v5, v4);

  if (-[NWParameters isDryRun](self, "isDryRun"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters isDryRun](self, "isDryRun"), CFSTR("isDryRun"), v5);
  if (-[NWParameters trafficClass](self, "trafficClass"))
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWParameters trafficClass](self, "trafficClass"), CFSTR("trafficClass"), v5);
  if (-[NWParameters ipProtocol](self, "ipProtocol"))
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWParameters ipProtocol](self, "ipProtocol"), CFSTR("ipProtocol"), v5);
  if (-[NWParameters transportProtocol](self, "transportProtocol"))
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWParameters transportProtocol](self, "transportProtocol"), CFSTR("transportProtocol"), v5);
  if (-[NWParameters requiredAddressFamily](self, "requiredAddressFamily"))
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWParameters requiredAddressFamily](self, "requiredAddressFamily"), CFSTR("requiredAddressFamily"), v5);
  -[NWParameters internalParameters](self, "internalParameters");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = nw_parameters_copy_local_endpoint(v22);

  if (v23)
  {
    -[NWParameters localAddress](self, "localAddress");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v24, CFSTR("localAddress"), v5, v4);

  }
  if (-[NWParameters reuseLocalAddress](self, "reuseLocalAddress"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters reuseLocalAddress](self, "reuseLocalAddress"), CFSTR("reuseLocalAddress"), v5);
  -[NWParameters requiredInterface](self, "requiredInterface");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v25, CFSTR("requiredInterface"), v5, v4);

  if (-[NWParameters requiredInterfaceType](self, "requiredInterfaceType"))
  {
    +[NWInterface descriptionForType:](NWInterface, "descriptionForType:", -[NWParameters requiredInterfaceType](self, "requiredInterfaceType"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v26, CFSTR("requiredInterfaceType"), v5, 1);

  }
  if (-[NWParameters requiredCompanionProxyInterfaceType](self, "requiredCompanionProxyInterfaceType"))
  {
    +[NWInterface descriptionForType:](NWInterface, "descriptionForType:", -[NWParameters requiredCompanionProxyInterfaceType](self, "requiredCompanionProxyInterfaceType"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v27, CFSTR("requiredCompanionInterfaceType"), v5, 1);

  }
  -[NWParameters internalParameters](self, "internalParameters");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  has_prohibited_interface_types = nw_parameters_has_prohibited_interface_types(v28);

  if (has_prohibited_interface_types)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = nw_parameters_copy_prohibited_interface_types(v30);

    if (v31)
    {
      v32 = (void *)MEMORY[0x186DB5A08](v31);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v33, CFSTR("prohibitedInterfaceTypes"), v5, 1);

      if (v32)
        free(v32);
    }

  }
  -[NWParameters internalParameters](self, "internalParameters");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  has_prohibited_interface_subtypes = nw_parameters_has_prohibited_interface_subtypes(v34);

  if (has_prohibited_interface_subtypes)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = nw_parameters_copy_prohibited_interface_subtypes(v36);

    if (v37)
    {
      v38 = (void *)MEMORY[0x186DB5A08](v37);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v39, CFSTR("prohibitedInterfaceSubtypes"), v5, 1);

      if (v38)
        free(v38);
    }

  }
  -[NWParameters internalParameters](self, "internalParameters");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  has_preferred_interface_subtypes = nw_parameters_has_preferred_interface_subtypes(v40);

  if (has_preferred_interface_subtypes)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = nw_parameters_copy_preferred_interface_subtypes(v42);

    if (v43)
    {
      v44 = (void *)MEMORY[0x186DB5A08](v43);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v45, CFSTR("preferredInterfaceSubtypes"), v5, 1);

      if (v44)
        free(v44);
    }

  }
  -[NWParameters internalParameters](self, "internalParameters");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  has_preferred_netagents = nw_parameters_has_preferred_netagents(v46);

  if (has_preferred_netagents)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = nw_parameters_copy_preferred_netagent_domains(v48);

    if (v49)
    {
      v50 = (void *)MEMORY[0x186DB5A08](v49);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v51, CFSTR("preferredNetworkAgentDomains"), v5, 1);

      if (v50)
        free(v50);
    }
    -[NWParameters internalParameters](self, "internalParameters");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = nw_parameters_copy_preferred_netagent_types(v52);

    if (v53)
    {
      v54 = (void *)MEMORY[0x186DB5A08](v53);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v55, CFSTR("preferredNetworkAgentTypes"), v5, 1);

      if (v54)
        free(v54);
    }
    -[NWParameters internalParameters](self, "internalParameters");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = nw_parameters_copy_preferred_netagent_uuids(v56);

    if (v57)
    {
      v58 = (void *)MEMORY[0x186DB5A08](v57);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v59, CFSTR("preferredNetworkAgentUUIDs"), v5, 1);

      if (v58)
        free(v58);
    }

  }
  -[NWParameters internalParameters](self, "internalParameters");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  has_required_netagents = nw_parameters_has_required_netagents(v60);

  if (has_required_netagents)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = nw_parameters_copy_required_netagent_domains(v62);

    if (v63)
    {
      v64 = (void *)MEMORY[0x186DB5A08](v63);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v65, CFSTR("requiredNetworkAgentDomains"), v5, 1);

      if (v64)
        free(v64);
    }
    -[NWParameters internalParameters](self, "internalParameters");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = nw_parameters_copy_required_netagent_types(v66);

    if (v67)
    {
      v68 = (void *)MEMORY[0x186DB5A08](v67);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v69, CFSTR("requiredNetworkAgentTypes"), v5, 1);

      if (v68)
        free(v68);
    }
    -[NWParameters internalParameters](self, "internalParameters");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = nw_parameters_copy_required_netagent_uuids(v70);

    if (v71)
    {
      v72 = (void *)MEMORY[0x186DB5A08](v71);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v73, CFSTR("requiredNetworkAgentUUIDs"), v5, 1);

      if (v72)
        free(v72);
    }

  }
  -[NWParameters internalParameters](self, "internalParameters");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  has_prohibited_netagents = nw_parameters_has_prohibited_netagents(v74);

  if (has_prohibited_netagents)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = nw_parameters_copy_prohibited_netagent_domains(v76);

    if (v77)
    {
      v78 = (void *)MEMORY[0x186DB5A08](v77);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v79, CFSTR("prohibitedNetworkAgentDomains"), v5, 1);

      if (v78)
        free(v78);
    }
    -[NWParameters internalParameters](self, "internalParameters");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = nw_parameters_copy_prohibited_netagent_types(v80);

    if (v81)
    {
      v82 = (void *)MEMORY[0x186DB5A08](v81);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v83, CFSTR("prohibitedNetworkAgentTypes"), v5, 1);

      if (v82)
        free(v82);
    }
    -[NWParameters internalParameters](self, "internalParameters");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = nw_parameters_copy_prohibited_netagent_uuids(v84);

    if (v85)
    {
      v86 = (void *)MEMORY[0x186DB5A08](v85);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v87, CFSTR("prohibitedNetworkAgentUUIDs"), v5, 1);

      if (v86)
        free(v86);
    }

  }
  if (-[NWParameters prohibitExpensivePaths](self, "prohibitExpensivePaths"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters prohibitExpensivePaths](self, "prohibitExpensivePaths"), CFSTR("prohibitExpensivePaths"), v5);
  if (-[NWParameters prohibitConstrainedPaths](self, "prohibitConstrainedPaths"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters prohibitConstrainedPaths](self, "prohibitConstrainedPaths"), CFSTR("prohibitConstrainedPaths"), v5);
  if (-[NWParameters prohibitRoaming](self, "prohibitRoaming"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters prohibitRoaming](self, "prohibitRoaming"), CFSTR("prohibitRoaming"), v5);
  if (-[NWParameters enableTFO](self, "enableTFO"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters enableTFO](self, "enableTFO"), CFSTR("enableTFO"), v5);
  if (-[NWParameters disableNagleAlgorithm](self, "disableNagleAlgorithm"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters disableNagleAlgorithm](self, "disableNagleAlgorithm"), CFSTR("disableNagleAlgorithm"), v5);
  if (-[NWParameters useLongOutstandingQueries](self, "useLongOutstandingQueries"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters useLongOutstandingQueries](self, "useLongOutstandingQueries"), CFSTR("useLongOutstandingQueries"), v5);
  if (-[NWParameters resolvePTR](self, "resolvePTR"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters resolvePTR](self, "resolvePTR"), CFSTR("resolvePTR"), v5);
  if (-[NWParameters useAWDL](self, "useAWDL"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters useAWDL](self, "useAWDL"), CFSTR("useAWDL"), v5);
  if (-[NWParameters useP2P](self, "useP2P"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters useP2P](self, "useP2P"), CFSTR("useP2P"), v5);
  if (-[NWParameters multipathService](self, "multipathService"))
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWParameters multipathService](self, "multipathService"), CFSTR("multipathService"), v5);
  if (-[NWParameters enableTLS](self, "enableTLS"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters enableTLS](self, "enableTLS"), CFSTR("enableTLS"), v5);
  -[NWParameters TLSSessionID](self, "TLSSessionID");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v88, CFSTR("TLSSessionID"), v5, v4);

  -[NWParameters internalParameters](self, "internalParameters");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v88) = nw_parameters_has_initial_data_payload(v89);

  if ((_DWORD)v88)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = nw_parameters_copy_initial_data_payload(v90);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%zu bytes]"), dispatch_data_get_size(v91));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v92, CFSTR("initialDataPayload"), v5, 1);

  }
  if (-[NWParameters trustInvalidCertificates](self, "trustInvalidCertificates"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWParameters trustInvalidCertificates](self, "trustInvalidCertificates"), CFSTR("trustInvalidCertificates"), v5);
  -[NWParameters internalParameters](self, "internalParameters");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  fallback_mode = nw_parameters_get_fallback_mode(v93);

  if ((_DWORD)fallback_mode)
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", fallback_mode, CFSTR("fallbackMode"), v5);
  -[NWParameters internalParameters](self, "internalParameters");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  include_ble = nw_parameters_get_include_ble(v95);

  if (include_ble)
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", 1, CFSTR("includeBle"), v5);
  -[NWParameters internalParameters](self, "internalParameters");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  include_screen_off_devices = nw_parameters_get_include_screen_off_devices(v97);

  if (include_screen_off_devices)
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", 1, CFSTR("includeScreenOff"), v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v7);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  return v99;
}

- (OS_nw_parameters)internalParameters
{
  return (OS_nw_parameters *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)trafficClass
{
  void *v2;
  unint64_t traffic_class;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  traffic_class = nw_parameters_get_traffic_class(v2);

  return traffic_class;
}

- (BOOL)prohibitConstrainedPaths
{
  NSObject *v2;
  BOOL prohibit_constrained;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = objc_claimAutoreleasedReturnValue();
  prohibit_constrained = nw_parameters_get_prohibit_constrained(v2);

  return prohibit_constrained;
}

- (NWInterface)requiredInterface
{
  NSObject *v2;
  nw_interface_t v3;
  NWInterface *v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = nw_parameters_copy_required_interface(v2);

  if (v3)
    v4 = -[NWInterface initWithInterface:]([NWInterface alloc], "initWithInterface:", v3);
  else
    v4 = 0;

  return v4;
}

- (BOOL)prohibitExpensivePaths
{
  NSObject *v2;
  BOOL prohibit_expensive;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = objc_claimAutoreleasedReturnValue();
  prohibit_expensive = nw_parameters_get_prohibit_expensive(v2);

  return prohibit_expensive;
}

- (BOOL)useP2P
{
  void *v2;
  char use_p2p;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  use_p2p = nw_parameters_get_use_p2p(v2);

  return use_p2p;
}

- (BOOL)useLongOutstandingQueries
{
  void *v2;
  char use_long_outstanding_queries;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  use_long_outstanding_queries = nw_parameters_get_use_long_outstanding_queries(v2);

  return use_long_outstanding_queries;
}

- (BOOL)useAWDL
{
  void *v2;
  char use_awdl;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  use_awdl = nw_parameters_get_use_awdl(v2);

  return use_awdl;
}

- (unsigned)transportProtocol
{
  void *v2;
  unsigned __int8 upper_transport_protocol;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  upper_transport_protocol = nw_parameters_get_upper_transport_protocol(v2);

  return upper_transport_protocol;
}

- (int64_t)requiredInterfaceType
{
  NSObject *v2;
  int64_t required_interface_type;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = objc_claimAutoreleasedReturnValue();
  required_interface_type = nw_parameters_get_required_interface_type(v2);

  return required_interface_type;
}

- (unsigned)requiredAddressFamily
{
  void *v2;
  unsigned __int8 required_address_family;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  required_address_family = nw_parameters_get_required_address_family(v2);

  return required_address_family;
}

- (BOOL)prohibitRoaming
{
  void *v2;
  char prohibit_roaming;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  prohibit_roaming = nw_parameters_get_prohibit_roaming(v2);

  return prohibit_roaming;
}

- (int)pid
{
  void *v2;
  int pid;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  pid = nw_parameters_get_pid(v2);

  return pid;
}

- (unsigned)ipProtocol
{
  void *v2;
  unsigned __int8 ip_protocol;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ip_protocol = nw_parameters_get_ip_protocol(v2);

  return ip_protocol;
}

- (NSUUID)effectiveProcessUUID
{
  void *v3;
  int is_null;
  void *v5;
  uuid_t uu;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  -[NWParameters internalParameters](self, "internalParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_get_e_proc_uuid(v3, uu);

  is_null = uuid_is_null(uu);
  v5 = 0;
  if (!is_null)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uu);
  return (NSUUID *)v5;
}

- (NSString)effectiveBundleID
{
  void *v2;
  uint64_t effective_bundle_id;
  void *v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  effective_bundle_id = nw_parameters_get_effective_bundle_id(v2);

  if (effective_bundle_id)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", effective_bundle_id);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (id)description
{
  return -[NWParameters descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 0);
}

- (NWParameters)initWithCoder:(id)a3
{
  id v4;
  NWParameters *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  xpc_object_t XPCDictionaryFromNSDictionary;
  void *v16;
  _BOOL8 v17;
  void *v18;
  NWParameters *v19;
  id v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  id v25;
  void *v26;
  NSObject *v27;
  os_log_type_t v28;
  const char *v29;
  char *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  id v33;
  char *backtrace_string;
  os_log_type_t v35;
  _BOOL4 v36;
  const char *v37;
  _BOOL4 v38;
  NSObject *v40;
  os_log_type_t v41;
  NSObject *v42;
  os_log_type_t v43;
  void *v44;
  char *v45;
  NSObject *v46;
  os_log_type_t v47;
  const char *v48;
  char *v49;
  _BOOL4 v50;
  char v51;
  os_log_type_t type;
  objc_super v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  char *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)NWParameters;
  v5 = -[NWParameters init](&v53, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("dictionary"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      XPCDictionaryFromNSDictionary = NWUtilsCreateXPCDictionaryFromNSDictionary(v13);
      v16 = XPCDictionaryFromNSDictionary;
      if (XPCDictionaryFromNSDictionary)
      {
        v17 = nw_parameters_create_from_dictionary(XPCDictionaryFromNSDictionary);
        -[NWParameters setInternalParameters:](v5, "setInternalParameters:", v17);

        -[NWParameters internalParameters](v5, "internalParameters");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = v5;
LABEL_39:

          goto LABEL_40;
        }
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v33 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v26 = (void *)_os_log_send_and_compose_impl();

        type = OS_LOG_TYPE_ERROR;
        v51 = 0;
        if (!__nwlog_fault((const char *)v26, &type, &v51))
        {
LABEL_36:
          if (!v26)
          {
LABEL_38:
            v19 = 0;
            goto LABEL_39;
          }
LABEL_37:
          free(v26);
          goto LABEL_38;
        }
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          v28 = type;
          if (!os_log_type_enabled(v27, type))
            goto LABEL_58;
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWParameters initWithCoder:]";
          v29 = "%{public}s nw_parameters_create_from_dictionary failed";
          goto LABEL_56;
        }
        if (!v51)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          v28 = type;
          if (!os_log_type_enabled(v27, type))
            goto LABEL_58;
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWParameters initWithCoder:]";
          v29 = "%{public}s nw_parameters_create_from_dictionary failed, backtrace limit exceeded";
          goto LABEL_56;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v27 = (id)gLogObj;
        v35 = type;
        v38 = os_log_type_enabled(v27, type);
        if (backtrace_string)
        {
          if (v38)
          {
            *(_DWORD *)buf = 136446466;
            v55 = "-[NWParameters initWithCoder:]";
            v56 = 2082;
            v57 = backtrace_string;
            v37 = "%{public}s nw_parameters_create_from_dictionary failed, dumping backtrace:%{public}s";
            goto LABEL_34;
          }
          goto LABEL_35;
        }
        if (!v38)
        {
LABEL_58:

          if (!v26)
            goto LABEL_38;
          goto LABEL_37;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v29 = "%{public}s nw_parameters_create_from_dictionary failed, no backtrace";
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v25 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v26 = (void *)_os_log_send_and_compose_impl();

        type = OS_LOG_TYPE_ERROR;
        v51 = 0;
        if (!__nwlog_fault((const char *)v26, &type, &v51))
          goto LABEL_36;
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          v28 = type;
          if (!os_log_type_enabled(v27, type))
            goto LABEL_58;
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWParameters initWithCoder:]";
          v29 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed";
LABEL_56:
          v42 = v27;
          v43 = v28;
LABEL_57:
          _os_log_impl(&dword_182FBE000, v42, v43, v29, buf, 0xCu);
          goto LABEL_58;
        }
        if (!v51)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          v28 = type;
          if (!os_log_type_enabled(v27, type))
            goto LABEL_58;
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWParameters initWithCoder:]";
          v29 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed, backtrace limit exceeded";
          goto LABEL_56;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v27 = (id)gLogObj;
        v35 = type;
        v36 = os_log_type_enabled(v27, type);
        if (backtrace_string)
        {
          if (v36)
          {
            *(_DWORD *)buf = 136446466;
            v55 = "-[NWParameters initWithCoder:]";
            v56 = 2082;
            v57 = backtrace_string;
            v37 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed, dumping backtrace:%{public}s";
LABEL_34:
            _os_log_impl(&dword_182FBE000, v27, v35, v37, buf, 0x16u);
          }
LABEL_35:

          free(backtrace_string);
          goto LABEL_36;
        }
        if (!v36)
          goto LABEL_58;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v29 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed, no backtrace";
      }
      v42 = v27;
      v43 = v35;
      goto LABEL_57;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v20 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v55 = "-[NWParameters initWithCoder:]";
    v21 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v51 = 0;
    if (__nwlog_fault(v21, &type, &v51))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v22 = (id)gLogObj;
        v23 = type;
        if (!os_log_type_enabled(v22, type))
          goto LABEL_46;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v24 = "%{public}s decodeObjectOfClasses:forKey failed";
LABEL_44:
        v40 = v22;
        v41 = v23;
        goto LABEL_45;
      }
      if (!v51)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v22 = (id)gLogObj;
        v23 = type;
        if (!os_log_type_enabled(v22, type))
          goto LABEL_46;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v24 = "%{public}s decodeObjectOfClasses:forKey failed, backtrace limit exceeded";
        goto LABEL_44;
      }
      v30 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v22 = (id)gLogObj;
      v31 = type;
      v32 = os_log_type_enabled(v22, type);
      if (!v30)
      {
        if (!v32)
        {
LABEL_46:

          if (!v21)
            goto LABEL_21;
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v24 = "%{public}s decodeObjectOfClasses:forKey failed, no backtrace";
        v40 = v22;
        v41 = v31;
LABEL_45:
        _os_log_impl(&dword_182FBE000, v40, v41, v24, buf, 0xCu);
        goto LABEL_46;
      }
      if (v32)
      {
        *(_DWORD *)buf = 136446466;
        v55 = "-[NWParameters initWithCoder:]";
        v56 = 2082;
        v57 = v30;
        _os_log_impl(&dword_182FBE000, v22, v31, "%{public}s decodeObjectOfClasses:forKey failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(v30);
    }
    if (!v21)
    {
LABEL_21:
      v19 = 0;
LABEL_40:

      goto LABEL_41;
    }
LABEL_20:
    free(v21);
    goto LABEL_21;
  }
  __nwlog_obj();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v55 = "-[NWParameters initWithCoder:]";
  v45 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v51 = 0;
  if (__nwlog_fault(v45, &type, &v51))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = type;
      if (os_log_type_enabled(v46, type))
      {
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v48 = "%{public}s [super init] failed";
LABEL_76:
        _os_log_impl(&dword_182FBE000, v46, v47, v48, buf, 0xCu);
      }
    }
    else
    {
      if (v51)
      {
        v49 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = type;
        v50 = os_log_type_enabled(v46, type);
        if (v49)
        {
          if (v50)
          {
            *(_DWORD *)buf = 136446466;
            v55 = "-[NWParameters initWithCoder:]";
            v56 = 2082;
            v57 = v49;
            _os_log_impl(&dword_182FBE000, v46, v47, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v49);
          goto LABEL_78;
        }
        if (!v50)
          goto LABEL_77;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v48 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_76;
      }
      __nwlog_obj();
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = type;
      if (os_log_type_enabled(v46, type))
      {
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWParameters initWithCoder:]";
        v48 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_76;
      }
    }
LABEL_77:

  }
LABEL_78:
  if (v45)
    free(v45);
  v19 = 0;
LABEL_41:

  return v19;
}

- (void)setInternalParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (BOOL)enableTLS
{
  void *v2;
  char tls;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  tls = nw_parameters_get_tls(v2);

  return tls;
}

- (NSUUID)processUUID
{
  void *v3;
  int is_null;
  void *v5;
  uuid_t uu;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  -[NWParameters internalParameters](self, "internalParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_get_proc_uuid(v3, uu);

  is_null = uuid_is_null(uu);
  v5 = 0;
  if (!is_null)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uu);
  return (NSUUID *)v5;
}

- (NSURL)url
{
  void *v2;
  void *url;
  void *v4;
  _BOOL8 v5;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  url = (void *)nw_parameters_get_url(v2);

  if (url)
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    v5 = nw_nsstring((uint64_t)url);
    objc_msgSend(v4, "URLWithString:", v5);
    url = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)url;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  id v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  const char *v20;
  char *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  char *backtrace_string;
  os_log_type_t v25;
  _BOOL4 v26;
  NSObject *v27;
  os_log_type_t v28;
  NSObject *v29;
  os_log_type_t v30;
  char v31;
  os_log_type_t type;
  _BYTE applier[24];
  void *v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = nw_parameters_copy_dictionary(v5);

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E08];
    v8 = v6;
    objc_msgSend(v7, "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)applier = MEMORY[0x1E0C809B0];
    *(_QWORD *)&applier[8] = 3221225472;
    *(_QWORD *)&applier[16] = __NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke;
    v34 = &unk_1E14A8E38;
    v10 = v9;
    v35 = v10;
    xpc_dictionary_apply(v8, applier);

    if (v10)
    {
      objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("dictionary"));
LABEL_39:

      goto LABEL_40;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    *(_DWORD *)applier = 136446210;
    *(_QWORD *)&applier[4] = "-[NWParameters encodeWithCoder:]";
    v17 = (void *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v31 = 0;
    if (!__nwlog_fault((const char *)v17, &type, &v31))
    {
LABEL_37:
      if (v17)
        free(v17);
      goto LABEL_39;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (id)gLogObj;
      v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)applier = 136446210;
        *(_QWORD *)&applier[4] = "-[NWParameters encodeWithCoder:]";
        v20 = "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed";
LABEL_34:
        v29 = v18;
        v30 = v19;
LABEL_35:
        _os_log_impl(&dword_182FBE000, v29, v30, v20, applier, 0xCu);
      }
    }
    else
    {
      if (v31)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v18 = (id)gLogObj;
        v25 = type;
        v26 = os_log_type_enabled(v18, type);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)applier = 136446466;
            *(_QWORD *)&applier[4] = "-[NWParameters encodeWithCoder:]";
            *(_WORD *)&applier[12] = 2082;
            *(_QWORD *)&applier[14] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v18, v25, "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, dumping backtrace:%{public}s", applier, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_37;
        }
        if (!v26)
          goto LABEL_36;
        *(_DWORD *)applier = 136446210;
        *(_QWORD *)&applier[4] = "-[NWParameters encodeWithCoder:]";
        v20 = "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, no backtrace";
        v29 = v18;
        v30 = v25;
        goto LABEL_35;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (id)gLogObj;
      v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)applier = 136446210;
        *(_QWORD *)&applier[4] = "-[NWParameters encodeWithCoder:]";
        v20 = "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, backtrace limit exceeded";
        goto LABEL_34;
      }
    }
LABEL_36:

    goto LABEL_37;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v11 = (id)gLogObj;
  *(_DWORD *)applier = 136446210;
  *(_QWORD *)&applier[4] = "-[NWParameters encodeWithCoder:]";
  v12 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v31 = 0;
  if (!__nwlog_fault(v12, &type, &v31))
    goto LABEL_17;
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v13 = (id)gLogObj;
    v14 = type;
    if (!os_log_type_enabled(v13, type))
      goto LABEL_28;
    *(_DWORD *)applier = 136446210;
    *(_QWORD *)&applier[4] = "-[NWParameters encodeWithCoder:]";
    v15 = "%{public}s nw_parameters_copy_dictionary failed";
LABEL_26:
    v27 = v13;
    v28 = v14;
LABEL_27:
    _os_log_impl(&dword_182FBE000, v27, v28, v15, applier, 0xCu);
    goto LABEL_28;
  }
  if (!v31)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v13 = (id)gLogObj;
    v14 = type;
    if (!os_log_type_enabled(v13, type))
      goto LABEL_28;
    *(_DWORD *)applier = 136446210;
    *(_QWORD *)&applier[4] = "-[NWParameters encodeWithCoder:]";
    v15 = "%{public}s nw_parameters_copy_dictionary failed, backtrace limit exceeded";
    goto LABEL_26;
  }
  v21 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v13 = (id)gLogObj;
  v22 = type;
  v23 = os_log_type_enabled(v13, type);
  if (v21)
  {
    if (v23)
    {
      *(_DWORD *)applier = 136446466;
      *(_QWORD *)&applier[4] = "-[NWParameters encodeWithCoder:]";
      *(_WORD *)&applier[12] = 2082;
      *(_QWORD *)&applier[14] = v21;
      _os_log_impl(&dword_182FBE000, v13, v22, "%{public}s nw_parameters_copy_dictionary failed, dumping backtrace:%{public}s", applier, 0x16u);
    }

    free(v21);
LABEL_17:
    if (!v12)
      goto LABEL_40;
    goto LABEL_29;
  }
  if (v23)
  {
    *(_DWORD *)applier = 136446210;
    *(_QWORD *)&applier[4] = "-[NWParameters encodeWithCoder:]";
    v15 = "%{public}s nw_parameters_copy_dictionary failed, no backtrace";
    v27 = v13;
    v28 = v22;
    goto LABEL_27;
  }
LABEL_28:

  if (v12)
LABEL_29:
    free(v12);
LABEL_40:

}

- (NSURL)sanitizedURL
{
  void *v2;
  void *sanitized_url;
  id v4;
  _BOOL8 v5;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sanitized_url = (void *)nw_parameters_get_sanitized_url(v2);

  if (sanitized_url)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E98]);
    v5 = nw_nsstring((uint64_t)sanitized_url);
    sanitized_url = (void *)objc_msgSend(v4, "initWithString:", v5);

  }
  return (NSURL *)sanitized_url;
}

- (NSArray)protocolTransforms
{
  void *v2;
  unsigned __int8 *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unsigned __int8 *)nw_parameters_copy_transform_array(v2);

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__NWParameters_protocolTransforms__block_invoke;
  v7[3] = &unk_1E14AC200;
  v5 = v4;
  v8 = v5;
  nw_array_apply(v3, (uint64_t)v7);

  return (NSArray *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SSLCipherSuitesInternal, 0);
  objc_storeStrong((id *)&self->_internalParameters, 0);
}

- (unint64_t)hash
{
  void *v2;
  size_t hash;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  hash = nw_parameters_get_hash(v2);

  return hash;
}

- (id)copyCParameters
{
  id v2;
  _BOOL8 v3;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v2, 0, 0);

  return (id)v3;
}

- (BOOL)resolvePTR
{
  void *v2;
  char resolve_ptr;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  resolve_ptr = nw_parameters_get_resolve_ptr(v2);

  return resolve_ptr;
}

- (BOOL)trustInvalidCertificates
{
  void *v2;
  char should_trust_invalid_certificates;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  should_trust_invalid_certificates = nw_parameters_get_should_trust_invalid_certificates(v2);

  return should_trust_invalid_certificates;
}

- (BOOL)disableNagleAlgorithm
{
  void *v2;
  BOOL no_delay;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  no_delay = nw_parameters_get_no_delay(v2);

  return no_delay;
}

- (NSData)TLSSessionID
{
  void *v2;
  id v3;
  void *v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_parameters_copy_tls_session_id(v2);

  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E0C812E8])
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  else
    v4 = 0;

  return (NSData *)v4;
}

+ (NWParameters)parametersWithCParameters:(id)a3
{
  id v3;
  NWParameters *v4;
  id v5;
  _BOOL8 v6;
  NWParameters *v7;

  v3 = a3;
  v4 = [NWParameters alloc];
  v5 = v3;
  v6 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v5, 0, 0);

  v7 = -[NWParameters initWithParameters:](v4, "initWithParameters:", v6);
  return v7;
}

- (NWParameters)initWithParameters:(id)a3
{
  id v5;
  NWParameters *v6;
  NWParameters *v7;
  void *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  const char *v13;
  void *v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  const char *v18;
  char *v19;
  _BOOL4 v20;
  char *backtrace_string;
  _BOOL4 v22;
  objc_super v23;
  char v24;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)NWParameters;
    v6 = -[NWParameters init](&v23, sel_init);
    if (v6)
    {
      v7 = v6;
      objc_storeStrong((id *)&v6->_internalParameters, a3);
      goto LABEL_4;
    }
    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWParameters initWithParameters:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v24 = 0;
    if (!__nwlog_fault(v15, &type, &v24))
      goto LABEL_38;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWParameters initWithParameters:]";
        v18 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_182FBE000, v16, v17, v18, buf, 0xCu);
      }
    }
    else if (v24)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = type;
      v22 = os_log_type_enabled(v16, type);
      if (backtrace_string)
      {
        if (v22)
        {
          *(_DWORD *)buf = 136446466;
          v27 = "-[NWParameters initWithParameters:]";
          v28 = 2082;
          v29 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }
      if (v22)
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWParameters initWithParameters:]";
        v18 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }
    else
    {
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWParameters initWithParameters:]";
        v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v15)
      free(v15);
    v7 = 0;
    goto LABEL_4;
  }
  __nwlog_obj();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWParameters initWithParameters:]";
  v10 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v24 = 0;
  if (__nwlog_fault(v10, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWParameters initWithParameters:]";
        v13 = "%{public}s called with null parameters";
LABEL_29:
        _os_log_impl(&dword_182FBE000, v11, v12, v13, buf, 0xCu);
      }
    }
    else
    {
      if (v24)
      {
        v19 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = type;
        v20 = os_log_type_enabled(v11, type);
        if (v19)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v27 = "-[NWParameters initWithParameters:]";
            v28 = 2082;
            v29 = v19;
            _os_log_impl(&dword_182FBE000, v11, v12, "%{public}s called with null parameters, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_31;
        }
        if (!v20)
          goto LABEL_30;
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWParameters initWithParameters:]";
        v13 = "%{public}s called with null parameters, no backtrace";
        goto LABEL_29;
      }
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWParameters initWithParameters:]";
        v13 = "%{public}s called with null parameters, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_30:

  }
LABEL_31:
  if (v10)
    free(v10);

  v7 = 0;
LABEL_4:

  return v7;
}

- (void)setSourceApplicationWithToken:(id *)a3
{
  __int128 v4;
  id v5;
  __int128 v6[2];

  -[NWParameters internalParameters](self, "internalParameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)&a3->var0[4];
  v6[0] = *(_OWORD *)a3->var0;
  v6[1] = v4;
  nw_parameters_set_source_application(v5, v6);

}

- (void)setProhibitConstrainedPaths:(BOOL)a3
{
  NSObject *v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v4 = objc_claimAutoreleasedReturnValue();
  nw_parameters_set_prohibit_constrained(v4, a3);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char is_equal;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[NWParameters internalParameters](self, "internalParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internalParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    is_equal = nw_parameters_is_equal(v6, v7);
  }
  else
  {
    is_equal = 0;
  }

  return is_equal;
}

- (NWParameters)init
{
  NWParameters *v2;
  nw_parameters_t v3;
  OS_nw_parameters *internalParameters;
  NWParameters *v5;
  id v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  const char *v10;
  const char *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  char *v14;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  NSObject *v19;
  os_log_type_t v20;
  const char *v21;
  const char *backtrace_string;
  _BOOL4 v23;
  char v24;
  os_log_type_t type;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)NWParameters;
  v2 = -[NWParameters init](&v26, sel_init);
  if (!v2)
  {
    __nwlog_obj();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v28 = "-[NWParameters init]";
    v7 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v24 = 0;
    if (!__nwlog_fault(v7, &type, &v24))
      goto LABEL_14;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWParameters init]";
        v21 = "%{public}s [super init] failed";
LABEL_39:
        _os_log_impl(&dword_182FBE000, v19, v20, v21, buf, 0xCu);
      }
    }
    else
    {
      if (v24)
      {
        backtrace_string = __nw_create_backtrace_string();
        __nwlog_obj();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = type;
        v23 = os_log_type_enabled(v19, type);
        if (backtrace_string)
        {
          if (v23)
          {
            *(_DWORD *)buf = 136446466;
            v28 = "-[NWParameters init]";
            v29 = 2082;
            v30 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v19, v20, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          v14 = (char *)backtrace_string;
LABEL_13:
          free(v14);
          goto LABEL_14;
        }
        if (!v23)
          goto LABEL_40;
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWParameters init]";
        v21 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_39;
      }
      __nwlog_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWParameters init]";
        v21 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_39;
      }
    }
LABEL_40:

LABEL_14:
    if (!v7)
    {
LABEL_16:
      v5 = 0;
      goto LABEL_17;
    }
LABEL_15:
    free(v7);
    goto LABEL_16;
  }
  v3 = nw_parameters_create();
  internalParameters = v2->_internalParameters;
  v2->_internalParameters = (OS_nw_parameters *)v3;

  if (!v2->_internalParameters)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v6 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v28 = "-[NWParameters init]";
    v7 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v24 = 0;
    if (!__nwlog_fault(v7, &type, &v24))
      goto LABEL_14;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      v9 = type;
      if (!os_log_type_enabled(v8, type))
        goto LABEL_22;
      *(_DWORD *)buf = 136446210;
      v28 = "-[NWParameters init]";
      v10 = "%{public}s nw_parameters_create failed";
LABEL_20:
      v16 = v8;
      v17 = v9;
      goto LABEL_21;
    }
    if (!v24)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      v9 = type;
      if (!os_log_type_enabled(v8, type))
        goto LABEL_22;
      *(_DWORD *)buf = 136446210;
      v28 = "-[NWParameters init]";
      v10 = "%{public}s nw_parameters_create failed, backtrace limit exceeded";
      goto LABEL_20;
    }
    v11 = __nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v8 = (id)gLogObj;
    v12 = type;
    v13 = os_log_type_enabled(v8, type);
    if (!v11)
    {
      if (!v13)
      {
LABEL_22:

        if (!v7)
          goto LABEL_16;
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136446210;
      v28 = "-[NWParameters init]";
      v10 = "%{public}s nw_parameters_create failed, no backtrace";
      v16 = v8;
      v17 = v12;
LABEL_21:
      _os_log_impl(&dword_182FBE000, v16, v17, v10, buf, 0xCu);
      goto LABEL_22;
    }
    if (v13)
    {
      *(_DWORD *)buf = 136446466;
      v28 = "-[NWParameters init]";
      v29 = 2082;
      v30 = v11;
      _os_log_impl(&dword_182FBE000, v8, v12, "%{public}s nw_parameters_create failed, dumping backtrace:%{public}s", buf, 0x16u);
    }

    v14 = (char *)v11;
    goto LABEL_13;
  }
  v5 = v2;
LABEL_17:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NWParameters *v4;
  id v5;
  _BOOL8 v6;
  NWParameters *v7;

  v4 = +[NWParameters allocWithZone:](NWParameters, "allocWithZone:", a3);
  -[NWParameters internalParameters](self, "internalParameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v5, 0, 0);

  v7 = -[NWParameters initWithParameters:](v4, "initWithParameters:", v6);
  return v7;
}

- (NSString)privateDescription
{
  return (NSString *)-[NWParameters descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 1);
}

- (void)setTrustInvalidCertificates:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_should_trust_invalid_certificates(v4, v3);

}

- (void)setAllowSocketAccess:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_allow_socket_access(v4, v3);

}

- (BOOL)allowSocketAccess
{
  void *v2;
  char allow_socket_access;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  allow_socket_access = nw_parameters_get_allow_socket_access(v2);

  return allow_socket_access;
}

- (void)setAccount:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_account_id(v4, (const char *)objc_msgSend(v5, "UTF8String"));

}

- (void)setDataMode:(unint64_t)a3
{
  unsigned int v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_data_mode(v4, v3);

}

- (void)setTrafficClass:(unint64_t)a3
{
  int v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_traffic_class(v4, v3);

}

- (void)setPid:(int)a3
{
  id v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_pid(v4, a3);

}

- (BOOL)hasDelegatedPIDForOriginatingPID:(int)a3
{
  void *v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = nw_parameters_has_delegated_proc_pid(v4, a3);

  return a3;
}

- (void)setUid:(unsigned int)a3
{
  id v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_uid(v4, a3);

}

- (void)setProcessUUID:(id)a3
{
  id v4;
  void *v5;
  uuid_t uu;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  v4 = a3;
  uuid_clear(uu);
  objc_msgSend(v4, "getUUIDBytes:", uu);

  -[NWParameters internalParameters](self, "internalParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_proc_uuid(v5, uu);

}

- (BOOL)hasDelegatedProcessUUID
{
  void *v2;
  BOOL has_delegated_proc_uuid;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_delegated_proc_uuid = nw_parameters_has_delegated_proc_uuid(v2);

  return has_delegated_proc_uuid;
}

- (void)setEffectiveProcessUUID:(id)a3
{
  id v4;
  void *v5;
  uuid_t uu;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  v4 = a3;
  uuid_clear(uu);
  objc_msgSend(v4, "getUUIDBytes:", uu);

  -[NWParameters internalParameters](self, "internalParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_e_proc_uuid(v5, uu);

}

- (void)setEffectiveBundleID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_effective_bundle_id(v4, (const char *)objc_msgSend(v5, "UTF8String"));

}

- (BOOL)copyEffectiveAuditToken:(id *)a3
{
  void *v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = nw_parameters_get_effective_audit_token(v4, a3);

  return (char)a3;
}

- (NSUUID)parentID
{
  void *v3;
  int is_null;
  void *v5;
  uuid_t uu;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  -[NWParameters internalParameters](self, "internalParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_get_parent_id(v3, uu);

  is_null = uuid_is_null(uu);
  v5 = 0;
  if (!is_null)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uu);
  return (NSUUID *)v5;
}

- (NSArray)parentIDs
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__NWParameters_parentIDs__block_invoke;
  v7[3] = &unk_1E14A9B18;
  v5 = v3;
  v8 = v5;
  nw_parameters_iterate_parent_ids(v4, v7);

  return (NSArray *)v5;
}

- (void)setParentID:(id)a3
{
  id v4;
  NWConcrete_nw_parameters *v5;
  uuid_t uu;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  v4 = a3;
  uuid_clear(uu);
  objc_msgSend(v4, "getUUIDBytes:", uu);

  -[NWParameters internalParameters](self, "internalParameters");
  v5 = (NWConcrete_nw_parameters *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_parent_id_inner(v5, uu, 1);

}

- (void)setRequiredAddressFamily:(unsigned __int8)a3
{
  int v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_required_address_family(v4, v3);

}

- (NWAddressEndpoint)localAddress
{
  NSObject *v2;
  nw_endpoint_t v3;
  void *v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = nw_parameters_copy_local_endpoint(v2);

  if (v3)
  {
    +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NWAddressEndpoint *)v4;
}

- (void)setLocalAddress:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *parameters;

  v4 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  parameters = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalEndpoint");
  v5 = objc_claimAutoreleasedReturnValue();

  nw_parameters_set_local_endpoint(parameters, v5);
}

- (void)setReuseLocalAddress:(BOOL)a3
{
  NSObject *v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v4 = objc_claimAutoreleasedReturnValue();
  nw_parameters_set_reuse_local_address(v4, a3);

}

- (void)setUrl:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "absoluteString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_url(v4, (const char *)objc_msgSend(v5, "UTF8String"));

}

- (NSDictionary)proxyConfiguration
{
  return 0;
}

- (void)setProxyConfiguration:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  id v7;

  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v4)
  {
    v7 = v4;
    v5 = object_getClass(v4) == (Class)MEMORY[0x1E0C812F8];
    v4 = v7;
    if (v5)
    {
      -[NWParameters internalParameters](self, "internalParameters");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      nw_parameters_set_proxy_configuration(v6, v7);

      v4 = v7;
    }
  }

}

- (void)setProhibitExpensivePaths:(BOOL)a3
{
  NSObject *v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v4 = objc_claimAutoreleasedReturnValue();
  nw_parameters_set_prohibit_expensive(v4, a3);

}

- (void)setProhibitRoaming:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_prohibit_roaming(v4, v3);

}

- (BOOL)prohibitCellular
{
  void *v2;
  BOOL prohibit_cellular;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  prohibit_cellular = nw_parameters_get_prohibit_cellular(v2);

  return prohibit_cellular;
}

- (void)prohibitInterfaceType:(int64_t)a3
{
  void *v5;
  xpc_object_t *v6;
  void *v7;
  xpc_object_t *objects;
  xpc_object_t *objectsa;

  -[NWParameters internalParameters](self, "internalParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objects = (xpc_object_t *)nw_parameters_copy_prohibited_interface_types(v5);

  v6 = objects;
  if (!objects)
    v6 = (xpc_object_t *)xpc_array_create(0, 0);
  objectsa = v6;
  xpc_array_set_uint64(v6, 0xFFFFFFFFFFFFFFFFLL, a3);
  -[NWParameters internalParameters](self, "internalParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_prohibited_interface_types(v7, objectsa);

}

- (void)prohibitInterfaceSubtype:(int64_t)a3
{
  void *v5;
  xpc_object_t *v6;
  void *v7;
  xpc_object_t *objects;
  xpc_object_t *objectsa;

  -[NWParameters internalParameters](self, "internalParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objects = (xpc_object_t *)nw_parameters_copy_prohibited_interface_subtypes(v5);

  v6 = objects;
  if (!objects)
    v6 = (xpc_object_t *)xpc_array_create(0, 0);
  objectsa = v6;
  xpc_array_set_uint64(v6, 0xFFFFFFFFFFFFFFFFLL, a3);
  -[NWParameters internalParameters](self, "internalParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_prohibited_interface_subtypes(v7, objectsa);

}

- (void)prohibitInterface:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = nw_parameters_copy_prohibited_interfaces(v4);

  if (!v5)
    v5 = xpc_array_create(0, 0);
  objc_msgSend(v9, "internalInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = nw_interface_copy_dictionary(v6);

  if (v7)
  {
    xpc_array_set_value(v5, 0xFFFFFFFFFFFFFFFFLL, v7);
    -[NWParameters internalParameters](self, "internalParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    nw_parameters_set_prohibited_interfaces(v8, v5);

  }
}

- (void)prohibitNetworkAgentWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 uuid[8];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = nw_parameters_copy_prohibited_netagent_uuids(v5);

    if (!v6)
      v6 = xpc_array_create(0, 0);
    *(_QWORD *)uuid = 0;
    v9 = 0;
    objc_msgSend(v4, "getUUIDBytes:", uuid);
    xpc_array_set_uuid(v6, 0xFFFFFFFFFFFFFFFFLL, uuid);
    -[NWParameters internalParameters](self, "internalParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    nw_parameters_set_prohibited_netagent_uuids(v7, v6);

  }
}

- (void)prohibitNetworkAgentsWithDomain:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  xpc_object_t v13;
  xpc_object_t v14;
  const char *v15;
  id v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  const char *v20;
  char *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  NSObject *v24;
  os_log_type_t v25;
  const char *v26;
  id v27;
  void *v28;
  NSObject *v29;
  os_log_type_t v30;
  const char *v31;
  char *backtrace_string;
  os_log_type_t v33;
  _BOOL4 v34;
  NSObject *v35;
  os_log_type_t v36;
  void *v37;
  uint8_t *v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = nw_parameters_copy_prohibited_netagent_domains(v9);

    -[NWParameters internalParameters](self, "internalParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = nw_parameters_copy_prohibited_netagent_types(v11);

    if (!v10 || !v12)
    {
      v13 = xpc_array_create(0, 0);

      v14 = xpc_array_create(0, 0);
      v12 = v14;
      v10 = v13;
    }
    v15 = (const char *)objc_msgSend(v6, "UTF8String");
    if (v15)
    {
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, v15);
      goto LABEL_24;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
    v46 = 2114;
    v47 = v6;
    LODWORD(v40) = 22;
    v38 = buf;
    v17 = (void *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v42 = 0;
    if (!__nwlog_fault((const char *)v17, &type, &v42))
    {
LABEL_22:
      if (v17)
        free(v17);
LABEL_24:
      v26 = (const char *)objc_msgSend(v8, "UTF8String", v38, v40);
      if (v26)
      {
        xpc_array_set_string(v12, 0xFFFFFFFFFFFFFFFFLL, v26);
LABEL_42:
        -[NWParameters internalParameters](self, "internalParameters", v39, v41);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        nw_parameters_set_prohibited_netagent_classes(v37, v10, v12);

        goto LABEL_43;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v27 = (id)gLogObj;
      *(_DWORD *)buf = 136446466;
      v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
      v46 = 2114;
      v47 = v8;
      LODWORD(v41) = 22;
      v39 = buf;
      v28 = (void *)_os_log_send_and_compose_impl();

      type = OS_LOG_TYPE_ERROR;
      v42 = 0;
      if (!__nwlog_fault((const char *)v28, &type, &v42))
      {
LABEL_40:
        if (v28)
          free(v28);
        goto LABEL_42;
      }
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v29 = (id)gLogObj;
        v30 = type;
        if (os_log_type_enabled(v29, type))
        {
          *(_DWORD *)buf = 136446466;
          v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
          v46 = 2114;
          v47 = v8;
          v31 = "%{public}s Failed to get UTF8String from type %{public}@";
LABEL_37:
          v35 = v29;
          v36 = v30;
LABEL_38:
          _os_log_impl(&dword_182FBE000, v35, v36, v31, buf, 0x16u);
        }
      }
      else
      {
        if (v42)
        {
          backtrace_string = (char *)__nw_create_backtrace_string();
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v29 = (id)gLogObj;
          v33 = type;
          v34 = os_log_type_enabled(v29, type);
          if (backtrace_string)
          {
            if (v34)
            {
              *(_DWORD *)buf = 136446722;
              v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
              v46 = 2114;
              v47 = v8;
              v48 = 2082;
              v49 = backtrace_string;
              _os_log_impl(&dword_182FBE000, v29, v33, "%{public}s Failed to get UTF8String from type %{public}@, dumping backtrace:%{public}s", buf, 0x20u);
            }

            free(backtrace_string);
            goto LABEL_40;
          }
          if (!v34)
            goto LABEL_39;
          *(_DWORD *)buf = 136446466;
          v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
          v46 = 2114;
          v47 = v8;
          v31 = "%{public}s Failed to get UTF8String from type %{public}@, no backtrace";
          v35 = v29;
          v36 = v33;
          goto LABEL_38;
        }
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v29 = (id)gLogObj;
        v30 = type;
        if (os_log_type_enabled(v29, type))
        {
          *(_DWORD *)buf = 136446466;
          v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
          v46 = 2114;
          v47 = v8;
          v31 = "%{public}s Failed to get UTF8String from type %{public}@, backtrace limit exceeded";
          goto LABEL_37;
        }
      }
LABEL_39:

      goto LABEL_40;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (id)gLogObj;
      v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446466;
        v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
        v46 = 2114;
        v47 = v6;
        v20 = "%{public}s Failed to get UTF8String from domain %{public}@";
LABEL_19:
        v24 = v18;
        v25 = v19;
LABEL_20:
        _os_log_impl(&dword_182FBE000, v24, v25, v20, buf, 0x16u);
      }
    }
    else
    {
      if (v42)
      {
        v21 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v18 = (id)gLogObj;
        v22 = type;
        v23 = os_log_type_enabled(v18, type);
        if (v21)
        {
          if (v23)
          {
            *(_DWORD *)buf = 136446722;
            v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
            v46 = 2114;
            v47 = v6;
            v48 = 2082;
            v49 = v21;
            _os_log_impl(&dword_182FBE000, v18, v22, "%{public}s Failed to get UTF8String from domain %{public}@, dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(v21);
          goto LABEL_22;
        }
        if (!v23)
          goto LABEL_21;
        *(_DWORD *)buf = 136446466;
        v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
        v46 = 2114;
        v47 = v6;
        v20 = "%{public}s Failed to get UTF8String from domain %{public}@, no backtrace";
        v24 = v18;
        v25 = v22;
        goto LABEL_20;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (id)gLogObj;
      v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446466;
        v45 = "-[NWParameters prohibitNetworkAgentsWithDomain:type:]";
        v46 = 2114;
        v47 = v6;
        v20 = "%{public}s Failed to get UTF8String from domain %{public}@, backtrace limit exceeded";
        goto LABEL_19;
      }
    }
LABEL_21:

    goto LABEL_22;
  }
LABEL_43:

}

- (void)setRequiredInterface:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *parameters;

  v4 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  parameters = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalInterface");
  v5 = objc_claimAutoreleasedReturnValue();

  nw_parameters_require_interface(parameters, v5);
}

- (void)setRequiredInterfaceType:(int64_t)a3
{
  nw_interface_type_t v3;
  NSObject *v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = objc_claimAutoreleasedReturnValue();
  nw_parameters_set_required_interface_type(v4, v3);

}

- (int64_t)requiredInterfaceSubtype
{
  void *v2;
  int64_t required_interface_subtype;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  required_interface_subtype = nw_parameters_get_required_interface_subtype(v2);

  return required_interface_subtype;
}

- (void)setRequiredInterfaceSubtype:(int64_t)a3
{
  int v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_required_interface_subtype(v4, v3);

}

- (void)setRequiredCompanionProxyInterfaceType:(int64_t)a3
{
  int v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_next_hop_required_interface_type(v4, v3);

}

- (void)requireNetworkAgentWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 uuid[8];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = nw_parameters_copy_required_netagent_uuids(v5);

    if (!v6)
      v6 = xpc_array_create(0, 0);
    *(_QWORD *)uuid = 0;
    v9 = 0;
    objc_msgSend(v4, "getUUIDBytes:", uuid);
    xpc_array_set_uuid(v6, 0xFFFFFFFFFFFFFFFFLL, uuid);
    -[NWParameters internalParameters](self, "internalParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    nw_parameters_set_required_netagent_uuids(v7, v6);

  }
}

- (void)requireNetworkAgentWithDomain:(id)a3 type:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  xpc_object_t v11;
  xpc_object_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[NWParameters internalParameters](self, "internalParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = nw_parameters_copy_required_netagent_domains(v7);

  -[NWParameters internalParameters](self, "internalParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = nw_parameters_copy_required_netagent_types(v9);

  if (!v8 || !v10)
  {
    v11 = xpc_array_create(0, 0);

    v12 = xpc_array_create(0, 0);
    v8 = v11;
    v10 = v12;
  }
  v13 = objc_msgSend(v18, "UTF8String");
  if (v13)
    v14 = (const char *)v13;
  else
    v14 = "";
  xpc_array_set_string(v8, 0xFFFFFFFFFFFFFFFFLL, v14);
  v15 = objc_msgSend(v6, "UTF8String");
  if (v15)
    v16 = (const char *)v15;
  else
    v16 = "";
  xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, v16);
  -[NWParameters internalParameters](self, "internalParameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_required_netagent_classes(v17, v8, v10);

}

- (void)preferNetworkAgentWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 uuid[8];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = nw_parameters_copy_preferred_netagent_uuids(v5);

    if (!v6)
      v6 = xpc_array_create(0, 0);
    *(_QWORD *)uuid = 0;
    v9 = 0;
    objc_msgSend(v4, "getUUIDBytes:", uuid);
    xpc_array_set_uuid(v6, 0xFFFFFFFFFFFFFFFFLL, uuid);
    -[NWParameters internalParameters](self, "internalParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    nw_parameters_set_preferred_netagent_uuids(v7, v6);

  }
}

- (void)preferNetworkAgentWithDomain:(id)a3 type:(id)a4
{
  id v6;
  void *v7;
  xpc_object_t v8;
  void *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[NWParameters internalParameters](self, "internalParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = nw_parameters_copy_preferred_netagent_domains(v7);

  -[NWParameters internalParameters](self, "internalParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = nw_parameters_copy_preferred_netagent_types(v9);

  if (!v8 || !v10)
  {
    v11 = xpc_array_create(0, 0);

    v12 = xpc_array_create(0, 0);
    v8 = v11;
    v10 = v12;
  }
  v13 = objc_msgSend(v18, "UTF8String");
  if (v13)
    v14 = (const char *)v13;
  else
    v14 = "";
  xpc_array_set_string(v8, 0xFFFFFFFFFFFFFFFFLL, v14);
  v15 = objc_msgSend(v6, "UTF8String");
  if (v15)
    v16 = (const char *)v15;
  else
    v16 = "";
  xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, v16);
  -[NWParameters internalParameters](self, "internalParameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_preferred_netagent_classes(v17, v8, v10);

}

- (void)avoidNetworkAgentWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 uuid[8];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = nw_parameters_copy_avoided_netagent_uuids(v5);

    if (!v6)
      v6 = xpc_array_create(0, 0);
    *(_QWORD *)uuid = 0;
    v9 = 0;
    objc_msgSend(v4, "getUUIDBytes:", uuid);
    xpc_array_set_uuid(v6, 0xFFFFFFFFFFFFFFFFLL, uuid);
    -[NWParameters internalParameters](self, "internalParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    nw_parameters_set_avoided_netagent_uuids(v7, v6);

  }
}

- (void)avoidNetworkAgentWithDomain:(id)a3 type:(id)a4
{
  id v6;
  void *v7;
  xpc_object_t v8;
  void *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[NWParameters internalParameters](self, "internalParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = nw_parameters_copy_avoided_netagent_domains(v7);

  -[NWParameters internalParameters](self, "internalParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = nw_parameters_copy_avoided_netagent_types(v9);

  if (!v8 || !v10)
  {
    v11 = xpc_array_create(0, 0);

    v12 = xpc_array_create(0, 0);
    v8 = v11;
    v10 = v12;
  }
  v13 = objc_msgSend(v18, "UTF8String");
  if (v13)
    v14 = (const char *)v13;
  else
    v14 = "";
  xpc_array_set_string(v8, 0xFFFFFFFFFFFFFFFFLL, v14);
  v15 = objc_msgSend(v6, "UTF8String");
  if (v15)
    v16 = (const char *)v15;
  else
    v16 = "";
  xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, v16);
  -[NWParameters internalParameters](self, "internalParameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_avoided_netagent_classes(v17, v8, v10);

}

- (void)setEnableTFO:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_tfo(v4, v3);

}

- (BOOL)enableTFONoCookie
{
  void *v2;
  BOOL tfo_no_cookie;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  tfo_no_cookie = nw_parameters_get_tfo_no_cookie(v2);

  return tfo_no_cookie;
}

- (void)setEnableTFONoCookie:(BOOL)a3
{
  id v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_tfo_no_cookie(v4, a3);

}

- (BOOL)fastOpenForceEnable
{
  void *v2;
  BOOL fast_open_force_enable;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fast_open_force_enable = nw_parameters_get_fast_open_force_enable(v2);

  return fast_open_force_enable;
}

- (void)setFastOpenForceEnable:(BOOL)a3
{
  id v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_fast_open_force_enable(v4, a3);

}

- (BOOL)reduceBuffering
{
  void *v2;
  BOOL reduce_buffering;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  reduce_buffering = nw_parameters_get_reduce_buffering(v2);

  return reduce_buffering;
}

- (void)setReduceBuffering:(BOOL)a3
{
  id v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_reduce_buffering(v4, a3);

}

- (void)setDisableNagleAlgorithm:(BOOL)a3
{
  id v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_no_delay(v4, a3);

}

- (void)setUseLongOutstandingQueries:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_use_long_outstanding_queries(v4, v3);

}

- (BOOL)ignoreResolverStats
{
  void *v2;
  char ignore_resolver_stats;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ignore_resolver_stats = nw_parameters_get_ignore_resolver_stats(v2);

  return ignore_resolver_stats;
}

- (void)setIgnoreResolverStats:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_ignore_resolver_stats(v4, v3);

}

- (void)setUseAWDL:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_use_awdl(v4, v3);

}

- (void)setUseP2P:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_use_p2p(v4, v3);

}

- (void)setResolvePTR:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_resolve_ptr(v4, v3);

}

- (BOOL)multipath
{
  void *v2;
  BOOL multipath;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  multipath = nw_parameters_get_multipath(v2);

  return multipath;
}

- (void)setMultipath:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  nw_multipath_service_t v5;
  NSObject *v6;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v3)
    v5 = nw_multipath_service_interactive;
  else
    v5 = nw_multipath_service_disabled;
  nw_parameters_set_multipath_service(v4, v5);

}

- (void)setMultipathService:(int)a3
{
  NSObject *v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v4 = objc_claimAutoreleasedReturnValue();
  nw_parameters_set_multipath_service(v4, (nw_multipath_service_t)a3);

}

- (BOOL)multipathForceEnable
{
  void *v2;
  char multipath_force_enable;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  multipath_force_enable = nw_parameters_get_multipath_force_enable(v2);

  return multipath_force_enable;
}

- (void)setMultipathForceEnable:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_multipath_force_enable(v4, v3);

}

- (BOOL)indefinite
{
  void *v2;
  char indefinite;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  indefinite = nw_parameters_get_indefinite(v2);

  return indefinite;
}

- (void)setIndefinite:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_indefinite(v4, v3);

}

- (BOOL)noProxy
{
  void *v2;
  char no_proxy;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  no_proxy = nw_parameters_get_no_proxy(v2);

  return no_proxy;
}

- (void)setNoProxy:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_no_proxy(v4, v3);

}

- (void)setEnableTLS:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_tls(v4, v3);

}

- (void)setTLSSessionID:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  id v7;

  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v4)
  {
    v7 = v4;
    v5 = object_getClass(v4) == (Class)MEMORY[0x1E0C812E8];
    v4 = v7;
    if (v5)
    {
      -[NWParameters internalParameters](self, "internalParameters");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      nw_parameters_set_tls_session_id(v6, v7);

      v4 = v7;
    }
  }

}

- (void)setSSLCipherSuites:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  tls_ciphersuite_t *v7;
  tls_ciphersuite_t *v8;
  uint64_t i;
  void *v10;
  tls_ciphersuite_t v11;
  void *v12;
  void *v13;
  tls_ciphersuite_t *v14;
  int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint8_t *v21;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NWParameters setSSLCipherSuitesInternal:](self, "setSSLCipherSuitesInternal:", v4);
  if (!objc_msgSend(v4, "count"))
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    nw_parameters_set_ssl_cipher_suites(v5, 0, 0);
LABEL_11:

    return;
  }
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (!v6)
  {
    __nwlog_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 136446210;
    v24 = "strict_calloc";
    LODWORD(v22) = 12;
    v21 = buf;
    v17 = (void *)_os_log_send_and_compose_impl();

    if (__nwlog_abort((uint64_t)v17))
      goto LABEL_18;
    free(v17);
  }
  v7 = (tls_ciphersuite_t *)malloc_type_calloc(2uLL, v6, 0xEAFB8F1AuLL);
  if (v7)
  {
    v8 = v7;
    if (v6)
    {
      for (i = 0; i != v6; v8[i++] = v11)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", i, v21, v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (unsigned __int16)objc_msgSend(v10, "unsignedIntValue");

      }
      -[NWParameters internalParameters](self, "internalParameters");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = v8;
      v15 = v6;
    }
    else
    {
      -[NWParameters internalParameters](self, "internalParameters");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = v8;
      v15 = 0;
    }
    nw_parameters_set_ssl_cipher_suites(v12, v14, v15);

    free(v8);
    goto LABEL_11;
  }
  __nwlog_obj();
  v18 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
  *(_DWORD *)buf = 136446722;
  v24 = "strict_calloc";
  v25 = 2048;
  v26 = 2;
  v27 = 2048;
  v28 = v6;
  v19 = (void *)_os_log_send_and_compose_impl();

  if (!__nwlog_abort((uint64_t)v19))
  {
    free(v19);
    __nwlog_obj();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v24 = "-[NWParameters setSSLCipherSuites:]";
      v25 = 1024;
      LODWORD(v26) = v6;
      _os_log_impl(&dword_182FBE000, v20, OS_LOG_TYPE_ERROR, "%{public}s Could not allocate array for %d SSL cipher suites", buf, 0x12u);
    }

    goto LABEL_11;
  }
LABEL_18:
  __break(1u);
}

- (BOOL)keepAlive
{
  void *v2;
  BOOL keepalive_enabled;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  keepalive_enabled = nw_parameters_get_keepalive_enabled(v2);

  return keepalive_enabled;
}

- (void)setKeepAlive:(BOOL)a3
{
  id v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_keepalive_enabled(v4, a3);

}

- (unint64_t)keepAliveIdleTime
{
  void *v2;
  unint64_t keepalive_idle_time;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  keepalive_idle_time = nw_parameters_get_keepalive_idle_time(v2);

  return keepalive_idle_time;
}

- (void)setKeepAliveIdleTime:(unint64_t)a3
{
  uint32_t v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_keepalive_idle_time(v4, v3);

}

- (unint64_t)keepAliveInterval
{
  void *v2;
  unint64_t keepalive_interval;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  keepalive_interval = nw_parameters_get_keepalive_interval(v2);

  return keepalive_interval;
}

- (void)setKeepAliveInterval:(unint64_t)a3
{
  uint32_t v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_keepalive_interval(v4, v3);

}

- (BOOL)keepAliveOffload
{
  void *v2;
  BOOL keepalive_offload;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  keepalive_offload = nw_parameters_get_keepalive_offload(v2);

  return keepalive_offload;
}

- (void)setKeepAliveOffload:(BOOL)a3
{
  id v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_keepalive_offload(v4, a3);

}

- (unsigned)tlsVersionWithSSLProtocol:(int)a3
{
  unsigned __int16 result;
  const char *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  result = 768;
  switch(a3)
  {
    case 0:
      return 0;
    case 1:
    case 3:
    case 5:
    case 6:
      v5 = "deprecated";
      goto LABEL_3;
    case 2:
      return result;
    case 4:
      return 769;
    case 7:
      return 770;
    case 8:
      return 771;
    case 9:
      return -257;
    case 10:
      return 772;
    default:
      v5 = "unknown";
LABEL_3:
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v6 = (id)gLogObj;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = 136446722;
        v8 = "-[NWParameters tlsVersionWithSSLProtocol:]";
        v9 = 2082;
        v10 = v5;
        v11 = 1024;
        v12 = a3;
        _os_log_impl(&dword_182FBE000, v6, OS_LOG_TYPE_ERROR, "%{public}s Parameters have %{public}s SSLProtocol %d, ignoring", (uint8_t *)&v7, 0x1Cu);
      }

      return 0;
  }
}

- (void)setMinimumSSLProtocolVersion:(unint64_t)a3
{
  id v5;

  -[NWParameters tlsVersionWithSSLProtocol:](self, "tlsVersionWithSSLProtocol:");
  -[NWParameters setMinimumSSLProtocolVersionInternal:](self, "setMinimumSSLProtocolVersionInternal:", a3);
  -[NWParameters internalParameters](self, "internalParameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_minimum_tls_protocol_version(v5);

}

- (void)setMaximumSSLProtocolVersion:(unint64_t)a3
{
  id v5;

  -[NWParameters tlsVersionWithSSLProtocol:](self, "tlsVersionWithSSLProtocol:");
  -[NWParameters setMaximumSSLProtocolVersionInternal:](self, "setMaximumSSLProtocolVersionInternal:", a3);
  -[NWParameters internalParameters](self, "internalParameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_maximum_tls_protocol_version(v5);

}

- (void)setSourceApplicationWithBundleID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_source_application_by_bundle_id_internal(v4, (const char *)objc_msgSend(v5, "UTF8String"));

}

- (void)setInitialDataPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  const char *v11;
  void *v12;
  char *backtrace_string;
  os_log_type_t v14;
  _BOOL4 v15;
  NSObject *v16;
  os_log_type_t v17;
  char v18;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v6 = 0;
    goto LABEL_8;
  }
  v6 = (void *)objc_msgSend(v4, "_createDispatchData");
  if (v6)
  {
LABEL_8:
    -[NWParameters internalParameters](self, "internalParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    nw_parameters_set_initial_data_payload(v12, v6);

    goto LABEL_9;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v7 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v21 = "-[NWParameters setInitialDataPayload:]";
  v8 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v18 = 0;
  if (!__nwlog_fault(v8, &type, &v18))
    goto LABEL_20;
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    v10 = type;
    if (os_log_type_enabled(v9, type))
    {
      *(_DWORD *)buf = 136446210;
      v21 = "-[NWParameters setInitialDataPayload:]";
      v11 = "%{public}s NWCreateDispatchDataFromNSData failed";
LABEL_17:
      v16 = v9;
      v17 = v10;
LABEL_18:
      _os_log_impl(&dword_182FBE000, v16, v17, v11, buf, 0xCu);
    }
  }
  else
  {
    if (v18)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v9 = (id)gLogObj;
      v14 = type;
      v15 = os_log_type_enabled(v9, type);
      if (backtrace_string)
      {
        if (v15)
        {
          *(_DWORD *)buf = 136446466;
          v21 = "-[NWParameters setInitialDataPayload:]";
          v22 = 2082;
          v23 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v9, v14, "%{public}s NWCreateDispatchDataFromNSData failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (!v15)
        goto LABEL_19;
      *(_DWORD *)buf = 136446210;
      v21 = "-[NWParameters setInitialDataPayload:]";
      v11 = "%{public}s NWCreateDispatchDataFromNSData failed, no backtrace";
      v16 = v9;
      v17 = v14;
      goto LABEL_18;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    v10 = type;
    if (os_log_type_enabled(v9, type))
    {
      *(_DWORD *)buf = 136446210;
      v21 = "-[NWParameters setInitialDataPayload:]";
      v11 = "%{public}s NWCreateDispatchDataFromNSData failed, backtrace limit exceeded";
      goto LABEL_17;
    }
  }
LABEL_19:

LABEL_20:
  if (v8)
    free(v8);
LABEL_9:

}

- (void)setProtocolTransforms:(id)a3
{
  id v4;
  _BOOL8 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = nw_array_create();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "internalTransform", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        nw_array_append(v5, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[NWParameters internalParameters](self, "internalParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_transform_array(v12, (void *)v5);

}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_parameters_are_valid(v2);

  return v3;
}

- (BOOL)prohibitFallback
{
  void *v2;
  char no_fallback;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  no_fallback = nw_parameters_get_no_fallback(v2);

  return no_fallback;
}

- (void)setProhibitFallback:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_no_fallback(v4, v3);

}

- (BOOL)isDiscretionary
{
  void *v2;
  char discretionary;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  discretionary = nw_parameters_get_discretionary(v2);

  return discretionary;
}

- (void)setDiscretionary:(BOOL)a3
{
  __int16 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_discretionary(v4, v3);

}

- (BOOL)hasRequiredNetworkAgents
{
  void *v2;
  BOOL has_required_netagents;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_required_netagents = nw_parameters_has_required_netagents(v2);

  return has_required_netagents;
}

- (BOOL)hasPreferredNetworkAgents
{
  void *v2;
  BOOL has_preferred_netagents;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_preferred_netagents = nw_parameters_has_preferred_netagents(v2);

  return has_preferred_netagents;
}

- (BOOL)hasProhibitedNetworkAgents
{
  void *v2;
  BOOL has_prohibited_netagents;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_prohibited_netagents = nw_parameters_has_prohibited_netagents(v2);

  return has_prohibited_netagents;
}

- (BOOL)hasNonEmptyProxyConfiguration
{
  void *v2;
  BOOL has_custom_proxy_configs;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_custom_proxy_configs = nw_parameters_has_custom_proxy_configs(v2);

  return has_custom_proxy_configs;
}

- (id)copyRequiredAgentsDescription
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD applier[4];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;

  -[NWParameters internalParameters](self, "internalParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = nw_parameters_copy_required_netagent_domains(v3);

  if (v4)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = nw_parameters_copy_required_netagent_types(v5);

    if (v6)
    {
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x2020000000;
      v16 = 0;
      v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = __45__NWParameters_copyRequiredAgentsDescription__block_invoke;
      applier[3] = &unk_1E14A3098;
      v12 = v6;
      v8 = v7;
      v13 = v8;
      v14 = v15;
      xpc_array_apply(v4, applier);
      if (objc_msgSend(v8, "length"))
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v8);
      else
        v9 = 0;

      _Block_object_dispose(v15, 8);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setProtocolAtLevel:(unint64_t)a3 protocol:(nw_protocol_identifier *)a4
{
  int v5;
  id v6;

  if (a3 - 1 < 4)
    v5 = a3;
  else
    v5 = 0;
  -[NWParameters internalParameters](self, "internalParameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_add_to_protocol_stack(v6, v5, 0xFFFFFFFF, (__int128 *)a4->name);

}

- (NSData)metadata
{
  void *v2;
  id v3;
  id v4;
  const void *bytes_ptr;
  void *v6;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_parameters_copy_metadata(v2);

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D50]);
    bytes_ptr = xpc_data_get_bytes_ptr(v3);
    v6 = (void *)objc_msgSend(v4, "initWithBytes:length:", bytes_ptr, xpc_data_get_length(v3));
  }
  else
  {
    v6 = 0;
  }

  return (NSData *)v6;
}

- (void)setMetadata:(id)a3
{
  id v4;
  xpc_object_t v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
    v5 = xpc_data_create((const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
  else
    v5 = 0;
  -[NWParameters internalParameters](self, "internalParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_metadata(v6, v5);

}

- (id)createProtocolBufferObject
{
  NWPBParameters *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  unsigned int v18;
  void *v19;
  void *v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  int v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  void *v30;
  _BOOL4 has_required_netagents;
  void *v32;
  id v33;
  void *v34;
  id v35;
  size_t count;
  size_t v37;
  size_t i;
  const char *string;
  const char *v40;
  const char *v41;
  NWPBAgentClass *v42;
  void *v43;
  void *v44;
  NWPBAgentClass *v45;
  NSMutableArray *requiredAgents;
  NSMutableArray *v47;
  NSMutableArray *v48;
  void *v49;
  _BOOL4 has_prohibited_netagents;
  void *v51;
  id v52;
  void *v53;
  id v54;
  size_t v55;
  size_t v56;
  size_t j;
  const char *v58;
  const char *v59;
  const char *v60;
  NWPBAgentClass *v61;
  void *v62;
  void *v63;
  NWPBAgentClass *v64;
  NSMutableArray *prohibitedAgents;
  NSMutableArray *v66;
  NSMutableArray *v67;
  void *v68;
  _BOOL4 has_preferred_netagents;
  void *v70;
  xpc_object_t v71;
  void *v72;
  xpc_object_t v73;
  size_t v74;
  size_t v75;
  size_t k;
  const char *v77;
  const char *v78;
  const char *v79;
  NWPBAgentClass *v80;
  void *v81;
  void *v82;
  NWPBAgentClass *v83;
  NSMutableArray *preferredAgents;
  NSMutableArray *v85;
  NSMutableArray *v86;
  void *v87;
  _BOOL4 has_prohibited_interfaces;
  void *v89;
  id v90;
  size_t v91;
  size_t v92;
  size_t m;
  void *v94;
  NWConcrete_nw_interface *v95;
  NWInterface *v96;
  id v97;
  NSMutableArray *prohibitedInterfaces;
  NSMutableArray *v99;
  NSMutableArray *v100;
  void *v101;
  _BOOL4 has_prohibited_interface_types;
  void *v103;
  id v104;
  size_t v105;
  size_t v106;
  size_t n;
  void *v108;
  _BOOL4 has_prohibited_interface_subtypes;
  void *v110;
  id v111;
  size_t v112;
  size_t v113;
  size_t ii;

  v3 = objc_alloc_init(NWPBParameters);
  -[NWParameters effectiveProcessUUID](self, "effectiveProcessUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_effectiveProcessUUID, v5);

  -[NWParameters processUUID](self, "processUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_realProcessUUID, v7);

  -[NWParameters localAddress](self, "localAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "createProtocolBufferObject");
  if (v3)
    objc_storeStrong((id *)&v3->_localEndpoint, v9);

  -[NWParameters account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_account, v10);

  if (-[NWParameters requiredAddressFamily](self, "requiredAddressFamily"))
  {
    v11 = -[NWParameters requiredAddressFamily](self, "requiredAddressFamily");
    if (v3)
    {
      *(_WORD *)&v3->_has |= 1u;
      v3->_addressFamily = v11;
      v12 = -[NWParameters dataMode](self, "dataMode");
LABEL_13:
      *(_WORD *)&v3->_has |= 2u;
      v3->_dataMode = v12;
      -[NWParameters effectiveBundleID](self, "effectiveBundleID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v3->_effectiveBundleID, v13);
      goto LABEL_14;
    }
    -[NWParameters dataMode](self, "dataMode");
  }
  else
  {
    v12 = -[NWParameters dataMode](self, "dataMode");
    if (v3)
      goto LABEL_13;
  }
  -[NWParameters effectiveBundleID](self, "effectiveBundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  -[NWParameters metadata](self, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_metadata, v14);

  -[NWParameters requiredInterface](self, "requiredInterface");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "createProtocolBufferObject");
  if (v3)
    objc_storeStrong((id *)&v3->_requiredInterface, v16);

  v17 = -[NWParameters requiredInterfaceType](self, "requiredInterfaceType");
  if (v3)
  {
    *(_WORD *)&v3->_has |= 0x10u;
    v3->_requiredInterfaceType = v17;
    v18 = -[NWParameters trafficClass](self, "trafficClass");
    *(_WORD *)&v3->_has |= 0x20u;
    v3->_trafficClass = v18;
  }
  else
  {
    -[NWParameters trafficClass](self, "trafficClass");
  }
  -[NWParameters url](self, "url");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "absoluteString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_url, v20);

  if (-[NWParameters enableTFO](self, "enableTFO"))
  {
    v21 = -[NWParameters enableTFO](self, "enableTFO");
    if (v3)
    {
      *(_WORD *)&v3->_has |= 0x40u;
      v3->_fastOpen = v21;
    }
  }
  if (-[NWParameters keepAlive](self, "keepAlive"))
  {
    v22 = -[NWParameters keepAlive](self, "keepAlive");
    if (v3)
    {
      *(_WORD *)&v3->_has |= 0x80u;
      v3->_keepalive = v22;
      v23 = -[NWParameters useLongOutstandingQueries](self, "useLongOutstandingQueries");
LABEL_29:
      *(_WORD *)&v3->_has |= 0x100u;
      v3->_longOutstandingQueries = v23;
      v24 = -[NWParameters multipathService](self, "multipathService");
      *(_WORD *)&v3->_has |= 8u;
      v3->_multipathService = v24;
      v25 = -[NWParameters prohibitFallback](self, "prohibitFallback");
      *(_WORD *)&v3->_has |= 0x200u;
      v3->_noFallback = v25;
      v26 = -[NWParameters prohibitExpensivePaths](self, "prohibitExpensivePaths");
      *(_WORD *)&v3->_has |= 0x400u;
      v3->_prohibitExpensive = v26;
      v27 = -[NWParameters reuseLocalAddress](self, "reuseLocalAddress");
      *(_WORD *)&v3->_has |= 0x1000u;
      v3->_reuseLocalAddress = v27;
      v28 = -[NWParameters useAWDL](self, "useAWDL");
      *(_WORD *)&v3->_has |= 0x2000u;
      v3->_useAWDL = v28;
      v29 = -[NWParameters useP2P](self, "useP2P");
      *(_WORD *)&v3->_has |= 0x4000u;
      v3->_useP2P = v29;
      goto LABEL_30;
    }
    -[NWParameters useLongOutstandingQueries](self, "useLongOutstandingQueries");
  }
  else
  {
    v23 = -[NWParameters useLongOutstandingQueries](self, "useLongOutstandingQueries");
    if (v3)
      goto LABEL_29;
  }
  -[NWParameters multipathService](self, "multipathService");
  -[NWParameters prohibitFallback](self, "prohibitFallback");
  -[NWParameters prohibitExpensivePaths](self, "prohibitExpensivePaths");
  -[NWParameters reuseLocalAddress](self, "reuseLocalAddress");
  -[NWParameters useAWDL](self, "useAWDL");
  -[NWParameters useP2P](self, "useP2P");
LABEL_30:
  -[NWParameters internalParameters](self, "internalParameters");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  has_required_netagents = nw_parameters_has_required_netagents(v30);

  if (has_required_netagents)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = nw_parameters_copy_required_netagent_domains(v32);

    -[NWParameters internalParameters](self, "internalParameters");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = nw_parameters_copy_required_netagent_types(v34);

    if (v33)
    {
      if (v35)
      {
        count = xpc_array_get_count(v33);
        if (count)
        {
          v37 = count;
          for (i = 0; i != v37; ++i)
          {
            string = xpc_array_get_string(v33, i);
            v40 = xpc_array_get_string(v35, i);
            if (string)
            {
              v41 = v40;
              if (v40)
              {
                v42 = objc_alloc_init(NWPBAgentClass);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                if (v42)
                  objc_storeStrong((id *)&v42->_domain, v43);

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v41);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                if (v42)
                  objc_storeStrong((id *)&v42->_type, v44);

                v45 = v42;
                if (v3)
                {
                  requiredAgents = v3->_requiredAgents;
                  if (!requiredAgents)
                  {
                    v47 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v48 = v3->_requiredAgents;
                    v3->_requiredAgents = v47;

                    requiredAgents = v3->_requiredAgents;
                  }
                  -[NSMutableArray addObject:](requiredAgents, "addObject:", v45);
                }

              }
            }
          }
        }
      }
    }

  }
  -[NWParameters internalParameters](self, "internalParameters");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  has_prohibited_netagents = nw_parameters_has_prohibited_netagents(v49);

  if (has_prohibited_netagents)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = nw_parameters_copy_prohibited_netagent_domains(v51);

    -[NWParameters internalParameters](self, "internalParameters");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = nw_parameters_copy_prohibited_netagent_types(v53);

    if (v52)
    {
      if (v54)
      {
        v55 = xpc_array_get_count(v52);
        if (v55)
        {
          v56 = v55;
          for (j = 0; j != v56; ++j)
          {
            v58 = xpc_array_get_string(v52, j);
            v59 = xpc_array_get_string(v54, j);
            if (v58)
            {
              v60 = v59;
              if (v59)
              {
                v61 = objc_alloc_init(NWPBAgentClass);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v58);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                if (v61)
                  objc_storeStrong((id *)&v61->_domain, v62);

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v60);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                if (v61)
                  objc_storeStrong((id *)&v61->_type, v63);

                v64 = v61;
                if (v3)
                {
                  prohibitedAgents = v3->_prohibitedAgents;
                  if (!prohibitedAgents)
                  {
                    v66 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v67 = v3->_prohibitedAgents;
                    v3->_prohibitedAgents = v66;

                    prohibitedAgents = v3->_prohibitedAgents;
                  }
                  -[NSMutableArray addObject:](prohibitedAgents, "addObject:", v64);
                }

              }
            }
          }
        }
      }
    }

  }
  -[NWParameters internalParameters](self, "internalParameters");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  has_preferred_netagents = nw_parameters_has_preferred_netagents(v68);

  if (has_preferred_netagents)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = nw_parameters_copy_preferred_netagent_domains(v70);

    -[NWParameters internalParameters](self, "internalParameters");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = nw_parameters_copy_preferred_netagent_types(v72);

    if (v71)
    {
      if (v73)
      {
        v74 = xpc_array_get_count(v71);
        if (v74)
        {
          v75 = v74;
          for (k = 0; k != v75; ++k)
          {
            v77 = xpc_array_get_string(v71, k);
            v78 = xpc_array_get_string(v73, k);
            if (v77)
            {
              v79 = v78;
              if (v78)
              {
                v80 = objc_alloc_init(NWPBAgentClass);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v77);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                if (v80)
                  objc_storeStrong((id *)&v80->_domain, v81);

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v79);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                if (v80)
                  objc_storeStrong((id *)&v80->_type, v82);

                v83 = v80;
                if (v3)
                {
                  preferredAgents = v3->_preferredAgents;
                  if (!preferredAgents)
                  {
                    v85 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v86 = v3->_preferredAgents;
                    v3->_preferredAgents = v85;

                    preferredAgents = v3->_preferredAgents;
                  }
                  -[NSMutableArray addObject:](preferredAgents, "addObject:", v83);
                }

              }
            }
          }
        }
      }
    }

  }
  -[NWParameters internalParameters](self, "internalParameters");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  has_prohibited_interfaces = nw_parameters_has_prohibited_interfaces(v87);

  if (has_prohibited_interfaces)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = nw_parameters_copy_prohibited_interfaces(v89);

    if (v90)
    {
      v91 = xpc_array_get_count(v90);
      if (v91)
      {
        v92 = v91;
        for (m = 0; m != v92; ++m)
        {
          xpc_array_get_value(v90, m);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = nw_interface_create_from_dictionary(v94);

          if (v95)
          {
            v96 = -[NWInterface initWithInterface:]([NWInterface alloc], "initWithInterface:", v95);
            v97 = -[NWInterface createProtocolBufferObject](v96, "createProtocolBufferObject");
            if (v3)
            {
              prohibitedInterfaces = v3->_prohibitedInterfaces;
              if (!prohibitedInterfaces)
              {
                v99 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v100 = v3->_prohibitedInterfaces;
                v3->_prohibitedInterfaces = v99;

                prohibitedInterfaces = v3->_prohibitedInterfaces;
              }
              -[NSMutableArray addObject:](prohibitedInterfaces, "addObject:", v97);
            }

          }
        }
      }
    }

  }
  -[NWParameters internalParameters](self, "internalParameters");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  has_prohibited_interface_types = nw_parameters_has_prohibited_interface_types(v101);

  if (has_prohibited_interface_types)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = nw_parameters_copy_prohibited_interface_types(v103);

    if (v104)
    {
      v105 = xpc_array_get_count(v104);
      if (v105)
      {
        v106 = v105;
        for (n = 0; n != v106; ++n)
        {
          xpc_array_get_uint64(v104, n);
          if (v3)
            PBRepeatedInt32Add();
        }
      }
    }

  }
  -[NWParameters internalParameters](self, "internalParameters");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  has_prohibited_interface_subtypes = nw_parameters_has_prohibited_interface_subtypes(v108);

  if (has_prohibited_interface_subtypes)
  {
    -[NWParameters internalParameters](self, "internalParameters");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = nw_parameters_copy_prohibited_interface_subtypes(v110);

    if (v111)
    {
      v112 = xpc_array_get_count(v111);
      if (v112)
      {
        v113 = v112;
        for (ii = 0; ii != v113; ++ii)
        {
          xpc_array_get_uint64(v111, ii);
          if (v3)
            PBRepeatedInt32Add();
        }
      }
    }

  }
  return v3;
}

- (void)setAllowUnusableAddresses:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_allow_unusable_addresses(v4, v3);

}

- (BOOL)allowUnusableAddresses
{
  void *v2;
  char allow_unusable_addresses;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  allow_unusable_addresses = nw_parameters_get_allow_unusable_addresses(v2);

  return allow_unusable_addresses;
}

- (void)setPreferNoProxy:(BOOL)a3
{
  NSObject *v4;

  -[NWParameters internalParameters](self, "internalParameters");
  v4 = objc_claimAutoreleasedReturnValue();
  nw_parameters_set_prefer_no_proxy(v4, a3);

}

- (BOOL)preferNoProxy
{
  NSObject *v2;
  BOOL prefer_no_proxy;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = objc_claimAutoreleasedReturnValue();
  prefer_no_proxy = nw_parameters_get_prefer_no_proxy(v2);

  return prefer_no_proxy;
}

- (void)setHttpsProxyIsOpaque:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_https_proxy_is_opaque(v4, v3);

}

- (BOOL)httpsProxyIsOpaque
{
  void *v2;
  char is_opaque;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_opaque = nw_parameters_get_https_proxy_is_opaque(v2);

  return is_opaque;
}

- (void)setHttpsProxyOverTLS:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_https_proxy_over_tls(v4, v3);

}

- (BOOL)httpsProxyOverTLS
{
  void *v2;
  char https_proxy_over_tls;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  https_proxy_over_tls = nw_parameters_get_https_proxy_over_tls(v2);

  return https_proxy_over_tls;
}

- (void)setAttachProtocolListener:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_attach_protocol_listener(v4, v3);

}

- (BOOL)attachProtocolListener
{
  void *v2;
  char attach_protocol_listener;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  attach_protocol_listener = nw_parameters_get_attach_protocol_listener(v2);

  return attach_protocol_listener;
}

- (void)setProhibitJoiningProtocols:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_prohibit_joining_protocols(v4, v3);

}

- (BOOL)prohibitJoiningProtocols
{
  void *v2;
  char prohibit_joining_protocols;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  prohibit_joining_protocols = nw_parameters_get_prohibit_joining_protocols(v2);

  return prohibit_joining_protocols;
}

- (void)setAllowJoiningConnectedFd:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_allow_joining_connected_fd(v4, v3);

}

- (BOOL)allowJoiningConnectedFd
{
  void *v2;
  char allow_joining_connected_fd;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  allow_joining_connected_fd = nw_parameters_get_allow_joining_connected_fd(v2);

  return allow_joining_connected_fd;
}

- (void)setAllowDuplicateStateUpdates:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWParameters internalParameters](self, "internalParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_parameters_set_allow_duplicate_state_updates(v4, v3);

}

- (BOOL)allowDuplicateStateUpdates
{
  void *v2;
  char allow_duplicate_state_updates;

  -[NWParameters internalParameters](self, "internalParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  allow_duplicate_state_updates = nw_parameters_get_allow_duplicate_state_updates(v2);

  return allow_duplicate_state_updates;
}

- (NSSet)SSLCipherSuitesInternal
{
  return self->_SSLCipherSuitesInternal;
}

- (void)setSSLCipherSuitesInternal:(id)a3
{
  objc_storeStrong((id *)&self->_SSLCipherSuitesInternal, a3);
}

- (unint64_t)minimumSSLProtocolVersionInternal
{
  return self->_minimumSSLProtocolVersionInternal;
}

- (void)setMinimumSSLProtocolVersionInternal:(unint64_t)a3
{
  self->_minimumSSLProtocolVersionInternal = a3;
}

- (unint64_t)maximumSSLProtocolVersionInternal
{
  return self->_maximumSSLProtocolVersionInternal;
}

- (void)setMaximumSSLProtocolVersionInternal:(unint64_t)a3
{
  self->_maximumSSLProtocolVersionInternal = a3;
}

uint64_t __45__NWParameters_copyRequiredAgentsDescription__block_invoke(uint64_t a1, size_t a2, void *a3)
{
  id v5;
  Class Class;
  objc_class *v7;
  void *v8;
  const char *string_ptr;
  const char *v10;
  const char *v11;

  v5 = a3;
  Class = object_getClass(v5);
  v7 = (objc_class *)MEMORY[0x1E0C81390];
  if (Class == (Class)MEMORY[0x1E0C81390])
  {
    xpc_array_get_value(*(xpc_object_t *)(a1 + 32), a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (object_getClass(v8) == v7)
    {
      string_ptr = xpc_string_get_string_ptr(v5);
      v10 = xpc_string_get_string_ptr(v8);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        v11 = ", ";
      else
        v11 = "";
      objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("%s%s:%s"), v11, string_ptr, v10);
    }

  }
  return 1;
}

uint64_t __34__NWParameters_protocolTransforms__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  NWProtocolTransform *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  v5 = -[NWProtocolTransform initWithCTransform:]([NWProtocolTransform alloc], "initWithCTransform:", v4);

  objc_msgSend(v3, "addObject:", v5);
  return 1;
}

uint64_t __25__NWParameters_parentIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a2);
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NWParameters)parametersWithProtocolBufferData:(id)a3
{
  NWPBParameters *v3;
  NWPBParameters *v4;
  NWParameters *v5;
  NWConcrete_nw_parameters *v6;
  NWConcrete_nw_protocol_stack *v7;
  id *v8;
  NWParameters *v9;
  id v10;
  NSString *v11;
  void *v12;
  id v13;
  NSString *v14;
  void *v15;
  NWPBEndpoint *localEndpoint;
  NWPBEndpoint *v17;
  void *v18;
  void *v19;
  NSString *v20;
  __int16 has;
  uint64_t dataMode;
  id v23;
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  NWPBParameters *v27;
  NSString *v29;
  NSData *v30;
  NWPBInterface *requiredInterface;
  NWPBInterface *v32;
  void *v33;
  void *v34;
  uint64_t requiredInterfaceType;
  NSString *url;
  void *v37;
  NSString *v38;
  void *v39;
  __int16 v40;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  uint64_t v49;
  NSMutableArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  uint64_t v58;
  NSMutableArray *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  id v66;
  uint64_t v67;
  NSMutableArray *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t i;
  void *v72;
  void *v73;
  unint64_t v74;
  unint64_t j;
  char *backtrace_string;
  os_log_type_t v77;
  _BOOL4 v78;
  os_log_type_t v79;
  id v80;
  NWPBParameters *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  char v98;
  os_log_type_t type;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  uint8_t v103[128];
  uint8_t buf[4];
  const char *v105;
  __int16 v106;
  char *v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v80 = a3;
  v3 = -[NWPBParameters initWithData:]([NWPBParameters alloc], "initWithData:", v80);
  v81 = v3;
  if (!v3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v23 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v105 = "+[NWParameters parametersWithProtocolBufferData:]";
    v24 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v98 = 0;
    if (__nwlog_fault(v24, &type, &v98))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v25 = (id)gLogObj;
        v26 = type;
        if (os_log_type_enabled(v25, type))
        {
          *(_DWORD *)buf = 136446210;
          v105 = "+[NWParameters parametersWithProtocolBufferData:]";
          _os_log_impl(&dword_182FBE000, v25, v26, "%{public}s [NWPBParameters initWithData:] failed", buf, 0xCu);
        }
      }
      else if (v98)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v25 = (id)gLogObj;
        v77 = type;
        v78 = os_log_type_enabled(v25, type);
        if (backtrace_string)
        {
          if (v78)
          {
            *(_DWORD *)buf = 136446466;
            v105 = "+[NWParameters parametersWithProtocolBufferData:]";
            v106 = 2082;
            v107 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v25, v77, "%{public}s [NWPBParameters initWithData:] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          v27 = 0;
          if (!v24)
            goto LABEL_21;
          goto LABEL_20;
        }
        if (v78)
        {
          *(_DWORD *)buf = 136446210;
          v105 = "+[NWParameters parametersWithProtocolBufferData:]";
          _os_log_impl(&dword_182FBE000, v25, v77, "%{public}s [NWPBParameters initWithData:] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v25 = (id)gLogObj;
        v79 = type;
        if (os_log_type_enabled(v25, type))
        {
          *(_DWORD *)buf = 136446210;
          v105 = "+[NWParameters parametersWithProtocolBufferData:]";
          _os_log_impl(&dword_182FBE000, v25, v79, "%{public}s [NWPBParameters initWithData:] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
    v27 = 0;
    if (!v24)
    {
LABEL_21:
      v9 = 0;
      goto LABEL_22;
    }
LABEL_20:
    free(v24);
    goto LABEL_21;
  }
  v4 = v3;
  v5 = [NWParameters alloc];
  v6 = [NWConcrete_nw_parameters alloc];
  v7 = objc_alloc_init(NWConcrete_nw_protocol_stack);
  v8 = -[NWConcrete_nw_parameters initWithStack:]((id *)&v6->super.isa, v7);

  v9 = -[NWParameters initWithParameters:](v5, "initWithParameters:", v8);
  if (v4->_effectiveProcessUUID)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v11 = v4->_effectiveProcessUUID;
    v12 = (void *)objc_msgSend(v10, "initWithUUIDString:", v11);
    -[NWParameters setEffectiveProcessUUID:](v9, "setEffectiveProcessUUID:", v12);

  }
  if (v4->_realProcessUUID)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v14 = v4->_realProcessUUID;
    v15 = (void *)objc_msgSend(v13, "initWithUUIDString:", v14);
    -[NWParameters setProcessUUID:](v9, "setProcessUUID:", v15);

  }
  localEndpoint = v4->_localEndpoint;
  if (localEndpoint)
  {
    v17 = localEndpoint;
    -[NWPBEndpoint data](v17, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[NWEndpoint endpointWithProtocolBufferData:](NWEndpoint, "endpointWithProtocolBufferData:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NWParameters setLocalAddress:](v9, "setLocalAddress:", v19);

    v4 = v81;
  }
  v20 = v4->_account;
  -[NWParameters setAccount:](v9, "setAccount:", v20);

  has = (__int16)v4->_has;
  if ((has & 1) != 0)
  {
    -[NWParameters setRequiredAddressFamily:](v9, "setRequiredAddressFamily:", LOBYTE(v4->_addressFamily));
    has = (__int16)v4->_has;
  }
  if ((has & 2) != 0)
    dataMode = v4->_dataMode;
  else
    dataMode = 0;
  -[NWParameters setDataMode:](v9, "setDataMode:", dataMode);
  v29 = v4->_effectiveBundleID;
  -[NWParameters setEffectiveBundleID:](v9, "setEffectiveBundleID:", v29);

  v30 = v4->_metadata;
  -[NWParameters setMetadata:](v9, "setMetadata:", v30);

  requiredInterface = v4->_requiredInterface;
  if (requiredInterface)
  {
    v32 = requiredInterface;
    -[NWPBInterface data](v32, "data");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[NWInterface interfaceWithProtocolBufferData:](NWInterface, "interfaceWithProtocolBufferData:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWParameters setRequiredInterface:](v9, "setRequiredInterface:", v34);

    v4 = v81;
  }
  if ((*(_WORD *)&v4->_has & 0x10) != 0)
    requiredInterfaceType = v4->_requiredInterfaceType;
  else
    requiredInterfaceType = 0;
  -[NWParameters setRequiredInterfaceType:](v9, "setRequiredInterfaceType:", requiredInterfaceType);
  -[NWParameters setTrafficClass:](v9, "setTrafficClass:", v4->_trafficClass);
  url = v4->_url;
  if (url)
  {
    v37 = (void *)MEMORY[0x1E0C99E98];
    v38 = url;
    objc_msgSend(v37, "URLWithString:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWParameters setUrl:](v9, "setUrl:", v39);

    v4 = v81;
  }
  v40 = (__int16)v4->_has;
  if ((v40 & 0x40) != 0)
  {
    -[NWParameters setEnableTFO:](v9, "setEnableTFO:", v4->_fastOpen);
    v40 = (__int16)v4->_has;
  }
  if ((v40 & 0x80) != 0)
    -[NWParameters setKeepAlive:](v9, "setKeepAlive:", v4->_keepalive);
  -[NWParameters setUseLongOutstandingQueries:](v9, "setUseLongOutstandingQueries:", v4->_longOutstandingQueries);
  -[NWParameters setMultipathService:](v9, "setMultipathService:", v4->_multipathService);
  -[NWParameters setProhibitFallback:](v9, "setProhibitFallback:", v4->_noFallback);
  -[NWParameters setProhibitExpensivePaths:](v9, "setProhibitExpensivePaths:", v4->_prohibitExpensive);
  -[NWParameters setReuseLocalAddress:](v9, "setReuseLocalAddress:", v4->_reuseLocalAddress);
  -[NWParameters setUseAWDL:](v9, "setUseAWDL:", v4->_useAWDL);
  -[NWParameters setUseP2P:](v9, "setUseP2P:", v4->_useP2P);
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v41 = v4->_requiredAgents;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v95;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v95 != v43)
          objc_enumerationMutation(v41);
        v45 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * v44);
        if (v45)
        {
          v46 = *(id *)(v45 + 8);
          v47 = *(void **)(v45 + 16);
        }
        else
        {
          v46 = 0;
          v47 = 0;
        }
        v48 = v47;
        -[NWParameters requireNetworkAgentWithDomain:type:](v9, "requireNetworkAgentWithDomain:type:", v46, v48);

        ++v44;
      }
      while (v42 != v44);
      v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
      v42 = v49;
    }
    while (v49);
  }

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v50 = v81->_preferredAgents;
  v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v91;
    do
    {
      v53 = 0;
      do
      {
        if (*(_QWORD *)v91 != v52)
          objc_enumerationMutation(v50);
        v54 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v53);
        if (v54)
        {
          v55 = *(id *)(v54 + 8);
          v56 = *(void **)(v54 + 16);
        }
        else
        {
          v55 = 0;
          v56 = 0;
        }
        v57 = v56;
        -[NWParameters preferNetworkAgentWithDomain:type:](v9, "preferNetworkAgentWithDomain:type:", v55, v57);

        ++v53;
      }
      while (v51 != v53);
      v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
      v51 = v58;
    }
    while (v58);
  }

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v59 = v81->_prohibitedAgents;
  v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
  if (v60)
  {
    v61 = *(_QWORD *)v87;
    do
    {
      v62 = 0;
      do
      {
        if (*(_QWORD *)v87 != v61)
          objc_enumerationMutation(v59);
        v63 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v62);
        if (v63)
        {
          v64 = *(id *)(v63 + 8);
          v65 = *(void **)(v63 + 16);
        }
        else
        {
          v64 = 0;
          v65 = 0;
        }
        v66 = v65;
        -[NWParameters prohibitNetworkAgentsWithDomain:type:](v9, "prohibitNetworkAgentsWithDomain:type:", v64, v66);

        ++v62;
      }
      while (v60 != v62);
      v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
      v60 = v67;
    }
    while (v67);
  }

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v68 = v81->_prohibitedInterfaces;
  v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
  if (v69)
  {
    v70 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v69; ++i)
      {
        if (*(_QWORD *)v83 != v70)
          objc_enumerationMutation(v68);
        objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * i), "data");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        +[NWInterface interfaceWithProtocolBufferData:](NWInterface, "interfaceWithProtocolBufferData:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[NWParameters prohibitInterface:](v9, "prohibitInterface:", v73);

      }
      v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
    }
    while (v69);
  }

  v74 = 0;
  v27 = v81;
  while (v74 < v81->_prohibitedInterfaceTypes.count)
  {
    -[NWParameters prohibitInterfaceType:](v9, "prohibitInterfaceType:", v27->_prohibitedInterfaceTypes.list[v74++]);
    v27 = v81;
  }
  for (j = 0; j < v81->_prohibitedInterfaceSubTypes.count; ++j)
  {
    -[NWParameters prohibitInterfaceSubtype:](v9, "prohibitInterfaceSubtype:", v27->_prohibitedInterfaceSubTypes.list[j]);
    v27 = v81;
  }
LABEL_22:

  return v9;
}

@end
