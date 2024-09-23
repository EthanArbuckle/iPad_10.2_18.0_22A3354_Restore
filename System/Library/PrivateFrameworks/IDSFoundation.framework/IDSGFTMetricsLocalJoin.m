@implementation IDSGFTMetricsLocalJoin

- (void)willSendJoin
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("wsj"), v2);
}

- (void)didSendJoin
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("dsj"), v2);
}

- (void)join
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("lj"), v2);
  self->_didJoin = 1;
}

- (void)sendAllocationRequest
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("alloc"), v2);
}

- (void)connectQRServer
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("cqr"), v2);
}

- (void)participantIdChanged
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("pid-new"), v2);
}

- (void)participantIdUnknown
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("pid-unknown"), v2);
}

- (void)serverShortMKICacheMiss
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("server-shortmki-cache-miss"), v2);
}

- (void)selectedLocalInterface:(id)a3
{
  double v3;
  const char *v5;
  double v6;
  id v7;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("slif-%@"), v3, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_event_(self, v5, (uint64_t)v7, v6);

}

- (void)globalLinkStart
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("gls"), v2);
}

- (void)useGecko
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("gecko"), v2);
}

- (void)willSendAllocbindRequestThroughInterface:(id)a3
{
  double v3;
  const char *v5;
  double v6;
  id v7;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("will-abreq-lif-%@"), v3, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_event_(self, v5, (uint64_t)v7, v6);

}

- (void)stunAllocbindRequest
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("abreq-stun"), v2);
}

- (void)stunAllocbindResponse
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("abrsp-stun"), v2);
}

- (void)tcpAllocbindRequest
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("abreq-tcp"), v2);
}

- (void)tcpAllocbindResponse
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("abrsp-tcp"), v2);
}

- (void)quicAllocbindRequest
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("abreq-quic"), v2);
}

- (void)quicAllocbindResponse
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("abrsp-quic"), v2);
}

- (void)allocbindResponseFromInterface:(id)a3
{
  double v3;
  const char *v5;
  double v6;
  id v7;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("abrsp-lif-%@"), v3, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_event_(self, v5, (uint64_t)v7, v6);

}

- (void)allocbindResponseForProtocolStack:(id)a3
{
  double v3;
  const char *v5;
  double v6;
  id v7;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("abrsp-%@"), v3, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_event_(self, v5, (uint64_t)v7, v6);

}

- (void)clientChannelConnected
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("cc"), v2);
}

- (void)didConnectUnderlyingRelayLink
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("cl-relay"), v2);
}

- (void)didConnectUnderlyingE2ELink
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("cl-e2e"), v2);
}

- (void)linkConnectedUsingQUIC
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("cl-quic"), v2);
}

- (void)linkConnectedUsingHTTP2
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("cl-h2"), v2);
}

- (void)linkConnectedUsingTCPSTUN
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("cl-tcp"), v2);
}

- (void)linkConnectedUsingFakeTLS
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("cl-tls"), v2);
}

- (void)linkConnectedWithH2FallbackEnabled:(BOOL)a3
{
  double v3;

  if (a3)
    objc_msgSend_event_(self, a2, (uint64_t)CFSTR("cl-h2e"), v3);
  else
    objc_msgSend_event_(self, a2, (uint64_t)CFSTR("cl-h2ne"), v3);
}

- (void)didCreateMKM:(id)a3
{
  double v3;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("mkm-c"), v3);
}

- (void)sendMKMToAVC:(id)a3 isGeneratedLocally:(BOOL)a4
{
  double v4;

  if (a4)
    objc_msgSend_event_(self, a2, (uint64_t)CFSTR("lmkm-avc"), v4);
  else
    objc_msgSend_event_(self, a2, (uint64_t)CFSTR("rmkm-avc"), v4);
}

- (void)firstIncomingPacketTime:(double)a3 forMKI:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_event_time_, CFSTR("fp-in"), a3);
}

- (void)firstOutgoingPacketTime:(double)a3 forMKI:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_event_time_, CFSTR("fp-out"), a3);
}

- (void)avcReceiveMKMTime:(double)a3 forMKI:(id)a4 isGeneratedLocally:(BOOL)a5
{
  const __CFString *v5;

  if (a5)
    v5 = CFSTR("lmkm-avc-rcv");
  else
    v5 = CFSTR("rmkm-avc-rcv");
  MEMORY[0x1E0DE7D20](self, sel_event_time_, v5, a3);
}

- (BOOL)didJoin
{
  return self->_didJoin;
}

- (void)setDidJoin:(BOOL)a3
{
  self->_didJoin = a3;
}

@end
