@implementation NWSRouteSnapshot

- (NWSRouteSnapshot)initWithCounts:(const nstat_counts *)a3 routeDescriptor:(nstat_route_descriptor *)a4 sourceIdent:(unint64_t)a5 seqno:(unint64_t)a6
{
  NWSRouteSnapshot *v7;
  NWSRouteSnapshot *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NWSRouteSnapshot;
  v7 = -[NWSSnapshot _initWithCounts:sourceIdent:seqno:](&v10, sel__initWithCounts_sourceIdent_seqno_, a3, a5, a6);
  v8 = v7;
  if (v7)
    -[NWSRouteSnapshot _initWithDescriptor:](v7, "_initWithDescriptor:", a4);
  return v8;
}

- (void)_initWithDescriptor:(nstat_route_descriptor *)a3
{
  sockaddr v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  sockaddr_in v7;
  __int128 v8;

  v3 = *(sockaddr *)((char *)&a3->dst.sa + 24);
  v5 = *(_OWORD *)&a3->id;
  v4 = *(_OWORD *)&a3->gateway_id;
  *(_OWORD *)&self->_descriptor.dst.sa.sa_data[6] = *(_OWORD *)&a3->dst.sa.sa_data[6];
  *(sockaddr *)((char *)&self->_descriptor.dst.sa + 24) = v3;
  *(_OWORD *)&self->_descriptor.id = v5;
  *(_OWORD *)&self->_descriptor.gateway_id = v4;
  v7 = a3->gateway.v4;
  v6 = *((_OWORD *)&a3->gateway.sa + 1);
  v8 = *(_OWORD *)&a3->mask.sa.sa_data[10];
  *(_QWORD *)&self->_descriptor.flags = *(_QWORD *)&a3->flags;
  self->_descriptor.gateway.v4 = v7;
  *((_OWORD *)&self->_descriptor.gateway.sa + 1) = v6;
  *(_OWORD *)&self->_descriptor.mask.sa.sa_data[10] = v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gateway, 0);
  objc_storeStrong((id *)&self->_mask, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

- (unsigned)txRetransmittedBytes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWSRouteSnapshot;
  return -[NWSSnapshot _txRetransmittedBytes](&v3, sel__txRetransmittedBytes);
}

- (unsigned)rxOutOfOrderBytes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWSRouteSnapshot;
  return -[NWSSnapshot _rxOutOfOrderBytes](&v3, sel__rxOutOfOrderBytes);
}

- (unsigned)rxDuplicateBytes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWSRouteSnapshot;
  return -[NWSSnapshot _rxDuplicateBytes](&v3, sel__rxDuplicateBytes);
}

- (double)rttVariation
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWSRouteSnapshot;
  -[NWSSnapshot _rttVariation](&v3, sel__rttVariation);
  return result;
}

- (double)rttMinimum
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWSRouteSnapshot;
  -[NWSSnapshot _rttMinimum](&v3, sel__rttMinimum);
  return result;
}

- (double)rttAverage
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWSRouteSnapshot;
  -[NWSSnapshot _rttAverage](&v3, sel__rttAverage);
  return result;
}

- (NSData)gateway
{
  NSData *gateway;
  NSData *v4;
  NSData *v5;

  gateway = self->_gateway;
  if (!gateway)
  {
    if (self->_descriptor.gateway.v4.sin_len)
    {
      v4 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &self->_descriptor.gateway, self->_descriptor.gateway.v4.sin_len);
      v5 = self->_gateway;
      self->_gateway = v4;

      gateway = self->_gateway;
    }
    else
    {
      gateway = 0;
    }
  }
  return gateway;
}

- (unsigned)connectSuccesses
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWSRouteSnapshot;
  return -[NWSSnapshot _connectSuccesses](&v3, sel__connectSuccesses);
}

- (unsigned)connectAttempts
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWSRouteSnapshot;
  return -[NWSSnapshot _connectAttempts](&v3, sel__connectAttempts);
}

- (unint64_t)routeID
{
  return self->_descriptor.id;
}

- (unint64_t)parentID
{
  return self->_descriptor.parent_id;
}

- (unint64_t)gatewayID
{
  return self->_descriptor.gateway_id;
}

- (unsigned)interfaceIndex
{
  return self->_descriptor.ifindex;
}

- (unsigned)flags
{
  return self->_descriptor.flags;
}

- (NSData)destination
{
  NSData *destination;
  NSData *v4;
  NSData *v5;

  destination = self->_destination;
  if (!destination)
  {
    if (self->_descriptor.dst.v4.sin_len)
    {
      v4 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &self->_descriptor.dst, self->_descriptor.dst.v4.sin_len);
      v5 = self->_destination;
      self->_destination = v4;

      destination = self->_destination;
    }
    else
    {
      destination = 0;
    }
  }
  return destination;
}

- (NSData)mask
{
  NSData *mask;
  NSData *v4;
  NSData *v5;

  mask = self->_mask;
  if (!mask)
  {
    if (self->_descriptor.mask.v4.sin_len)
    {
      v4 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &self->_descriptor.mask, self->_descriptor.mask.v4.sin_len);
      v5 = self->_mask;
      self->_mask = v4;

      mask = self->_mask;
    }
    else
    {
      mask = 0;
    }
  }
  return mask;
}

- (id)traditionalDictionary
{
  void *v3;
  void *v4;
  nstat_route_descriptor *p_descriptor;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)NWSRouteSnapshot;
  -[NWSSnapshot _createCountsForProvider:](&v25, sel__createCountsForProvider_, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", kNStatProviderRoute, kNStatSrcKeyProvider);
    p_descriptor = &self->_descriptor;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_descriptor.id);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, kNStatSrcKeyRouteID);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_descriptor.parent_id);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, kNStatSrcKeyRouteParentID);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_descriptor.gateway_id);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, kNStatSrcKeyRouteGatewayID);

    -[NWSRouteSnapshot destination](self, "destination");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x24BDBCE50];
      -[NWSRouteSnapshot destination](self, "destination");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dataWithData:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, kNStatSrcKeyRouteDestination);

    }
    -[NWSRouteSnapshot mask](self, "mask");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x24BDBCE50];
      -[NWSRouteSnapshot mask](self, "mask");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dataWithData:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, kNStatSrcKeyRouteMask);

    }
    -[NWSRouteSnapshot gateway](self, "gateway");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)MEMORY[0x24BDBCE50];
      -[NWSRouteSnapshot gateway](self, "gateway");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dataWithData:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, kNStatSrcKeyRouteGateway);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", p_descriptor->ifindex);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, kNStatSrcKeyInterface);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", p_descriptor->flags);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, kNStatSrcKeyRouteFlags);

    v23 = v4;
  }

  return v4;
}

- (id)description
{
  nstat_route_descriptor *p_descriptor;
  uint64_t v3;
  _printf_domain *v4;
  const char *v5;
  _printf_domain *v6;
  const char *v7;
  void *v8;
  char *__ret;

  __ret = 0;
  p_descriptor = &self->_descriptor;
  if ((self->_descriptor.flags & 4) != 0)
  {
    v6 = (_printf_domain *)printf_domain();
    v7 = "Scoped ";
    if ((p_descriptor->flags & 0x1000000) == 0)
      v7 = "";
    asxprintf(&__ret, v6, 0, "NWRouteSnapshot %s%N->%I->%N", v7, &p_descriptor->dst, p_descriptor->ifindex, &p_descriptor->gateway);
  }
  else
  {
    v3 = maskLeadingBitsCount(&self->_descriptor.mask.v4.sin_len);
    v4 = (_printf_domain *)printf_domain();
    if ((p_descriptor->flags & 0x1000000) != 0)
      v5 = "Scoped ";
    else
      v5 = "";
    if (v3)
      asxprintf(&__ret, v4, 0, "NWRouteSnapshot %s%N/%d->%I->%N", v5, &p_descriptor->dst, v3, p_descriptor->ifindex, &p_descriptor->gateway);
    else
      asxprintf(&__ret, v4, 0, "NWRouteSnapshot %sDefault->%I->%N", v5, p_descriptor->ifindex, &p_descriptor->gateway);
  }
  if (!__ret)
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", __ret, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  free(__ret);
  return v8;
}

@end
