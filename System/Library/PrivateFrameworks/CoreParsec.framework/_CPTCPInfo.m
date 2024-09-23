@implementation _CPTCPInfo

- (BOOL)readFrom:(id)a3
{
  return _CPTCPInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_CPTCPInfo avgRTT](self, "avgRTT"))
    PBDataWriterWriteUint32Field();
  if (-[_CPTCPInfo cellRXPackets](self, "cellRXPackets"))
    PBDataWriterWriteUint64Field();
  if (-[_CPTCPInfo cellTXPackets](self, "cellTXPackets"))
    PBDataWriterWriteUint64Field();
  if (-[_CPTCPInfo connectAttempts](self, "connectAttempts"))
    PBDataWriterWriteUint32Field();
  if (-[_CPTCPInfo connectSuccesses](self, "connectSuccesses"))
    PBDataWriterWriteUint32Field();
  if (-[_CPTCPInfo minRTT](self, "minRTT"))
    PBDataWriterWriteUint32Field();
  if (-[_CPTCPInfo rxBytes](self, "rxBytes"))
    PBDataWriterWriteUint64Field();
  if (-[_CPTCPInfo rxDuplicateBytes](self, "rxDuplicateBytes"))
    PBDataWriterWriteUint64Field();
  if (-[_CPTCPInfo rxOutOfOrderBytes](self, "rxOutOfOrderBytes"))
    PBDataWriterWriteUint64Field();
  if (-[_CPTCPInfo rxPackets](self, "rxPackets"))
    PBDataWriterWriteUint64Field();
  if (-[_CPTCPInfo txBytes](self, "txBytes"))
    PBDataWriterWriteUint64Field();
  if (-[_CPTCPInfo txPackets](self, "txPackets"))
    PBDataWriterWriteUint64Field();
  if (-[_CPTCPInfo txRetransmitPackets](self, "txRetransmitPackets"))
    PBDataWriterWriteUint64Field();
  if (-[_CPTCPInfo varRTT](self, "varRTT"))
    PBDataWriterWriteUint32Field();
  if (-[_CPTCPInfo wifiRXPackets](self, "wifiRXPackets"))
    PBDataWriterWriteUint64Field();
  if (-[_CPTCPInfo wifiTXPackets](self, "wifiTXPackets"))
    PBDataWriterWriteUint64Field();
  if (-[_CPTCPInfo wiredRXPackets](self, "wiredRXPackets"))
    PBDataWriterWriteUint64Field();
  if (-[_CPTCPInfo wiredTXPackets](self, "wiredTXPackets"))
    PBDataWriterWriteUint64Field();
  -[_CPTCPInfo statsType](self, "statsType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  v5 = -[_CPTCPInfo txRetransmitBytes](self, "txRetransmitBytes");
  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteUint64Field();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned int avgRTT;
  unint64_t cellRXPackets;
  unint64_t cellTXPackets;
  unsigned int connectAttempts;
  unsigned int connectSuccesses;
  unsigned int minRTT;
  unint64_t rxBytes;
  unint64_t rxDuplicateBytes;
  unint64_t rxOutOfOrderBytes;
  unint64_t rxPackets;
  unint64_t txBytes;
  unint64_t txPackets;
  unint64_t txRetransmitPackets;
  unsigned int varRTT;
  unint64_t wifiRXPackets;
  unint64_t wifiTXPackets;
  unint64_t wiredRXPackets;
  unint64_t wiredTXPackets;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  BOOL v31;
  unint64_t txRetransmitBytes;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    avgRTT = self->_avgRTT;
    if (avgRTT == objc_msgSend(v4, "avgRTT"))
    {
      cellRXPackets = self->_cellRXPackets;
      if (cellRXPackets == objc_msgSend(v4, "cellRXPackets"))
      {
        cellTXPackets = self->_cellTXPackets;
        if (cellTXPackets == objc_msgSend(v4, "cellTXPackets"))
        {
          connectAttempts = self->_connectAttempts;
          if (connectAttempts == objc_msgSend(v4, "connectAttempts"))
          {
            connectSuccesses = self->_connectSuccesses;
            if (connectSuccesses == objc_msgSend(v4, "connectSuccesses"))
            {
              minRTT = self->_minRTT;
              if (minRTT == objc_msgSend(v4, "minRTT"))
              {
                rxBytes = self->_rxBytes;
                if (rxBytes == objc_msgSend(v4, "rxBytes"))
                {
                  rxDuplicateBytes = self->_rxDuplicateBytes;
                  if (rxDuplicateBytes == objc_msgSend(v4, "rxDuplicateBytes"))
                  {
                    rxOutOfOrderBytes = self->_rxOutOfOrderBytes;
                    if (rxOutOfOrderBytes == objc_msgSend(v4, "rxOutOfOrderBytes"))
                    {
                      rxPackets = self->_rxPackets;
                      if (rxPackets == objc_msgSend(v4, "rxPackets"))
                      {
                        txBytes = self->_txBytes;
                        if (txBytes == objc_msgSend(v4, "txBytes"))
                        {
                          txPackets = self->_txPackets;
                          if (txPackets == objc_msgSend(v4, "txPackets"))
                          {
                            txRetransmitPackets = self->_txRetransmitPackets;
                            if (txRetransmitPackets == objc_msgSend(v4, "txRetransmitPackets"))
                            {
                              varRTT = self->_varRTT;
                              if (varRTT == objc_msgSend(v4, "varRTT"))
                              {
                                wifiRXPackets = self->_wifiRXPackets;
                                if (wifiRXPackets == objc_msgSend(v4, "wifiRXPackets"))
                                {
                                  wifiTXPackets = self->_wifiTXPackets;
                                  if (wifiTXPackets == objc_msgSend(v4, "wifiTXPackets"))
                                  {
                                    wiredRXPackets = self->_wiredRXPackets;
                                    if (wiredRXPackets == objc_msgSend(v4, "wiredRXPackets"))
                                    {
                                      wiredTXPackets = self->_wiredTXPackets;
                                      if (wiredTXPackets == objc_msgSend(v4, "wiredTXPackets"))
                                      {
                                        -[_CPTCPInfo statsType](self, "statsType");
                                        v23 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_msgSend(v4, "statsType");
                                        v24 = (void *)objc_claimAutoreleasedReturnValue();
                                        v25 = v24;
                                        if ((v23 == 0) != (v24 != 0))
                                        {
                                          -[_CPTCPInfo statsType](self, "statsType");
                                          v26 = objc_claimAutoreleasedReturnValue();
                                          if (!v26)
                                          {

LABEL_28:
                                            txRetransmitBytes = self->_txRetransmitBytes;
                                            v31 = txRetransmitBytes == objc_msgSend(v4, "txRetransmitBytes");
                                            goto LABEL_26;
                                          }
                                          v27 = (void *)v26;
                                          -[_CPTCPInfo statsType](self, "statsType");
                                          v28 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v4, "statsType");
                                          v29 = (void *)objc_claimAutoreleasedReturnValue();
                                          v30 = objc_msgSend(v28, "isEqual:", v29);

                                          if (v30)
                                            goto LABEL_28;
                                        }
                                        else
                                        {

                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v31 = 0;
LABEL_26:

  return v31;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;

  v2 = (2654435761u * self->_cellRXPackets) ^ (2654435761 * self->_avgRTT) ^ (2654435761u * self->_cellTXPackets) ^ (2654435761 * self->_connectAttempts) ^ (2654435761 * self->_connectSuccesses) ^ (2654435761 * self->_minRTT) ^ (2654435761u * self->_rxBytes) ^ (2654435761u * self->_rxDuplicateBytes) ^ (2654435761u * self->_rxOutOfOrderBytes) ^ (2654435761u * self->_rxPackets) ^ (2654435761u * self->_txBytes) ^ (2654435761u * self->_txPackets) ^ (2654435761u * self->_txRetransmitPackets) ^ (2654435761 * self->_varRTT) ^ (2654435761u * self->_wifiRXPackets) ^ (2654435761u * self->_wifiTXPackets) ^ (2654435761u * self->_wiredRXPackets);
  v3 = 2654435761u * self->_wiredTXPackets;
  return v2 ^ v3 ^ -[NSString hash](self->_statsType, "hash") ^ (2654435761u * self->_txRetransmitBytes);
}

- (unsigned)avgRTT
{
  return self->_avgRTT;
}

- (void)setAvgRTT:(unsigned int)a3
{
  self->_avgRTT = a3;
}

- (unint64_t)cellRXPackets
{
  return self->_cellRXPackets;
}

- (void)setCellRXPackets:(unint64_t)a3
{
  self->_cellRXPackets = a3;
}

- (unint64_t)cellTXPackets
{
  return self->_cellTXPackets;
}

- (void)setCellTXPackets:(unint64_t)a3
{
  self->_cellTXPackets = a3;
}

- (unsigned)connectAttempts
{
  return self->_connectAttempts;
}

- (void)setConnectAttempts:(unsigned int)a3
{
  self->_connectAttempts = a3;
}

- (unsigned)connectSuccesses
{
  return self->_connectSuccesses;
}

- (void)setConnectSuccesses:(unsigned int)a3
{
  self->_connectSuccesses = a3;
}

- (unsigned)minRTT
{
  return self->_minRTT;
}

- (void)setMinRTT:(unsigned int)a3
{
  self->_minRTT = a3;
}

- (unint64_t)rxBytes
{
  return self->_rxBytes;
}

- (void)setRxBytes:(unint64_t)a3
{
  self->_rxBytes = a3;
}

- (unint64_t)rxDuplicateBytes
{
  return self->_rxDuplicateBytes;
}

- (void)setRxDuplicateBytes:(unint64_t)a3
{
  self->_rxDuplicateBytes = a3;
}

- (unint64_t)rxOutOfOrderBytes
{
  return self->_rxOutOfOrderBytes;
}

- (void)setRxOutOfOrderBytes:(unint64_t)a3
{
  self->_rxOutOfOrderBytes = a3;
}

- (unint64_t)rxPackets
{
  return self->_rxPackets;
}

- (void)setRxPackets:(unint64_t)a3
{
  self->_rxPackets = a3;
}

- (unint64_t)txBytes
{
  return self->_txBytes;
}

- (void)setTxBytes:(unint64_t)a3
{
  self->_txBytes = a3;
}

- (unint64_t)txPackets
{
  return self->_txPackets;
}

- (void)setTxPackets:(unint64_t)a3
{
  self->_txPackets = a3;
}

- (unint64_t)txRetransmitPackets
{
  return self->_txRetransmitPackets;
}

- (void)setTxRetransmitPackets:(unint64_t)a3
{
  self->_txRetransmitPackets = a3;
}

- (unsigned)varRTT
{
  return self->_varRTT;
}

- (void)setVarRTT:(unsigned int)a3
{
  self->_varRTT = a3;
}

- (unint64_t)wifiRXPackets
{
  return self->_wifiRXPackets;
}

- (void)setWifiRXPackets:(unint64_t)a3
{
  self->_wifiRXPackets = a3;
}

- (unint64_t)wifiTXPackets
{
  return self->_wifiTXPackets;
}

- (void)setWifiTXPackets:(unint64_t)a3
{
  self->_wifiTXPackets = a3;
}

- (unint64_t)wiredRXPackets
{
  return self->_wiredRXPackets;
}

- (void)setWiredRXPackets:(unint64_t)a3
{
  self->_wiredRXPackets = a3;
}

- (unint64_t)wiredTXPackets
{
  return self->_wiredTXPackets;
}

- (void)setWiredTXPackets:(unint64_t)a3
{
  self->_wiredTXPackets = a3;
}

- (NSString)statsType
{
  return self->_statsType;
}

- (void)setStatsType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (unint64_t)txRetransmitBytes
{
  return self->_txRetransmitBytes;
}

- (void)setTxRetransmitBytes:(unint64_t)a3
{
  self->_txRetransmitBytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statsType, 0);
}

- (_CPTCPInfo)initWithTelemetryDictionary:(id)a3
{
  id v4;
  _CPTCPInfo *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  int v12;
  void *v13;
  uint64_t v14;
  _CPTCPInfo *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_CPTCPInfo init](self, "init");
  if (v5)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v11, "compare:options:", CFSTR("timing_data_key_unknown"), 3))
          {
            if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataConnectionReused"), 3))
            {
              if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataConnectionPeerAddress"), 3))
              {
                v12 = 3;
                if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataConnectionInterfaceIdentifier"), 3))
                {
                  if (objc_msgSend(v11, "compare:options:", CFSTR("omit"), 3))
                  {
                    if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataConnectionStartTimeCounts"), 3))
                    {
                      if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataConnectionStopTimeCounts"), 3))
                      {
                        if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatRXPackets"), 3))
                        {
                          if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatRXBytes"), 3))
                          {
                            if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatTXPackets"), 3))
                            {
                              if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatTXBytes"), 3))
                              {
                                if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatRXDuplicateBytes"), 3))
                                {
                                  if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatRXOutOfOrderBytes"), 3))
                                  {
                                    if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatTXRetransmit"), 3))
                                    {
                                      if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatConnectAttempts"), 3))
                                      {
                                        if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatConnectSuccesses"), 3))
                                        {
                                          if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatMinRTT"), 3))
                                          {
                                            if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatAvgRTT"), 3))
                                            {
                                              if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatVarRTT"), 3))
                                              {
                                                if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatCellRXPackets"), 3))
                                                {
                                                  if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatCellTXPackets"), 3))
                                                  {
                                                    if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatWifiRXPackets"), 3))
                                                    {
                                                      if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatWifiTXPackets"), 3))
                                                      {
                                                        if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatWiredRXPackets"), 3))
                                                        {
                                                          if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNStatWiredTXPackets"), 3))
                                                          {
                                                            if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataTCPFastOpenStats"), 3))
                                                            {
                                                              if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataTCPInfoAtStart"), 3))
                                                              {
                                                                if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataTCPInfoAtStop"), 3))
                                                                {
                                                                  if (objc_msgSend(v11, "compare:options:", CFSTR("omit"), 3))
                                                                  {
                                                                    if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataRemoteAddressAndPort"), 3))
                                                                    {
                                                                      if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataNetworkProtocolName"), 3))
                                                                      {
                                                                        if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataConnectionRace"), 3))
                                                                        {
                                                                          if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataQUICWhitelistedDomain"), 3))
                                                                          {
                                                                            if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataRequestHeaderSize"), 3))
                                                                            {
                                                                              if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataResponseHeaderSize"), 3))
                                                                              {
                                                                                if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataResponseBodyBytesReceived"), 3))
                                                                                {
                                                                                  if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataResponseBodyBytesDecoded"), 3))
                                                                                  {
                                                                                    if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataFetchStart"), 3))
                                                                                    {
                                                                                      if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataDomainLookupStart"), 3))
                                                                                      {
                                                                                        if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataDomainLookupEnd"), 3))
                                                                                        {
                                                                                          if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataConnectStart"), 3))
                                                                                          {
                                                                                            if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataSecureConnectionStart"), 3))
                                                                                            {
                                                                                              if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataConnectEnd"), 3))
                                                                                              {
                                                                                                if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataRequestStart"), 3))
                                                                                                {
                                                                                                  if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataRequestEnd"), 3))
                                                                                                  {
                                                                                                    if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataResponseStart"), 3))
                                                                                                    {
                                                                                                      if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataResponseEnd"), 3))
                                                                                                      {
                                                                                                        if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataRedirectStart"), 3))
                                                                                                        {
                                                                                                          if (objc_msgSend(v11, "compare:options:", CFSTR("_kCFNTimingDataRedirectEnd"), 3))
                                                                                                            v12 = 0;
                                                                                                          else
                                                                                                            v12 = 48;
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          v12 = 47;
                                                                                                        }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v12 = 46;
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v12 = 45;
                                                                                                    }
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    v12 = 44;
                                                                                                  }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  v12 = 43;
                                                                                                }
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                v12 = 42;
                                                                                              }
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              v12 = 41;
                                                                                            }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            v12 = 40;
                                                                                          }
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          v12 = 39;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v12 = 38;
                                                                                      }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      v12 = 37;
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    v12 = 36;
                                                                                  }
                                                                                }
                                                                                else
                                                                                {
                                                                                  v12 = 35;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                v12 = 34;
                                                                              }
                                                                            }
                                                                            else
                                                                            {
                                                                              v12 = 33;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            v12 = 32;
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          v12 = 31;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v12 = 30;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      v12 = 29;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    v12 = 28;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  v12 = 27;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v12 = 26;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              v12 = 25;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v12 = 24;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v12 = 23;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v12 = 22;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v12 = 21;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v12 = 20;
                                                  }
                                                }
                                                else
                                                {
                                                  v12 = 19;
                                                }
                                              }
                                              else
                                              {
                                                v12 = 18;
                                              }
                                            }
                                            else
                                            {
                                              v12 = 17;
                                            }
                                          }
                                          else
                                          {
                                            v12 = 16;
                                          }
                                        }
                                        else
                                        {
                                          v12 = 15;
                                        }
                                      }
                                      else
                                      {
                                        v12 = 14;
                                      }
                                    }
                                    else
                                    {
                                      v12 = 13;
                                    }
                                  }
                                  else
                                  {
                                    v12 = 12;
                                  }
                                }
                                else
                                {
                                  v12 = 11;
                                }
                              }
                              else
                              {
                                v12 = 10;
                              }
                            }
                            else
                            {
                              v12 = 9;
                            }
                          }
                          else
                          {
                            v12 = 8;
                          }
                        }
                        else
                        {
                          v12 = 7;
                        }
                      }
                      else
                      {
                        v12 = 6;
                      }
                    }
                    else
                    {
                      v12 = 5;
                    }
                  }
                  else
                  {
                    v12 = 4;
                  }
                }
              }
              else
              {
                v12 = 2;
              }
            }
            else
            {
              v12 = 1;
            }
          }
          else
          {
            v12 = 0;
          }

          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = objc_msgSend(v13, "unsignedIntegerValue");
            switch(v12)
            {
              case 7:
                -[_CPTCPInfo setRxPackets:](v5, "setRxPackets:", v14);
                break;
              case 8:
                -[_CPTCPInfo setRxBytes:](v5, "setRxBytes:", v14);
                break;
              case 9:
                -[_CPTCPInfo setTxPackets:](v5, "setTxPackets:", v14);
                break;
              case 10:
                -[_CPTCPInfo setTxBytes:](v5, "setTxBytes:", v14);
                break;
              case 11:
                -[_CPTCPInfo setRxDuplicateBytes:](v5, "setRxDuplicateBytes:", v14);
                break;
              case 12:
                -[_CPTCPInfo setRxOutOfOrderBytes:](v5, "setRxOutOfOrderBytes:", v14);
                break;
              case 13:
                -[_CPTCPInfo setTxRetransmitPackets:](v5, "setTxRetransmitPackets:", v14);
                break;
              case 14:
                -[_CPTCPInfo setConnectAttempts:](v5, "setConnectAttempts:", v14);
                break;
              case 15:
                -[_CPTCPInfo setConnectSuccesses:](v5, "setConnectSuccesses:", v14);
                break;
              case 16:
                -[_CPTCPInfo setMinRTT:](v5, "setMinRTT:", v14);
                break;
              case 17:
                -[_CPTCPInfo setAvgRTT:](v5, "setAvgRTT:", v14);
                break;
              case 18:
                -[_CPTCPInfo setVarRTT:](v5, "setVarRTT:", v14);
                break;
              case 19:
                -[_CPTCPInfo setCellRXPackets:](v5, "setCellRXPackets:", v14);
                break;
              case 20:
                -[_CPTCPInfo setCellTXPackets:](v5, "setCellTXPackets:", v14);
                break;
              case 21:
                -[_CPTCPInfo setWifiRXPackets:](v5, "setWifiRXPackets:", v14);
                break;
              case 22:
                -[_CPTCPInfo setWifiTXPackets:](v5, "setWifiTXPackets:", v14);
                break;
              case 23:
                -[_CPTCPInfo setWiredRXPackets:](v5, "setWiredRXPackets:", v14);
                break;
              case 24:
                -[_CPTCPInfo setWiredTXPackets:](v5, "setWiredTXPackets:", v14);
                break;
              default:
                break;
            }
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    v15 = v5;
    v4 = v17;
  }

  return v5;
}

@end
