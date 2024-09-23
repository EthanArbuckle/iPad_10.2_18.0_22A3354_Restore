@implementation C2MPNetworkEvent

- (void)setNetworkTaskDescription:(id)a3
{
  objc_storeStrong((id *)&self->_networkTaskDescription, a3);
}

- (void)setNetworkResponseHeaderSize:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_networkResponseHeaderSize = a3;
}

- (void)setTriggers:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_triggers = a3;
}

- (void)setTimestampTcpStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_timestampTcpStart = a3;
}

- (void)setTimestampTcpEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_timestampTcpEnd = a3;
}

- (void)setTimestampSslStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_timestampSslStart = a3;
}

- (void)setTimestampResponseStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_timestampResponseStart = a3;
}

- (void)setTimestampResponseEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_timestampResponseEnd = a3;
}

- (void)setTimestampRequestStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_timestampRequestStart = a3;
}

- (void)setTimestampRequestEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_timestampRequestEnd = a3;
}

- (void)setTimestampDnsStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_timestampDnsStart = a3;
}

- (void)setTimestampDnsEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_timestampDnsEnd = a3;
}

- (void)setTimestampC2Start:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_timestampC2Start = a3;
}

- (void)setTimestampC2Now:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_timestampC2Now = a3;
}

- (void)setTimestampC2Init:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_timestampC2Init = a3;
}

- (void)setReportFrequencyBase:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_reportFrequencyBase = a3;
}

- (void)setReportFrequency:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_reportFrequency = a3;
}

- (void)setOptionsTlsPinningRequired:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000000;
  self->_optionsTlsPinningRequired = a3;
}

- (void)setOptionsTimeoutIntervalForResource:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_optionsTimeoutIntervalForResource = a3;
}

- (void)setOptionsTimeoutIntervalForRequest:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_optionsTimeoutIntervalForRequest = a3;
}

- (void)setOptionsSourceApplicationSecondaryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_optionsSourceApplicationSecondaryIdentifier, a3);
}

- (void)setOptionsSourceApplicationBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_optionsSourceApplicationBundleIdentifier, a3);
}

- (void)setOptionsQualityOfService:(id)a3
{
  objc_storeStrong((id *)&self->_optionsQualityOfService, a3);
}

- (void)setOptionsOutOfProcessForceDiscretionary:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_optionsOutOfProcessForceDiscretionary = a3;
}

- (void)setOptionsOutOfProcess:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_optionsOutOfProcess = a3;
}

- (void)setOptionsDuetPreClearedMode:(id)a3
{
  objc_storeStrong((id *)&self->_optionsDuetPreClearedMode, a3);
}

- (void)setOptionsDiscretionaryNetworkBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_optionsDiscretionaryNetworkBehavior, a3);
}

- (void)setOptionsAppleIdContext:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_optionsAppleIdContext = a3;
}

- (void)setOptionsAllowPowerNapScheduling:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_optionsAllowPowerNapScheduling = a3;
}

- (void)setOptionsAllowExpensiveAccess:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_optionsAllowExpensiveAccess = a3;
}

- (void)setOptionsAllowCellularAccess:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_optionsAllowCellularAccess = a3;
}

- (void)setNetworkStatusCode:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_networkStatusCode = a3;
}

- (void)setNetworkResponseBodyBytesReceived:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_networkResponseBodyBytesReceived = a3;
}

- (void)setNetworkRequestUri:(id)a3
{
  objc_storeStrong((id *)&self->_networkRequestUri, a3);
}

- (void)setNetworkRequestHeaderSize:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_networkRequestHeaderSize = a3;
}

- (void)setNetworkRequestBodyBytesSent:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_networkRequestBodyBytesSent = a3;
}

- (void)setNetworkRemoteAddresssAndPort:(id)a3
{
  objc_storeStrong((id *)&self->_networkRemoteAddresssAndPort, a3);
}

- (void)setNetworkProtocolName:(id)a3
{
  objc_storeStrong((id *)&self->_networkProtocolName, a3);
}

- (void)setNetworkPreviousAttemptCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_networkPreviousAttemptCount = a3;
}

- (void)setNetworkNegotiatedTlsProtocolVersion:(id)a3
{
  objc_storeStrong((id *)&self->_networkNegotiatedTlsProtocolVersion, a3);
}

- (void)setNetworkInterfaceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_networkInterfaceIdentifier, a3);
}

- (void)setNetworkHostname:(id)a3
{
  objc_storeStrong((id *)&self->_networkHostname, a3);
}

- (void)setNetworkConnectionReused:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_networkConnectionReused = a3;
}

- (void)addNetworkPathInfo:(id)a3
{
  id v4;
  NSMutableArray *networkPathInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  networkPathInfos = self->_networkPathInfos;
  v8 = v4;
  if (!networkPathInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_networkPathInfos;
    self->_networkPathInfos = v6;

    v4 = v8;
    networkPathInfos = self->_networkPathInfos;
  }
  -[NSMutableArray addObject:](networkPathInfos, "addObject:", v4);

}

- (id)dictionaryRepresentation
{
  void *v3;
  $C893DAD969560203051D3A1C34B78D80 has;
  void *v5;
  NSString *networkTaskDescription;
  NSString *networkHostname;
  NSString *networkRemoteAddresssAndPort;
  NSString *networkConnectionUuid;
  void *v10;
  NSString *networkInterfaceIdentifier;
  NSString *networkProtocolName;
  $C893DAD969560203051D3A1C34B78D80 v13;
  void *v14;
  C2MPError *networkFatalError;
  void *v16;
  void *v17;
  NSString *networkRequestUri;
  void *v19;
  NSString *networkNegotiatedTlsProtocolVersion;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  $C893DAD969560203051D3A1C34B78D80 v28;
  void *v29;
  NSString *optionsQualityOfService;
  $C893DAD969560203051D3A1C34B78D80 v31;
  void *v32;
  NSString *optionsSourceApplicationBundleIdentifier;
  NSString *optionsSourceApplicationSecondaryIdentifier;
  $C893DAD969560203051D3A1C34B78D80 v35;
  void *v36;
  void *v37;
  NSString *optionsDiscretionaryNetworkBehavior;
  NSString *optionsDuetPreClearedMode;
  void *v40;
  id v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_triggers);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("triggers"));

    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_reportFrequency);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("report_frequency"));

  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_reportFrequencyBase);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("report_frequency_base"));

  }
LABEL_5:
  networkTaskDescription = self->_networkTaskDescription;
  if (networkTaskDescription)
    objc_msgSend(v3, "setObject:forKey:", networkTaskDescription, CFSTR("network_task_description"));
  networkHostname = self->_networkHostname;
  if (networkHostname)
    objc_msgSend(v3, "setObject:forKey:", networkHostname, CFSTR("network_hostname"));
  networkRemoteAddresssAndPort = self->_networkRemoteAddresssAndPort;
  if (networkRemoteAddresssAndPort)
    objc_msgSend(v3, "setObject:forKey:", networkRemoteAddresssAndPort, CFSTR("network_remote_addresss_and_port"));
  networkConnectionUuid = self->_networkConnectionUuid;
  if (networkConnectionUuid)
    objc_msgSend(v3, "setObject:forKey:", networkConnectionUuid, CFSTR("network_connection_uuid"));
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_networkConnectionReused);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("network_connection_reused"));

  }
  networkInterfaceIdentifier = self->_networkInterfaceIdentifier;
  if (networkInterfaceIdentifier)
    objc_msgSend(v3, "setObject:forKey:", networkInterfaceIdentifier, CFSTR("network_interface_identifier"));
  networkProtocolName = self->_networkProtocolName;
  if (networkProtocolName)
    objc_msgSend(v3, "setObject:forKey:", networkProtocolName, CFSTR("network_protocol_name"));
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_networkRequestHeaderSize);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("network_request_header_size"));

    v13 = self->_has;
    if ((*(_BYTE *)&v13 & 1) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v13 & 0x100000) == 0)
        goto LABEL_22;
      goto LABEL_86;
    }
  }
  else if ((*(_BYTE *)&v13 & 1) == 0)
  {
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_networkRequestBodyBytesSent);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("network_request_body_bytes_sent"));

  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v13 & 2) == 0)
      goto LABEL_23;
    goto LABEL_87;
  }
LABEL_86:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_networkResponseHeaderSize);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("network_response_header_size"));

  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 2) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v13 & 0x40000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_87:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_networkResponseBodyBytesReceived);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("network_response_body_bytes_received"));

  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_networkPreviousAttemptCount);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("network_previous_attempt_count"));

  }
LABEL_25:
  networkFatalError = self->_networkFatalError;
  if (networkFatalError)
  {
    -[C2MPError dictionaryRepresentation](networkFatalError, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("network_fatal_error"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_networkStatusCode);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("network_status_code"));

  }
  networkRequestUri = self->_networkRequestUri;
  if (networkRequestUri)
    objc_msgSend(v3, "setObject:forKey:", networkRequestUri, CFSTR("network_request_uri"));
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_networkIsDiscretionary);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("network_is_discretionary"));

  }
  networkNegotiatedTlsProtocolVersion = self->_networkNegotiatedTlsProtocolVersion;
  if (networkNegotiatedTlsProtocolVersion)
    objc_msgSend(v3, "setObject:forKey:", networkNegotiatedTlsProtocolVersion, CFSTR("network_negotiated_tls_protocol_version"));
  if (-[NSMutableArray count](self->_networkPathInfos, "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_networkPathInfos, "count"));
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v22 = self->_networkPathInfos;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v66 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v65);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("network_path_info"));
  }
  v28 = self->_has;
  if ((*(_BYTE *)&v28 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestampC2Init);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("timestamp_c2_init"));

    v28 = self->_has;
    if ((*(_BYTE *)&v28 & 0x80) == 0)
    {
LABEL_46:
      if ((*(_BYTE *)&v28 & 0x40) == 0)
        goto LABEL_47;
      goto LABEL_91;
    }
  }
  else if ((*(_BYTE *)&v28 & 0x80) == 0)
  {
    goto LABEL_46;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestampC2Start, (_QWORD)v65);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("timestamp_c2_start"));

  v28 = self->_has;
  if ((*(_BYTE *)&v28 & 0x40) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v28 & 0x200) == 0)
      goto LABEL_48;
    goto LABEL_92;
  }
LABEL_91:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestampC2Now, (_QWORD)v65);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("timestamp_c2_now"));

  v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x200) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v28 & 0x100) == 0)
      goto LABEL_49;
    goto LABEL_93;
  }
LABEL_92:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestampDnsStart, (_QWORD)v65);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("timestamp_dns_start"));

  v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x100) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v28 & 0x10000) == 0)
      goto LABEL_50;
    goto LABEL_94;
  }
LABEL_93:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestampDnsEnd, (_QWORD)v65);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("timestamp_dns_end"));

  v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x10000) == 0)
  {
LABEL_50:
    if ((*(_WORD *)&v28 & 0x8000) == 0)
      goto LABEL_51;
    goto LABEL_95;
  }
LABEL_94:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestampTcpStart, (_QWORD)v65);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("timestamp_tcp_start"));

  v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x8000) == 0)
  {
LABEL_51:
    if ((*(_WORD *)&v28 & 0x4000) == 0)
      goto LABEL_52;
    goto LABEL_96;
  }
LABEL_95:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestampTcpEnd, (_QWORD)v65);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("timestamp_tcp_end"));

  v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x4000) == 0)
  {
LABEL_52:
    if ((*(_WORD *)&v28 & 0x800) == 0)
      goto LABEL_53;
    goto LABEL_97;
  }
LABEL_96:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestampSslStart, (_QWORD)v65);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("timestamp_ssl_start"));

  v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x800) == 0)
  {
LABEL_53:
    if ((*(_WORD *)&v28 & 0x400) == 0)
      goto LABEL_54;
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestampRequestStart, (_QWORD)v65);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("timestamp_request_start"));

  v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x400) == 0)
  {
LABEL_54:
    if ((*(_WORD *)&v28 & 0x2000) == 0)
      goto LABEL_55;
    goto LABEL_99;
  }
LABEL_98:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestampRequestEnd, (_QWORD)v65);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("timestamp_request_end"));

  v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x2000) == 0)
  {
LABEL_55:
    if ((*(_WORD *)&v28 & 0x1000) == 0)
      goto LABEL_57;
    goto LABEL_56;
  }
LABEL_99:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestampResponseStart, (_QWORD)v65);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("timestamp_response_start"));

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_56:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestampResponseEnd, (_QWORD)v65);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("timestamp_response_end"));

  }
LABEL_57:
  optionsQualityOfService = self->_optionsQualityOfService;
  if (optionsQualityOfService)
    objc_msgSend(v3, "setObject:forKey:", optionsQualityOfService, CFSTR("options_quality_of_service"));
  v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x20000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_optionsOutOfProcess);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v60, CFSTR("options_out_of_process"));

    v31 = self->_has;
    if ((*(_DWORD *)&v31 & 0x40000000) == 0)
    {
LABEL_61:
      if ((*(_DWORD *)&v31 & 0x4000000) == 0)
        goto LABEL_62;
      goto LABEL_103;
    }
  }
  else if ((*(_DWORD *)&v31 & 0x40000000) == 0)
  {
    goto LABEL_61;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_optionsOutOfProcessForceDiscretionary, (_QWORD)v65);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v61, CFSTR("options_out_of_process_force_discretionary"));

  v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x4000000) == 0)
  {
LABEL_62:
    if ((*(_DWORD *)&v31 & 0x8000000) == 0)
      goto LABEL_63;
    goto LABEL_104;
  }
LABEL_103:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_optionsAllowExpensiveAccess, (_QWORD)v65);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("options_allow_expensive_access"));

  v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x8000000) == 0)
  {
LABEL_63:
    if ((*(_DWORD *)&v31 & 0x200000) == 0)
      goto LABEL_64;
    goto LABEL_105;
  }
LABEL_104:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_optionsAllowPowerNapScheduling, (_QWORD)v65);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("options_allow_power_nap_scheduling"));

  v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x200000) == 0)
  {
LABEL_64:
    if ((*(_DWORD *)&v31 & 0x400000) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_105:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_optionsTimeoutIntervalForRequest, (_QWORD)v65);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v64, CFSTR("options_timeout_interval_for_request"));

  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_65:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_optionsTimeoutIntervalForResource, (_QWORD)v65);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("options_timeout_interval_for_resource"));

  }
LABEL_66:
  optionsSourceApplicationBundleIdentifier = self->_optionsSourceApplicationBundleIdentifier;
  if (optionsSourceApplicationBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", optionsSourceApplicationBundleIdentifier, CFSTR("options_source_application_bundle_identifier"));
  optionsSourceApplicationSecondaryIdentifier = self->_optionsSourceApplicationSecondaryIdentifier;
  if (optionsSourceApplicationSecondaryIdentifier)
    objc_msgSend(v3, "setObject:forKey:", optionsSourceApplicationSecondaryIdentifier, CFSTR("options_source_application_secondary_identifier"));
  v35 = self->_has;
  if ((*(_DWORD *)&v35 & 0x10000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_optionsAppleIdContext);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("options_apple_id_context"));

    v35 = self->_has;
  }
  if ((*(_DWORD *)&v35 & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_optionsTlsPinningRequired);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("options_tls_pinning_required"));

  }
  optionsDiscretionaryNetworkBehavior = self->_optionsDiscretionaryNetworkBehavior;
  if (optionsDiscretionaryNetworkBehavior)
    objc_msgSend(v3, "setObject:forKey:", optionsDiscretionaryNetworkBehavior, CFSTR("options_discretionary_network_behavior"));
  optionsDuetPreClearedMode = self->_optionsDuetPreClearedMode;
  if (optionsDuetPreClearedMode)
    objc_msgSend(v3, "setObject:forKey:", optionsDuetPreClearedMode, CFSTR("options_duet_pre_cleared_mode"));
  if ((*((_BYTE *)&self->_has + 3) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_optionsAllowCellularAccess);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("options_allow_cellular_access"));

  }
  v41 = v3;

  return v41;
}

- (void)setNetworkConnectionUuid:(id)a3
{
  objc_storeStrong((id *)&self->_networkConnectionUuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsSourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_optionsSourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_optionsQualityOfService, 0);
  objc_storeStrong((id *)&self->_optionsDuetPreClearedMode, 0);
  objc_storeStrong((id *)&self->_optionsDiscretionaryNetworkBehavior, 0);
  objc_storeStrong((id *)&self->_networkTaskDescription, 0);
  objc_storeStrong((id *)&self->_networkRequestUri, 0);
  objc_storeStrong((id *)&self->_networkRemoteAddresssAndPort, 0);
  objc_storeStrong((id *)&self->_networkProtocolName, 0);
  objc_storeStrong((id *)&self->_networkPathInfos, 0);
  objc_storeStrong((id *)&self->_networkNegotiatedTlsProtocolVersion, 0);
  objc_storeStrong((id *)&self->_networkInterfaceIdentifier, 0);
  objc_storeStrong((id *)&self->_networkHostname, 0);
  objc_storeStrong((id *)&self->_networkFatalError, 0);
  objc_storeStrong((id *)&self->_networkConnectionUuid, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  $C893DAD969560203051D3A1C34B78D80 has;
  $C893DAD969560203051D3A1C34B78D80 v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  $C893DAD969560203051D3A1C34B78D80 v12;
  $C893DAD969560203051D3A1C34B78D80 v13;
  $C893DAD969560203051D3A1C34B78D80 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
LABEL_4:
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_networkTaskDescription)
    PBDataWriterWriteStringField();
  if (self->_networkHostname)
    PBDataWriterWriteStringField();
  if (self->_networkRemoteAddresssAndPort)
    PBDataWriterWriteStringField();
  if (self->_networkConnectionUuid)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_networkInterfaceIdentifier)
    PBDataWriterWriteStringField();
  if (self->_networkProtocolName)
    PBDataWriterWriteStringField();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = self->_has;
    if ((*(_BYTE *)&v6 & 1) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v6 & 0x100000) == 0)
        goto LABEL_22;
      goto LABEL_84;
    }
  }
  else if ((*(_BYTE *)&v6 & 1) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteUint64Field();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v6 & 2) == 0)
      goto LABEL_23;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x40000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_85:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
LABEL_24:
    PBDataWriterWriteUint32Field();
LABEL_25:
  if (self->_networkFatalError)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_networkRequestUri)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_networkNegotiatedTlsProtocolVersion)
    PBDataWriterWriteStringField();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_networkPathInfos;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    v12 = self->_has;
    if ((*(_BYTE *)&v12 & 0x80) == 0)
    {
LABEL_44:
      if ((*(_BYTE *)&v12 & 0x40) == 0)
        goto LABEL_45;
      goto LABEL_89;
    }
  }
  else if ((*(_BYTE *)&v12 & 0x80) == 0)
  {
    goto LABEL_44;
  }
  PBDataWriterWriteUint64Field();
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x40) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v12 & 0x200) == 0)
      goto LABEL_46;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint64Field();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x200) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v12 & 0x100) == 0)
      goto LABEL_47;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint64Field();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x100) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v12 & 0x10000) == 0)
      goto LABEL_48;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint64Field();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x10000) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v12 & 0x8000) == 0)
      goto LABEL_49;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint64Field();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x8000) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&v12 & 0x4000) == 0)
      goto LABEL_50;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint64Field();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x4000) == 0)
  {
LABEL_50:
    if ((*(_WORD *)&v12 & 0x800) == 0)
      goto LABEL_51;
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint64Field();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x800) == 0)
  {
LABEL_51:
    if ((*(_WORD *)&v12 & 0x400) == 0)
      goto LABEL_52;
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteUint64Field();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x400) == 0)
  {
LABEL_52:
    if ((*(_WORD *)&v12 & 0x2000) == 0)
      goto LABEL_53;
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteUint64Field();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x2000) == 0)
  {
LABEL_53:
    if ((*(_WORD *)&v12 & 0x1000) == 0)
      goto LABEL_55;
    goto LABEL_54;
  }
LABEL_97:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_54:
    PBDataWriterWriteUint64Field();
LABEL_55:
  if (self->_optionsQualityOfService)
    PBDataWriterWriteStringField();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x40000000) == 0)
    {
LABEL_59:
      if ((*(_DWORD *)&v13 & 0x4000000) == 0)
        goto LABEL_60;
      goto LABEL_101;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x40000000) == 0)
  {
    goto LABEL_59;
  }
  PBDataWriterWriteBOOLField();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x4000000) == 0)
  {
LABEL_60:
    if ((*(_DWORD *)&v13 & 0x8000000) == 0)
      goto LABEL_61;
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteBOOLField();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x8000000) == 0)
  {
LABEL_61:
    if ((*(_DWORD *)&v13 & 0x200000) == 0)
      goto LABEL_62;
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteBOOLField();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
LABEL_62:
    if ((*(_DWORD *)&v13 & 0x400000) == 0)
      goto LABEL_64;
    goto LABEL_63;
  }
LABEL_103:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
LABEL_63:
    PBDataWriterWriteUint32Field();
LABEL_64:
  if (self->_optionsSourceApplicationBundleIdentifier)
    PBDataWriterWriteStringField();
  if (self->_optionsSourceApplicationSecondaryIdentifier)
    PBDataWriterWriteStringField();
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v14 = self->_has;
  }
  if ((*(_DWORD *)&v14 & 0x80000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_optionsDiscretionaryNetworkBehavior)
    PBDataWriterWriteStringField();
  if (self->_optionsDuetPreClearedMode)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 3) & 2) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)setHasTriggers:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTriggers
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasReportFrequency:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasReportFrequency
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasReportFrequencyBase:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasReportFrequencyBase
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasNetworkTaskDescription
{
  return self->_networkTaskDescription != 0;
}

- (BOOL)hasNetworkHostname
{
  return self->_networkHostname != 0;
}

- (BOOL)hasNetworkRemoteAddresssAndPort
{
  return self->_networkRemoteAddresssAndPort != 0;
}

- (BOOL)hasNetworkConnectionUuid
{
  return self->_networkConnectionUuid != 0;
}

- (void)setHasNetworkConnectionReused:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasNetworkConnectionReused
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasNetworkInterfaceIdentifier
{
  return self->_networkInterfaceIdentifier != 0;
}

- (BOOL)hasNetworkProtocolName
{
  return self->_networkProtocolName != 0;
}

- (void)setHasNetworkRequestHeaderSize:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasNetworkRequestHeaderSize
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasNetworkRequestBodyBytesSent:(BOOL)a3
{
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasNetworkRequestBodyBytesSent
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasNetworkResponseHeaderSize:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasNetworkResponseHeaderSize
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasNetworkResponseBodyBytesReceived:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasNetworkResponseBodyBytesReceived
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNetworkPreviousAttemptCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasNetworkPreviousAttemptCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasNetworkFatalError
{
  return self->_networkFatalError != 0;
}

- (void)setHasNetworkStatusCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasNetworkStatusCode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasNetworkRequestUri
{
  return self->_networkRequestUri != 0;
}

- (void)setNetworkIsDiscretionary:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_networkIsDiscretionary = a3;
}

- (void)setHasNetworkIsDiscretionary:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasNetworkIsDiscretionary
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (BOOL)hasNetworkNegotiatedTlsProtocolVersion
{
  return self->_networkNegotiatedTlsProtocolVersion != 0;
}

- (void)clearNetworkPathInfos
{
  -[NSMutableArray removeAllObjects](self->_networkPathInfos, "removeAllObjects");
}

- (unint64_t)networkPathInfosCount
{
  return -[NSMutableArray count](self->_networkPathInfos, "count");
}

- (id)networkPathInfoAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_networkPathInfos, "objectAtIndex:", a3);
}

+ (Class)networkPathInfoType
{
  return (Class)objc_opt_class();
}

- (void)setHasTimestampC2Init:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasTimestampC2Init
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasTimestampC2Start:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasTimestampC2Start
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasTimestampC2Now:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasTimestampC2Now
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasTimestampDnsStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasTimestampDnsStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasTimestampDnsEnd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasTimestampDnsEnd
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHasTimestampTcpStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTimestampTcpStart
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasTimestampTcpEnd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTimestampTcpEnd
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasTimestampSslStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTimestampSslStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasTimestampRequestStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasTimestampRequestStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasTimestampRequestEnd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasTimestampRequestEnd
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasTimestampResponseStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasTimestampResponseStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasTimestampResponseEnd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasTimestampResponseEnd
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasOptionsQualityOfService
{
  return self->_optionsQualityOfService != 0;
}

- (void)setHasOptionsOutOfProcess:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasOptionsOutOfProcess
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setHasOptionsOutOfProcessForceDiscretionary:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (BOOL)hasOptionsOutOfProcessForceDiscretionary
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setHasOptionsAllowExpensiveAccess:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasOptionsAllowExpensiveAccess
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHasOptionsAllowPowerNapScheduling:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasOptionsAllowPowerNapScheduling
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHasOptionsTimeoutIntervalForRequest:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasOptionsTimeoutIntervalForRequest
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasOptionsTimeoutIntervalForResource:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasOptionsTimeoutIntervalForResource
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasOptionsSourceApplicationBundleIdentifier
{
  return self->_optionsSourceApplicationBundleIdentifier != 0;
}

- (BOOL)hasOptionsSourceApplicationSecondaryIdentifier
{
  return self->_optionsSourceApplicationSecondaryIdentifier != 0;
}

- (void)setHasOptionsAppleIdContext:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasOptionsAppleIdContext
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setHasOptionsTlsPinningRequired:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = 0x80000000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(v3 & 0x80000000 | *(_DWORD *)&self->_has & 0x7FFFFFFF);
}

- (BOOL)hasOptionsTlsPinningRequired
{
  return *(_DWORD *)&self->_has >> 31;
}

- (BOOL)hasOptionsDiscretionaryNetworkBehavior
{
  return self->_optionsDiscretionaryNetworkBehavior != 0;
}

- (BOOL)hasOptionsDuetPreClearedMode
{
  return self->_optionsDuetPreClearedMode != 0;
}

- (void)setHasOptionsAllowCellularAccess:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasOptionsAllowCellularAccess
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)C2MPNetworkEvent;
  -[C2MPNetworkEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPNetworkEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return C2MPNetworkEventReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $C893DAD969560203051D3A1C34B78D80 has;
  $C893DAD969560203051D3A1C34B78D80 v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  $C893DAD969560203051D3A1C34B78D80 v11;
  _BYTE *v12;
  $C893DAD969560203051D3A1C34B78D80 v13;
  $C893DAD969560203051D3A1C34B78D80 v14;
  _QWORD *v15;

  v4 = a3;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v4[18] = self->_triggers;
    *((_DWORD *)v4 + 79) |= 0x20000u;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_reportFrequency;
  *((_DWORD *)v4 + 79) |= 8u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v4[5] = self->_reportFrequencyBase;
    *((_DWORD *)v4 + 79) |= 0x10u;
  }
LABEL_5:
  v15 = v4;
  if (self->_networkTaskDescription)
  {
    objc_msgSend(v4, "setNetworkTaskDescription:");
    v4 = v15;
  }
  if (self->_networkHostname)
  {
    objc_msgSend(v15, "setNetworkHostname:");
    v4 = v15;
  }
  if (self->_networkRemoteAddresssAndPort)
  {
    objc_msgSend(v15, "setNetworkRemoteAddresssAndPort:");
    v4 = v15;
  }
  if (self->_networkConnectionUuid)
  {
    objc_msgSend(v15, "setNetworkConnectionUuid:");
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    *((_BYTE *)v4 + 304) = self->_networkConnectionReused;
    *((_DWORD *)v4 + 79) |= 0x800000u;
  }
  if (self->_networkInterfaceIdentifier)
  {
    objc_msgSend(v15, "setNetworkInterfaceIdentifier:");
    v4 = v15;
  }
  if (self->_networkProtocolName)
  {
    objc_msgSend(v15, "setNetworkProtocolName:");
    v4 = v15;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
    *((_DWORD *)v4 + 56) = self->_networkRequestHeaderSize;
    *((_DWORD *)v4 + 79) |= 0x80000u;
    v6 = self->_has;
    if ((*(_BYTE *)&v6 & 1) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v6 & 0x100000) == 0)
        goto LABEL_22;
      goto LABEL_81;
    }
  }
  else if ((*(_BYTE *)&v6 & 1) == 0)
  {
    goto LABEL_21;
  }
  v4[1] = self->_networkRequestBodyBytesSent;
  *((_DWORD *)v4 + 79) |= 1u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v6 & 2) == 0)
      goto LABEL_23;
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)v4 + 60) = self->_networkResponseHeaderSize;
  *((_DWORD *)v4 + 79) |= 0x100000u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x40000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_82:
  v4[2] = self->_networkResponseBodyBytesReceived;
  *((_DWORD *)v4 + 79) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_24:
    *((_DWORD *)v4 + 50) = self->_networkPreviousAttemptCount;
    *((_DWORD *)v4 + 79) |= 0x40000u;
  }
LABEL_25:
  if (self->_networkFatalError)
  {
    objc_msgSend(v15, "setNetworkFatalError:");
    v4 = v15;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[3] = self->_networkStatusCode;
    *((_DWORD *)v4 + 79) |= 4u;
  }
  if (self->_networkRequestUri)
  {
    objc_msgSend(v15, "setNetworkRequestUri:");
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    *((_BYTE *)v4 + 305) = self->_networkIsDiscretionary;
    *((_DWORD *)v4 + 79) |= 0x1000000u;
  }
  if (self->_networkNegotiatedTlsProtocolVersion)
    objc_msgSend(v15, "setNetworkNegotiatedTlsProtocolVersion:");
  if (-[C2MPNetworkEvent networkPathInfosCount](self, "networkPathInfosCount"))
  {
    objc_msgSend(v15, "clearNetworkPathInfos");
    v7 = -[C2MPNetworkEvent networkPathInfosCount](self, "networkPathInfosCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        -[C2MPNetworkEvent networkPathInfoAtIndex:](self, "networkPathInfoAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addNetworkPathInfo:", v10);

      }
    }
  }
  v11 = self->_has;
  v12 = v15;
  if ((*(_BYTE *)&v11 & 0x20) != 0)
  {
    v15[6] = self->_timestampC2Init;
    *((_DWORD *)v15 + 79) |= 0x20u;
    v11 = self->_has;
    if ((*(_BYTE *)&v11 & 0x80) == 0)
    {
LABEL_41:
      if ((*(_BYTE *)&v11 & 0x40) == 0)
        goto LABEL_42;
      goto LABEL_86;
    }
  }
  else if ((*(_BYTE *)&v11 & 0x80) == 0)
  {
    goto LABEL_41;
  }
  v15[8] = self->_timestampC2Start;
  *((_DWORD *)v15 + 79) |= 0x80u;
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x40) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v11 & 0x200) == 0)
      goto LABEL_43;
    goto LABEL_87;
  }
LABEL_86:
  v15[7] = self->_timestampC2Now;
  *((_DWORD *)v15 + 79) |= 0x40u;
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x200) == 0)
  {
LABEL_43:
    if ((*(_WORD *)&v11 & 0x100) == 0)
      goto LABEL_44;
    goto LABEL_88;
  }
LABEL_87:
  v15[10] = self->_timestampDnsStart;
  *((_DWORD *)v15 + 79) |= 0x200u;
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x100) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v11 & 0x10000) == 0)
      goto LABEL_45;
    goto LABEL_89;
  }
LABEL_88:
  v15[9] = self->_timestampDnsEnd;
  *((_DWORD *)v15 + 79) |= 0x100u;
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x10000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v11 & 0x8000) == 0)
      goto LABEL_46;
    goto LABEL_90;
  }
LABEL_89:
  v15[17] = self->_timestampTcpStart;
  *((_DWORD *)v15 + 79) |= 0x10000u;
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x8000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v11 & 0x4000) == 0)
      goto LABEL_47;
    goto LABEL_91;
  }
LABEL_90:
  v15[16] = self->_timestampTcpEnd;
  *((_DWORD *)v15 + 79) |= 0x8000u;
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x4000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v11 & 0x800) == 0)
      goto LABEL_48;
    goto LABEL_92;
  }
LABEL_91:
  v15[15] = self->_timestampSslStart;
  *((_DWORD *)v15 + 79) |= 0x4000u;
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x800) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v11 & 0x400) == 0)
      goto LABEL_49;
    goto LABEL_93;
  }
LABEL_92:
  v15[12] = self->_timestampRequestStart;
  *((_DWORD *)v15 + 79) |= 0x800u;
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x400) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&v11 & 0x2000) == 0)
      goto LABEL_50;
    goto LABEL_94;
  }
LABEL_93:
  v15[11] = self->_timestampRequestEnd;
  *((_DWORD *)v15 + 79) |= 0x400u;
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x2000) == 0)
  {
LABEL_50:
    if ((*(_WORD *)&v11 & 0x1000) == 0)
      goto LABEL_52;
    goto LABEL_51;
  }
LABEL_94:
  v15[14] = self->_timestampResponseStart;
  *((_DWORD *)v15 + 79) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_51:
    v15[13] = self->_timestampResponseEnd;
    *((_DWORD *)v15 + 79) |= 0x1000u;
  }
LABEL_52:
  if (self->_optionsQualityOfService)
  {
    objc_msgSend(v15, "setOptionsQualityOfService:");
    v12 = v15;
  }
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000000) != 0)
  {
    v12[310] = self->_optionsOutOfProcess;
    *((_DWORD *)v12 + 79) |= 0x20000000u;
    v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x40000000) == 0)
    {
LABEL_56:
      if ((*(_DWORD *)&v13 & 0x4000000) == 0)
        goto LABEL_57;
      goto LABEL_98;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x40000000) == 0)
  {
    goto LABEL_56;
  }
  v12[311] = self->_optionsOutOfProcessForceDiscretionary;
  *((_DWORD *)v12 + 79) |= 0x40000000u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x4000000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&v13 & 0x8000000) == 0)
      goto LABEL_58;
    goto LABEL_99;
  }
LABEL_98:
  v12[307] = self->_optionsAllowExpensiveAccess;
  *((_DWORD *)v12 + 79) |= 0x4000000u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x8000000) == 0)
  {
LABEL_58:
    if ((*(_DWORD *)&v13 & 0x200000) == 0)
      goto LABEL_59;
    goto LABEL_100;
  }
LABEL_99:
  v12[308] = self->_optionsAllowPowerNapScheduling;
  *((_DWORD *)v12 + 79) |= 0x8000000u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
LABEL_59:
    if ((*(_DWORD *)&v13 & 0x400000) == 0)
      goto LABEL_61;
    goto LABEL_60;
  }
LABEL_100:
  *((_DWORD *)v12 + 74) = self->_optionsTimeoutIntervalForRequest;
  *((_DWORD *)v12 + 79) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_60:
    *((_DWORD *)v12 + 75) = self->_optionsTimeoutIntervalForResource;
    *((_DWORD *)v12 + 79) |= 0x400000u;
  }
LABEL_61:
  if (self->_optionsSourceApplicationBundleIdentifier)
  {
    objc_msgSend(v15, "setOptionsSourceApplicationBundleIdentifier:");
    v12 = v15;
  }
  if (self->_optionsSourceApplicationSecondaryIdentifier)
  {
    objc_msgSend(v15, "setOptionsSourceApplicationSecondaryIdentifier:");
    v12 = v15;
  }
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000000) != 0)
  {
    v12[309] = self->_optionsAppleIdContext;
    *((_DWORD *)v12 + 79) |= 0x10000000u;
    v14 = self->_has;
  }
  if ((*(_DWORD *)&v14 & 0x80000000) != 0)
  {
    v12[312] = self->_optionsTlsPinningRequired;
    *((_DWORD *)v12 + 79) |= 0x80000000;
  }
  if (self->_optionsDiscretionaryNetworkBehavior)
  {
    objc_msgSend(v15, "setOptionsDiscretionaryNetworkBehavior:");
    v12 = v15;
  }
  if (self->_optionsDuetPreClearedMode)
  {
    objc_msgSend(v15, "setOptionsDuetPreClearedMode:");
    v12 = v15;
  }
  if ((*((_BYTE *)&self->_has + 3) & 2) != 0)
  {
    v12[306] = self->_optionsAllowCellularAccess;
    *((_DWORD *)v12 + 79) |= 0x2000000u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $C893DAD969560203051D3A1C34B78D80 has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  $C893DAD969560203051D3A1C34B78D80 v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  $C893DAD969560203051D3A1C34B78D80 v33;
  uint64_t v34;
  void *v35;
  $C893DAD969560203051D3A1C34B78D80 v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  $C893DAD969560203051D3A1C34B78D80 v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    *(_QWORD *)(v5 + 144) = self->_triggers;
    *(_DWORD *)(v5 + 316) |= 0x20000u;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 32) = self->_reportFrequency;
  *(_DWORD *)(v5 + 316) |= 8u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 40) = self->_reportFrequencyBase;
    *(_DWORD *)(v5 + 316) |= 0x10u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_networkTaskDescription, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 248);
  *(_QWORD *)(v6 + 248) = v8;

  v10 = -[NSString copyWithZone:](self->_networkHostname, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = v10;

  v12 = -[NSString copyWithZone:](self->_networkRemoteAddresssAndPort, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 216);
  *(_QWORD *)(v6 + 216) = v12;

  v14 = -[NSString copyWithZone:](self->_networkConnectionUuid, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 152);
  *(_QWORD *)(v6 + 152) = v14;

  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    *(_BYTE *)(v6 + 304) = self->_networkConnectionReused;
    *(_DWORD *)(v6 + 316) |= 0x800000u;
  }
  v16 = -[NSString copyWithZone:](self->_networkInterfaceIdentifier, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 176);
  *(_QWORD *)(v6 + 176) = v16;

  v18 = -[NSString copyWithZone:](self->_networkProtocolName, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 208);
  *(_QWORD *)(v6 + 208) = v18;

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x80000) != 0)
  {
    *(_DWORD *)(v6 + 224) = self->_networkRequestHeaderSize;
    *(_DWORD *)(v6 + 316) |= 0x80000u;
    v20 = self->_has;
    if ((*(_BYTE *)&v20 & 1) == 0)
    {
LABEL_9:
      if ((*(_DWORD *)&v20 & 0x100000) == 0)
        goto LABEL_10;
      goto LABEL_56;
    }
  }
  else if ((*(_BYTE *)&v20 & 1) == 0)
  {
    goto LABEL_9;
  }
  *(_QWORD *)(v6 + 8) = self->_networkRequestBodyBytesSent;
  *(_DWORD *)(v6 + 316) |= 1u;
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&v20 & 2) == 0)
      goto LABEL_11;
    goto LABEL_57;
  }
LABEL_56:
  *(_DWORD *)(v6 + 240) = self->_networkResponseHeaderSize;
  *(_DWORD *)(v6 + 316) |= 0x100000u;
  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 2) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&v20 & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_57:
  *(_QWORD *)(v6 + 16) = self->_networkResponseBodyBytesReceived;
  *(_DWORD *)(v6 + 316) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_12:
    *(_DWORD *)(v6 + 200) = self->_networkPreviousAttemptCount;
    *(_DWORD *)(v6 + 316) |= 0x40000u;
  }
LABEL_13:
  v21 = -[C2MPError copyWithZone:](self->_networkFatalError, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 160);
  *(_QWORD *)(v6 + 160) = v21;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v6 + 24) = self->_networkStatusCode;
    *(_DWORD *)(v6 + 316) |= 4u;
  }
  v23 = -[NSString copyWithZone:](self->_networkRequestUri, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 232);
  *(_QWORD *)(v6 + 232) = v23;

  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    *(_BYTE *)(v6 + 305) = self->_networkIsDiscretionary;
    *(_DWORD *)(v6 + 316) |= 0x1000000u;
  }
  v25 = -[NSString copyWithZone:](self->_networkNegotiatedTlsProtocolVersion, "copyWithZone:", a3);
  v26 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = v25;

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v27 = self->_networkPathInfos;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v49;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v49 != v30)
          objc_enumerationMutation(v27);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v31), "copyWithZone:", a3, (_QWORD)v48);
        objc_msgSend((id)v6, "addNetworkPathInfo:", v32);

        ++v31;
      }
      while (v29 != v31);
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v29);
  }

  v33 = self->_has;
  if ((*(_BYTE *)&v33 & 0x20) != 0)
  {
    *(_QWORD *)(v6 + 48) = self->_timestampC2Init;
    *(_DWORD *)(v6 + 316) |= 0x20u;
    v33 = self->_has;
    if ((*(_BYTE *)&v33 & 0x80) == 0)
    {
LABEL_26:
      if ((*(_BYTE *)&v33 & 0x40) == 0)
        goto LABEL_27;
      goto LABEL_61;
    }
  }
  else if ((*(_BYTE *)&v33 & 0x80) == 0)
  {
    goto LABEL_26;
  }
  *(_QWORD *)(v6 + 64) = self->_timestampC2Start;
  *(_DWORD *)(v6 + 316) |= 0x80u;
  v33 = self->_has;
  if ((*(_BYTE *)&v33 & 0x40) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v33 & 0x200) == 0)
      goto LABEL_28;
    goto LABEL_62;
  }
LABEL_61:
  *(_QWORD *)(v6 + 56) = self->_timestampC2Now;
  *(_DWORD *)(v6 + 316) |= 0x40u;
  v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x200) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v33 & 0x100) == 0)
      goto LABEL_29;
    goto LABEL_63;
  }
LABEL_62:
  *(_QWORD *)(v6 + 80) = self->_timestampDnsStart;
  *(_DWORD *)(v6 + 316) |= 0x200u;
  v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x100) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v33 & 0x10000) == 0)
      goto LABEL_30;
    goto LABEL_64;
  }
LABEL_63:
  *(_QWORD *)(v6 + 72) = self->_timestampDnsEnd;
  *(_DWORD *)(v6 + 316) |= 0x100u;
  v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x10000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v33 & 0x8000) == 0)
      goto LABEL_31;
    goto LABEL_65;
  }
LABEL_64:
  *(_QWORD *)(v6 + 136) = self->_timestampTcpStart;
  *(_DWORD *)(v6 + 316) |= 0x10000u;
  v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x8000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v33 & 0x4000) == 0)
      goto LABEL_32;
    goto LABEL_66;
  }
LABEL_65:
  *(_QWORD *)(v6 + 128) = self->_timestampTcpEnd;
  *(_DWORD *)(v6 + 316) |= 0x8000u;
  v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x4000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v33 & 0x800) == 0)
      goto LABEL_33;
    goto LABEL_67;
  }
LABEL_66:
  *(_QWORD *)(v6 + 120) = self->_timestampSslStart;
  *(_DWORD *)(v6 + 316) |= 0x4000u;
  v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x800) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v33 & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_68;
  }
LABEL_67:
  *(_QWORD *)(v6 + 96) = self->_timestampRequestStart;
  *(_DWORD *)(v6 + 316) |= 0x800u;
  v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v33 & 0x2000) == 0)
      goto LABEL_35;
    goto LABEL_69;
  }
LABEL_68:
  *(_QWORD *)(v6 + 88) = self->_timestampRequestEnd;
  *(_DWORD *)(v6 + 316) |= 0x400u;
  v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x2000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v33 & 0x1000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_69:
  *(_QWORD *)(v6 + 112) = self->_timestampResponseStart;
  *(_DWORD *)(v6 + 316) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_36:
    *(_QWORD *)(v6 + 104) = self->_timestampResponseEnd;
    *(_DWORD *)(v6 + 316) |= 0x1000u;
  }
LABEL_37:
  v34 = -[NSString copyWithZone:](self->_optionsQualityOfService, "copyWithZone:", a3, (_QWORD)v48);
  v35 = *(void **)(v6 + 272);
  *(_QWORD *)(v6 + 272) = v34;

  v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x20000000) != 0)
  {
    *(_BYTE *)(v6 + 310) = self->_optionsOutOfProcess;
    *(_DWORD *)(v6 + 316) |= 0x20000000u;
    v36 = self->_has;
    if ((*(_DWORD *)&v36 & 0x40000000) == 0)
    {
LABEL_39:
      if ((*(_DWORD *)&v36 & 0x4000000) == 0)
        goto LABEL_40;
      goto LABEL_73;
    }
  }
  else if ((*(_DWORD *)&v36 & 0x40000000) == 0)
  {
    goto LABEL_39;
  }
  *(_BYTE *)(v6 + 311) = self->_optionsOutOfProcessForceDiscretionary;
  *(_DWORD *)(v6 + 316) |= 0x40000000u;
  v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x4000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v36 & 0x8000000) == 0)
      goto LABEL_41;
    goto LABEL_74;
  }
LABEL_73:
  *(_BYTE *)(v6 + 307) = self->_optionsAllowExpensiveAccess;
  *(_DWORD *)(v6 + 316) |= 0x4000000u;
  v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x8000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v36 & 0x200000) == 0)
      goto LABEL_42;
    goto LABEL_75;
  }
LABEL_74:
  *(_BYTE *)(v6 + 308) = self->_optionsAllowPowerNapScheduling;
  *(_DWORD *)(v6 + 316) |= 0x8000000u;
  v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x200000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v36 & 0x400000) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
LABEL_75:
  *(_DWORD *)(v6 + 296) = self->_optionsTimeoutIntervalForRequest;
  *(_DWORD *)(v6 + 316) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_43:
    *(_DWORD *)(v6 + 300) = self->_optionsTimeoutIntervalForResource;
    *(_DWORD *)(v6 + 316) |= 0x400000u;
  }
LABEL_44:
  v37 = -[NSString copyWithZone:](self->_optionsSourceApplicationBundleIdentifier, "copyWithZone:", a3);
  v38 = *(void **)(v6 + 280);
  *(_QWORD *)(v6 + 280) = v37;

  v39 = -[NSString copyWithZone:](self->_optionsSourceApplicationSecondaryIdentifier, "copyWithZone:", a3);
  v40 = *(void **)(v6 + 288);
  *(_QWORD *)(v6 + 288) = v39;

  v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x10000000) != 0)
  {
    *(_BYTE *)(v6 + 309) = self->_optionsAppleIdContext;
    *(_DWORD *)(v6 + 316) |= 0x10000000u;
    v41 = self->_has;
  }
  if ((*(_DWORD *)&v41 & 0x80000000) != 0)
  {
    *(_BYTE *)(v6 + 312) = self->_optionsTlsPinningRequired;
    *(_DWORD *)(v6 + 316) |= 0x80000000;
  }
  v42 = -[NSString copyWithZone:](self->_optionsDiscretionaryNetworkBehavior, "copyWithZone:", a3);
  v43 = *(void **)(v6 + 256);
  *(_QWORD *)(v6 + 256) = v42;

  v44 = -[NSString copyWithZone:](self->_optionsDuetPreClearedMode, "copyWithZone:", a3);
  v45 = *(void **)(v6 + 264);
  *(_QWORD *)(v6 + 264) = v44;

  if ((*((_BYTE *)&self->_has + 3) & 2) != 0)
  {
    *(_BYTE *)(v6 + 306) = self->_optionsAllowCellularAccess;
    *(_DWORD *)(v6 + 316) |= 0x2000000u;
  }
  v46 = (id)v6;

  return v46;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $C893DAD969560203051D3A1C34B78D80 has;
  int v6;
  NSString *networkTaskDescription;
  NSString *networkHostname;
  NSString *networkRemoteAddresssAndPort;
  NSString *networkConnectionUuid;
  int v11;
  NSString *networkInterfaceIdentifier;
  NSString *networkProtocolName;
  $C893DAD969560203051D3A1C34B78D80 v14;
  int v15;
  C2MPError *networkFatalError;
  int v17;
  NSString *networkRequestUri;
  int v19;
  NSString *networkNegotiatedTlsProtocolVersion;
  NSMutableArray *networkPathInfos;
  $C893DAD969560203051D3A1C34B78D80 v22;
  int v23;
  NSString *optionsQualityOfService;
  int v25;
  NSString *optionsSourceApplicationBundleIdentifier;
  NSString *optionsSourceApplicationSecondaryIdentifier;
  $C893DAD969560203051D3A1C34B78D80 v28;
  int v29;
  NSString *optionsDiscretionaryNetworkBehavior;
  NSString *optionsDuetPreClearedMode;
  int v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_221;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 79);
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_triggers != *((_QWORD *)v4 + 18))
      goto LABEL_221;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_reportFrequency != *((_QWORD *)v4 + 4))
      goto LABEL_221;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_reportFrequencyBase != *((_QWORD *)v4 + 5))
      goto LABEL_221;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_221;
  }
  networkTaskDescription = self->_networkTaskDescription;
  if ((unint64_t)networkTaskDescription | *((_QWORD *)v4 + 31)
    && !-[NSString isEqual:](networkTaskDescription, "isEqual:"))
  {
    goto LABEL_221;
  }
  networkHostname = self->_networkHostname;
  if ((unint64_t)networkHostname | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](networkHostname, "isEqual:"))
      goto LABEL_221;
  }
  networkRemoteAddresssAndPort = self->_networkRemoteAddresssAndPort;
  if ((unint64_t)networkRemoteAddresssAndPort | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](networkRemoteAddresssAndPort, "isEqual:"))
      goto LABEL_221;
  }
  networkConnectionUuid = self->_networkConnectionUuid;
  if ((unint64_t)networkConnectionUuid | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](networkConnectionUuid, "isEqual:"))
      goto LABEL_221;
  }
  v11 = *((_DWORD *)v4 + 79);
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    if ((v11 & 0x800000) == 0)
      goto LABEL_221;
    if (self->_networkConnectionReused)
    {
      if (!*((_BYTE *)v4 + 304))
        goto LABEL_221;
    }
    else if (*((_BYTE *)v4 + 304))
    {
      goto LABEL_221;
    }
  }
  else if ((v11 & 0x800000) != 0)
  {
    goto LABEL_221;
  }
  networkInterfaceIdentifier = self->_networkInterfaceIdentifier;
  if ((unint64_t)networkInterfaceIdentifier | *((_QWORD *)v4 + 22)
    && !-[NSString isEqual:](networkInterfaceIdentifier, "isEqual:"))
  {
    goto LABEL_221;
  }
  networkProtocolName = self->_networkProtocolName;
  if ((unint64_t)networkProtocolName | *((_QWORD *)v4 + 26))
  {
    if (!-[NSString isEqual:](networkProtocolName, "isEqual:"))
      goto LABEL_221;
  }
  v14 = self->_has;
  v15 = *((_DWORD *)v4 + 79);
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
    if ((v15 & 0x80000) == 0 || self->_networkRequestHeaderSize != *((_DWORD *)v4 + 56))
      goto LABEL_221;
  }
  else if ((v15 & 0x80000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_BYTE *)&v14 & 1) != 0)
  {
    if ((v15 & 1) == 0 || self->_networkRequestBodyBytesSent != *((_QWORD *)v4 + 1))
      goto LABEL_221;
  }
  else if ((v15 & 1) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v14 & 0x100000) != 0)
  {
    if ((v15 & 0x100000) == 0 || self->_networkResponseHeaderSize != *((_DWORD *)v4 + 60))
      goto LABEL_221;
  }
  else if ((v15 & 0x100000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_BYTE *)&v14 & 2) != 0)
  {
    if ((v15 & 2) == 0 || self->_networkResponseBodyBytesReceived != *((_QWORD *)v4 + 2))
      goto LABEL_221;
  }
  else if ((v15 & 2) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
    if ((v15 & 0x40000) == 0 || self->_networkPreviousAttemptCount != *((_DWORD *)v4 + 50))
      goto LABEL_221;
  }
  else if ((v15 & 0x40000) != 0)
  {
    goto LABEL_221;
  }
  networkFatalError = self->_networkFatalError;
  if ((unint64_t)networkFatalError | *((_QWORD *)v4 + 20))
  {
    if (!-[C2MPError isEqual:](networkFatalError, "isEqual:"))
      goto LABEL_221;
    v14 = self->_has;
  }
  v17 = *((_DWORD *)v4 + 79);
  if ((*(_BYTE *)&v14 & 4) != 0)
  {
    if ((v17 & 4) == 0 || self->_networkStatusCode != *((_QWORD *)v4 + 3))
      goto LABEL_221;
  }
  else if ((v17 & 4) != 0)
  {
    goto LABEL_221;
  }
  networkRequestUri = self->_networkRequestUri;
  if ((unint64_t)networkRequestUri | *((_QWORD *)v4 + 29))
  {
    if (!-[NSString isEqual:](networkRequestUri, "isEqual:"))
      goto LABEL_221;
    v14 = self->_has;
  }
  v19 = *((_DWORD *)v4 + 79);
  if ((*(_DWORD *)&v14 & 0x1000000) != 0)
  {
    if ((v19 & 0x1000000) == 0)
      goto LABEL_221;
    if (self->_networkIsDiscretionary)
    {
      if (!*((_BYTE *)v4 + 305))
        goto LABEL_221;
    }
    else if (*((_BYTE *)v4 + 305))
    {
      goto LABEL_221;
    }
  }
  else if ((v19 & 0x1000000) != 0)
  {
    goto LABEL_221;
  }
  networkNegotiatedTlsProtocolVersion = self->_networkNegotiatedTlsProtocolVersion;
  if ((unint64_t)networkNegotiatedTlsProtocolVersion | *((_QWORD *)v4 + 23)
    && !-[NSString isEqual:](networkNegotiatedTlsProtocolVersion, "isEqual:"))
  {
    goto LABEL_221;
  }
  networkPathInfos = self->_networkPathInfos;
  if ((unint64_t)networkPathInfos | *((_QWORD *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](networkPathInfos, "isEqual:"))
      goto LABEL_221;
  }
  v22 = self->_has;
  v23 = *((_DWORD *)v4 + 79);
  if ((*(_BYTE *)&v22 & 0x20) != 0)
  {
    if ((v23 & 0x20) == 0 || self->_timestampC2Init != *((_QWORD *)v4 + 6))
      goto LABEL_221;
  }
  else if ((v23 & 0x20) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_BYTE *)&v22 & 0x80) != 0)
  {
    if ((v23 & 0x80) == 0 || self->_timestampC2Start != *((_QWORD *)v4 + 8))
      goto LABEL_221;
  }
  else if ((v23 & 0x80) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_BYTE *)&v22 & 0x40) != 0)
  {
    if ((v23 & 0x40) == 0 || self->_timestampC2Now != *((_QWORD *)v4 + 7))
      goto LABEL_221;
  }
  else if ((v23 & 0x40) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_WORD *)&v22 & 0x200) != 0)
  {
    if ((v23 & 0x200) == 0 || self->_timestampDnsStart != *((_QWORD *)v4 + 10))
      goto LABEL_221;
  }
  else if ((v23 & 0x200) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_WORD *)&v22 & 0x100) != 0)
  {
    if ((v23 & 0x100) == 0 || self->_timestampDnsEnd != *((_QWORD *)v4 + 9))
      goto LABEL_221;
  }
  else if ((v23 & 0x100) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v22 & 0x10000) != 0)
  {
    if ((v23 & 0x10000) == 0 || self->_timestampTcpStart != *((_QWORD *)v4 + 17))
      goto LABEL_221;
  }
  else if ((v23 & 0x10000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_WORD *)&v22 & 0x8000) != 0)
  {
    if ((v23 & 0x8000) == 0 || self->_timestampTcpEnd != *((_QWORD *)v4 + 16))
      goto LABEL_221;
  }
  else if ((v23 & 0x8000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_WORD *)&v22 & 0x4000) != 0)
  {
    if ((v23 & 0x4000) == 0 || self->_timestampSslStart != *((_QWORD *)v4 + 15))
      goto LABEL_221;
  }
  else if ((v23 & 0x4000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_WORD *)&v22 & 0x800) != 0)
  {
    if ((v23 & 0x800) == 0 || self->_timestampRequestStart != *((_QWORD *)v4 + 12))
      goto LABEL_221;
  }
  else if ((v23 & 0x800) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_WORD *)&v22 & 0x400) != 0)
  {
    if ((v23 & 0x400) == 0 || self->_timestampRequestEnd != *((_QWORD *)v4 + 11))
      goto LABEL_221;
  }
  else if ((v23 & 0x400) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_WORD *)&v22 & 0x2000) != 0)
  {
    if ((v23 & 0x2000) == 0 || self->_timestampResponseStart != *((_QWORD *)v4 + 14))
      goto LABEL_221;
  }
  else if ((v23 & 0x2000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_WORD *)&v22 & 0x1000) != 0)
  {
    if ((v23 & 0x1000) == 0 || self->_timestampResponseEnd != *((_QWORD *)v4 + 13))
      goto LABEL_221;
  }
  else if ((v23 & 0x1000) != 0)
  {
    goto LABEL_221;
  }
  optionsQualityOfService = self->_optionsQualityOfService;
  if ((unint64_t)optionsQualityOfService | *((_QWORD *)v4 + 34))
  {
    if (!-[NSString isEqual:](optionsQualityOfService, "isEqual:"))
      goto LABEL_221;
    v22 = self->_has;
  }
  v25 = *((_DWORD *)v4 + 79);
  if ((*(_DWORD *)&v22 & 0x20000000) != 0)
  {
    if ((v25 & 0x20000000) == 0)
      goto LABEL_221;
    if (self->_optionsOutOfProcess)
    {
      if (!*((_BYTE *)v4 + 310))
        goto LABEL_221;
    }
    else if (*((_BYTE *)v4 + 310))
    {
      goto LABEL_221;
    }
  }
  else if ((v25 & 0x20000000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v22 & 0x40000000) != 0)
  {
    if ((v25 & 0x40000000) == 0)
      goto LABEL_221;
    if (self->_optionsOutOfProcessForceDiscretionary)
    {
      if (!*((_BYTE *)v4 + 311))
        goto LABEL_221;
    }
    else if (*((_BYTE *)v4 + 311))
    {
      goto LABEL_221;
    }
  }
  else if ((v25 & 0x40000000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v22 & 0x4000000) != 0)
  {
    if ((v25 & 0x4000000) == 0)
      goto LABEL_221;
    if (self->_optionsAllowExpensiveAccess)
    {
      if (!*((_BYTE *)v4 + 307))
        goto LABEL_221;
    }
    else if (*((_BYTE *)v4 + 307))
    {
      goto LABEL_221;
    }
  }
  else if ((v25 & 0x4000000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v22 & 0x8000000) != 0)
  {
    if ((v25 & 0x8000000) == 0)
      goto LABEL_221;
    if (self->_optionsAllowPowerNapScheduling)
    {
      if (!*((_BYTE *)v4 + 308))
        goto LABEL_221;
    }
    else if (*((_BYTE *)v4 + 308))
    {
      goto LABEL_221;
    }
  }
  else if ((v25 & 0x8000000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v22 & 0x200000) != 0)
  {
    if ((v25 & 0x200000) == 0 || self->_optionsTimeoutIntervalForRequest != *((_DWORD *)v4 + 74))
      goto LABEL_221;
  }
  else if ((v25 & 0x200000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v22 & 0x400000) != 0)
  {
    if ((v25 & 0x400000) == 0 || self->_optionsTimeoutIntervalForResource != *((_DWORD *)v4 + 75))
      goto LABEL_221;
  }
  else if ((v25 & 0x400000) != 0)
  {
    goto LABEL_221;
  }
  optionsSourceApplicationBundleIdentifier = self->_optionsSourceApplicationBundleIdentifier;
  if ((unint64_t)optionsSourceApplicationBundleIdentifier | *((_QWORD *)v4 + 35)
    && !-[NSString isEqual:](optionsSourceApplicationBundleIdentifier, "isEqual:"))
  {
    goto LABEL_221;
  }
  optionsSourceApplicationSecondaryIdentifier = self->_optionsSourceApplicationSecondaryIdentifier;
  if ((unint64_t)optionsSourceApplicationSecondaryIdentifier | *((_QWORD *)v4 + 36))
  {
    if (!-[NSString isEqual:](optionsSourceApplicationSecondaryIdentifier, "isEqual:"))
      goto LABEL_221;
  }
  v28 = self->_has;
  v29 = *((_DWORD *)v4 + 79);
  if ((*(_DWORD *)&v28 & 0x10000000) != 0)
  {
    if ((v29 & 0x10000000) == 0)
      goto LABEL_221;
    if (self->_optionsAppleIdContext)
    {
      if (!*((_BYTE *)v4 + 309))
        goto LABEL_221;
    }
    else if (*((_BYTE *)v4 + 309))
    {
      goto LABEL_221;
    }
  }
  else if ((v29 & 0x10000000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v28 & 0x80000000) != 0)
  {
    if ((v29 & 0x80000000) == 0)
      goto LABEL_221;
    if (self->_optionsTlsPinningRequired)
    {
      if (!*((_BYTE *)v4 + 312))
        goto LABEL_221;
    }
    else if (*((_BYTE *)v4 + 312))
    {
      goto LABEL_221;
    }
  }
  else if (v29 < 0)
  {
    goto LABEL_221;
  }
  optionsDiscretionaryNetworkBehavior = self->_optionsDiscretionaryNetworkBehavior;
  if ((unint64_t)optionsDiscretionaryNetworkBehavior | *((_QWORD *)v4 + 32)
    && !-[NSString isEqual:](optionsDiscretionaryNetworkBehavior, "isEqual:"))
  {
    goto LABEL_221;
  }
  optionsDuetPreClearedMode = self->_optionsDuetPreClearedMode;
  if ((unint64_t)optionsDuetPreClearedMode | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](optionsDuetPreClearedMode, "isEqual:"))
      goto LABEL_221;
  }
  v32 = *((_DWORD *)v4 + 79);
  if ((*((_BYTE *)&self->_has + 3) & 2) != 0)
  {
    if ((v32 & 0x2000000) != 0)
    {
      if (self->_optionsAllowCellularAccess)
      {
        if (!*((_BYTE *)v4 + 306))
          goto LABEL_221;
LABEL_223:
        v33 = 1;
        goto LABEL_222;
      }
      if (!*((_BYTE *)v4 + 306))
        goto LABEL_223;
    }
LABEL_221:
    v33 = 0;
    goto LABEL_222;
  }
  v33 = (v32 & 0x2000000) == 0;
LABEL_222:

  return v33;
}

- (unint64_t)hash
{
  $C893DAD969560203051D3A1C34B78D80 has;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  $C893DAD969560203051D3A1C34B78D80 v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  $C893DAD969560203051D3A1C34B78D80 v14;
  NSUInteger v15;
  $C893DAD969560203051D3A1C34B78D80 v16;
  NSUInteger v17;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  $C893DAD969560203051D3A1C34B78D80 v21;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  NSUInteger v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  NSUInteger v57;
  NSUInteger v58;
  NSUInteger v59;
  NSUInteger v60;
  NSUInteger v61;
  NSUInteger v62;
  unint64_t v63;
  unint64_t v64;
  NSUInteger v65;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
    v4 = 2654435761u * self->_triggers;
  else
    v4 = 0;
  v64 = v4;
  if ((*(_BYTE *)&has & 8) != 0)
    v5 = 2654435761u * self->_reportFrequency;
  else
    v5 = 0;
  v63 = v5;
  if ((*(_BYTE *)&has & 0x10) != 0)
    v32 = 2654435761u * self->_reportFrequencyBase;
  else
    v32 = 0;
  v62 = -[NSString hash](self->_networkTaskDescription, "hash");
  v61 = -[NSString hash](self->_networkHostname, "hash");
  v60 = -[NSString hash](self->_networkRemoteAddresssAndPort, "hash");
  v59 = -[NSString hash](self->_networkConnectionUuid, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
    v31 = 2654435761 * self->_networkConnectionReused;
  else
    v31 = 0;
  v58 = -[NSString hash](self->_networkInterfaceIdentifier, "hash");
  v6 = -[NSString hash](self->_networkProtocolName, "hash");
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) != 0)
  {
    v8 = 2654435761 * self->_networkRequestHeaderSize;
    if ((*(_BYTE *)&v7 & 1) != 0)
    {
LABEL_15:
      v9 = 2654435761u * self->_networkRequestBodyBytesSent;
      if ((*(_DWORD *)&v7 & 0x100000) != 0)
        goto LABEL_16;
LABEL_20:
      v10 = 0;
      if ((*(_BYTE *)&v7 & 2) != 0)
        goto LABEL_17;
      goto LABEL_21;
    }
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)&v7 & 1) != 0)
      goto LABEL_15;
  }
  v9 = 0;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
    goto LABEL_20;
LABEL_16:
  v10 = 2654435761 * self->_networkResponseHeaderSize;
  if ((*(_BYTE *)&v7 & 2) != 0)
  {
LABEL_17:
    v11 = 2654435761u * self->_networkResponseBodyBytesReceived;
    goto LABEL_22;
  }
LABEL_21:
  v11 = 0;
LABEL_22:
  v56 = v8;
  v57 = v6;
  v54 = v10;
  v55 = v9;
  v53 = v11;
  if ((*(_DWORD *)&v7 & 0x40000) != 0)
    v30 = 2654435761 * self->_networkPreviousAttemptCount;
  else
    v30 = 0;
  v52 = -[C2MPError hash](self->_networkFatalError, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v29 = 2654435761u * self->_networkStatusCode;
  else
    v29 = 0;
  v51 = -[NSString hash](self->_networkRequestUri, "hash");
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
    v28 = 2654435761 * self->_networkIsDiscretionary;
  else
    v28 = 0;
  v12 = -[NSString hash](self->_networkNegotiatedTlsProtocolVersion, "hash");
  v13 = -[NSMutableArray hash](self->_networkPathInfos, "hash");
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x20) != 0)
  {
    v49 = 2654435761u * self->_timestampC2Init;
    if ((*(_BYTE *)&v14 & 0x80) != 0)
    {
LABEL_33:
      v48 = 2654435761u * self->_timestampC2Start;
      if ((*(_BYTE *)&v14 & 0x40) != 0)
        goto LABEL_34;
      goto LABEL_45;
    }
  }
  else
  {
    v49 = 0;
    if ((*(_BYTE *)&v14 & 0x80) != 0)
      goto LABEL_33;
  }
  v48 = 0;
  if ((*(_BYTE *)&v14 & 0x40) != 0)
  {
LABEL_34:
    v47 = 2654435761u * self->_timestampC2Now;
    if ((*(_WORD *)&v14 & 0x200) != 0)
      goto LABEL_35;
    goto LABEL_46;
  }
LABEL_45:
  v47 = 0;
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
LABEL_35:
    v46 = 2654435761u * self->_timestampDnsStart;
    if ((*(_WORD *)&v14 & 0x100) != 0)
      goto LABEL_36;
    goto LABEL_47;
  }
LABEL_46:
  v46 = 0;
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
LABEL_36:
    v45 = 2654435761u * self->_timestampDnsEnd;
    if ((*(_DWORD *)&v14 & 0x10000) != 0)
      goto LABEL_37;
    goto LABEL_48;
  }
LABEL_47:
  v45 = 0;
  if ((*(_DWORD *)&v14 & 0x10000) != 0)
  {
LABEL_37:
    v44 = 2654435761u * self->_timestampTcpStart;
    if ((*(_WORD *)&v14 & 0x8000) != 0)
      goto LABEL_38;
    goto LABEL_49;
  }
LABEL_48:
  v44 = 0;
  if ((*(_WORD *)&v14 & 0x8000) != 0)
  {
LABEL_38:
    v43 = 2654435761u * self->_timestampTcpEnd;
    if ((*(_WORD *)&v14 & 0x4000) != 0)
      goto LABEL_39;
    goto LABEL_50;
  }
LABEL_49:
  v43 = 0;
  if ((*(_WORD *)&v14 & 0x4000) != 0)
  {
LABEL_39:
    v42 = 2654435761u * self->_timestampSslStart;
    if ((*(_WORD *)&v14 & 0x800) != 0)
      goto LABEL_40;
    goto LABEL_51;
  }
LABEL_50:
  v42 = 0;
  if ((*(_WORD *)&v14 & 0x800) != 0)
  {
LABEL_40:
    v41 = 2654435761u * self->_timestampRequestStart;
    if ((*(_WORD *)&v14 & 0x400) != 0)
      goto LABEL_41;
LABEL_52:
    v40 = 0;
    if ((*(_WORD *)&v14 & 0x2000) != 0)
      goto LABEL_42;
    goto LABEL_53;
  }
LABEL_51:
  v41 = 0;
  if ((*(_WORD *)&v14 & 0x400) == 0)
    goto LABEL_52;
LABEL_41:
  v40 = 2654435761u * self->_timestampRequestEnd;
  if ((*(_WORD *)&v14 & 0x2000) != 0)
  {
LABEL_42:
    v39 = 2654435761u * self->_timestampResponseStart;
    goto LABEL_54;
  }
LABEL_53:
  v39 = 0;
LABEL_54:
  v50 = v13;
  if ((*(_WORD *)&v14 & 0x1000) != 0)
    v38 = 2654435761u * self->_timestampResponseEnd;
  else
    v38 = 0;
  v15 = -[NSString hash](self->_optionsQualityOfService, "hash");
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x20000000) != 0)
  {
    v37 = 2654435761 * self->_optionsOutOfProcess;
    if ((*(_DWORD *)&v16 & 0x40000000) != 0)
    {
LABEL_59:
      v36 = 2654435761 * self->_optionsOutOfProcessForceDiscretionary;
      if ((*(_DWORD *)&v16 & 0x4000000) != 0)
        goto LABEL_60;
LABEL_64:
      v35 = 0;
      if ((*(_DWORD *)&v16 & 0x8000000) != 0)
        goto LABEL_61;
      goto LABEL_65;
    }
  }
  else
  {
    v37 = 0;
    if ((*(_DWORD *)&v16 & 0x40000000) != 0)
      goto LABEL_59;
  }
  v36 = 0;
  if ((*(_DWORD *)&v16 & 0x4000000) == 0)
    goto LABEL_64;
LABEL_60:
  v35 = 2654435761 * self->_optionsAllowExpensiveAccess;
  if ((*(_DWORD *)&v16 & 0x8000000) != 0)
  {
LABEL_61:
    v34 = 2654435761 * self->_optionsAllowPowerNapScheduling;
    goto LABEL_66;
  }
LABEL_65:
  v34 = 0;
LABEL_66:
  v65 = v12;
  if ((*(_DWORD *)&v16 & 0x200000) != 0)
    v33 = 2654435761 * self->_optionsTimeoutIntervalForRequest;
  else
    v33 = 0;
  v17 = v15;
  if ((*(_DWORD *)&v16 & 0x400000) != 0)
    v18 = 2654435761 * self->_optionsTimeoutIntervalForResource;
  else
    v18 = 0;
  v19 = -[NSString hash](self->_optionsSourceApplicationBundleIdentifier, "hash");
  v20 = -[NSString hash](self->_optionsSourceApplicationSecondaryIdentifier, "hash");
  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x10000000) != 0)
  {
    v22 = 2654435761 * self->_optionsAppleIdContext;
    if ((*(_DWORD *)&v21 & 0x80000000) != 0)
      goto LABEL_74;
  }
  else
  {
    v22 = 0;
    if ((*(_DWORD *)&v21 & 0x80000000) != 0)
    {
LABEL_74:
      v23 = 2654435761 * self->_optionsTlsPinningRequired;
      goto LABEL_77;
    }
  }
  v23 = 0;
LABEL_77:
  v24 = -[NSString hash](self->_optionsDiscretionaryNetworkBehavior, "hash");
  v25 = -[NSString hash](self->_optionsDuetPreClearedMode, "hash");
  if ((*((_BYTE *)&self->_has + 3) & 2) != 0)
    v26 = 2654435761 * self->_optionsAllowCellularAccess;
  else
    v26 = 0;
  return v63 ^ v64 ^ v32 ^ v62 ^ v61 ^ v60 ^ v59 ^ v31 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v30 ^ v52 ^ v29 ^ v51 ^ v28 ^ v65 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v17 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v18 ^ v19 ^ v20 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  unint64_t *v5;
  int v6;
  int v7;
  C2MPError *networkFatalError;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  int v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (unint64_t *)a3;
  v5 = v4;
  v6 = *((_DWORD *)v4 + 79);
  if ((v6 & 0x20000) != 0)
  {
    self->_triggers = v4[18];
    *(_DWORD *)&self->_has |= 0x20000u;
    v6 = *((_DWORD *)v4 + 79);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_reportFrequency = v4[4];
  *(_DWORD *)&self->_has |= 8u;
  if ((*((_DWORD *)v4 + 79) & 0x10) != 0)
  {
LABEL_4:
    self->_reportFrequencyBase = v4[5];
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_5:
  if (v4[31])
    -[C2MPNetworkEvent setNetworkTaskDescription:](self, "setNetworkTaskDescription:");
  if (v5[21])
    -[C2MPNetworkEvent setNetworkHostname:](self, "setNetworkHostname:");
  if (v5[27])
    -[C2MPNetworkEvent setNetworkRemoteAddresssAndPort:](self, "setNetworkRemoteAddresssAndPort:");
  if (v5[19])
    -[C2MPNetworkEvent setNetworkConnectionUuid:](self, "setNetworkConnectionUuid:");
  if ((*((_BYTE *)v5 + 318) & 0x80) != 0)
  {
    self->_networkConnectionReused = *((_BYTE *)v5 + 304);
    *(_DWORD *)&self->_has |= 0x800000u;
  }
  if (v5[22])
    -[C2MPNetworkEvent setNetworkInterfaceIdentifier:](self, "setNetworkInterfaceIdentifier:");
  if (v5[26])
    -[C2MPNetworkEvent setNetworkProtocolName:](self, "setNetworkProtocolName:");
  v7 = *((_DWORD *)v5 + 79);
  if ((v7 & 0x80000) != 0)
  {
    self->_networkRequestHeaderSize = *((_DWORD *)v5 + 56);
    *(_DWORD *)&self->_has |= 0x80000u;
    v7 = *((_DWORD *)v5 + 79);
    if ((v7 & 1) == 0)
    {
LABEL_21:
      if ((v7 & 0x100000) == 0)
        goto LABEL_22;
      goto LABEL_33;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_21;
  }
  self->_networkRequestBodyBytesSent = v5[1];
  *(_DWORD *)&self->_has |= 1u;
  v7 = *((_DWORD *)v5 + 79);
  if ((v7 & 0x100000) == 0)
  {
LABEL_22:
    if ((v7 & 2) == 0)
      goto LABEL_23;
    goto LABEL_34;
  }
LABEL_33:
  self->_networkResponseHeaderSize = *((_DWORD *)v5 + 60);
  *(_DWORD *)&self->_has |= 0x100000u;
  v7 = *((_DWORD *)v5 + 79);
  if ((v7 & 2) == 0)
  {
LABEL_23:
    if ((v7 & 0x40000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_34:
  self->_networkResponseBodyBytesReceived = v5[2];
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)v5 + 79) & 0x40000) != 0)
  {
LABEL_24:
    self->_networkPreviousAttemptCount = *((_DWORD *)v5 + 50);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
LABEL_25:
  networkFatalError = self->_networkFatalError;
  v9 = v5[20];
  if (networkFatalError)
  {
    if (v9)
      -[C2MPError mergeFrom:](networkFatalError, "mergeFrom:");
  }
  else if (v9)
  {
    -[C2MPNetworkEvent setNetworkFatalError:](self, "setNetworkFatalError:");
  }
  if ((*((_BYTE *)v5 + 316) & 4) != 0)
  {
    self->_networkStatusCode = v5[3];
    *(_DWORD *)&self->_has |= 4u;
  }
  if (v5[29])
    -[C2MPNetworkEvent setNetworkRequestUri:](self, "setNetworkRequestUri:");
  if ((*((_BYTE *)v5 + 319) & 1) != 0)
  {
    self->_networkIsDiscretionary = *((_BYTE *)v5 + 305);
    *(_DWORD *)&self->_has |= 0x1000000u;
  }
  if (v5[23])
    -[C2MPNetworkEvent setNetworkNegotiatedTlsProtocolVersion:](self, "setNetworkNegotiatedTlsProtocolVersion:");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = (id)v5[24];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        -[C2MPNetworkEvent addNetworkPathInfo:](self, "addNetworkPathInfo:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x20) != 0)
  {
    self->_timestampC2Init = v5[6];
    *(_DWORD *)&self->_has |= 0x20u;
    v15 = *((_DWORD *)v5 + 79);
    if ((v15 & 0x80) == 0)
    {
LABEL_55:
      if ((v15 & 0x40) == 0)
        goto LABEL_56;
      goto LABEL_92;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_55;
  }
  self->_timestampC2Start = v5[8];
  *(_DWORD *)&self->_has |= 0x80u;
  v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x40) == 0)
  {
LABEL_56:
    if ((v15 & 0x200) == 0)
      goto LABEL_57;
    goto LABEL_93;
  }
LABEL_92:
  self->_timestampC2Now = v5[7];
  *(_DWORD *)&self->_has |= 0x40u;
  v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x200) == 0)
  {
LABEL_57:
    if ((v15 & 0x100) == 0)
      goto LABEL_58;
    goto LABEL_94;
  }
LABEL_93:
  self->_timestampDnsStart = v5[10];
  *(_DWORD *)&self->_has |= 0x200u;
  v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x100) == 0)
  {
LABEL_58:
    if ((v15 & 0x10000) == 0)
      goto LABEL_59;
    goto LABEL_95;
  }
LABEL_94:
  self->_timestampDnsEnd = v5[9];
  *(_DWORD *)&self->_has |= 0x100u;
  v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x10000) == 0)
  {
LABEL_59:
    if ((v15 & 0x8000) == 0)
      goto LABEL_60;
    goto LABEL_96;
  }
LABEL_95:
  self->_timestampTcpStart = v5[17];
  *(_DWORD *)&self->_has |= 0x10000u;
  v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x8000) == 0)
  {
LABEL_60:
    if ((v15 & 0x4000) == 0)
      goto LABEL_61;
    goto LABEL_97;
  }
LABEL_96:
  self->_timestampTcpEnd = v5[16];
  *(_DWORD *)&self->_has |= 0x8000u;
  v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x4000) == 0)
  {
LABEL_61:
    if ((v15 & 0x800) == 0)
      goto LABEL_62;
    goto LABEL_98;
  }
LABEL_97:
  self->_timestampSslStart = v5[15];
  *(_DWORD *)&self->_has |= 0x4000u;
  v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x800) == 0)
  {
LABEL_62:
    if ((v15 & 0x400) == 0)
      goto LABEL_63;
    goto LABEL_99;
  }
LABEL_98:
  self->_timestampRequestStart = v5[12];
  *(_DWORD *)&self->_has |= 0x800u;
  v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x400) == 0)
  {
LABEL_63:
    if ((v15 & 0x2000) == 0)
      goto LABEL_64;
    goto LABEL_100;
  }
LABEL_99:
  self->_timestampRequestEnd = v5[11];
  *(_DWORD *)&self->_has |= 0x400u;
  v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x2000) == 0)
  {
LABEL_64:
    if ((v15 & 0x1000) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_100:
  self->_timestampResponseStart = v5[14];
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v5 + 79) & 0x1000) != 0)
  {
LABEL_65:
    self->_timestampResponseEnd = v5[13];
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_66:
  if (v5[34])
    -[C2MPNetworkEvent setOptionsQualityOfService:](self, "setOptionsQualityOfService:");
  v16 = *((_DWORD *)v5 + 79);
  if ((v16 & 0x20000000) != 0)
  {
    self->_optionsOutOfProcess = *((_BYTE *)v5 + 310);
    *(_DWORD *)&self->_has |= 0x20000000u;
    v16 = *((_DWORD *)v5 + 79);
    if ((v16 & 0x40000000) == 0)
    {
LABEL_70:
      if ((v16 & 0x4000000) == 0)
        goto LABEL_71;
      goto LABEL_104;
    }
  }
  else if ((v16 & 0x40000000) == 0)
  {
    goto LABEL_70;
  }
  self->_optionsOutOfProcessForceDiscretionary = *((_BYTE *)v5 + 311);
  *(_DWORD *)&self->_has |= 0x40000000u;
  v16 = *((_DWORD *)v5 + 79);
  if ((v16 & 0x4000000) == 0)
  {
LABEL_71:
    if ((v16 & 0x8000000) == 0)
      goto LABEL_72;
    goto LABEL_105;
  }
LABEL_104:
  self->_optionsAllowExpensiveAccess = *((_BYTE *)v5 + 307);
  *(_DWORD *)&self->_has |= 0x4000000u;
  v16 = *((_DWORD *)v5 + 79);
  if ((v16 & 0x8000000) == 0)
  {
LABEL_72:
    if ((v16 & 0x200000) == 0)
      goto LABEL_73;
    goto LABEL_106;
  }
LABEL_105:
  self->_optionsAllowPowerNapScheduling = *((_BYTE *)v5 + 308);
  *(_DWORD *)&self->_has |= 0x8000000u;
  v16 = *((_DWORD *)v5 + 79);
  if ((v16 & 0x200000) == 0)
  {
LABEL_73:
    if ((v16 & 0x400000) == 0)
      goto LABEL_75;
    goto LABEL_74;
  }
LABEL_106:
  self->_optionsTimeoutIntervalForRequest = *((_DWORD *)v5 + 74);
  *(_DWORD *)&self->_has |= 0x200000u;
  if ((*((_DWORD *)v5 + 79) & 0x400000) != 0)
  {
LABEL_74:
    self->_optionsTimeoutIntervalForResource = *((_DWORD *)v5 + 75);
    *(_DWORD *)&self->_has |= 0x400000u;
  }
LABEL_75:
  if (v5[35])
    -[C2MPNetworkEvent setOptionsSourceApplicationBundleIdentifier:](self, "setOptionsSourceApplicationBundleIdentifier:");
  if (v5[36])
    -[C2MPNetworkEvent setOptionsSourceApplicationSecondaryIdentifier:](self, "setOptionsSourceApplicationSecondaryIdentifier:");
  v17 = *((_DWORD *)v5 + 79);
  if ((v17 & 0x10000000) != 0)
  {
    self->_optionsAppleIdContext = *((_BYTE *)v5 + 309);
    *(_DWORD *)&self->_has |= 0x10000000u;
    v17 = *((_DWORD *)v5 + 79);
  }
  if (v17 < 0)
  {
    self->_optionsTlsPinningRequired = *((_BYTE *)v5 + 312);
    *(_DWORD *)&self->_has |= 0x80000000;
  }
  if (v5[32])
    -[C2MPNetworkEvent setOptionsDiscretionaryNetworkBehavior:](self, "setOptionsDiscretionaryNetworkBehavior:");
  if (v5[33])
    -[C2MPNetworkEvent setOptionsDuetPreClearedMode:](self, "setOptionsDuetPreClearedMode:");
  if ((*((_BYTE *)v5 + 319) & 2) != 0)
  {
    self->_optionsAllowCellularAccess = *((_BYTE *)v5 + 306);
    *(_DWORD *)&self->_has |= 0x2000000u;
  }

}

- (unint64_t)triggers
{
  return self->_triggers;
}

- (unint64_t)reportFrequency
{
  return self->_reportFrequency;
}

- (unint64_t)reportFrequencyBase
{
  return self->_reportFrequencyBase;
}

- (NSString)networkTaskDescription
{
  return self->_networkTaskDescription;
}

- (NSString)networkHostname
{
  return self->_networkHostname;
}

- (NSString)networkRemoteAddresssAndPort
{
  return self->_networkRemoteAddresssAndPort;
}

- (NSString)networkConnectionUuid
{
  return self->_networkConnectionUuid;
}

- (BOOL)networkConnectionReused
{
  return self->_networkConnectionReused;
}

- (NSString)networkInterfaceIdentifier
{
  return self->_networkInterfaceIdentifier;
}

- (NSString)networkProtocolName
{
  return self->_networkProtocolName;
}

- (unsigned)networkRequestHeaderSize
{
  return self->_networkRequestHeaderSize;
}

- (unint64_t)networkRequestBodyBytesSent
{
  return self->_networkRequestBodyBytesSent;
}

- (unsigned)networkResponseHeaderSize
{
  return self->_networkResponseHeaderSize;
}

- (unint64_t)networkResponseBodyBytesReceived
{
  return self->_networkResponseBodyBytesReceived;
}

- (unsigned)networkPreviousAttemptCount
{
  return self->_networkPreviousAttemptCount;
}

- (C2MPError)networkFatalError
{
  return self->_networkFatalError;
}

- (void)setNetworkFatalError:(id)a3
{
  objc_storeStrong((id *)&self->_networkFatalError, a3);
}

- (unint64_t)networkStatusCode
{
  return self->_networkStatusCode;
}

- (NSString)networkRequestUri
{
  return self->_networkRequestUri;
}

- (BOOL)networkIsDiscretionary
{
  return self->_networkIsDiscretionary;
}

- (NSString)networkNegotiatedTlsProtocolVersion
{
  return self->_networkNegotiatedTlsProtocolVersion;
}

- (NSMutableArray)networkPathInfos
{
  return self->_networkPathInfos;
}

- (void)setNetworkPathInfos:(id)a3
{
  objc_storeStrong((id *)&self->_networkPathInfos, a3);
}

- (unint64_t)timestampC2Init
{
  return self->_timestampC2Init;
}

- (unint64_t)timestampC2Start
{
  return self->_timestampC2Start;
}

- (unint64_t)timestampC2Now
{
  return self->_timestampC2Now;
}

- (unint64_t)timestampDnsStart
{
  return self->_timestampDnsStart;
}

- (unint64_t)timestampDnsEnd
{
  return self->_timestampDnsEnd;
}

- (unint64_t)timestampTcpStart
{
  return self->_timestampTcpStart;
}

- (unint64_t)timestampTcpEnd
{
  return self->_timestampTcpEnd;
}

- (unint64_t)timestampSslStart
{
  return self->_timestampSslStart;
}

- (unint64_t)timestampRequestStart
{
  return self->_timestampRequestStart;
}

- (unint64_t)timestampRequestEnd
{
  return self->_timestampRequestEnd;
}

- (unint64_t)timestampResponseStart
{
  return self->_timestampResponseStart;
}

- (unint64_t)timestampResponseEnd
{
  return self->_timestampResponseEnd;
}

- (NSString)optionsQualityOfService
{
  return self->_optionsQualityOfService;
}

- (BOOL)optionsOutOfProcess
{
  return self->_optionsOutOfProcess;
}

- (BOOL)optionsOutOfProcessForceDiscretionary
{
  return self->_optionsOutOfProcessForceDiscretionary;
}

- (BOOL)optionsAllowExpensiveAccess
{
  return self->_optionsAllowExpensiveAccess;
}

- (BOOL)optionsAllowPowerNapScheduling
{
  return self->_optionsAllowPowerNapScheduling;
}

- (unsigned)optionsTimeoutIntervalForRequest
{
  return self->_optionsTimeoutIntervalForRequest;
}

- (unsigned)optionsTimeoutIntervalForResource
{
  return self->_optionsTimeoutIntervalForResource;
}

- (NSString)optionsSourceApplicationBundleIdentifier
{
  return self->_optionsSourceApplicationBundleIdentifier;
}

- (NSString)optionsSourceApplicationSecondaryIdentifier
{
  return self->_optionsSourceApplicationSecondaryIdentifier;
}

- (BOOL)optionsAppleIdContext
{
  return self->_optionsAppleIdContext;
}

- (BOOL)optionsTlsPinningRequired
{
  return self->_optionsTlsPinningRequired;
}

- (NSString)optionsDiscretionaryNetworkBehavior
{
  return self->_optionsDiscretionaryNetworkBehavior;
}

- (NSString)optionsDuetPreClearedMode
{
  return self->_optionsDuetPreClearedMode;
}

- (BOOL)optionsAllowCellularAccess
{
  return self->_optionsAllowCellularAccess;
}

@end
