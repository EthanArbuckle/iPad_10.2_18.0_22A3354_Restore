@implementation HAP2AccessoryDeviceIPAddress

- (HAP2AccessoryDeviceIPAddress)initWithAddress:(const coap_address_t *)a3
{
  $409187F9BA286A95F935EE1696BBAF90 *p_addr;
  int sa_family;

  *(in6_addr *)((char *)&self->_address.addr.sin6.sin6_addr + 4) = 0u;
  *(_OWORD *)&self->_address.size = 0u;
  self->_address.size = a3->size;
  p_addr = &a3->addr;
  sa_family = a3->addr.sa.sa_family;
  if (sa_family == 2)
  {
    self->_address.addr.sa = p_addr->sa;
  }
  else if (sa_family == 30)
  {
    self->_address.addr.sa.sa_family = 30;
    self->_address.addr.sin6.sin6_addr = a3->addr.sin6.sin6_addr;
    self->_address.addr.sin.sin_port = a3->addr.sin.sin_port;
    self->_address.addr.sin6.sin6_scope_id = a3->addr.sin6.sin6_scope_id;
  }
  else
  {
    memcpy(&self->_address.addr, p_addr, a3->size);
  }
  return self;
}

- (coap_address_t)getAddressPtr
{
  return &self->_address;
}

- (coap_address_t)address
{
  in6_addr v3;

  v3 = *(in6_addr *)((char *)&self->addr.sin6.sin6_addr + 12);
  *(_OWORD *)&retstr->size = *(_OWORD *)&self->addr.sin6.sin6_flowinfo;
  *(in6_addr *)((char *)&retstr->addr.sin6.sin6_addr + 4) = v3;
  return self;
}

@end
