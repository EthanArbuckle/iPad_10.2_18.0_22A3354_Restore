@implementation NEIKEv2Helper

+ (uint64_t)getIdentifierType:(uint64_t)a1
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_self();
  if (objc_msgSend(v2, "rangeOfString:options:", CFSTR(".+@.+\\..+"), 1024) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v2, "rangeOfString:options:", CFSTR("^[1-2]?[0-9]{1,2}\\.[1-2]?[0-9]{1,2}\\.[1-2]?[0-9]{1,2}\\.[1-2]?[0-9]{1,2}$"), 1024) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v2, "rangeOfString:options:", CFSTR("^(:|(([0-9A-Fa-f]{1,4}):)){1,7}[0-9A-Fa-f]{1,4}$"), 1024) == 0x7FFFFFFFFFFFFFFFLL)
        v3 = 2;
      else
        v3 = 5;
    }
    else
    {
      v3 = 1;
    }
  }
  else
  {
    v3 = 3;
  }

  return v3;
}

+ (id)createRouteArrayFromTunnelConfig:(void *)a3 localTS:(void *)a4 remoteTS:(void *)a5 gatewayAddress:(int)a6 isIPv4:
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NEIPv4Route *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NEIPv4Route *v21;
  NEIPv6Route *v22;
  uint64_t v23;
  __CFString *v24;
  __CFString *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  CFStringRef v44;
  NEIPv6Route *v45;
  NEIPv4Route *v46;
  NEIPv6Route *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  __objc2_class **v52;
  void *v53;
  id v55;
  __CFString *v56;
  __CFString *v57;
  uint64_t v58;
  __CFString *v59;
  id v60;
  __CFString *v61;
  id v62;
  id v63;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v55 = a3;
  v60 = a4;
  v63 = a5;
  objc_opt_self();
  v62 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
  if (!v10)
  {
    v12 = 0;
    goto LABEL_16;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v71;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v71 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
      if (a6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
        v16 = [NEIPv4Route alloc];
        objc_msgSend(v15, "address");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "hostname");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "subnetMaskAddress");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "hostname");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[NEIPv4Route initWithDestinationAddress:subnetMask:](v16, "initWithDestinationAddress:subnetMask:", v18, v20);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
        v22 = [NEIPv6Route alloc];
        objc_msgSend(v15, "address", v55);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "hostname");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v15, "prefix"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[NEIPv6Route initWithDestinationAddress:networkPrefixLength:](v22, "initWithDestinationAddress:networkPrefixLength:", v18, v19);
      }

      -[NEIPv4Route setGatewayAddress:](v21, "setGatewayAddress:", v63);
      objc_msgSend(v62, "addObject:", v21);
      ++v12;

    }
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
  }
  while (v11);
LABEL_16:

  if (a6)
    v23 = 7;
  else
    v23 = 8;
  v24 = CFSTR("::");
  if (a6)
  {
    v24 = CFSTR("0.0.0.0");
    v25 = CFSTR("255.255.255.255");
  }
  else
  {
    v25 = CFSTR("ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff");
  }
  v57 = v24;
  v56 = v25;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v26 = v60;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (v27)
  {
    v28 = v27;
    v59 = 0;
    v61 = 0;
    v29 = *(_QWORD *)v67;
    v58 = *(_QWORD *)v67;
LABEL_24:
    v30 = 0;
    while (1)
    {
      if (*(_QWORD *)v67 != v29)
        objc_enumerationMutation(v26);
      v31 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v30);
      if (-[NEIKEv2TrafficSelector type]((uint64_t)v31) != v23)
        goto LABEL_48;
      objc_msgSend(v31, "startAddress");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "hostname");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v34 = (void *)v33;
        v35 = v26;
        objc_msgSend(v31, "endAddress");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "hostname");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(v31, "startAddress");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "hostname");
          v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "endAddress");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "hostname");
          v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v26 = v35;
          if (v39
            && v41
            && (-[__CFString isEqualToString:](v39, "isEqualToString:", v57)
             && -[__CFString isEqualToString:](v41, "isEqualToString:", v56)
             || -[__CFString isEqualToString:](v39, "isEqualToString:", v57, v55)
             && -[__CFString isEqualToString:](v41, "isEqualToString:", v57)))
          {
            if (!v12)
            {
              v52 = off_1E3CBBC70;
              if (!a6)
                v52 = off_1E3CBBC80;
              -[__objc2_class defaultRoute](*v52, "defaultRoute", v55);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "addObject:", v53);

              v49 = v62;
              v51 = v62;

              goto LABEL_59;
            }
          }
          else
          {
            v42 = NEGetPrefixForAddressRangeStrings(v39, v41);
            if ((_DWORD)v42)
            {
              v43 = v42;
              if (!a6)
              {
                v47 = [NEIPv6Route alloc];
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v43);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = -[NEIPv6Route initWithDestinationAddress:networkPrefixLength:](v47, "initWithDestinationAddress:networkPrefixLength:", v39, v48);

                v26 = v35;
                -[NEIPv6Route setGatewayAddress:](v45, "setGatewayAddress:", v63);
                objc_msgSend(v62, "addObject:", v45);
                goto LABEL_47;
              }
              v44 = NECreateIPv4AddressMaskStringFromPrefix(v42);
              if (v44)
              {
                v45 = (NEIPv6Route *)v44;
                v46 = -[NEIPv4Route initWithDestinationAddress:subnetMask:]([NEIPv4Route alloc], "initWithDestinationAddress:subnetMask:", v39, v44);
                -[NEIPv4Route setGatewayAddress:](v46, "setGatewayAddress:", v63);
                objc_msgSend(v62, "addObject:", v46);

LABEL_47:
                v29 = v58;

                ++v12;
                v59 = v39;
                v61 = v41;
                goto LABEL_48;
              }
            }
          }
          v59 = v39;
          v61 = v41;
        }
        else
        {
          v26 = v35;
        }
        v29 = v58;
      }
      else
      {

      }
LABEL_48:
      if (v28 == ++v30)
      {
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
        if (v28)
          goto LABEL_24;
        goto LABEL_52;
      }
    }
  }
  v59 = 0;
  v61 = 0;
LABEL_52:

  v49 = v62;
  if (v12)
    v50 = v62;
  else
    v50 = 0;
  v51 = v50;
  v39 = v59;
  v41 = v61;
LABEL_59:

  return v51;
}

+ (NEIKEv2IKESAProposal)createIKESAProposalFromProtocol:(void *)a3 saParameters:(void *)a4 options:(unsigned int *)a5 nonceSize:
{
  id v8;
  id v9;
  id v10;
  NEIKEv2IKESAProposal *v11;
  NEIKEv2EncryptionProtocol *v12;
  uint64_t v13;
  NEIKEv2EncryptionProtocol *v14;
  uint64_t v15;
  NEIKEv2EncryptionProtocol *v16;
  int v17;
  NEIKEv2EncryptionProtocol *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NEIKEv2IntegrityProtocol *v23;
  NEIKEv2PRFProtocol *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  NEIKEv2KEMProtocol *v28;
  void *v29;
  SEL v30;
  void *v31;
  id v32;
  SEL v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  NEIKEv2KEMProtocol *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  NEIKEv2EAPProtocol *v47;
  void *v48;
  NEIKEv2EAPProtocol *v49;
  NEIKEv2EAPProtocol *v50;
  void *v51;
  NEIKEv2EAPProtocol *v52;
  NEIKEv2IKESAProposal *v53;
  NSObject *v55;
  NEIKEv2KEMProtocol *v56;
  NEIKEv2IKESAProposal *v57;
  id v58;
  id v59;
  NEIKEv2PRFProtocol *v60;
  NEIKEv2IntegrityProtocol *v61;
  NEIKEv2EncryptionProtocol *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  NEIKEv2KEMProtocol *v67;
  _BYTE v68[128];
  NEIKEv2KEMProtocol *v69;
  NEIKEv2IntegrityProtocol *v70;
  NEIKEv2PRFProtocol *v71;
  NEIKEv2EncryptionProtocol *v72;
  uint8_t buf[4];
  const char *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_opt_self();
  if (v9)
  {
    v11 = objc_alloc_init(NEIKEv2IKESAProposal);
    -[NEIKEv2IKESAProposal setLifetimeSeconds:](v11, "setLifetimeSeconds:", (int)(60 * objc_msgSend(v9, "lifetimeMinutes")));
    switch(objc_msgSend(v9, "encryptionAlgorithm"))
    {
      case 1:
        v12 = [NEIKEv2EncryptionProtocol alloc];
        v13 = 2;
        goto LABEL_6;
      case 2:
        v12 = [NEIKEv2EncryptionProtocol alloc];
        v13 = 3;
LABEL_6:
        v16 = (NEIKEv2EncryptionProtocol *)-[NEIKEv2EncryptionProtocol initWithEncryptionWireType:is256Bit:](v12, v13, 0);
        goto LABEL_9;
      case 3:
        v14 = [NEIKEv2EncryptionProtocol alloc];
        v15 = 2;
        goto LABEL_8;
      case 5:
        v18 = [NEIKEv2EncryptionProtocol alloc];
        v19 = 4;
        goto LABEL_13;
      case 6:
        v18 = [NEIKEv2EncryptionProtocol alloc];
        v19 = 5;
        goto LABEL_13;
      case 7:
        v18 = [NEIKEv2EncryptionProtocol alloc];
        v19 = 6;
LABEL_13:
        v16 = -[NEIKEv2EncryptionProtocol initWithEncryptionType:](v18, "initWithEncryptionType:", v19);
        v17 = 0;
        break;
      default:
        v14 = [NEIKEv2EncryptionProtocol alloc];
        v15 = 3;
LABEL_8:
        v16 = -[NEIKEv2EncryptionProtocol initWithEncryptionType:](v14, "initWithEncryptionType:", v15);
LABEL_9:
        v17 = 1;
        break;
    }
    v62 = v16;
    v72 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEIKEv2IKESAProposal setEncryptionProtocols:](v11, "setEncryptionProtocols:", v20);

    switch(objc_msgSend(v9, "integrityAlgorithm"))
    {
      case 1:
        v21 = 2;
        if ((v17 & 1) == 0)
          goto LABEL_26;
        v22 = 2;
        goto LABEL_25;
      case 2:
        v21 = 2;
        if ((v17 & 1) == 0)
          goto LABEL_26;
        v22 = 7;
        goto LABEL_25;
      case 4:
        v21 = 6;
        if ((v17 & 1) == 0)
          goto LABEL_26;
        v22 = 13;
        goto LABEL_25;
      case 5:
        v21 = 7;
        if ((v17 & 1) == 0)
          goto LABEL_26;
        v22 = 14;
        goto LABEL_25;
      default:
        v21 = 5;
        if (v17)
        {
          v22 = 12;
LABEL_25:
          v23 = -[NEIKEv2IntegrityProtocol initWithType:]([NEIKEv2IntegrityProtocol alloc], "initWithType:", v22);
        }
        else
        {
LABEL_26:
          v23 = 0;
        }
        v24 = -[NEIKEv2PRFProtocol initWithType:]([NEIKEv2PRFProtocol alloc], "initWithType:", v21);
        v71 = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2IKESAProposal setPrfProtocols:](v11, "setPrfProtocols:", v25);

        v60 = v24;
        v26 = -[NEIKEv2PRFProtocol nonceSize](v24, "nonceSize");
        if (v17)
        {
          v70 = v23;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEIKEv2IKESAProposal setIntegrityProtocols:](v11, "setIntegrityProtocols:", v27);

        }
        v61 = v23;
        if (a5 && v26 > *a5)
          *a5 = v26;
        v28 = -[NEIKEv2KEMProtocol initWithMethod:]([NEIKEv2KEMProtocol alloc], "initWithMethod:", objc_msgSend(v9, "diffieHellmanGroup"));
        v69 = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2IKESAProposal setKemProtocols:](v11, "setKemProtocols:", v29);

        objc_getProperty(v9, v30, 40, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v56 = v28;
          v57 = v11;
          v59 = v8;
          v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v58 = v9;
          objc_getProperty(v9, v33, 40, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v64;
            v38 = 6;
            do
            {
              for (i = 0; i != v36; ++i)
              {
                if (*(_QWORD *)v64 != v37)
                  objc_enumerationMutation(v34);
                v40 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
                if (objc_msgSend(v40, "integerValue", v56))
                {
                  v41 = -[NEIKEv2KEMProtocol initWithMethod:]([NEIKEv2KEMProtocol alloc], "initWithMethod:", objc_msgSend(v40, "integerValue"));
                  v67 = v41;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v38 + i);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "setObject:forKeyedSubscript:", v42, v43);

                }
              }
              v38 += i;
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
            }
            while (v36);
          }

          v11 = v57;
          if (objc_msgSend(v32, "count"))
          {
            v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v32);
            -[NEIKEv2IKESAProposal setAdditionalKEMProtocols:](v57, "setAdditionalKEMProtocols:", v44);

          }
          v9 = v58;
          v8 = v59;
          v28 = v56;
        }
        v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (!objc_msgSend(v8, "useExtendedAuthentication"))
        {
          v47 = -[NEIKEv2EAPProtocol initWithMethod:]([NEIKEv2EAPProtocol alloc], "initWithMethod:", 0);
          objc_msgSend(v45, "addObject:", v47);
LABEL_57:

          -[NEIKEv2IKESAProposal setEapProtocols:](v11, "setEapProtocols:", v45);
          v53 = v11;
          goto LABEL_58;
        }
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AccountName"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AccountName"));
        else
          objc_msgSend(v8, "username");
        v47 = (NEIKEv2EAPProtocol *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          objc_msgSend(v8, "identityReferenceInternal");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (v48)
          {
            v49 = -[NEIKEv2EAPProtocol initWithMethod:]([NEIKEv2EAPProtocol alloc], "initWithMethod:", 7);
            objc_msgSend(v45, "addObject:", v49);

          }
          v50 = -[NEIKEv2EAPProtocol initWithMethod:]([NEIKEv2EAPProtocol alloc], "initWithMethod:", 4);
          objc_msgSend(v45, "addObject:", v50);

        }
        objc_msgSend(v8, "identityReferenceInternal", v56);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          v52 = -[NEIKEv2EAPProtocol initWithMethod:]([NEIKEv2EAPProtocol alloc], "initWithMethod:", 6);
          objc_msgSend(v45, "addObject:", v52);

        }
        if (objc_msgSend(v45, "count"))
          goto LABEL_57;
        ne_log_obj();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19BD16000, v55, OS_LOG_TYPE_ERROR, "missing eap protocol", buf, 2u);
        }

        v53 = 0;
LABEL_58:

        break;
    }
  }
  else
  {
    ne_log_obj();
    v11 = (NEIKEv2IKESAProposal *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v74 = "+[NEIKEv2Helper createIKESAProposalFromProtocol:saParameters:options:nonceSize:]";
      _os_log_fault_impl(&dword_19BD16000, &v11->super, OS_LOG_TYPE_FAULT, "%s called with null saParameters", buf, 0xCu);
    }
    v53 = 0;
  }

  return v53;
}

+ (NEIKEv2ChildSAProposal)createIKEv2ChildSAProposalFromProtocol:(void *)a3 saParameters:
{
  id v4;
  id v5;
  NEIKEv2ChildSAProposal *v6;
  NEIKEv2EncryptionProtocol *v7;
  uint64_t v8;
  NEIKEv2EncryptionProtocol *v9;
  NEIKEv2EncryptionProtocol *v10;
  uint64_t v11;
  NSObject *p_super;
  int v13;
  NEIKEv2EncryptionProtocol *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NEIKEv2IntegrityProtocol *v19;
  void *v20;
  NEIKEv2KEMProtocol *v21;
  void *v22;
  SEL v23;
  void *v24;
  id v25;
  SEL v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  NEIKEv2KEMProtocol *v34;
  void *v35;
  void *v36;
  void *v37;
  NEIKEv2KEMProtocol *v39;
  NSObject *v40;
  NEIKEv2ChildSAProposal *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  NEIKEv2KEMProtocol *v47;
  _BYTE v48[128];
  NEIKEv2KEMProtocol *v49;
  NEIKEv2IntegrityProtocol *v50;
  NSObject *v51;
  uint8_t buf[4];
  const char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (v5)
  {
    v6 = objc_alloc_init(NEIKEv2ChildSAProposal);
    -[NEIKEv2ChildSAProposal setProtocol:](v6, "setProtocol:", 3);
    -[NEIKEv2ChildSAProposal setLifetimeSeconds:](v6, "setLifetimeSeconds:", (int)(60 * objc_msgSend(v5, "lifetimeMinutes")));
    switch(objc_msgSend(v5, "encryptionAlgorithm"))
    {
      case 1:
        v7 = [NEIKEv2EncryptionProtocol alloc];
        v8 = 2;
        goto LABEL_5;
      case 2:
        v7 = [NEIKEv2EncryptionProtocol alloc];
        v8 = 3;
LABEL_5:
        v9 = (NEIKEv2EncryptionProtocol *)-[NEIKEv2EncryptionProtocol initWithEncryptionWireType:is256Bit:](v7, v8, 0);
        goto LABEL_9;
      case 3:
        v10 = [NEIKEv2EncryptionProtocol alloc];
        v11 = 2;
        goto LABEL_8;
      case 5:
        v14 = [NEIKEv2EncryptionProtocol alloc];
        v15 = 4;
        goto LABEL_13;
      case 6:
        v14 = [NEIKEv2EncryptionProtocol alloc];
        v15 = 5;
        goto LABEL_13;
      case 7:
        v14 = [NEIKEv2EncryptionProtocol alloc];
        v15 = 6;
LABEL_13:
        p_super = -[NEIKEv2EncryptionProtocol initWithEncryptionType:](v14, "initWithEncryptionType:", v15);
        v13 = 0;
        break;
      default:
        v10 = [NEIKEv2EncryptionProtocol alloc];
        v11 = 3;
LABEL_8:
        v9 = -[NEIKEv2EncryptionProtocol initWithEncryptionType:](v10, "initWithEncryptionType:", v11);
LABEL_9:
        p_super = &v9->super;
        v13 = 1;
        break;
    }
    v51 = p_super;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEIKEv2ChildSAProposal setEncryptionProtocols:](v6, "setEncryptionProtocols:", v16);

    if (v13)
    {
      v17 = objc_msgSend(v5, "integrityAlgorithm");
      if ((unint64_t)(v17 - 1) > 4)
        v18 = 12;
      else
        v18 = qword_19BED7140[v17 - 1];
      v19 = -[NEIKEv2IntegrityProtocol initWithType:]([NEIKEv2IntegrityProtocol alloc], "initWithType:", v18);
      v50 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEIKEv2ChildSAProposal setIntegrityProtocols:](v6, "setIntegrityProtocols:", v20);

    }
    if (objc_msgSend(v4, "enablePFS"))
    {
      v21 = -[NEIKEv2KEMProtocol initWithMethod:]([NEIKEv2KEMProtocol alloc], "initWithMethod:", objc_msgSend(v5, "diffieHellmanGroup"));
      v49 = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEIKEv2ChildSAProposal setKemProtocols:](v6, "setKemProtocols:", v22);

      objc_getProperty(v5, v23, 40, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v39 = v21;
        v40 = p_super;
        v41 = v6;
        v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v42 = v5;
        objc_getProperty(v5, v26, 40, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v44;
          v31 = 6;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v44 != v30)
                objc_enumerationMutation(v27);
              v33 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
              if (objc_msgSend(v33, "unsignedIntegerValue"))
              {
                v34 = -[NEIKEv2KEMProtocol initWithMethod:]([NEIKEv2KEMProtocol alloc], "initWithMethod:", objc_msgSend(v33, "unsignedIntegerValue"));
                v47 = v34;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31 + i);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "setObject:forKeyedSubscript:", v35, v36);

              }
            }
            v31 += i;
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
          }
          while (v29);
        }

        v6 = v41;
        if (objc_msgSend(v25, "count"))
        {
          v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v25);
          -[NEIKEv2ChildSAProposal setAdditionalKEMProtocols:](v41, "setAdditionalKEMProtocols:", v37);

        }
        v5 = v42;
        v21 = v39;
        p_super = v40;
      }

    }
  }
  else
  {
    ne_log_obj();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "+[NEIKEv2Helper createIKEv2ChildSAProposalFromProtocol:saParameters:]";
      _os_log_fault_impl(&dword_19BD16000, p_super, OS_LOG_TYPE_FAULT, "%s called with null saParameters", buf, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

@end
