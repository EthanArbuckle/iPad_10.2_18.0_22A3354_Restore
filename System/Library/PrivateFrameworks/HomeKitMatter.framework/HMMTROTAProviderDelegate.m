@implementation HMMTROTAProviderDelegate

- (HMMTROTAProviderDelegate)initWithQueue:(id)a3 browser:(id)a4
{
  id v7;
  id v8;
  HMMTROTAProviderDelegate *v9;
  HMMTROTAProviderDelegate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTROTAProviderDelegate;
  v9 = -[HMMTROTAProviderDelegate init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientQueue, a3);
    objc_storeWeak((id *)&v10->_browser, v8);
  }

  return v10;
}

- (void)handleQueryImageForNodeID:(id)a3 controller:(id)a4 params:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HMMTROTAProviderDelegate *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  HMMTROTAProviderDelegate *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  HMMTROTAProviderDelegate *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  HMMTROTAProviderDelegate *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  HMMTRSoftwareUpdateProviderQueryImageRequestParams *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  HMMTRSoftwareUpdateProviderQueryImageRequestParams *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  HMMTROTAProviderDelegate *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  HMMTROTAProviderDelegate *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void (*v78)(void);
  void *v79;
  HMMTROTAProviderDelegate *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  HMMTROTAProviderDelegate *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  id *locationa;
  id *location;
  void *v96;
  id WeakRetained;
  HMMTROTAProviderDelegate *v98;
  HMMTROTAProviderDelegate *v99;
  HMMTROTAProviderDelegate *v100;
  id v101;
  void *v102;
  id v103;
  id v104;
  id v105;
  _QWORD v106[5];
  id v107;
  id v108;
  id v109;
  id v110;
  _QWORD v111[4];
  id v112;
  uint8_t buf[4];
  void *v114;
  __int16 v115;
  id v116;
  __int16 v117;
  void *v118;
  __int16 v119;
  void *v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  id v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  void *v132;
  __int16 v133;
  void *v134;
  uint64_t v135;

  v135 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v103 = a4;
  v11 = a5;
  v105 = a6;
  v12 = objc_alloc_init(MEMORY[0x24BDDB7A8]);
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "protocolsSupported");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v111[0] = MEMORY[0x24BDAC760];
  v111[1] = 3221225472;
  v111[2] = __83__HMMTROTAProviderDelegate_handleQueryImageForNodeID_controller_params_completion___block_invoke;
  v111[3] = &unk_250F20E68;
  v104 = v13;
  v112 = v104;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v111);

  v15 = (void *)MEMORY[0x242656984]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "vendorID");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "productID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "softwareVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "protocolsSupported");
    locationa = (id *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(locationa, "count");
    objc_msgSend(v11, "hardwareVersion");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "location");
    v98 = v16;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestorCanConsent");
    v96 = v15;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metadataForProvider");
    v101 = v12;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545922;
    v114 = v93;
    v115 = 2112;
    v116 = v10;
    v117 = 2112;
    v118 = v92;
    v119 = 2112;
    v120 = v18;
    v121 = 2112;
    v122 = v19;
    v123 = 2048;
    v124 = v91;
    v125 = 2112;
    v126 = v104;
    v127 = 2112;
    v128 = v90;
    v129 = 2112;
    v130 = v20;
    v131 = 2112;
    v132 = v21;
    v133 = 2112;
    v134 = v22;
    _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Processing QueryImage command { nodeID = %@, vendorId = %@, productId = %@, softwareVersion = %@, protocolsSupported size = %lu, protocols[%@], hardwareVersion = %@, location = %@, requestorCanConsent = %@, metadataForProvider = %@ }", buf, 0x70u);

    v12 = v101;
    v15 = v96;

    v16 = v98;
  }

  objc_autoreleasePoolPop(v15);
  objc_msgSend(v11, "protocolsSupported");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "containsObject:", &unk_250F3F4E0);

  if ((v24 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v16->_browser);
    if (WeakRetained)
    {
      location = (id *)&v16->_browser;
      v25 = objc_loadWeakRetained((id *)&v16->_browser);
      objc_msgSend(v25, "accessoryServerWithNodeID:", v10);
      v26 = (id)objc_claimAutoreleasedReturnValue();

      v102 = v12;
      if (v26)
      {
        objc_msgSend(v26, "currentPairing");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
          goto LABEL_11;
      }
      v28 = (void *)MEMORY[0x242656984]();
      v29 = v16;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v99 = v16;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "vendorID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "productID");
        v33 = v11;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v114 = v31;
        v115 = 2112;
        v116 = v10;
        v117 = 2112;
        v118 = v32;
        v119 = 2112;
        v120 = v34;
        _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_INFO, "%{public}@Could not associate QueryImage request {nodeID=%@, vendorId=%@, productId=%@} to a paired accessory", buf, 0x2Au);

        v11 = v33;
        v12 = v102;

        v16 = v99;
      }

      objc_autoreleasePoolPop(v28);
      if (!v26)
      {
        v79 = (void *)MEMORY[0x242656984]();
        v80 = v29;
        HMFGetOSLogHandle();
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v114 = v82;
          _os_log_impl(&dword_23E95B000, v81, OS_LOG_TYPE_ERROR, "%{public}@Cannot proceed if accessory server is nil, sending an error back to accessory", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v79);
        objc_msgSend(v12, "setStatus:", &unk_250F3F510);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 4, 0);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, id, void *))v105 + 2))(v105, v12, v83);

        v26 = 0;
        goto LABEL_30;
      }
      objc_msgSend(v26, "currentPairing");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
LABEL_11:
        v89 = v10;
        v36 = (void *)MEMORY[0x242656984]();
        v37 = v16;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "vendorID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "productID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v114 = v39;
          v115 = 2112;
          v116 = v26;
          v117 = 2112;
          v118 = v89;
          v119 = 2112;
          v120 = v40;
          v121 = 2112;
          v122 = v41;
          _os_log_impl(&dword_23E95B000, v38, OS_LOG_TYPE_INFO, "%{public}@Found accessory %@ for QueryImage request {nodeID=%@, vendorId=%@, productId=%@} ", buf, 0x34u);

        }
        objc_autoreleasePoolPop(v36);
        objc_msgSend(v11, "softwareVersion");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "updateSoftwareVersion:", v42);

        objc_msgSend(v26, "otaAnnounceTimer");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v43)
        {
          objc_msgSend(v26, "otaAnnounceTimer");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stop");

          objc_msgSend(v26, "setOtaAnnounceTimer:", 0);
        }
        objc_msgSend(v26, "otaApplyUpdateRequestTimer");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (v45)
        {
          v46 = (void *)MEMORY[0x242656984]();
          v47 = v37;
          HMFGetOSLogHandle();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v114 = v49;
            v115 = 2112;
            v116 = v26;
            _os_log_impl(&dword_23E95B000, v48, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected QueryImage when we were waiting for ApplyUpdateRequest after BDX transfer completed, resetting state for accessory %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v46);
          objc_msgSend(v26, "otaApplyUpdateRequestTimer");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "stop");

          objc_msgSend(v26, "setOtaApplyUpdateRequestTimer:", 0);
          objc_msgSend(v26, "matterFirmwareUpdateStatus");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "updateFirmwareUpdateStatus:", 0);

        }
        v52 = [HMMTRSoftwareUpdateProviderQueryImageRequestParams alloc];
        objc_msgSend(v11, "vendorID");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "productID");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "softwareVersion");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hardwareVersion");
        v100 = v37;
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "location");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "requestorCanConsent");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "metadataForProvider");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = -[HMMTRSoftwareUpdateProviderQueryImageRequestParams initWithVendorID:productId:softwareVersion:protocolsSupported:hardwareVersion:location:requestorCanConsent:metadataForProvider:](v52, "initWithVendorID:productId:softwareVersion:protocolsSupported:hardwareVersion:location:requestorCanConsent:metadataForProvider:", v53, v54, v55, &unk_250F40668, v56, v57, v58, v59);

        v61 = objc_loadWeakRetained(location);
        objc_msgSend(v61, "softwareUpdateProvider");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "currentPairing");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v106[0] = MEMORY[0x24BDAC760];
        v106[1] = 3221225472;
        v106[2] = __83__HMMTROTAProviderDelegate_handleQueryImageForNodeID_controller_params_completion___block_invoke_15;
        v106[3] = &unk_250F20E90;
        v106[4] = v100;
        v26 = v26;
        v107 = v26;
        v12 = v102;
        v108 = v102;
        v110 = v105;
        v109 = v11;
        objc_msgSend(v62, "notifyDelegateOfQueryImageWithPairing:requestParams:completionHandler:", v63, v60, v106);

        v10 = v89;
        goto LABEL_30;
      }
      objc_msgSend(v12, "setStatus:", &unk_250F3F528);
      v84 = (void *)MEMORY[0x242656984](objc_msgSend(v12, "setDelayedActionTime:", &unk_250F406E0));
      v85 = v29;
      HMFGetOSLogHandle();
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "delayedActionTime");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v114 = v87;
        v115 = 2112;
        v116 = v88;
        _os_log_impl(&dword_23E95B000, v86, OS_LOG_TYPE_INFO, "%{public}@Do not have pairing information for this accessory. Requesting accessory to check back again after %@ secs", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v84);
      v78 = (void (*)(void))*((_QWORD *)v105 + 2);
    }
    else
    {
      v71 = (void *)MEMORY[0x242656984]();
      v72 = v16;
      HMFGetOSLogHandle();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "vendorID");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "productID");
        v76 = v11;
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v114 = v74;
        v115 = 2112;
        v116 = v10;
        v117 = 2112;
        v118 = v75;
        v119 = 2112;
        v120 = v77;
        _os_log_impl(&dword_23E95B000, v73, OS_LOG_TYPE_ERROR, "%{public}@Unable to get browser ref for QueryImage request {nodeID=%@, vendorId=%@, productId=%@}", buf, 0x2Au);

        v11 = v76;
      }

      objc_autoreleasePoolPop(v71);
      objc_msgSend(v12, "setStatus:", &unk_250F3F510);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 1, 0);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v78 = (void (*)(void))*((_QWORD *)v105 + 2);
    }
    v78();
LABEL_30:

    goto LABEL_31;
  }
  v64 = (void *)MEMORY[0x242656984]();
  v65 = v16;
  HMFGetOSLogHandle();
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "vendorID");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "productID");
    v69 = v11;
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v114 = v67;
    v115 = 2112;
    v116 = v10;
    v117 = 2112;
    v118 = v68;
    v119 = 2112;
    v120 = v70;
    _os_log_impl(&dword_23E95B000, v66, OS_LOG_TYPE_ERROR, "%{public}@Accessory did not list BDXSynchronous as a supported protocol for QueryImage request {nodeID=%@, vendorId=%@, productId=%@}", buf, 0x2Au);

    v11 = v69;
  }

  objc_autoreleasePoolPop(v64);
  objc_msgSend(v12, "setStatus:", &unk_250F3F4F8);
  (*((void (**)(id, id, _QWORD))v105 + 2))(v105, v12, 0);
LABEL_31:

}

- (void)handleApplyUpdateRequestForNodeID:(id)a3 controller:(id)a4 params:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMTROTAProviderDelegate *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  HMMTRSoftwareUpdateProviderApplyUpdateRequestParams *v28;
  void *v29;
  void *v30;
  HMMTRSoftwareUpdateProviderApplyUpdateRequestParams *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  HMMTROTAProviderDelegate *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMMTROTAProviderDelegate *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  HMMTROTAApplyUpdateTimer *v47;
  void *v48;
  void *v49;
  void *v50;
  HMMTROTAApplyUpdateTimer *v51;
  void *v52;
  id v53;
  id v54;
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(v12, "updateToken");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getNewVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v61 = v17;
    v62 = 2112;
    v63 = v10;
    v64 = 2112;
    v65 = v18;
    v66 = 2112;
    v67 = v19;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Processing handleApplyUpdateRequestForNodeID command {nodeID = %@, updateToken = %@, newVersion = %@}", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);
  WeakRetained = objc_loadWeakRetained((id *)&v15->_browser);
  objc_msgSend(WeakRetained, "accessoryServerWithNodeID:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc_init(MEMORY[0x24BDDB7A0]);
  if (v21)
  {
    v53 = v11;
    v54 = v10;
    objc_msgSend(v21, "otaUpdateToken");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateToken");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqualToData:", v24);

    if ((v25 & 1) != 0)
    {
      objc_msgSend(v21, "otaApplyUpdateRequestTimer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v21, "otaApplyUpdateRequestTimer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stop");

        objc_msgSend(v21, "setOtaApplyUpdateRequestTimer:", 0);
      }
      v28 = [HMMTRSoftwareUpdateProviderApplyUpdateRequestParams alloc];
      objc_msgSend(v21, "otaUpdateToken");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "getNewVersion");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[HMMTRSoftwareUpdateProviderApplyUpdateRequestParams initWithUpdateToken:softwareVersion:](v28, "initWithUpdateToken:softwareVersion:", v29, v30);

      v32 = objc_loadWeakRetained((id *)&v15->_browser);
      objc_msgSend(v32, "softwareUpdateProvider");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "currentPairing");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = __91__HMMTROTAProviderDelegate_handleApplyUpdateRequestForNodeID_controller_params_completion___block_invoke;
      v55[3] = &unk_250F20EB8;
      v55[4] = v15;
      v56 = v21;
      v59 = v13;
      v57 = v22;
      v58 = v12;
      objc_msgSend(v33, "notifyDelegateOfApplyUpdateWithPairing:requestParams:completionHandler:", v34, v31, v55);

    }
    else
    {
      v39 = (void *)MEMORY[0x242656984]();
      v40 = v15;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "otaUpdateToken");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "updateToken");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v61 = v42;
        v62 = 2112;
        v63 = v43;
        v64 = 2112;
        v65 = v44;
        v66 = 2112;
        v67 = v21;
        _os_log_impl(&dword_23E95B000, v41, OS_LOG_TYPE_ERROR, "%{public}@Provided token %@ doesn't match assigned token %@ for accessory %@ - Allow update", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v39);
      objc_msgSend(v21, "otaApplyUpdateRequestTimer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        objc_msgSend(v21, "otaApplyUpdateRequestTimer");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stop");

        objc_msgSend(v21, "setOtaApplyUpdateRequestTimer:", 0);
      }
      objc_msgSend(v22, "setAction:", &unk_250F3F4E0);
      objc_msgSend(v22, "setDelayedActionTime:", &unk_250F3F570);
      v47 = [HMMTROTAApplyUpdateTimer alloc];
      objc_msgSend(v12, "getNewVersion");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "delayedActionTime");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTROTAProviderDelegate clientQueue](v40, "clientQueue");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = -[HMMTROTAApplyUpdateTimer initWithServer:otaProvider:newVersion:delay:queue:](v47, "initWithServer:otaProvider:newVersion:delay:queue:", v21, v40, v48, v49, v50);
      objc_msgSend(v21, "setOtaUpdateTimer:", v51);

      objc_msgSend(v21, "otaUpdateTimer");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "start");

      (*((void (**)(id, id, _QWORD))v13 + 2))(v13, v22, 0);
    }
    v11 = v53;
    v10 = v54;
  }
  else
  {
    v35 = (void *)MEMORY[0x242656984]();
    v36 = v15;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v38;
      v62 = 2112;
      v63 = v10;
      _os_log_impl(&dword_23E95B000, v37, OS_LOG_TYPE_ERROR, "%{public}@No paired accessory for nodeID %@ - Allow update", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    objc_msgSend(v22, "setAction:", &unk_250F3F4E0);
    (*((void (**)(id, id, _QWORD))v13 + 2))(v13, v22, 0);
  }

}

- (void)handleNotifyUpdateAppliedForNodeID:(id)a3 controller:(id)a4 params:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  HMMTROTAProviderDelegate *v13;
  NSObject *v14;
  void *v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  HMMTROTAProviderDelegate *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMMTROTAProviderDelegate *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  id v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  HMMTROTAProviderDelegate *v46;
  NSObject *v47;
  void *v48;
  id v49;
  id v50;
  _QWORD block[4];
  id v52;
  id v53;
  HMMTROTAProviderDelegate *v54;
  id v55;
  _BYTE *v56;
  _QWORD v57[4];
  NSObject *v58;
  _QWORD v59[5];
  id v60;
  NSObject *v61;
  id v62;
  _BYTE buf[24];
  uint64_t (*v64)(uint64_t, uint64_t);
  __int128 v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v49 = a4;
  v11 = a5;
  v50 = a6;
  v12 = (void *)MEMORY[0x242656984]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateToken", v49);
    v16 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "softwareVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    v64 = v16;
    LOWORD(v65) = 2112;
    *(_QWORD *)((char *)&v65 + 2) = v17;
    _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@Processing handleNotifyUpdateAppliedForNodeID command {nodeID = %@, updateToken = %@, newVersion = %@}", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  WeakRetained = objc_loadWeakRetained((id *)&v13->_browser);
  objc_msgSend(WeakRetained, "accessoryServerWithNodeID:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "otaUpdateToken");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateToken");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqualToData:", v21);

    if ((v22 & 1) == 0)
    {
      v23 = (void *)MEMORY[0x242656984]();
      v24 = v13;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "otaUpdateToken");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateToken");
        v28 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v27;
        *(_WORD *)&buf[22] = 2112;
        v64 = v28;
        LOWORD(v65) = 2112;
        *(_QWORD *)((char *)&v65 + 2) = v19;
        _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_ERROR, "%{public}@Provided token %@ doesn't match assigned token %@ for accessory %@, accepting anyways", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v23);
    }
    objc_msgSend(v19, "setOtaUpdateToken:", 0, v49);
    objc_msgSend(v19, "otaUpdateTimer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v19, "otaUpdateTimer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stop");

    }
    objc_msgSend(v19, "otaApplyUpdateRequestTimer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v32 = (void *)MEMORY[0x242656984]();
      v33 = v13;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v35;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v19;
        _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected NotifyUpdateApplied when we were still waiting for ApplyUpdateRequest after BDX transfer completed for accessory %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      objc_msgSend(v19, "otaApplyUpdateRequestTimer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stop");

      objc_msgSend(v19, "setOtaApplyUpdateRequestTimer:", 0);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v64 = __Block_byref_object_copy__2656;
    *(_QWORD *)&v65 = __Block_byref_object_dispose__2657;
    objc_msgSend(v19, "softwareVersionNumber");
    *((_QWORD *)&v65 + 1) = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "softwareVersion");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateSoftwareVersion:", v37);

    v38 = dispatch_group_create();
    dispatch_group_enter(v38);
    v39 = MEMORY[0x24BDAC760];
    v59[0] = MEMORY[0x24BDAC760];
    v59[1] = 3221225472;
    v59[2] = __92__HMMTROTAProviderDelegate_handleNotifyUpdateAppliedForNodeID_controller_params_completion___block_invoke;
    v59[3] = &unk_250F229B0;
    v59[4] = v13;
    v40 = v19;
    v60 = v40;
    v41 = v50;
    v62 = v41;
    v42 = v38;
    v61 = v42;
    -[HMMTROTAProviderDelegate _refreshHAPFirmwareRevisionForAccessoryServer:completionHandler:](v13, "_refreshHAPFirmwareRevisionForAccessoryServer:completionHandler:", v40, v59);
    dispatch_group_enter(v42);
    v57[0] = v39;
    v57[1] = 3221225472;
    v57[2] = __92__HMMTROTAProviderDelegate_handleNotifyUpdateAppliedForNodeID_controller_params_completion___block_invoke_25;
    v57[3] = &unk_250F223C0;
    v43 = v42;
    v58 = v43;
    -[HMMTROTAProviderDelegate _refreshThreadCapabilitiesForAccessoryServer:completion:](v13, "_refreshThreadCapabilitiesForAccessoryServer:completion:", v40, v57);
    -[HMMTROTAProviderDelegate clientQueue](v13, "clientQueue");
    v44 = objc_claimAutoreleasedReturnValue();
    block[0] = v39;
    block[1] = 3221225472;
    block[2] = __92__HMMTROTAProviderDelegate_handleNotifyUpdateAppliedForNodeID_controller_params_completion___block_invoke_2;
    block[3] = &unk_250F20EE0;
    v52 = v40;
    v56 = buf;
    v53 = v11;
    v54 = v13;
    v55 = v41;
    dispatch_group_notify(v43, v44, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v45 = (void *)MEMORY[0x242656984]();
    v46 = v13;
    HMFGetOSLogHandle();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v48;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_23E95B000, v47, OS_LOG_TYPE_ERROR, "%{public}@No paired accessory found for nodeID %@ - ignore notification", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v45);
    (*((void (**)(id, _QWORD))v50 + 2))(v50, 0);
  }

}

- (void)handleBDXTransferSessionBeginForNodeID:(id)a3 controller:(id)a4 fileDesignator:(id)a5 offset:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *);
  void *v17;
  HMMTROTAProviderDelegate *v18;
  NSObject *v19;
  void *v20;
  id WeakRetained;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  HMMTROTAProviderDelegate *v27;
  NSObject *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  HMMTROTAProviderDelegate *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  HMMTROTAProviderDelegate *v38;
  NSObject *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  HMMTROTAProviderDelegate *v44;
  NSObject *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  HMMTROTAApplyUpdateRequestTimer *v51;
  HMMTROTAApplyUpdateRequestTimer *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *))a7;
  v17 = (void *)MEMORY[0x242656984]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v60 = v20;
    v61 = 2112;
    v62 = v12;
    v63 = 2112;
    v64 = v14;
    v65 = 2112;
    v66 = v15;
    _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Processing handleBDXTransferSessionBeginForNodeID command {nodeID = %@, path = %@, offset = %@}", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v17);
  WeakRetained = objc_loadWeakRetained((id *)&v18->_browser);
  objc_msgSend(WeakRetained, "accessoryServerWithNodeID:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingAtPath:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v58 = 0;
      objc_msgSend(v23, "seekToOffset:error:", objc_msgSend(v15, "unsignedLongValue"), &v58);
      v24 = v58;
      if (v24)
      {
        v25 = v24;
        v55 = v13;
        v26 = (void *)MEMORY[0x242656984]();
        v27 = v18;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v54 = v26;
          v29 = v14;
          v30 = v15;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v60 = v31;
          v61 = 2112;
          v62 = v29;
          v63 = 2112;
          v64 = v30;
          v65 = 2112;
          v66 = v22;
          _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_ERROR, "%{public}@Error seeking file (%@) to offset %@ for accessory %@", buf, 0x2Au);

          v15 = v30;
          v14 = v29;
          v26 = v54;
        }

        objc_autoreleasePoolPop(v26);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 1, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2](v16, v32);

        v13 = v55;
      }
      else
      {
        objc_msgSend(v22, "otaApplyUpdateRequestTimer");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          v43 = (void *)MEMORY[0x242656984]();
          v44 = v18;
          HMFGetOSLogHandle();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v57 = v14;
            v46 = v15;
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v60 = v47;
            v61 = 2112;
            v62 = v22;
            _os_log_impl(&dword_23E95B000, v45, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected BDXTransferSessionBegin when we were waiting for ApplyUpdateRequest after a BDX transfer was previously completed for accessory %@", buf, 0x16u);

            v15 = v46;
            v14 = v57;
          }

          objc_autoreleasePoolPop(v43);
          objc_msgSend(v22, "otaApplyUpdateRequestTimer");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stop");
        }
        else
        {
          v49 = v14;
          v50 = v15;
          v51 = [HMMTROTAApplyUpdateRequestTimer alloc];
          -[HMMTROTAProviderDelegate clientQueue](v18, "clientQueue");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = -[HMMTROTAApplyUpdateRequestTimer initWithServer:otaProvider:queue:](v51, "initWithServer:otaProvider:queue:", v22, v18, v48);
          objc_msgSend(v22, "setOtaApplyUpdateRequestTimer:", v52);

          v15 = v50;
          v14 = v49;
        }

        objc_msgSend(v22, "matterFirmwareUpdateStatus");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "updateFirmwareUpdateStatus:", 4);

        objc_msgSend(v22, "setOtaFileHandle:", v23);
        objc_msgSend(v22, "setOtaFileOffset:", v15);
        v16[2](v16, 0);
        v25 = 0;
      }
    }
    else
    {
      v37 = (void *)MEMORY[0x242656984]();
      v38 = v18;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v56 = v15;
        v40 = v13;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v60 = v41;
        v61 = 2112;
        v62 = v14;
        v63 = 2112;
        v64 = v22;
        _os_log_impl(&dword_23E95B000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to open file using path '%@' for accessory %@", buf, 0x20u);

        v13 = v40;
        v15 = v56;
      }

      objc_autoreleasePoolPop(v37);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 1, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2](v16, v25);
    }

  }
  else
  {
    v33 = (void *)MEMORY[0x242656984]();
    v34 = v18;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v36;
      v61 = 2112;
      v62 = v12;
      _os_log_impl(&dword_23E95B000, v35, OS_LOG_TYPE_ERROR, "%{public}@No paired accessory found for nodeID %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 1, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v23);
  }

}

- (void)handleBDXTransferSessionEndForNodeID:(id)a3 controller:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMMTROTAProviderDelegate *v12;
  NSObject *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  void *v18;
  HMMTROTAProviderDelegate *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HMMTROTAProviderDelegate *v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
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
    v32 = 138543874;
    v33 = v14;
    v34 = 2112;
    v35 = v8;
    v36 = 2112;
    v37 = v10;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Processing handleBDXTransferSessionEndForNodeID command {nodeID = %@, error = %@}", (uint8_t *)&v32, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  WeakRetained = objc_loadWeakRetained((id *)&v12->_browser);
  objc_msgSend(WeakRetained, "accessoryServerWithNodeID:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v23 = (void *)MEMORY[0x242656984]();
    v24 = v12;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      objc_autoreleasePoolPop(v23);
      goto LABEL_14;
    }
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543618;
    v33 = v26;
    v34 = 2112;
    v35 = v8;
    v27 = "%{public}@No paired accessory found for nodeID %@";
    v28 = v25;
    v29 = OS_LOG_TYPE_ERROR;
LABEL_10:
    _os_log_impl(&dword_23E95B000, v28, v29, v27, (uint8_t *)&v32, 0x16u);

    goto LABEL_11;
  }
  objc_msgSend(v16, "setOtaFileHandle:", 0);
  v17 = objc_msgSend(v16, "setOtaFileOffset:", 0);
  if (!v10)
  {
    objc_msgSend(v16, "otaApplyUpdateRequestTimer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v16, "otaApplyUpdateRequestTimer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "start");

      goto LABEL_14;
    }
    v23 = (void *)MEMORY[0x242656984]();
    v24 = v12;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543618;
    v33 = v26;
    v34 = 2112;
    v35 = v16;
    v27 = "%{public}@Received ApplyUpdateRequest before BDXTransferSessionEnd for accessory %@";
    v28 = v25;
    v29 = OS_LOG_TYPE_INFO;
    goto LABEL_10;
  }
  v18 = (void *)MEMORY[0x242656984](v17);
  v19 = v12;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543874;
    v33 = v21;
    v34 = 2112;
    v35 = v16;
    v36 = 2112;
    v37 = v10;
    _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_INFO, "%{public}@BDX transfer failed for accessory %@, error = %@}", (uint8_t *)&v32, 0x20u);

  }
  objc_autoreleasePoolPop(v18);
  objc_msgSend(v16, "matterFirmwareUpdateStatus");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "updateFirmwareUpdateStatus:", 0);

  objc_msgSend(v16, "setOtaApplyUpdateRequestTimer:", 0);
LABEL_14:

}

- (void)handleBDXQueryForNodeID:(id)a3 controller:(id)a4 blockSize:(id)a5 blockIndex:(id)a6 bytesToSkip:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  HMMTROTAProviderDelegate *v21;
  NSObject *v22;
  void *v23;
  id WeakRetained;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  HMMTROTAProviderDelegate *v32;
  NSObject *v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  HMMTROTAProviderDelegate *v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v35 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = objc_msgSend(v16, "integerValue");
  if (v19 < 10 || !(v19 % 0x64uLL))
  {
    v20 = (void *)MEMORY[0x242656984]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v49 = v23;
      v50 = 2112;
      v51 = v14;
      v52 = 2112;
      v53 = v15;
      v54 = 2112;
      v55 = v16;
      _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_INFO, "%{public}@Processing handleBDXQueryForNodeID command {nodeID = %@, blockSize: %@, blockIndex: %@}", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v20);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  objc_msgSend(WeakRetained, "accessoryServerWithNodeID:", v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
    {
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __107__HMMTROTAProviderDelegate_handleBDXQueryForNodeID_controller_blockSize_blockIndex_bytesToSkip_completion___block_invoke;
      v41[3] = &unk_250F23FD0;
      v42 = v25;
      v43 = v17;
      v44 = v15;
      v45 = v16;
      v46 = self;
      v26 = v18;
      v27 = v18;
      v28 = v17;
      v29 = v26;
      v47 = v26;
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __107__HMMTROTAProviderDelegate_handleBDXQueryForNodeID_controller_blockSize_blockIndex_bytesToSkip_completion___block_invoke_31;
      v36[3] = &unk_250F21BC0;
      v36[4] = self;
      v37 = v14;
      v38 = v44;
      v39 = v45;
      v30 = v29;
      v17 = v28;
      v18 = v27;
      v40 = v30;
      objc_msgSend(v42, "queueAccessoryOperation:highPriority:completion:", v41, 1, v36);

    }
  }
  else
  {
    v31 = (void *)MEMORY[0x242656984]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v49 = v34;
      v50 = 2112;
      v51 = v14;
      v52 = 2112;
      v53 = 0;
      _os_log_impl(&dword_23E95B000, v33, OS_LOG_TYPE_ERROR, "%{public}@No paired accessory found for nodeID %@ for accessory %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v31);
    (*((void (**)(id, _QWORD, _QWORD))v18 + 2))(v18, 0, 0);
  }

}

- (id)generateUpdateToken
{
  void *v2;
  int v3;
  void *v4;
  uint32_t v6;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 8;
  do
  {
    v6 = 0;
    v6 = arc4random();
    objc_msgSend(v2, "appendBytes:length:", &v6, 4);
    --v3;
  }
  while (v3);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)applyUpdateTimerExpiredForAccessoryServer:(id)a3 softwareVersion:(id)a4 didTimeout:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD, _QWORD);
  int v18;
  void *v19;
  HMMTROTAProviderDelegate *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  _QWORD block[4];
  id v30;
  void (**v31)(_QWORD, _QWORD);
  _QWORD v32[4];
  NSObject *v33;
  _QWORD v34[4];
  NSObject *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  HMMTROTAProviderDelegate *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "softwareVersionNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOtaUpdateToken:", 0);
  v12 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke;
  v36[3] = &unk_250F21B70;
  v13 = v8;
  v37 = v13;
  v14 = v9;
  v38 = v14;
  v15 = v11;
  v39 = v15;
  v16 = v10;
  v40 = v16;
  v41 = self;
  v17 = (void (**)(_QWORD, _QWORD))MEMORY[0x242656B10](v36);
  v18 = objc_msgSend(v16, "isEqualToNumber:", &unk_250F3F588);
  v19 = (void *)MEMORY[0x242656984]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
  if (v18)
  {
    if (v22)
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v23;
      v44 = 2112;
      v45 = v14;
      v46 = 2112;
      v47 = v13;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_INFO, "%{public}@Timed out applying update version %@ for Accessory %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    v17[2](v17, 0);
  }
  else
  {
    if (v22)
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v24;
      v44 = 2112;
      v45 = v14;
      v46 = 2112;
      v47 = v13;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_INFO, "%{public}@Successfully updated to version %@ without sending NotifyUpdateApplied command for accessory %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(v13, "updateSoftwareVersion:", v14);
    v25 = dispatch_group_create();
    dispatch_group_enter(v25);
    v34[0] = v12;
    v34[1] = 3221225472;
    v34[2] = __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke_35;
    v34[3] = &unk_250F223C0;
    v26 = v25;
    v35 = v26;
    -[HMMTROTAProviderDelegate _refreshHAPFirmwareRevisionForAccessoryServer:completionHandler:](v20, "_refreshHAPFirmwareRevisionForAccessoryServer:completionHandler:", v13, v34);
    dispatch_group_enter(v26);
    v32[0] = v12;
    v32[1] = 3221225472;
    v32[2] = __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke_2_36;
    v32[3] = &unk_250F223C0;
    v33 = v26;
    v27 = v26;
    -[HMMTROTAProviderDelegate _refreshThreadCapabilitiesForAccessoryServer:completion:](v20, "_refreshThreadCapabilitiesForAccessoryServer:completion:", v13, v32);
    -[HMMTROTAProviderDelegate clientQueue](v20, "clientQueue");
    v28 = objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke_3;
    block[3] = &unk_250F22768;
    v30 = v13;
    v31 = v17;
    dispatch_group_notify(v27, v28, block);

  }
}

- (void)applyUpdateRequestTimerExpiredForAccessoryServer:(id)a3
{
  id v4;
  void *v5;
  HMMTROTAProviderDelegate *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@applyUpdateRequestTimerExpiredForAccessoryServer for accessory %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "matterFirmwareUpdateStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateFirmwareUpdateStatus:", 0);

  objc_msgSend(v4, "setOtaApplyUpdateRequestTimer:", 0);
}

- (void)_refreshHAPFirmwareRevisionForAccessoryServer:(id)a3 completionHandler:(id)a4
{
  -[HMMTROTAProviderDelegate _refreshHAPFirmwareRevisionForAccessoryServer:retryCount:completionHandler:](self, "_refreshHAPFirmwareRevisionForAccessoryServer:retryCount:completionHandler:", a3, 0, a4);
}

- (void)_refreshHAPFirmwareRevisionForAccessoryServer:(id)a3 retryCount:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t j;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
  id v29;
  int64_t v30;
  id v31;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  int64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v31 = a5;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v33 = v7;
  objc_msgSend(v7, "primaryAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "services");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v15, "type");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("0000003E-0000-1000-8000-0026BB765291"));

        if (v17)
        {
          v30 = a4;
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          objc_msgSend(v15, "characteristics");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v39;
            while (2)
            {
              v22 = v8;
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v39 != v21)
                  objc_enumerationMutation(v18);
                v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
                objc_msgSend(v24, "type");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("00000052-0000-1000-8000-0026BB765291"));

                if (v26)
                {
                  v8 = v22;
                  objc_msgSend(v22, "addObject:", v24);
                  goto LABEL_20;
                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
              v8 = v22;
              if (v20)
                continue;
              break;
            }
          }
LABEL_20:

          a4 = v30;
          goto LABEL_21;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_21:

  -[HMMTROTAProviderDelegate clientQueue](self, "clientQueue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __103__HMMTROTAProviderDelegate__refreshHAPFirmwareRevisionForAccessoryServer_retryCount_completionHandler___block_invoke;
  v34[3] = &unk_250F20F08;
  v34[4] = self;
  v37 = a4;
  v35 = v33;
  v36 = v31;
  v28 = v31;
  v29 = v33;
  objc_msgSend(v29, "fetchAndNotifyCharacteristics:timeout:completionQueue:completionHandler:", v8, v27, v34, 60.0);

}

- (void)_refreshThreadCapabilitiesForAccessoryServer:(id)a3 completion:(id)a4
{
  objc_msgSend(a3, "refreshThreadCapabilitiesWithCompletion:", a4);
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setClientQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (HMMTRAccessoryServerBrowser)browser
{
  return (HMMTRAccessoryServerBrowser *)objc_loadWeakRetained((id *)&self->_browser);
}

- (void)setBrowser:(id)a3
{
  objc_storeWeak((id *)&self->_browser, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

void __103__HMMTROTAProviderDelegate__refreshHAPFirmwareRevisionForAccessoryServer_retryCount_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v28 = a1;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 56);
    v8 = (void *)MEMORY[0x242656984]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v7 > 4)
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(v28 + 56);
        *(_DWORD *)buf = 138543874;
        v36 = v25;
        v37 = 2112;
        v38 = v6;
        v39 = 2048;
        v40 = v26;
        _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Max retries reached to refresh FirmwareRevision: error: %@, retryCount:%ld", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      (*(void (**)(void))(*(_QWORD *)(v28 + 48) + 16))();
    }
    else
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(void **)(v28 + 56);
        *(_DWORD *)buf = 138543874;
        v36 = v12;
        v37 = 2112;
        v38 = v6;
        v39 = 2048;
        v40 = v13;
        _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to refresh FirmwareRevision: error: %@, retryCount:%ld", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(*(id *)(v28 + 32), "_refreshHAPFirmwareRevisionForAccessoryServer:retryCount:completionHandler:", *(_QWORD *)(v28 + 40), *(_QWORD *)(v28 + 56) + 1, *(_QWORD *)(v28 + 48));
    }
  }
  else
  {
    v27 = v5;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v5;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x242656984]();
          v20 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "value");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "error");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v36 = v22;
            v37 = 2112;
            v38 = v23;
            v39 = 2112;
            v40 = v24;
            _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Read completion contains tuple with value:%@ error: %@", buf, 0x20u);

            a1 = v28;
          }

          objc_autoreleasePoolPop(v19);
        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v15);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v6 = 0;
    v5 = v27;
  }

}

void __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke(uint64_t a1)
{
  HMMTRSoftwareUpdateProviderNotifyUpdateParams *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  HMMTRSoftwareUpdateProviderNotifyUpdateParams *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v2 = [HMMTRSoftwareUpdateProviderNotifyUpdateParams alloc];
  objc_msgSend(*(id *)(a1 + 32), "otaUpdateToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "nodeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getTransportTypeStringWithNodeID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMMTRSoftwareUpdateProviderNotifyUpdateParams initWithUpdateToken:softwareVersion:transportTypeForMetrics:previousSoftwareVersionNumberForMetrics:didTimeout:](v2, "initWithUpdateToken:softwareVersion:transportTypeForMetrics:previousSoftwareVersionNumberForMetrics:didTimeout:", v3, v4, v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 64) + 16));
  objc_msgSend(WeakRetained, "softwareUpdateProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentPairing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke_2;
  v12[3] = &unk_250F23E18;
  v12[4] = *(_QWORD *)(a1 + 64);
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v10, "notifyDelegateOfNotifyUpdateWithPairing:params:completionHandler:", v11, v8, v12);

}

void __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke_35(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke_2_36(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "matterFirmwareUpdateStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFirmwareUpdateStatus:", 6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543874;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@notifyDelegateOfNotifyUpdateWithPairing failed for accessory %@ with error: %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __107__HMMTROTAProviderDelegate_handleBDXQueryForNodeID_controller_blockSize_blockIndex_bytesToSkip_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "otaFileOffset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongValue");
  v4 = objc_msgSend(*(id *)(a1 + 40), "unsignedLongLongValue") + v3;
  v5 = objc_msgSend(*(id *)(a1 + 48), "unsignedLongValue");
  v6 = v4 + objc_msgSend(*(id *)(a1 + 56), "unsignedLongValue") * v5;

  objc_msgSend(*(id *)(a1 + 32), "otaFileHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v7, "seekToOffset:error:", v6, &v20);
  v8 = v20;

  if (v8)
  {
    v9 = (void *)MEMORY[0x242656984]();
    v10 = *(id *)(a1 + 64);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error seeking to offset %@ for accessory %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "otaFileHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "readDataOfLength:", objc_msgSend(*(id *)(a1 + 48), "unsignedLongValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 32), "otaFileHandle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "availableData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, BOOL))(v17 + 16))(v17, v16, objc_msgSend(v19, "length") == 0);

  }
}

void __107__HMMTROTAProviderDelegate_handleBDXQueryForNodeID_controller_blockSize_blockIndex_bytesToSkip_completion___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      v11 = 138544386;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@handleBDXQueryForNodeID command {nodeID = %@, blockSize: %@, blockIndex: %@}. Error: %@", (uint8_t *)&v11, 0x34u);

    }
    objc_autoreleasePoolPop(v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __92__HMMTROTAProviderDelegate_handleNotifyUpdateAppliedForNodeID_controller_params_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v11 = 138543874;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@notifyDelegateOfNotifyUpdateWithPairing failed for accessory %@ with error: %@", (uint8_t *)&v11, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __92__HMMTROTAProviderDelegate_handleNotifyUpdateAppliedForNodeID_controller_params_completion___block_invoke_25(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __92__HMMTROTAProviderDelegate_handleNotifyUpdateAppliedForNodeID_controller_params_completion___block_invoke_2(uint64_t a1)
{
  HMMTRSoftwareUpdateProviderNotifyUpdateParams *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMMTRSoftwareUpdateProviderNotifyUpdateParams *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v2 = [HMMTRSoftwareUpdateProviderNotifyUpdateParams alloc];
  objc_msgSend(*(id *)(a1 + 32), "otaUpdateToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "softwareVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "nodeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getTransportTypeStringWithNodeID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMMTRSoftwareUpdateProviderNotifyUpdateParams initWithUpdateToken:softwareVersion:transportTypeForMetrics:previousSoftwareVersionNumberForMetrics:didTimeout:](v2, "initWithUpdateToken:softwareVersion:transportTypeForMetrics:previousSoftwareVersionNumberForMetrics:didTimeout:", v3, v4, v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), &unk_250F3F540);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 16));
  objc_msgSend(WeakRetained, "softwareUpdateProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentPairing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __92__HMMTROTAProviderDelegate_handleNotifyUpdateAppliedForNodeID_controller_params_completion___block_invoke_3;
  v12[3] = &unk_250F228C0;
  v12[4] = *(_QWORD *)(a1 + 48);
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 56);
  objc_msgSend(v10, "notifyDelegateOfNotifyUpdateWithPairing:params:completionHandler:", v11, v8, v12);

}

void __92__HMMTROTAProviderDelegate_handleNotifyUpdateAppliedForNodeID_controller_params_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v12 = 138543874;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@notifyDelegateOfNotifyUpdateWithPairing failed for accessory %@ with error: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "matterFirmwareUpdateStatus");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateFirmwareUpdateStatus:", 6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __91__HMMTROTAProviderDelegate_handleApplyUpdateRequestForNodeID_controller_params_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  HMMTROTAApplyUpdateTimer *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  HMMTROTAApplyUpdateTimer *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 40);
      v38 = 138543874;
      v39 = v10;
      v40 = 2112;
      v41 = v11;
      v42 = 2112;
      v43 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@notifyDelegateOfApplyUpdateWithPairing failed for accessory %@ with error: %@", (uint8_t *)&v38, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
  else
  {
    objc_msgSend(v5, "action");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    if (v15 == 2)
    {
      v22 = *(void **)(a1 + 48);
      v23 = &unk_250F3F510;
    }
    else if (v15 == 1)
    {
      v22 = *(void **)(a1 + 48);
      v23 = &unk_250F3F528;
    }
    else
    {
      if (v15)
      {
        v16 = (void *)MEMORY[0x242656984]();
        v17 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "action");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = *(void **)(a1 + 40);
          v38 = 138543874;
          v39 = v19;
          v40 = 2112;
          v41 = v20;
          v42 = 2112;
          v43 = v21;
          _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unknown action %@ for accessory %@ - Defaulting to allow update", (uint8_t *)&v38, 0x20u);

        }
        objc_autoreleasePoolPop(v16);
      }
      v22 = *(void **)(a1 + 48);
      v23 = &unk_250F3F4E0;
    }
    objc_msgSend(v22, "setAction:", v23);
    objc_msgSend(v5, "delayedActionTime");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setDelayedActionTime:", v24);

    objc_msgSend(*(id *)(a1 + 48), "action");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToNumber:", &unk_250F3F4E0);

    if (v26)
    {
      v27 = [HMMTROTAApplyUpdateTimer alloc];
      v29 = *(_QWORD *)(a1 + 32);
      v28 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 56), "getNewVersion");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "delayedActionTime");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "clientQueue");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[HMMTROTAApplyUpdateTimer initWithServer:otaProvider:newVersion:delay:queue:](v27, "initWithServer:otaProvider:newVersion:delay:queue:", v28, v29, v30, v31, v32);
      objc_msgSend(*(id *)(a1 + 40), "setOtaUpdateTimer:", v33);

      objc_msgSend(*(id *)(a1 + 40), "otaUpdateTimer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "start");

      objc_msgSend(*(id *)(a1 + 40), "matterFirmwareUpdateStatus");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "getNewVersion");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "updateDownloadedFirmwareVersionNumber:", v36);

      objc_msgSend(*(id *)(a1 + 40), "matterFirmwareUpdateStatus");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "updateFirmwareUpdateStatus:", 5);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __83__HMMTROTAProviderDelegate_handleQueryImageForNodeID_controller_params_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("{[%lu] = %@},"), a3, a2);
}

void __83__HMMTROTAProviderDelegate_handleQueryImageForNodeID_controller_params_completion___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  int v70;
  void *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v70 = 138543874;
      v71 = v10;
      v72 = 2112;
      v73 = v11;
      v74 = 2112;
      v75 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error while trying to QueryImage for accessory %@: %@.", (uint8_t *)&v70, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 48), "setStatus:", &unk_250F3F510);
LABEL_5:
    v12 = *(_QWORD *)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v13, v14);

  }
  else
  {
    objc_msgSend(v5, "status");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

    switch(v16)
    {
      case 0:
        v17 = (void *)MEMORY[0x242656984]();
        v18 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = *(_QWORD *)(a1 + 40);
          v70 = 138543618;
          v71 = v20;
          v72 = 2112;
          v73 = v21;
          _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Software update image available for accessory %@", (uint8_t *)&v70, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        objc_msgSend(*(id *)(a1 + 48), "setStatus:", &unk_250F3F4E0);
        objc_msgSend(v5, "userConsentNeeded");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "integerValue");

        if (v23 != 1)
          goto LABEL_14;
        objc_msgSend(*(id *)(a1 + 56), "requestorCanConsent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "integerValue");

        v26 = (void *)MEMORY[0x242656984]();
        v27 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
        if (v25 == 1)
        {
          if (v29)
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = *(_QWORD *)(a1 + 40);
            v70 = 138543618;
            v71 = v30;
            v72 = 2112;
            v73 = v31;
            _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_INFO, "%{public}@User Consent Pending, requestor can consent for accessory %@", (uint8_t *)&v70, 0x16u);

          }
          objc_autoreleasePoolPop(v26);
          objc_msgSend(*(id *)(a1 + 48), "setUserConsentNeeded:", &unk_250F3F558);
LABEL_14:
          objc_msgSend(v5, "imageURI");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "setImageURI:", v32);

          objc_msgSend(v5, "softwareVersion");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "setSoftwareVersion:", v33);

          objc_msgSend(v5, "softwareVersionString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "setSoftwareVersionString:", v34);

          objc_msgSend(*(id *)(a1 + 32), "generateUpdateToken");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setOtaUpdateToken:", v35);

          objc_msgSend(*(id *)(a1 + 40), "otaUpdateToken");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "setUpdateToken:", v36);

          v37 = (void *)MEMORY[0x242656984]();
          v38 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = *(_QWORD *)(a1 + 40);
            objc_msgSend(*(id *)(a1 + 48), "updateToken");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = 138543874;
            v71 = v40;
            v72 = 2112;
            v73 = v41;
            v74 = 2112;
            v75 = v42;
            _os_log_impl(&dword_23E95B000, v39, OS_LOG_TYPE_INFO, "%{public}@Associated accessory %@ with update token %@", (uint8_t *)&v70, 0x20u);

          }
          objc_autoreleasePoolPop(v37);
        }
        else
        {
          if (v29)
          {
            HMFGetLogIdentifier();
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = *(_QWORD *)(a1 + 40);
            v70 = 138543618;
            v71 = v68;
            v72 = 2112;
            v73 = v69;
            _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_INFO, "%{public}@User Consent Pending for accessory %@", (uint8_t *)&v70, 0x16u);

          }
          objc_autoreleasePoolPop(v26);
          objc_msgSend(*(id *)(a1 + 48), "setStatus:", &unk_250F3F528);
          objc_msgSend(*(id *)(a1 + 48), "setUserConsentNeeded:", &unk_250F3F570);
          objc_msgSend(*(id *)(a1 + 48), "setDelayedActionTime:", &unk_250F406E0);
        }
        break;
      case 1:
        v49 = (void *)MEMORY[0x242656984]();
        v50 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = *(_QWORD *)(a1 + 40);
          v70 = 138543618;
          v71 = v52;
          v72 = 2112;
          v73 = v53;
          _os_log_impl(&dword_23E95B000, v51, OS_LOG_TYPE_INFO, "%{public}@Software update provider is busy for accessory %@", (uint8_t *)&v70, 0x16u);

        }
        objc_autoreleasePoolPop(v49);
        objc_msgSend(*(id *)(a1 + 48), "setStatus:", &unk_250F3F528);
        objc_msgSend(v5, "delayedActionTime");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setDelayedActionTime:", v54);

        break;
      case 2:
        v55 = (void *)MEMORY[0x242656984]();
        v56 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = *(_QWORD *)(a1 + 40);
          v70 = 138543618;
          v71 = v58;
          v72 = 2112;
          v73 = v59;
          _os_log_impl(&dword_23E95B000, v57, OS_LOG_TYPE_INFO, "%{public}@Software update image not available for accessory %@", (uint8_t *)&v70, 0x16u);

        }
        objc_autoreleasePoolPop(v55);
        v60 = *(void **)(a1 + 48);
        v61 = &unk_250F3F510;
        goto LABEL_29;
      case 3:
        v62 = (void *)MEMORY[0x242656984]();
        v63 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v5, "status");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = 138543874;
          v71 = v65;
          v72 = 2112;
          v73 = v66;
          v74 = 2112;
          v75 = v67;
          _os_log_impl(&dword_23E95B000, v64, OS_LOG_TYPE_ERROR, "%{public}@Unknown QueryImage state %@ for accessory %@", (uint8_t *)&v70, 0x20u);

        }
        objc_autoreleasePoolPop(v62);
        v60 = *(void **)(a1 + 48);
        v61 = &unk_250F3F4F8;
LABEL_29:
        objc_msgSend(v60, "setStatus:", v61);
        break;
      default:
        v43 = (void *)MEMORY[0x242656984]();
        v44 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v5, "status");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = 138543874;
          v71 = v46;
          v72 = 2112;
          v73 = v47;
          v74 = 2112;
          v75 = v48;
          _os_log_impl(&dword_23E95B000, v45, OS_LOG_TYPE_ERROR, "%{public}@Unknown QueryImage state %@ for accessory %@", (uint8_t *)&v70, 0x20u);

        }
        objc_autoreleasePoolPop(v43);
        goto LABEL_5;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t48 != -1)
    dispatch_once(&logCategory__hmf_once_t48, &__block_literal_global_2706);
  return (id)logCategory__hmf_once_v49;
}

void __39__HMMTROTAProviderDelegate_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v49;
  logCategory__hmf_once_v49 = v0;

}

@end
