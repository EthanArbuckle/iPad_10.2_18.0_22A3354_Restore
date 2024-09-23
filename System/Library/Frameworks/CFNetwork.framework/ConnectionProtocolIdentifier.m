@implementation ConnectionProtocolIdentifier

uint64_t ___ConnectionProtocolIdentifier_block_invoke()
{
  uint32_t v0;

  qword_1ECDBF2B0 = 0;
  g_ConnectionProtocolIdentifier = 0u;
  unk_1ECDBF2A0 = 0u;
  g_ConnectionProtocolCallbacks = 0u;
  unk_1ECDBF190 = 0u;
  xmmword_1ECDBF1A0 = 0u;
  unk_1ECDBF1B0 = 0u;
  xmmword_1ECDBF1C0 = 0u;
  *(_OWORD *)&qword_1ECDBF1D0 = 0u;
  xmmword_1ECDBF1E0 = 0u;
  unk_1ECDBF1F0 = 0u;
  xmmword_1ECDBF200 = 0u;
  unk_1ECDBF210 = 0u;
  xmmword_1ECDBF220 = 0u;
  *(_OWORD *)&qword_1ECDBF230 = 0u;
  xmmword_1ECDBF240 = 0u;
  unk_1ECDBF250 = 0u;
  xmmword_1ECDBF260 = 0u;
  unk_1ECDBF270 = 0u;
  xmmword_1ECDBF280 = 0u;
  v0 = arc4random();
  snprintf((char *)&g_ConnectionProtocolIdentifier, 0x20uLL, "CFNetworkConnection-%u", v0);
  qword_1ECDBF2B0 = 0x100000004;
  nw_protocol_set_default_one_to_one_callbacks();
  *(_QWORD *)&g_ConnectionProtocolCallbacks = ConnectionProtocolAddInputHandler;
  *((_QWORD *)&g_ConnectionProtocolCallbacks + 1) = ConnectionProtocolRemoveInputHandler;
  qword_1ECDBF1D0 = (uint64_t)ConnectionProtocolGetInputFrames;
  unk_1ECDBF1D8 = ConnectionProtocolGetOutputFrames;
  *(_QWORD *)&xmmword_1ECDBF1E0 = ConnectionProtocolFinalizeOutputFrames;
  *((_QWORD *)&xmmword_1ECDBF1A0 + 1) = ConnectionProtocolConnected;
  qword_1ECDBF230 = (uint64_t)ConnectionProtocolSupportsExternalData;
  qword_1ECDBF198 = (uint64_t)ConnectionProtocolConnect;
  return nw_protocol_register();
}

@end
