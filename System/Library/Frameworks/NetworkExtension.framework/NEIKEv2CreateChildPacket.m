@implementation NEIKEv2CreateChildPacket

+ (NSObject)createRekeyRequestChildSA:(uint64_t)a1
{
  _BYTE *v2;
  const char *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  id Property;
  const char *v8;
  void *v9;
  id v10;
  NEIKEv2NotifyPayload *v11;
  const char *v12;
  NSObject *p_super;
  const char *v14;
  id v15;
  uint64_t v16;
  NEIKEv2ChildSAPayload *v17;
  SEL v18;
  SEL v19;
  id v20;
  SEL v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  NEIKEv2KeyExchangePayload *v27;
  SEL v28;
  const char *v29;
  void *v30;
  SEL v31;
  void *v32;
  const char *v33;
  void *v34;
  SEL v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  SEL v40;
  void *v41;
  const char *v42;
  void *v43;
  SEL v44;
  void *v45;
  char v46;
  void *v47;
  char v48;
  NEIKEv2NoncePayload *v49;
  SEL v50;
  SEL v51;
  void *v52;
  SEL v53;
  void *v54;
  const char *v55;
  void *v56;
  SEL v57;
  void *v58;
  char v59;
  NEIKEv2InitiatorTrafficSelectorPayload *v60;
  SEL v61;
  const char *v62;
  void *v63;
  SEL v64;
  void *v65;
  const char *v66;
  void *v67;
  SEL v68;
  void *v69;
  char v70;
  NEIKEv2ResponderTrafficSelectorPayload *v71;
  SEL v72;
  const char *v73;
  void *v74;
  SEL v75;
  void *v76;
  const char *v77;
  void *v78;
  SEL v79;
  void *v80;
  char v81;
  NSObject *v82;
  NSObject *v83;
  const char *v84;
  NSObject *v85;
  uint32_t v86;
  const char *v87;
  NSObject *v89;
  int v90;
  const char *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (!v2)
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      goto LABEL_34;
    v90 = 136315138;
    v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
    v87 = "%s called with null childSA";
    goto LABEL_49;
  }
  v4 = objc_getProperty(v2, v3, 176, 1);

  if (v4)
  {
    v6 = -[NEIKEv2Packet initOutbound]([NEIKEv2CreateChildPacket alloc]);
    if (!v6)
    {
      ne_log_obj();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v90) = 0;
        _os_log_fault_impl(&dword_19BD16000, p_super, OS_LOG_TYPE_FAULT, "[[NEIKEv2CreateChildPacket alloc] initOutbound:] failed", (uint8_t *)&v90, 2u);
      }
      goto LABEL_57;
    }
    Property = objc_getProperty(v2, v5, 56, 1);
    v9 = Property;
    if (Property)
      Property = objc_getProperty(Property, v8, 80, 1);
    v10 = Property;
    objc_opt_self();
    if (v10)
    {
      v11 = objc_alloc_init(NEIKEv2NotifyPayload);
      p_super = &v11->super.super;
      if (v11)
      {
        v11->_notifyType = 16393;
        objc_setProperty_atomic(v11, v12, v10, 40);
      }
    }
    else
    {
      ne_log_obj();
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_FAULT))
      {
        v90 = 136315138;
        v91 = "+[NEIKEv2NotifyPayload createNotifyPayloadType:spi:]";
        _os_log_fault_impl(&dword_19BD16000, v89, OS_LOG_TYPE_FAULT, "%s called with null spi", (uint8_t *)&v90, 0xCu);
      }

      p_super = 0;
    }

    if (-[NEIKEv2Packet addNotifyPayload:](v6, p_super))
    {
      v15 = objc_getProperty(v2, v14, 48, 1);
      v16 = objc_msgSend(v15, "mode");

      if (v16 != 1 || -[NEIKEv2Packet addNotification:data:](v6, 0x4007uLL, 0))
      {
        v17 = objc_alloc_init(NEIKEv2ChildSAPayload);
        objc_setProperty_atomic(v6, v18, v17, 96);

        v20 = objc_getProperty(v2, v19, 176, 1);
        objc_getProperty(v6, v21, 96, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v22;
        if (v22)
          objc_setProperty_atomic(v22, v23, v20, 24);

        if (!-[NEIKEv2ChildSA shouldGenerateNewDHKeys](v2, v25))
          goto LABEL_22;
        v27 = objc_alloc_init(NEIKEv2KeyExchangePayload);
        objc_setProperty_atomic(v6, v28, v27, 104);

        -[NEIKEv2ChildSA preferredKEMProtocol](v2, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_getProperty(v6, v31, 104, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v32;
        if (v32)
          objc_setProperty_atomic(v32, v33, v30, 24);

        v36 = objc_getProperty(v2, v35, 112, 1);
        v37 = v36;
        if (v36)
          v38 = (void *)*((_QWORD *)v36 + 2);
        else
          v38 = 0;
        v39 = v38;
        objc_getProperty(v6, v40, 104, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v41;
        if (v41)
          objc_setProperty_atomic(v41, v42, v39, 32);

        objc_getProperty(v6, v44, 104, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = -[NEIKEv2Payload isValid]((uint64_t)v45);

        if ((v46 & 1) == 0)
        {
          ne_log_obj();
          v83 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
            goto LABEL_56;
          v90 = 136315138;
          v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
          v84 = "%s called with null packet.ke.isValid";
        }
        else
        {
LABEL_22:
          objc_getProperty(v6, v26, 96, 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = -[NEIKEv2Payload isValid]((uint64_t)v47);

          if ((v48 & 1) != 0)
          {
            v49 = objc_alloc_init(NEIKEv2NoncePayload);
            objc_setProperty_atomic(v6, v50, v49, 112);

            objc_getProperty(v2, v51, 80, 1);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_getProperty(v6, v53, 112, 1);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v54;
            if (v54)
              objc_setProperty_atomic(v54, v55, v52, 24);

            objc_getProperty(v6, v57, 112, 1);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = -[NEIKEv2Payload isValid]((uint64_t)v58);

            if ((v59 & 1) != 0)
            {
              v60 = objc_alloc_init(NEIKEv2InitiatorTrafficSelectorPayload);
              objc_setProperty_atomic(v6, v61, v60, 128);

              -[NEIKEv2ChildSA initiatorTrafficSelectors](v2, v62);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_getProperty(v6, v64, 128, 1);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = v65;
              if (v65)
                objc_setProperty_atomic(v65, v66, v63, 24);

              objc_getProperty(v6, v68, 128, 1);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = -[NEIKEv2Payload isValid]((uint64_t)v69);

              if ((v70 & 1) != 0)
              {
                v71 = objc_alloc_init(NEIKEv2ResponderTrafficSelectorPayload);
                objc_setProperty_atomic(v6, v72, v71, 136);

                -[NEIKEv2ChildSA responderTrafficSelectors](v2, v73);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_getProperty(v6, v75, 136, 1);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = v76;
                if (v76)
                  objc_setProperty_atomic(v76, v77, v74, 24);

                objc_getProperty(v6, v79, 136, 1);
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v81 = -[NEIKEv2Payload isValid]((uint64_t)v80);

                if ((v81 & 1) != 0)
                {
                  v82 = v6;
LABEL_58:

                  goto LABEL_59;
                }
                ne_log_obj();
                v83 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
                  goto LABEL_56;
                v90 = 136315138;
                v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
                v84 = "%s called with null packet.tsr.isValid";
                goto LABEL_54;
              }
              ne_log_obj();
              v83 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
              {
                v90 = 136315138;
                v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
                v84 = "%s called with null packet.tsi.isValid";
                goto LABEL_54;
              }
LABEL_56:

LABEL_57:
              v82 = 0;
              goto LABEL_58;
            }
            ne_log_obj();
            v83 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
              goto LABEL_56;
            v90 = 136315138;
            v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
            v84 = "%s called with null packet.nonce.isValid";
          }
          else
          {
            ne_log_obj();
            v83 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
              goto LABEL_56;
            v90 = 136315138;
            v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
            v84 = "%s called with null packet.childSA.isValid";
          }
        }
LABEL_54:
        v85 = v83;
        v86 = 12;
        goto LABEL_55;
      }
      ne_log_obj();
      v83 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
        goto LABEL_56;
      LOWORD(v90) = 0;
      v84 = "[packet addNotification:NEIKEv2NotifyTypeUseTransportMode] failed";
    }
    else
    {
      ne_log_obj();
      v83 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
        goto LABEL_56;
      LOWORD(v90) = 0;
      v84 = "[packet addNotification:NEIKEv2NotifyTypeRekeySA] failed";
    }
    v85 = v83;
    v86 = 2;
LABEL_55:
    _os_log_fault_impl(&dword_19BD16000, v85, OS_LOG_TYPE_FAULT, v84, (uint8_t *)&v90, v86);
    goto LABEL_56;
  }
  ne_log_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    v90 = 136315138;
    v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
    v87 = "%s called with null childSA.rekeyRequestProposals";
LABEL_49:
    _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, v87, (uint8_t *)&v90, 0xCu);
  }
LABEL_34:
  v82 = 0;
LABEL_59:

  return v82;
}

- (uint64_t)validateRekeyResponseChildSA:(uint64_t)a1
{
  id *v3;
  const char *v4;
  id *v5;
  const char *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  id v13;
  char v14;
  const char *v15;
  char *v16;
  void *Property;
  const char *v18;
  void *v19;
  uint64_t v20;
  SEL v21;
  const char *v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  NSObject *v27;
  char *v28;
  const char *v29;
  NSObject *v30;
  const char *v31;
  char *v32;
  NEIKEv2KEMProtocol *v33;
  NEIKEv2KEMProtocol *v34;
  SEL v35;
  unsigned int v36;
  NSObject *v37;
  SEL v38;
  SEL v39;
  id v40;
  const char *v41;
  int *v42;
  SEL v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  id v49;
  NSObject *WeakRetained;
  const char *v51;
  NSObject *v52;
  NSObject *v53;
  int v54;
  const char *v55;
  void *v56;
  const char *v57;
  void *v58;
  id v59;
  uint64_t v60;
  const char *v61;
  NSObject *v62;
  char *v63;
  const char *v64;
  NSObject *v65;
  uint32_t v66;
  uint64_t v67;
  char *v68;
  int v69;
  const char *v70;
  NSObject *v71;
  uint32_t v72;
  char *v73;
  __CFString *v74;
  char *v75;
  int v76;
  id v77;
  id v78;
  const char *v79;
  void *v80;
  unsigned int v81;
  const char *v82;
  id v83;
  id v84;
  const char *v85;
  void *v86;
  void *v87;
  const char *v88;
  void *v89;
  id v90;
  SEL v91;
  SEL v92;
  id v93;
  const char *v94;
  void *v95;
  uint64_t v96;
  const char *v97;
  void *v98;
  const char *v99;
  void *v100;
  const char *v101;
  void *v102;
  id v103;
  const char *v104;
  void *v105;
  const char *v106;
  void *v107;
  id v108;
  const char *v109;
  void *v110;
  const char *v111;
  SEL v112;
  id v113;
  const char *v114;
  void *v115;
  uint64_t v116;
  const char *v117;
  void *v118;
  const char *v119;
  void *v120;
  id v121;
  SEL v122;
  _QWORD *v123;
  SEL v124;
  const char *v125;
  void *v126;
  const char *v127;
  void *v128;
  id v129;
  const char *v130;
  void *v131;
  const char *v132;
  void *v133;
  const char *v134;
  void *v135;
  id v136;
  const char *v137;
  void *v138;
  SEL v140;
  void *v141;
  const char *v142;
  SEL v143;
  id v144;
  const char *v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  id v149;
  id v150;
  uint64_t v151;
  char *v152;
  id self;
  id selfa;
  id selfb;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  uint8_t buf[4];
  const char *v161;
  __int16 v162;
  uint64_t v163;
  __int16 v164;
  uint64_t v165;
  _BYTE v166[128];
  uint64_t v167;

  v167 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = v3;
  if (a1)
  {
    if (!v3)
    {
      ne_log_obj();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v161 = "-[NEIKEv2CreateChildPacket(Exchange) validateRekeyResponseChildSA:]";
        _os_log_fault_impl(&dword_19BD16000, v7, OS_LOG_TYPE_FAULT, "%s called with null childSA", buf, 0xCu);
      }
LABEL_35:
      a1 = 0;
LABEL_122:

      goto LABEL_123;
    }
    if (-[NEIKEv2Packet hasErrors]((void *)a1, v4))
    {
      v158 = 0u;
      v159 = 0u;
      v156 = 0u;
      v157 = 0u;
      v7 = objc_getProperty((id)a1, v6, 64, 1);
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v156, v166, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v157;
LABEL_6:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v157 != v10)
            objc_enumerationMutation(v7);
          v12 = *(__CFString **)(*((_QWORD *)&v156 + 1) + 8 * v11);
          if (v12)
          {
            if ((unint64_t)(v12->length - 1) <= 0x3FFE)
              break;
          }
          if (v9 == ++v11)
          {
            v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v156, v166, 16);
            if (v9)
              goto LABEL_6;
            goto LABEL_13;
          }
        }
        ne_log_obj();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v73 = (char *)objc_msgSend((id)a1, "copyShortDescription");
          v74 = (__CFString *)-[NEIKEv2NotifyPayload copyError](v12);
          *(_DWORD *)buf = 138412546;
          v161 = v73;
          v162 = 2112;
          v163 = (uint64_t)v74;
          _os_log_error_impl(&dword_19BD16000, v30, OS_LOG_TYPE_ERROR, "%@ Rekey child received notify error %@", buf, 0x16u);

        }
        if (v12->length == 17)
        {
          v32 = (char *)objc_getProperty(v12, v31, 32, 1);
          v16 = v32;
          if (v32)
          {
            *(_WORD *)buf = 0;
            objc_msgSend(v32, "getBytes:length:", buf, 2);
            v33 = [NEIKEv2KEMProtocol alloc];
            v34 = -[NEIKEv2KEMProtocol initWithMethod:](v33, "initWithMethod:", bswap32(*(unsigned __int16 *)buf) >> 16);
            objc_setProperty_atomic(v5, v35, v34, 96);

          }
          goto LABEL_34;
        }
        goto LABEL_35;
      }
LABEL_13:

    }
    v13 = objc_getProperty(v5, v6, 48, 1);
    if (objc_msgSend(v13, "mode") == 1)
    {
      v14 = -[NEIKEv2Packet hasNotification:]((void *)a1, (const char *)0x4007);

      if ((v14 & 1) == 0)
      {
        ne_log_obj();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v16 = (char *)objc_msgSend((id)a1, "copyShortDescription");
          *(_DWORD *)buf = 138412290;
          v161 = v16;
          _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "%@ Transport mode Child SA was not accepted", buf, 0xCu);
LABEL_34:

        }
        goto LABEL_35;
      }
    }
    else
    {

    }
    objc_getProperty((id)a1, v15, 96, 1);
    Property = (void *)objc_claimAutoreleasedReturnValue();
    v19 = Property;
    if (Property)
      Property = objc_getProperty(Property, v18, 24, 1);
    v7 = Property;

    if (-[NSObject count](v7, "count") != 1)
    {
      ne_log_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
      {
        v75 = (char *)objc_msgSend((id)a1, "copyShortDescription");
        v76 = -[NSObject count](v7, "count");
        *(_DWORD *)buf = 138412546;
        v161 = v75;
        v162 = 1024;
        LODWORD(v163) = v76;
        _os_log_error_impl(&dword_19BD16000, (os_log_t)v20, OS_LOG_TYPE_ERROR, "%@ Received %u child SA proposals, require 1", buf, 0x12u);

      }
      a1 = 0;
      goto LABEL_121;
    }
    -[NSObject firstObject](v7, "firstObject");
    v20 = objc_claimAutoreleasedReturnValue();
    v23 = objc_getProperty(v5, v21, 176, 1);
    if (v20)
      v24 = objc_getProperty((id)v20, v22, 80, 1);
    else
      v24 = 0;
    v25 = v24;

    if (!v25)
    {
      ne_log_obj();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = (char *)objc_msgSend((id)a1, "copyShortDescription");
        *(_DWORD *)buf = 138412290;
        v161 = v28;
        v29 = "%@ Child SA proposal missing SPI";
        goto LABEL_69;
      }
LABEL_40:
      a1 = 0;
LABEL_120:

LABEL_121:
      goto LABEL_122;
    }
    if (v20)
    {
      v26 = *(unsigned __int8 *)(v20 + 8);
      if (objc_msgSend(v23, "count") < v26)
      {
        ne_log_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = (char *)objc_msgSend((id)a1, "copyShortDescription");
          *(_DWORD *)buf = 138412290;
          v161 = v28;
          v29 = "%@ Child SA proposal out of range";
LABEL_69:
          _os_log_error_impl(&dword_19BD16000, v27, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);

          goto LABEL_40;
        }
        goto LABEL_40;
      }
      v36 = *(unsigned __int8 *)(v20 + 8);
    }
    else
    {
      objc_msgSend(v23, "count");
      v36 = 0;
    }
    objc_msgSend(v23, "objectAtIndexedSubscript:", v36 - 1);
    v27 = objc_claimAutoreleasedReturnValue();
    if ((-[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:](v20, v27, 0, 1) & 1) != 0)
    {
      v37 = -[NEIKEv2ChildSAProposal copyFromRemote:preferRemoteProposal:checkKEMethod:](v27, (void *)v20, 0, 1);
      objc_setProperty_atomic(v5, v38, v37, 56);

      v40 = objc_getProperty(v5, v39, 56, 1);
      if (v40)
      {
        objc_setProperty_atomic(v5, v41, 0, 176);
        *((_BYTE *)v5 + 9) = 1;
        v42 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
        objc_getProperty((id)a1, v43, 112, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          objc_getProperty((id)a1, v45, 112, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v46;
          if (v46)
            v46 = objc_getProperty(v46, v47, 24, 1);
          v49 = v46;

          if (v49)
          {
            WeakRetained = objc_loadWeakRetained(v5 + 3);
            v52 = WeakRetained;
            if (WeakRetained)
              WeakRetained = objc_getProperty(WeakRetained, v51, 80, 1);
            v53 = WeakRetained;
            v54 = -[NSObject strictNonceSizeChecks](v53, "strictNonceSizeChecks");

            if (v54)
            {
              objc_getProperty((id)a1, v55, 112, 1);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = v56;
              if (v56)
                v56 = objc_getProperty(v56, v57, 24, 1);
              v59 = v56;
              v60 = objc_msgSend(v59, "length");

              if ((unint64_t)(v60 - 257) <= 0xFFFFFFFFFFFFFF0ELL)
              {
                ne_log_obj();
                v62 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  v63 = (char *)objc_msgSend((id)a1, "copyShortDescription");
                  *(_DWORD *)buf = 138412546;
                  v161 = v63;
                  v162 = 2048;
                  v163 = v60;
                  v64 = "%@ NONCE data length %zu is out of bounds";
                  v65 = v62;
                  v66 = 22;
LABEL_112:
                  _os_log_error_impl(&dword_19BD16000, v65, OS_LOG_TYPE_ERROR, v64, buf, v66);
LABEL_113:

                }
LABEL_117:

                goto LABEL_118;
              }
              self = (id)v60;
              if (v52)
                v77 = objc_getProperty(v52, v61, 96, 1);
              else
                v77 = 0;
              v78 = v77;
              -[NEIKEv2IKESAProposal prfProtocol](v78, v79);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v81 = objc_msgSend(v80, "nonceSize");

              v42 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
              if ((unint64_t)self < v81)
              {
                ne_log_obj();
                v62 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  v63 = (char *)objc_msgSend((id)a1, "copyShortDescription");
                  if (v52)
                    v83 = objc_getProperty(v52, v82, 96, 1);
                  else
                    v83 = 0;
                  v84 = v83;
                  -[NEIKEv2IKESAProposal prfProtocol](v84, v85);
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v161 = v63;
                  v162 = 2048;
                  v163 = (uint64_t)self;
                  v164 = 2112;
                  v165 = (uint64_t)v86;
                  _os_log_error_impl(&dword_19BD16000, v62, OS_LOG_TYPE_ERROR, "%@ NONCE data length %zu is shorter than the minimum for PRF protocol %@", buf, 0x20u);

                  goto LABEL_113;
                }
                goto LABEL_117;
              }
            }
            objc_getProperty((id)a1, v55, v42[289], 1);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v87;
            if (v87)
              v87 = objc_getProperty(v87, v88, 24, 1);
            v90 = v87;
            objc_setProperty_atomic(v5, v91, v90, 88);

            v93 = objc_getProperty(v5, v92, 56, 1);
            -[NEIKEv2IKESAProposal kemProtocol](v93, v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v96 = objc_msgSend(v95, "method");

            if (v96)
            {
              objc_getProperty((id)a1, v97, 104, 1);
              v98 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v98)
              {
                ne_log_obj();
                v62 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                  goto LABEL_117;
                v63 = (char *)objc_msgSend((id)a1, "copyShortDescription");
                *(_DWORD *)buf = 138412290;
                v161 = v63;
                v64 = "%@ Did not receive KE payload";
LABEL_111:
                v65 = v62;
                v66 = 12;
                goto LABEL_112;
              }
              objc_getProperty((id)a1, v99, 104, 1);
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              v102 = v100;
              if (v100)
                v100 = objc_getProperty(v100, v101, 24, 1);
              v103 = v100;

              if (!v103)
              {
                ne_log_obj();
                v62 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                  goto LABEL_117;
                v63 = (char *)objc_msgSend((id)a1, "copyShortDescription");
                *(_DWORD *)buf = 138412290;
                v161 = v63;
                v64 = "%@ Did not receive method in KE payload";
                goto LABEL_111;
              }
              objc_getProperty((id)a1, v104, 104, 1);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              v107 = v105;
              if (v105)
                v105 = objc_getProperty(v105, v106, 32, 1);
              v108 = v105;

              if (!v108)
              {
                ne_log_obj();
                v62 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                  goto LABEL_117;
                v63 = (char *)objc_msgSend((id)a1, "copyShortDescription");
                *(_DWORD *)buf = 138412290;
                v161 = v63;
                v64 = "%@ Did not receive data in KE payload";
                goto LABEL_111;
              }
              objc_getProperty((id)a1, v109, 104, 1);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              selfa = v110;
              if (v110)
                v110 = objc_getProperty(v110, v111, 24, 1);
              v149 = v110;
              v151 = objc_msgSend(v149, "method");
              v113 = objc_getProperty(v5, v112, 56, 1);
              -[NEIKEv2IKESAProposal kemProtocol](v113, v114);
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              v116 = objc_msgSend(v115, "method");

              if (v151 != v116)
              {
                ne_log_obj();
                v62 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  v152 = (char *)objc_msgSend((id)a1, "copyShortDescription");
                  objc_getProperty((id)a1, v140, 104, 1);
                  v141 = (void *)objc_claimAutoreleasedReturnValue();
                  selfb = v141;
                  if (v141)
                    v141 = objc_getProperty(v141, v142, 24, 1);
                  v150 = v141;
                  v148 = objc_msgSend(v150, "method");
                  v144 = objc_getProperty(v5, v143, 56, 1);
                  -[NEIKEv2IKESAProposal kemProtocol](v144, v145);
                  v146 = (void *)objc_claimAutoreleasedReturnValue();
                  v147 = objc_msgSend(v146, "method");
                  *(_DWORD *)buf = 138412802;
                  v161 = v152;
                  v162 = 2048;
                  v163 = v148;
                  v164 = 2048;
                  v165 = v147;
                  _os_log_error_impl(&dword_19BD16000, v62, OS_LOG_TYPE_ERROR, "%@ Did not receive matching method from KE payload (%zu != %zu)", buf, 0x20u);

                }
                goto LABEL_117;
              }
              objc_getProperty((id)a1, v117, 104, 1);
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              v120 = v118;
              if (v118)
                v118 = objc_getProperty(v118, v119, 32, 1);
              v121 = v118;
              objc_setProperty_atomic(v5, v122, v121, 104);

              v123 = -[NEIKEv2Packet copyNotification:]((void *)a1, (const char *)0x4039);
              objc_setProperty_atomic(v5, v124, v123, 128);

            }
            else
            {
              objc_setProperty_atomic(v5, v97, 0, 112);
            }
            objc_getProperty((id)a1, v125, 128, 1);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            v128 = v126;
            if (v126)
              v126 = objc_getProperty(v126, v127, 24, 1);
            v129 = v126;
            -[NEIKEv2ChildSA setInitiatorTrafficSelectors:](v5, v129);

            -[NEIKEv2ChildSA initiatorTrafficSelectors](v5, v130);
            v131 = (void *)objc_claimAutoreleasedReturnValue();

            if (v131)
            {
              objc_getProperty((id)a1, v132, 136, 1);
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              v135 = v133;
              if (v133)
                v133 = objc_getProperty(v133, v134, 24, 1);
              v136 = v133;
              -[NEIKEv2ChildSA setResponderTrafficSelectors:](v5, v136);

              -[NEIKEv2ChildSA responderTrafficSelectors](v5, v137);
              v138 = (void *)objc_claimAutoreleasedReturnValue();

              if (v138)
              {
                a1 = 1;
LABEL_119:

                goto LABEL_120;
              }
              ne_log_obj();
              v62 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                goto LABEL_117;
              v63 = (char *)objc_msgSend((id)a1, "copyShortDescription");
              *(_DWORD *)buf = 138412290;
              v161 = v63;
              v64 = "%@ Could not set responder traffic selectors";
            }
            else
            {
              ne_log_obj();
              v62 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                goto LABEL_117;
              v63 = (char *)objc_msgSend((id)a1, "copyShortDescription");
              *(_DWORD *)buf = 138412290;
              v161 = v63;
              v64 = "%@ Could not set initiator traffic selectors";
            }
            goto LABEL_111;
          }
          ne_log_obj();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            v68 = (char *)objc_msgSend((id)a1, "copyShortDescription");
            *(_DWORD *)buf = 138412290;
            v161 = v68;
            v70 = "%@ Did not receive NONCE data";
            goto LABEL_66;
          }
LABEL_118:
          a1 = 0;
          goto LABEL_119;
        }
        ne_log_obj();
        v52 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          goto LABEL_118;
        v68 = (char *)objc_msgSend((id)a1, "copyShortDescription");
        *(_DWORD *)buf = 138412290;
        v161 = v68;
        v70 = "%@ Did not receive NONCE payload";
      }
      else
      {
        ne_log_obj();
        v52 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          goto LABEL_118;
        v68 = (char *)objc_msgSend((id)a1, "copyShortDescription");
        *(_DWORD *)buf = 138412290;
        v161 = v68;
        v70 = "%@ Could not set chosen proposal values";
      }
LABEL_66:
      v71 = v52;
      v72 = 12;
LABEL_67:
      _os_log_error_impl(&dword_19BD16000, v71, OS_LOG_TYPE_ERROR, v70, buf, v72);

      goto LABEL_118;
    }
    ne_log_obj();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v67 = objc_msgSend((id)a1, "copyShortDescription");
      v68 = (char *)v67;
      if (v20)
        v69 = *(unsigned __int8 *)(v20 + 8);
      else
        v69 = 0;
      *(_DWORD *)buf = 138412546;
      v161 = (const char *)v67;
      v162 = 1024;
      LODWORD(v163) = v69;
      v70 = "%@ SA proposal number %u does not match";
      v71 = v52;
      v72 = 18;
      goto LABEL_67;
    }
    goto LABEL_118;
  }
LABEL_123:

  return a1;
}

+ (id)createChildSAResponse:(unint64_t)a3 errorCode:(void *)a4 errorData:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v6 = a2;
  v7 = a4;
  objc_opt_self();
  v8 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2CreateChildPacket alloc], v6);
  if (!v8)
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19BD16000, v11, OS_LOG_TYPE_FAULT, "[[NEIKEv2CreateChildPacket alloc] initResponse:] failed", buf, 2u);
    }

    v9 = 0;
    goto LABEL_10;
  }
  v9 = v8;
  if (!-[NEIKEv2Packet addNotification:data:](v8, a3, v7))
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, "[packet addNotification:data:] failed", v14, 2u);
    }

LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v9 = v9;
  v10 = v9;
LABEL_11:

  return v10;
}

- (void)gatherPayloads
{
  NEIKEv2CreateChildPacket *v2;
  id v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  SEL v13;
  SEL v14;
  SEL v15;
  id v16;

  v2 = self;
  if (self)
    self = (NEIKEv2CreateChildPacket *)objc_getProperty(self, a2, 64, 1);
  v16 = (id)-[NEIKEv2CreateChildPacket mutableCopy](self, "mutableCopy");
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16393, v16, v3);
  if (v2)
  {
    if (objc_getProperty(v2, v4, 120, 1))
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v5, 120, 1));
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16387, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16391, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16394, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16395, v16, v3);
    if (objc_getProperty(v2, v6, 88, 1))
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v7, 88, 1));
    if (objc_getProperty(v2, v7, 96, 1))
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v8, 96, 1));
    if (objc_getProperty(v2, v8, 112, 1))
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v9, 112, 1));
    if (objc_getProperty(v2, v9, 104, 1))
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v10, 104, 1));
    if (objc_getProperty(v2, v10, 128, 1))
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v11, 128, 1));
    if (objc_getProperty(v2, v11, 136, 1))
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v12, 136, 1));
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16386, v16, v3);
    objc_msgSend(v3, "addObjectsFromArray:", objc_getProperty(v2, v13, 144, 1));
    objc_msgSend(v3, "addObjectsFromArray:", v16);
    objc_msgSend(v3, "addObjectsFromArray:", objc_getProperty(v2, v14, 56, 1));
    objc_setProperty_atomic(v2, v15, v3, 80);
  }
  else
  {
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0, 16387, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0, 16391, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0, 16394, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0, 16395, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0, 16386, v16, v3);
    objc_msgSend(v3, "addObjectsFromArray:", 0);
    objc_msgSend(v3, "addObjectsFromArray:", v16);
    objc_msgSend(v3, "addObjectsFromArray:", 0);
  }

}

- (void)filloutPayloads
{
  NEIKEv2CreateChildPacket *v2;
  NEIKEv2CreateChildPacket *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  ptrdiff_t v10;
  const char *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  NEIKEv2CreateChildPacket *v19;
  void *v20;
  ptrdiff_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  void *v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v2 = self;
  v31 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  if (self)
    self = (NEIKEv2CreateChildPacket *)objc_getProperty(self, a2, 80, 1);
  v3 = self;
  v4 = -[NEIKEv2CreateChildPacket countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_30;
          v10 = 88;
LABEL_29:
          objc_setProperty_atomic(v2, v9, v8, v10);
          goto LABEL_30;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_30;
          v10 = 96;
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_30;
          v10 = 104;
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_30;
          v10 = 112;
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_30;
          v10 = 120;
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_30;
          v10 = 128;
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_30;
          v10 = 136;
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v2 && objc_getProperty(v2, v11, 64, 1))
          {
            objc_msgSend(objc_getProperty(v2, v12, 64, 1), "arrayByAddingObject:", v8);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_45:
            v19 = v2;
            v20 = v14;
            v21 = 64;
            goto LABEL_50;
          }
          v29 = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1, (_QWORD)v23);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v2)
            goto LABEL_45;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v2 && objc_getProperty(v2, v15, 144, 1))
            {
              objc_msgSend(objc_getProperty(v2, v16, 144, 1), "arrayByAddingObject:", v8);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_47:
              v21 = 144;
              v19 = v2;
              v20 = v14;
              goto LABEL_50;
            }
            v28 = v8;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1, (_QWORD)v23);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v2)
              goto LABEL_47;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_30;
            if (v2 && objc_getProperty(v2, v17, 56, 1))
            {
              objc_msgSend(objc_getProperty(v2, v18, 56, 1), "arrayByAddingObject:", v8);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_49:
              v19 = v2;
              v20 = v14;
              v21 = 56;
LABEL_50:
              objc_setProperty_atomic(v19, v13, v20, v21);
              goto LABEL_51;
            }
            v27 = v8;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1, (_QWORD)v23);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v2)
              goto LABEL_49;
          }
        }
LABEL_51:

LABEL_30:
        ++v7;
      }
      while (v5 != v7);
      v22 = -[NEIKEv2CreateChildPacket countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      v5 = v22;
    }
    while (v22);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorIDs, 0);
  objc_storeStrong((id *)&self->_tsr, 0);
  objc_storeStrong((id *)&self->_tsi, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_ke, 0);
  objc_storeStrong((id *)&self->_childSA, 0);
  objc_storeStrong((id *)&self->_ikeSA, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("CREATE_CHILD_SA");
}

+ (unint64_t)exchangeType
{
  return 36;
}

- (BOOL)isRekeyIKE
{
  return objc_getProperty(a1, a2, 88, 1) != 0;
}

@end
