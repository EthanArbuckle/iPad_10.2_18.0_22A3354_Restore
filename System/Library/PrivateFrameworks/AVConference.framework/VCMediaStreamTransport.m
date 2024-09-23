@implementation VCMediaStreamTransport

- (VCMediaStreamTransport)initWithHandle:(tagHANDLE *)a3 localSSRC:(unsigned int)a4
{
  VCMediaStreamTransport *result;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaStreamTransport;
  result = -[VCMediaStreamTransport init](&v7, sel_init);
  if (result)
  {
    result->_payloadType = 1;
    result->_rtpHandle = a3;
    result->_localSSRC = a4;
  }
  return result;
}

- (void)dealloc
{
  tagVCCryptor *receiverSframeCryptor;
  tagVCCryptor *transmitterSframeCryptor;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  RTPCloseHandle();

  receiverSframeCryptor = self->_receiverSframeCryptor;
  if (receiverSframeCryptor)
    CFRelease(receiverSframeCryptor);
  transmitterSframeCryptor = self->_transmitterSframeCryptor;
  if (transmitterSframeCryptor)
    CFRelease(transmitterSframeCryptor);
  v5.receiver = self;
  v5.super_class = (Class)VCMediaStreamTransport;
  -[VCMediaStreamTransport dealloc](&v5, sel_dealloc);
}

- (void)setBasebandCongestionDetector:(id)a3
{

  self->_basebandCongestionDetector = (AVCBasebandCongestionDetector *)a3;
  RTPSetBasebandCongestionDetector((uint64_t)self->_rtpHandle, a3);
}

- (BOOL)isSameSRTPConfig:(id)a3
{
  int64_t v5;
  int64_t v6;

  v5 = -[VCMediaStreamConfig SRTPCipherSuite](self->_streamConfig, "SRTPCipherSuite");
  if (v5 == objc_msgSend(a3, "SRTPCipherSuite")
    && (v6 = -[VCMediaStreamConfig SRTCPCipherSuite](self->_streamConfig, "SRTCPCipherSuite"),
        v6 == objc_msgSend(a3, "SRTCPCipherSuite"))
    && +[VCMediaStreamTransport isSameSRTPKey:newKey:](VCMediaStreamTransport, "isSameSRTPKey:newKey:", -[VCMediaStreamConfig sendMediaKey](self->_streamConfig, "sendMediaKey"), objc_msgSend(a3, "sendMediaKey")))
  {
    return +[VCMediaStreamTransport isSameSRTPKey:newKey:](VCMediaStreamTransport, "isSameSRTPKey:newKey:", -[VCMediaStreamConfig receiveMediaKey](self->_streamConfig, "receiveMediaKey"), objc_msgSend(a3, "receiveMediaKey"));
  }
  else
  {
    return 0;
  }
}

- (void)updateLastGeneratedKeyMaterial
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Key material is not yet available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (int)onStart
{
  int v3;

  if (self->_transportStreamInfo.creationCallback)
  {
    v3 = -[VCMediaStreamTransport setupRTPWithTransportStreams](self, "setupRTPWithTransportStreams");
    if (v3 < 0)
      return v3;
  }
  else
  {
    v3 = 0;
  }
  RTPResetHandle();
  -[VCMediaStreamTransport updateLastGeneratedKeyMaterial](self, "updateLastGeneratedKeyMaterial");
  return v3;
}

- (void)onStop
{
  if (self->_transportStreamInfo.creationCallback)
    RTPClearTransportStreams();
}

- (BOOL)configureWithStreamConfig:(id)a3 setupInfo:(_VCMediaStreamTransportSetupInfo *)a4 reducedSizeRTCPPackets:(BOOL)a5 hopByHopEncryptRTCPPackets:(BOOL)a6 statisticsCollector:(id)a7 basebandCongestionDetector:(id)a8 error:(id *)a9
{
  uint64_t v11;
  _BOOL4 v12;
  VCMediaStreamTransport *v15;
  int setupType;
  __int128 v17;
  VCNetworkAddress *v18;
  uint64_t v19;
  VCNetworkAddress *v20;
  __int128 v21;
  _BOOL4 v22;
  int v23;
  int v24;
  id v25;
  id v26;
  tagHANDLE *rtpHandle;
  int v28;
  BOOL v29;
  unsigned __int16 v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  char IsOSFaultDisabled;
  NSObject *v35;
  _BOOL4 v36;
  const char *v37;
  uint64_t v38;
  char v39;
  NSObject *v40;
  const char *v41;
  const __CFString *v42;
  uint64_t datagramChannelToken;
  double v44;
  _BOOL4 isSRTPInitialized;
  char v46;
  char v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  const __CFString *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const __CFString *v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t v67;
  NSObject *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  NSObject *v80;
  const char *v81;
  NSObject *v82;
  uint32_t v83;
  uint32_t v84;
  id v86;
  unint64_t v87;
  id v88;
  _VCMediaStreamTransportSetupInfo *v89;
  id v90;
  VCMediaStreamTransport *v91;
  uint64_t *v92;
  socklen_t v93;
  _BYTE v94[128];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  unint64_t v101;
  sockaddr v102;
  _BYTE buf[48];
  __int16 v104;
  const char *v105;
  uint64_t v106;

  LODWORD(v11) = a6;
  v12 = a5;
  v15 = self;
  v106 = *MEMORY[0x1E0C80C00];
  LODWORD(v91) = -[VCMediaStreamTransport isSameSRTPConfig:](self, "isSameSRTPConfig:");

  v15->_streamConfig = (VCMediaStreamConfig *)a3;
  v92 = (uint64_t *)a9;
  if (!-[VCMediaStreamTransport setupRTPWithTransportSetupInfo:error:](v15, "setupRTPWithTransportSetupInfo:error:", a4, a9))
  {
    if ((VCMediaStreamTransport *)objc_opt_class() == v15)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 2)
        goto LABEL_137;
      v33 = VRTraceErrorLogLevelToCSTR();
      IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v35 = *MEMORY[0x1E0CF2758];
      if ((IsOSFaultDisabled & 1) != 0)
      {
        v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v36)
          return v36;
        if (v92)
        {
          if (*v92)
            v37 = (const char *)objc_msgSend((id)objc_msgSend((id)*v92, "description"), "UTF8String");
          else
            v37 = "<nil>";
        }
        else
        {
          v37 = "";
        }
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByH"
                              "opEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 150;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = v37;
        v70 = " [%s] %s:%d Setup error[%s]";
        goto LABEL_135;
      }
      v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
      if (!v36)
        return v36;
      if (v92)
      {
        if (*v92)
          v71 = (const char *)objc_msgSend((id)objc_msgSend((id)*v92, "description"), "UTF8String");
        else
          v71 = "<nil>";
      }
      else
      {
        v71 = "";
      }
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByHop"
                            "EncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 150;
      *(_WORD *)&buf[28] = 2080;
      *(_QWORD *)&buf[30] = v71;
      v81 = " [%s] %s:%d Setup error[%s]";
      v82 = v35;
      v83 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v32 = (const __CFString *)-[VCMediaStreamTransport performSelector:](v15, "performSelector:", sel_logPrefix);
      else
        v32 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 2)
        goto LABEL_137;
      v38 = VRTraceErrorLogLevelToCSTR();
      v39 = VRTraceIsOSFaultDisabled();
      v40 = *MEMORY[0x1E0CF2758];
      if ((v39 & 1) != 0)
      {
        v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v36)
          return v36;
        if (v92)
        {
          if (*v92)
            v41 = (const char *)objc_msgSend((id)objc_msgSend((id)*v92, "description"), "UTF8String");
          else
            v41 = "<nil>";
        }
        else
        {
          v41 = "";
        }
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByH"
                              "opEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 150;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v32;
        *(_WORD *)&buf[38] = 2048;
        *(_QWORD *)&buf[40] = v15;
        v104 = 2080;
        v105 = v41;
        v70 = " [%s] %s:%d %@(%p) Setup error[%s]";
        v80 = v40;
LABEL_130:
        v84 = 58;
        goto LABEL_136;
      }
      v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
      if (!v36)
        return v36;
      if (v92)
      {
        if (*v92)
          v60 = (const char *)objc_msgSend((id)objc_msgSend((id)*v92, "description"), "UTF8String");
        else
          v60 = "<nil>";
      }
      else
      {
        v60 = "";
      }
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByHop"
                            "EncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 150;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v32;
      *(_WORD *)&buf[38] = 2048;
      *(_QWORD *)&buf[40] = v15;
      v104 = 2080;
      v105 = v60;
      v81 = " [%s] %s:%d %@(%p) Setup error[%s]";
      v82 = v40;
      v83 = 58;
    }
    _os_log_fault_impl(&dword_1D8A54000, v82, OS_LOG_TYPE_FAULT, v81, buf, v83);
    goto LABEL_137;
  }
  setupType = a4->setupType;
  v90 = a7;
  switch(setupType)
  {
    case 0:
    case 3:
      goto LABEL_10;
    case 1:
      if (!-[NSString length](-[VCNetworkAddress ip](-[VCMediaStreamConfig remoteAddress](v15->_streamConfig, "remoteAddress"), "ip"), "length"))
      {
        v88 = a8;
        *(_QWORD *)&v102.sa_len = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v102.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
        v93 = 16;
        if (getpeername(a4->var0.socketInfo.rtpSocket, &v102, &v93) != -1)
        {
          v101 = 0xAAAAAAAAAAAAAAAALL;
          *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v99 = v17;
          v100 = v17;
          *(_OWORD *)&buf[16] = v17;
          *(_OWORD *)&buf[32] = v17;
          *(_OWORD *)buf = v17;
          SAToIPPORT();
          IPToString();
          v18 = -[VCMediaStreamConfig remoteAddress](v15->_streamConfig, "remoteAddress");
          -[VCNetworkAddress setIp:](v18, "setIp:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buf));
          -[VCNetworkAddress setPort:](v18, "setPort:", WORD2(v101));
          -[VCNetworkAddress setInterfaceName:](v18, "setInterfaceName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)&v99 + 4));
          if ((v99 & 1) != 0)
            v19 = 6;
          else
            v19 = 4;
          -[VCNetworkAddress setIpVersion:](v18, "setIpVersion:", v19);
        }
        a8 = v88;
      }
LABEL_10:
      v20 = -[VCMediaStreamConfig remoteAddress](v15->_streamConfig, "remoteAddress");
      if (-[NSString length](-[VCNetworkAddress ip](v20, "ip"), "length"))
      {
        v101 = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v99 = v21;
        v100 = v21;
        *(_OWORD *)&buf[16] = v21;
        *(_OWORD *)&buf[32] = v21;
        *(_OWORD *)buf = v21;
        -[NSString UTF8String](-[VCNetworkAddress ip](v20, "ip"), "UTF8String");
        v89 = a4;
        v22 = v12;
        v23 = v11;
        -[VCNetworkAddress port](v20, "port");
        MakeIPPORT();
        IPToString();
        v24 = RTPGetPacketMultiplexMode();
        v25 = a8;
        v26 = a3;
        rtpHandle = v15->_rtpHandle;
        v28 = -[VCNetworkAddress isIPv6](v20, "isIPv6");
        v29 = v24 == 2;
        LODWORD(v11) = v23;
        v12 = v22;
        a4 = v89;
        if (v29)
          v30 = WORD2(v101);
        else
          v30 = WORD2(v101) + 1;
        v31 = (uint64_t)rtpHandle;
        a3 = v26;
        a8 = v25;
        RTPSetDestination(v31, v28, buf, WORD2(v101), v30, 0, 1);
LABEL_34:
        RTPSetStreamDirection((uint64_t)v15->_rtpHandle, -[VCMediaStreamConfig direction](v15->_streamConfig, "direction"));
        v15->_rtcpXREnabled = VCDefaults_GetBoolValueForKey(CFSTR("rtcpXrEnabled"), -[VCMediaStreamConfig isRTCPXREnabled](v15->_streamConfig, "isRTCPXREnabled"));
        RTPSetRTCPEnabled((uint64_t)v15->_rtpHandle, -[VCMediaStreamConfig isRTCPEnabled](v15->_streamConfig, "isRTCPEnabled"));
        RTPSetRTCPXREnabled((uint64_t)v15->_rtpHandle, v15->_rtcpXREnabled);
        -[VCMediaStreamConfig rtcpSendInterval](v15->_streamConfig, "rtcpSendInterval");
        RTPSetRTCPSendInterval(v44);
        isSRTPInitialized = v15->_isSRTPInitialized;
        if (v15->_isSRTPInitialized)
          v46 = (char)v91;
        else
          v46 = 1;
        if ((v46 & 1) == 0)
        {
          SRTPCleanUpEncryption();
          isSRTPInitialized = v15->_isSRTPInitialized;
        }
        if (isSRTPInitialized)
          v47 = (char)v91;
        else
          v47 = 0;
        if ((v47 & 1) != 0)
          goto LABEL_45;
        v48 = -[VCMediaStreamTransport setupSRTP](v15, "setupSRTP");
        if ((v48 & 0x80000000) == 0)
        {
          v15->_isSRTPInitialized = 1;
LABEL_45:
          if (-[VCMediaStreamTransport setupSframeCryptorsWithError:](v15, "setupSframeCryptorsWithError:", v92))
          {
            if (-[NSString length](-[VCMediaStreamConfig cName](v15->_streamConfig, "cName"), "length"))
              RTPSetCName((int)v15->_rtpHandle, (_BYTE *)-[NSString UTF8String](-[VCMediaStreamConfig cName](v15->_streamConfig, "cName"), "UTF8String"));
            v88 = a8;
            if (-[VCMediaStreamConfig remoteSSRC](v15->_streamConfig, "remoteSSRC"))
              RTPSetRemoteSSRC((uint64_t)v15->_rtpHandle, -[VCMediaStreamConfig remoteSSRC](-[VCMediaStreamTransport streamConfig](v15, "streamConfig"), "remoteSSRC"));
            -[VCMediaStreamTransport registerRTPPayloadMappings](v15, "registerRTPPayloadMappings");
            v49 = -[VCMediaStreamTransport rxNetworkPayloads](v15, "rxNetworkPayloads");
            v50 = objc_msgSend(v49, "count");
            v92 = (uint64_t *)&v86;
            v51 = (4 * v50 + 15) & 0xFFFFFFFFFFFFFFF0;
            v52 = (char *)&v86 - v51;
            if (v50)
              memset((char *)&v86 - v51, 170, 4 * v50);
            v97 = 0u;
            v98 = 0u;
            v95 = 0u;
            v96 = 0u;
            v53 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v95, v94, 16);
            if (v53)
            {
              v54 = v53;
              v86 = a3;
              v89 = a4;
              v87 = __PAIR64__(v11, v12);
              v91 = v15;
              v55 = 0;
              v56 = *(_QWORD *)v96;
              do
              {
                v11 = 0;
                v57 = v55;
                v58 = v55;
                do
                {
                  if (*(_QWORD *)v96 != v56)
                    objc_enumerationMutation(v49);
                  v55 = v58 + 1;
                  *(_DWORD *)&v52[4 * v58++] = objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * v11++), "intValue", v86, v87);
                }
                while (v54 != v11);
                v54 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v95, v94, 16);
              }
              while (v54);
              v15 = v91;
              RTPSetRxPayloadList((uint64_t)v91->_rtpHandle, v57 + v11, v52);
              LOBYTE(v12) = v87;
              LOBYTE(v11) = BYTE4(v87);
              a4 = v89;
              a3 = v86;
            }
            if (objc_msgSend(a3, "cellularUniqueTag"))
              RTPSetCellularUniqueTag((uint64_t)v15->_rtpHandle, objc_msgSend(a3, "cellularUniqueTag"));
            RTPSetSourceRate((uint64_t)v15->_rtpHandle, a4->sourceRate);
            RTCPReducedSizePackets((uint64_t)v15->_rtpHandle, v12);
            RTCPSetHopByHopEncryptionEnabled((uint64_t)v15->_rtpHandle, v11);
            RTPSetStatisticsCollector((uint64_t)v15->_rtpHandle, v90);
            -[VCMediaStreamTransport setBasebandCongestionDetector:](v15, "setBasebandCongestionDetector:", v88);
            LOBYTE(v36) = 1;
            return v36;
          }
          if ((VCMediaStreamTransport *)objc_opt_class() != v15)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v59 = (const __CFString *)-[VCMediaStreamTransport performSelector:](v15, "performSelector:", sel_logPrefix);
            else
              v59 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v67 = VRTraceErrorLogLevelToCSTR();
              v68 = *MEMORY[0x1E0CF2758];
              v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
              if (!v36)
                return v36;
              v69 = (const char *)*v92;
              *(_DWORD *)buf = 136316418;
              *(_QWORD *)&buf[4] = v67;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:"
                                    "hopByHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 241;
              *(_WORD *)&buf[28] = 2112;
              *(_QWORD *)&buf[30] = v59;
              *(_WORD *)&buf[38] = 2048;
              *(_QWORD *)&buf[40] = v15;
              v104 = 2112;
              v105 = v69;
              v70 = " [%s] %s:%d %@(%p) SFrame cryptors setup error[%@]";
LABEL_129:
              v80 = v68;
              goto LABEL_130;
            }
            goto LABEL_137;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_137;
          v65 = VRTraceErrorLogLevelToCSTR();
          v66 = *MEMORY[0x1E0CF2758];
          v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (v36)
          {
            -[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:].cold.1(v65, v92, v66);
            goto LABEL_137;
          }
          return v36;
        }
        v61 = v48;
        v62 = (int)v48;
        v63 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamTransport.m", 230);
        +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", v92, 32018, 238, v62, v63, CFSTR("Failed to setup SRTP encryption"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setupSRTP failed with error %d"), v61));
        if ((VCMediaStreamTransport *)objc_opt_class() != v15)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v64 = (const __CFString *)-[VCMediaStreamTransport performSelector:](v15, "performSelector:", sel_logPrefix);
          else
            v64 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v78 = VRTraceErrorLogLevelToCSTR();
            v68 = *MEMORY[0x1E0CF2758];
            v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v36)
              return v36;
            if (v92)
            {
              if (*v92)
                v79 = (const char *)objc_msgSend((id)objc_msgSend((id)*v92, "description"), "UTF8String");
              else
                v79 = "<nil>";
            }
            else
            {
              v79 = "";
            }
            *(_DWORD *)buf = 136316418;
            *(_QWORD *)&buf[4] = v78;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:ho"
                                  "pByHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 233;
            *(_WORD *)&buf[28] = 2112;
            *(_QWORD *)&buf[30] = v64;
            *(_WORD *)&buf[38] = 2048;
            *(_QWORD *)&buf[40] = v15;
            v104 = 2080;
            v105 = v79;
            v70 = " [%s] %s:%d %@(%p) SRTP setup error[%s]";
            goto LABEL_129;
          }
          goto LABEL_137;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_137;
        v76 = VRTraceErrorLogLevelToCSTR();
        v35 = *MEMORY[0x1E0CF2758];
        v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v36)
          return v36;
        if (v92)
        {
          if (*v92)
            v77 = (const char *)objc_msgSend((id)objc_msgSend((id)*v92, "description"), "UTF8String");
          else
            v77 = "<nil>";
        }
        else
        {
          v77 = "";
        }
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v76;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByH"
                              "opEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 233;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = v77;
        v70 = " [%s] %s:%d SRTP setup error[%s]";
        goto LABEL_135;
      }
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v92, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamTransport.m", 188), CFSTR("Invalid Parameter"), CFSTR("Call with empty remoteIP address"));
      if ((VCMediaStreamTransport *)objc_opt_class() != v15)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v42 = (const __CFString *)-[VCMediaStreamTransport performSelector:](v15, "performSelector:", sel_logPrefix);
        else
          v42 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v74 = VRTraceErrorLogLevelToCSTR();
          v68 = *MEMORY[0x1E0CF2758];
          v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v36)
            return v36;
          if (v92)
          {
            if (*v92)
              v75 = (const char *)objc_msgSend((id)objc_msgSend((id)*v92, "description"), "UTF8String");
            else
              v75 = "<nil>";
          }
          else
          {
            v75 = "";
          }
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = v74;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopB"
                                "yHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 191;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v42;
          *(_WORD *)&buf[38] = 2048;
          *(_QWORD *)&buf[40] = v15;
          v104 = 2080;
          v105 = v75;
          v70 = " [%s] %s:%d %@(%p) error[%s]";
          goto LABEL_129;
        }
LABEL_137:
        LOBYTE(v36) = 0;
        return v36;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_137;
      v72 = VRTraceErrorLogLevelToCSTR();
      v35 = *MEMORY[0x1E0CF2758];
      v36 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (v36)
      {
        if (v92)
        {
          if (*v92)
            v73 = (const char *)objc_msgSend((id)objc_msgSend((id)*v92, "description"), "UTF8String");
          else
            v73 = "<nil>";
        }
        else
        {
          v73 = "";
        }
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v72;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByH"
                              "opEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 191;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = v73;
        v70 = " [%s] %s:%d error[%s]";
LABEL_135:
        v80 = v35;
        v84 = 38;
LABEL_136:
        _os_log_error_impl(&dword_1D8A54000, v80, OS_LOG_TYPE_ERROR, v70, buf, v84);
        goto LABEL_137;
      }
      return v36;
    case 2:
      datagramChannelToken = a4->datagramChannelToken;
      if ((_DWORD)datagramChannelToken)
        RTPSetDestinationWithToken((uint64_t)v15->_rtpHandle, datagramChannelToken, 0);
      goto LABEL_34;
    default:
      goto LABEL_34;
  }
}

- (BOOL)isSendingMedia:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "direction");
  if (v4 != 1)
    LOBYTE(v4) = objc_msgSend(a3, "direction") == 3;
  return v4;
}

- (tagVCCryptor)createSframeCryptorWithStreamConfig:(id)a3 ssrc:(unsigned int)a4 error:(id *)a5
{
  const void *v8;
  int v9;
  const __CFString *v10;
  tagVCCryptor *v11;
  tagVCCryptor *v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v13 = 0;
  if (!objc_msgSend(a3, "securityKeyHolder"))
  {
    v10 = CFSTR("Invalid SecurityKeyHolder");
    v9 = -2143748095;
LABEL_6:
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a5, 32038, 118, v9, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamTransport.m", 296), CFSTR("Create SFrame cryptor failed"), v10);
    return v13;
  }
  v14 = bswap32(a4);
  v8 = (const void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v14, 4);
  v9 = VCCryptor_Create(*MEMORY[0x1E0C9AE00], objc_msgSend(a3, "sframeCipherSuite"), v8, (const void *)objc_msgSend(a3, "securityKeyHolder"), 0, (uint64_t *)&v13);
  if (v9 < 0)
    v10 = CFSTR("VCCryptor_Create failed");
  else
    v10 = 0;
  v11 = v13;
  if (!v13)
    goto LABEL_6;
  return v11;
}

- (BOOL)setupSframeCryptorsWithError:(id *)a3
{
  tagVCCryptor *receiverSframeCryptor;
  tagVCCryptor *transmitterSframeCryptor;
  tagVCCryptor *v7;
  tagVCCryptor *v8;
  tagVCCryptor *v9;
  tagVCCryptor *v10;

  receiverSframeCryptor = self->_receiverSframeCryptor;
  if (receiverSframeCryptor)
  {
    CFRelease(receiverSframeCryptor);
    self->_receiverSframeCryptor = 0;
  }
  transmitterSframeCryptor = self->_transmitterSframeCryptor;
  if (transmitterSframeCryptor)
  {
    CFRelease(transmitterSframeCryptor);
    self->_transmitterSframeCryptor = 0;
  }
  if (!-[VCMediaStreamConfig sframeCipherSuite](self->_streamConfig, "sframeCipherSuite"))
    goto LABEL_9;
  v7 = -[VCMediaStreamTransport createSframeCryptorWithStreamConfig:ssrc:error:](self, "createSframeCryptorWithStreamConfig:ssrc:error:", self->_streamConfig, -[VCMediaStreamConfig remoteSSRC](self->_streamConfig, "remoteSSRC"), a3);
  self->_receiverSframeCryptor = v7;
  if (v7)
  {
    if (!-[VCMediaStreamTransport isSendingMedia:](self, "isSendingMedia:", self->_streamConfig)
      || (v8 = -[VCMediaStreamTransport createSframeCryptorWithStreamConfig:ssrc:error:](self, "createSframeCryptorWithStreamConfig:ssrc:error:", self->_streamConfig, self->_localSSRC, a3), (self->_transmitterSframeCryptor = v8) != 0))
    {
LABEL_9:
      LOBYTE(v9) = 1;
      return (char)v9;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStreamTransport setupSframeCryptorsWithError:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaStreamTransport setupSframeCryptorsWithError:].cold.1();
  }
  v10 = self->_receiverSframeCryptor;
  if (v10)
  {
    CFRelease(v10);
    self->_receiverSframeCryptor = 0;
  }
  v9 = self->_transmitterSframeCryptor;
  if (v9)
  {
    CFRelease(v9);
    LOBYTE(v9) = 0;
    self->_transmitterSframeCryptor = 0;
  }
  return (char)v9;
}

- (void)reset
{
  RTPResetHandle();
}

- (void)resetPayloadMapping
{
  RTPResetPayloadMapping();
}

- (void)sendControlPacketWithParameters:(_RTCP_SEND_CONTROL_PARAMETERS *)a3
{
  RTPSendControlPacket((uint64_t)self->_rtpHandle, (int *)a3);
}

+ (int)getSRTPMediaKeyLength:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 0xA)
    return 0;
  else
    return dword_1D910F2B8[a3 + 1];
}

+ (int)SRTPCipherSuiteForVCMediaStreamCipherSuite:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) >= 0xB)
    return 0;
  else
    return a3;
}

+ (BOOL)isSameSRTPKey:(id)a3 newKey:(id)a4
{
  if (a3)
    return objc_msgSend(a3, "isEqualToData:", a4);
  else
    return a4 == 0;
}

- (int)getCryptoSet:(tagSRTPExchangeInfo *)a3 withMediaKey:(id)a4
{
  int64_t v7;
  int64_t v8;
  int v9;
  int64_t v10;
  int v11;
  size_t v12;
  uint64_t v13;
  uint8_t *v14;
  int v15;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  _BYTE v34[10];
  VCMediaStreamTransport *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = -[VCMediaStreamConfig SRTPCipherSuite](self->_streamConfig, "SRTPCipherSuite");
  v8 = -[VCMediaStreamConfig SRTCPCipherSuite](self->_streamConfig, "SRTCPCipherSuite");
  v9 = +[VCMediaStreamTransport getSRTPMediaKeyLength:](VCMediaStreamTransport, "getSRTPMediaKeyLength:", v7);
  if (v9 <= +[VCMediaStreamTransport getSRTPMediaKeyLength:](VCMediaStreamTransport, "getSRTPMediaKeyLength:", v8))v10 = v8;
  else
    v10 = v7;
  v11 = +[VCMediaStreamTransport getSRTPMediaKeyLength:](VCMediaStreamTransport, "getSRTPMediaKeyLength:", v10);
  v12 = (v11 + 14);
  v13 = (v12 + 15) & 0x1FFFFFFF0;
  v14 = &buf[-v13];
  if (v11 != -14)
    memset(&buf[-v13], 170, v12);
  if (!(v7 | v8))
  {
    bzero(v14, (int)v12);
LABEL_10:
    ByteToHex((unint64_t)a3, 65, v14, v11);
    ByteToHex((unint64_t)a3->var1, 29, &v14[v11], 14);
    v15 = 0;
    a3->var2 = 0;
    return v15;
  }
  if ((_DWORD)v12 == objc_msgSend(a4, "length"))
  {
    objc_msgSend(a4, "getBytes:length:", v14, (int)v12);
    goto LABEL_10;
  }
  v15 = -2145255423;
  if ((VCMediaStreamTransport *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v20 = objc_msgSend(a4, "length");
        *(_DWORD *)buf = 136316162;
        v28 = v18;
        v29 = 2080;
        v30 = "-[VCMediaStreamTransport getCryptoSet:withMediaKey:]";
        v31 = 1024;
        v32 = 404;
        v33 = 1024;
        *(_DWORD *)v34 = v12;
        *(_WORD *)&v34[4] = 1024;
        *(_DWORD *)&v34[6] = v20;
        v21 = " [%s] %s:%d unexpected media key/salt length (expected[%d], given[%d])";
        v22 = v19;
        v23 = 40;
LABEL_22:
        _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCMediaStreamTransport performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v26 = objc_msgSend(a4, "length");
        *(_DWORD *)buf = 136316674;
        v28 = v24;
        v29 = 2080;
        v30 = "-[VCMediaStreamTransport getCryptoSet:withMediaKey:]";
        v31 = 1024;
        v32 = 404;
        v33 = 2112;
        *(_QWORD *)v34 = v17;
        *(_WORD *)&v34[8] = 2048;
        v35 = self;
        v36 = 1024;
        v37 = v12;
        v38 = 1024;
        v39 = v26;
        v21 = " [%s] %s:%d %@(%p) unexpected media key/salt length (expected[%d], given[%d])";
        v22 = v25;
        v23 = 60;
        goto LABEL_22;
      }
    }
  }
  return v15;
}

- (int)setupSRTP
{
  int v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  __CFString *v24;
  __CFString *v25;
  _BOOL4 v26;
  char *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  NSObject *v32;
  __CFString *v33;
  __CFString *v34;
  _BOOL4 v35;
  char *v36;
  int v37;
  VCMediaStreamTransport *v38;
  const __CFString *v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  NSObject *v43;
  uint32_t v44;
  uint64_t v45;
  NSObject *v46;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  uint64_t v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  VCMediaStreamTransport *v65;
  __int16 v66;
  _BYTE v67[18];
  __int16 v68;
  _BOOL4 v69;
  __int16 v70;
  char *v71;
  _OWORD v72[6];
  unint64_t v73;
  _BYTE buf[48];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  unint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v3 = SRTPPrepareEncryption();
  if ((v3 & 0x80000000) == 0)
  {
    if (!-[VCDefaults forceDisableMediaEncryption](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableMediaEncryption"))goto LABEL_25;
    if ((VCMediaStreamTransport *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCMediaStreamTransport setupSRTP]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 446;
      v9 = " [%s] %s:%d Disabling rtp and rtcp encryption";
      v10 = v8;
      v11 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)-[VCMediaStreamTransport performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCMediaStreamTransport setupSRTP]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 446;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v4;
      *(_WORD *)&buf[38] = 2048;
      *(_QWORD *)&buf[40] = self;
      v9 = " [%s] %s:%d %@(%p) Disabling rtp and rtcp encryption";
      v10 = v15;
      v11 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_24:
    -[VCMediaStreamConfig setSRTPCipherSuite:](self->_streamConfig, "setSRTPCipherSuite:", 0);
    -[VCMediaStreamConfig setSRTCPCipherSuite:](self->_streamConfig, "setSRTCPCipherSuite:", 0);
LABEL_25:
    v78 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v76 = v16;
    v77 = v16;
    *(_OWORD *)&buf[32] = v16;
    v75 = v16;
    *(_OWORD *)buf = v16;
    *(_OWORD *)&buf[16] = v16;
    v73 = 0xAAAAAAAAAAAAAAAALL;
    v72[4] = v16;
    v72[5] = v16;
    v72[2] = v16;
    v72[3] = v16;
    v72[0] = v16;
    v72[1] = v16;
    v17 = -[VCMediaStreamTransport getCryptoSet:withMediaKey:](self, "getCryptoSet:withMediaKey:", buf, -[VCMediaStreamConfig sendMediaKey](self->_streamConfig, "sendMediaKey"));
    if (v17 < 0)
    {
      v5 = v17;
      if ((VCMediaStreamTransport *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaStreamTransport setupSRTP].cold.2();
        }
        goto LABEL_82;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v48 = (const __CFString *)-[VCMediaStreamTransport performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v48 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_82;
      v51 = VRTraceErrorLogLevelToCSTR();
      v52 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_82;
      v56 = 136316162;
      v57 = v51;
      v58 = 2080;
      v59 = "-[VCMediaStreamTransport setupSRTP]";
      v60 = 1024;
      v61 = 456;
      v62 = 2112;
      v63 = v48;
      v64 = 2048;
      v65 = self;
      v53 = " [%s] %s:%d %@(%p) create send crypto set failed";
      goto LABEL_84;
    }
    v18 = -[VCMediaStreamTransport getCryptoSet:withMediaKey:](self, "getCryptoSet:withMediaKey:", v72, -[VCMediaStreamConfig receiveMediaKey](-[VCMediaStreamTransport streamConfig](self, "streamConfig"), "receiveMediaKey"));
    if (v18 < 0)
    {
      v5 = v18;
      if ((VCMediaStreamTransport *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaStreamTransport setupSRTP].cold.3();
        }
        goto LABEL_82;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v49 = (const __CFString *)-[VCMediaStreamTransport performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v49 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_82;
      v54 = VRTraceErrorLogLevelToCSTR();
      v52 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_82;
      v56 = 136316162;
      v57 = v54;
      v58 = 2080;
      v59 = "-[VCMediaStreamTransport setupSRTP]";
      v60 = 1024;
      v61 = 459;
      v62 = 2112;
      v63 = v49;
      v64 = 2048;
      v65 = self;
      v53 = " [%s] %s:%d %@(%p) create receive crypto set failed";
      goto LABEL_84;
    }
    v19 = +[VCMediaStreamTransport SRTPCipherSuiteForVCMediaStreamCipherSuite:](VCMediaStreamTransport, "SRTPCipherSuiteForVCMediaStreamCipherSuite:", -[VCMediaStreamConfig SRTPCipherSuite](self->_streamConfig, "SRTPCipherSuite"));
    v20 = +[VCMediaStreamTransport SRTPCipherSuiteForVCMediaStreamCipherSuite:](VCMediaStreamTransport, "SRTPCipherSuiteForVCMediaStreamCipherSuite:", -[VCMediaStreamConfig SRTCPCipherSuite](self->_streamConfig, "SRTCPCipherSuite"));
    if ((VCMediaStreamTransport *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_38;
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_38;
      v24 = _VCMediaStreamTransport_CipherSuiteAsString(v19);
      v25 = _VCMediaStreamTransport_CipherSuiteAsString(v20);
      v26 = -[VCMediaStreamMultiwayConfig isOneToOne](-[VCMediaStreamConfig multiwayConfig](self->_streamConfig, "multiwayConfig"), "isOneToOne");
      v27 = FourccToCStr(-[VCMediaStreamMultiwayConfig streamGroupID](-[VCMediaStreamConfig multiwayConfig](self->_streamConfig, "multiwayConfig"), "streamGroupID"));
      v56 = 136316674;
      v57 = v22;
      v58 = 2080;
      v59 = "-[VCMediaStreamTransport setupSRTP]";
      v60 = 1024;
      v61 = 463;
      v62 = 2112;
      v63 = v24;
      v64 = 2112;
      v65 = (VCMediaStreamTransport *)v25;
      v66 = 1024;
      *(_DWORD *)v67 = v26;
      *(_WORD *)&v67[4] = 2080;
      *(_QWORD *)&v67[6] = v27;
      v28 = " [%s] %s:%d Configuring srtpCipherSuite=%@, srtcpCipherSuite=%@, isOneToOne=%{BOOL}d, streamGroupID=%s";
      v29 = v23;
      v30 = 64;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v21 = (const __CFString *)-[VCMediaStreamTransport performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v21 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_38;
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_38;
      v33 = _VCMediaStreamTransport_CipherSuiteAsString(v19);
      v34 = _VCMediaStreamTransport_CipherSuiteAsString(v20);
      v35 = -[VCMediaStreamMultiwayConfig isOneToOne](-[VCMediaStreamConfig multiwayConfig](self->_streamConfig, "multiwayConfig"), "isOneToOne");
      v36 = FourccToCStr(-[VCMediaStreamMultiwayConfig streamGroupID](-[VCMediaStreamConfig multiwayConfig](self->_streamConfig, "multiwayConfig"), "streamGroupID"));
      v56 = 136317186;
      v57 = v31;
      v58 = 2080;
      v59 = "-[VCMediaStreamTransport setupSRTP]";
      v60 = 1024;
      v61 = 463;
      v62 = 2112;
      v63 = v21;
      v64 = 2048;
      v65 = self;
      v66 = 2112;
      *(_QWORD *)v67 = v33;
      *(_WORD *)&v67[8] = 2112;
      *(_QWORD *)&v67[10] = v34;
      v68 = 1024;
      v69 = v35;
      v70 = 2080;
      v71 = v36;
      v28 = " [%s] %s:%d %@(%p) Configuring srtpCipherSuite=%@, srtcpCipherSuite=%@, isOneToOne=%{BOOL}d, streamGroupID=%s";
      v29 = v32;
      v30 = 84;
    }
    _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v56, v30);
LABEL_38:
    SRTPUseEncryption((uint64_t)self->_rtpHandle, (uint64_t)buf, (uint64_t)v72, v19, v20, 2u);
    v5 = v37;
    v38 = (VCMediaStreamTransport *)objc_opt_class();
    if ((v5 & 0x80000000) == 0)
    {
      if (v38 == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_50;
        v40 = VRTraceErrorLogLevelToCSTR();
        v41 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_50;
        v56 = 136315650;
        v57 = v40;
        v58 = 2080;
        v59 = "-[VCMediaStreamTransport setupSRTP]";
        v60 = 1024;
        v61 = 472;
        v42 = " [%s] %s:%d SRTPUseEncryption completed";
        v43 = v41;
        v44 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v39 = (const __CFString *)-[VCMediaStreamTransport performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v39 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_50;
        v45 = VRTraceErrorLogLevelToCSTR();
        v46 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_50;
        v56 = 136316162;
        v57 = v45;
        v58 = 2080;
        v59 = "-[VCMediaStreamTransport setupSRTP]";
        v60 = 1024;
        v61 = 472;
        v62 = 2112;
        v63 = v39;
        v64 = 2048;
        v65 = self;
        v42 = " [%s] %s:%d %@(%p) SRTPUseEncryption completed";
        v43 = v46;
        v44 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_DEFAULT, v42, (uint8_t *)&v56, v44);
LABEL_50:
      self->_encryptionInfoReceived = 0;
LABEL_51:
      SRTPClearExchangeInfo((uint64_t)buf);
      SRTPClearExchangeInfo((uint64_t)v72);
      return v5;
    }
    if (v38 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStreamTransport setupSRTP].cold.4();
      }
      goto LABEL_82;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v50 = (const __CFString *)-[VCMediaStreamTransport performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v50 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v55 = VRTraceErrorLogLevelToCSTR(),
          v52 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_82:
      SRTPCancelEncryption();
      goto LABEL_51;
    }
    v56 = 136316162;
    v57 = v55;
    v58 = 2080;
    v59 = "-[VCMediaStreamTransport setupSRTP]";
    v60 = 1024;
    v61 = 466;
    v62 = 2112;
    v63 = v50;
    v64 = 2048;
    v65 = self;
    v53 = " [%s] %s:%d %@(%p) SRTPUseEncryption failed";
LABEL_84:
    _os_log_error_impl(&dword_1D8A54000, v52, OS_LOG_TYPE_ERROR, v53, (uint8_t *)&v56, 0x30u);
    goto LABEL_82;
  }
  v5 = v3;
  if ((VCMediaStreamTransport *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStreamTransport setupSRTP].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCMediaStreamTransport performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCMediaStreamTransport setupSRTP]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 440;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v6;
        *(_WORD *)&buf[38] = 2048;
        *(_QWORD *)&buf[40] = self;
        _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) SRTPPrepareEncryption failed", buf, 0x30u);
      }
    }
  }
  return v5;
}

- (BOOL)setupRTPWithSockets:(_VCMediaStreamTransportSetupInfo *)a3 error:(id *)a4
{
  int rtcpSocket;
  int rtpSocket;
  int v9;
  uint64_t v11;

  rtcpSocket = a3->var0.socketInfo.rtcpSocket;
  rtpSocket = a3->var0.socketInfo.rtpSocket;
  if (rtcpSocket == rtpSocket)
  {
    v9 = RTPSetPacketMultiplexMode((uint64_t)self->_rtpHandle, 2);
    if (v9 < 0)
    {
      v11 = 492;
      goto LABEL_8;
    }
    rtpSocket = a3->var0.socketInfo.rtpSocket;
    rtcpSocket = a3->var0.socketInfo.rtcpSocket;
  }
  v9 = RTPSetSockets((uint64_t)self->_rtpHandle, rtpSocket, rtcpSocket);
  if ((v9 & 0x80000000) == 0)
    return 1;
  v11 = 505;
LABEL_8:
  +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a4, 32016, 105, v9, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamTransport.m", v11), CFSTR("Could not setup RTP"), CFSTR("RTPSetSockets failed"));
  return 0;
}

- (int)setupRTPWithTransportStreams
{
  uint64_t (*creationCallback)(void *, uint64_t, _QWORD, CFTypeRef *);
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  int v8;
  CFTypeRef v9;
  int v10;
  CFTypeRef v12;
  CFTypeRef v13;
  CFTypeRef cf[2];

  cf[1] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v13 = 0;
  cf[0] = 0;
  v12 = 0;
  creationCallback = (uint64_t (*)(void *, uint64_t, _QWORD, CFTypeRef *))self->_transportStreamInfo.creationCallback;
  if (creationCallback)
  {
    if (self->_payloadType == 1)
      v4 = 6;
    else
      v4 = 4;
    if (self->_payloadType == 1)
      v5 = 5;
    else
      v5 = 3;
    if (self->_transportStreamInfo.isReceiveExternallyScheduled)
    {
      v6 = objc_alloc(MEMORY[0x1E0C99D80]);
      v7 = (void *)objc_msgSend(v6, "initWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], CFSTR("IsReceiveExternallyScheduled"), 0);
      v8 = ((uint64_t (*)(void *, uint64_t, void *, CFTypeRef *))self->_transportStreamInfo.creationCallback)(self->_transportStreamInfo.context, v5, v7, cf);
    }
    else
    {
      v7 = 0;
      v8 = creationCallback(self->_transportStreamInfo.context, v5, 0, cf);
    }
    if (v8 < 0)
      goto LABEL_19;
    v8 = ((uint64_t (*)(void *, uint64_t, void *, CFTypeRef *))self->_transportStreamInfo.creationCallback)(self->_transportStreamInfo.context, v4, v7, &v13);
    if (v8 < 0)
      goto LABEL_19;
    if (self->_payloadType || !-[VCMediaStreamConfig cellularUniqueTag](self->_streamConfig, "cellularUniqueTag"))
    {
      v9 = 0;
    }
    else
    {
      v8 = ((uint64_t (*)(void *, uint64_t, void *, CFTypeRef *))self->_transportStreamInfo.creationCallback)(self->_transportStreamInfo.context, 1, v7, &v12);
      if (v8 < 0)
      {
LABEL_19:
        v10 = v8;
        goto LABEL_20;
      }
      v9 = v12;
    }
    v8 = RTPSetTransportStreams((uint64_t)self->_rtpHandle, cf[0], v13, v9);
    goto LABEL_19;
  }
  v10 = -2143748035;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaStreamTransport setupRTPWithTransportStreams].cold.1();
  }
  v7 = 0;
LABEL_20:
  if (cf[0])
    CFRelease(cf[0]);
  if (v13)
    CFRelease(v13);
  if (v12)
    CFRelease(v12);

  return v10;
}

- (BOOL)setupRTPWithNWConnection:(_VCMediaStreamTransportSetupInfo *)a3 error:(id *)a4
{
  int v7;
  const __CFString *v9;
  uint64_t v10;

  v7 = RTPSetPacketMultiplexMode((uint64_t)self->_rtpHandle, 2);
  if (v7 < 0)
  {
    v9 = CFSTR("RTPSetSockets failed");
    v10 = 566;
  }
  else
  {
    v7 = RTPSetNWConnections((uint64_t)self->_rtpHandle, a3->var0.transportStreamInfo.context);
    if ((v7 & 0x80000000) == 0)
      return 1;
    v9 = CFSTR("RTPSetNWConnections failed");
    v10 = 578;
  }
  +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a4, 32016, 105, v7, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamTransport.m", v10), CFSTR("Could not setup RTP"), v9);
  return 0;
}

- (BOOL)setupRTPForIDS:(id *)a3
{
  int v4;
  const __CFString *v6;
  uint64_t v7;

  v4 = RTPSetPacketMultiplexMode((uint64_t)self->_rtpHandle, 2);
  if (v4 < 0)
  {
    v6 = CFSTR("RTP set multiplex mode failed");
    v7 = 594;
  }
  else
  {
    v4 = RTPCreateSocketsForIDS();
    if ((v4 & 0x80000000) == 0)
      return 1;
    v6 = CFSTR("RTP set IDS descriptor");
    v7 = 606;
  }
  +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32016, 105, v4, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamTransport.m", v7), CFSTR("Could not setup RTP"), v6);
  return 0;
}

- (BOOL)setupRTPWithIPInfo:(_VCMediaStreamTransportSetupInfo *)a3 error:(id *)a4
{
  int v5;
  int v6;

  RTPCreateSocketsRetryBind((uint64_t)self->_rtpHandle, (__int128 *)&a3->var0.socketInfo, (uint64_t)(&a3->var0.nwConnection + 5), 0);
  v6 = v5;
  if (v5 < 0)
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a4, 32016, 105, v5, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamTransport.m", 621), CFSTR("Could not setup RTP"), CFSTR("RTPCreateSocketsRetryBind failed"));
  return v6 >= 0;
}

- (BOOL)setupRTPWithTransportSetupInfo:(_VCMediaStreamTransportSetupInfo *)a3 error:(id *)a4
{
  BOOL result;
  __int128 v5;

  switch(a3->setupType)
  {
    case 1u:
      result = -[VCMediaStreamTransport setupRTPWithSockets:error:](self, "setupRTPWithSockets:error:");
      break;
    case 2u:
      result = -[VCMediaStreamTransport setupRTPForIDS:](self, "setupRTPForIDS:", a4);
      break;
    case 3u:
      result = -[VCMediaStreamTransport setupRTPWithIPInfo:error:](self, "setupRTPWithIPInfo:error:");
      break;
    case 4u:
      result = -[VCMediaStreamTransport setupRTPWithNWConnection:error:](self, "setupRTPWithNWConnection:error:");
      break;
    case 5u:
      v5 = *(_OWORD *)&a3->var0.socketInfo.rtpSocket;
      *(_QWORD *)&self->_transportStreamInfo.isReceiveExternallyScheduled = *((_QWORD *)&a3->var0.nwConnection + 2);
      *(_OWORD *)&self->_transportStreamInfo.context = v5;
      result = 1;
      break;
    default:
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamTransport.m", 652), CFSTR("Setup type not set"), CFSTR("Invalid setup type"));
      result = 0;
      break;
  }
  return result;
}

- (void)registerRTPPayloadMappings
{
  NSDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  int v10;
  unsigned __int16 v11;
  int v12;
  unsigned __int16 v13;
  NSDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  int v20;
  int v21;
  unsigned __int16 v22;
  int v23;
  unsigned __int16 v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  RTPResetPayloadMapping();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v3 = -[VCMediaStreamConfig allTxPayloadMap](self->_streamConfig, "allTxPayloadMap");
  v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "unsignedIntValue");
        v10 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[VCMediaStreamConfig allTxPayloadMap](self->_streamConfig, "allTxPayloadMap"), "objectForKeyedSubscript:", v8), "unsignedShortValue");
        if (v10 == 0xFFFF)
          v11 = v9;
        else
          v11 = v10;
        v12 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[VCMediaStreamConfig allRxPayloadMap](self->_streamConfig, "allRxPayloadMap"), "objectForKeyedSubscript:", v8), "unsignedShortValue");
        if (v12 == 0xFFFF)
          v13 = v9;
        else
          v13 = v12;
        RTPAddMappingForPayload((uint64_t)self->_rtpHandle, v11, v13, v9);
      }
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
    }
    while (v5);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = -[VCMediaStreamConfig allRxPayloadMap](self->_streamConfig, "allRxPayloadMap");
  v15 = -[NSDictionary countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        v20 = objc_msgSend(v19, "unsignedIntValue");
        v21 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[VCMediaStreamConfig allRxPayloadMap](self->_streamConfig, "allRxPayloadMap"), "objectForKeyedSubscript:", v19), "unsignedShortValue");
        if (v21 == 0xFFFF)
          v22 = v20;
        else
          v22 = v21;
        v23 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[VCMediaStreamConfig allTxPayloadMap](self->_streamConfig, "allTxPayloadMap"), "objectForKeyedSubscript:", v19), "unsignedShortValue");
        if (v23 == 0xFFFF)
          v24 = v20;
        else
          v24 = v23;
        RTPAddMappingForPayload((uint64_t)self->_rtpHandle, v24, v22, v20);
      }
      v16 = -[NSDictionary countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    }
    while (v16);
  }
}

- (id)rxNetworkPayloads
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unsigned __int16 v10;
  int v11;
  unsigned __int16 v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = -[VCMediaStreamConfig rxPayloadMap](self->_streamConfig, "rxPayloadMap");
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "unsignedIntValue");
        v11 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[VCMediaStreamConfig rxPayloadMap](self->_streamConfig, "rxPayloadMap"), "objectForKeyedSubscript:", v9), "unsignedShortValue");
        if (v11 == 0xFFFF)
          v12 = v10;
        else
          v12 = v11;
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v12));
      }
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v6);
  }
  return v3;
}

- (double)lastReceivedRTCPPacketTime
{
  int v3;
  int v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  double v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  VCMediaStreamTransport *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = NAN;
  v3 = RTPGetLatestRTCPTimestamp((uint64_t)self->_rtpHandle, &v9);
  if (v3 < 0)
  {
    v5 = v3;
    if ((VCMediaStreamTransport *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStreamTransport lastReceivedRTCPPacketTime].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCMediaStreamTransport performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v11 = v7;
          v12 = 2080;
          v13 = "-[VCMediaStreamTransport lastReceivedRTCPPacketTime]";
          v14 = 1024;
          v15 = 706;
          v16 = 2112;
          v17 = v6;
          v18 = 2048;
          v19 = self;
          v20 = 1024;
          v21 = v5;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to retrieve last RTCP timesamp. error=%d", buf, 0x36u);
        }
      }
    }
  }
  return v9;
}

- (void)handleEncryptionInfoChange:(id)a3
{
  BOOL v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  VCMediaStreamTransport *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_isSRTPInitialized)
  {
    if (-[VCMediaStreamConfig SRTPCipherSuite](self->_streamConfig, "SRTPCipherSuite"))
      v5 = SRTPUpdateKeyMaterial((uint64_t)self->_rtpHandle, (const __CFDictionary *)a3) == 0;
    else
      v5 = 1;
    self->_encryptionInfoReceived = v5;
  }
  else
  {
    if ((VCMediaStreamTransport *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStreamTransport handleEncryptionInfoChange:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCMediaStreamTransport performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v9 = 136316162;
          v10 = v7;
          v11 = 2080;
          v12 = "-[VCMediaStreamTransport handleEncryptionInfoChange:]";
          v13 = 1024;
          v14 = 715;
          v15 = 2112;
          v16 = v6;
          v17 = 2048;
          v18 = self;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) SRTP should be initialized first before we can update security key material", (uint8_t *)&v9, 0x30u);
        }
      }
    }
    self->_encryptionInfoReceived = 0;
  }
}

- (void)setRtcpEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[VCMediaStreamConfig isRTCPEnabled](self->_streamConfig, "isRTCPEnabled") != a3)
  {
    -[VCMediaStreamConfig setRtcpEnabled:](self->_streamConfig, "setRtcpEnabled:", v3);
    RTPSetRTCPEnabled((uint64_t)self->_rtpHandle, v3);
  }
}

- (BOOL)isRTCPEnabled
{
  return -[VCMediaStreamConfig isRTCPEnabled](self->_streamConfig, "isRTCPEnabled");
}

- (BOOL)isRTCPXREnabled
{
  return self->_rtcpXREnabled;
}

- (double)rtcpSendInterval
{
  double result;

  -[VCMediaStreamConfig rtcpSendInterval](self->_streamConfig, "rtcpSendInterval");
  return result;
}

- (void)setRtcpSendInterval:(double)a3
{
  double v5;

  -[VCMediaStreamConfig rtcpSendInterval](self->_streamConfig, "rtcpSendInterval");
  if (v5 != a3)
  {
    -[VCMediaStreamConfig setRtcpSendInterval:](self->_streamConfig, "setRtcpSendInterval:", a3);
    RTPSetRTCPSendInterval(a3);
  }
}

- (BOOL)isRTCPSendEnabled
{
  _BOOL4 v3;
  double v4;

  v3 = -[VCMediaStreamConfig isRTCPEnabled](self->_streamConfig, "isRTCPEnabled");
  if (v3)
  {
    -[VCMediaStreamConfig rtcpSendInterval](self->_streamConfig, "rtcpSendInterval");
    LOBYTE(v3) = v4 > 0.0;
  }
  return v3;
}

- (BOOL)isRTPTimeoutEnabled
{
  _BOOL4 v3;
  double v4;

  v3 = -[VCMediaStreamConfig isRTPTimeOutEnabled](self->_streamConfig, "isRTPTimeOutEnabled");
  if (v3)
  {
    -[VCMediaStreamConfig rtpTimeOutInterval](self->_streamConfig, "rtpTimeOutInterval");
    LOBYTE(v3) = v4 > 0.0;
  }
  return v3;
}

- (void)setRtpTimeoutEnabled:(BOOL)a3
{
  -[VCMediaStreamConfig setRtpTimeOutEnabled:](self->_streamConfig, "setRtpTimeOutEnabled:", a3);
}

- (void)setRtpTimeoutInterval:(double)a3
{
  -[VCMediaStreamConfig setRtpTimeOutInterval:](self->_streamConfig, "setRtpTimeOutInterval:", a3);
}

- (double)rtpTimeoutInterval
{
  double result;

  -[VCMediaStreamConfig rtpTimeOutInterval](self->_streamConfig, "rtpTimeOutInterval");
  return result;
}

- (BOOL)isRTCPTimeoutEnabled
{
  _BOOL4 v3;
  double v4;

  v3 = -[VCMediaStreamConfig isRTCPTimeOutEnabled](self->_streamConfig, "isRTCPTimeOutEnabled");
  if (v3)
  {
    -[VCMediaStreamConfig rtcpTimeOutInterval](self->_streamConfig, "rtcpTimeOutInterval");
    LOBYTE(v3) = v4 > 0.0;
  }
  return v3;
}

- (void)setRtcpTimeoutEnabled:(BOOL)a3
{
  -[VCMediaStreamConfig setRtcpTimeOutEnabled:](self->_streamConfig, "setRtcpTimeOutEnabled:", a3);
}

- (void)setRtcpTimeoutInterval:(double)a3
{
  -[VCMediaStreamConfig setRtcpTimeOutInterval:](self->_streamConfig, "setRtcpTimeOutInterval:", a3);
}

- (double)rtcpTimeoutInterval
{
  double result;

  -[VCMediaStreamConfig rtcpTimeOutInterval](self->_streamConfig, "rtcpTimeOutInterval");
  return result;
}

- (BOOL)isDecryptionTimeoutEnabled
{
  _BOOL4 v3;
  double v4;

  v3 = -[VCMediaStreamConfig isDecryptionTimeOutEnabled](self->_streamConfig, "isDecryptionTimeOutEnabled");
  if (v3)
  {
    -[VCMediaStreamConfig decryptionTimeOutInterval](self->_streamConfig, "decryptionTimeOutInterval");
    LOBYTE(v3) = v4 > 0.0;
  }
  return v3;
}

- (void)setDecryptionTimeoutEnabled:(BOOL)a3
{
  -[VCMediaStreamConfig setDecryptionTimeOutEnabled:](self->_streamConfig, "setDecryptionTimeOutEnabled:", a3);
}

- (BOOL)sendIntervalDidElapse:(int *)a3 remainingTime:(double *)a4
{
  return (int)RTPCheckRTCPSendIntervalElapsed((uint64_t)self->_rtpHandle, a3, a4) >= 0;
}

- (BOOL)setThrottlingInterval:(double)a3
{
  return (int)RTPSetThrottlingAudioInterval(a3) >= 0;
}

- (int64_t)streamDirection
{
  return -[VCMediaStreamConfig direction](self->_streamConfig, "direction");
}

- (void)setStreamDirection:(int64_t)a3
{
  RTPSetStreamDirection((uint64_t)self->_rtpHandle, a3);
  -[VCMediaStreamConfig setDirection:](self->_streamConfig, "setDirection:", a3);
}

- (unsigned)idsStreamId
{
  return -[VCMediaStreamMultiwayConfig idsStreamID](-[VCMediaStreamConfig multiwayConfig](self->_streamConfig, "multiwayConfig"), "idsStreamID");
}

- (BOOL)generateReceptionReport:(_RTCP_RECEPTION_REPORT *)a3 reportCount:(char *)a4
{
  int v6;
  BOOL v7;
  char v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  VCMediaStreamTransport *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*a4)
  {
    v6 = RTCPInitializeReceptionReportBlock((uint64_t)self->_rtpHandle, (uint64_t)a3);
    v7 = v6 >= 0;
    if ((v6 & 0x80000000) == 0)
    {
      v8 = 1;
LABEL_12:
      *a4 = v8;
      return v7;
    }
    v9 = v6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      v8 = 0;
      if (!v12)
        goto LABEL_12;
      if (objc_opt_class())
        v13 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v13 = "<nil>";
      v15 = 136316674;
      v16 = v10;
      v17 = 2080;
      v18 = "-[VCMediaStreamTransport generateReceptionReport:reportCount:]";
      v19 = 1024;
      v20 = 854;
      v21 = 2080;
      v22 = v13;
      v23 = 2048;
      v24 = self;
      v25 = 2080;
      v26 = "-[VCMediaStreamTransport generateReceptionReport:reportCount:]";
      v27 = 1024;
      v28 = v9;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s[%p] %s failed to generate the reception report: status=%d", (uint8_t *)&v15, 0x40u);
    }
    v8 = 0;
    goto LABEL_12;
  }
  return 0;
}

- (BOOL)generateRTCPXRSummaryReport:(tagVCRTCPXRSummaryReport *)a3 reportCount:(char *)a4
{
  int v5;
  BOOL v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*a4)
  {
    v5 = RTCPGetSummaryReportBlock((uint64_t)self->_rtpHandle, (int32x2_t *)a3, 50);
    v6 = v5 >= 0;
    if ((v5 & 0x80000000) == 0)
    {
      v7 = 1;
LABEL_12:
      *a4 = v7;
      return v6;
    }
    v10 = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      v7 = 0;
      if (!v13)
        goto LABEL_12;
      v15 = 136315906;
      v16 = v11;
      v17 = 2080;
      v18 = "-[VCMediaStreamTransport generateRTCPXRSummaryReport:reportCount:]";
      v19 = 1024;
      v20 = 870;
      v21 = 1024;
      v22 = v10;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to generate the RTCP XR Statistics Summary Report: status=%d", (uint8_t *)&v15, 0x22u);
    }
    v7 = 0;
    goto LABEL_12;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 6)
    return 0;
  v8 = VRTraceErrorLogLevelToCSTR();
  v9 = *MEMORY[0x1E0CF2758];
  v6 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315650;
    v16 = v8;
    v17 = 2080;
    v18 = "-[VCMediaStreamTransport generateRTCPXRSummaryReport:reportCount:]";
    v19 = 1024;
    v20 = 862;
    _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No slot available for RTCP XR Statistics Summary Report Block", (uint8_t *)&v15, 0x1Cu);
    return 0;
  }
  return v6;
}

- (BOOL)generateRTCPXRVoIPMetricsReport:(tagVCRTCPXRVoIPMetricsReport *)a3 reportCount:(char *)a4
{
  int v5;
  BOOL v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*a4)
  {
    v5 = RTCPGetVoIPMetricsReportBlock((uint64_t)self->_rtpHandle, (uint64_t)a3);
    v6 = v5 >= 0;
    if ((v5 & 0x80000000) == 0)
    {
      v7 = 1;
LABEL_12:
      *a4 = v7;
      return v6;
    }
    v10 = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      v7 = 0;
      if (!v13)
        goto LABEL_12;
      v15 = 136315906;
      v16 = v11;
      v17 = 2080;
      v18 = "-[VCMediaStreamTransport generateRTCPXRVoIPMetricsReport:reportCount:]";
      v19 = 1024;
      v20 = 886;
      v21 = 1024;
      v22 = v10;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to generate the RTCP XR VoIP Metrics Report: status=%d", (uint8_t *)&v15, 0x22u);
    }
    v7 = 0;
    goto LABEL_12;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 6)
    return 0;
  v8 = VRTraceErrorLogLevelToCSTR();
  v9 = *MEMORY[0x1E0CF2758];
  v6 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315650;
    v16 = v8;
    v17 = 2080;
    v18 = "-[VCMediaStreamTransport generateRTCPXRVoIPMetricsReport:reportCount:]";
    v19 = 1024;
    v20 = 878;
    _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No slot available for RTCP XR VoIP Metrics Report Block", (uint8_t *)&v15, 0x1Cu);
    return 0;
  }
  return v6;
}

- (unsigned)getRTCPReportNTPTimeMiddle32ForReportId:(unsigned __int8)a3
{
  int v3;
  int v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  unsigned int v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  VCMediaStreamTransport *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v5 = RTCPGetReportNTPTimeMiddle32((uint64_t)self->_rtpHandle, a3, &v11);
  if (v5 < 0)
  {
    v6 = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class())
          v9 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        else
          v9 = "<nil>";
        *(_DWORD *)buf = 136316930;
        v13 = v7;
        v14 = 2080;
        v15 = "-[VCMediaStreamTransport getRTCPReportNTPTimeMiddle32ForReportId:]";
        v16 = 1024;
        v17 = 896;
        v18 = 2080;
        v19 = v9;
        v20 = 2048;
        v21 = self;
        v22 = 2080;
        v23 = "-[VCMediaStreamTransport getRTCPReportNTPTimeMiddle32ForReportId:]";
        v24 = 1024;
        v25 = v3;
        v26 = 1024;
        v27 = v6;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s[%p] %s failed to retrieve the report[%d] time: status=%d", buf, 0x46u);
      }
    }
  }
  return v11;
}

- (unsigned)getExtendedSequenceNumberForSequenceNumber:(unsigned __int16)a3
{
  int v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  unsigned int v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  VCMediaStreamTransport *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v4 = RTPGetExtendedSequenceNumber((uint64_t)self->_rtpHandle, a3, &v10);
  if (v4 < 0)
  {
    v5 = v4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class())
          v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        else
          v8 = "<nil>";
        *(_DWORD *)buf = 136316674;
        v12 = v6;
        v13 = 2080;
        v14 = "-[VCMediaStreamTransport getExtendedSequenceNumberForSequenceNumber:]";
        v15 = 1024;
        v16 = 905;
        v17 = 2080;
        v18 = v8;
        v19 = 2048;
        v20 = self;
        v21 = 2080;
        v22 = "-[VCMediaStreamTransport getExtendedSequenceNumberForSequenceNumber:]";
        v23 = 1024;
        v24 = v5;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s[%p] %s failed to retrieve extended sequence number: status=%d", buf, 0x40u);
      }
    }
  }
  return v10;
}

- (VCMediaStreamConfig)streamConfig
{
  return self->_streamConfig;
}

- (tagHANDLE)rtpHandle
{
  return self->_rtpHandle;
}

- (AVCBasebandCongestionDetector)basebandCongestionDetector
{
  return self->_basebandCongestionDetector;
}

- (tagVCCryptor)receiverSframeCryptor
{
  return self->_receiverSframeCryptor;
}

- (tagVCCryptor)transmitterSframeCryptor
{
  return self->_transmitterSframeCryptor;
}

- (BOOL)encryptionInfoReceived
{
  return self->_encryptionInfoReceived;
}

- (void)configureWithStreamConfig:(os_log_t)log setupInfo:reducedSizeRTCPPackets:hopByHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByHopEncryptRTCPPackets:st"
       "atisticsCollector:basebandCongestionDetector:error:]";
  v8 = 1024;
  v9 = 241;
  v10 = 2112;
  v11 = v3;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d SFrame cryptors setup error[%@]", (uint8_t *)&v4, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)setupSframeCryptorsWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create SFrame receiver cryptor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupSframeCryptorsWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create SFrame transmitter cryptor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupSRTP
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d SRTPUseEncryption failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupRTPWithTransportStreams
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d NULL creationCallback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)lastReceivedRTCPPacketTime
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCMediaStreamTransport lastReceivedRTCPPacketTime]";
  v6 = 1024;
  v7 = 706;
  v8 = 1024;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to retrieve last RTCP timesamp. error=%d", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)handleEncryptionInfoChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d SRTP should be initialized first before we can update security key material", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
