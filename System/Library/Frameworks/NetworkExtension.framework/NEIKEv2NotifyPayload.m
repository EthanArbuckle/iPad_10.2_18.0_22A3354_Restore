@implementation NEIKEv2NotifyPayload

- (unint64_t)type
{
  return 41;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  __CFString *v9;
  const char *v10;
  SEL v11;
  id Property;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("Payload Type"), v5, a4);

  v9 = (__CFString *)-[NEIKEv2NotifyPayload copyTypeDescription]((const __CFString *)self);
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("Notify Type"), v5, a4);

  if (self)
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v10, 32, 1), CFSTR("Notify Data"), v5, a4);
    Property = objc_getProperty(self, v11, 40, 1);
  }
  else
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("Notify Data"), v5, a4);
    Property = 0;
  }
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("SPI"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEIKEv2NotifyPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (BOOL)hasRequiredFields
{
  if (self)
    LOBYTE(self) = self->_notifyType != 0;
  return (char)self;
}

- (BOOL)generatePayloadData
{
  const char *v3;
  const char *v4;
  unint64_t notifyType;
  id Property;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;
  id v11;
  char isKindOfClass;
  const char *v13;
  id v14;
  void *v15;
  uint64_t *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  char v21;
  const char *v22;
  id v23;
  uint64_t v24;
  const char *v25;
  SEL v26;
  id v27;
  NSObject *v29;
  uint64_t v30;
  int v31;

  if (self)
  {
    if (objc_getProperty(self, a2, 16, 1))
      goto LABEL_23;
    if (-[NEIKEv2NotifyPayload hasRequiredFields](self, "hasRequiredFields"))
    {
      notifyType = self->_notifyType;
      LOWORD(v31) = 0;
      HIWORD(v31) = bswap32(notifyType) >> 16;
      Property = objc_getProperty(self, v4, 32, 1);
      v7 = (unsigned __int16)notifyType;
LABEL_5:
      v9 = objc_msgSend(Property, "length");
      if (self)
        v10 = objc_getProperty(self, v8, 40, 1);
      else
        v10 = 0;
      v11 = v10;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        if (self)
          v14 = objc_getProperty(self, v13, 40, 1);
        else
          v14 = 0;
        v30 = objc_msgSend(v14, "value");
        LOWORD(v31) = 2049;
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v9 + 12, v30);
        objc_msgSend(v15, "appendBytes:length:", &v31, 4);
        v16 = &v30;
        v17 = v15;
        v18 = 8;
      }
      else
      {
        if (self)
          v19 = objc_getProperty(self, v13, 40, 1);
        else
          v19 = 0;
        v20 = v19;
        objc_opt_class();
        v21 = objc_opt_isKindOfClass();

        if ((v21 & 1) != 0)
        {
          if (self)
            v23 = objc_getProperty(self, v22, 40, 1);
          else
            v23 = 0;
          LODWORD(v30) = objc_msgSend(v23, "value");
          LOWORD(v31) = 1027;
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v9 + 8, v30);
          objc_msgSend(v15, "appendBytes:length:", &v31, 4);
          v16 = &v30;
          v17 = v15;
        }
        else
        {
          v24 = v9 + 4;
          if (v7 == 16418)
            LOBYTE(v31) = 1;
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v24);
          v15 = v17;
          v16 = (uint64_t *)&v31;
        }
        v18 = 4;
      }
      objc_msgSend(v17, "appendBytes:length:", v16, v18);
      if (!self)
      {
        objc_msgSend(v15, "appendData:", 0);

        v27 = 0;
        return v27 != 0;
      }
      objc_msgSend(v15, "appendData:", objc_getProperty(self, v25, 32, 1));
      objc_setProperty_atomic(self, v26, v15, 16);

LABEL_23:
      v27 = objc_getProperty(self, v3, 16, 1);
      return v27 != 0;
    }
  }
  else if ((objc_msgSend(0, "hasRequiredFields") & 1) != 0)
  {
    v7 = 0;
    Property = 0;
    v31 = 0;
    goto LABEL_5;
  }
  ne_log_obj();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v30) = 0;
    _os_log_error_impl(&dword_19BD16000, v29, OS_LOG_TYPE_ERROR, "Notify payload missing required fields", (uint8_t *)&v30, 2u);
  }

  return 0;
}

- (BOOL)parsePayloadData
{
  const char *v3;
  const char *v4;
  NSObject *v5;
  const char *v7;
  unint64_t v8;
  const char *v9;
  NSObject *p_super;
  const char *v11;
  unsigned int v12;
  const char *v13;
  unint64_t v14;
  const char *v15;
  NEIKEv2ESPSPI *v16;
  NEIKEv2ESPSPI *v17;
  const char *v18;
  NEIKEv2IKESPI *v19;
  unint64_t v20;
  const char *v21;
  id v22;
  uint64_t v23;
  SEL v24;
  id v25;
  uint64_t v26;
  void *v27;
  SEL v28;
  int v29;
  unsigned int buf[6];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!self || !objc_getProperty(self, a2, 16, 1))
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      buf[0] = 136315138;
      *(_QWORD *)&buf[1] = "-[NEIKEv2NotifyPayload parsePayloadData]";
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, "%s called with null self.payloadData", (uint8_t *)buf, 0xCu);
    }
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(objc_getProperty(self, v3, 16, 1), "length") <= 3)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      buf[0] = 136315138;
      *(_QWORD *)&buf[1] = "-[NEIKEv2NotifyPayload parsePayloadData]";
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "BACKTRACE %s called with null (self.payloadData.length >= sizeof(ikev2_payload_notify_hdr_t))", (uint8_t *)buf, 0xCu);
    }
LABEL_8:

    return 0;
  }
  v29 = 0;
  objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v29, 4);
  self->_notifyType = bswap32(HIWORD(v29)) >> 16;
  if (v29 == 3)
  {
    if (BYTE1(v29) != 4)
    {
      ne_log_obj();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        buf[0] = 67109120;
        buf[1] = BYTE1(v29);
        v13 = "Invalid Notify ESP SPI length %u";
        goto LABEL_24;
      }
      goto LABEL_28;
    }
    v14 = objc_msgSend(objc_getProperty(self, v7, 16, 1), "length");
    if (v14 < (unint64_t)BYTE1(v29) + 4)
    {
      ne_log_obj();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      goto LABEL_28;
    }
    buf[0] = 0;
    objc_msgSend(objc_getProperty(self, v15, 16, 1), "getBytes:range:", buf, 4, 4);
    v16 = [NEIKEv2ESPSPI alloc];
    v17 = -[NEIKEv2ESPSPI initWithValue:](v16, "initWithValue:", buf[0]);
LABEL_27:
    p_super = &v17->super.super;
    objc_setProperty_atomic(self, v18, v17, 40);
    goto LABEL_28;
  }
  if (v29 != 1 || !BYTE1(v29))
    goto LABEL_29;
  if (BYTE1(v29) != 8)
  {
    ne_log_obj();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      buf[0] = 67109120;
      buf[1] = BYTE1(v29);
      v13 = "Invalid Notify IKE SPI length %u";
      goto LABEL_24;
    }
    goto LABEL_28;
  }
  v8 = objc_msgSend(objc_getProperty(self, v7, 16, 1), "length");
  if (v8 >= (unint64_t)BYTE1(v29) + 4)
  {
    *(_QWORD *)buf = 0;
    objc_msgSend(objc_getProperty(self, v9, 16, 1), "getBytes:range:", buf, 4, 8);
    v19 = [NEIKEv2IKESPI alloc];
    v17 = -[NEIKEv2IKESPI initWithValue:](v19, "initWithValue:", *(_QWORD *)buf);
    goto LABEL_27;
  }
  ne_log_obj();
  p_super = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
  {
LABEL_15:
    v12 = objc_msgSend(objc_getProperty(self, v11, 16, 1), "length");
    buf[0] = 67109120;
    buf[1] = v12;
    v13 = "Invalid Notify payload length %u cannot hold SPI";
LABEL_24:
    _os_log_error_impl(&dword_19BD16000, p_super, OS_LOG_TYPE_ERROR, v13, (uint8_t *)buf, 8u);
  }
LABEL_28:

LABEL_29:
  v20 = objc_msgSend(objc_getProperty(self, v7, 16, 1), "length");
  if (v20 > (unint64_t)BYTE1(v29) + 4)
  {
    v22 = objc_getProperty(self, v21, 16, 1);
    v23 = BYTE1(v29);
    v25 = objc_getProperty(self, v24, 16, 1);
    v26 = objc_msgSend(v25, "length");
    objc_msgSend(v22, "subdataWithRange:", v23 + 4, v26 - BYTE1(v29) - 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_setProperty_atomic(self, v28, v27, 32);
  }
  return -[NEIKEv2NotifyPayload hasRequiredFields](self, "hasRequiredFields");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spi, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (const)copyTypeDescription
{
  const __CFString *v1;
  uint64_t length;

  if (result)
  {
    v1 = result;
    length = result->length;
    if (length <= 41040)
    {
      switch(length)
      {
        case 16384:
          result = CFSTR("InitialContact");
          break;
        case 16385:
          result = CFSTR("SetWindowSize");
          break;
        case 16386:
          result = CFSTR("AdditionalTSPossible");
          break;
        case 16387:
          result = CFSTR("IPCOMPSupported");
          break;
        case 16388:
          result = CFSTR("NATDetectionSourceIP");
          break;
        case 16389:
          result = CFSTR("NATDetectionDestinationIP");
          break;
        case 16390:
          result = CFSTR("Cookie");
          break;
        case 16391:
          result = CFSTR("UseTransportMode");
          break;
        case 16392:
          result = CFSTR("HTTPCertLookupSupported");
          break;
        case 16393:
          result = CFSTR("RekeySA");
          break;
        case 16394:
          result = CFSTR("ESPTFCPaddingNotSupported");
          break;
        case 16395:
          result = CFSTR("NonFirstFragmentsAlso");
          break;
        case 16396:
          result = CFSTR("MOBIKESupported");
          break;
        case 16397:
          result = CFSTR("AdditionalIP4Address");
          break;
        case 16398:
          result = CFSTR("AdditionalIP6Address");
          break;
        case 16399:
          result = CFSTR("NoAdditionalAddresses");
          break;
        case 16400:
          result = CFSTR("UpdateSAAddresses");
          break;
        case 16401:
          result = CFSTR("Cookie2");
          break;
        case 16402:
          result = CFSTR("NoNATSAllowed");
          break;
        case 16403:
          result = CFSTR("AuthLifetime");
          break;
        case 16404:
          result = CFSTR("MultipleAuthSupported");
          break;
        case 16405:
          result = CFSTR("AnotherAuthFollows");
          break;
        case 16406:
          result = CFSTR("RedirectSupported");
          break;
        case 16407:
          result = CFSTR("ServerRedirect");
          break;
        case 16408:
          result = CFSTR("RedirectedFrom");
          break;
        case 16409:
        case 16410:
        case 16411:
        case 16412:
        case 16413:
        case 16414:
        case 16415:
        case 16416:
        case 16419:
        case 16420:
        case 16421:
        case 16422:
        case 16423:
        case 16425:
        case 16426:
        case 16427:
        case 16428:
        case 16429:
        case 16432:
        case 16433:
        case 16434:
        case 16439:
        case 16440:
          return (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%u"), v1->length);
        case 16417:
          result = CFSTR("EAPOnlyAuthentication");
          break;
        case 16418:
          result = CFSTR("ChildlessIKEv2Supported");
          break;
        case 16424:
          result = CFSTR("SecurePasswordMethods");
          break;
        case 16430:
          result = CFSTR("IKEv2FragmentationSupported");
          break;
        case 16431:
          result = CFSTR("SignatureHashAlgorithms");
          break;
        case 16435:
          result = CFSTR("UsePPK");
          break;
        case 16436:
          result = CFSTR("PPKIdentity");
          break;
        case 16437:
          result = CFSTR("NoPPKAuth");
          break;
        case 16438:
          result = CFSTR("IntermediateExchangeSupported");
          break;
        case 16441:
          result = CFSTR("AdditionalKeyExchange");
          break;
        default:
          result = CFSTR("None");
          switch(length)
          {
            case 0:
              return result;
            case 1:
              result = CFSTR("UnsupportedCriticalPayload");
              break;
            case 2:
            case 3:
            case 6:
            case 8:
            case 10:
            case 12:
            case 13:
            case 15:
            case 16:
            case 18:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
            case 25:
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
            case 42:
            case 45:
            case 46:
              return (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%u"), v1->length);
            case 4:
              result = CFSTR("InvalidIKESPI");
              break;
            case 5:
              result = CFSTR("InvalidMajorVersion");
              break;
            case 7:
              result = CFSTR("InvalidSyntax");
              break;
            case 9:
              result = CFSTR("InvalidMessageID");
              break;
            case 11:
              result = CFSTR("InvalidSPI");
              break;
            case 14:
              result = CFSTR("NoProposalChosen");
              break;
            case 17:
              result = CFSTR("InvalidKEPayload");
              break;
            case 24:
              result = CFSTR("AuthenticationFailed");
              break;
            case 34:
              result = CFSTR("SinglePairRequired");
              break;
            case 35:
              result = CFSTR("NoAdditionalSAs");
              break;
            case 36:
              result = CFSTR("InternalAddressFailure");
              break;
            case 37:
              result = CFSTR("FailedCPRequired");
              break;
            case 38:
              result = CFSTR("TSUnacceptable");
              break;
            case 39:
              result = CFSTR("InvalidSelectors");
              break;
            case 40:
              result = CFSTR("UnacceptableAddresses");
              break;
            case 41:
              result = CFSTR("UnexpectedNATDetected");
              break;
            case 43:
              result = CFSTR("TemporaryFailure");
              break;
            case 44:
              result = CFSTR("ChildSANotFound");
              break;
            case 47:
              result = CFSTR("StateNotFound");
              break;
            default:
              if (length != 10500)
                return (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%u"), v1->length);
              result = CFSTR("NetworkFailure");
              break;
          }
          break;
      }
    }
    else
    {
      if (length <= 49999)
      {
        if (length == 41041)
          return CFSTR("BackoffTimer");
        if (length == 41101)
          return CFSTR("DeviceIdentity");
      }
      else
      {
        switch(length)
        {
          case 50000:
            return CFSTR("SequencePerTrafficClass");
          case 51015:
            return CFSTR("N1ModeCapability");
          case 51115:
            return CFSTR("N1ModeInformation");
        }
      }
      return (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%u"), v1->length);
    }
  }
  return result;
}

+ (id)copyTypeDescription
{
  return CFSTR("Notify");
}

+ (NEIKEv2NotifyPayload)createNotifyPayloadType:
{
  NEIKEv2NotifyPayload *result;

  objc_opt_self();
  result = objc_alloc_init(NEIKEv2NotifyPayload);
  if (result)
    result->_notifyType = 50000;
  return result;
}

+ (NEIKEv2NotifyPayload)createNotifyPayloadType:(void *)a3 data:
{
  id v4;
  NEIKEv2NotifyPayload *v5;
  const char *v6;
  NEIKEv2NotifyPayload *v7;

  v4 = a3;
  objc_opt_self();
  v5 = objc_alloc_init(NEIKEv2NotifyPayload);
  v7 = v5;
  if (v5)
  {
    v5->_notifyType = a2;
    objc_setProperty_atomic(v5, v6, v4, 32);
  }

  return v7;
}

- (const)copyError
{
  const __CFString *v1;
  id v2;
  uint64_t length;
  __CFString *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v1 = a1;
  v8[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((unint64_t)(a1->length - 1) > 0x3FFE)
    {
      return 0;
    }
    else
    {
      v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
      length = v1->length;
      v7 = *MEMORY[0x1E0CB2938];
      v4 = (__CFString *)-[NEIKEv2NotifyPayload copyTypeDescription](v1);
      v8[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = (const __CFString *)objc_msgSend(v2, "initWithDomain:code:userInfo:", CFSTR("NEIKEv2ProtocolErrorDomain"), length, v5);

    }
  }
  return v1;
}

- (_QWORD)copyServerRedirectNonce
{
  _QWORD *v2;
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  int v12;
  int v13;
  _DWORD v14[7];

  v2 = self;
  *(_QWORD *)&v14[5] = *MEMORY[0x1E0C80C00];
  if (self)
  {
    if (self[3] != 16407)
    {
      ne_log_obj();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        *(_QWORD *)v14 = v2;
        _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "BACKTRACE Cannot copy server redirect nonce from notification %@", (uint8_t *)&v13, 0xCu);
      }
      goto LABEL_16;
    }
    v3 = objc_getProperty(self, a2, 32, 1);
    if ((unint64_t)-[NSObject length](v3, "length") > 1)
    {
      v8 = -[NSObject bytes](v3, "bytes");
      if (-[NSObject length](v3, "length") - 2 < (unint64_t)*(unsigned __int8 *)(v8 + 1))
      {
        ne_log_obj();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v11 = -[NSObject length](v3, "length");
          v12 = *(unsigned __int8 *)(v8 + 1);
          v13 = 67109376;
          v14[0] = v11;
          LOWORD(v14[1]) = 1024;
          *(_DWORD *)((char *)&v14[1] + 2) = v12;
          _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "Server redirect has invalid length %u (gateway length %u)", (uint8_t *)&v13, 0xEu);
        }

        goto LABEL_16;
      }
      if (-[NSObject length](v3, "length") != *(unsigned __int8 *)(v8 + 1) + 2)
      {
        v2 = (_QWORD *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v8 + *(unsigned __int8 *)(v8 + 1) + 2, -[NSObject length](v3, "length") - *(unsigned __int8 *)(v8 + 1) - 2);
        goto LABEL_17;
      }
      ne_log_obj();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13) = 0;
        v5 = "Server redirect has no nonce";
        v6 = v4;
        v7 = 2;
        goto LABEL_6;
      }
    }
    else
    {
      ne_log_obj();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v13 = 134217984;
        *(_QWORD *)v14 = -[NSObject length](v3, "length");
        v5 = "Server redirect has invalid length %llu";
        v6 = v4;
        v7 = 12;
LABEL_6:
        _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v13, v7);
      }
    }

LABEL_16:
    v2 = 0;
LABEL_17:

  }
  return v2;
}

- (uint64_t)getPPKIDType
{
  const char *v3;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*((_QWORD *)self + 3) == 16436)
  {
    if (objc_msgSend(objc_getProperty(self, a2, 32, 1), "length"))
    {
      LOBYTE(v6) = 0;
      objc_msgSend(objc_getProperty(self, v3, 32, 1), "getBytes:length:", &v6, 1);
      return v6;
    }
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "Cannot get PPK ID type from too short notification %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, "Cannot get PPK ID type from notification %@", (uint8_t *)&v6, 0xCu);
    }
  }

  return 0;
}

- (uint64_t)copyPPKID
{
  const char *v3;
  id v4;
  SEL v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  _QWORD *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self[3] != 16436)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_fault_impl(&dword_19BD16000, v7, OS_LOG_TYPE_FAULT, "Cannot copy PPK ID from notification %@", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_8;
  }
  if (!objc_msgSend(objc_getProperty(self, a2, 32, 1), "length"))
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "Cannot copy PPK ID from too short notification %@", (uint8_t *)&v9, 0xCu);
    }
LABEL_8:

    return 0;
  }
  v4 = objc_getProperty(self, v3, 32, 1);
  objc_msgSend(v4, "subdataWithRange:", 1, objc_msgSend(objc_getProperty(self, v5, 32, 1), "length") - 1);
  v6 = objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
