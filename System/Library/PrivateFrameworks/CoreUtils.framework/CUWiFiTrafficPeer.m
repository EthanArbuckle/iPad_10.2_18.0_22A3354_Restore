@implementation CUWiFiTrafficPeer

- (id)peerMACAddressData
{
  int v4;
  __uint32_t sin6_scope_id;
  char v6;
  __int16 v7;
  __uint8_t v8;
  __uint16_t v9;

  if (-[NSData length](self->_peerMACData, "length") == 6)
    return self->_peerMACData;
  if (self->_peerIP.sa.sa_family != 30)
    return 0;
  v4 = self->_peerIP.v6.sin6_addr.__u6_addr8[0];
  if (v4 == 254)
  {
    if ((self->_peerIP.sa.sa_data[7] & 0xC0) != 0x80)
      return 0;
  }
  else if ((v4 & 0xFE) != 0xFC)
  {
    return 0;
  }
  sin6_scope_id = self->_peerIP.v6.sin6_scope_id;
  if (sin6_scope_id && sin6_scope_id == if_nametoindex("awdl0"))
  {
    v6 = self->_peerIP.v6.sin6_addr.__u6_addr8[8] ^ 2;
    v7 = *(__uint16_t *)((char *)&self->_peerIP.v6.sin6_addr.__u6_addr16[4] + 1);
    v8 = self->_peerIP.v6.sin6_addr.__u6_addr8[13];
    v9 = self->_peerIP.v6.sin6_addr.__u6_addr16[7];
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v6, 6);
  }
  return 0;
}

- ($9D4F243E34B80324A1B90A38B57CFE16)peerIP
{
  retstr->var0 = *(sockaddr *)&self[1].var2.sin6_flowinfo;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self[1].var2.sin6_addr + 8);
  return self;
}

- (void)setPeerIP:(id *)a3
{
  sockaddr var0;

  var0 = a3->var0;
  *(in6_addr *)((char *)&self->_peerIP.v6.sin6_addr + 4) = *(in6_addr *)((char *)&a3->var2.sin6_addr + 4);
  self->_peerIP.sa = var0;
}

- (NSData)peerMACData
{
  return self->_peerMACData;
}

- (void)setPeerMACData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (void)setTrafficFlags:(unsigned int)a3
{
  self->_trafficFlags = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_peerMACData, 0);
}

@end
