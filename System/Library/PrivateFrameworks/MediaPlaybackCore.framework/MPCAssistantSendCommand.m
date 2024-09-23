@implementation MPCAssistantSendCommand

- (MPCAssistantSendCommand)init
{
  MPCAssistantSendCommand *v2;
  MPCAssistantConnection *v3;
  MPCAssistantConnection *connection;
  MPCAssistantDiscovery *v5;
  MPCAssistantDiscovery *discovery;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPCAssistantSendCommand;
  v2 = -[MPCAssistantSendCommand init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MPCAssistantConnection);
    connection = v2->_connection;
    v2->_connection = v3;

    v5 = objc_alloc_init(MPCAssistantDiscovery);
    discovery = v2->_discovery;
    v2->_discovery = v5;

  }
  return v2;
}

- (void)sendMediaRemoteCommand:(unsigned int)a3 withOptions:(id)a4 toLocalDestination:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a6;
  v10 = a4;
  v11 = (void *)MRMediaRemoteCopyCommandDescription();
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    v23 = 2114;
    v24 = v8;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "Dispatching %{public}@ command to destination: %{public}@", buf, 0x16u);
  }

  v13 = (void *)objc_msgSend(v8, "createPlayerPath");
  dispatch_get_global_queue(25, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v11;
  v19 = v13;
  v20 = v9;
  v15 = v9;
  v16 = v13;
  v17 = v11;
  MRMediaRemoteSendCommandToPlayerWithResult();

}

- (void)sendMediaRemoteCommand:(unsigned int)a3 withOptions:(id)a4 toEndpointDestination:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  MPCAssistantDiscovery *discovery;
  void *v29;
  NSObject *v30;
  MPCAssistantSendCommandResult *v31;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  MPCAssistantSendCommand *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _BYTE *v41;
  _QWORD v42[4];
  id v43;
  NSObject *v44;
  MPCAssistantSendCommand *v45;
  id v46;
  id v47;
  id v48;
  _BYTE *v49;
  int v50;
  _QWORD aBlock[4];
  id v52;
  _BYTE *v53;
  uint8_t v54[4];
  id v55;
  _BYTE buf[24];
  uint64_t v57;
  uint64_t v58;

  v8 = *(_QWORD *)&a3;
  v58 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MRMediaRemoteCopyCommandDescription();
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = dispatch_queue_create("com.apple.assistant.SendCommand", v14);

  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "Command %{public}@ to destination: %{public}@", buf, 0x16u);
  }

  objc_msgSend(v11, "outputDeviceUIDs");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v17 = MEMORY[0x24BDAC760];
  v57 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke;
  aBlock[3] = &unk_24CAB61F8;
  v53 = buf;
  v32 = v12;
  v52 = v32;
  v18 = _Block_copy(aBlock);
  v42[0] = v17;
  v42[1] = 3221225472;
  v42[2] = __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_2;
  v42[3] = &unk_24CAB6270;
  v19 = v13;
  v43 = v19;
  v20 = v15;
  v49 = buf;
  v44 = v20;
  v45 = self;
  v50 = v8;
  v21 = v10;
  v46 = v21;
  v22 = v11;
  v47 = v22;
  v23 = v18;
  v48 = v23;
  v24 = _Block_copy(v42);
  if (objc_msgSend(v33, "count"))
  {
    if (objc_msgSend(v22, "singleGroup"))
    {
      v39[0] = v17;
      v39[1] = 3221225472;
      v39[2] = __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_3;
      v39[3] = &unk_24CAB6298;
      v41 = buf;
      v40 = v23;
      -[MPCAssistantSendCommand _formGroupAndSendCommand:withOptions:toExternalDestination:completion:](self, "_formGroupAndSendCommand:withOptions:toExternalDestination:completion:", v8, v21, v22, v39);
      v25 = v40;
    }
    else
    {
      discovery = self->_discovery;
      objc_msgSend(v22, "outputDeviceUIDs");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v17;
      v34[1] = 3221225472;
      v34[2] = __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_4;
      v34[3] = &unk_24CAB62C0;
      v35 = v22;
      v36 = self;
      v37 = v23;
      v38 = v24;
      -[MPCAssistantDiscovery discoverRemoteControlEndpointsMatchingUIDs:completion:](discovery, "discoverRemoteControlEndpointsMatchingUIDs:completion:", v29, v34);

      v25 = v35;
    }
  }
  else
  {
    objc_msgSend(v22, "outputGroups");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count") == 0;

    if (v27)
    {
      if (objc_msgSend(v22, "origin"))
      {
        v25 = (void *)objc_msgSend(v22, "createPlayerPath");
        -[MPCAssistantSendCommand _sendCommand:path:options:queue:completion:](self, "_sendCommand:path:options:queue:completion:", v8, v25, v21, v20, v23);
      }
      else
      {
        v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v54 = 138543362;
          v55 = v22;
          _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_ERROR, "Cannot send command: no output devices specified in destination: %{public}@", v54, 0xCu);
        }

        MPCAssistantCreateError(8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[MPCAssistantSendCommandResult initWithReturnStatuses:error:]([MPCAssistantSendCommandResult alloc], "initWithReturnStatuses:error:", 0, v25);
        (*((void (**)(id, MPCAssistantSendCommandResult *))v32 + 2))(v32, v31);

      }
    }
    else
    {
      objc_msgSend(v22, "outputGroups");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void *))v24 + 2))(v24, v25);
    }
  }

  _Block_object_dispose(buf, 8);
}

- (void)sendCommand:(unsigned int)a3 withOptions:(id)a4 toEndpoint:(id)a5 toDestination:(id)a6 completion:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v10 = *(_QWORD *)&a3;
  v12 = a7;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __87__MPCAssistantSendCommand_sendCommand_withOptions_toEndpoint_toDestination_completion___block_invoke;
  v14[3] = &unk_24CAB62E8;
  v15 = v12;
  v13 = v12;
  -[MPCAssistantSendCommand _sendCommand:withOptions:toEndpoint:toDestination:completion:](self, "_sendCommand:withOptions:toEndpoint:toDestination:completion:", v10, a4, a5, a6, v14);

}

- (void)_checkForAccount:(id)a3 destination:(id)a4 origin:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, uint64_t);
  uint64_t v16;
  void *v17;
  char IsSystemApplication;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  _BYTE *v32;
  unint64_t v33;
  int v34;
  int v35;
  _BYTE *v36;
  int v37;
  void *v38;
  void *v39;
  _BOOL4 v41;
  int v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  _BYTE *v48;
  unint64_t v49;
  int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unint64_t v55;
  __int16 v56;
  CC_LONG64 v57;
  CC_LONG64 v58;
  uint64_t v59;
  CC_LONG64 v60;
  CC_LONG64 v61;
  CC_LONG64 v62;
  CC_LONG64 v63;
  CC_LONG64 v64;
  CC_LONG64 v65;
  CC_LONG64 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  CC_LONG64 v70;
  CC_LONG64 v71;
  CC_LONG64 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  CC_LONG64 v84;
  CC_LONG64 v85;
  uint64_t v86;
  CC_LONG64 v87;
  int v88;
  void *v89;
  void *v90;
  int v91;
  CC_LONG64 v92;
  unint64_t v93;
  CC_LONG64 *v94;
  unint64_t v95;
  uint64_t v96;
  unsigned int v97;
  unsigned int v98;
  unint64_t v99;
  unsigned int v100;
  CC_LONG64 *v101;
  unint64_t v102;
  int v103;
  unint64_t v104;
  int v105;
  unint64_t v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  id v111;
  uint64_t v112;
  const UInt8 *v113;
  ldiv_t v114;
  uint64_t v115;
  CFStringRef v116;
  unsigned __int8 *v117;
  char *v118;
  char *v119;
  uint64_t m;
  unsigned int v121;
  char *v122;
  id v123;
  char *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  _BYTE *v128;
  unint64_t v129;
  id v130;
  char *v131;
  uint64_t v132;
  unsigned __int8 *v133;
  char *v134;
  char *v135;
  uint64_t j;
  unsigned int v137;
  char *v138;
  uint64_t v139;
  char *v140;
  uint64_t quot;
  lldiv_t v142;
  uint64_t v143;
  const UInt8 *v144;
  __CFString *v145;
  unsigned __int8 *v146;
  char *v147;
  char *v148;
  uint64_t k;
  unsigned int v150;
  char *v151;
  char *v152;
  uint64_t v153;
  _BYTE *v154;
  unint64_t v155;
  unsigned __int8 *v156;
  char *v157;
  char *v158;
  uint64_t i;
  unsigned int v160;
  char *v161;
  void *v162;
  id v163;
  void *v164;
  void *v165;
  _BYTE *v166;
  _BYTE *v167;
  void *v168;
  void *v169;
  void (**v170)(id, uint64_t);
  id v171;
  uint8_t buf[8];
  CC_SHA512_CTX v173;
  _BYTE v174[72];
  _OWORD v175[4];
  uint64_t v176;
  _QWORD v177[3];
  _QWORD v178[3];

  v178[0] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, uint64_t))a7;
  if (objc_msgSend(v13, "isLocallyHosted"))
  {
    objc_msgSend(MEMORY[0x24BE65538], "localOrigin");
    v16 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v16;
  }
  objc_msgSend(v12, "appBundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  IsSystemApplication = MRMediaRemoteApplicationIsSystemApplication();

  if ((IsSystemApplication & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v12, "appBundleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BE65A48]);

  if ((v20 & 1) != 0
    || (objc_msgSend(v12, "appBundleID"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BE65A50]),
        v21,
        (v22 & 1) != 0))
  {
LABEL_8:
    objc_msgSend(v11, "valueForKey:", *MEMORY[0x24BE659E8]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      v15[2](v15, 1);
LABEL_166:

      goto LABEL_167;
    }
    v171 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v26, &v171);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v171;
    if (v28)
    {
      v29 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210BD8000, v29, OS_LOG_TYPE_ERROR, "Cannot decode active identity", buf, 2u);
      }

      goto LABEL_13;
    }
    if (!v27)
    {
LABEL_13:
      v15[2](v15, 1);
LABEL_165:

      goto LABEL_166;
    }
    v168 = v27;
    objc_msgSend(v27, "accountDSID");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    memset(&v173, 0, sizeof(v173));
    *(_QWORD *)buf = 4001;
    CC_SHA1_Init((CC_SHA1_CTX *)&v173);
    v31 = objc_retainAutorelease(v30);
    v32 = (_BYTE *)objc_msgSend(v31, "UTF8String");
    v33 = objc_msgSend(v31, "length");
    v34 = v33;
    if (*(uint64_t *)buf > 3999)
    {
      if (*(uint64_t *)buf > 4255)
      {
        if (*(_QWORD *)buf == 4256)
        {
          CC_SHA256_Update((CC_SHA256_CTX *)&v173, v32, v33);
        }
        else if (*(_QWORD *)buf == 4512)
        {
          CC_SHA512_Update(&v173, v32, v33);
        }
      }
      else if (*(_QWORD *)buf == 4000)
      {
        CC_MD5_Update((CC_MD5_CTX *)&v173, v32, v33);
      }
      else if (*(_QWORD *)buf == 4001)
      {
        CC_SHA1_Update((CC_SHA1_CTX *)&v173, v32, v33);
      }
    }
    else
    {
      if (*(uint64_t *)buf <= 2999)
      {
        if (*(_QWORD *)buf)
        {
          if (*(_QWORD *)buf == 2000)
          {
            v35 = (((v33 + BYTE3(v173.count[1])) & 3) - BYTE3(v173.count[1]));
            v36 = (char *)&v173.hash[-1] + BYTE3(v173.count[1]);
            switch(v35)
            {
              case 0:
                break;
              case 1:
                *v36 = *v32;
                break;
              case 2:
                v56 = *(_WORD *)v32;
                goto LABEL_69;
              case 3:
                v56 = *(_WORD *)v32;
                *((_BYTE *)&v173.count[1] + BYTE3(v173.count[1]) + 2) = v32[2];
LABEL_69:
                *(_WORD *)v36 = v56;
                break;
              default:
                memcpy(v36, v32, (((v34 + BYTE3(v173.count[1])) & 3) - BYTE3(v173.count[1])));
                break;
            }
            HIDWORD(v173.count[0]) += v34;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("MSVHasher+Algorithms.h"), 262, CFSTR("Cannot append to unknown hasher algorithm"));

        }
        goto LABEL_71;
      }
      if (*(_QWORD *)buf == 3000)
      {
        if (!v32)
          goto LABEL_71;
        v41 = v33 > 0xF || (LODWORD(v173.count[0]) + v33) > 0xF;
        LODWORD(v173.count[0]) += v33;
        HIDWORD(v173.count[0]) |= v41;
        if (v33 + LODWORD(v173.hash[3]) > 0xF)
        {
          v48 = &v32[v33];
          if (LODWORD(v173.hash[3]))
          {
            v167 = &v32[v33];
            memcpy((char *)&v173.wbuf[-7] + LODWORD(v173.hash[3]), v32, (16 - LODWORD(v173.hash[3])));
            v48 = v167;
            HIDWORD(v49) = LODWORD(v173.count[1]) - 2048144777 * LODWORD(v173.hash[1]);
            LODWORD(v49) = HIDWORD(v49);
            v50 = -1640531535 * (v49 >> 19);
            HIDWORD(v49) = HIDWORD(v173.count[1]) - 2048144777 * HIDWORD(v173.hash[1]);
            LODWORD(v49) = HIDWORD(v49);
            LODWORD(v173.count[1]) = v50;
            HIDWORD(v173.count[1]) = -1640531535 * (v49 >> 19);
            HIDWORD(v49) = LODWORD(v173.hash[0]) - 2048144777 * LODWORD(v173.hash[2]);
            LODWORD(v49) = HIDWORD(v49);
            LODWORD(v173.hash[0]) = -1640531535 * (v49 >> 19);
            HIDWORD(v49) = HIDWORD(v173.hash[0]) - 2048144777 * HIDWORD(v173.hash[2]);
            LODWORD(v49) = HIDWORD(v49);
            v32 += (16 - LODWORD(v173.hash[3]));
            HIDWORD(v173.hash[0]) = -1640531535 * (v49 >> 19);
            LODWORD(v173.hash[3]) = 0;
          }
          if (v32 <= v48 - 16)
          {
            v51 = v173.count[1];
            v52 = HIDWORD(v173.count[1]);
            v53 = v173.hash[0];
            v54 = HIDWORD(v173.hash[0]);
            do
            {
              HIDWORD(v55) = v51 - 2048144777 * *(_DWORD *)v32;
              LODWORD(v55) = HIDWORD(v55);
              v51 = -1640531535 * (v55 >> 19);
              HIDWORD(v55) = v52 - 2048144777 * *((_DWORD *)v32 + 1);
              LODWORD(v55) = HIDWORD(v55);
              v52 = -1640531535 * (v55 >> 19);
              HIDWORD(v55) = v53 - 2048144777 * *((_DWORD *)v32 + 2);
              LODWORD(v55) = HIDWORD(v55);
              v53 = -1640531535 * (v55 >> 19);
              HIDWORD(v55) = v54 - 2048144777 * *((_DWORD *)v32 + 3);
              LODWORD(v55) = HIDWORD(v55);
              v54 = -1640531535 * (v55 >> 19);
              v32 += 16;
            }
            while (v32 <= v48 - 16);
            v173.count[1] = __PAIR64__(v52, v51);
            v173.hash[0] = __PAIR64__(v54, v53);
          }
          if (v32 >= v48)
            goto LABEL_71;
          v42 = (_DWORD)v48 - (_DWORD)v32;
          __memcpy_chk();
        }
        else
        {
          memcpy((char *)&v173.wbuf[-7] + LODWORD(v173.hash[3]), v32, v33);
          v42 = LODWORD(v173.hash[3]) + v34;
        }
        LODWORD(v173.hash[3]) = v42;
        goto LABEL_71;
      }
      if (*(_QWORD *)buf != 3001 || !v32)
        goto LABEL_71;
      v173.count[0] += v33;
      if (v33 + LODWORD(v173.hash[7]) <= 0x1F)
      {
        memcpy((char *)&v173.wbuf[-5] + LODWORD(v173.hash[7]), v32, v33);
        v37 = LODWORD(v173.hash[7]) + v34;
LABEL_56:
        LODWORD(v173.hash[7]) = v37;
        goto LABEL_71;
      }
      v43 = (unint64_t)&v32[v33];
      if (LODWORD(v173.hash[7]))
      {
        v166 = &v32[v33];
        memcpy((char *)&v173.wbuf[-5] + LODWORD(v173.hash[7]), v32, (32 - LODWORD(v173.hash[7])));
        v43 = (unint64_t)v166;
        v173.count[1] = 0x9E3779B185EBCA87 * __ROR8__(v173.count[1] - 0x3D4D51C2D82B14B1 * v173.hash[3], 33);
        v173.hash[0] = 0x9E3779B185EBCA87 * __ROR8__(v173.hash[0] - 0x3D4D51C2D82B14B1 * v173.hash[4], 33);
        v173.hash[1] = 0x9E3779B185EBCA87 * __ROR8__(v173.hash[1] - 0x3D4D51C2D82B14B1 * v173.hash[5], 33);
        v173.hash[2] = 0x9E3779B185EBCA87 * __ROR8__(v173.hash[2] - 0x3D4D51C2D82B14B1 * v173.hash[6], 33);
        v32 += (32 - LODWORD(v173.hash[7]));
        LODWORD(v173.hash[7]) = 0;
      }
      if ((unint64_t)(v32 + 32) <= v43)
      {
        v44 = v173.count[1];
        v46 = v173.hash[1];
        v47 = v173.hash[0];
        v45 = v173.hash[2];
        do
        {
          v44 = 0x9E3779B185EBCA87 * __ROR8__(v44 - 0x3D4D51C2D82B14B1 * *(_QWORD *)v32, 33);
          v47 = 0x9E3779B185EBCA87 * __ROR8__(v47 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v32 + 1), 33);
          v46 = 0x9E3779B185EBCA87 * __ROR8__(v46 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v32 + 2), 33);
          v45 = 0x9E3779B185EBCA87 * __ROR8__(v45 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v32 + 3), 33);
          v32 += 32;
        }
        while ((unint64_t)v32 <= v43 - 32);
        v173.count[1] = v44;
        v173.hash[0] = v47;
        v173.hash[1] = v46;
        v173.hash[2] = v45;
      }
      if ((unint64_t)v32 < v43)
      {
        v37 = v43 - (_DWORD)v32;
        __memcpy_chk();
        goto LABEL_56;
      }
    }
LABEL_71:

    memset(&v174[8], 0, 64);
    *(_QWORD *)v174 = *(_QWORD *)buf;
    if (*(uint64_t *)buf > 3000)
    {
      if (*(uint64_t *)buf > 4000)
      {
        switch(*(_QWORD *)buf)
        {
          case 0xFA1:
            CC_SHA1_Final(&v174[8], (CC_SHA1_CTX *)&v173);
            break;
          case 0x10A0:
            CC_SHA256_Final(&v174[8], (CC_SHA256_CTX *)&v173);
            break;
          case 0x11A0:
            CC_SHA512_Final(&v174[8], &v173);
            break;
        }
        goto LABEL_118;
      }
      if (*(_QWORD *)buf != 3001)
      {
        if (*(_QWORD *)buf == 4000)
          CC_MD5_Final(&v174[8], (CC_MD5_CTX *)&v173);
LABEL_118:
        v175[0] = *(_OWORD *)v174;
        v175[1] = *(_OWORD *)&v174[16];
        v175[2] = *(_OWORD *)&v174[32];
        v175[3] = *(_OWORD *)&v174[48];
        v176 = *(_QWORD *)&v174[64];
        if (*(uint64_t *)v174 <= 3999)
        {
          if (*(uint64_t *)v174 > 2999)
          {
            if (*(_QWORD *)v174 == 3000)
            {
              LODWORD(v177[0]) = bswap32(DWORD2(v175[0]));
              v152 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
              v153 = 0;
              v154 = v152 + 1;
              do
              {
                v155 = *((unsigned __int8 *)v177 + v153);
                *(v154 - 1) = MSVFastHexStringFromBytes_hexCharacters_25458[v155 >> 4];
                *v154 = MSVFastHexStringFromBytes_hexCharacters_25458[v155 & 0xF];
                v154 += 2;
                ++v153;
              }
              while (v153 != 4);
              v130 = objc_alloc(MEMORY[0x24BDD17C8]);
              v131 = v152;
              v132 = 8;
            }
            else
            {
              if (*(_QWORD *)v174 != 3001)
                goto LABEL_168;
              v177[0] = bswap64(*((unint64_t *)&v175[0] + 1));
              v126 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
              v127 = 0;
              v128 = v126 + 1;
              do
              {
                v129 = *((unsigned __int8 *)v177 + v127);
                *(v128 - 1) = MSVFastHexStringFromBytes_hexCharacters_25458[v129 >> 4];
                *v128 = MSVFastHexStringFromBytes_hexCharacters_25458[v129 & 0xF];
                v128 += 2;
                ++v127;
              }
              while (v127 != 8);
              v130 = objc_alloc(MEMORY[0x24BDD17C8]);
              v131 = v126;
              v132 = 16;
            }
            v145 = (__CFString *)objc_msgSend(v130, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v131, v132, 4, 1);
LABEL_164:

            -[__CFString substringToIndex:](v145, "substringToIndex:", 7);
            v162 = (void *)objc_claimAutoreleasedReturnValue();

            v169 = v162;
            v170 = v15;
            v163 = v162;
            MRMediaRemoteGetSupportedCommandsForApp();

            v27 = v168;
            goto LABEL_165;
          }
          if (*(_QWORD *)v174 == 1000)
          {
            v139 = *((_QWORD *)&v175[0] + 1);
            v140 = (char *)v178 + 1;
            quot = *((_QWORD *)&v175[0] + 1);
            do
            {
              v142 = lldiv(quot, 10);
              quot = v142.quot;
              if (v142.rem >= 0)
                LOBYTE(v143) = v142.rem;
              else
                v143 = -v142.rem;
              *(v140 - 2) = v143 + 48;
              v144 = (const UInt8 *)(v140 - 2);
              --v140;
            }
            while (v142.quot);
            if (v139 < 0)
            {
              *(v140 - 2) = 45;
              v144 = (const UInt8 *)(v140 - 2);
            }
            v145 = (__CFString *)CFStringCreateWithBytes(0, v144, (char *)v178 - (char *)v144, 0x8000100u, 0);
            goto LABEL_164;
          }
          if (*(_QWORD *)v174 == 2000)
          {
            v111 = v31;
            v112 = DWORD2(v175[0]);
            v113 = (const UInt8 *)v178;
            do
            {
              v114 = ldiv(v112, 10);
              v112 = v114.quot;
              if (v114.rem >= 0)
                LOBYTE(v115) = v114.rem;
              else
                v115 = -v114.rem;
              *--v113 = v115 + 48;
            }
            while (v114.quot);
            v116 = CFStringCreateWithBytes(0, v113, (char *)v178 - (char *)v113, 0x8000100u, 0);
            goto LABEL_163;
          }
LABEL_168:
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v164, "handleFailureInFunction:file:lineNumber:description:", v165, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

          v145 = &stru_24CABB5D0;
          goto LABEL_164;
        }
        if (*(uint64_t *)v174 > 4255)
        {
          if (*(_QWORD *)v174 == 4256)
          {
            v111 = v31;
            v156 = (unsigned __int8 *)v175 + 8;
            v157 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
            v158 = v157;
            for (i = 0; i != 64; i += 2)
            {
              v160 = *v156++;
              v161 = &v157[i];
              *v161 = MSVFastHexStringFromBytes_hexCharacters_25458[(unint64_t)v160 >> 4];
              v161[1] = MSVFastHexStringFromBytes_hexCharacters_25458[v160 & 0xF];
            }
            v123 = objc_alloc(MEMORY[0x24BDD17C8]);
            v124 = v158;
            v125 = 64;
          }
          else
          {
            if (*(_QWORD *)v174 != 4512)
              goto LABEL_168;
            v111 = v31;
            v133 = (unsigned __int8 *)v175 + 8;
            v134 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
            v135 = v134;
            for (j = 0; j != 128; j += 2)
            {
              v137 = *v133++;
              v138 = &v134[j];
              *v138 = MSVFastHexStringFromBytes_hexCharacters_25458[(unint64_t)v137 >> 4];
              v138[1] = MSVFastHexStringFromBytes_hexCharacters_25458[v137 & 0xF];
            }
            v123 = objc_alloc(MEMORY[0x24BDD17C8]);
            v124 = v135;
            v125 = 128;
          }
        }
        else if (*(_QWORD *)v174 == 4000)
        {
          v111 = v31;
          v146 = (unsigned __int8 *)v175 + 8;
          v147 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
          v148 = v147;
          for (k = 0; k != 32; k += 2)
          {
            v150 = *v146++;
            v151 = &v147[k];
            *v151 = MSVFastHexStringFromBytes_hexCharacters_25458[(unint64_t)v150 >> 4];
            v151[1] = MSVFastHexStringFromBytes_hexCharacters_25458[v150 & 0xF];
          }
          v123 = objc_alloc(MEMORY[0x24BDD17C8]);
          v124 = v148;
          v125 = 32;
        }
        else
        {
          if (*(_QWORD *)v174 != 4001)
            goto LABEL_168;
          v111 = v31;
          v117 = (unsigned __int8 *)v175 + 8;
          v118 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
          v119 = v118;
          for (m = 0; m != 40; m += 2)
          {
            v121 = *v117++;
            v122 = &v118[m];
            *v122 = MSVFastHexStringFromBytes_hexCharacters_25458[(unint64_t)v121 >> 4];
            v122[1] = MSVFastHexStringFromBytes_hexCharacters_25458[v121 & 0xF];
          }
          v123 = objc_alloc(MEMORY[0x24BDD17C8]);
          v124 = v119;
          v125 = 40;
        }
        v116 = (CFStringRef)objc_msgSend(v123, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v124, v125, 4, 1);
LABEL_163:
        v145 = (__CFString *)v116;
        v31 = v111;
        goto LABEL_164;
      }
      if (v173.count[0] < 0x20)
        v92 = v173.hash[1] + 0x27D4EB2F165667C5;
      else
        v92 = 0x9E3779B185EBCA87
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((0x9E3779B185EBCA87
                  * ((__ROR8__(v173.hash[0], 57)
                    + __ROR8__(v173.count[1], 63)
                    + __ROR8__(v173.hash[1], 52)
                    + __ROR8__(v173.hash[2], 46)) ^ (0x9E3779B185EBCA87
                                                   * __ROR8__(0xC2B2AE3D27D4EB4FLL * v173.count[1], 33)))
                  - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v173.hash[0], 33)))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v173.hash[1], 33)))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v173.hash[2], 33)))
            - 0x7A1435883D4D519DLL;
      v93 = v92 + v173.count[0];
      v94 = &v173.hash[3];
      v95 = v173.count[0] & 0x1F;
      if (v95 >= 8)
      {
        do
        {
          v96 = *v94++;
          v93 = 0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v96, 33)) ^ v93, 37);
          v95 -= 8;
        }
        while (v95 > 7);
      }
      if (v95 >= 4)
      {
        v97 = *(_DWORD *)v94;
        v94 = (CC_LONG64 *)((char *)v94 + 4);
        v93 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v97) ^ v93, 41);
        v95 -= 4;
      }
      for (; v95; --v95)
      {
        v98 = *(unsigned __int8 *)v94;
        v94 = (CC_LONG64 *)((char *)v94 + 1);
        v93 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v98) ^ v93, 53);
      }
      v99 = 0x165667B19E3779F9
          * ((0xC2B2AE3D27D4EB4FLL * (v93 ^ (v93 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v93 ^ (v93 >> 33))) >> 29));
      v87 = v99 ^ HIDWORD(v99);
LABEL_105:
      *(_QWORD *)&v174[8] = v87;
      goto LABEL_118;
    }
    if (*(uint64_t *)buf <= 1999)
    {
      if (!*(_QWORD *)buf)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "handleFailureInFunction:file:lineNumber:description:", v90, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

        goto LABEL_118;
      }
      if (*(_QWORD *)buf != 1000)
        goto LABEL_118;
      v57 = (v173.count[0] + v173.count[1]) ^ __ROR8__(v173.count[1], 51);
      v58 = v173.hash[0] + (v173.hash[1] ^ v173.hash[2]);
      v59 = __ROR8__(v173.hash[1] ^ v173.hash[2], 48);
      v60 = (v58 ^ v59) + __ROR8__(v173.count[0] + v173.count[1], 32);
      v61 = v60 ^ __ROR8__(v58 ^ v59, 43);
      v62 = v58 + v57;
      v63 = v62 ^ __ROR8__(v57, 47);
      v64 = (v60 ^ v173.hash[2]) + v63;
      v65 = v64 ^ __ROR8__(v63, 51);
      v66 = (__ROR8__(v62, 32) ^ 0xFFLL) + v61;
      v67 = __ROR8__(v61, 48);
      v68 = __ROR8__(v64, 32) + (v66 ^ v67);
      v69 = v68 ^ __ROR8__(v66 ^ v67, 43);
      v70 = v65 + v66;
      v71 = v70 ^ __ROR8__(v65, 47);
      v72 = v71 + v68;
      v73 = v72 ^ __ROR8__(v71, 51);
      v74 = __ROR8__(v70, 32) + v69;
      v75 = __ROR8__(v69, 48);
      v76 = __ROR8__(v72, 32) + (v74 ^ v75);
      v77 = v76 ^ __ROR8__(v74 ^ v75, 43);
      v78 = v73 + v74;
      v79 = v78 ^ __ROR8__(v73, 47);
      v80 = v79 + v76;
      v81 = v80 ^ __ROR8__(v79, 51);
      v82 = __ROR8__(v78, 32) + v77;
      v83 = __ROR8__(v77, 48);
      v84 = __ROR8__(v80, 32) + (v82 ^ v83);
      v85 = v84 ^ __ROR8__(v82 ^ v83, 43);
      v86 = v81 + v82;
      v173.count[0] = v84;
      v173.count[1] = v86 ^ __ROR8__(v81, 47);
      v173.hash[0] = __ROR8__(v86, 32);
      v173.hash[1] = v85;
      v87 = v173.count[1] ^ v84 ^ v173.hash[0] ^ v85;
      goto LABEL_105;
    }
    if (*(_QWORD *)buf != 2000)
    {
      if (*(_QWORD *)buf != 3000)
        goto LABEL_118;
      if (HIDWORD(v173.count[0]))
        v88 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&v173.count[1], (uint32x4_t)xmmword_210ED9470), (int8x16_t)vshlq_u32(*(uint32x4_t *)&v173.count[1], (uint32x4_t)xmmword_210ED9460)));
      else
        v88 = LODWORD(v173.hash[0]) + 374761393;
      v100 = LODWORD(v173.count[0]) + v88;
      v101 = &v173.hash[1];
      v102 = v173.hash[3] & 0xF;
      if (v102 >= 4)
      {
        do
        {
          v103 = *(_DWORD *)v101;
          v101 = (CC_LONG64 *)((char *)v101 + 4);
          HIDWORD(v104) = v100 - 1028477379 * v103;
          LODWORD(v104) = HIDWORD(v104);
          v100 = 668265263 * (v104 >> 15);
          v102 -= 4;
        }
        while (v102 > 3);
      }
      for (; v102; --v102)
      {
        v105 = *(unsigned __int8 *)v101;
        v101 = (CC_LONG64 *)((char *)v101 + 1);
        HIDWORD(v106) = v100 + 374761393 * v105;
        LODWORD(v106) = HIDWORD(v106);
        v100 = -1640531535 * (v106 >> 21);
      }
      v107 = -1028477379 * ((-2048144777 * (v100 ^ (v100 >> 15))) ^ ((-2048144777 * (v100 ^ (v100 >> 15))) >> 13));
      v108 = v107 ^ HIWORD(v107);
      goto LABEL_117;
    }
    switch(BYTE3(v173.count[1]))
    {
      case 1u:
        v91 = LOBYTE(v173.count[1]);
        break;
      case 2u:
        v91 = LOWORD(v173.count[1]);
        break;
      case 3u:
        v91 = LOWORD(v173.count[1]) | (BYTE2(v173.count[1]) << 16);
        break;
      default:
        v109 = v173.count[0];
        goto LABEL_116;
    }
    v109 = (461845907 * ((380141568 * v91) | ((-862048943 * v91) >> 17))) ^ LODWORD(v173.count[0]);
LABEL_116:
    v110 = -2048144789 * (HIDWORD(v173.count[0]) ^ v109 ^ ((HIDWORD(v173.count[0]) ^ v109) >> 16));
    v108 = (-1028477387 * (v110 ^ (v110 >> 13))) ^ ((-1028477387 * (v110 ^ (v110 >> 13))) >> 16);
    LODWORD(v173.count[0]) = v108;
LABEL_117:
    *(_DWORD *)&v174[8] = v108;
    goto LABEL_118;
  }
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "sonicHijack") & 1) != 0)
  {
    objc_msgSend(v12, "appBundleID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.Sonic"));

    if (v25)
      goto LABEL_8;
  }
  else
  {

  }
  v15[2](v15, 1);
LABEL_167:

}

- (void)_formGroupAndSendCommand:(unsigned int)a3 withOptions:(id)a4 toExternalDestination:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  MPCAssistantDiscovery *discovery;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  void *v30;
  _QWORD v31[5];
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD aBlock[4];
  id v38;
  id v39;
  NSObject *v40;
  MPCAssistantSendCommand *v41;
  id v42;
  int v43;
  unsigned int v44;
  uint8_t buf[4];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v11, "outputDeviceUIDs");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = dispatch_queue_create("com.apple.mediaplayer.assistant.grouping", v14);

  if (a3 - 121 > 0xB || (v16 = 1, ((1 << (a3 - 121)) & 0x803) == 0))
    v16 = 0;
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v46 = v13;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEBUG, "Searching for output devices matching UIDs: %{public}@", buf, 0xCu);
  }

  v30 = (void *)v13;
  v18 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke;
  aBlock[3] = &unk_24CAB6360;
  v19 = v10;
  v38 = v19;
  v43 = v16;
  v20 = v11;
  v39 = v20;
  v44 = a3;
  v21 = v15;
  v40 = v21;
  v41 = self;
  v22 = v12;
  v42 = v22;
  v23 = _Block_copy(aBlock);
  discovery = self->_discovery;
  v31[0] = v18;
  v31[1] = 3221225472;
  v31[2] = __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_26;
  v31[3] = &unk_24CAB6428;
  v31[4] = self;
  v32 = v21;
  v33 = v19;
  v34 = v20;
  v35 = v22;
  v36 = v23;
  v25 = v23;
  v26 = v20;
  v27 = v19;
  v28 = v21;
  v29 = v22;
  -[MPCAssistantDiscovery discoverRemoteControlEndpointsMatchingUIDs:completion:](discovery, "discoverRemoteControlEndpointsMatchingUIDs:completion:", v30, v31);

}

- (void)_sendCommand:(unsigned int)a3 withOptions:(id)a4 toEndpoint:(void *)a5 toDestination:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  dispatch_queue_t v16;
  NSObject *v17;
  void *v18;
  MPCAssistantConnection *connection;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  MPCAssistantSendCommand *v26;
  id v27;
  dispatch_queue_t v28;
  id v29;
  unsigned int v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a6;
  v14 = a7;
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = dispatch_queue_create("com.apple.mediaplayer.assistant.callback", v15);

  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)MRMediaRemoteCopyCommandDescription();
    *(_DWORD *)buf = 138543618;
    v32 = v18;
    v33 = 2114;
    v34 = a5;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "Sending command: %{public}@ endpoint %{public}@...", buf, 0x16u);

  }
  connection = self->_connection;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __88__MPCAssistantSendCommand__sendCommand_withOptions_toEndpoint_toDestination_completion___block_invoke;
  v24[3] = &unk_24CAB6450;
  v28 = v16;
  v29 = v14;
  v25 = v13;
  v26 = self;
  v30 = a3;
  v27 = v12;
  v20 = v16;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  -[MPCAssistantConnection connectToEndpoint:completion:](connection, "connectToEndpoint:completion:", a5, v24);

}

- (void)_sendCommand:(unsigned int)a3 path:(id)a4 options:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v7;
  id v8;

  v8 = a7;
  v7 = v8;
  MRMediaRemoteSendCommandToPlayerWithResult();

}

- (BOOL)_isAnyDeviceControllable:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (MRAVOutputDeviceIsRemoteControllable() && (MRAVOutputDeviceCanAccessAppleMusic() & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (void)_findEndpointFromEndpoints:(id)a3 byGroupLeader:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
      if (MRAVEndpointGetDesignatedGroupLeader())
      {
        v13 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
        v14 = objc_msgSend(v6, "isEqualToString:", v13, (_QWORD)v16);

        if ((v14 & 1) != 0)
          break;
      }
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

uint64_t __70__MPCAssistantSendCommand__sendCommand_path_options_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__MPCAssistantSendCommand__sendCommand_withOptions_toEndpoint_toDestination_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0, a4);
  }
  else
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v19 = a3;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEBUG, "Sending command to remote origin %@...", buf, 0xCu);
    }

    v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "createPlayerPath");
    v8 = objc_alloc(MEMORY[0x24BE65560]);
    objc_msgSend(v7, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithOrigin:client:player:", a3, v9, v10);

    v12 = *(unsigned int *)(a1 + 72);
    v13 = *(void **)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __88__MPCAssistantSendCommand__sendCommand_withOptions_toEndpoint_toDestination_completion___block_invoke_39;
    v16[3] = &unk_24CAB62E8;
    v15 = *(_QWORD *)(a1 + 56);
    v17 = *(id *)(a1 + 64);
    objc_msgSend(v13, "_sendCommand:path:options:queue:completion:", v12, v11, v14, v15, v16);

  }
}

uint64_t __88__MPCAssistantSendCommand__sendCommand_withOptions_toEndpoint_toDestination_completion___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE659A8]);

  v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "createPlayerPath");
  v8 = v3;
  v9 = *(id *)(a1 + 64);
  v7 = v3;
  MRAVEndpointGroupDevicesAndSendCommandWithResult();

}

void __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_26(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "Send to external destination: No devices found.", buf, 2u);
    }

    v8 = 1;
    goto LABEL_12;
  }
  if ((objc_msgSend(a1[4], "_isAnyDeviceControllable:", v6) & 1) == 0)
  {
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_ERROR, "Send to external destination: Not remote controllable.", buf, 2u);
    }

    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v6;
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEBUG, "No remote controllable device found among devices: %{public}@", buf, 0xCu);
    }

    v8 = 2;
LABEL_12:
    MPCAssistantCreateError(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)a1[4] + 2), "stopDiscovery");
    (*((void (**)(void))a1[8] + 2))();

    goto LABEL_13;
  }
  v12 = v5;
  v13 = a1[6];
  v14 = a1[7];
  v15 = a1[5];
  v16 = v6;
  v17 = a1[9];
  v18 = a1[8];
  MRAVEndpointPredictGroupLeader();

LABEL_13:
}

void __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v4 = a3;
  v5 = objc_msgSend(*(id *)(a1 + 32), "_findEndpointFromEndpoints:byGroupLeader:", *(_QWORD *)(a1 + 40), v4);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 8);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_2_28;
    v9[3] = &unk_24CAB63D8;
    v9[4] = v7;
    v10 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 64);
    v13 = *(id *)(a1 + 72);
    v14 = v4;
    v17 = v6;
    v15 = *(id *)(a1 + 80);
    v16 = *(id *)(a1 + 88);
    objc_msgSend(v8, "connectToEndpoint:completion:", v6, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }

}

void __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_2_28(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;

  v4 = a3;
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_3;
    v12[3] = &unk_24CAB63B0;
    v13 = *(id *)(a1 + 64);
    v14 = *(id *)(a1 + 72);
    v15 = v4;
    v9 = *(id *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 96);
    v16 = v9;
    v20 = v10;
    v11 = *(id *)(a1 + 80);
    v17 = *(_QWORD *)(a1 + 32);
    v18 = v11;
    v19 = *(id *)(a1 + 88);
    objc_msgSend(v5, "_checkForAccount:destination:origin:queue:completion:", v6, v8, v15, v7, v12);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }

}

void __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(a1 + 40)))
    {
      v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v4 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v10 = v4;
        _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_DEBUG, "Sending pause to future group leader at: %{public}@", buf, 0xCu);
      }

      v8 = *(id *)(a1 + 72);
      v7 = *(id *)(a1 + 32);
      MRMediaRemoteSendCommandForOriginWithReply();

    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));
    }
  }
  else
  {
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_ERROR, "Send to external destination: No matching account.", buf, 2u);
    }

    MPCAssistantCreateError(2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 16), "stopDiscovery");
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

  }
}

void __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  NSObject *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MRMediaRemoteCopyCommandDescription();
  if (objc_msgSend(v3, "containsObject:", &unk_24CB16C50))
  {
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v20 = v4;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEBUG, "Sent %{public}@ to %{public}@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v5 = objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "unsignedShortValue", (_QWORD)v15);
          v12 = (void *)MRMediaRemoteCopyCommandHandlerStatusDescription();
          -[NSObject appendString:](v5, "appendString:", v12);

          -[NSObject appendString:](v5, "appendString:", CFSTR(" "));
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
      }
      while (v9);
    }

    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v20 = v4;
      v21 = 2114;
      v22 = v14;
      v23 = 2114;
      v24 = v5;
      _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_ERROR, "Sent %{public}@ to %{public}@: %{public}@", buf, 0x20u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __97__MPCAssistantSendCommand__formGroupAndSendCommand_withOptions_toExternalDestination_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int IsInformational;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  _BYTE v30[24];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MRMediaRemoteCopyCommandDescription();
  objc_msgSend(v7, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v7, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IsInformational = MRMediaRemoteErrorIsInformational();

    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    v15 = v14;
    if (IsInformational)
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        goto LABEL_10;
      objc_msgSend(v7, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v30 = 138543874;
      *(_QWORD *)&v30[4] = v10;
      *(_WORD *)&v30[12] = 2114;
      *(_QWORD *)&v30[14] = v9;
      *(_WORD *)&v30[22] = 2114;
      v31 = v16;
      v17 = "Sent %{public}@ to %{public}@ informational: %{public}@";
      v18 = v15;
      v19 = OS_LOG_TYPE_DEBUG;
    }
    else
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      objc_msgSend(v7, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v30 = 138543874;
      *(_QWORD *)&v30[4] = v10;
      *(_WORD *)&v30[12] = 2114;
      *(_QWORD *)&v30[14] = v9;
      *(_WORD *)&v30[22] = 2114;
      v31 = v16;
      v17 = "Sent %{public}@ to %{public}@ error: %{public}@";
      v18 = v15;
      v19 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_210BD8000, v18, v19, v17, v30, 0x20u);

  }
  else
  {
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v30 = 138543618;
      *(_QWORD *)&v30[4] = v10;
      *(_WORD *)&v30[12] = 2114;
      *(_QWORD *)&v30[14] = v9;
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEBUG, "Sent %{public}@ to %{public}@", v30, 0x16u);
    }
  }
LABEL_10:

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BE65580], "currentSettings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isMultiplayerHost");

    v24 = 0;
    if (objc_msgSend(*(id *)(a1 + 32), "count") != 1 || (v26 & 1) != 0)
      goto LABEL_27;
    v27 = 6;
LABEL_23:
    MPCAssistantCreateError(v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  objc_msgSend(v8, "domain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x24BE65728]);

  if (!v21)
  {
LABEL_18:
    v24 = 0;
    goto LABEL_27;
  }
  v22 = objc_msgSend(v8, "code");
  switch(v22)
  {
    case 200:
      v27 = 7;
      goto LABEL_23;
    case 202:
      goto LABEL_18;
    case 201:
      v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_ERROR, "The remote group leader went silent. Logs on the external device should be checked.", v30, 2u);
      }

      goto LABEL_18;
  }
  MPCAssistantCreateError(3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "error");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v30 = 138543362;
    *(_QWORD *)&v30[4] = v29;
    _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_ERROR, "Got error when grouping devices: %{public}@", v30, 0xCu);

  }
LABEL_27:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "stopDiscovery", *(_OWORD *)v30, *(_QWORD *)&v30[16], v31);
  (*(void (**)(_QWORD, id, void *, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v7, v24, objc_msgSend(*(id *)(a1 + 32), "count"));

}

void __80__MPCAssistantSendCommand__checkForAccount_destination_origin_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v24;
      v8 = *MEMORY[0x24BE656C8];
      v17 = *MEMORY[0x24BE656C8];
      v18 = *(_QWORD *)v24;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(v4);
          if (MEMORY[0x212BD1B48](*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9)) == 133)
          {
            v10 = (void *)MRMediaRemoteCommandInfoCopyOptions();
            objc_msgSend(v10, "objectForKeyedSubscript:", v8);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = 0u;
            v20 = 0u;
            v21 = 0u;
            v22 = 0u;
            v12 = v11;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v20;
              while (2)
              {
                v16 = 0;
                do
                {
                  if (*(_QWORD *)v20 != v15)
                    objc_enumerationMutation(v12);
                  if (objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "hasSuffix:", *(_QWORD *)(a1 + 32), v17, v18))
                  {
                    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

                    goto LABEL_22;
                  }
                  ++v16;
                }
                while (v14 != v16);
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
                if (v14)
                  continue;
                break;
              }
            }

            v8 = v17;
            v7 = v18;
          }
          ++v9;
        }
        while (v9 != v6);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v6);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_22:

}

void __87__MPCAssistantSendCommand_sendCommand_withOptions_toEndpoint_toDestination_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  MPCAssistantSendCommandResult *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[MPCAssistantSendCommandResult initWithCommandResult:error:]([MPCAssistantSendCommandResult alloc], "initWithCommandResult:error:", v6, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  MPCAssistantSendCommandResult *v8;

  v5 = a3;
  v6 = a2;
  v8 = -[MPCAssistantSendCommandResult initWithCommandResult:error:]([MPCAssistantSendCommandResult alloc], "initWithCommandResult:error:", v6, v5);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCAssistantSendCommandResult setDevicesControlled:](v8, "setDevicesControlled:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id obj;
  uint64_t v21;
  unsigned int v23;
  _QWORD v24[5];
  id v25;
  _BYTE *v26;
  uint64_t *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  NSObject *v31;
  uint64_t *v32;
  _BYTE *v33;
  uint64_t v34;
  _QWORD block[4];
  id v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t v48[4];
  uint64_t v49;
  uint8_t v50[128];
  _BYTE buf[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v19 = a2;
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Default_Oversize");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v19, "count");
    *(_WORD *)&buf[22] = 2114;
    v52 = (uint64_t (*)(uint64_t, uint64_t))v19;
    _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEFAULT, "Command %{public}@ all %lu endpoints: %{public}@", buf, 0x20u);
  }

  v4 = dispatch_group_create();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v52 = __Block_byref_object_copy__17216;
  v53 = __Block_byref_object_dispose__17217;
  v54 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__17216;
  v46 = __Block_byref_object_dispose__17217;
  v47 = 0;
  if (objc_msgSend(v19, "count"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v5 = v19;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (v6)
    {
      v21 = *(_QWORD *)v39;
      obj = v5;
      v7 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v39 != v21)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          dispatch_group_enter(v4);
          v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v48 = 138543362;
            v49 = v9;
            _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "To endpoint: %{public}@", v48, 0xCu);
          }

          v11 = (void *)MRAVEndpointCopyOutputDevices();
          v12 = *(NSObject **)(a1 + 40);
          block[0] = v7;
          block[1] = 3221225472;
          block[2] = __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_7;
          block[3] = &unk_24CABAB68;
          v37 = *(_QWORD *)(a1 + 80);
          v13 = v11;
          v36 = v13;
          dispatch_sync(v12, block);
          v23 = *(_DWORD *)(a1 + 88);
          v15 = *(void **)(a1 + 48);
          v14 = *(_QWORD *)(a1 + 56);
          v16 = *(_QWORD *)(a1 + 64);
          v28[0] = v7;
          v28[1] = 3221225472;
          v28[2] = __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_2_9;
          v28[3] = &unk_24CAB6220;
          v32 = &v42;
          v29 = *(id *)(a1 + 32);
          v34 = v9;
          v30 = *(id *)(a1 + 40);
          v33 = buf;
          v31 = v4;
          objc_msgSend(v15, "_sendCommand:withOptions:toEndpoint:toDestination:completion:", v23, v14, v9, v16, v28);

        }
        v5 = obj;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      }
      while (v6);
    }
  }
  else
  {
    MPCAssistantCreateError(1);
    v17 = objc_claimAutoreleasedReturnValue();
    v5 = (id)v43[5];
    v43[5] = v17;
  }

  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_2_11;
  v24[3] = &unk_24CAB6248;
  v18 = *(NSObject **)(a1 + 40);
  v24[4] = *(_QWORD *)(a1 + 48);
  v25 = *(id *)(a1 + 72);
  v26 = buf;
  v27 = &v42;
  dispatch_group_notify(v4, v18, v24);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(buf, 8);

}

uint64_t __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a4;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(*(id *)(a1 + 32), "originatingDeviceControl")
    || objc_msgSend(v5, "count")
    || (objc_msgSend(*(id *)(a1 + 40), "_isAnyDeviceControllable:", v6) & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v7 = objc_msgSend(v6, "count");
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v9)
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "Send to originating device: Not remote controllable.", (uint8_t *)&v12, 2u);
      }

      v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      v10 = 2;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v12 = 138543362;
        v13 = v6;
        v10 = 2;
        _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEBUG, "No remote controllable device found among devices: %{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      if (v9)
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "Send to originating device: Unable to discover", (uint8_t *)&v12, 2u);
      }
      v10 = 1;
    }

    MPCAssistantCreateError(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "stopDiscovery");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

uint64_t __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

void __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_2_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int IsInformational;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint32_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    IsInformational = MRMediaRemoteErrorIsInformational();
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    v9 = v8;
    if (IsInformational)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(_QWORD *)(a1 + 72);
        *(_DWORD *)buf = 138543874;
        v27 = v10;
        v28 = 2114;
        v29 = v11;
        v30 = 2114;
        v31 = v6;
        v12 = "Sent %{public}@ to %{public}@ informational: %{public}@";
        v13 = v9;
        v14 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
        v17 = 32;
        goto LABEL_10;
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 138543874;
      v27 = v18;
      v28 = 2114;
      v29 = v19;
      v30 = 2114;
      v31 = v6;
      v12 = "Sent %{public}@ to %{public}@ error: %{public}@";
      v13 = v9;
      v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_9;
    }
  }
  else
  {
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 138543618;
      v27 = v15;
      v28 = 2114;
      v29 = v16;
      v12 = "Sent %{public}@ to %{public}@";
      v13 = v9;
      v14 = OS_LOG_TYPE_DEFAULT;
      v17 = 22;
LABEL_10:
      _os_log_impl(&dword_210BD8000, v13, v14, v12, buf, v17);
    }
  }

  v20 = *(NSObject **)(a1 + 40);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_10;
  v23[3] = &unk_24CABAB68;
  v21 = *(_QWORD *)(a1 + 64);
  v24 = v5;
  v25 = v21;
  v22 = v5;
  dispatch_sync(v20, v23);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_2_11(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stopDiscovery");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __95__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toEndpointDestination_completion___block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_QWORD *)(v2 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      return;
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  objc_storeStrong((id *)(v2 + 40), *(id *)(a1 + 32));
}

void __92__MPCAssistantSendCommand_sendMediaRemoteCommand_withOptions_toLocalDestination_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  MPCAssistantSendCommandResult *v4;
  void *v5;
  void *v6;
  int IsInformational;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = -[MPCAssistantSendCommandResult initWithCommandResult:error:]([MPCAssistantSendCommandResult alloc], "initWithCommandResult:error:", v3, 0);
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IsInformational = MRMediaRemoteErrorIsInformational();

    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    v9 = v8;
    if (IsInformational)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v10 = a1[4];
        v11 = a1[5];
        objc_msgSend(v3, "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543874;
        v21 = v10;
        v22 = 2114;
        v23 = v11;
        v24 = 2114;
        v25 = v12;
        v13 = "Sent %{public}@ to %{public}@ informational: %{public}@";
        v14 = v9;
        v15 = OS_LOG_TYPE_DEBUG;
LABEL_9:
        _os_log_impl(&dword_210BD8000, v14, v15, v13, (uint8_t *)&v20, 0x20u);

      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v18 = a1[4];
      v19 = a1[5];
      objc_msgSend(v3, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v18;
      v22 = 2114;
      v23 = v19;
      v24 = 2114;
      v25 = v12;
      v13 = "Sent %{public}@ to %{public}@ error: %{public}@";
      v14 = v9;
      v15 = OS_LOG_TYPE_ERROR;
      goto LABEL_9;
    }
  }
  else
  {
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v16 = a1[4];
      v17 = a1[5];
      v20 = 138543618;
      v21 = v16;
      v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEBUG, "Sent %{public}@ to %{public}@", (uint8_t *)&v20, 0x16u);
    }
  }

  (*(void (**)(void))(a1[6] + 16))();
}

@end
