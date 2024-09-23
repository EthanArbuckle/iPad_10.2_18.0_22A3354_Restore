@implementation GEORRRequestResponseEvent

- (GEORRRequestResponseEvent)init
{
  GEORRRequestResponseEvent *v2;
  GEORRRequestResponseEvent *v3;
  GEORRRequestResponseEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORRRequestResponseEvent;
  v2 = -[GEORRRequestResponseEvent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORRRequestResponseEvent)initWithData:(id)a3
{
  GEORRRequestResponseEvent *v3;
  GEORRRequestResponseEvent *v4;
  GEORRRequestResponseEvent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORRRequestResponseEvent;
  v3 = -[GEORRRequestResponseEvent initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)eventType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_eventType;
  else
    return 0;
}

- (void)setEventType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 514;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasEventType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C02A18[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Request")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Response")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)requestType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_requestType;
  else
    return 0;
}

- (void)setRequestType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_requestType = a3;
}

- (void)setHasRequestType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 516;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasRequestType
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)requestTypeAsString:(int)a3
{
  __CFString *v3;
  id result;

  switch(a3)
  {
    case 1005:
      v3 = CFSTR("GEOPlaceSearchFeedback");
      goto LABEL_3;
    case 1006:
    case 1007:
    case 1008:
    case 1011:
    case 1012:
    case 1018:
    case 1019:
    case 1020:
    case 1022:
    case 1023:
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_3:
      result = v3;
      break;
    case 1009:
      result = CFSTR("GEORPProblemCollection");
      break;
    case 1010:
      result = CFSTR("GEORPProblemStatus");
      break;
    case 1013:
      result = CFSTR("GEORPProblemOptIn");
      break;
    case 1014:
      result = CFSTR("GEORPProblem");
      break;
    case 1015:
      result = CFSTR("GEORPFeedback");
      break;
    case 1016:
      result = CFSTR("GEOABAssignment");
      break;
    case 1017:
      result = CFSTR("GEOLogCollection");
      break;
    case 1021:
      result = CFSTR("GEOSpatialLookupBatch");
      break;
    case 1024:
      result = CFSTR("GEOImageService");
      break;
    case 1025:
      result = CFSTR("GEOWiFiQualityService");
      break;
    case 1026:
      result = CFSTR("GEOTransitRouteUpdate");
      break;
    case 1027:
      result = CFSTR("GEOAddressCorrectionTaggedLocation");
      break;
    case 1028:
      result = CFSTR("GEOPBOfflineDataKeys");
      break;
    default:
      switch(a3)
      {
        case '+':
          result = CFSTR("GEOPlaceSearch");
          break;
        case ',':
          result = CFSTR("GEODirections");
          break;
        case '-':
        case '/':
        case '3':
        case '7':
        case '8':
        case '9':
        case ';':
          goto LABEL_9;
        case '.':
          result = CFSTR("GEOLocationShift");
          break;
        case '0':
          result = CFSTR("GEOETATrafficUpdate");
          break;
        case '1':
          result = CFSTR("GEOBatchRevGeocode");
          break;
        case '2':
          result = CFSTR("GEOPolyLocationShift");
          break;
        case '4':
          result = CFSTR("GEOETA");
          break;
        case '5':
          result = CFSTR("GEOAddressCorrectionInit");
          break;
        case '6':
          result = CFSTR("GEOAddressCorrectionUpdate");
          break;
        case ':':
          result = CFSTR("GEOBusinessResolution");
          break;
        case '<':
          result = CFSTR("GEOPDPlace");
          break;
        default:
          if (a3)
            goto LABEL_9;
          result = CFSTR("Unknown");
          break;
      }
      break;
  }
  return result;
}

- (int)StringAsRequestType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOPlaceSearch")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEODirections")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOLocationShift")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOETATrafficUpdate")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOBatchRevGeocode")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOPolyLocationShift")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOETA")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOAddressCorrectionInit")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOAddressCorrectionUpdate")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOBusinessResolution")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOPDPlace")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOPlaceSearchFeedback")) & 1) != 0)
  {
    v4 = 1005;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEORPProblemCollection")) & 1) != 0)
  {
    v4 = 1009;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEORPProblemStatus")) & 1) != 0)
  {
    v4 = 1010;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEORPProblemOptIn")) & 1) != 0)
  {
    v4 = 1013;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEORPProblem")) & 1) != 0)
  {
    v4 = 1014;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEORPFeedback")) & 1) != 0)
  {
    v4 = 1015;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOABAssignment")) & 1) != 0)
  {
    v4 = 1016;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOLogCollection")) & 1) != 0)
  {
    v4 = 1017;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOSpatialLookupBatch")) & 1) != 0)
  {
    v4 = 1021;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOImageService")) & 1) != 0)
  {
    v4 = 1024;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOWiFiQualityService")) & 1) != 0)
  {
    v4 = 1025;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitRouteUpdate")) & 1) != 0)
  {
    v4 = 1026;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOAddressCorrectionTaggedLocation")) & 1) != 0)
  {
    v4 = 1027;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GEOPBOfflineDataKeys")))
  {
    v4 = 1028;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readEventId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORRRequestResponseEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEventId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasEventId
{
  -[GEORRRequestResponseEvent _readEventId]((uint64_t)self);
  return self->_eventId != 0;
}

- (NSString)eventId
{
  -[GEORRRequestResponseEvent _readEventId]((uint64_t)self);
  return self->_eventId;
}

- (void)setEventId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_eventId, a3);
}

- (void)_readUrl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORRRequestResponseEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUrl_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasUrl
{
  -[GEORRRequestResponseEvent _readUrl]((uint64_t)self);
  return self->_url != 0;
}

- (NSString)url
{
  -[GEORRRequestResponseEvent _readUrl]((uint64_t)self);
  return self->_url;
}

- (void)setUrl:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_url, a3);
}

- (BOOL)withARPC
{
  return self->_withARPC;
}

- (void)setWithARPC:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  self->_withARPC = a3;
}

- (void)setHasWithARPC:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 520;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasWithARPC
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)_readError
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORRRequestResponseEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readError_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasError
{
  -[GEORRRequestResponseEvent _readError]((uint64_t)self);
  return self->_error != 0;
}

- (NSString)error
{
  -[GEORRRequestResponseEvent _readError]((uint64_t)self);
  return self->_error;
}

- (void)setError:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)_readEncoded
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORRRequestResponseEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEncoded_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasEncoded
{
  -[GEORRRequestResponseEvent _readEncoded]((uint64_t)self);
  return self->_encoded != 0;
}

- (NSData)encoded
{
  -[GEORRRequestResponseEvent _readEncoded]((uint64_t)self);
  return self->_encoded;
}

- (void)setEncoded:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_encoded, a3);
}

- (void)_readAppId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORRRequestResponseEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasAppId
{
  -[GEORRRequestResponseEvent _readAppId]((uint64_t)self);
  return self->_appId != 0;
}

- (NSString)appId
{
  -[GEORRRequestResponseEvent _readAppId]((uint64_t)self);
  return self->_appId;
}

- (void)setAppId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_appId, a3);
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
  v8.super_class = (Class)GEORRRequestResponseEvent;
  -[GEORRRequestResponseEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORRRequestResponseEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORRRequestResponseEvent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  int v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_WORD *)(a1 + 88);
    if ((v5 & 2) != 0)
    {
      v6 = *(int *)(a1 + 76);
      if (v6 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E1C02A18[v6];
      }
      if (a2)
        v8 = CFSTR("eventType");
      else
        v8 = CFSTR("event_type");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

      v5 = *(_WORD *)(a1 + 88);
    }
    if ((v5 & 4) != 0)
    {
      v9 = *(_DWORD *)(a1 + 80);
      switch(v9)
      {
        case 1005:
          v10 = CFSTR("GEOPlaceSearchFeedback");
          break;
        case 1006:
        case 1007:
        case 1008:
        case 1011:
        case 1012:
        case 1018:
        case 1019:
        case 1020:
        case 1022:
        case 1023:
LABEL_17:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 80));
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
        case 1009:
          v10 = CFSTR("GEORPProblemCollection");
          break;
        case 1010:
          v10 = CFSTR("GEORPProblemStatus");
          break;
        case 1013:
          v10 = CFSTR("GEORPProblemOptIn");
          break;
        case 1014:
          v10 = CFSTR("GEORPProblem");
          break;
        case 1015:
          v10 = CFSTR("GEORPFeedback");
          break;
        case 1016:
          v10 = CFSTR("GEOABAssignment");
          break;
        case 1017:
          v10 = CFSTR("GEOLogCollection");
          break;
        case 1021:
          v10 = CFSTR("GEOSpatialLookupBatch");
          break;
        case 1024:
          v10 = CFSTR("GEOImageService");
          break;
        case 1025:
          v10 = CFSTR("GEOWiFiQualityService");
          break;
        case 1026:
          v10 = CFSTR("GEOTransitRouteUpdate");
          break;
        case 1027:
          v10 = CFSTR("GEOAddressCorrectionTaggedLocation");
          break;
        case 1028:
          v10 = CFSTR("GEOPBOfflineDataKeys");
          break;
        default:
          switch(v9)
          {
            case '+':
              v10 = CFSTR("GEOPlaceSearch");
              break;
            case ',':
              v10 = CFSTR("GEODirections");
              break;
            case '-':
            case '/':
            case '3':
            case '7':
            case '8':
            case '9':
            case ';':
              goto LABEL_17;
            case '.':
              v10 = CFSTR("GEOLocationShift");
              break;
            case '0':
              v10 = CFSTR("GEOETATrafficUpdate");
              break;
            case '1':
              v10 = CFSTR("GEOBatchRevGeocode");
              break;
            case '2':
              v10 = CFSTR("GEOPolyLocationShift");
              break;
            case '4':
              v10 = CFSTR("GEOETA");
              break;
            case '5':
              v10 = CFSTR("GEOAddressCorrectionInit");
              break;
            case '6':
              v10 = CFSTR("GEOAddressCorrectionUpdate");
              break;
            case ':':
              v10 = CFSTR("GEOBusinessResolution");
              break;
            case '<':
              v10 = CFSTR("GEOPDPlace");
              break;
            default:
              if (v9)
                goto LABEL_17;
              v10 = CFSTR("Unknown");
              break;
          }
          break;
      }
      if (a2)
        v11 = CFSTR("requestType");
      else
        v11 = CFSTR("request_type");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

      v5 = *(_WORD *)(a1 + 88);
    }
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("timestamp"));

    }
    objc_msgSend((id)a1, "eventId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (a2)
        v14 = CFSTR("eventId");
      else
        v14 = CFSTR("event_id");
      objc_msgSend(v4, "setObject:forKey:", v13, v14);
    }

    objc_msgSend((id)a1, "url");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("url"));

    if ((*(_WORD *)(a1 + 88) & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 84));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("withARPC"));

    }
    objc_msgSend((id)a1, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("error"));

    objc_msgSend((id)a1, "encoded");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v18, "base64EncodedStringWithOptions:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("encoded"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("encoded"));
      }
    }

    objc_msgSend((id)a1, "appId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("appId"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORRRequestResponseEvent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORRRequestResponseEvent)initWithDictionary:(id)a3
{
  return (GEORRRequestResponseEvent *)-[GEORRRequestResponseEvent _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = a2;
  if (!a1)
    goto LABEL_97;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_97;
  if (a3)
    v6 = CFSTR("eventType");
  else
    v6 = CFSTR("event_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Request")) & 1) != 0)
    {
      v9 = 1;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Response")))
    {
      v9 = 2;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_18;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setEventType:", v9);
LABEL_18:

  if (a3)
    v10 = CFSTR("requestType");
  else
    v10 = CFSTR("request_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOPlaceSearch")) & 1) != 0)
    {
      v13 = 43;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEODirections")) & 1) != 0)
    {
      v13 = 44;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOLocationShift")) & 1) != 0)
    {
      v13 = 46;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOETATrafficUpdate")) & 1) != 0)
    {
      v13 = 48;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOBatchRevGeocode")) & 1) != 0)
    {
      v13 = 49;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOPolyLocationShift")) & 1) != 0)
    {
      v13 = 50;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOETA")) & 1) != 0)
    {
      v13 = 52;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOAddressCorrectionInit")) & 1) != 0)
    {
      v13 = 53;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOAddressCorrectionUpdate")) & 1) != 0)
    {
      v13 = 54;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOBusinessResolution")) & 1) != 0)
    {
      v13 = 58;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOPDPlace")) & 1) != 0)
    {
      v13 = 60;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOPlaceSearchFeedback")) & 1) != 0)
    {
      v13 = 1005;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEORPProblemCollection")) & 1) != 0)
    {
      v13 = 1009;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEORPProblemStatus")) & 1) != 0)
    {
      v13 = 1010;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEORPProblemOptIn")) & 1) != 0)
    {
      v13 = 1013;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEORPProblem")) & 1) != 0)
    {
      v13 = 1014;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEORPFeedback")) & 1) != 0)
    {
      v13 = 1015;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOABAssignment")) & 1) != 0)
    {
      v13 = 1016;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOLogCollection")) & 1) != 0)
    {
      v13 = 1017;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOSpatialLookupBatch")) & 1) != 0)
    {
      v13 = 1021;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOImageService")) & 1) != 0)
    {
      v13 = 1024;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOWiFiQualityService")) & 1) != 0)
    {
      v13 = 1025;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOTransitRouteUpdate")) & 1) != 0)
    {
      v13 = 1026;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GEOAddressCorrectionTaggedLocation")) & 1) != 0)
    {
      v13 = 1027;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("GEOPBOfflineDataKeys")))
    {
      v13 = 1028;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_78;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v11, "intValue");
LABEL_78:
    objc_msgSend(a1, "setRequestType:", v13);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTimestamp:", objc_msgSend(v14, "unsignedLongLongValue"));

  if (a3)
    v15 = CFSTR("eventId");
  else
    v15 = CFSTR("event_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(a1, "setEventId:", v17);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(a1, "setUrl:", v19);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("withARPC"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWithARPC:", objc_msgSend(v20, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("error"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(a1, "setError:", v22);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("encoded"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v23, 0);
    objc_msgSend(a1, "setEncoded:", v24);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("appId"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(a1, "setAppId:", v26);

  }
LABEL_97:

  return a1;
}

- (GEORRRequestResponseEvent)initWithJSON:(id)a3
{
  return (GEORRRequestResponseEvent *)-[GEORRRequestResponseEvent _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_2;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2;
    GEORRRequestResponseEventReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORRRequestResponseEventIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORRRequestResponseEventReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x3F0) == 0)
    {
      v6 = self->_reader;
      objc_sync_enter(v6);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "writeData:", v7);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v6);
      goto LABEL_23;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORRRequestResponseEvent readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 4) == 0)
      goto LABEL_5;
LABEL_20:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_20;
LABEL_5:
  if ((flags & 1) != 0)
LABEL_6:
    PBDataWriterWriteUint64Field();
LABEL_7:
  if (self->_eventId)
    PBDataWriterWriteStringField();
  if (self->_url)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_flags & 8) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_error)
    PBDataWriterWriteStringField();
  if (self->_encoded)
    PBDataWriterWriteDataField();
  if (self->_appId)
    PBDataWriterWriteStringField();
LABEL_23:

}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  id *v6;

  v6 = (id *)a3;
  -[GEORRRequestResponseEvent readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 16) = self->_readerMarkPos;
  *((_DWORD *)v6 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 19) = self->_eventType;
    *((_WORD *)v6 + 44) |= 2u;
    flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 20) = self->_requestType;
  *((_WORD *)v6 + 44) |= 4u;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
LABEL_4:
    v6[6] = (id)self->_timestamp;
    *((_WORD *)v6 + 44) |= 1u;
  }
LABEL_5:
  if (self->_eventId)
  {
    objc_msgSend(v6, "setEventId:");
    v4 = v6;
  }
  if (self->_url)
  {
    objc_msgSend(v6, "setUrl:");
    v4 = v6;
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_BYTE *)v4 + 84) = self->_withARPC;
    *((_WORD *)v4 + 44) |= 8u;
  }
  if (self->_error)
  {
    objc_msgSend(v6, "setError:");
    v4 = v6;
  }
  if (self->_encoded)
  {
    objc_msgSend(v6, "setEncoded:");
    v4 = v6;
  }
  if (self->_appId)
  {
    objc_msgSend(v6, "setAppId:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORRRequestResponseEventReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORRRequestResponseEvent readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 4) == 0)
      goto LABEL_7;
LABEL_14:
    *(_DWORD *)(v5 + 80) = self->_requestType;
    *(_WORD *)(v5 + 88) |= 4u;
    if ((*(_WORD *)&self->_flags & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 76) = self->_eventType;
  *(_WORD *)(v5 + 88) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_14;
LABEL_7:
  if ((flags & 1) != 0)
  {
LABEL_8:
    *(_QWORD *)(v5 + 48) = self->_timestamp;
    *(_WORD *)(v5 + 88) |= 1u;
  }
LABEL_9:
  v10 = -[NSString copyWithZone:](self->_eventId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_BYTE *)(v5 + 84) = self->_withARPC;
    *(_WORD *)(v5 + 88) |= 8u;
  }
  v14 = -[NSString copyWithZone:](self->_error, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  v16 = -[NSData copyWithZone:](self->_encoded, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  v18 = -[NSString copyWithZone:](self->_appId, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  NSString *eventId;
  NSString *url;
  __int16 v9;
  NSString *error;
  NSData *encoded;
  NSString *appId;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  -[GEORRRequestResponseEvent readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 44);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 19))
      goto LABEL_35;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_35;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_requestType != *((_DWORD *)v4 + 20))
      goto LABEL_35;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_35;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 6))
      goto LABEL_35;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_35;
  }
  eventId = self->_eventId;
  if ((unint64_t)eventId | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](eventId, "isEqual:"))
    goto LABEL_35;
  url = self->_url;
  if ((unint64_t)url | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](url, "isEqual:"))
      goto LABEL_35;
  }
  v9 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    if ((v9 & 8) != 0)
    {
      if (self->_withARPC)
      {
        if (!*((_BYTE *)v4 + 84))
          goto LABEL_35;
        goto LABEL_29;
      }
      if (!*((_BYTE *)v4 + 84))
        goto LABEL_29;
    }
LABEL_35:
    v13 = 0;
    goto LABEL_36;
  }
  if ((v9 & 8) != 0)
    goto LABEL_35;
LABEL_29:
  error = self->_error;
  if ((unint64_t)error | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](error, "isEqual:"))
    goto LABEL_35;
  encoded = self->_encoded;
  if ((unint64_t)encoded | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](encoded, "isEqual:"))
      goto LABEL_35;
  }
  appId = self->_appId;
  if ((unint64_t)appId | *((_QWORD *)v4 + 2))
    v13 = -[NSString isEqual:](appId, "isEqual:");
  else
    v13 = 1;
LABEL_36:

  return v13;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;
  NSUInteger v11;
  uint64_t v12;

  -[GEORRRequestResponseEvent readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    v4 = 0;
    if ((flags & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((flags & 1) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v4 = 2654435761 * self->_eventType;
  if ((flags & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_requestType;
  if ((flags & 1) != 0)
  {
LABEL_4:
    v6 = 2654435761u * self->_timestamp;
    goto LABEL_8;
  }
LABEL_7:
  v6 = 0;
LABEL_8:
  v7 = -[NSString hash](self->_eventId, "hash");
  v8 = -[NSString hash](self->_url, "hash");
  if ((*(_WORD *)&self->_flags & 8) != 0)
    v9 = 2654435761 * self->_withARPC;
  else
    v9 = 0;
  v10 = v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9;
  v11 = -[NSString hash](self->_error, "hash");
  v12 = v11 ^ -[NSData hash](self->_encoded, "hash");
  return v10 ^ v12 ^ -[NSString hash](self->_appId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  v5 = *((_WORD *)v6 + 44);
  if ((v5 & 2) != 0)
  {
    self->_eventType = *((_DWORD *)v6 + 19);
    *(_WORD *)&self->_flags |= 2u;
    v5 = *((_WORD *)v6 + 44);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_requestType = *((_DWORD *)v6 + 20);
  *(_WORD *)&self->_flags |= 4u;
  if ((*((_WORD *)v6 + 44) & 1) != 0)
  {
LABEL_4:
    self->_timestamp = *((_QWORD *)v6 + 6);
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_5:
  if (*((_QWORD *)v6 + 5))
  {
    -[GEORRRequestResponseEvent setEventId:](self, "setEventId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[GEORRRequestResponseEvent setUrl:](self, "setUrl:");
    v4 = v6;
  }
  if ((*((_WORD *)v4 + 44) & 8) != 0)
  {
    self->_withARPC = *((_BYTE *)v4 + 84);
    *(_WORD *)&self->_flags |= 8u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[GEORRRequestResponseEvent setError:](self, "setError:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[GEORRRequestResponseEvent setEncoded:](self, "setEncoded:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[GEORRRequestResponseEvent setAppId:](self, "setAppId:");
    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_encoded, 0);
  objc_storeStrong((id *)&self->_appId, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)decodeEvent
{
  int v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = -[GEORRRequestResponseEvent eventType](self, "eventType");
  if (v3 != 2)
  {
    if (v3 == 1)
    {
      v4 = (objc_class *)_geo_requestClassForMessageType(-[GEORRRequestResponseEvent requestType](self, "requestType"));
      if (v4)
        goto LABEL_4;
    }
LABEL_6:
    v7 = 0;
    return v7;
  }
  v4 = (objc_class *)_geo_responseClassForMessageType(-[GEORRRequestResponseEvent requestType](self, "requestType"));
  if (!v4)
    goto LABEL_6;
LABEL_4:
  v5 = [v4 alloc];
  -[GEORRRequestResponseEvent encoded](self, "encoded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithData:", v6);

  return v7;
}

@end
