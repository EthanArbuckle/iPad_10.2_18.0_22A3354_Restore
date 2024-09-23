@implementation HMDMediaStreamConfig

- (void)addToDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  unint64_t v14;
  __CFString *v15;
  __CFString *v16;
  int64_t v17;
  unint64_t v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;

  v4 = a3;
  objc_msgSend(v4, "appendFormat:", CFSTR("\n"));
  objc_msgSend(v4, "appendFormat:", CFSTR("direction             = %tu\n"), -[AVCMediaStreamConfig direction](self, "direction"));
  -[AVCMediaStreamConfig localAddress](self, "localAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("localAddress.ip       = %@\n"), v6);

  -[AVCMediaStreamConfig localAddress](self, "localAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("localAddress.port     = %hu\n"), objc_msgSend(v7, "port"));

  -[AVCMediaStreamConfig remoteAddress](self, "remoteAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ip");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("remoteAddress.ip      = %@\n"), v9);

  -[AVCMediaStreamConfig remoteAddress](self, "remoteAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "isIPv6");
  HMFBooleanToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("remoteAddress.ipv6    = %@\n"), v11);

  -[AVCMediaStreamConfig remoteAddress](self, "remoteAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("remoteAddress.port    = %hu\n"), objc_msgSend(v12, "port"));

  objc_msgSend(v4, "appendFormat:", CFSTR("txPayloadType         = %tu\n"), -[AVCMediaStreamConfig txPayloadType](self, "txPayloadType"));
  objc_msgSend(v4, "appendFormat:", CFSTR("rxPayloadType         = %tu\n"), -[AVCMediaStreamConfig rxPayloadType](self, "rxPayloadType"));
  v13 = -[AVCMediaStreamConfig SRTPCipherSuite](self, "SRTPCipherSuite");
  v14 = -[AVCMediaStreamConfig SRTPCipherSuite](self, "SRTPCipherSuite");
  if (v14 > 5)
    v15 = CFSTR("Unknown AVC Video resolution");
  else
    v15 = off_1E89AFBE0[v14];
  v16 = v15;
  objc_msgSend(v4, "appendFormat:", CFSTR("SRTPCipherSuite       = %tu, %@\n"), v13, v16);

  v17 = -[AVCMediaStreamConfig SRTCPCipherSuite](self, "SRTCPCipherSuite");
  v18 = -[AVCMediaStreamConfig SRTCPCipherSuite](self, "SRTCPCipherSuite");
  if (v18 > 5)
    v19 = CFSTR("Unknown AVC Video resolution");
  else
    v19 = off_1E89AFBE0[v18];
  v20 = v19;
  objc_msgSend(v4, "appendFormat:", CFSTR("SRTCPCipherSuite      = %tu, %@\n"), v17, v20);

  -[AVCMediaStreamConfig sendMasterKey](self, "sendMasterKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("sendMasterKey         = %@\n"), v21);

  -[AVCMediaStreamConfig receiveMasterKey](self, "receiveMasterKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("receiveMasterKey      = %@\n"), v22);

  -[AVCMediaStreamConfig isRTCPEnabled](self, "isRTCPEnabled");
  HMFEnabledStatusToString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("rtcpEnabled           = %@\n"), v23);

  -[AVCMediaStreamConfig rtcpSendInterval](self, "rtcpSendInterval");
  objc_msgSend(v4, "appendFormat:", CFSTR("rtcpSendInterval      = %lf\n"), v24);
  -[AVCMediaStreamConfig isRTCPTimeOutEnabled](self, "isRTCPTimeOutEnabled");
  HMFEnabledStatusToString();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("rtcpTimeOutEnabled    = %@\n"), v25);

  -[AVCMediaStreamConfig rtcpTimeOutInterval](self, "rtcpTimeOutInterval");
  objc_msgSend(v4, "appendFormat:", CFSTR("rtcpTimeOutInterval   = %lf\n"), v26);
  -[AVCMediaStreamConfig isRTPTimeOutEnabled](self, "isRTPTimeOutEnabled");
  HMFEnabledStatusToString();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("rtpTimeOutEnabled     = %@\n"), v27);

  -[AVCMediaStreamConfig rtpTimeOutInterval](self, "rtpTimeOutInterval");
  objc_msgSend(v4, "appendFormat:", CFSTR("rtpTimeOutInterval    = %lf\n"), v28);
  objc_msgSend(v4, "appendFormat:", CFSTR("rtcpRemotePort        = %hu\n"), -[AVCMediaStreamConfig rtcpRemotePort](self, "rtcpRemotePort"));
  objc_msgSend(v4, "appendFormat:", CFSTR("remoteSSRC            = %lu\n"), -[AVCMediaStreamConfig remoteSSRC](self, "remoteSSRC"));
  objc_msgSend(v4, "appendFormat:", CFSTR("deviceLocalSSRC       = %u\n"), -[HMDMediaStreamConfig deviceLocalSSRC](self, "deviceLocalSSRC"));
  -[AVCMediaStreamConfig isRateAdaptationEnabled](self, "isRateAdaptationEnabled");
  HMFEnabledStatusToString();
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("rateAdaptationEnabled = %@\n"), v29);

}

- (unsigned)deviceLocalSSRC
{
  return self->_deviceLocalSSRC;
}

- (void)setDeviceLocalSSRC:(unsigned int)a3
{
  self->_deviceLocalSSRC = a3;
}

@end
