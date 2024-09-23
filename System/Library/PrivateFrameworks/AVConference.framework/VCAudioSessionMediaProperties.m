@implementation VCAudioSessionMediaProperties

- (BOOL)isEqual:(id)a3
{
  objc_class *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int v10;
  int v11;
  int v12;
  __int128 v13;
  AudioStreamBasicDescription *p_inputFormat;
  AudioStreamBasicDescription *p_outputFormat;
  BOOL result;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  int v20;
  const __CFString *v21;
  int v22;
  const __CFString *v23;
  int v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  NSObject *v29;
  _BOOL4 v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL4 v38;
  double v39;
  uint64_t v40;
  _BOOL4 v41;
  double v42;
  uint64_t v43;
  NSObject *v44;
  _BOOL4 v45;
  unsigned int vpOperatingMode;
  uint64_t v47;
  _BOOL4 v48;
  _BOOL4 networkUplinkClockUsesBaseband;
  uint64_t v50;
  _BOOL4 v51;
  _BOOL4 v52;
  uint32_t v53;
  uint64_t v54;
  _BOOL4 v55;
  char *v56;
  char *v57;
  uint64_t v58;
  _BOOL4 v59;
  char *v60;
  char *v61;
  uint64_t v62;
  NSObject *v63;
  _BOOL4 v64;
  double preferredSampleRate;
  uint64_t v66;
  _BOOL4 v67;
  double preferredBlockSize;
  uint64_t v69;
  NSObject *v70;
  _BOOL4 v71;
  unsigned int v72;
  uint64_t v73;
  _BOOL4 v74;
  _BOOL4 v75;
  uint64_t v76;
  _BOOL4 v77;
  _BOOL4 audioClockDeviceEnabled;
  uint64_t v79;
  NSObject *v80;
  _BOOL4 v81;
  char *v82;
  char *v83;
  uint64_t v84;
  _BOOL4 v85;
  char *v86;
  char *v87;
  _OWORD v88[2];
  uint64_t v89;
  char v90[16];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  char __str[16];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE buf[40];
  VCAudioSessionMediaProperties *v99;
  __int16 v100;
  _BYTE v101[10];
  NSString *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  if (!a3 || (objc_msgSend(a3, "isMemberOfClass:", v5) & 1) == 0)
  {
    if ((VCAudioSessionMediaProperties *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return 0;
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      v30 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v30)
        return result;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 21;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = a3;
      *(_WORD *)&buf[38] = 2112;
      v99 = (VCAudioSessionMediaProperties *)NSStringFromClass(v5);
      v31 = " [%s] %s:%d VCAudioSessionMediaProperties property changed: object=%@ is nil or not of class=%@";
LABEL_66:
      v35 = v29;
      goto LABEL_67;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCAudioSessionMediaProperties performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v32 = VRTraceErrorLogLevelToCSTR();
    v33 = *MEMORY[0x1E0CF2758];
    v34 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v34)
      return result;
    *(_DWORD *)buf = 136316674;
    *(_QWORD *)&buf[4] = v32;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 21;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v17;
    *(_WORD *)&buf[38] = 2048;
    v99 = self;
    v100 = 2112;
    *(_QWORD *)v101 = a3;
    *(_WORD *)&v101[8] = 2112;
    v102 = NSStringFromClass(v5);
    v31 = " [%s] %s:%d %@(%p) VCAudioSessionMediaProperties property changed: object=%@ is nil or not of class=%@";
    v35 = v33;
LABEL_99:
    v53 = 68;
    goto LABEL_100;
  }
  objc_msgSend(a3, "preferredSampleRate");
  v7 = v6;
  if (v6 != self->_preferredSampleRate)
  {
    if ((VCAudioSessionMediaProperties *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = (const __CFString *)-[VCAudioSessionMediaProperties performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v18 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return 0;
      v62 = VRTraceErrorLogLevelToCSTR();
      v63 = *MEMORY[0x1E0CF2758];
      v64 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v64)
        return result;
      preferredSampleRate = self->_preferredSampleRate;
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = v62;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 26;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v18;
      *(_WORD *)&buf[38] = 2048;
      v99 = self;
      v100 = 2048;
      *(double *)v101 = preferredSampleRate;
      *(_WORD *)&v101[8] = 2048;
      v102 = *(NSString **)&v7;
      v31 = " [%s] %s:%d %@(%p) VCAudioSessionMediaProperties property changed: preferredSampleRate=%f became preferredSampleRate=%f";
LABEL_76:
      v35 = v63;
      goto LABEL_99;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v36 = VRTraceErrorLogLevelToCSTR();
    v37 = *MEMORY[0x1E0CF2758];
    v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v38)
      return result;
    v39 = self->_preferredSampleRate;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = v36;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 26;
    *(_WORD *)&buf[28] = 2048;
    *(double *)&buf[30] = v39;
    *(_WORD *)&buf[38] = 2048;
    v99 = *(VCAudioSessionMediaProperties **)&v7;
    v31 = " [%s] %s:%d VCAudioSessionMediaProperties property changed: preferredSampleRate=%f became preferredSampleRate=%f";
LABEL_49:
    v35 = v37;
LABEL_67:
    v53 = 48;
    goto LABEL_100;
  }
  objc_msgSend(a3, "preferredBlockSize");
  v9 = v8;
  if (v8 != self->_preferredBlockSize)
  {
    if ((VCAudioSessionMediaProperties *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = (const __CFString *)-[VCAudioSessionMediaProperties performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v19 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return 0;
      v66 = VRTraceErrorLogLevelToCSTR();
      v63 = *MEMORY[0x1E0CF2758];
      v67 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v67)
        return result;
      preferredBlockSize = self->_preferredBlockSize;
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = v66;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 29;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v19;
      *(_WORD *)&buf[38] = 2048;
      v99 = self;
      v100 = 2048;
      *(double *)v101 = preferredBlockSize;
      *(_WORD *)&v101[8] = 2048;
      v102 = *(NSString **)&v9;
      v31 = " [%s] %s:%d %@(%p) VCAudioSessionMediaProperties property changed: preferredBlockSize=%f became preferredBlockSize=%f";
      goto LABEL_76;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v40 = VRTraceErrorLogLevelToCSTR();
    v37 = *MEMORY[0x1E0CF2758];
    v41 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v41)
      return result;
    v42 = self->_preferredBlockSize;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = v40;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 29;
    *(_WORD *)&buf[28] = 2048;
    *(double *)&buf[30] = v42;
    *(_WORD *)&buf[38] = 2048;
    v99 = *(VCAudioSessionMediaProperties **)&v9;
    v31 = " [%s] %s:%d VCAudioSessionMediaProperties property changed: preferredBlockSize=%f became preferredBlockSize=%f";
    goto LABEL_49;
  }
  v10 = objc_msgSend(a3, "vpOperatingMode");
  if (v10 != self->_vpOperatingMode)
  {
    v20 = v10;
    if ((VCAudioSessionMediaProperties *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return 0;
      v43 = VRTraceErrorLogLevelToCSTR();
      v44 = *MEMORY[0x1E0CF2758];
      v45 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v45)
        return result;
      vpOperatingMode = self->_vpOperatingMode;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 32;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = vpOperatingMode;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v20;
      v31 = " [%s] %s:%d VCAudioSessionMediaProperties property changed: vpOperatingMode=%u became vpOperatingMode=%u";
      goto LABEL_59;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)-[VCAudioSessionMediaProperties performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v69 = VRTraceErrorLogLevelToCSTR();
    v70 = *MEMORY[0x1E0CF2758];
    v71 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v71)
      return result;
    v72 = self->_vpOperatingMode;
    *(_DWORD *)buf = 136316674;
    *(_QWORD *)&buf[4] = v69;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 32;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v21;
    *(_WORD *)&buf[38] = 2048;
    v99 = self;
    v100 = 1024;
    *(_DWORD *)v101 = v72;
    *(_WORD *)&v101[4] = 1024;
    *(_DWORD *)&v101[6] = v20;
    v31 = " [%s] %s:%d %@(%p) VCAudioSessionMediaProperties property changed: vpOperatingMode=%u became vpOperatingMode=%u";
LABEL_89:
    v35 = v70;
    v53 = 60;
    goto LABEL_100;
  }
  v11 = objc_msgSend(a3, "networkUplinkClockUsesBaseband");
  if (self->_networkUplinkClockUsesBaseband != v11)
  {
    v22 = v11;
    if ((VCAudioSessionMediaProperties *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return 0;
      v47 = VRTraceErrorLogLevelToCSTR();
      v44 = *MEMORY[0x1E0CF2758];
      v48 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v48)
        return result;
      networkUplinkClockUsesBaseband = self->_networkUplinkClockUsesBaseband;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 35;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = networkUplinkClockUsesBaseband;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v22;
      v31 = " [%s] %s:%d VCAudioSessionMediaProperties property changed: networkUplinkClockUsesBaseband=%u became network"
            "UplinkClockUsesBaseband=%u";
      goto LABEL_59;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)-[VCAudioSessionMediaProperties performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v73 = VRTraceErrorLogLevelToCSTR();
    v70 = *MEMORY[0x1E0CF2758];
    v74 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v74)
      return result;
    v75 = self->_networkUplinkClockUsesBaseband;
    *(_DWORD *)buf = 136316674;
    *(_QWORD *)&buf[4] = v73;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 35;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v23;
    *(_WORD *)&buf[38] = 2048;
    v99 = self;
    v100 = 1024;
    *(_DWORD *)v101 = v75;
    *(_WORD *)&v101[4] = 1024;
    *(_DWORD *)&v101[6] = v22;
    v31 = " [%s] %s:%d %@(%p) VCAudioSessionMediaProperties property changed: networkUplinkClockUsesBaseband=%u became ne"
          "tworkUplinkClockUsesBaseband=%u";
    goto LABEL_89;
  }
  v12 = objc_msgSend(a3, "audioClockDeviceEnabled");
  if (self->_audioClockDeviceEnabled != v12)
  {
    v24 = v12;
    if ((VCAudioSessionMediaProperties *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v25 = (const __CFString *)-[VCAudioSessionMediaProperties performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v25 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return 0;
      v76 = VRTraceErrorLogLevelToCSTR();
      v70 = *MEMORY[0x1E0CF2758];
      v77 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v77)
        return result;
      audioClockDeviceEnabled = self->_audioClockDeviceEnabled;
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = v76;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 38;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v25;
      *(_WORD *)&buf[38] = 2048;
      v99 = self;
      v100 = 1024;
      *(_DWORD *)v101 = audioClockDeviceEnabled;
      *(_WORD *)&v101[4] = 1024;
      *(_DWORD *)&v101[6] = v24;
      v31 = " [%s] %s:%d %@(%p) VCAudioSessionMediaProperties property changed: audioClockDeviceEnabled=%u became audioCl"
            "ockDeviceEnabled=%u";
      goto LABEL_89;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v50 = VRTraceErrorLogLevelToCSTR();
    v44 = *MEMORY[0x1E0CF2758];
    v51 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v51)
      return result;
    v52 = self->_audioClockDeviceEnabled;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = v50;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 38;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v52;
    *(_WORD *)&buf[34] = 1024;
    *(_DWORD *)&buf[36] = v24;
    v31 = " [%s] %s:%d VCAudioSessionMediaProperties property changed: audioClockDeviceEnabled=%u became audioClockDeviceEnabled=%u";
LABEL_59:
    v35 = v44;
    v53 = 40;
LABEL_100:
    _os_log_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEFAULT, v31, buf, v53);
    return 0;
  }
  *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v96 = v13;
  v97 = v13;
  *(_OWORD *)__str = v13;
  v95 = v13;
  *(_OWORD *)v90 = v13;
  v91 = v13;
  v92 = v13;
  v93 = v13;
  objc_msgSend(a3, "inputFormat", -1, v13, v13);
  p_inputFormat = &self->_inputFormat;
  if (!memcmp(v88, &self->_inputFormat, 0x28uLL))
  {
    objc_msgSend(a3, "outputFormat");
    v88[0] = *(_OWORD *)buf;
    v88[1] = *(_OWORD *)&buf[16];
    v89 = *(_QWORD *)&buf[32];
    p_outputFormat = &self->_outputFormat;
    if (!memcmp(v88, &self->_outputFormat, 0x28uLL))
      return 1;
    if ((VCAudioSessionMediaProperties *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v27 = (const __CFString *)-[VCAudioSessionMediaProperties performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v27 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return 0;
      v84 = VRTraceErrorLogLevelToCSTR();
      v80 = *MEMORY[0x1E0CF2758];
      v85 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (v85)
      {
        v86 = FormatToCStr((uint64_t)&self->_outputFormat, __str, 0x40uLL);
        v87 = FormatToCStr((uint64_t)v88, v90, 0x40uLL);
        *(_DWORD *)buf = 136316674;
        *(_QWORD *)&buf[4] = v84;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 46;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v27;
        *(_WORD *)&buf[38] = 2048;
        v99 = self;
        v100 = 2080;
        *(_QWORD *)v101 = v86;
        *(_WORD *)&v101[8] = 2080;
        v102 = (NSString *)v87;
        v31 = " [%s] %s:%d %@(%p) VCAudioSessionMediaProperties property changed: outputFormat=%s became outputFormat=%s";
        goto LABEL_98;
      }
      return result;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v58 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      v59 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v59)
        return result;
      v60 = FormatToCStr((uint64_t)p_outputFormat, __str, 0x40uLL);
      v61 = FormatToCStr((uint64_t)v88, v90, 0x40uLL);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v58;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 46;
      *(_WORD *)&buf[28] = 2080;
      *(_QWORD *)&buf[30] = v60;
      *(_WORD *)&buf[38] = 2080;
      v99 = (VCAudioSessionMediaProperties *)v61;
      v31 = " [%s] %s:%d VCAudioSessionMediaProperties property changed: outputFormat=%s became outputFormat=%s";
      goto LABEL_66;
    }
    return 0;
  }
  if ((VCAudioSessionMediaProperties *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v54 = VRTraceErrorLogLevelToCSTR();
    v29 = *MEMORY[0x1E0CF2758];
    v55 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v55)
      return result;
    v56 = FormatToCStr((uint64_t)p_inputFormat, __str, 0x40uLL);
    v57 = FormatToCStr((uint64_t)v88, v90, 0x40uLL);
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = v54;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 43;
    *(_WORD *)&buf[28] = 2080;
    *(_QWORD *)&buf[30] = v56;
    *(_WORD *)&buf[38] = 2080;
    v99 = (VCAudioSessionMediaProperties *)v57;
    v31 = " [%s] %s:%d VCAudioSessionMediaProperties property changed: inputFormat=%s became inputFormat=%s";
    goto LABEL_66;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v26 = (const __CFString *)-[VCAudioSessionMediaProperties performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v26 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    return 0;
  v79 = VRTraceErrorLogLevelToCSTR();
  v80 = *MEMORY[0x1E0CF2758];
  v81 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v81)
  {
    v82 = FormatToCStr((uint64_t)&self->_inputFormat, __str, 0x40uLL);
    v83 = FormatToCStr((uint64_t)v88, v90, 0x40uLL);
    *(_DWORD *)buf = 136316674;
    *(_QWORD *)&buf[4] = v79;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 43;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v26;
    *(_WORD *)&buf[38] = 2048;
    v99 = self;
    v100 = 2080;
    *(_QWORD *)v101 = v82;
    *(_WORD *)&v101[8] = 2080;
    v102 = (NSString *)v83;
    v31 = " [%s] %s:%d %@(%p) VCAudioSessionMediaProperties property changed: inputFormat=%s became inputFormat=%s";
LABEL_98:
    v35 = v80;
    goto LABEL_99;
  }
  return result;
}

- (id)description
{
  __int128 v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  double preferredSampleRate;
  double preferredBlockSize;
  Float64 mSampleRate;
  uint64_t operatingMode;
  uint64_t vpOperatingMode;
  char *v12;
  char v14[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char __str[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20 = v3;
  v21 = v3;
  *(_OWORD *)__str = v3;
  v19 = v3;
  v16 = v3;
  v17 = v3;
  *(_OWORD *)v14 = v3;
  v15 = v3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  preferredSampleRate = self->_preferredSampleRate;
  preferredBlockSize = self->_preferredBlockSize;
  mSampleRate = self->_inputFormat.mSampleRate;
  operatingMode = self->_operatingMode;
  vpOperatingMode = self->_vpOperatingMode;
  v12 = FormatToCStr((uint64_t)&self->_inputFormat, __str, 0x40uLL);
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: sampleRate=%f blockSize=%f, operatingMode=%d, VP=%d, sampleRateIn=%f, inputFormat=%s, sampleRateOut=%f, outputFormat=%s, processId=%d, active=%d, audioClockDeviceEnabled=%d, networkUplinkClockUsesBaseband=%d"), v6, *(_QWORD *)&preferredSampleRate, *(_QWORD *)&preferredBlockSize, operatingMode, vpOperatingMode, *(_QWORD *)&mSampleRate, v12, *(_QWORD *)&self->_outputFormat.mSampleRate, FormatToCStr((uint64_t)&self->_outputFormat, v14, 0x40uLL), self->_processId, self->_sessionActive, self->_audioClockDeviceEnabled, self->_networkUplinkClockUsesBaseband);
}

- (double)preferredBlockSize
{
  return self->_preferredBlockSize;
}

- (void)setPreferredBlockSize:(double)a3
{
  self->_preferredBlockSize = a3;
}

- (double)preferredSampleRate
{
  return self->_preferredSampleRate;
}

- (void)setPreferredSampleRate:(double)a3
{
  self->_preferredSampleRate = a3;
}

- (int)operatingMode
{
  return self->_operatingMode;
}

- (void)setOperatingMode:(int)a3
{
  self->_operatingMode = a3;
}

- (unsigned)vpOperatingMode
{
  return self->_vpOperatingMode;
}

- (void)setVpOperatingMode:(unsigned int)a3
{
  self->_vpOperatingMode = a3;
}

- (AudioStreamBasicDescription)inputFormat
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mBitsPerChannel;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(_QWORD *)&retstr->mBitsPerChannel = *(_QWORD *)&self[1].mBytesPerFrame;
  return self;
}

- (void)setInputFormat:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->mSampleRate;
  v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_QWORD *)&self->_inputFormat.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_inputFormat.mSampleRate = v3;
  *(_OWORD *)&self->_inputFormat.mBytesPerPacket = v4;
}

- (AudioStreamBasicDescription)outputFormat
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].mFormatID;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[1].mBitsPerChannel;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(_QWORD *)&retstr->mBitsPerChannel = *(_QWORD *)&self[2].mBytesPerFrame;
  return self;
}

- (void)setOutputFormat:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->mSampleRate;
  v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_QWORD *)&self->_outputFormat.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_outputFormat.mBytesPerPacket = v4;
  *(_OWORD *)&self->_outputFormat.mSampleRate = v3;
}

- (int)processId
{
  return self->_processId;
}

- (void)setProcessId:(int)a3
{
  self->_processId = a3;
}

- (BOOL)isSessionActive
{
  return self->_sessionActive;
}

- (void)setSessionActive:(BOOL)a3
{
  self->_sessionActive = a3;
}

- (BOOL)audioClockDeviceEnabled
{
  return self->_audioClockDeviceEnabled;
}

- (void)setAudioClockDeviceEnabled:(BOOL)a3
{
  self->_audioClockDeviceEnabled = a3;
}

- (BOOL)networkUplinkClockUsesBaseband
{
  return self->_networkUplinkClockUsesBaseband;
}

- (void)setNetworkUplinkClockUsesBaseband:(BOOL)a3
{
  self->_networkUplinkClockUsesBaseband = a3;
}

@end
