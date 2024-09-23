@implementation _CPNetworkTimingData

- (BOOL)readFrom:(id)a3
{
  return _CPNetworkTimingDataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  unsigned int v13;
  void *v14;
  id v15;

  v15 = a3;
  -[_CPNetworkTimingData interfaceIdentifier](self, "interfaceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_CPNetworkTimingData peerAddress](self, "peerAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteDataField();
  if (-[_CPNetworkTimingData connectionRace](self, "connectionRace"))
    PBDataWriterWriteBOOLField();
  if (-[_CPNetworkTimingData connectionReused](self, "connectionReused"))
    PBDataWriterWriteBOOLField();
  -[_CPNetworkTimingData startTimeCounts](self, "startTimeCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_CPNetworkTimingData startTimeCounts](self, "startTimeCounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPNetworkTimingData stopTimeCounts](self, "stopTimeCounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_CPNetworkTimingData stopTimeCounts](self, "stopTimeCounts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPNetworkTimingData connectionUUID](self, "connectionUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  -[_CPNetworkTimingData networkProtocolName](self, "networkProtocolName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  if (-[_CPNetworkTimingData QUICWhitelistedDomain](self, "QUICWhitelistedDomain"))
    PBDataWriterWriteBOOLField();
  if (-[_CPNetworkTimingData redirectCount](self, "redirectCount"))
    PBDataWriterWriteUint32Field();
  if (-[_CPNetworkTimingData redirectCountW3C](self, "redirectCountW3C"))
    PBDataWriterWriteUint32Field();
  if (-[_CPNetworkTimingData requestHeaderSize](self, "requestHeaderSize"))
    PBDataWriterWriteUint32Field();
  if (-[_CPNetworkTimingData responseBodyBytesDecoded](self, "responseBodyBytesDecoded"))
    PBDataWriterWriteUint32Field();
  if (-[_CPNetworkTimingData responseBodyBytesReceived](self, "responseBodyBytesReceived"))
    PBDataWriterWriteUint32Field();
  if (-[_CPNetworkTimingData responseHeaderSize](self, "responseHeaderSize"))
    PBDataWriterWriteUint32Field();
  if (-[_CPNetworkTimingData TFOSuccess](self, "TFOSuccess"))
    PBDataWriterWriteBOOLField();
  -[_CPNetworkTimingData timingDataInit](self, "timingDataInit");
  if (v12 != 0.0)
    PBDataWriterWriteDoubleField();
  if (-[_CPNetworkTimingData connectStart](self, "connectStart"))
    PBDataWriterWriteUint32Field();
  if (-[_CPNetworkTimingData connectEnd](self, "connectEnd"))
    PBDataWriterWriteUint32Field();
  if (-[_CPNetworkTimingData domainLookupStart](self, "domainLookupStart"))
    PBDataWriterWriteUint32Field();
  if (-[_CPNetworkTimingData domainLookupEnd](self, "domainLookupEnd"))
    PBDataWriterWriteUint32Field();
  if (-[_CPNetworkTimingData fetchStart](self, "fetchStart"))
    PBDataWriterWriteUint32Field();
  if (-[_CPNetworkTimingData redirectStart](self, "redirectStart"))
    PBDataWriterWriteUint32Field();
  if (-[_CPNetworkTimingData redirectEnd](self, "redirectEnd"))
    PBDataWriterWriteUint32Field();
  if (-[_CPNetworkTimingData requestStart](self, "requestStart"))
    PBDataWriterWriteUint32Field();
  if (-[_CPNetworkTimingData requestEnd](self, "requestEnd"))
    PBDataWriterWriteUint32Field();
  if (-[_CPNetworkTimingData responseStart](self, "responseStart"))
    PBDataWriterWriteUint32Field();
  if (-[_CPNetworkTimingData responseEnd](self, "responseEnd"))
    PBDataWriterWriteUint32Field();
  v13 = -[_CPNetworkTimingData secureConnectStart](self, "secureConnectStart");
  v14 = v15;
  if (v13)
  {
    PBDataWriterWriteUint32Field();
    v14 = v15;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int connectionRace;
  int connectionReused;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  BOOL v39;
  int QUICWhitelistedDomain;
  unsigned int redirectCount;
  unsigned int redirectCountW3C;
  unsigned int requestHeaderSize;
  unsigned int responseBodyBytesDecoded;
  unsigned int responseBodyBytesReceived;
  unsigned int responseHeaderSize;
  int TFOSuccess;
  double timingDataInit;
  double v50;
  unsigned int connectStart;
  unsigned int connectEnd;
  unsigned int domainLookupStart;
  unsigned int domainLookupEnd;
  unsigned int fetchStart;
  unsigned int redirectStart;
  unsigned int redirectEnd;
  unsigned int requestStart;
  unsigned int requestEnd;
  unsigned int responseStart;
  unsigned int responseEnd;
  unsigned int secureConnectStart;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  -[_CPNetworkTimingData interfaceIdentifier](self, "interfaceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interfaceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[_CPNetworkTimingData interfaceIdentifier](self, "interfaceIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_CPNetworkTimingData interfaceIdentifier](self, "interfaceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interfaceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_34;
  }
  else
  {

  }
  -[_CPNetworkTimingData peerAddress](self, "peerAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peerAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[_CPNetworkTimingData peerAddress](self, "peerAddress");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_CPNetworkTimingData peerAddress](self, "peerAddress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "peerAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_34;
  }
  else
  {

  }
  connectionRace = self->_connectionRace;
  if (connectionRace != objc_msgSend(v4, "connectionRace"))
    goto LABEL_34;
  connectionReused = self->_connectionReused;
  if (connectionReused != objc_msgSend(v4, "connectionReused"))
    goto LABEL_34;
  -[_CPNetworkTimingData startTimeCounts](self, "startTimeCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startTimeCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[_CPNetworkTimingData startTimeCounts](self, "startTimeCounts");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_CPNetworkTimingData startTimeCounts](self, "startTimeCounts");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startTimeCounts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_34;
  }
  else
  {

  }
  -[_CPNetworkTimingData stopTimeCounts](self, "stopTimeCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopTimeCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[_CPNetworkTimingData stopTimeCounts](self, "stopTimeCounts");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_CPNetworkTimingData stopTimeCounts](self, "stopTimeCounts");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopTimeCounts");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_34;
  }
  else
  {

  }
  -[_CPNetworkTimingData connectionUUID](self, "connectionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[_CPNetworkTimingData connectionUUID](self, "connectionUUID");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[_CPNetworkTimingData connectionUUID](self, "connectionUUID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connectionUUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_34;
  }
  else
  {

  }
  -[_CPNetworkTimingData networkProtocolName](self, "networkProtocolName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkProtocolName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_33:

    goto LABEL_34;
  }
  -[_CPNetworkTimingData networkProtocolName](self, "networkProtocolName");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[_CPNetworkTimingData networkProtocolName](self, "networkProtocolName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "networkProtocolName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_34;
  }
  else
  {

  }
  QUICWhitelistedDomain = self->_QUICWhitelistedDomain;
  if (QUICWhitelistedDomain == objc_msgSend(v4, "QUICWhitelistedDomain"))
  {
    redirectCount = self->_redirectCount;
    if (redirectCount == objc_msgSend(v4, "redirectCount"))
    {
      redirectCountW3C = self->_redirectCountW3C;
      if (redirectCountW3C == objc_msgSend(v4, "redirectCountW3C"))
      {
        requestHeaderSize = self->_requestHeaderSize;
        if (requestHeaderSize == objc_msgSend(v4, "requestHeaderSize"))
        {
          responseBodyBytesDecoded = self->_responseBodyBytesDecoded;
          if (responseBodyBytesDecoded == objc_msgSend(v4, "responseBodyBytesDecoded"))
          {
            responseBodyBytesReceived = self->_responseBodyBytesReceived;
            if (responseBodyBytesReceived == objc_msgSend(v4, "responseBodyBytesReceived"))
            {
              responseHeaderSize = self->_responseHeaderSize;
              if (responseHeaderSize == objc_msgSend(v4, "responseHeaderSize"))
              {
                TFOSuccess = self->_TFOSuccess;
                if (TFOSuccess == objc_msgSend(v4, "TFOSuccess"))
                {
                  timingDataInit = self->_timingDataInit;
                  objc_msgSend(v4, "timingDataInit");
                  if (timingDataInit == v50)
                  {
                    connectStart = self->_connectStart;
                    if (connectStart == objc_msgSend(v4, "connectStart"))
                    {
                      connectEnd = self->_connectEnd;
                      if (connectEnd == objc_msgSend(v4, "connectEnd"))
                      {
                        domainLookupStart = self->_domainLookupStart;
                        if (domainLookupStart == objc_msgSend(v4, "domainLookupStart"))
                        {
                          domainLookupEnd = self->_domainLookupEnd;
                          if (domainLookupEnd == objc_msgSend(v4, "domainLookupEnd"))
                          {
                            fetchStart = self->_fetchStart;
                            if (fetchStart == objc_msgSend(v4, "fetchStart"))
                            {
                              redirectStart = self->_redirectStart;
                              if (redirectStart == objc_msgSend(v4, "redirectStart"))
                              {
                                redirectEnd = self->_redirectEnd;
                                if (redirectEnd == objc_msgSend(v4, "redirectEnd"))
                                {
                                  requestStart = self->_requestStart;
                                  if (requestStart == objc_msgSend(v4, "requestStart"))
                                  {
                                    requestEnd = self->_requestEnd;
                                    if (requestEnd == objc_msgSend(v4, "requestEnd"))
                                    {
                                      responseStart = self->_responseStart;
                                      if (responseStart == objc_msgSend(v4, "responseStart"))
                                      {
                                        responseEnd = self->_responseEnd;
                                        if (responseEnd == objc_msgSend(v4, "responseEnd"))
                                        {
                                          secureConnectStart = self->_secureConnectStart;
                                          v39 = secureConnectStart == objc_msgSend(v4, "secureConnectStart");
                                          goto LABEL_35;
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
LABEL_34:
  v39 = 0;
LABEL_35:

  return v39;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  double timingDataInit;
  uint64_t v11;
  double v12;
  long double v13;

  v3 = -[NSString hash](self->_interfaceIdentifier, "hash");
  v4 = -[NSData hash](self->_peerAddress, "hash") ^ v3 ^ (2654435761 * self->_connectionRace);
  v5 = 2654435761 * self->_connectionReused;
  v6 = v4 ^ v5 ^ -[_CPTCPInfo hash](self->_startTimeCounts, "hash");
  v7 = -[_CPTCPInfo hash](self->_stopTimeCounts, "hash");
  v8 = v7 ^ -[NSString hash](self->_connectionUUID, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_networkProtocolName, "hash") ^ (2654435761 * self->_QUICWhitelistedDomain) ^ (2654435761 * self->_redirectCount) ^ (2654435761 * self->_redirectCountW3C) ^ (2654435761 * self->_requestHeaderSize) ^ (2654435761 * self->_responseBodyBytesDecoded) ^ (2654435761 * self->_responseBodyBytesReceived);
  timingDataInit = self->_timingDataInit;
  v12 = -timingDataInit;
  if (timingDataInit >= 0.0)
    v12 = self->_timingDataInit;
  v13 = round(v12);
  v11 = (2654435761 * self->_responseHeaderSize) ^ (2654435761 * self->_TFOSuccess);
  return v9 ^ v11 ^ (2654435761 * self->_connectStart) ^ (2654435761 * self->_connectEnd) ^ (2654435761
                                                                                               * self->_domainLookupStart) ^ (2654435761 * self->_domainLookupEnd) ^ (2654435761 * self->_fetchStart) ^ (2654435761 * self->_redirectStart) ^ (2654435761 * self->_redirectEnd) ^ (2654435761 * self->_requestStart) ^ (2654435761 * self->_requestEnd) ^ (2654435761 * self->_responseStart) ^ (2654435761 * self->_responseEnd) ^ (2654435761 * self->_secureConnectStart) ^ ((unint64_t)(fmod(v13, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v12 - v13, 0x40uLL));
}

- (NSString)interfaceIdentifier
{
  return self->_interfaceIdentifier;
}

- (void)setInterfaceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)peerAddress
{
  return self->_peerAddress;
}

- (void)setPeerAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)connectionRace
{
  return self->_connectionRace;
}

- (void)setConnectionRace:(BOOL)a3
{
  self->_connectionRace = a3;
}

- (BOOL)connectionReused
{
  return self->_connectionReused;
}

- (void)setConnectionReused:(BOOL)a3
{
  self->_connectionReused = a3;
}

- (_CPTCPInfo)startTimeCounts
{
  return self->_startTimeCounts;
}

- (void)setStartTimeCounts:(id)a3
{
  objc_storeStrong((id *)&self->_startTimeCounts, a3);
}

- (_CPTCPInfo)stopTimeCounts
{
  return self->_stopTimeCounts;
}

- (void)setStopTimeCounts:(id)a3
{
  objc_storeStrong((id *)&self->_stopTimeCounts, a3);
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)networkProtocolName
{
  return self->_networkProtocolName;
}

- (void)setNetworkProtocolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)QUICWhitelistedDomain
{
  return self->_QUICWhitelistedDomain;
}

- (void)setQUICWhitelistedDomain:(BOOL)a3
{
  self->_QUICWhitelistedDomain = a3;
}

- (unsigned)redirectCount
{
  return self->_redirectCount;
}

- (void)setRedirectCount:(unsigned int)a3
{
  self->_redirectCount = a3;
}

- (unsigned)redirectCountW3C
{
  return self->_redirectCountW3C;
}

- (void)setRedirectCountW3C:(unsigned int)a3
{
  self->_redirectCountW3C = a3;
}

- (unsigned)requestHeaderSize
{
  return self->_requestHeaderSize;
}

- (void)setRequestHeaderSize:(unsigned int)a3
{
  self->_requestHeaderSize = a3;
}

- (unsigned)responseBodyBytesDecoded
{
  return self->_responseBodyBytesDecoded;
}

- (void)setResponseBodyBytesDecoded:(unsigned int)a3
{
  self->_responseBodyBytesDecoded = a3;
}

- (unsigned)responseBodyBytesReceived
{
  return self->_responseBodyBytesReceived;
}

- (void)setResponseBodyBytesReceived:(unsigned int)a3
{
  self->_responseBodyBytesReceived = a3;
}

- (unsigned)responseHeaderSize
{
  return self->_responseHeaderSize;
}

- (void)setResponseHeaderSize:(unsigned int)a3
{
  self->_responseHeaderSize = a3;
}

- (BOOL)TFOSuccess
{
  return self->_TFOSuccess;
}

- (void)setTFOSuccess:(BOOL)a3
{
  self->_TFOSuccess = a3;
}

- (double)timingDataInit
{
  return self->_timingDataInit;
}

- (void)setTimingDataInit:(double)a3
{
  self->_timingDataInit = a3;
}

- (unsigned)connectStart
{
  return self->_connectStart;
}

- (void)setConnectStart:(unsigned int)a3
{
  self->_connectStart = a3;
}

- (unsigned)connectEnd
{
  return self->_connectEnd;
}

- (void)setConnectEnd:(unsigned int)a3
{
  self->_connectEnd = a3;
}

- (unsigned)domainLookupStart
{
  return self->_domainLookupStart;
}

- (void)setDomainLookupStart:(unsigned int)a3
{
  self->_domainLookupStart = a3;
}

- (unsigned)domainLookupEnd
{
  return self->_domainLookupEnd;
}

- (void)setDomainLookupEnd:(unsigned int)a3
{
  self->_domainLookupEnd = a3;
}

- (unsigned)fetchStart
{
  return self->_fetchStart;
}

- (void)setFetchStart:(unsigned int)a3
{
  self->_fetchStart = a3;
}

- (unsigned)redirectStart
{
  return self->_redirectStart;
}

- (void)setRedirectStart:(unsigned int)a3
{
  self->_redirectStart = a3;
}

- (unsigned)redirectEnd
{
  return self->_redirectEnd;
}

- (void)setRedirectEnd:(unsigned int)a3
{
  self->_redirectEnd = a3;
}

- (unsigned)requestStart
{
  return self->_requestStart;
}

- (void)setRequestStart:(unsigned int)a3
{
  self->_requestStart = a3;
}

- (unsigned)requestEnd
{
  return self->_requestEnd;
}

- (void)setRequestEnd:(unsigned int)a3
{
  self->_requestEnd = a3;
}

- (unsigned)responseStart
{
  return self->_responseStart;
}

- (void)setResponseStart:(unsigned int)a3
{
  self->_responseStart = a3;
}

- (unsigned)responseEnd
{
  return self->_responseEnd;
}

- (void)setResponseEnd:(unsigned int)a3
{
  self->_responseEnd = a3;
}

- (unsigned)secureConnectStart
{
  return self->_secureConnectStart;
}

- (void)setSecureConnectStart:(unsigned int)a3
{
  self->_secureConnectStart = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkProtocolName, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_stopTimeCounts, 0);
  objc_storeStrong((id *)&self->_startTimeCounts, 0);
  objc_storeStrong((id *)&self->_peerAddress, 0);
  objc_storeStrong((id *)&self->_interfaceIdentifier, 0);
}

- (_CPNetworkTimingData)initWithTelemetryDictionary:(id)a3
{
  id v4;
  _CPNetworkTimingData *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  id v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  int v24;
  void *v25;
  char isKindOfClass;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  double v34;
  unsigned int v35;
  uint64_t v36;
  double v37;
  unsigned int v38;
  uint64_t v39;
  double v40;
  unsigned int v41;
  uint64_t v42;
  double v43;
  unsigned int v44;
  uint64_t v45;
  _CPTCPInfo *v46;
  double v47;
  unsigned int v48;
  uint64_t v49;
  double v50;
  unsigned int v51;
  uint64_t v52;
  double v53;
  unsigned int v54;
  uint64_t v55;
  double v56;
  unsigned int v57;
  uint64_t v58;
  double v59;
  unsigned int v60;
  uint64_t v61;
  double v62;
  unsigned int v63;
  uint64_t v64;
  double v65;
  unsigned int v66;
  uint64_t v67;
  double v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  _CPNetworkTimingData *v72;
  id v74;
  void *v75;
  _CPNetworkTimingData *v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  id v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_CPNetworkTimingData init](self, "init");
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "startMetricsForNormalization");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
    v76 = v5;
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v83;
      v10 = 1.79769313e308;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v83 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v4, "parsec_numberForKey:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "doubleValue");
          v14 = v13;

          if (v14 < v10 && v14 != 0.0)
            v10 = v14;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 1.79769313e308;
    }
    v74 = v4;
    v75 = v6;
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v16 = v4;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
    if (v17)
    {
      v18 = v17;
      v19 = CFSTR("timing_data_key_unknown");
      v20 = CFSTR("_kCFNTimingDataConnectionReused");
      v21 = *(_QWORD *)v79;
      v77 = *(_QWORD *)v79;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v79 != v21)
            objc_enumerationMutation(v16);
          v23 = *(id *)(*((_QWORD *)&v78 + 1) + 8 * v22);
          if (!objc_msgSend(v23, "compare:options:", v19, 3))
          {
LABEL_70:

            goto LABEL_152;
          }
          if (objc_msgSend(v23, "compare:options:", v20, 3))
          {
            if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataConnectionPeerAddress"), 3))
            {
              v24 = 3;
              if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataConnectionInterfaceIdentifier"), 3))
              {
                if (objc_msgSend(v23, "compare:options:", CFSTR("omit"), 3))
                {
                  if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataConnectionStartTimeCounts"), 3))
                  {
                    if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataConnectionStopTimeCounts"), 3))
                    {
                      if (!objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatRXPackets"), 3)
                        || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatRXBytes"), 3)
                        || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatTXPackets"), 3)
                        || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatTXBytes"), 3)
                        || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatRXDuplicateBytes"), 3)
                        || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatRXOutOfOrderBytes"), 3)
                        || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatTXRetransmit"), 3)
                        || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatConnectAttempts"), 3)
                        || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatConnectSuccesses"), 3)
                        || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatMinRTT"), 3)
                        || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatAvgRTT"), 3)
                        || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatVarRTT"), 3)
                        || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatCellRXPackets"), 3)
                        || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatCellTXPackets"), 3)
                        || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatWifiRXPackets"), 3)
                        || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatWifiTXPackets"), 3)
                        || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatWiredRXPackets"), 3)
                        || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNStatWiredTXPackets"), 3))
                      {
                        goto LABEL_70;
                      }
                      if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataTCPFastOpenStats"), 3))
                      {
                        if (!objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataTCPInfoAtStart"), 3)
                          || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataTCPInfoAtStop"), 3)
                          || !objc_msgSend(v23, "compare:options:", CFSTR("omit"), 3)
                          || !objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataRemoteAddressAndPort"), 3))
                        {
                          goto LABEL_70;
                        }
                        if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataNetworkProtocolName"), 3))
                        {
                          if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataConnectionRace"), 3))
                          {
                            if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataQUICWhitelistedDomain"), 3))
                            {
                              if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataRequestHeaderSize"), 3))
                              {
                                if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataResponseHeaderSize"), 3))
                                {
                                  if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataResponseBodyBytesReceived"), 3))
                                  {
                                    if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataResponseBodyBytesDecoded"), 3))
                                    {
                                      if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataFetchStart"), 3))
                                      {
                                        if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataDomainLookupStart"), 3))
                                        {
                                          if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataDomainLookupEnd"), 3))
                                          {
                                            if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataConnectStart"), 3))
                                            {
                                              if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataSecureConnectionStart"), 3))
                                              {
                                                if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataConnectEnd"), 3))
                                                {
                                                  if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataRequestStart"), 3))
                                                  {
                                                    if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataRequestEnd"), 3))
                                                    {
                                                      if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataResponseStart"), 3))
                                                      {
                                                        if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataResponseEnd"), 3))
                                                        {
                                                          if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataRedirectStart"), 3))
                                                          {
                                                            if (objc_msgSend(v23, "compare:options:", CFSTR("_kCFNTimingDataRedirectEnd"), 3))
                                                            {
                                                              goto LABEL_70;
                                                            }
                                                            v24 = 48;
                                                          }
                                                          else
                                                          {
                                                            v24 = 47;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v24 = 46;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v24 = 45;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v24 = 44;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v24 = 43;
                                                  }
                                                }
                                                else
                                                {
                                                  v24 = 42;
                                                }
                                              }
                                              else
                                              {
                                                v24 = 41;
                                              }
                                            }
                                            else
                                            {
                                              v24 = 40;
                                            }
                                          }
                                          else
                                          {
                                            v24 = 39;
                                          }
                                        }
                                        else
                                        {
                                          v24 = 38;
                                        }
                                      }
                                      else
                                      {
                                        v24 = 37;
                                      }
                                    }
                                    else
                                    {
                                      v24 = 36;
                                    }
                                  }
                                  else
                                  {
                                    v24 = 35;
                                  }
                                }
                                else
                                {
                                  v24 = 34;
                                }
                              }
                              else
                              {
                                v24 = 33;
                              }
                            }
                            else
                            {
                              v24 = 32;
                            }
                          }
                          else
                          {
                            v24 = 31;
                          }
                        }
                        else
                        {
                          v24 = 30;
                        }
                      }
                      else
                      {
                        v24 = 25;
                      }
                    }
                    else
                    {
                      v24 = 6;
                    }
                  }
                  else
                  {
                    v24 = 5;
                  }
                }
                else
                {
                  v24 = 4;
                }
              }
            }
            else
            {
              v24 = 2;
            }
          }
          else
          {
            v24 = 1;
          }

          objc_opt_self();
          if ((id)objc_claimAutoreleasedReturnValue())
          {
            objc_msgSend(v16, "objectForKey:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              v27 = v20;
              v28 = v19;
              objc_msgSend(v16, "parsec_numberForKey:", v23);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "parsec_dictionaryForKey:", v23);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "parsec_stringForKey:", v23);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "parsec_dataForKey:", v23);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              switch(v24)
              {
                case 1:
                  -[_CPNetworkTimingData setConnectionReused:](v76, "setConnectionReused:", objc_msgSend(v29, "BOOLValue"));
                  break;
                case 2:
                  -[_CPNetworkTimingData setPeerAddress:](v76, "setPeerAddress:", v32);
                  break;
                case 3:
                  -[_CPNetworkTimingData setInterfaceIdentifier:](v76, "setInterfaceIdentifier:", v31);
                  break;
                case 4:
                  -[_CPNetworkTimingData setConnectionUUID:](v76, "setConnectionUUID:", v31);
                  break;
                case 5:
                  if (v30)
                  {
                    v46 = -[_CPTCPInfo initWithTelemetryDictionary:]([_CPTCPInfo alloc], "initWithTelemetryDictionary:", v30);
                    -[_CPNetworkTimingData setStartTimeCounts:](v76, "setStartTimeCounts:", v46);
                    goto LABEL_122;
                  }
                  break;
                case 6:
                  if (v30)
                  {
                    v46 = -[_CPTCPInfo initWithTelemetryDictionary:]([_CPTCPInfo alloc], "initWithTelemetryDictionary:", v30);
                    -[_CPNetworkTimingData setStopTimeCounts:](v76, "setStopTimeCounts:", v46);
                    goto LABEL_122;
                  }
                  break;
                case 25:
                  if (v30)
                  {
                    objc_msgSend(v30, "parsec_numberForKey:", CFSTR("TFOSuccess"));
                    v46 = (_CPTCPInfo *)objc_claimAutoreleasedReturnValue();
                    -[_CPNetworkTimingData setTFOSuccess:](v76, "setTFOSuccess:", -[_CPTCPInfo BOOLValue](v46, "BOOLValue"));
LABEL_122:

                  }
                  break;
                case 30:
                  if (objc_msgSend(v31, "length"))
                    -[_CPNetworkTimingData setNetworkProtocolName:](v76, "setNetworkProtocolName:", v31);
                  break;
                case 31:
                  -[_CPNetworkTimingData setConnectionRace:](v76, "setConnectionRace:", objc_msgSend(v29, "BOOLValue"));
                  break;
                case 32:
                  -[_CPNetworkTimingData setQUICWhitelistedDomain:](v76, "setQUICWhitelistedDomain:", objc_msgSend(v29, "BOOLValue"));
                  break;
                case 33:
                  -[_CPNetworkTimingData setRequestHeaderSize:](v76, "setRequestHeaderSize:", objc_msgSend(v29, "unsignedIntegerValue"));
                  break;
                case 34:
                  -[_CPNetworkTimingData setResponseHeaderSize:](v76, "setResponseHeaderSize:", objc_msgSend(v29, "unsignedIntegerValue"));
                  break;
                case 35:
                  -[_CPNetworkTimingData setResponseBodyBytesReceived:](v76, "setResponseBodyBytesReceived:", objc_msgSend(v29, "unsignedIntegerValue"));
                  break;
                case 36:
                  -[_CPNetworkTimingData setResponseBodyBytesDecoded:](v76, "setResponseBodyBytesDecoded:", objc_msgSend(v29, "unsignedIntegerValue"));
                  break;
                case 37:
                  objc_msgSend(v29, "doubleValue");
                  v57 = vcvtad_u64_f64((v56 - v10) * 1000.0);
                  if (v56 <= v10)
                    v58 = 0;
                  else
                    v58 = v57;
                  -[_CPNetworkTimingData setFetchStart:](v76, "setFetchStart:", v58, v74);
                  break;
                case 38:
                  objc_msgSend(v29, "doubleValue");
                  v60 = vcvtad_u64_f64((v59 - v10) * 1000.0);
                  if (v59 <= v10)
                    v61 = 0;
                  else
                    v61 = v60;
                  -[_CPNetworkTimingData setDomainLookupStart:](v76, "setDomainLookupStart:", v61, v74);
                  break;
                case 39:
                  objc_msgSend(v29, "doubleValue");
                  v63 = vcvtad_u64_f64((v62 - v10) * 1000.0);
                  if (v62 <= v10)
                    v64 = 0;
                  else
                    v64 = v63;
                  -[_CPNetworkTimingData setDomainLookupEnd:](v76, "setDomainLookupEnd:", v64, v74);
                  break;
                case 40:
                  objc_msgSend(v29, "doubleValue");
                  v66 = vcvtad_u64_f64((v65 - v10) * 1000.0);
                  if (v65 <= v10)
                    v67 = 0;
                  else
                    v67 = v66;
                  -[_CPNetworkTimingData setConnectStart:](v76, "setConnectStart:", v67, v74);
                  break;
                case 41:
                  objc_msgSend(v29, "doubleValue");
                  v35 = vcvtad_u64_f64((v34 - v10) * 1000.0);
                  if (v34 <= v10)
                    v36 = 0;
                  else
                    v36 = v35;
                  -[_CPNetworkTimingData setSecureConnectStart:](v76, "setSecureConnectStart:", v36, v74);
                  break;
                case 42:
                  objc_msgSend(v29, "doubleValue");
                  v48 = vcvtad_u64_f64((v47 - v10) * 1000.0);
                  if (v47 <= v10)
                    v49 = 0;
                  else
                    v49 = v48;
                  -[_CPNetworkTimingData setConnectEnd:](v76, "setConnectEnd:", v49, v74);
                  break;
                case 43:
                  objc_msgSend(v29, "doubleValue");
                  v69 = vcvtad_u64_f64((v68 - v10) * 1000.0);
                  if (v68 <= v10)
                    v70 = 0;
                  else
                    v70 = v69;
                  -[_CPNetworkTimingData setRequestStart:](v76, "setRequestStart:", v70, v74, v75);
                  break;
                case 44:
                  objc_msgSend(v29, "doubleValue");
                  v38 = vcvtad_u64_f64((v37 - v10) * 1000.0);
                  if (v37 <= v10)
                    v39 = 0;
                  else
                    v39 = v38;
                  -[_CPNetworkTimingData setRequestEnd:](v76, "setRequestEnd:", v39, v74);
                  break;
                case 45:
                  objc_msgSend(v29, "doubleValue");
                  v51 = vcvtad_u64_f64((v50 - v10) * 1000.0);
                  if (v50 <= v10)
                    v52 = 0;
                  else
                    v52 = v51;
                  -[_CPNetworkTimingData setResponseStart:](v76, "setResponseStart:", v52, v74);
                  break;
                case 46:
                  objc_msgSend(v29, "doubleValue");
                  v44 = vcvtad_u64_f64((v43 - v10) * 1000.0);
                  if (v43 <= v10)
                    v45 = 0;
                  else
                    v45 = v44;
                  -[_CPNetworkTimingData setResponseEnd:](v76, "setResponseEnd:", v45, v74);
                  break;
                case 47:
                  objc_msgSend(v29, "doubleValue");
                  v54 = vcvtad_u64_f64((v53 - v10) * 1000.0);
                  if (v53 <= v10)
                    v55 = 0;
                  else
                    v55 = v54;
                  -[_CPNetworkTimingData setRedirectStart:](v76, "setRedirectStart:", v55, v74);
                  break;
                case 48:
                  objc_msgSend(v29, "doubleValue");
                  v41 = vcvtad_u64_f64((v40 - v10) * 1000.0);
                  if (v40 <= v10)
                    v42 = 0;
                  else
                    v42 = v41;
                  -[_CPNetworkTimingData setRedirectEnd:](v76, "setRedirectEnd:", v42, v74);
                  break;
                default:
                  break;
              }

              v19 = v28;
              v20 = v27;
              v21 = v77;
            }
            else
            {
              if (PARLogHandleForCategory_onceToken_1362 != -1)
                dispatch_once(&PARLogHandleForCategory_onceToken_1362, &__block_literal_global_105);
              v33 = PARLogHandleForCategory_logHandles_2_1363;
              if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_1363, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v87 = v23;
                _os_log_error_impl(&dword_19A825000, v33, OS_LOG_TYPE_ERROR, "Got data of unexpected type for metric %@.", buf, 0xCu);
              }
            }
          }
LABEL_152:
          ++v22;
        }
        while (v18 != v22);
        v71 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
        v18 = v71;
      }
      while (v71);
    }

    v5 = v76;
    v72 = v76;

    v4 = v74;
  }

  return v5;
}

+ (id)startMetricsForNormalization
{
  if (startMetricsForNormalization_onceToken != -1)
    dispatch_once(&startMetricsForNormalization_onceToken, &__block_literal_global_1377);
  return (id)startMetricsForNormalization_startMetricNames;
}

@end
