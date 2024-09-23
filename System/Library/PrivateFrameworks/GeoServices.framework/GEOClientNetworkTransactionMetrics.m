@implementation GEOClientNetworkTransactionMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)setUsedCellular:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20000u;
  self->_usedCellular = a3;
}

- (void)setSecureConnectStart:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x400u;
  self->_secureConnectStart = a3;
}

- (void)setSecureConnectEnd:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x200u;
  self->_secureConnectEnd = a3;
}

- (void)setReusedConnection:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10000u;
  self->_reusedConnection = a3;
}

- (void)setResponseStart:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x100u;
  self->_responseStart = a3;
}

- (void)setResponseEnd:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x80u;
  self->_responseEnd = a3;
}

- (void)setResourceFetchType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000u;
  self->_resourceFetchType = a3;
}

- (void)setRequestStart:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x40u;
  self->_requestStart = a3;
}

- (void)setRequestEnd:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x20u;
  self->_requestEnd = a3;
}

- (void)setProxyConnection:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000u;
  self->_proxyConnection = a3;
}

- (void)setProtocolName:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x1000u;
  self->_protocolName = a3;
}

- (void)setIsMultipath:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x4000u;
  self->_isMultipath = a3;
}

- (void)setFetchStart:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x10u;
  self->_fetchStart = a3;
}

- (void)setDomainLookupStart:(double)a3
{
  *(_DWORD *)&self->_flags |= 8u;
  self->_domainLookupStart = a3;
}

- (void)setDomainLookupEnd:(double)a3
{
  *(_DWORD *)&self->_flags |= 4u;
  self->_domainLookupEnd = a3;
}

- (void)setConnectStart:(double)a3
{
  *(_DWORD *)&self->_flags |= 2u;
  self->_connectStart = a3;
}

- (void)setConnectEnd:(double)a3
{
  *(_DWORD *)&self->_flags |= 1u;
  self->_connectEnd = a3;
}

- (void)setMultipathServiceType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800u;
  self->_multipathServiceType = a3;
}

- (void)writeTo:(id)a3
{
  $B5C7CCCB84F8B0E196EE451F642EF20E flags;
  id v5;

  v5 = a3;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&flags & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&flags & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&flags & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&flags & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&flags & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&flags & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&flags & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&flags & 0x800) == 0)
      goto LABEL_18;
LABEL_37:
    PBDataWriterWriteInt32Field();
    if ((*(_DWORD *)&self->_flags & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_36:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0)
    goto LABEL_37;
LABEL_18:
  if ((*(_DWORD *)&flags & 0x20000) != 0)
LABEL_19:
    PBDataWriterWriteBOOLField();
LABEL_20:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (double)fetchStart
{
  return self->_fetchStart;
}

- (void)setHasFetchStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasFetchStart
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (double)domainLookupStart
{
  return self->_domainLookupStart;
}

- (void)setHasDomainLookupStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDomainLookupStart
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (double)domainLookupEnd
{
  return self->_domainLookupEnd;
}

- (void)setHasDomainLookupEnd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDomainLookupEnd
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (double)connectStart
{
  return self->_connectStart;
}

- (void)setHasConnectStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasConnectStart
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)secureConnectStart
{
  return self->_secureConnectStart;
}

- (void)setHasSecureConnectStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasSecureConnectStart
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (double)secureConnectEnd
{
  return self->_secureConnectEnd;
}

- (void)setHasSecureConnectEnd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasSecureConnectEnd
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (double)connectEnd
{
  return self->_connectEnd;
}

- (void)setHasConnectEnd:(BOOL)a3
{
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3);
}

- (BOOL)hasConnectEnd
{
  return *(_DWORD *)&self->_flags & 1;
}

- (double)requestStart
{
  return self->_requestStart;
}

- (void)setHasRequestStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasRequestStart
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (double)requestEnd
{
  return self->_requestEnd;
}

- (void)setHasRequestEnd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasRequestEnd
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (double)responseStart
{
  return self->_responseStart;
}

- (void)setHasResponseStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasResponseStart
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (double)responseEnd
{
  return self->_responseEnd;
}

- (void)setHasResponseEnd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasResponseEnd
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (int)protocolName
{
  if ((*((_BYTE *)&self->_flags + 1) & 0x10) != 0)
    return self->_protocolName;
  else
    return 0;
}

- (void)setHasProtocolName:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasProtocolName
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (id)protocolNameAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C0F958[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsProtocolName:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HTTP_1_1")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HTTP_2_TLS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HTTP_2_TCP")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPDY_1")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPDY_2")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SPDY_3")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)proxyConnection
{
  return self->_proxyConnection;
}

- (void)setHasProxyConnection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFF7FFF | v3);
}

- (BOOL)hasProxyConnection
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (BOOL)reusedConnection
{
  return self->_reusedConnection;
}

- (void)setHasReusedConnection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v3);
}

- (BOOL)hasReusedConnection
{
  return *((_BYTE *)&self->_flags + 2) & 1;
}

- (int)resourceFetchType
{
  if ((*((_BYTE *)&self->_flags + 1) & 0x20) != 0)
    return self->_resourceFetchType;
  else
    return 0;
}

- (void)setHasResourceFetchType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasResourceFetchType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (id)resourceFetchTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C0F990[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsResourceFetchType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NETWORK_LOAD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SERVER_PUSH")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LOCAL_CACHE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isMultipath
{
  return self->_isMultipath;
}

- (void)setHasIsMultipath:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsMultipath
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (int)multipathServiceType
{
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
    return self->_multipathServiceType;
  else
    return 0;
}

- (void)setHasMultipathServiceType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasMultipathServiceType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (id)multipathServiceTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C0F9B0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMultipathServiceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HANDOVER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERACTIVE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AGGREGATE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)usedCellular
{
  return self->_usedCellular;
}

- (void)setHasUsedCellular:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFDFFFF | v3);
}

- (BOOL)hasUsedCellular
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
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
  v8.super_class = (Class)GEOClientNetworkTransactionMetrics;
  -[GEOClientNetworkTransactionMetrics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOClientNetworkTransactionMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOClientNetworkTransactionMetrics _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  __CFString *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  uint64_t v44;
  __CFString *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  uint64_t v49;
  __CFString *v50;
  const __CFString *v51;
  _QWORD v52[4];
  id v53;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("fetchStart");
    else
      v7 = CFSTR("fetch_start");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_DWORD *)(a1 + 120);
  }
  if ((v5 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("domainLookupStart");
    else
      v18 = CFSTR("domain_lookup_start");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

    v5 = *(_DWORD *)(a1 + 120);
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0)
        goto LABEL_10;
      goto LABEL_42;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v20 = CFSTR("domainLookupEnd");
  else
    v20 = CFSTR("domain_lookup_end");
  objc_msgSend(v4, "setObject:forKey:", v19, v20);

  v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v22 = CFSTR("connectStart");
  else
    v22 = CFSTR("connect_start");
  objc_msgSend(v4, "setObject:forKey:", v21, v22);

  v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x400) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_50;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 96));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v24 = CFSTR("secureConnectStart");
  else
    v24 = CFSTR("secure_connect_start");
  objc_msgSend(v4, "setObject:forKey:", v23, v24);

  v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 1) == 0)
      goto LABEL_13;
    goto LABEL_54;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 88));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v26 = CFSTR("secureConnectEnd");
  else
    v26 = CFSTR("secure_connect_end");
  objc_msgSend(v4, "setObject:forKey:", v25, v26);

  v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 1) == 0)
  {
LABEL_13:
    if ((v5 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_58;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v28 = CFSTR("connectEnd");
  else
    v28 = CFSTR("connect_end");
  objc_msgSend(v4, "setObject:forKey:", v27, v28);

  v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x40) == 0)
  {
LABEL_14:
    if ((v5 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_62;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v30 = CFSTR("requestStart");
  else
    v30 = CFSTR("request_start");
  objc_msgSend(v4, "setObject:forKey:", v29, v30);

  v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x20) == 0)
  {
LABEL_15:
    if ((v5 & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_66;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v32 = CFSTR("requestEnd");
  else
    v32 = CFSTR("request_end");
  objc_msgSend(v4, "setObject:forKey:", v31, v32);

  v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x100) == 0)
  {
LABEL_16:
    if ((v5 & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_70;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v34 = CFSTR("responseStart");
  else
    v34 = CFSTR("response_start");
  objc_msgSend(v4, "setObject:forKey:", v33, v34);

  v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x80) == 0)
  {
LABEL_17:
    if ((v5 & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_74;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v36 = CFSTR("responseEnd");
  else
    v36 = CFSTR("response_end");
  objc_msgSend(v4, "setObject:forKey:", v35, v36);

  v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x1000) == 0)
  {
LABEL_18:
    if ((v5 & 0x8000) == 0)
      goto LABEL_19;
    goto LABEL_81;
  }
LABEL_74:
  v37 = *(int *)(a1 + 108);
  if (v37 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 108));
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = off_1E1C0F958[v37];
  }
  if (a2)
    v39 = CFSTR("protocolName");
  else
    v39 = CFSTR("protocol_name");
  objc_msgSend(v4, "setObject:forKey:", v38, v39);

  v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x8000) == 0)
  {
LABEL_19:
    if ((v5 & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_85;
  }
LABEL_81:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 117));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v41 = CFSTR("proxyConnection");
  else
    v41 = CFSTR("proxy_connection");
  objc_msgSend(v4, "setObject:forKey:", v40, v41);

  v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x10000) == 0)
  {
LABEL_20:
    if ((v5 & 0x2000) == 0)
      goto LABEL_21;
    goto LABEL_89;
  }
LABEL_85:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 118));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v43 = CFSTR("reusedConnection");
  else
    v43 = CFSTR("reused_connection");
  objc_msgSend(v4, "setObject:forKey:", v42, v43);

  v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x2000) == 0)
  {
LABEL_21:
    if ((v5 & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_96;
  }
LABEL_89:
  v44 = *(int *)(a1 + 112);
  if (v44 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 112));
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = off_1E1C0F990[v44];
  }
  if (a2)
    v46 = CFSTR("resourceFetchType");
  else
    v46 = CFSTR("resource_fetch_type");
  objc_msgSend(v4, "setObject:forKey:", v45, v46);

  v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x4000) == 0)
  {
LABEL_22:
    if ((v5 & 0x800) == 0)
      goto LABEL_23;
LABEL_100:
    v49 = *(int *)(a1 + 104);
    if (v49 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 104));
      v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v50 = off_1E1C0F9B0[v49];
    }
    if (a2)
      v51 = CFSTR("multipathServiceType");
    else
      v51 = CFSTR("multipath_service_type");
    objc_msgSend(v4, "setObject:forKey:", v50, v51);

    if ((*(_DWORD *)(a1 + 120) & 0x20000) == 0)
      goto LABEL_28;
    goto LABEL_24;
  }
LABEL_96:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 116));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v48 = CFSTR("isMultipath");
  else
    v48 = CFSTR("is_multipath");
  objc_msgSend(v4, "setObject:forKey:", v47, v48);

  v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x800) != 0)
    goto LABEL_100;
LABEL_23:
  if ((v5 & 0x20000) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 119));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("usedCellular");
    else
      v9 = CFSTR("used_cellular");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
LABEL_28:
  v10 = *(void **)(a1 + 8);
  if (v10)
  {
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __64__GEOClientNetworkTransactionMetrics__dictionaryRepresentation___block_invoke;
      v52[3] = &unk_1E1C00600;
      v14 = v13;
      v53 = v14;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v52);
      v15 = v14;

      v12 = v15;
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOClientNetworkTransactionMetrics _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __64__GEOClientNetworkTransactionMetrics__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOClientNetworkTransactionMetrics)initWithDictionary:(id)a3
{
  return (GEOClientNetworkTransactionMetrics *)-[GEOClientNetworkTransactionMetrics _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  id v38;
  uint64_t v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  id v44;
  uint64_t v45;
  const __CFString *v46;
  void *v47;

  v5 = a2;
  if (!a1)
    goto LABEL_136;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_136;
  if (a3)
    v6 = CFSTR("fetchStart");
  else
    v6 = CFSTR("fetch_start");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(a1, "setFetchStart:");
  }

  if (a3)
    v8 = CFSTR("domainLookupStart");
  else
    v8 = CFSTR("domain_lookup_start");
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(a1, "setDomainLookupStart:");
  }

  if (a3)
    v10 = CFSTR("domainLookupEnd");
  else
    v10 = CFSTR("domain_lookup_end");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(a1, "setDomainLookupEnd:");
  }

  if (a3)
    v12 = CFSTR("connectStart");
  else
    v12 = CFSTR("connect_start");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(a1, "setConnectStart:");
  }

  if (a3)
    v14 = CFSTR("secureConnectStart");
  else
    v14 = CFSTR("secure_connect_start");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "doubleValue");
    objc_msgSend(a1, "setSecureConnectStart:");
  }

  if (a3)
    v16 = CFSTR("secureConnectEnd");
  else
    v16 = CFSTR("secure_connect_end");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v17, "doubleValue");
    objc_msgSend(a1, "setSecureConnectEnd:");
  }

  if (a3)
    v18 = CFSTR("connectEnd");
  else
    v18 = CFSTR("connect_end");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v19, "doubleValue");
    objc_msgSend(a1, "setConnectEnd:");
  }

  if (a3)
    v20 = CFSTR("requestStart");
  else
    v20 = CFSTR("request_start");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v21, "doubleValue");
    objc_msgSend(a1, "setRequestStart:");
  }

  if (a3)
    v22 = CFSTR("requestEnd");
  else
    v22 = CFSTR("request_end");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v23, "doubleValue");
    objc_msgSend(a1, "setRequestEnd:");
  }

  if (a3)
    v24 = CFSTR("responseStart");
  else
    v24 = CFSTR("response_start");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v25, "doubleValue");
    objc_msgSend(a1, "setResponseStart:");
  }

  if (a3)
    v26 = CFSTR("responseEnd");
  else
    v26 = CFSTR("response_end");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v27, "doubleValue");
    objc_msgSend(a1, "setResponseEnd:");
  }

  if (a3)
    v28 = CFSTR("protocolName");
  else
    v28 = CFSTR("protocol_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = v29;
    if ((objc_msgSend(v30, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
    {
      v31 = 0;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("HTTP_1_1")) & 1) != 0)
    {
      v31 = 1;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("HTTP_2_TLS")) & 1) != 0)
    {
      v31 = 2;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("HTTP_2_TCP")) & 1) != 0)
    {
      v31 = 3;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("SPDY_1")) & 1) != 0)
    {
      v31 = 4;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("SPDY_2")) & 1) != 0)
    {
      v31 = 5;
    }
    else if (objc_msgSend(v30, "isEqualToString:", CFSTR("SPDY_3")))
    {
      v31 = 6;
    }
    else
    {
      v31 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_81;
    v31 = objc_msgSend(v29, "intValue");
  }
  objc_msgSend(a1, "setProtocolName:", v31);
LABEL_81:

  if (a3)
    v32 = CFSTR("proxyConnection");
  else
    v32 = CFSTR("proxy_connection");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setProxyConnection:", objc_msgSend(v33, "BOOLValue"));

  if (a3)
    v34 = CFSTR("reusedConnection");
  else
    v34 = CFSTR("reused_connection");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setReusedConnection:", objc_msgSend(v35, "BOOLValue"));

  if (a3)
    v36 = CFSTR("resourceFetchType");
  else
    v36 = CFSTR("resource_fetch_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = v37;
    if ((objc_msgSend(v38, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v39 = 0;
    }
    else if ((objc_msgSend(v38, "isEqualToString:", CFSTR("NETWORK_LOAD")) & 1) != 0)
    {
      v39 = 1;
    }
    else if ((objc_msgSend(v38, "isEqualToString:", CFSTR("SERVER_PUSH")) & 1) != 0)
    {
      v39 = 2;
    }
    else if (objc_msgSend(v38, "isEqualToString:", CFSTR("LOCAL_CACHE")))
    {
      v39 = 3;
    }
    else
    {
      v39 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_108;
    v39 = objc_msgSend(v37, "intValue");
  }
  objc_msgSend(a1, "setResourceFetchType:", v39);
LABEL_108:

  if (a3)
    v40 = CFSTR("isMultipath");
  else
    v40 = CFSTR("is_multipath");
  objc_msgSend(v5, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsMultipath:", objc_msgSend(v41, "BOOLValue"));

  if (a3)
    v42 = CFSTR("multipathServiceType");
  else
    v42 = CFSTR("multipath_service_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = v43;
    if ((objc_msgSend(v44, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
    {
      v45 = 0;
    }
    else if ((objc_msgSend(v44, "isEqualToString:", CFSTR("HANDOVER")) & 1) != 0)
    {
      v45 = 1;
    }
    else if ((objc_msgSend(v44, "isEqualToString:", CFSTR("INTERACTIVE")) & 1) != 0)
    {
      v45 = 2;
    }
    else if (objc_msgSend(v44, "isEqualToString:", CFSTR("AGGREGATE")))
    {
      v45 = 3;
    }
    else
    {
      v45 = 0;
    }

    goto LABEL_129;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v45 = objc_msgSend(v43, "intValue");
LABEL_129:
    objc_msgSend(a1, "setMultipathServiceType:", v45);
  }

  if (a3)
    v46 = CFSTR("usedCellular");
  else
    v46 = CFSTR("used_cellular");
  objc_msgSend(v5, "objectForKeyedSubscript:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setUsedCellular:", objc_msgSend(v47, "BOOLValue"));

LABEL_136:
  return a1;
}

- (GEOClientNetworkTransactionMetrics)initWithJSON:(id)a3
{
  return (GEOClientNetworkTransactionMetrics *)-[GEOClientNetworkTransactionMetrics _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOClientNetworkTransactionMetricsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOClientNetworkTransactionMetricsReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  $B5C7CCCB84F8B0E196EE451F642EF20E flags;
  _QWORD *v5;

  v5 = a3;
  -[GEOClientNetworkTransactionMetrics readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    v5[6] = *(_QWORD *)&self->_fetchStart;
    *((_DWORD *)v5 + 30) |= 0x10u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[5] = *(_QWORD *)&self->_domainLookupStart;
  *((_DWORD *)v5 + 30) |= 8u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  v5[4] = *(_QWORD *)&self->_domainLookupEnd;
  *((_DWORD *)v5 + 30) |= 4u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&flags & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  v5[3] = *(_QWORD *)&self->_connectStart;
  *((_DWORD *)v5 + 30) |= 2u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  v5[12] = *(_QWORD *)&self->_secureConnectStart;
  *((_DWORD *)v5 + 30) |= 0x400u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  v5[11] = *(_QWORD *)&self->_secureConnectEnd;
  *((_DWORD *)v5 + 30) |= 0x200u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  v5[2] = *(_QWORD *)&self->_connectEnd;
  *((_DWORD *)v5 + 30) |= 1u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  v5[8] = *(_QWORD *)&self->_requestStart;
  *((_DWORD *)v5 + 30) |= 0x40u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&flags & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  v5[7] = *(_QWORD *)&self->_requestEnd;
  *((_DWORD *)v5 + 30) |= 0x20u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&flags & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  v5[10] = *(_QWORD *)&self->_responseStart;
  *((_DWORD *)v5 + 30) |= 0x100u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  v5[9] = *(_QWORD *)&self->_responseEnd;
  *((_DWORD *)v5 + 30) |= 0x80u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&flags & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v5 + 27) = self->_protocolName;
  *((_DWORD *)v5 + 30) |= 0x1000u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&flags & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  *((_BYTE *)v5 + 117) = self->_proxyConnection;
  *((_DWORD *)v5 + 30) |= 0x8000u;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&flags & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  *((_BYTE *)v5 + 118) = self->_reusedConnection;
  *((_DWORD *)v5 + 30) |= 0x10000u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&flags & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v5 + 28) = self->_resourceFetchType;
  *((_DWORD *)v5 + 30) |= 0x2000u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&flags & 0x800) == 0)
      goto LABEL_18;
LABEL_37:
    *((_DWORD *)v5 + 26) = self->_multipathServiceType;
    *((_DWORD *)v5 + 30) |= 0x800u;
    if ((*(_DWORD *)&self->_flags & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_36:
  *((_BYTE *)v5 + 116) = self->_isMultipath;
  *((_DWORD *)v5 + 30) |= 0x4000u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0)
    goto LABEL_37;
LABEL_18:
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
LABEL_19:
    *((_BYTE *)v5 + 119) = self->_usedCellular;
    *((_DWORD *)v5 + 30) |= 0x20000u;
  }
LABEL_20:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    *(double *)(v4 + 48) = self->_fetchStart;
    *(_DWORD *)(v4 + 120) |= 0x10u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v4 + 40) = self->_domainLookupStart;
  *(_DWORD *)(v4 + 120) |= 8u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  *(double *)(v4 + 32) = self->_domainLookupEnd;
  *(_DWORD *)(v4 + 120) |= 4u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&flags & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  *(double *)(v4 + 24) = self->_connectStart;
  *(_DWORD *)(v4 + 120) |= 2u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  *(double *)(v4 + 96) = self->_secureConnectStart;
  *(_DWORD *)(v4 + 120) |= 0x400u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  *(double *)(v4 + 88) = self->_secureConnectEnd;
  *(_DWORD *)(v4 + 120) |= 0x200u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  *(double *)(v4 + 16) = self->_connectEnd;
  *(_DWORD *)(v4 + 120) |= 1u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  *(double *)(v4 + 64) = self->_requestStart;
  *(_DWORD *)(v4 + 120) |= 0x40u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&flags & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  *(double *)(v4 + 56) = self->_requestEnd;
  *(_DWORD *)(v4 + 120) |= 0x20u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&flags & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  *(double *)(v4 + 80) = self->_responseStart;
  *(_DWORD *)(v4 + 120) |= 0x100u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  *(double *)(v4 + 72) = self->_responseEnd;
  *(_DWORD *)(v4 + 120) |= 0x80u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&flags & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(v4 + 108) = self->_protocolName;
  *(_DWORD *)(v4 + 120) |= 0x1000u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&flags & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  *(_BYTE *)(v4 + 117) = self->_proxyConnection;
  *(_DWORD *)(v4 + 120) |= 0x8000u;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&flags & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  *(_BYTE *)(v4 + 118) = self->_reusedConnection;
  *(_DWORD *)(v4 + 120) |= 0x10000u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&flags & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v4 + 112) = self->_resourceFetchType;
  *(_DWORD *)(v4 + 120) |= 0x2000u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&flags & 0x800) == 0)
      goto LABEL_18;
LABEL_37:
    *(_DWORD *)(v4 + 104) = self->_multipathServiceType;
    *(_DWORD *)(v4 + 120) |= 0x800u;
    if ((*(_DWORD *)&self->_flags & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_36:
  *(_BYTE *)(v4 + 116) = self->_isMultipath;
  *(_DWORD *)(v4 + 120) |= 0x4000u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0)
    goto LABEL_37;
LABEL_18:
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
LABEL_19:
    *(_BYTE *)(v4 + 119) = self->_usedCellular;
    *(_DWORD *)(v4 + 120) |= 0x20000u;
  }
LABEL_20:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags;
  int v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_99;
  -[GEOClientNetworkTransactionMetrics readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_DWORD *)v4 + 30);
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_fetchStart != *((double *)v4 + 6))
      goto LABEL_99;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_domainLookupStart != *((double *)v4 + 5))
      goto LABEL_99;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_domainLookupEnd != *((double *)v4 + 4))
      goto LABEL_99;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_connectStart != *((double *)v4 + 3))
      goto LABEL_99;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_secureConnectStart != *((double *)v4 + 12))
      goto LABEL_99;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_secureConnectEnd != *((double *)v4 + 11))
      goto LABEL_99;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_connectEnd != *((double *)v4 + 2))
      goto LABEL_99;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_requestStart != *((double *)v4 + 8))
      goto LABEL_99;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_requestEnd != *((double *)v4 + 7))
      goto LABEL_99;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_responseStart != *((double *)v4 + 10))
      goto LABEL_99;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_responseEnd != *((double *)v4 + 9))
      goto LABEL_99;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_protocolName != *((_DWORD *)v4 + 27))
      goto LABEL_99;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0)
      goto LABEL_99;
    if (self->_proxyConnection)
    {
      if (!*((_BYTE *)v4 + 117))
        goto LABEL_99;
    }
    else if (*((_BYTE *)v4 + 117))
    {
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0)
      goto LABEL_99;
    if (self->_reusedConnection)
    {
      if (!*((_BYTE *)v4 + 118))
        goto LABEL_99;
    }
    else if (*((_BYTE *)v4 + 118))
    {
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_resourceFetchType != *((_DWORD *)v4 + 28))
      goto LABEL_99;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0)
      goto LABEL_99;
    if (self->_isMultipath)
    {
      if (!*((_BYTE *)v4 + 116))
        goto LABEL_99;
    }
    else if (*((_BYTE *)v4 + 116))
    {
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_multipathServiceType != *((_DWORD *)v4 + 26))
      goto LABEL_99;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
    if ((v6 & 0x20000) != 0)
    {
      if (self->_usedCellular)
      {
        if (!*((_BYTE *)v4 + 119))
          goto LABEL_99;
      }
      else if (*((_BYTE *)v4 + 119))
      {
        goto LABEL_99;
      }
      v7 = 1;
      goto LABEL_100;
    }
LABEL_99:
    v7 = 0;
    goto LABEL_100;
  }
  v7 = (v6 & 0x20000) == 0;
LABEL_100:

  return v7;
}

- (unint64_t)hash
{
  $B5C7CCCB84F8B0E196EE451F642EF20E flags;
  unint64_t v4;
  double fetchStart;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double domainLookupStart;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double domainLookupEnd;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double connectStart;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double secureConnectStart;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double secureConnectEnd;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double connectEnd;
  double v36;
  long double v37;
  double v38;
  unint64_t v39;
  double requestStart;
  double v41;
  long double v42;
  double v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  double requestEnd;
  double v48;
  long double v49;
  double v50;
  unint64_t v51;
  unint64_t v52;
  double responseStart;
  double v54;
  long double v55;
  double v56;
  unint64_t v57;
  double responseEnd;
  double v59;
  long double v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;

  -[GEOClientNetworkTransactionMetrics readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    fetchStart = self->_fetchStart;
    v6 = -fetchStart;
    if (fetchStart >= 0.0)
      v6 = self->_fetchStart;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    domainLookupStart = self->_domainLookupStart;
    v11 = -domainLookupStart;
    if (domainLookupStart >= 0.0)
      v11 = self->_domainLookupStart;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    domainLookupEnd = self->_domainLookupEnd;
    v16 = -domainLookupEnd;
    if (domainLookupEnd >= 0.0)
      v16 = self->_domainLookupEnd;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    connectStart = self->_connectStart;
    v21 = -connectStart;
    if (connectStart >= 0.0)
      v21 = self->_connectStart;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    secureConnectStart = self->_secureConnectStart;
    v26 = -secureConnectStart;
    if (secureConnectStart >= 0.0)
      v26 = self->_secureConnectStart;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    secureConnectEnd = self->_secureConnectEnd;
    v31 = -secureConnectEnd;
    if (secureConnectEnd >= 0.0)
      v31 = self->_secureConnectEnd;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    connectEnd = self->_connectEnd;
    v36 = -connectEnd;
    if (connectEnd >= 0.0)
      v36 = self->_connectEnd;
    v37 = floor(v36 + 0.5);
    v38 = (v36 - v37) * 1.84467441e19;
    v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  v71 = v24;
  v72 = v4;
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    requestStart = self->_requestStart;
    v41 = -requestStart;
    if (requestStart >= 0.0)
      v41 = self->_requestStart;
    v42 = floor(v41 + 0.5);
    v43 = (v41 - v42) * 1.84467441e19;
    v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  v70 = v9;
  v44 = v29;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    requestEnd = self->_requestEnd;
    v48 = -requestEnd;
    if (requestEnd >= 0.0)
      v48 = self->_requestEnd;
    v49 = floor(v48 + 0.5);
    v50 = (v48 - v49) * 1.84467441e19;
    v46 = 2654435761u * (unint64_t)fmod(v49, 1.84467441e19);
    v45 = v19;
    if (v50 >= 0.0)
    {
      if (v50 > 0.0)
        v46 += (unint64_t)v50;
    }
    else
    {
      v46 -= (unint64_t)fabs(v50);
    }
  }
  else
  {
    v45 = v19;
    v46 = 0;
  }
  v51 = v14;
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    responseStart = self->_responseStart;
    v54 = -responseStart;
    if (responseStart >= 0.0)
      v54 = self->_responseStart;
    v55 = floor(v54 + 0.5);
    v56 = (v54 - v55) * 1.84467441e19;
    v52 = 2654435761u * (unint64_t)fmod(v55, 1.84467441e19);
    if (v56 >= 0.0)
    {
      if (v56 > 0.0)
        v52 += (unint64_t)v56;
    }
    else
    {
      v52 -= (unint64_t)fabs(v56);
    }
  }
  else
  {
    v52 = 0;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    responseEnd = self->_responseEnd;
    v59 = -responseEnd;
    if (responseEnd >= 0.0)
      v59 = self->_responseEnd;
    v60 = floor(v59 + 0.5);
    v61 = (v59 - v60) * 1.84467441e19;
    v57 = 2654435761u * (unint64_t)fmod(v60, 1.84467441e19);
    if (v61 >= 0.0)
    {
      if (v61 > 0.0)
        v57 += (unint64_t)v61;
    }
    else
    {
      v57 -= (unint64_t)fabs(v61);
    }
  }
  else
  {
    v57 = 0;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    v62 = 2654435761 * self->_protocolName;
    if ((*(_WORD *)&flags & 0x8000) != 0)
    {
LABEL_91:
      v63 = 2654435761 * self->_proxyConnection;
      if ((*(_DWORD *)&flags & 0x10000) != 0)
        goto LABEL_92;
      goto LABEL_99;
    }
  }
  else
  {
    v62 = 0;
    if ((*(_WORD *)&flags & 0x8000) != 0)
      goto LABEL_91;
  }
  v63 = 0;
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
LABEL_92:
    v64 = 2654435761 * self->_reusedConnection;
    if ((*(_WORD *)&flags & 0x2000) != 0)
      goto LABEL_93;
    goto LABEL_100;
  }
LABEL_99:
  v64 = 0;
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
LABEL_93:
    v65 = 2654435761 * self->_resourceFetchType;
    if ((*(_WORD *)&flags & 0x4000) != 0)
      goto LABEL_94;
    goto LABEL_101;
  }
LABEL_100:
  v65 = 0;
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
LABEL_94:
    v66 = 2654435761 * self->_isMultipath;
    if ((*(_WORD *)&flags & 0x800) != 0)
      goto LABEL_95;
LABEL_102:
    v67 = 0;
    if ((*(_DWORD *)&flags & 0x20000) != 0)
      goto LABEL_96;
LABEL_103:
    v68 = 0;
    return v70 ^ v72 ^ v51 ^ v45 ^ v71 ^ v44 ^ v34 ^ v39 ^ v46 ^ v52 ^ v57 ^ v62 ^ v63 ^ v64 ^ v65 ^ v66 ^ v67 ^ v68;
  }
LABEL_101:
  v66 = 0;
  if ((*(_WORD *)&flags & 0x800) == 0)
    goto LABEL_102;
LABEL_95:
  v67 = 2654435761 * self->_multipathServiceType;
  if ((*(_DWORD *)&flags & 0x20000) == 0)
    goto LABEL_103;
LABEL_96:
  v68 = 2654435761 * self->_usedCellular;
  return v70 ^ v72 ^ v51 ^ v45 ^ v71 ^ v44 ^ v34 ^ v39 ^ v46 ^ v52 ^ v57 ^ v62 ^ v63 ^ v64 ^ v65 ^ v66 ^ v67 ^ v68;
}

- (void)mergeFrom:(id)a3
{
  int v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x10) != 0)
  {
    self->_fetchStart = *((double *)v5 + 6);
    *(_DWORD *)&self->_flags |= 0x10u;
    v4 = *((_DWORD *)v5 + 30);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((v4 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_domainLookupStart = *((double *)v5 + 5);
  *(_DWORD *)&self->_flags |= 8u;
  v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  self->_domainLookupEnd = *((double *)v5 + 4);
  *(_DWORD *)&self->_flags |= 4u;
  v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  self->_connectStart = *((double *)v5 + 3);
  *(_DWORD *)&self->_flags |= 2u;
  v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x400) == 0)
  {
LABEL_6:
    if ((v4 & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  self->_secureConnectStart = *((double *)v5 + 12);
  *(_DWORD *)&self->_flags |= 0x400u;
  v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x200) == 0)
  {
LABEL_7:
    if ((v4 & 1) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  self->_secureConnectEnd = *((double *)v5 + 11);
  *(_DWORD *)&self->_flags |= 0x200u;
  v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 1) == 0)
  {
LABEL_8:
    if ((v4 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  self->_connectEnd = *((double *)v5 + 2);
  *(_DWORD *)&self->_flags |= 1u;
  v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x40) == 0)
  {
LABEL_9:
    if ((v4 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  self->_requestStart = *((double *)v5 + 8);
  *(_DWORD *)&self->_flags |= 0x40u;
  v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x20) == 0)
  {
LABEL_10:
    if ((v4 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  self->_requestEnd = *((double *)v5 + 7);
  *(_DWORD *)&self->_flags |= 0x20u;
  v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x100) == 0)
  {
LABEL_11:
    if ((v4 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  self->_responseStart = *((double *)v5 + 10);
  *(_DWORD *)&self->_flags |= 0x100u;
  v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x80) == 0)
  {
LABEL_12:
    if ((v4 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  self->_responseEnd = *((double *)v5 + 9);
  *(_DWORD *)&self->_flags |= 0x80u;
  v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x1000) == 0)
  {
LABEL_13:
    if ((v4 & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  self->_protocolName = *((_DWORD *)v5 + 27);
  *(_DWORD *)&self->_flags |= 0x1000u;
  v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x8000) == 0)
  {
LABEL_14:
    if ((v4 & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  self->_proxyConnection = *((_BYTE *)v5 + 117);
  *(_DWORD *)&self->_flags |= 0x8000u;
  v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x10000) == 0)
  {
LABEL_15:
    if ((v4 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  self->_reusedConnection = *((_BYTE *)v5 + 118);
  *(_DWORD *)&self->_flags |= 0x10000u;
  v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x2000) == 0)
  {
LABEL_16:
    if ((v4 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  self->_resourceFetchType = *((_DWORD *)v5 + 28);
  *(_DWORD *)&self->_flags |= 0x2000u;
  v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x4000) == 0)
  {
LABEL_17:
    if ((v4 & 0x800) == 0)
      goto LABEL_18;
LABEL_37:
    self->_multipathServiceType = *((_DWORD *)v5 + 26);
    *(_DWORD *)&self->_flags |= 0x800u;
    if ((*((_DWORD *)v5 + 30) & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_36:
  self->_isMultipath = *((_BYTE *)v5 + 116);
  *(_DWORD *)&self->_flags |= 0x4000u;
  v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x800) != 0)
    goto LABEL_37;
LABEL_18:
  if ((v4 & 0x20000) != 0)
  {
LABEL_19:
    self->_usedCellular = *((_BYTE *)v5 + 119);
    *(_DWORD *)&self->_flags |= 0x20000u;
  }
LABEL_20:

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOClientNetworkTransactionMetrics readAll:](self, "readAll:", 0);
}

@end
