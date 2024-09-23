@implementation HMDCameraMediaConfigGenerator

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_66650 != -1)
    dispatch_once(&logCategory__hmf_once_t8_66650, &__block_literal_global_66651);
  return (id)logCategory__hmf_once_v9_66652;
}

void __44__HMDCameraMediaConfigGenerator_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9_66652;
  logCategory__hmf_once_v9_66652 = v0;

}

- (BOOL)extractSelectedConfigFromProtocolParameters:(id)a3 videoStreamConfig:(id *)a4 audioStreamConfig:(id *)a5
{
  id v8;
  HMDVideoStreamConfig *v9;
  HMDAudioStreamConfig *v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = objc_alloc_init(HMDVideoStreamConfig);
  if (-[HMDCameraMediaConfigGenerator _loadAVCVideoStreamConfig:protocolParameters:](self, "_loadAVCVideoStreamConfig:protocolParameters:", v9, v8))
  {
    v10 = objc_alloc_init(HMDAudioStreamConfig);
    v11 = -[HMDCameraMediaConfigGenerator _loadAVCAudioStreamConfig:protocolParameters:](self, "_loadAVCAudioStreamConfig:protocolParameters:", v10, v8);
    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v9);
      if (a5)
        *a5 = objc_retainAutorelease(v10);
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v17;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to load audio config from the protocol parameters", (uint8_t *)&v19, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to load video config from the protocol parameters", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (BOOL)_loadAVCAudioStreamConfig:(id)a3 protocolParameters:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  float v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  BOOL v101;
  uint64_t v102;
  void *v104;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  uint8_t buf[4];
  void *v111;
  __int16 v112;
  uint64_t v113;
  __int16 v114;
  uint64_t v115;
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v109 = a3;
  v5 = a4;
  objc_msgSend(v5, "selectedStreamConfigurationWrite");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "audioParameters");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "codecGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "codec");
  v108 = v5;
  objc_msgSend(v5, "selectedStreamConfigurationWrite");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "audioParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "codecParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "audioSampleRates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "sampleRate");
  v14 = v13;
  v15 = 0;
  v16 = 2;
  switch(v7)
  {
    case 0:
      break;
    case 1:
      v15 = 0;
      v16 = 3;
      break;
    case 2:
      if (v13 == 1)
      {
        v15 = 0;
        v16 = 4;
      }
      else
      {
        if (v13 != 2)
          goto LABEL_9;
        v15 = 0;
        v16 = 5;
      }
      break;
    case 3:
      if (v13 == 1)
      {
        v15 = 0;
        v16 = 10;
      }
      else
      {
        if (v13 != 2)
          goto LABEL_9;
        v15 = 0;
        v16 = 9;
      }
      break;
    case 5:
      v15 = 0;
      v16 = 0;
      break;
    case 6:
      v15 = 0;
      v16 = 1;
      break;
    default:
LABEL_9:
      v17 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v111 = v104;
        v112 = 2048;
        v113 = v7;
        v114 = 2048;
        v115 = v14;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to translate the HMD audio codec type: %tu, sample rate: %tu", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      v16 = -1;
      v15 = 1;
      break;
  }

  if (v15)
  {
    v19 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v22 = v108;
    v21 = v109;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "selectedStreamConfigurationWrite");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "audioParameters");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "codecGroup");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "decodedNumber");
      *(_DWORD *)buf = 138543618;
      v111 = v23;
      v112 = 2048;
      v113 = v27;
      v28 = "%{public}@Failed to translate to audio codec type from %lu";
LABEL_23:
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);

      goto LABEL_24;
    }
    goto LABEL_24;
  }
  v21 = v109;
  objc_msgSend(v109, "audio");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCodecType:", v16);

  objc_msgSend(v109, "audio");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setOctetAligned:", 1);

  objc_msgSend(v109, "audio");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setDtxEnabled:", 1);

  v22 = v108;
  objc_msgSend(v108, "selectedStreamConfigurationWrite");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "audioParameters");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rtpParameters");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "payloadType");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setTxPayloadType:", objc_msgSend(v35, "unsignedIntegerValue"));

  objc_msgSend(v108, "selectedStreamConfigurationWrite");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "audioParameters");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "rtpParameters");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "payloadType");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setRxPayloadType:", objc_msgSend(v39, "unsignedIntegerValue"));

  objc_msgSend(v109, "setDirection:", 3);
  objc_msgSend(v108, "selectedStreamConfigurationWrite");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "audioParameters");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "rtpParameters");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "rtcpInterval");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "floatValue");
  objc_msgSend(v109, "setRtcpSendInterval:", v44);

  objc_msgSend(v108, "setupEndPointWrite");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "address");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "ipAddress");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "localAddress");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setIp:", v47);

  objc_msgSend(v108, "setupEndPointWrite");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "address");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "audioRTPPort");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "unsignedShortValue");
  objc_msgSend(v109, "localAddress");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setPort:", v52);

  objc_msgSend(v108, "setupEndPointWrite");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "address");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "isIPv6Address");
  objc_msgSend(v109, "localAddress");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setIsIPv6:", v56);

  objc_msgSend(v108, "setupEndPointRead");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "address");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "ipAddress");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "remoteAddress");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setIp:", v60);

  objc_msgSend(v108, "setupEndPointRead");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "address");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "audioRTPPort");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "unsignedShortValue");
  objc_msgSend(v109, "remoteAddress");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setPort:", v65);

  objc_msgSend(v108, "setupEndPointRead");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "address");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "isIPv6Address");
  objc_msgSend(v109, "remoteAddress");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setIsIPv6:", v69);

  objc_msgSend(v108, "setupEndPointRead");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "address");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "audioRTPPort");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setRtcpRemotePort:", objc_msgSend(v73, "unsignedShortValue"));

  objc_msgSend(v109, "audio");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setAudioStreamMode:", 3);

  objc_msgSend(v108, "selectedStreamConfigurationWrite");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "audioParameters");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "comfortNoiseEnabled");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v77, "BOOLValue");
  objc_msgSend(v109, "audio");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setCnEnabled:", v78);

  objc_msgSend(v108, "selectedStreamConfigurationWrite");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "audioParameters");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "rtpParameters");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "comfortNoisePayloadType");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(v83, "unsignedIntegerValue");
  objc_msgSend(v109, "audio");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setCnPayloadType:", v84);

  objc_msgSend(v108, "selectedStreamConfigurationWrite");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "audioParameters");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "codecParameters");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "rtpPtime");
  v89 = objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend((id)v89, "unsignedIntegerValue");
  objc_msgSend(v109, "audio");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setPtime:", v90);

  objc_msgSend(v108, "setupEndPointRead");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "audioSrtpParameters");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "srtpCryptoSuite");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v89) = -[HMDCameraMediaConfigGenerator _loadConfig:cipherCuite:](self, "_loadConfig:cipherCuite:", v109, v94);

  if ((v89 & 1) == 0)
  {
    v19 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "setupEndPointRead");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "audioSrtpParameters");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "srtpCryptoSuite");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = objc_msgSend(v26, "decodedNumber");
      *(_DWORD *)buf = 138543618;
      v111 = v23;
      v112 = 2048;
      v113 = v102;
      v28 = "%{public}@Failed to translate to crypto suite for audio from %lu";
      goto LABEL_23;
    }
LABEL_24:

    objc_autoreleasePoolPop(v19);
    v101 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v108, "setupEndPointWrite");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "audioSrtpParameters");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setupEndPointRead");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "audioSrtpParameters");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraMediaConfigGenerator _loadConfig:sendSrtpParameters:receiveSrtpParameters:](self, "_loadConfig:sendSrtpParameters:receiveSrtpParameters:", v109, v96, v98);

  -[HMDCameraMediaConfigGenerator _loadMiscConfig:](self, "_loadMiscConfig:", v109);
  objc_msgSend(v108, "setupEndPointRead");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "audioSSRC");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setRemoteSSRC:", objc_msgSend(v100, "unsignedIntegerValue"));

  v101 = 1;
LABEL_25:

  return v101;
}

- (BOOL)_loadAVCVideoStreamConfig:(id)a3 protocolParameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  BOOL v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  float v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  void *v101;
  __int16 v102;
  uint64_t v103;
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "selectedStreamConfigurationWrite");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "videoParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "codec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "codecType");

  if (v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "selectedStreamConfigurationWrite");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "videoParameters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "codec");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = 138543618;
      v101 = v14;
      v102 = 2048;
      v103 = objc_msgSend(v17, "decodedNumber");
      v18 = "%{public}@Failed to translate to video codec type from %lu";
LABEL_4:
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v100, 0x16u);

LABEL_5:
    }
  }
  else
  {
    objc_msgSend(v6, "video");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTxCodecType:", 0);

    objc_msgSend(v6, "video");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setRxCodecType:", 0);

    objc_msgSend(v7, "selectedStreamConfigurationWrite");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "videoParameters");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rtpParameters");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "payloadType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTxPayloadType:", objc_msgSend(v26, "unsignedIntegerValue"));

    objc_msgSend(v7, "selectedStreamConfigurationWrite");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "videoParameters");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "rtpParameters");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "payloadType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRxPayloadType:", objc_msgSend(v30, "unsignedIntegerValue"));

    objc_msgSend(v6, "setDirection:", 2);
    objc_msgSend(v7, "selectedStreamConfigurationWrite");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "videoParameters");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "videoAttributes");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "videoResolution");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "resolutionType");
    if ((unint64_t)(v35 - 1) >= 0x1D)
      v36 = (uint64_t *)&kIPCameraUnknownParameter;
    else
      v36 = (uint64_t *)((char *)&unk_2226A0BB0 + 8 * v35 - 8);
    v37 = *v36;

    if (v37 == -1)
    {
      v12 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = 138543362;
      v101 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to translate image resolution", (uint8_t *)&v100, 0xCu);
      goto LABEL_5;
    }
    objc_msgSend(v6, "video");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setVideoResolution:", v37);

    objc_msgSend(v7, "selectedStreamConfigurationWrite");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "videoParameters");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "videoAttributes");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "framerate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "unsignedIntegerValue");
    objc_msgSend(v6, "video");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setFramerate:", v43);

    objc_msgSend(v7, "selectedStreamConfigurationWrite");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "videoParameters");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "rtpParameters");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "maximumBitrate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "unsignedIntegerValue");
    objc_msgSend(v6, "video");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setRxMaxBitrate:", v49);

    objc_msgSend(v7, "selectedStreamConfigurationWrite");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "videoParameters");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "rtpParameters");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "minimumBitrate");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "unsignedIntegerValue");
    objc_msgSend(v6, "video");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setRxMinBitrate:", v55);

    objc_msgSend(v7, "selectedStreamConfigurationWrite");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "videoParameters");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "rtpParameters");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "rtcpInterval");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "floatValue");
    objc_msgSend(v6, "setRtcpSendInterval:", v61);

    objc_msgSend(v7, "setupEndPointWrite");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "address");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "ipAddress");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localAddress");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setIp:", v64);

    objc_msgSend(v7, "setupEndPointWrite");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "address");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "videoRTPPort");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "unsignedShortValue");
    objc_msgSend(v6, "localAddress");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setPort:", v69);

    objc_msgSend(v7, "setupEndPointWrite");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "address");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v72, "isIPv6Address");
    objc_msgSend(v6, "localAddress");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setIsIPv6:", v73);

    objc_msgSend(v7, "setupEndPointRead");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "address");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "ipAddress");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteAddress");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setIp:", v77);

    objc_msgSend(v7, "setupEndPointRead");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "address");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "videoRTPPort");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "unsignedShortValue");
    objc_msgSend(v6, "remoteAddress");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setPort:", v82);

    objc_msgSend(v7, "setupEndPointRead");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "address");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v85, "isIPv6Address");
    objc_msgSend(v6, "remoteAddress");
    v87 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v87, "setIsIPv6:", v86);

    objc_msgSend(v7, "setupEndPointRead");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "address");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "videoRTPPort");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRtcpRemotePort:", objc_msgSend(v90, "unsignedShortValue"));

    objc_msgSend(v7, "setupEndPointRead");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "videoSrtpParameters");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "srtpCryptoSuite");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v87) = -[HMDCameraMediaConfigGenerator _loadConfig:cipherCuite:](self, "_loadConfig:cipherCuite:", v6, v93);

    if ((v87 & 1) != 0)
    {
      objc_msgSend(v7, "setupEndPointWrite");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "videoSrtpParameters");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setupEndPointRead");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "videoSrtpParameters");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraMediaConfigGenerator _loadConfig:sendSrtpParameters:receiveSrtpParameters:](self, "_loadConfig:sendSrtpParameters:receiveSrtpParameters:", v6, v95, v97);

      -[HMDCameraMediaConfigGenerator _loadMiscConfig:](self, "_loadMiscConfig:", v6);
      objc_msgSend(v7, "setupEndPointRead");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "videoSSRC");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRemoteSSRC:", objc_msgSend(v99, "unsignedIntegerValue"));

      v19 = 1;
      goto LABEL_7;
    }
    v12 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setupEndPointRead");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "videoSrtpParameters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "srtpCryptoSuite");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = 138543618;
      v101 = v14;
      v102 = 2048;
      v103 = objc_msgSend(v17, "decodedNumber");
      v18 = "%{public}@Failed to translate to crypto suite for video from %lu";
      goto LABEL_4;
    }
  }
LABEL_6:

  objc_autoreleasePoolPop(v12);
  v19 = 0;
LABEL_7:

  return v19;
}

- (BOOL)extractReselectedConfigFromVideoTier:(id)a3 videoStreamConfig:(id *)a4
{
  id v5;
  HMDVideoStreamConfig *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(HMDVideoStreamConfig);
  objc_msgSend(v5, "videoResolution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "resolutionType");
  if ((unint64_t)(v8 - 1) >= 0x1D)
    v9 = (uint64_t *)&kIPCameraUnknownParameter;
  else
    v9 = (uint64_t *)((char *)&unk_2226A0BB0 + 8 * v8 - 8);
  v10 = *v9;

  if (v10 == -1)
  {
    v21 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to translate image resolution", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }
  else
  {
    -[AVCMediaStreamConfig video](v6, "video");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setVideoResolution:", v10);

    objc_msgSend(v5, "framerate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");
    -[AVCMediaStreamConfig video](v6, "video");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFramerate:", v13);

    objc_msgSend(v5, "maxBitRate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntegerValue");
    -[AVCMediaStreamConfig video](v6, "video");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRxMaxBitrate:", v16);

    objc_msgSend(v5, "minBitRate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "unsignedIntegerValue");
    -[AVCMediaStreamConfig video](v6, "video");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setRxMinBitrate:", v19);

    *a4 = objc_retainAutorelease(v6);
  }

  return v10 != -1;
}

- (void)_loadConfig:(id)a3 sendSrtpParameters:(id)a4 receiveSrtpParameters:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "srtpMasterKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v8, "srtpMasterSalt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "appendData:", v12);
  objc_msgSend(v9, "setSendMasterKey:", v11);
  objc_msgSend(v7, "srtpMasterKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v7, "srtpMasterSalt");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "appendData:", v14);
  objc_msgSend(v9, "setReceiveMasterKey:", v15);

}

- (BOOL)_loadConfig:(id)a3 cipherCuite:(id)a4
{
  id v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;

  v5 = a3;
  v6 = objc_msgSend(a4, "srtpCryptoSuite");
  v7 = (uint64_t *)((char *)&unk_2226A0C98 + 8 * v6);
  if (v6 >= 3)
    v7 = (uint64_t *)&kIPCameraUnknownParameter;
  v8 = *v7;
  if (*v7 != -1)
  {
    objc_msgSend(v5, "setSRTPCipherSuite:", *v7);
    objc_msgSend(v5, "setSRTCPCipherSuite:", v8);
  }

  return v8 != -1;
}

- (void)_loadMiscConfig:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setRtcpEnabled:", 1);
  objc_msgSend(v3, "setRtcpTimeOutEnabled:", 1);
  objc_msgSend(v3, "setRtcpTimeOutInterval:", 30.0);
  objc_msgSend(v3, "setRtpTimeOutEnabled:", 1);
  objc_msgSend(v3, "setRtpTimeOutInterval:", 30.0);
  objc_msgSend(v3, "setRateAdaptationEnabled:", 1);

}

@end
