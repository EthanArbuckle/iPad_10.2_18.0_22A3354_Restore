@implementation HMMTRProtocolOperationManager

- (BOOL)_isBasicClusterOperationForBridgedDevice:(Class)a3 endpointID:(unint64_t)a4
{
  char v6;

  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    v6 = -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
    return a4 && (v6 & 1) != 0;
  }
  return a4 != 0;
}

- (BOOL)handleSpecialCaseCharacteristicWithOperation:(id)a3 accessoryServer:(id)a4 clientQueue:(id)a5 operationResponseHandler:(id)a6 updatedAttributesHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *);
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  HMMTRProtocolOperationManager *v26;
  void (**v27)(id, void *);
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  HMMTRProtocolOperationManager *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  int v51;
  id v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, void *))a6;
  v16 = a7;
  objc_msgSend(v12, "characteristic");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "type");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("0000001E-0000-1000-8000-0026BB765291")))
  {
    v19 = objc_msgSend(v12, "type");

    if (v19 == 1)
    {
      -[HMMTRProtocolOperationManager handleLockTargetStateWriteWithOperation:accessoryServer:clientQueue:operationResponseHandler:](self, "handleLockTargetStateWriteWithOperation:accessoryServer:clientQueue:operationResponseHandler:", v12, v13, v14, v15);
LABEL_26:
      v43 = 1;
      goto LABEL_27;
    }
  }
  else
  {

  }
  objc_msgSend(v12, "characteristic");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "type");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isEqualToString:", CFSTR("00000014-0000-1000-8000-0026BB765291")))
  {
    v22 = objc_msgSend(v12, "type");

    if (v22 == 1)
    {
      -[HMMTRProtocolOperationManager handleIdentifyDeviceWriteWithOperation:clientQueue:operationResponseHandler:](self, "handleIdentifyDeviceWriteWithOperation:clientQueue:operationResponseHandler:", v12, v14, v15);
      goto LABEL_26;
    }
  }
  else
  {

  }
  if (objc_msgSend(v12, "type") == 1)
  {
    objc_msgSend(v12, "characteristic");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "type");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isEqualToString:", CFSTR("00000013-0000-1000-8000-0026BB765291")))
    {

LABEL_13:
      -[HMMTRProtocolOperationManager handleHueSaturationWriteWithOperation:clientQueue:operationResponseHandler:updatedAttributesHandler:](self, "handleHueSaturationWriteWithOperation:clientQueue:operationResponseHandler:updatedAttributesHandler:", v12, v14, v15, v16);
      goto LABEL_26;
    }
    objc_msgSend(v12, "characteristic");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "type");
    v26 = self;
    v27 = v15;
    v28 = v14;
    v29 = v16;
    v30 = v13;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v31, "isEqualToString:", CFSTR("0000002F-0000-1000-8000-0026BB765291"));

    v13 = v30;
    v16 = v29;
    v14 = v28;
    v15 = v27;
    self = v26;

    if (v51)
      goto LABEL_13;
  }
  if (objc_msgSend(v12, "type") == 1)
  {
    objc_msgSend(v12, "characteristic");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "type");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("000000B0-0000-1000-8000-0026BB765291"));

    if (v34)
    {
      if (objc_msgSend(v12, "handlingType"))
      {
        v35 = objc_msgSend(v12, "handlingType");
        v36 = (void *)MEMORY[0x242656984]();
        v37 = self;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = v38;
        if (v35 == 3)
        {
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "writePrimaryRequestTuple");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "hmdAccessoryUUID");
            v52 = v13;
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v55 = v40;
            v56 = 2112;
            v57 = (uint64_t)v42;
            _os_log_impl(&dword_23E95B000, v39, OS_LOG_TYPE_DEBUG, "%{public}@Dropping write request for active characteristic. accessoryUUID: %@", buf, 0x16u);

            v13 = v52;
          }
        }
        else if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v50 = v36;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v12, "handlingType");
          objc_msgSend(v12, "writePrimaryRequestTuple");
          v53 = v13;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "hmdAccessoryUUID");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v55 = v44;
          v56 = 2048;
          v57 = v45;
          v58 = 2112;
          v59 = v47;
          _os_log_impl(&dword_23E95B000, v39, OS_LOG_TYPE_ERROR, "%{public}@Invalid handling type %lu. Dropping write request for active characteristic. accessoryUUID: %@", buf, 0x20u);

          v13 = v53;
          v36 = v50;
        }

        objc_autoreleasePoolPop(v36);
        -[HMMTRProtocolOperationManager _processWriteResponseForOperation:writeResponseValues:writeResponseError:](v37, "_processWriteResponseForOperation:writeResponseValues:writeResponseError:", v12, 0, 0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          v15[2](v15, v48);

        goto LABEL_26;
      }
    }
  }
  v43 = 0;
LABEL_27:

  return v43;
}

- (void)handleIdentifyDeviceWriteWithOperation:(id)a3 clientQueue:(id)a4 operationResponseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HMMTRIdentifyDevice *v14;
  void *v15;
  void *v16;
  HMMTRIdentifyDevice *v17;
  void *v18;
  HMMTRProtocolOperationManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "writePrimaryRequestTuple");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hmdAccessoryUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12
    && (objc_msgSend(v8, "matterDevice"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    v14 = [HMMTRIdentifyDevice alloc];
    objc_msgSend(v8, "matterDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topology");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HMMTRIdentifyDevice initWithDevice:topology:queue:](v14, "initWithDevice:topology:queue:", v15, v16, v9);

    LOWORD(v15) = objc_msgSend(v8, "endpoint");
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __109__HMMTRProtocolOperationManager_handleIdentifyDeviceWriteWithOperation_clientQueue_operationResponseHandler___block_invoke;
    v24[3] = &unk_250F228C0;
    v24[4] = self;
    v25 = v8;
    v26 = v10;
    -[HMMTRIdentifyDevice identifyWithEndpoint:completionHandler:](v17, "identifyWithEndpoint:completionHandler:", (unsigned __int16)v15, v24);

  }
  else
  {
    v18 = (void *)MEMORY[0x242656984]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "matterDevice");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v21;
      v29 = 2112;
      v30 = v12;
      v31 = 2112;
      v32 = v22;
      _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_ERROR, "%{public}@A required parameter was not included in identify write request. accessoryUUID: %@, matterDevice: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), 3, 0);
    v17 = (HMMTRIdentifyDevice *)objc_claimAutoreleasedReturnValue();
    -[HMMTRProtocolOperationManager _processWriteResponseForOperation:writeResponseValues:writeResponseError:](v19, "_processWriteResponseForOperation:writeResponseValues:writeResponseError:", v8, 0, v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v23);

  }
}

- (void)handleHueSaturationWriteWithOperation:(id)a3 clientQueue:(id)a4 operationResponseHandler:(id)a5 updatedAttributesHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  id v33;
  void (**v34)(_QWORD, _QWORD);
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  HMMTRProtocolOperationManager *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  HMMTRProtocolOperationManager *v47;
  NSObject *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  int v60;
  id v61;
  void (**v62)(_QWORD, _QWORD);
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  HMMTRProtocolOperationManager *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void (**v77)(_QWORD, _QWORD);
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  HMMTRProtocolOperationManager *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  int v93;
  void (**v94)(_QWORD, _QWORD);
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  HMMTRProtocolOperationManager *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  HMMTRProtocolOperationManager *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  int v118;
  void (**v119)(_QWORD, _QWORD);
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  HMMTRProtocolOperationManager *v124;
  NSObject *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  HMMTRProtocolOperationManager *v131;
  NSObject *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  int v140;
  void (**v141)(_QWORD, _QWORD);
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  HMMTRProtocolOperationManager *v146;
  NSObject *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  id v173;
  _QWORD v174[5];
  id v175;
  id v176;
  id v177;
  _QWORD v178[5];
  id v179;
  id v180;
  id v181;
  _QWORD v182[5];
  id v183;
  id v184;
  id v185;
  _QWORD v186[5];
  id v187;
  id v188;
  id v189;
  _QWORD v190[5];
  id v191;
  id v192;
  id v193;
  _QWORD v194[5];
  id v195;
  id v196;
  id v197;
  _QWORD v198[4];
  id v199;
  HMMTRProtocolOperationManager *v200;
  id v201;
  uint8_t buf[4];
  void *v203;
  __int16 v204;
  uint64_t v205;
  __int16 v206;
  void *v207;
  __int16 v208;
  void *v209;
  __int16 v210;
  void *v211;
  uint64_t v212;

  v212 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v173 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "matterDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

    goto LABEL_4;
  }
  objc_msgSend(v10, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
LABEL_4:
    objc_msgSend(v10, "characteristicDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v198[0] = MEMORY[0x24BDAC760];
    v198[1] = 3221225472;
    v198[2] = __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke;
    v198[3] = &unk_250F240D8;
    v16 = v10;
    v199 = v16;
    v200 = self;
    v201 = v12;
    v172 = (void *)MEMORY[0x242656B10](v198);
    objc_msgSend(v16, "matterDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v27 = objc_alloc(MEMORY[0x24BDDB568]);
      objc_msgSend(v16, "device");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = (void *)objc_msgSend(v27, "initWithDevice:endpoint:queue:", v28, (unsigned __int16)objc_msgSend(v16, "endpoint"), v173);

      v29 = objc_msgSend(v16, "handlingType");
      if (v29 == 2)
      {
        v162 = v12;
        v157 = v11;
        v33 = objc_alloc_init(MEMORY[0x24BDDB640]);
        objc_msgSend(v16, "characteristic");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "type");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = objc_msgSend(v92, "isEqualToString:", CFSTR("00000013-0000-1000-8000-0026BB765291"));

        v160 = v15;
        objc_msgSend(v15, "mapValue");
        v94 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "writePrimaryRequestTuple");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "value");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v94)[2](v94, v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        if (v93)
        {
          objc_msgSend(v33, "setHue:", v97);

          objc_msgSend(v16, "writeSecondaryRequestTuple");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "value");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMMTRProtocolMap linearMapForCharacteristic:value:fromRange:toRange:](HMMTRProtocolMap, "linearMapForCharacteristic:value:fromRange:toRange:", CFSTR("0000002F-0000-1000-8000-0026BB765291"), v99, &unk_250F40638, &unk_250F40650);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setSaturation:", v100);
        }
        else
        {
          objc_msgSend(v33, "setSaturation:", v97);

          objc_msgSend(v16, "writeSecondaryRequestTuple");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "value");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMMTRProtocolMap linearMapForCharacteristic:value:fromRange:toRange:](HMMTRProtocolMap, "linearMapForCharacteristic:value:fromRange:toRange:", CFSTR("00000013-0000-1000-8000-0026BB765291"), v99, &unk_250F40608, &unk_250F40620);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setHue:", v100);
        }

        objc_msgSend(v33, "setTransitionTime:", &unk_250F3F378);
        objc_msgSend(v33, "setOptionsMask:", &unk_250F3F438);
        v130 = (void *)MEMORY[0x242656984](objc_msgSend(v33, "setOptionsOverride:", &unk_250F3F438));
        v131 = self;
        HMFGetOSLogHandle();
        v132 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "characteristic");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "writeSecondaryRequestTuple");
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v168, "characteristic");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          v170 = v130;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "type"));
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "endpoint"));
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v203 = v133;
          v204 = 2112;
          v205 = (uint64_t)v134;
          v206 = 2112;
          v207 = v135;
          v208 = 2112;
          v209 = v136;
          v210 = 2112;
          v211 = v137;
          _os_log_impl(&dword_23E95B000, v132, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory sending request for characteristics %@ and %@ of type %@ on endpoint %@", buf, 0x34u);

          v130 = v170;
        }

        objc_autoreleasePoolPop(v130);
        v174[0] = MEMORY[0x24BDAC760];
        v174[1] = 3221225472;
        v174[2] = __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_77;
        v174[3] = &unk_250F23AF8;
        v174[4] = v131;
        v175 = v16;
        v11 = v157;
        v176 = v157;
        v177 = v172;
        objc_msgSend(v171, "moveToHueAndSaturationWithParams:completionHandler:", v33, v174);

        v45 = v175;
      }
      else
      {
        if (v29 == 1)
        {
          -[HMMTRProtocolOperationManager _processWriteResponseForOperation:writeResponseValues:writeResponseError:](self, "_processWriteResponseForOperation:writeResponseValues:writeResponseError:", v16, 0, 0);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            (*((void (**)(id, void *))v11 + 2))(v11, v101);

          goto LABEL_61;
        }
        if (v29)
        {
          v102 = (void *)MEMORY[0x242656984]();
          v103 = self;
          HMFGetOSLogHandle();
          v104 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v105 = v15;
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            v107 = objc_msgSend(v16, "handlingType");
            *(_DWORD *)buf = 138543618;
            v203 = v106;
            v204 = 2048;
            v205 = v107;
            _os_log_impl(&dword_23E95B000, v104, OS_LOG_TYPE_ERROR, "%{public}@Unhandled handling type: %lu", buf, 0x16u);

            v15 = v105;
          }

          objc_autoreleasePoolPop(v102);
          goto LABEL_61;
        }
        objc_msgSend(v16, "characteristic");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "type");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("00000013-0000-1000-8000-0026BB765291"));

        if (v32)
        {
          v162 = v12;
          v154 = v11;
          v33 = objc_alloc_init(MEMORY[0x24BDDB648]);
          v160 = v15;
          objc_msgSend(v15, "mapValue");
          v34 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "writePrimaryRequestTuple");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "value");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v34)[2](v34, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setHue:", v37);

          objc_msgSend(v33, "setTransitionTime:", &unk_250F3F378);
          objc_msgSend(v33, "setOptionsMask:", &unk_250F3F438);
          v38 = (void *)MEMORY[0x242656984](objc_msgSend(v33, "setOptionsOverride:", &unk_250F3F438));
          v39 = self;
          HMFGetOSLogHandle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "characteristic");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "type"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "endpoint"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v203 = v41;
            v204 = 2112;
            v205 = (uint64_t)v42;
            v206 = 2112;
            v207 = v43;
            v208 = 2112;
            v209 = v44;
            _os_log_impl(&dword_23E95B000, v40, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory sending request for characteristic %@ of type %@ on endpoint %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v38);
          v182[0] = MEMORY[0x24BDAC760];
          v182[1] = 3221225472;
          v182[2] = __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_75;
          v182[3] = &unk_250F23AF8;
          v182[4] = v39;
          v183 = v16;
          v11 = v154;
          v184 = v154;
          v185 = v172;
          objc_msgSend(v171, "moveToHueWithParams:completionHandler:", v33, v182);

          v45 = v183;
        }
        else
        {
          objc_msgSend(v16, "characteristic");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "type");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          v140 = objc_msgSend(v139, "isEqualToString:", CFSTR("0000002F-0000-1000-8000-0026BB765291"));

          if (!v140)
            goto LABEL_61;
          v162 = v12;
          v159 = v11;
          v33 = objc_alloc_init(MEMORY[0x24BDDB650]);
          v160 = v15;
          objc_msgSend(v15, "mapValue");
          v141 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "writePrimaryRequestTuple");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v142, "value");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v141)[2](v141, v143);
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setSaturation:", v144);

          objc_msgSend(v33, "setTransitionTime:", &unk_250F3F378);
          objc_msgSend(v33, "setOptionsMask:", &unk_250F3F378);
          v145 = (void *)MEMORY[0x242656984](objc_msgSend(v33, "setOptionsOverride:", &unk_250F3F378));
          v146 = self;
          HMFGetOSLogHandle();
          v147 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "characteristic");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "type"));
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "endpoint"));
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v203 = v148;
            v204 = 2112;
            v205 = (uint64_t)v149;
            v206 = 2112;
            v207 = v150;
            v208 = 2112;
            v209 = v151;
            _os_log_impl(&dword_23E95B000, v147, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory sending request for characteristic %@ of type %@ on endpoint %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v145);
          v178[0] = MEMORY[0x24BDAC760];
          v178[1] = 3221225472;
          v178[2] = __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_76;
          v178[3] = &unk_250F23AF8;
          v178[4] = v146;
          v179 = v16;
          v11 = v159;
          v180 = v159;
          v181 = v172;
          objc_msgSend(v171, "moveToSaturationWithParams:completionHandler:", v33, v178);

          v45 = v179;
        }
      }

      v15 = v160;
      v12 = v162;
LABEL_61:

      v54 = v199;
      goto LABEL_62;
    }
    v18 = objc_alloc((Class)objc_msgSend(v15, "clusterClass"));
    objc_msgSend(v16, "matterDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = (void *)objc_msgSend(v18, "initWithDevice:endpoint:queue:", v19, (unsigned __int16)objc_msgSend(v16, "endpoint"), v173);

    objc_msgSend(v15, "mapWriteValueToExpectedValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v15, "mapWriteValueToExpectedValues");
      v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v16, "endpoint");
      objc_msgSend(v16, "value");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, void *))v21)[2](v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v169 = v24;
      if (objc_msgSend(v24, "count"))
      {
        objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x24BDDB460]);
        v26 = (id)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v26 = v169;
          v169 = v26;
        }
      }
      else
      {
        v26 = 0;
      }
    }
    else
    {
      v26 = 0;
      v169 = 0;
    }
    v55 = &unk_250F3F420;
    if (!v26)
      v55 = 0;
    v56 = v55;
    v57 = objc_msgSend(v16, "handlingType");
    if (v57 == 2)
    {
      v165 = v56;
      v167 = v26;
      v163 = v12;
      v156 = v11;
      v61 = objc_alloc_init(MEMORY[0x24BDDB640]);
      objc_msgSend(v16, "characteristic");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "type");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v75, "isEqualToString:", CFSTR("00000013-0000-1000-8000-0026BB765291"));

      v161 = v15;
      objc_msgSend(v15, "mapValue");
      v77 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "writePrimaryRequestTuple");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "value");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v77)[2](v77, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (v76)
      {
        objc_msgSend(v61, "setHue:", v80);

        objc_msgSend(v16, "writeSecondaryRequestTuple");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "value");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMMTRProtocolMap linearMapForCharacteristic:value:fromRange:toRange:](HMMTRProtocolMap, "linearMapForCharacteristic:value:fromRange:toRange:", CFSTR("0000002F-0000-1000-8000-0026BB765291"), v82, &unk_250F40638, &unk_250F40650);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setSaturation:", v83);
      }
      else
      {
        objc_msgSend(v61, "setSaturation:", v80);

        objc_msgSend(v16, "writeSecondaryRequestTuple");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "value");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMMTRProtocolMap linearMapForCharacteristic:value:fromRange:toRange:](HMMTRProtocolMap, "linearMapForCharacteristic:value:fromRange:toRange:", CFSTR("00000013-0000-1000-8000-0026BB765291"), v82, &unk_250F40608, &unk_250F40620);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setHue:", v83);
      }

      objc_msgSend(v61, "setTransitionTime:", &unk_250F3F378);
      objc_msgSend(v61, "setOptionsMask:", &unk_250F3F438);
      v108 = (void *)MEMORY[0x242656984](objc_msgSend(v61, "setOptionsOverride:", &unk_250F3F438));
      v109 = self;
      HMFGetOSLogHandle();
      v110 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "characteristic");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "writeSecondaryRequestTuple");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "characteristic");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v153 = v108;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "type"));
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "endpoint"));
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v203 = v111;
        v204 = 2112;
        v205 = (uint64_t)v112;
        v206 = 2112;
        v207 = v113;
        v208 = 2112;
        v209 = v114;
        v210 = 2112;
        v211 = v115;
        _os_log_impl(&dword_23E95B000, v110, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory sending request for characteristics %@ and %@ of type %@ on endpoint %@", buf, 0x34u);

        v108 = v153;
      }

      objc_autoreleasePoolPop(v108);
      v186[0] = MEMORY[0x24BDAC760];
      v186[1] = 3221225472;
      v186[2] = __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_73;
      v186[3] = &unk_250F23AF8;
      v186[4] = v109;
      v187 = v16;
      v11 = v156;
      v188 = v156;
      v189 = v172;
      v56 = v165;
      v26 = v167;
      objc_msgSend(v171, "moveToHueAndSaturationWithParams:expectedValues:expectedValueInterval:completionHandler:", v61, v167, v165, v186);

      v73 = v187;
    }
    else
    {
      if (v57 == 1)
      {
        -[HMMTRProtocolOperationManager _processWriteResponseForOperation:writeResponseValues:writeResponseError:](self, "_processWriteResponseForOperation:writeResponseValues:writeResponseError:", v16, 0, 0);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          (*((void (**)(id, void *))v11 + 2))(v11, v84);

        goto LABEL_51;
      }
      v164 = v56;
      v166 = v26;
      if (v57)
      {
        v85 = (void *)MEMORY[0x242656984]();
        v86 = self;
        HMFGetOSLogHandle();
        v87 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v88 = v15;
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = objc_msgSend(v16, "handlingType");
          *(_DWORD *)buf = 138543618;
          v203 = v89;
          v204 = 2048;
          v205 = v90;
          _os_log_impl(&dword_23E95B000, v87, OS_LOG_TYPE_ERROR, "%{public}@Unhandled handling type: %lu", buf, 0x16u);

          v15 = v88;
        }

        objc_autoreleasePoolPop(v85);
        v26 = v166;
        goto LABEL_51;
      }
      objc_msgSend(v16, "characteristic");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "type");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "isEqualToString:", CFSTR("00000013-0000-1000-8000-0026BB765291"));

      if (v60)
      {
        v163 = v12;
        v61 = objc_alloc_init(MEMORY[0x24BDDB648]);
        v161 = v15;
        objc_msgSend(v15, "mapValue");
        v62 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "writePrimaryRequestTuple");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "value");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v62)[2](v62, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setHue:", v65);

        objc_msgSend(v61, "setTransitionTime:", &unk_250F3F378);
        objc_msgSend(v61, "setOptionsMask:", &unk_250F3F438);
        v66 = (void *)MEMORY[0x242656984](objc_msgSend(v61, "setOptionsOverride:", &unk_250F3F438));
        v67 = self;
        HMFGetOSLogHandle();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "characteristic");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v155 = v11;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "type"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "endpoint"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v203 = v69;
          v204 = 2112;
          v205 = (uint64_t)v70;
          v206 = 2112;
          v207 = v71;
          v208 = 2112;
          v209 = v72;
          _os_log_impl(&dword_23E95B000, v68, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory sending request for characteristic %@ of type %@ on endpoint %@", buf, 0x2Au);

          v11 = v155;
        }

        objc_autoreleasePoolPop(v66);
        v194[0] = MEMORY[0x24BDAC760];
        v194[1] = 3221225472;
        v194[2] = __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_68;
        v194[3] = &unk_250F23AF8;
        v194[4] = v67;
        v195 = v16;
        v196 = v11;
        v197 = v172;
        v56 = v164;
        v26 = v166;
        objc_msgSend(v171, "moveToHueWithParams:expectedValues:expectedValueInterval:completionHandler:", v61, v166, v164, v194);

        v73 = v195;
      }
      else
      {
        objc_msgSend(v16, "characteristic");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "type");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = objc_msgSend(v117, "isEqualToString:", CFSTR("0000002F-0000-1000-8000-0026BB765291"));

        v26 = v166;
        if (!v118)
          goto LABEL_51;
        v163 = v12;
        v61 = objc_alloc_init(MEMORY[0x24BDDB650]);
        v161 = v15;
        objc_msgSend(v15, "mapValue");
        v119 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "writePrimaryRequestTuple");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "value");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v119)[2](v119, v121);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setSaturation:", v122);

        objc_msgSend(v61, "setTransitionTime:", &unk_250F3F378);
        objc_msgSend(v61, "setOptionsMask:", &unk_250F3F378);
        v123 = (void *)MEMORY[0x242656984](objc_msgSend(v61, "setOptionsOverride:", &unk_250F3F378));
        v124 = self;
        HMFGetOSLogHandle();
        v125 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "characteristic");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          v158 = v11;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "type"));
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "endpoint"));
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v203 = v126;
          v204 = 2112;
          v205 = (uint64_t)v127;
          v206 = 2112;
          v207 = v128;
          v208 = 2112;
          v209 = v129;
          _os_log_impl(&dword_23E95B000, v125, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory sending request for characteristic %@ of type %@ on endpoint %@", buf, 0x2Au);

          v11 = v158;
        }

        objc_autoreleasePoolPop(v123);
        v190[0] = MEMORY[0x24BDAC760];
        v190[1] = 3221225472;
        v190[2] = __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_70;
        v190[3] = &unk_250F23AF8;
        v190[4] = v124;
        v191 = v16;
        v192 = v11;
        v193 = v172;
        v56 = v164;
        v26 = v166;
        objc_msgSend(v171, "moveToSaturationWithParams:expectedValues:expectedValueInterval:completionHandler:", v61, v166, v164, v190);

        v73 = v191;
      }
    }

    v15 = v161;
    v12 = v163;
LABEL_51:

    goto LABEL_61;
  }
  v46 = (void *)MEMORY[0x242656984]();
  v47 = self;
  HMFGetOSLogHandle();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "matterDevice");
    v50 = v12;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "device");
    v52 = v11;
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v203 = v49;
    v204 = 2112;
    v205 = (uint64_t)v51;
    v206 = 2112;
    v207 = v53;
    _os_log_impl(&dword_23E95B000, v48, OS_LOG_TYPE_ERROR, "%{public}@A required parameter was not included in the hue/saturation write request. matterDevice: %@, device: %@", buf, 0x20u);

    v11 = v52;
    v12 = v50;

  }
  objc_autoreleasePoolPop(v46);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), 3, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRProtocolOperationManager _processWriteResponseForOperation:writeResponseValues:writeResponseError:](v47, "_processWriteResponseForOperation:writeResponseValues:writeResponseError:", v10, 0, v15);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v11 + 2))(v11, v54);
LABEL_62:

}

- (void)handleLockTargetStateWriteWithOperation:(id)a3 accessoryServer:(id)a4 clientQueue:(id)a5 operationResponseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMTRProtocolOperationManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMMTRSyncClusterDoorLock *v21;
  void *v22;
  void *v23;
  HMMTRSyncClusterDoorLock *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  HMMTRProtocolOperationManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMMTRProtocolOperationManager *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v17;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling special case lock target state write", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(v10, "writePrimaryRequestTuple");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hmdAccessoryUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19
    && (objc_msgSend(v10, "matterDevice"), v20 = (void *)objc_claimAutoreleasedReturnValue(), v20, v20))
  {
    v21 = [HMMTRSyncClusterDoorLock alloc];
    objc_msgSend(v10, "matterDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "device");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HMMTRSyncClusterDoorLock initWithDevice:baseDevice:endpoint:queue:accessoryServer:](v21, "initWithDevice:baseDevice:endpoint:queue:accessoryServer:", v22, v23, (unsigned __int16)objc_msgSend(v10, "endpoint"), v12, v11);

    objc_msgSend(v10, "value");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "integerValue");

    if (v26 == 1)
    {
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __126__HMMTRProtocolOperationManager_handleLockTargetStateWriteWithOperation_accessoryServer_clientQueue_operationResponseHandler___block_invoke_2;
      v40[3] = &unk_250F228C0;
      v40[4] = v15;
      v41 = v10;
      v42 = v13;
      -[HMMTRSyncClusterDoorLock lockDoorWithAccessoryUUID:completionHandler:](v24, "lockDoorWithAccessoryUUID:completionHandler:", v19, v40);

      v27 = v41;
      goto LABEL_12;
    }
    if (!v26)
    {
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __126__HMMTRProtocolOperationManager_handleLockTargetStateWriteWithOperation_accessoryServer_clientQueue_operationResponseHandler___block_invoke;
      v43[3] = &unk_250F228C0;
      v43[4] = v15;
      v44 = v10;
      v45 = v13;
      -[HMMTRSyncClusterDoorLock unlockDoorWithAccessoryUUID:completionHandler:](v24, "unlockDoorWithAccessoryUUID:completionHandler:", v19, v43);

      v27 = v44;
LABEL_12:

      goto LABEL_16;
    }
    v34 = (void *)MEMORY[0x242656984]();
    v35 = v15;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "value");
      v39 = v34;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v37;
      v48 = 2112;
      v49 = v38;
      _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_ERROR, "%{public}@Unhandled write value for lock target state: %@", buf, 0x16u);

      v34 = v39;
    }

    objc_autoreleasePoolPop(v34);
  }
  else
  {
    v28 = (void *)MEMORY[0x242656984]();
    v29 = v15;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "matterDevice");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = v31;
      v48 = 2112;
      v49 = v19;
      v50 = 2112;
      v51 = v32;
      _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_ERROR, "%{public}@A required parameter was not included in write request for door lock target state. accessoryUUID: %@, matterDevice: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), 3, 0);
    v24 = (HMMTRSyncClusterDoorLock *)objc_claimAutoreleasedReturnValue();
    -[HMMTRProtocolOperationManager _processWriteResponseForOperation:writeResponseValues:writeResponseError:](v29, "_processWriteResponseForOperation:writeResponseValues:writeResponseError:", v10, 0, v24);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v13 + 2))(v13, v33);

  }
LABEL_16:

}

- (void)registerOperation:(id)a3 accessoryServer:(id)a4 clientQueue:(id)a5 reportDistributor:(id)a6 operationResponseHandler:(id)a7 updatedAttributesHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  void (**v17)(id, void *);
  id v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  void *v36;
  void *v37;
  HMMTRProtocolOperationManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  uint64_t v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  void (**v51)(_QWORD, _QWORD, _QWORD);
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  BOOL v58;
  void *v59;
  BOOL v60;
  id v61;
  HMMTRProtocolOperationManager *v62;
  NSObject *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  BOOL v68;
  void (**v69)(_QWORD, _QWORD);
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void (**v74)(_QWORD, _QWORD);
  uint64_t v75;
  void *v76;
  void *v77;
  int v78;
  uint64_t v79;
  void *v80;
  void *v81;
  NSObject *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  BOOL v88;
  int v89;
  HMMTRDeviceReader *v90;
  void *v91;
  void *v92;
  HMMTRDeviceReader *v93;
  void *v94;
  id v95;
  void *v96;
  int v97;
  void *v98;
  void *v99;
  char v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *context;
  HMMTRProtocolOperationManager *contexta;
  void (**v109)(_QWORD, _QWORD, _QWORD);
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  _QWORD v119[4];
  void (**v120)(_QWORD, _QWORD, _QWORD);
  id v121;
  _QWORD v122[5];
  id v123;
  id v124;
  void (**v125)(id, void *);
  id v126;
  _QWORD v127[5];
  id v128;
  id v129;
  void (**v130)(id, void *);
  _QWORD v131[5];
  id v132;
  id v133;
  id location;
  _BYTE buf[12];
  __int16 v136;
  void *v137;
  __int16 v138;
  uint64_t v139;
  __int16 v140;
  void *v141;
  uint64_t v142;

  v142 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v117 = a6;
  v17 = (void (**)(id, void *))a7;
  v18 = a8;
  v116 = v15;
  if (!-[HMMTRProtocolOperationManager handleSpecialCaseCharacteristicWithOperation:accessoryServer:clientQueue:operationResponseHandler:updatedAttributesHandler:](self, "handleSpecialCaseCharacteristicWithOperation:accessoryServer:clientQueue:operationResponseHandler:updatedAttributesHandler:", v14, v15, v16, v17, v18))
  {
    objc_msgSend(v14, "characteristicDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v19;
    if (!v19)
    {
      v26 = 2;
      goto LABEL_26;
    }
    v20 = -[HMMTRProtocolOperationManager _isBasicClusterOperationForBridgedDevice:endpointID:](self, "_isBasicClusterOperationForBridgedDevice:endpointID:", objc_msgSend(v19, "clusterClass"), objc_msgSend(v14, "endpoint"));
    objc_msgSend(v14, "matterDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (v21)
      {
        v22 = objc_alloc(MEMORY[0x24BDDB5D0]);
        objc_msgSend(v14, "matterDevice");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v22, "initWithDevice:endpoint:queue:", v23, (unsigned __int16)objc_msgSend(v14, "endpoint"), v16);

        objc_msgSend(v14, "characteristicDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "attributeID");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = &unk_250F3F450;
LABEL_12:

        objc_msgSend(v118, "clusterSelector");
        v113 = v24;
        if ((objc_opt_respondsToSelector() & 1) == 0
          || (objc_msgSend(v24, "methodSignatureForSelector:", objc_msgSend(v118, "clusterSelector")),
              (v115 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          v115 = 0;
LABEL_21:

          if (v115)
          {
            v36 = 0;
LABEL_110:

            goto LABEL_111;
          }
          v37 = (void *)MEMORY[0x242656984]();
          v38 = self;
          HMFGetOSLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector((SEL)objc_msgSend(v118, "clusterSelector"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v118, "clusterClass");
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v40;
            v136 = 2112;
            v137 = v41;
            v138 = 2112;
            v139 = v42;
            _os_log_impl(&dword_23E95B000, v39, OS_LOG_TYPE_ERROR, "%{public}@CHIP Accessory couldn't get signature for Selector:%@ on Cluster:%@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v37);
          v26 = 1;
LABEL_26:
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTRProtocolOperationErrorDomain"), v26, 0);
          v43 = objc_claimAutoreleasedReturnValue();
          v36 = (void *)v43;
          v115 = 0;
          if (v17 && v43)
          {
            -[HMMTRProtocolOperationManager _processResponseForOperation:responseValues:responseError:](self, "_processResponseForOperation:responseValues:responseError:", v14, 0, v43);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v17[2](v17, v114);
            v115 = 0;

          }
          goto LABEL_110;
        }
        objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "setSelector:", objc_msgSend(v118, "clusterSelector"));
        objc_initWeak(&location, self);
        v33 = objc_msgSend(v14, "type");
        if (v33 != 1 || (objc_msgSend(v14, "matterDevice"), (v25 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v34 = objc_msgSend(v14, "type");
          if (v33 == 1)
          {
            v35 = v34 == 3;

            if (!v35)
            {
LABEL_18:
              if (objc_msgSend(v14, "type") != 1)
              {
                v122[0] = MEMORY[0x24BDAC760];
                v122[1] = 3221225472;
                v122[2] = __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_2;
                v122[3] = &unk_250F20B90;
                objc_copyWeak(&v126, &location);
                v122[4] = self;
                v123 = v14;
                v125 = v17;
                v124 = v16;
                v109 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x242656B10](v122);
                v105 = (void *)MEMORY[0x242656B10](v109);

                objc_destroyWeak(&v126);
                goto LABEL_33;
              }
              v127[0] = MEMORY[0x24BDAC760];
              v127[1] = 3221225472;
              v127[2] = __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_83;
              v127[3] = &unk_250F229B0;
              v127[4] = self;
              v128 = v14;
              v130 = v17;
              v129 = v16;
              v105 = (void *)MEMORY[0x242656B10](v127);

LABEL_31:
              v109 = 0;
LABEL_33:
              v44 = v118;
              v103 = objc_alloc_init((Class)objc_msgSend(v118, "paramsClass"));
              objc_msgSend(v14, "value");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              v121 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
              objc_msgSend(v14, "matterDevice");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              if (v45)
              {
                v46 = objc_msgSend(v14, "type") == 4;

                v44 = v118;
                if (v46)
                {
                  v47 = objc_msgSend(v110, "setArgument:atIndex:", &v121, 2);
LABEL_49:
                  v102 = 0;
                  v104 = 0;
                  goto LABEL_79;
                }
              }
              objc_msgSend(v14, "matterDevice");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v48 || (v49 = objc_msgSend(v14, "type") == 1, v48, v44 = v118, !v49))
              {
                objc_msgSend(v14, "matterDevice");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                if (v59)
                {
                  v60 = objc_msgSend(v14, "type") == 2;

                  v44 = v118;
                  if (!v60)
                  {
                    context = (void *)MEMORY[0x242656984]();
                    v62 = self;
                    HMFGetOSLogHandle();
                    v63 = (id)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                    {
                      HMFGetLogIdentifier();
                      v64 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v14, "characteristic");
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v14, "type"));
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      *(_QWORD *)&buf[4] = v64;
                      v136 = 2112;
                      v137 = v65;
                      v138 = 2112;
                      v139 = (uint64_t)v66;
                      _os_log_impl(&dword_23E95B000, v63, OS_LOG_TYPE_ERROR, "%{public}@Unexpected operation for characteristic %@: %@ with MTRDevice, not building arguments", buf, 0x20u);

                    }
                    objc_autoreleasePoolPop(context);
                    goto LABEL_49;
                  }
                }
                if (objc_msgSend(v44, "paramsClass"))
                {
                  objc_msgSend(v14, "characteristic");
                  v61 = (id)objc_claimAutoreleasedReturnValue();
                  -[HMMTRProtocolOperationManager _addParamsToInvocation:paramsObject:completionHandlerArgument:characteristicDescriptor:forCharacteristic:](self, "_addParamsToInvocation:paramsObject:completionHandlerArgument:characteristicDescriptor:forCharacteristic:", v110, v103, v105, v44, v61);
                }
                else
                {
                  if (objc_msgSend(v14, "type") == 1 && v106)
                  {
                    objc_msgSend(v44, "mapValue");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    v68 = v67 == 0;

                    if (!v68)
                    {
                      objc_msgSend(v118, "mapValue");
                      v69 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v14, "value");
                      v70 = (void *)objc_claimAutoreleasedReturnValue();
                      ((void (**)(_QWORD, void *))v69)[2](v69, v70);
                      v71 = objc_claimAutoreleasedReturnValue();

                      v106 = (void *)v71;
                    }
                    v44 = v118;
                  }
                  objc_msgSend(v14, "characteristic");
                  v61 = (id)objc_claimAutoreleasedReturnValue();
                  -[HMMTRProtocolOperationManager _addArgumentsToInvocation:primaryArgument:completionHandlerArgument:characteristicDescriptor:forCharacteristic:](self, "_addArgumentsToInvocation:primaryArgument:completionHandlerArgument:characteristicDescriptor:forCharacteristic:", v110, v106, v105, v44, v61);
                }
                v102 = 0;
                v104 = 0;
LABEL_78:

LABEL_79:
                v81 = (void *)MEMORY[0x242656984](v47);
                contexta = self;
                HMFGetOSLogHandle();
                v82 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
                {
                  v101 = v81;
                  HMFGetLogIdentifier();
                  v83 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "characteristic");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v14, "type"));
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v14, "endpoint"));
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  *(_QWORD *)&buf[4] = v83;
                  v136 = 2112;
                  v137 = v84;
                  v138 = 2112;
                  v139 = (uint64_t)v85;
                  v140 = 2112;
                  v141 = v86;
                  _os_log_impl(&dword_23E95B000, v82, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory sending request for characteristic %@ of type %@ on endpoint %@", buf, 0x2Au);

                  v81 = v101;
                }

                objc_autoreleasePoolPop(v81);
                if (objc_msgSend(v14, "type") == 4
                  && ((objc_msgSend(v14, "matterDevice"), (v87 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
                    ? (v88 = v112 == 0)
                    : (v88 = 1),
                      v88 ? (v89 = 0) : (v89 = 1),
                      v87,
                      v89))
                {
                  v90 = [HMMTRDeviceReader alloc];
                  objc_msgSend(v14, "matterDevice");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v14, "endpoint"));
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  v93 = -[HMMTRDeviceReader initWithClientQueue:distributor:device:endpointID:clusterID:attributeID:](v90, "initWithClientQueue:distributor:device:endpointID:clusterID:attributeID:", v16, v117, v91, v92, v111, v112);

                  v119[0] = MEMORY[0x24BDAC760];
                  v119[1] = 3221225472;
                  v119[2] = __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_89;
                  v119[3] = &unk_250F20BB8;
                  v120 = v109;
                  -[HMMTRDeviceReader readAttributeWithCompletion:](v93, "readAttributeWithCompletion:", v119);

                }
                else
                {
                  objc_msgSend(v110, "invokeWithTarget:", v113);
                }
                objc_msgSend(v14, "matterDevice");
                v94 = (void *)objc_claimAutoreleasedReturnValue();

                if (v94)
                {
                  if (objc_msgSend(v14, "type") == 4 && !v112)
                  {
                    *(_QWORD *)buf = 0;
                    objc_msgSend(v110, "getReturnValue:", buf);
                    v95 = *(id *)buf;
                    if (v95)
                    {
                      v96 = 0;
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 1, 0);
                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    ((void (**)(_QWORD, id, void *))v109)[2](v109, v95, v96);

LABEL_107:
                    v100 = 0;
                    goto LABEL_108;
                  }
                  if (objc_msgSend(v14, "type") == 1)
                  {
                    v97 = objc_msgSend(v118, "syncWriteFunc") ^ 1;
                    if (!v17)
                      LOBYTE(v97) = 1;
                    if ((v97 & 1) == 0)
                    {
                      -[HMMTRProtocolOperationManager _processResponseForOperation:responseValues:responseError:](contexta, "_processResponseForOperation:responseValues:responseError:", v14, 0, 0);
                      v98 = (void *)objc_claimAutoreleasedReturnValue();
                      v17[2](v17, v98);

                    }
                    goto LABEL_107;
                  }
                }
                if (v17 && objc_msgSend(v14, "type") == 1)
                {
                  -[HMMTRProtocolOperationManager _processResponseForOperation:responseValues:responseError:](contexta, "_processResponseForOperation:responseValues:responseError:", v14, 0, 0);
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  v17[2](v17, v99);

                }
                v100 = 1;
LABEL_108:

                objc_destroyWeak(&location);
                if ((v100 & 1) == 0)
                {

                  v36 = 0;
                  goto LABEL_110;
                }
                goto LABEL_21;
              }
              objc_msgSend(v118, "mapWriteValueToExpectedValues");
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              if (v50)
              {
                objc_msgSend(v118, "mapWriteValueToExpectedValues");
                v51 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                v52 = objc_msgSend(v14, "endpoint");
                objc_msgSend(v14, "value");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, uint64_t, void *))v51)[2](v51, v52, v53);
                v104 = (void *)objc_claimAutoreleasedReturnValue();

                v54 = (id)objc_msgSend(v104, "count");
                v55 = v118;
                if (!v54)
                  goto LABEL_60;
                objc_msgSend(v104, "objectAtIndexedSubscript:", 0);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "objectForKeyedSubscript:", *MEMORY[0x24BDDB460]);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = v57 == 0;

                if (v58)
                {
                  v54 = 0;
                }
                else
                {
                  v54 = v104;
                  v104 = v54;
                }
              }
              else
              {
                v54 = 0;
                v104 = 0;
              }
              v55 = v118;
LABEL_60:
              v72 = &unk_250F3F420;
              v102 = v54;
              if (!v54)
                v72 = 0;
              v61 = v72;
              if (objc_msgSend(v55, "paramsClass"))
              {
                objc_msgSend(v14, "characteristic");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMMTRProtocolOperationManager _addParamsToInvocation:paramsObject:expectedValues:expectedValueInterval:completionHandlerArgument:characteristicDescriptor:forCharacteristic:](self, "_addParamsToInvocation:paramsObject:expectedValues:expectedValueInterval:completionHandlerArgument:characteristicDescriptor:forCharacteristic:", v110, v103, v102, v61, v105, v55, v73);
LABEL_77:

                goto LABEL_78;
              }
              if (!v106)
              {
                v106 = 0;
                goto LABEL_73;
              }
              if (objc_msgSend(v55, "syncWriteFunc") && objc_msgSend(v104, "count") == 1)
              {
                objc_msgSend(v104, "objectAtIndexedSubscript:", 0);
                v74 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
                v75 = objc_claimAutoreleasedReturnValue();
                v76 = v106;
              }
              else
              {
                objc_msgSend(v55, "mapValue");
                v77 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v77)
                {
LABEL_71:
                  v55 = v118;
LABEL_73:
                  v78 = objc_msgSend(v55, "syncWriteFunc");
                  objc_msgSend(v14, "characteristic");
                  v79 = objc_claimAutoreleasedReturnValue();
                  v73 = (void *)v79;
                  if (v78)
                    v80 = 0;
                  else
                    v80 = v105;
                  -[HMMTRProtocolOperationManager _addArgumentsToInvocation:primaryArgument:expectedValues:expectedValueInterval:completionHandlerArgument:characteristicDescriptor:forCharacteristic:](self, "_addArgumentsToInvocation:primaryArgument:expectedValues:expectedValueInterval:completionHandlerArgument:characteristicDescriptor:forCharacteristic:", v110, v106, v102, v61, v80, v55, v79);
                  goto LABEL_77;
                }
                objc_msgSend(v118, "mapValue");
                v74 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "value");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, void *))v74)[2](v74, v76);
                v75 = objc_claimAutoreleasedReturnValue();

              }
              v106 = (void *)v75;
              goto LABEL_71;
            }
          }
          else if (v34 != 3)
          {
            goto LABEL_18;
          }
        }
        v131[0] = MEMORY[0x24BDAC760];
        v131[1] = 3221225472;
        v131[2] = __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke;
        v131[3] = &unk_250F20B68;
        objc_copyWeak(&v133, &location);
        v131[4] = self;
        v132 = v14;
        v105 = (void *)MEMORY[0x242656B10](v131);

        objc_destroyWeak(&v133);
        goto LABEL_31;
      }
      v31 = objc_alloc(MEMORY[0x24BDDB560]);
      objc_msgSend(v14, "device");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v31, "initWithDevice:endpoint:queue:", v25, (unsigned __int16)objc_msgSend(v14, "endpoint"), v16);
    }
    else
    {
      v27 = objc_alloc((Class)objc_msgSend(v118, "clusterClass"));
      if (v21)
      {
        objc_msgSend(v14, "matterDevice");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v14, "endpoint"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v27, "initWithDevice:endpointID:queue:", v28, v29, v16);

        objc_msgSend(v14, "characteristicDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "clusterID");
        v111 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "characteristicDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "attributeID");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      objc_msgSend(v14, "device");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v14, "endpoint"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v27, "initWithDevice:endpointID:queue:", v25, v32, v16);

    }
    v111 = 0;
    v112 = 0;
    goto LABEL_12;
  }
LABEL_111:

}

- (id)_processResponseForOperation:(id)a3 responseValues:(id)a4 responseError:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMMTRProtocolOperationManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  switch(objc_msgSend(v8, "type"))
  {
    case 0:
    case 4:
      -[HMMTRProtocolOperationManager _processReadResponseForOperation:readResponseValues:readResponseError:](self, "_processReadResponseForOperation:readResponseValues:readResponseError:", v8, v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1:
      -[HMMTRProtocolOperationManager _processWriteResponseForOperation:writeResponseValues:writeResponseError:](self, "_processWriteResponseForOperation:writeResponseValues:writeResponseError:", v8, v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
    case 3:
      objc_msgSend(v8, "characteristic");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (void *)MEMORY[0x242656984]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "characteristic");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138543618;
          v25 = v16;
          v26 = 2112;
          v27 = v17;
          _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@Creating a copy for characteristic before modifying it %@", (uint8_t *)&v24, 0x16u);

        }
        objc_autoreleasePoolPop(v13);
        objc_msgSend(v8, "characteristic");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "copy");

        objc_msgSend(v8, "characteristic");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "service");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setService:", v21);

        objc_msgSend(v8, "setCharacteristic:", v19);
      }
      -[HMMTRProtocolOperationManager _processGenericResponseForOperation:responseValues:responseError:](self, "_processGenericResponseForOperation:responseValues:responseError:", v8, v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v22 = (void *)v11;
      break;
    default:
      v22 = 0;
      break;
  }

  return v22;
}

- (id)_processGenericResponseForOperation:(id)a3 responseValues:(id)a4 responseError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMMTRProtocolOperationManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v14;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory received response. Error: %@ Response %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMMTRProtocolOperationManager _responseTupleWithMappedValueForOperation:responseValue:responseError:](v12, "_responseTupleWithMappedValueForOperation:responseValue:responseError:", v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_processWriteResponseForOperation:(id)a3 writeResponseValues:(id)a4 writeResponseError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMMTRProtocolOperationManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "characteristic");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "instanceID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138544130;
    v27 = v14;
    v28 = 2112;
    v29 = v16;
    v30 = 2112;
    v31 = v17;
    v32 = 2112;
    v33 = v10;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory received write response for characteristic %@. Targeted value: %@\nError: %@", (uint8_t *)&v26, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  if (v10)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v10, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, objc_msgSend(v10, "code"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "characteristic");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setValue:", v19);

    v20 = 0;
  }

  v22 = (void *)MEMORY[0x24BE1BA20];
  objc_msgSend(v8, "characteristic");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "responseTupleForCharacteristic:error:", v23, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_responseTupleWithMappedValueForOperation:(id)a3 responseValue:(id)a4 responseError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  void *v20;
  HMMTRProtocolOperationManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "characteristic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v10, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, objc_msgSend(v10, "code"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v9)
    {
      objc_msgSend(v8, "characteristicDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mapValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v8, "characteristicDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "mapValue");
        v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id))v18)[2](v18, v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setValue:", v19);

        v20 = (void *)MEMORY[0x242656984]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "value");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "instanceID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138544130;
          v29 = v23;
          v30 = 2112;
          v31 = v9;
          v32 = 2112;
          v33 = v24;
          v34 = 2112;
          v35 = v25;
          _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_INFO, "%{public}@Mapped value from dictionary %@ to %@ for instanceID %@.", (uint8_t *)&v28, 0x2Au);

        }
        objc_autoreleasePoolPop(v20);
      }
      else
      {
        objc_msgSend(v11, "setValue:", v9);
      }
    }
    v14 = 0;
  }
  objc_msgSend(MEMORY[0x24BE1BA20], "responseTupleForCharacteristic:error:", v11, v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (void)_queryColorModeFromClusterAtCHIPEndpoint:(id)a3 device:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMTRProtocolOperationManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMMTRProtocolOperationManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v17;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Querying endpoint %@ for colorMode", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  v18 = (void *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("MTRBaseClusterColorControl"))), "initWithDevice:endpoint:queue:", v11, (unsigned __int16)objc_msgSend(v10, "unsignedIntegerValue"), v12);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __113__HMMTRProtocolOperationManager__queryColorModeFromClusterAtCHIPEndpoint_device_callbackQueue_completionHandler___block_invoke;
    v24[3] = &unk_250F24150;
    v24[4] = v15;
    v25 = v10;
    v26 = v13;
    objc_msgSend(v18, "readAttributeColorModeWithCompletionHandler:", v24);

  }
  else
  {
    v19 = (void *)MEMORY[0x242656984]();
    v20 = v15;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v22;
      v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_ERROR, "%{public}@colorMode selector not found for cluster: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v23);

  }
}

- (id)_processReadResponseForOperation:(id)a3 readResponseValues:(id)a4 readResponseError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMMTRProtocolOperationManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  HMMTRProtocolOperationManager *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "characteristic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x242656984]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "instanceID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138544130;
    v25 = v15;
    v26 = 2112;
    v27 = v16;
    v28 = 2112;
    v29 = v9;
    v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@Processing read response for characteristic %@. Value: %@ Error: %@", (uint8_t *)&v24, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  if (objc_msgSend(v10, "code") == 2)
  {
    v17 = (void *)MEMORY[0x242656984]();
    v18 = v13;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v20;
      v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Could not find description for characteristic %@, falling back to localized version", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BE1BA20], "responseTupleForCharacteristic:error:", v11, 0);
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMMTRProtocolOperationManager _responseTupleWithMappedValueForOperation:responseValue:responseError:](v13, "_responseTupleWithMappedValueForOperation:responseValue:responseError:", v8, v9, v10);
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v21;

  return v22;
}

- (void)_addParamsToInvocation:(id)a3 paramsObject:(id)a4 completionHandlerArgument:(id)a5 characteristicDescriptor:(id)a6 forCharacteristic:(id)a7
{
  id v12;
  HMMTRProtocolOperationManager *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t i;
  NSString *v18;
  SEL v19;
  void *v20;
  void *v21;
  HMMTRProtocolOperationManager *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  HMMTRProtocolOperationManager *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  HMMTRProtocolOperationManager *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  HMMTRProtocolOperationManager *v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  NSString *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v12 = a4;
  v13 = self;
  v14 = v12;
  v56 = v12;
  v55 = a5;
  v15 = a6;
  v45 = a7;
  objc_msgSend(v15, "paramsIndex");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v16, "integerValue");

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v15, "paramsArguments");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v52;
    v46 = v14;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v52 != v48)
          objc_enumerationMutation(obj);
        v18 = *(NSString **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v19 = NSSelectorFromString(v18);
        objc_msgSend(v15, "paramsArguments");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", v18);
        v50 = (id)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v50, "isEqualToString:", CFSTR("NULL")))
        {
          v21 = (void *)MEMORY[0x242656984]();
          v22 = v13;
          HMFGetOSLogHandle();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v58 = v24;
            _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_INFO, "%{public}@NULL argument requested, setting arg to nil.", buf, 0xCu);

            v14 = v46;
          }

          objc_autoreleasePoolPop(v21);
          v25 = v50;
          v50 = 0;

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v14, "methodSignatureForSelector:", v19);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setSelector:", v19);
            objc_msgSend(v27, "setArgument:atIndex:", &v50, 2);
            objc_msgSend(v27, "invokeWithTarget:", v14);

          }
          else
          {
            v34 = (void *)MEMORY[0x242656984]();
            v35 = v13;
            HMFGetOSLogHandle();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v15, "paramsClass");
              objc_msgSend(v45, "instanceID");
              v44 = v34;
              v39 = v13;
              v40 = v15;
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v58 = v37;
              v59 = 2112;
              v60 = v18;
              v61 = 2112;
              v62 = v38;
              v14 = v46;
              v63 = 2112;
              v64 = v41;
              _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_ERROR, "%{public}@Couldn't get Signature for Property %@ for Params of type %@ for characteristic %@", buf, 0x2Au);

              v15 = v40;
              v13 = v39;
              v34 = v44;

            }
            objc_autoreleasePoolPop(v34);
          }

        }
        else
        {
          v28 = (void *)MEMORY[0x242656984]();
          v29 = v13;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v15, "paramsClass");
            objc_msgSend(v45, "instanceID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v58 = v31;
            v59 = 2112;
            v60 = v18;
            v61 = 2112;
            v62 = v32;
            v14 = v46;
            v63 = 2112;
            v64 = v33;
            _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to set Property %@ for Params of type %@ for characteristic %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v28);
        }

      }
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
    }
    while (v49);
  }

  objc_msgSend(v43, "setArgument:atIndex:", &v56, v42 + 2);
  objc_msgSend(v43, "setArgument:atIndex:", &v55, v42 + 3);

}

- (void)_addParamsToInvocation:(id)a3 paramsObject:(id)a4 expectedValues:(id)a5 expectedValueInterval:(id)a6 completionHandlerArgument:(id)a7 characteristicDescriptor:(id)a8 forCharacteristic:(id)a9
{
  id v15;
  id v16;
  HMMTRProtocolOperationManager *v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  NSString *v21;
  SEL v22;
  void *v23;
  void *v24;
  HMMTRProtocolOperationManager *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  HMMTRProtocolOperationManager *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  HMMTRProtocolOperationManager *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  HMMTRProtocolOperationManager *v45;
  id v46;
  id v47;
  uint64_t v48;
  id obj;
  uint64_t v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  NSString *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  v15 = a4;
  v59 = v15;
  v58 = a5;
  v57 = a6;
  v56 = a7;
  v16 = a8;
  v17 = self;
  v46 = a9;
  objc_msgSend(v16, "paramsIndex");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v18, "integerValue");

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(v16, "paramsArguments");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
  if (v50)
  {
    v19 = *(_QWORD *)v53;
    v47 = v16;
    v48 = *(_QWORD *)v53;
    v45 = v17;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v53 != v19)
          objc_enumerationMutation(obj);
        v21 = *(NSString **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v22 = NSSelectorFromString(v21);
        objc_msgSend(v16, "paramsArguments");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKey:", v21);
        v51 = (id)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v51, "isEqualToString:", CFSTR("NULL")))
        {
          v24 = (void *)MEMORY[0x242656984]();
          v25 = v17;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v61 = v27;
            _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_INFO, "%{public}@NULL argument requested, setting arg to nil.", buf, 0xCu);

            v19 = v48;
          }

          objc_autoreleasePoolPop(v24);
          v28 = v51;
          v51 = 0;

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v15, "methodSignatureForSelector:", v22);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setSelector:", v22);
            objc_msgSend(v30, "setArgument:atIndex:", &v51, 2);
            objc_msgSend(v30, "invokeWithTarget:", v15);

            v16 = v47;
          }
          else
          {
            v37 = (void *)MEMORY[0x242656984]();
            v38 = v17;
            HMFGetOSLogHandle();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v16, "paramsClass");
              objc_msgSend(v46, "instanceID");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v61 = v40;
              v62 = 2112;
              v63 = v21;
              v64 = 2112;
              v65 = v41;
              v19 = v48;
              v66 = 2112;
              v67 = v42;
              _os_log_impl(&dword_23E95B000, v39, OS_LOG_TYPE_ERROR, "%{public}@Couldn't get Signature for Property %@ for Params of type %@ for characteristic %@", buf, 0x2Au);

              v16 = v47;
              v17 = v45;
            }

            objc_autoreleasePoolPop(v37);
          }

        }
        else
        {
          v31 = (void *)MEMORY[0x242656984]();
          v32 = v17;
          HMFGetOSLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v16, "paramsClass");
            objc_msgSend(v46, "instanceID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v61 = v34;
            v62 = 2112;
            v63 = v21;
            v64 = 2112;
            v65 = v35;
            v19 = v48;
            v66 = 2112;
            v67 = v36;
            _os_log_impl(&dword_23E95B000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to set Property %@ for Params of type %@ for characteristic %@", buf, 0x2Au);

            v17 = v45;
          }

          objc_autoreleasePoolPop(v31);
        }

      }
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
    }
    while (v50);
  }

  objc_msgSend(v44, "setArgument:atIndex:", &v59, v43 + 2);
  objc_msgSend(v44, "setArgument:atIndex:", &v58, v43 + 3);
  objc_msgSend(v44, "setArgument:atIndex:", &v57, v43 + 4);
  objc_msgSend(v44, "setArgument:atIndex:", &v56, v43 + 5);

}

- (void)_addArgumentsToInvocation:(id)a3 primaryArgument:(id)a4 completionHandlerArgument:(id)a5 characteristicDescriptor:(id)a6 forCharacteristic:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  HMMTRProtocolOperationManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMMTRProtocolOperationManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unsigned int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  HMMTRProtocolOperationManager *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  HMMTRProtocolOperationManager *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  HMMTRProtocolOperationManager *v43;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  uint64_t v54;
  uint64_t v56;
  void *v57;
  HMMTRProtocolOperationManager *v58;
  NSObject *v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  HMMTRProtocolOperationManager *v64;
  NSObject *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  id obj;
  HMMTRProtocolOperationManager *v76;
  uint64_t v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  id v84;
  uint8_t v85[128];
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v72 = a3;
  v84 = a4;
  v12 = a5;
  v83 = v12;
  v13 = a6;
  v73 = a7;
  +[HMMTRHAPService chipPluginServiceForCharacteristic:](HMMTRHAPService, "chipPluginServiceForCharacteristic:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v15 = (void *)MEMORY[0x242656984]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v87 = v18;
      _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_ERROR, "%{public}@Trying send a message for a characteristic that does not belong to a service owned by HomeKitMatter", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }
  v19 = (void *)MEMORY[0x242656984]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector((SEL)objc_msgSend(v72, "selector"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endpoint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v87 = v22;
    v88 = 2112;
    v89 = v73;
    v90 = 2112;
    v91 = v23;
    v92 = 2112;
    v93 = v24;
    _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_INFO, "%{public}@Constructing arguments for invocation for characteristic: %@, selector: %@, endpoint: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v19);
  objc_msgSend(v13, "arguments");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "primaryArgIndex");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v12)
    v27 = 2;
  else
    v27 = 1;
  v28 = (void *)v26;
  if (v26)
    v29 = v27;
  else
    v29 = v12 != 0;
  v74 = v25;
  if (objc_msgSend(v25, "count"))
    v29 = v29 + objc_msgSend(v25, "count");
  v30 = v72;
  v31 = (void *)MEMORY[0x242656984]();
  v32 = v20;
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  v76 = v32;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v29);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v87 = v34;
    v88 = 2112;
    v89 = v73;
    v90 = 2112;
    v91 = v35;
    _os_log_impl(&dword_23E95B000, v33, OS_LOG_TYPE_INFO, "%{public}@Characteristic (%@), numberOfArguments = %@", buf, 0x20u);

    v32 = v76;
  }

  objc_autoreleasePoolPop(v31);
  if (v12)
  {
    v77 = (int)v29 - 1;
    v36 = (void *)MEMORY[0x242656984](objc_msgSend(v72, "setArgument:atIndex:", &v83, v77 + 2));
    v37 = v32;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v77 + 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v87 = v39;
      v88 = 2112;
      v89 = v73;
      v90 = 2112;
      v91 = v40;
      _os_log_impl(&dword_23E95B000, v38, OS_LOG_TYPE_INFO, "%{public}@Characteristic (%@), Added completion handler at index %@", buf, 0x20u);

      v32 = v76;
    }

    objc_autoreleasePoolPop(v36);
  }
  else
  {
    v77 = -1;
  }
  v70 = v14;
  v71 = v13;
  v69 = v28;
  if (v28)
  {
    v41 = objc_msgSend(v28, "integerValue");
    v42 = (void *)MEMORY[0x242656984](objc_msgSend(v72, "setArgument:atIndex:", &v84, v41 + 2));
    v43 = v32;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v84;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v41 + 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v87 = v45;
      v88 = 2112;
      v89 = v73;
      v90 = 2112;
      v91 = v46;
      v92 = 2112;
      v93 = v47;
      _os_log_impl(&dword_23E95B000, v44, OS_LOG_TYPE_INFO, "%{public}@Characteristic (%@), Added primary argument %@ at index %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v42);
  }
  else
  {
    v41 = -1;
  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v48 = v74;
  objc_msgSend(v74, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v80 != v51)
          objc_enumerationMutation(obj);
        v53 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        v54 = objc_msgSend(v53, "integerValue");
        if (v54 != v77 && v54 != v41)
        {
          v56 = v54;
          objc_msgSend(v48, "objectForKey:", v53);
          v78 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v78, "isEqualToString:", CFSTR("NULL")))
          {
            v57 = (void *)MEMORY[0x242656984]();
            v58 = v76;
            HMFGetOSLogHandle();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v87 = v60;
              _os_log_impl(&dword_23E95B000, v59, OS_LOG_TYPE_INFO, "%{public}@NULL argument requested, setting arg to nil.", buf, 0xCu);

              v48 = v74;
            }

            objc_autoreleasePoolPop(v57);
            v61 = v78;
            v78 = 0;

          }
          v62 = v56 + 2;
          v63 = (void *)MEMORY[0x242656984](objc_msgSend(v30, "setArgument:atIndex:", &v78, v56 + 2));
          v64 = v76;
          HMFGetOSLogHandle();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = v78;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v62);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v87 = v66;
            v88 = 2112;
            v89 = v73;
            v90 = 2112;
            v91 = v67;
            v30 = v72;
            v92 = 2112;
            v93 = v68;
            _os_log_impl(&dword_23E95B000, v65, OS_LOG_TYPE_INFO, "%{public}@Characteristic (%@), Added default argument %@ at index %@", buf, 0x2Au);

            v48 = v74;
          }

          objc_autoreleasePoolPop(v63);
        }
      }
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
    }
    while (v50);
  }

}

- (void)_addArgumentsToInvocation:(id)a3 primaryArgument:(id)a4 expectedValues:(id)a5 expectedValueInterval:(id)a6 completionHandlerArgument:(id)a7 characteristicDescriptor:(id)a8 forCharacteristic:(id)a9
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  HMMTRProtocolOperationManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMMTRProtocolOperationManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unsigned int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  HMMTRProtocolOperationManager *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  HMMTRProtocolOperationManager *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  HMMTRProtocolOperationManager *v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  uint64_t v59;
  uint64_t v61;
  void *v62;
  HMMTRProtocolOperationManager *v63;
  NSObject *v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  HMMTRProtocolOperationManager *v69;
  NSObject *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  id obj;
  HMMTRProtocolOperationManager *v81;
  uint64_t v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  id v89;
  id v90;
  id v91;
  uint8_t v92[128];
  uint8_t buf[4];
  void *v94;
  __int16 v95;
  id v96;
  __int16 v97;
  id v98;
  __int16 v99;
  void *v100;
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v77 = a3;
  v91 = a4;
  v90 = a5;
  v89 = a6;
  v15 = a7;
  v88 = v15;
  v16 = a8;
  v78 = a9;
  +[HMMTRHAPService chipPluginServiceForCharacteristic:](HMMTRHAPService, "chipPluginServiceForCharacteristic:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v18 = (void *)MEMORY[0x242656984]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v94 = v21;
      _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_ERROR, "%{public}@Trying send a message for a characteristic that does not belong to a service owned by HomeKitMatter", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
  }
  v22 = (void *)MEMORY[0x242656984]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector((SEL)objc_msgSend(v77, "selector"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "endpoint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v94 = v25;
    v95 = 2112;
    v96 = v78;
    v97 = 2112;
    v98 = v26;
    v99 = 2112;
    v100 = v27;
    _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_INFO, "%{public}@Constructing arguments for invocation for characteristic: %@, selector: %@, endpoint: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v22);
  objc_msgSend(v16, "arguments");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "primaryArgIndex");
  v29 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "syncWriteFunc"))
    v30 = 1;
  else
    v30 = 2;
  v31 = (void *)v29;
  if (v29)
    ++v30;
  if (v15)
    v32 = v30 + 1;
  else
    v32 = v30;
  v33 = v77;
  v79 = v28;
  if (objc_msgSend(v28, "count"))
    v32 = v32 + objc_msgSend(v28, "count");
  v34 = (void *)MEMORY[0x242656984]();
  v35 = v23;
  HMFGetOSLogHandle();
  v36 = objc_claimAutoreleasedReturnValue();
  v81 = v35;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v32);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v94 = v37;
    v95 = 2112;
    v96 = v78;
    v97 = 2112;
    v98 = v38;
    _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_INFO, "%{public}@Characteristic (%@), numberOfArguments = %@", buf, 0x20u);

    v35 = v81;
  }

  objc_autoreleasePoolPop(v34);
  if (v15)
  {
    v39 = (int)v32 - 1;
    v40 = (int)v32 + 1;
    v41 = (void *)MEMORY[0x242656984](objc_msgSend(v77, "setArgument:atIndex:", &v88, v40));
    v42 = v35;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v40);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v94 = v44;
      v95 = 2112;
      v96 = v78;
      v97 = 2112;
      v98 = v45;
      _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_INFO, "%{public}@Characteristic (%@), Added completion handler at index %@", buf, 0x20u);

      v35 = v81;
    }

    objc_autoreleasePoolPop(v41);
  }
  else
  {
    v39 = (int)v32;
  }
  objc_msgSend(v77, "setArgument:atIndex:", &v89, v39 + 1);
  if ((objc_msgSend(v16, "syncWriteFunc") & 1) != 0)
  {
    v82 = v39 - 1;
  }
  else
  {
    v82 = v39 - 2;
    objc_msgSend(v77, "setArgument:atIndex:", &v90, v39);
  }
  v75 = v17;
  v76 = v16;
  v74 = v31;
  if (v31)
  {
    v46 = objc_msgSend(v31, "integerValue");
    v47 = (void *)MEMORY[0x242656984](objc_msgSend(v77, "setArgument:atIndex:", &v91, v46 + 2));
    v48 = v35;
    HMFGetOSLogHandle();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v91;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v46 + 2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v94 = v50;
      v95 = 2112;
      v96 = v78;
      v97 = 2112;
      v98 = v51;
      v99 = 2112;
      v100 = v52;
      _os_log_impl(&dword_23E95B000, v49, OS_LOG_TYPE_INFO, "%{public}@Characteristic (%@), Added primary argument %@ at index %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v47);
  }
  else
  {
    v46 = -1;
  }
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v53 = v79;
  objc_msgSend(v79, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v55; ++i)
      {
        if (*(_QWORD *)v85 != v56)
          objc_enumerationMutation(obj);
        v58 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        v59 = objc_msgSend(v58, "integerValue");
        if (v59 != v82 && v59 != v46)
        {
          v61 = v59;
          objc_msgSend(v53, "objectForKey:", v58);
          v83 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v83, "isEqualToString:", CFSTR("NULL")))
          {
            v62 = (void *)MEMORY[0x242656984]();
            v63 = v81;
            HMFGetOSLogHandle();
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v94 = v65;
              _os_log_impl(&dword_23E95B000, v64, OS_LOG_TYPE_INFO, "%{public}@NULL argument requested, setting arg to nil.", buf, 0xCu);

              v53 = v79;
            }

            objc_autoreleasePoolPop(v62);
            v66 = v83;
            v83 = 0;

          }
          v67 = v61 + 2;
          v68 = (void *)MEMORY[0x242656984](objc_msgSend(v33, "setArgument:atIndex:", &v83, v61 + 2));
          v69 = v81;
          HMFGetOSLogHandle();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = v83;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v67);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v94 = v71;
            v95 = 2112;
            v96 = v78;
            v97 = 2112;
            v98 = v72;
            v33 = v77;
            v99 = 2112;
            v100 = v73;
            _os_log_impl(&dword_23E95B000, v70, OS_LOG_TYPE_INFO, "%{public}@Characteristic (%@), Added default argument %@ at index %@", buf, 0x2Au);

            v53 = v79;
          }

          objc_autoreleasePoolPop(v68);
        }
      }
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
    }
    while (v55);
  }

}

void __113__HMMTRProtocolOperationManager__queryColorModeFromClusterAtCHIPEndpoint_device_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Read colorMode on endpoint %@. colorMode: %@", (uint8_t *)&v15, 0x20u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138543874;
    v16 = v13;
    v17 = 2112;
    v18 = v14;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error reading colorMode on endpoint %@, Error: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (void *)MEMORY[0x242656984]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory received response. Error: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (WeakRetained)
    v9 = (id)objc_msgSend(WeakRetained, "_processResponseForOperation:responseValues:responseError:", *(_QWORD *)(a1 + 40), 0, v3);

}

void __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v7;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory received response. Error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "_processResponseForOperation:responseValues:responseError:", *(_QWORD *)(a1 + 40), 0, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 56);
  if (v9)
  {
    v10 = *(NSObject **)(a1 + 48);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_84;
    v11[3] = &unk_250F22768;
    v13 = v9;
    v12 = v8;
    dispatch_async(v10, v11);

  }
}

void __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v8 = (void *)MEMORY[0x242656984]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v11;
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@CHIP Accessory received response. Values: %@ Error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_processResponseForOperation:responseValues:responseError:", *(_QWORD *)(a1 + 40), v5, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 56);
    if (v13)
    {
      v14 = *(NSObject **)(a1 + 48);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_85;
      v15[3] = &unk_250F22768;
      v17 = v13;
      v16 = v12;
      dispatch_async(v14, v15);

    }
  }

}

void __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_89(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE1B690], 8, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_85(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_84(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __126__HMMTRProtocolOperationManager_handleLockTargetStateWriteWithOperation_accessoryServer_clientQueue_operationResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_processWriteResponseForOperation:writeResponseValues:writeResponseError:", *(_QWORD *)(a1 + 40), 0, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

void __126__HMMTRProtocolOperationManager_handleLockTargetStateWriteWithOperation_accessoryServer_clientQueue_operationResponseHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_processWriteResponseForOperation:writeResponseValues:writeResponseError:", *(_QWORD *)(a1 + 40), 0, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

void __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v26[0] = *MEMORY[0x24BDDB460];
  v2 = (void *)MEMORY[0x24BDDB538];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "endpoint"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributePathWithEndpointID:clusterID:attributeID:", v3, &unk_250F3F3D8, &unk_250F3F3F0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v4;
  v26[1] = *MEMORY[0x24BDDB478];
  v5 = *MEMORY[0x24BDDB510];
  v6 = *MEMORY[0x24BDDB518];
  v24[0] = *MEMORY[0x24BDDB500];
  v24[1] = v6;
  v25[0] = v5;
  v25[1] = &unk_250F3F408;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x242656984]();
  v11 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "endpoint"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x242656B10](*(_QWORD *)(a1 + 48));
    v16 = 138544130;
    v17 = v13;
    v18 = 2112;
    v19 = &unk_250F3F408;
    v20 = 2112;
    v21 = v14;
    v22 = 2112;
    v23 = v15;
    _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Faking a color temperature attribute report %@ on endpoint %@ upon hue/sat command invocation, updatedAttributesHandler %@", (uint8_t *)&v16, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_68(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_processWriteResponseForOperation:writeResponseValues:writeResponseError:", *(_QWORD *)(a1 + 40), 0, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = v4;
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
    v4 = v6;
  }
  if (!a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v4 = v6;
  }

}

void __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_70(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_processWriteResponseForOperation:writeResponseValues:writeResponseError:", *(_QWORD *)(a1 + 40), 0, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = v4;
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
    v4 = v6;
  }
  if (!a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v4 = v6;
  }

}

void __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_73(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_processWriteResponseForOperation:writeResponseValues:writeResponseError:", *(_QWORD *)(a1 + 40), 0, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = v4;
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
    v4 = v6;
  }
  if (!a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v4 = v6;
  }

}

void __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_75(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_processWriteResponseForOperation:writeResponseValues:writeResponseError:", *(_QWORD *)(a1 + 40), 0, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = v4;
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
    v4 = v6;
  }
  if (!a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v4 = v6;
  }

}

void __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_76(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_processWriteResponseForOperation:writeResponseValues:writeResponseError:", *(_QWORD *)(a1 + 40), 0, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = v4;
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
    v4 = v6;
  }
  if (!a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v4 = v6;
  }

}

void __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_77(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_processWriteResponseForOperation:writeResponseValues:writeResponseError:", *(_QWORD *)(a1 + 40), 0, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = v4;
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
    v4 = v6;
  }
  if (!a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v4 = v6;
  }

}

void __109__HMMTRProtocolOperationManager_handleIdentifyDeviceWriteWithOperation_clientQueue_operationResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_processWriteResponseForOperation:writeResponseValues:writeResponseError:", *(_QWORD *)(a1 + 40), 0, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

+ (HMMTRProtocolOperationManager)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2060);
  return (HMMTRProtocolOperationManager *)(id)sharedInstance_manager;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t52 != -1)
    dispatch_once(&logCategory__hmf_once_t52, &__block_literal_global_99);
  return (id)logCategory__hmf_once_v53;
}

void __44__HMMTRProtocolOperationManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v53;
  logCategory__hmf_once_v53 = v0;

}

void __47__HMMTRProtocolOperationManager_sharedInstance__block_invoke()
{
  HMMTRProtocolOperationManager *v0;
  void *v1;

  v0 = objc_alloc_init(HMMTRProtocolOperationManager);
  v1 = (void *)sharedInstance_manager;
  sharedInstance_manager = (uint64_t)v0;

}

@end
