@implementation _MRPresentRouteAuthorizationStatusMessageProtobuf

- (BOOL)hasRoute
{
  return self->_route != 0;
}

- (int)status
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_status;
  else
    return -1;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)statusAsString:(int)a3
{
  if ((a3 + 1) < 0xB)
    return off_1E30CBE38[a3 + 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OK")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AuthenticationRequired")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AuthenticationFailed")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Busy")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OutOfRange")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnknownError")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotConnected")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IPAliasingNotSupported")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RelayFailed2GHzNetwork")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RelayFailedMultiDFSNetwork")))
  {
    v4 = 9;
  }
  else
  {
    v4 = -1;
  }

  return v4;
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
  v8.super_class = (Class)_MRPresentRouteAuthorizationStatusMessageProtobuf;
  -[_MRPresentRouteAuthorizationStatusMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPresentRouteAuthorizationStatusMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRAVOutputDeviceDescriptorProtobuf *route;
  void *v5;
  unsigned int v6;
  __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  route = self->_route;
  if (route)
  {
    -[_MRAVOutputDeviceDescriptorProtobuf dictionaryRepresentation](route, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("route"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = self->_status + 1;
    if (v6 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_status);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E30CBE38[v6];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("status"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPresentRouteAuthorizationStatusMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_route)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_route)
  {
    v5 = v4;
    objc_msgSend(v4, "setRoute:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_status;
    *((_BYTE *)v4 + 20) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRAVOutputDeviceDescriptorProtobuf copyWithZone:](self->_route, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_status;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _MRAVOutputDeviceDescriptorProtobuf *route;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  route = self->_route;
  if ((unint64_t)route | *((_QWORD *)v4 + 1))
  {
    if (!-[_MRAVOutputDeviceDescriptorProtobuf isEqual:](route, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_status == *((_DWORD *)v4 + 4))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[_MRAVOutputDeviceDescriptorProtobuf hash](self->_route, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_status;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _MRAVOutputDeviceDescriptorProtobuf *route;
  uint64_t v6;
  id v7;

  v4 = a3;
  route = self->_route;
  v6 = *((_QWORD *)v4 + 1);
  if (route)
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[_MRAVOutputDeviceDescriptorProtobuf mergeFrom:](route, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[_MRPresentRouteAuthorizationStatusMessageProtobuf setRoute:](self, "setRoute:");
  }
  v4 = v7;
LABEL_7:
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_status = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (_MRAVOutputDeviceDescriptorProtobuf)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
}

@end
