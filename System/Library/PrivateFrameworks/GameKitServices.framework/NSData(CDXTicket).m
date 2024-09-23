@implementation NSData(CDXTicket)

- (uint64_t)CDXTicketPID
{
  return *(unsigned __int8 *)(objc_msgSend(a1, "bytes") + 2);
}

- (uint64_t)CDXTicketPCNT
{
  return *(unsigned __int8 *)(objc_msgSend(a1, "bytes") + 1);
}

- (uint64_t)CDXTicketExpirationDate
{
  void *v1;
  unint64_t v2;

  v1 = (void *)MEMORY[0x24BDBCE60];
  LODWORD(v2) = *(_DWORD *)(objc_msgSend(a1, "bytes") + 12);
  return objc_msgSend(v1, "dateWithTimeIntervalSince1970:", (double)v2);
}

- (uint64_t)CDXTicketRevision
{
  return bswap32(*(unsigned __int16 *)(objc_msgSend(a1, "bytes") + 10)) >> 16;
}

- (unint64_t)CDXTicketSID
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "bytes");
  return *(unsigned int *)(v1 + 4) | ((unint64_t)*(unsigned __int16 *)(v1 + 8) << 32);
}

- (uint64_t)CDXTicketIsReflected
{
  return *(_BYTE *)objc_msgSend(a1, "bytes") & 1;
}

- (uint64_t)CDXTicketIsHolePunch
{
  return (*(unsigned __int8 *)objc_msgSend(a1, "bytes") >> 3) & 1;
}

- (uint64_t)CDXTicketIsStub
{
  uint64_t result;

  result = objc_msgSend(a1, "CDXTicketIsReflected");
  if ((_DWORD)result)
    return objc_msgSend(a1, "CDXTicketIsHolePunch") ^ 1;
  return result;
}

- (uint64_t)CDXTicketTrimmed
{
  _BYTE *v2;
  uint64_t v3;

  v2 = (_BYTE *)objc_msgSend(a1, "bytes");
  if ((*v2 & 9) != 0)
    v3 = 16;
  else
    v3 = 16 * v2[3] + 32;
  return objc_msgSend(a1, "subdataWithRange:", 0, v3);
}

- (BOOL)CDXTicketWellFormed
{
  uint64_t v2;
  unint64_t v3;

  v2 = objc_msgSend(a1, "bytes");
  if ((unint64_t)objc_msgSend(a1, "length") < 0x10)
    return 0;
  if ((*(_BYTE *)v2 & 9) == 0)
  {
    v3 = 16 * *(unsigned __int8 *)(v2 + 3) + 32;
    if ((*(_BYTE *)v2 & 8) == 0)
      goto LABEL_4;
LABEL_9:
    if (*(_BYTE *)(v2 + 2) || *(_BYTE *)(v2 + 3) || *(_BYTE *)(v2 + 1) || *(_DWORD *)(v2 + 12))
      return 0;
    return objc_msgSend(a1, "length") >= v3;
  }
  v3 = 16;
  if ((*(_BYTE *)v2 & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if (*(_BYTE *)(v2 + 3)
    && *(_BYTE *)(v2 + 1)
    && *(unsigned __int8 *)(v2 + 2) < *(unsigned __int8 *)(v2 + 1))
  {
    return objc_msgSend(a1, "length") >= v3;
  }
  return 0;
}

- (BOOL)CDXTicketIsRelatedToTicket:()CDXTicket
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;

  v5 = objc_msgSend(a1, "bytes");
  v6 = objc_msgSend(a3, "bytes");
  if (*(_DWORD *)(v5 + 4) != *(_DWORD *)(v6 + 4) || *(unsigned __int16 *)(v5 + 8) != *(unsigned __int16 *)(v6 + 8))
    return 0;
  v9 = objc_msgSend(a1, "CDXTicketRevision");
  return (unint64_t)(v9 - objc_msgSend(a3, "CDXTicketRevision")) < 8;
}

@end
