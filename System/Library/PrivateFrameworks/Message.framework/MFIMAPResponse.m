@implementation MFIMAPResponse

- (int64_t)responseType
{
  return *((char *)self + 8);
}

- (void)setResponseType:(int64_t)a3
{
  *((_BYTE *)self + 8) = a3;
}

- (BOOL)isUntagged
{
  return *((_BYTE *)self + 8) != 1 && self->_tag == 0;
}

- (BOOL)isAlertResponse
{
  return -[MFIMAPResponse isResponseWithCode:](self, "isResponseWithCode:", 1);
}

- (BOOL)isResponseWithCode:(int64_t)a3
{
  return (*((char *)self + 8) - 2) <= 4 && self->_data.basic.responseCode == a3;
}

- (id)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{

  self->_tag = (NSString *)a3;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  v3 = 40;
  switch(*((_BYTE *)self + 8))
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 0x11:
      goto LABEL_6;
    case 7:
    case 8:
    case 0xC:
    case 0xE:
    case 0x15:
      v3 = 32;
      goto LABEL_6;
    case 0xD:
    case 0x12:
    case 0x13:
    case 0x17:
    case 0x18:

      v3 = 40;
      goto LABEL_6;
    case 0xF:
    case 0x10:
      goto LABEL_5;
    case 0x16:

LABEL_5:
      v3 = 48;
LABEL_6:

      break;
    default:
      break;
  }

  v4.receiver = self;
  v4.super_class = (Class)MFIMAPResponse;
  -[MFIMAPResponse dealloc](&v4, sel_dealloc);
}

- (int64_t)responseCode
{
  if ((*((char *)self + 8) - 1) <= 5)
    return self->_data.basic.responseCode;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 296, CFSTR("%@ is invalid for %s"), NSStringFromSelector(a2), ResponseTypeTable[4 * *((char *)self + 8) + 1]);
  return 0;
}

- (id)responseInfo
{
  if ((*((char *)self + 8) - 1) > 5)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 316, CFSTR("%@ is invalid for %s"), NSStringFromSelector(a2), ResponseTypeTable[4 * *((char *)self + 8) + 1]);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (id)objc_msgSend(self->_data.basic.responseInfoAndOrUserData, "objectAtIndex:", 0);
  }
  return 0;
}

- (id)userData
{
  char isKindOfClass;
  id result;

  if ((*((char *)self + 8) - 1) > 5)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 336, CFSTR("%@ is invalid for %s"), NSStringFromSelector(a2), ResponseTypeTable[4 * *((char *)self + 8) + 1]);
    return 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    result = self->_data.basic.responseInfoAndOrUserData;
    if ((isKindOfClass & 1) != 0)
      return (id)objc_msgSend(result, "objectAtIndex:", 1);
  }
  return result;
}

- (id)userString
{
  id v2;
  void *v3;

  v2 = -[MFIMAPResponse userData](self, "userData");
  if (v2)
  {
    v3 = v2;
    v2 = (id)MFCreateStringWithData();
    if (!v2)
      v2 = (id)CFStringCreateWithBytes(0, (const UInt8 *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), 0x600u, 0);
  }
  return v2;
}

- (void)setUserData:(id)a3 responseCode:(int64_t)a4 responseInfo:(id)a5
{
  id v7;
  id responseInfoAndOrUserData;
  id v9;
  id v10;

  if ((*((char *)self + 8) - 1) > 5)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 373, CFSTR("%@ is invalid for %s"), NSStringFromSelector(a2), ResponseTypeTable[4 * *((char *)self + 8) + 1]);
    return;
  }
  v7 = a3;
  self->_data.basic.responseCode = a4;
  if (objc_msgSend(MEMORY[0x1E0D46048], "isValidBase64:"))
    v7 = (id)objc_msgSend(v7, "mf_decodeBase64");
  responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (a5)
  {

    v9 = objc_allocWithZone(MEMORY[0x1E0C99D20]);
    if (!v7)
      v7 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v10 = (id)objc_msgSend(v9, "initWithObjects:", a5, v7, 0);
  }
  else
  {
    if (responseInfoAndOrUserData == v7)
      return;

    v10 = v7;
  }
  self->_data.basic.responseInfoAndOrUserData = v10;
}

- (id)capabilities
{
  if (*((_BYTE *)self + 8) != 7)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 379, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  return self->_data.capabilities;
}

- (void)setCapabilities:(id)a3
{
  NSArray *capabilities;

  if (*((_BYTE *)self + 8) != 7)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 384, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)a3;
  }
}

- (id)serverInfo
{
  int v3;

  v3 = *((unsigned __int8 *)self + 8);
  if (v3 != 8 && v3 != 21)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 393, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  return self->_data.capabilities;
}

- (void)setServerInfo:(id)a3
{
  int v5;
  NSArray *capabilities;

  v5 = *((unsigned __int8 *)self + 8);
  if (v5 != 8 && v5 != 21)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 398, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)a3;
  }
}

- (unint64_t)number
{
  int v2;

  v2 = *((char *)self + 8);
  if ((v2 - 9) < 3 || v2 == 17)
    return self->_data.number;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 416, CFSTR("%@ is invalid for %s"), NSStringFromSelector(a2), ResponseTypeTable[4 * *((char *)self + 8) + 1]);
  return 0;
}

- (void)setNumber:(unint64_t)a3
{
  int v3;

  v3 = *((char *)self + 8);
  if ((v3 - 9) < 3 || v3 == 17)
    self->_data.basic.responseCode = a3;
  else
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 433, CFSTR("%@ is invalid for %s"), NSStringFromSelector(a2), ResponseTypeTable[4 * *((char *)self + 8) + 1]);
}

- (id)flags
{
  if (*((_BYTE *)self + 8) != 12)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 440, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  return self->_data.capabilities;
}

- (void)setFlags:(id)a3
{
  NSArray *capabilities;

  if (*((_BYTE *)self + 8) != 12)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 446, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)createFixedMutableArray(a3);
  }
}

- (id)mailboxName
{
  int v3;
  id result;
  char isKindOfClass;

  v3 = *((char *)self + 8);
  if ((v3 - 15) >= 2)
  {
    if (v3 == 13 || v3 == 18)
      return self->_data.capabilities;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 476, CFSTR("%@ is invalid for %s"), NSStringFromSelector(a2), ResponseTypeTable[4 * *((char *)self + 8) + 1]);
    return 0;
  }
  if (!self->_data.basic.responseInfoAndOrUserData)
    return 0;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  result = self->_data.basic.responseInfoAndOrUserData;
  if ((isKindOfClass & 1) != 0)
    return (id)objc_msgSend(result, "objectAtIndex:", 1);
  return result;
}

- (id)statusEntries
{
  if (*((_BYTE *)self + 8) != 13)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 484, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  return self->_data.basic.responseInfoAndOrUserData;
}

- (void)setMailboxName:(id)a3 statusEntries:(id)a4
{
  NSArray *capabilities;
  id responseInfoAndOrUserData;
  CFIndex v9;
  CFMutableDictionaryRef MutableCopy;

  if (*((_BYTE *)self + 8) != 13)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 489, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)a3;
  }
  responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (responseInfoAndOrUserData != a4)
  {

    v9 = objc_msgSend(a4, "count");
    if (v9)
    {
      MutableCopy = CFDictionaryCreateMutableCopy(0, v9, (CFDictionaryRef)a4);
    }
    else if (a4)
    {
      MutableCopy = (CFMutableDictionaryRef)(id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    }
    else
    {
      MutableCopy = 0;
    }
    self->_data.basic.responseInfoAndOrUserData = MutableCopy;
  }
}

- (id)searchResults
{
  if (*((_BYTE *)self + 8) != 14)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 502, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  return self->_data.capabilities;
}

- (void)setSearchResults:(id)a3
{
  NSArray *capabilities;

  if (*((_BYTE *)self + 8) != 14)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 507, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)createFixedMutableArray(a3);
  }
}

- (unint64_t)mailboxAttributes
{
  if ((unint64_t)(*((char *)self + 8) - 15) >= 2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 522, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  return self->_data.number;
}

- (id)separator
{
  if ((unint64_t)(*((char *)self + 8) - 15) >= 2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 527, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  if (self->_data.basic.responseInfoAndOrUserData && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    return (id)objc_msgSend(self->_data.basic.responseInfoAndOrUserData, "objectAtIndex:", 0);
  else
    return 0;
}

- (void)setMailboxAttributes:(unint64_t)a3 separator:(id)a4 mailboxName:(id)a5 extraAttributes:(id)a6
{
  id responseInfoAndOrUserData;
  CFArrayRef v12;
  NSArray *var0;
  void *values[3];

  values[2] = *(void **)MEMORY[0x1E0C80C00];
  if ((unint64_t)(*((char *)self + 8) - 15) >= 2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 536, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  self->_data.basic.responseCode = a3;
  responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (responseInfoAndOrUserData != a5)
  {

    if (a4)
    {
      values[0] = a4;
      values[1] = a5;
      v12 = CFArrayCreate(0, (const void **)values, 2, MEMORY[0x1E0C9B378]);
    }
    else
    {
      v12 = (CFArrayRef)a5;
    }
    self->_data.basic.responseInfoAndOrUserData = v12;
  }
  var0 = self->_data.list.var0;
  if (var0 != a6)
  {

    self->_data.fetch.modSeqNumber = (unint64_t)a6;
  }
}

- (id)extraAttributes
{
  return self->_data.list.var0;
}

- (id)fetchResultWithType:(int64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = -[MFIMAPResponse fetchResults](self, "fetchResults");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(v9, "type") == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)fetchResults
{
  char *v3;
  NSObject *v4;

  v3 = (char *)self + 8;
  if (*((_BYTE *)self + 8) != 17)
  {
    v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[MFIMAPResponse fetchResults].cold.2(v3, v4);
    if (*v3 != 17)
      -[MFIMAPResponse fetchResults].cold.1();
  }
  return self->_data.basic.responseInfoAndOrUserData;
}

- (void)setFetchResults:(id)a3
{
  id responseInfoAndOrUserData;

  if (*((_BYTE *)self + 8) != 17)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 586, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (responseInfoAndOrUserData != a3)
  {

    self->_data.basic.responseInfoAndOrUserData = createFixedMutableArray(a3);
  }
}

- (id)quotaRootNames
{
  if (*((_BYTE *)self + 8) != 18)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 597, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  return self->_data.basic.responseInfoAndOrUserData;
}

- (void)setMailboxName:(id)a3 quotaRootNames:(id)a4
{
  NSArray *capabilities;
  id responseInfoAndOrUserData;

  if (*((_BYTE *)self + 8) != 18)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 603, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)a3;
  }
  responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (responseInfoAndOrUserData != a4)
  {

    self->_data.basic.responseInfoAndOrUserData = createFixedMutableArray(a4);
  }
}

- (id)quotaRootName
{
  if (*((_BYTE *)self + 8) != 19)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 618, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  return self->_data.capabilities;
}

- (id)quotas
{
  if (*((_BYTE *)self + 8) != 19)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 624, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  return self->_data.basic.responseInfoAndOrUserData;
}

- (void)setQuotaRootName:(id)a3 quotas:(id)a4
{
  NSArray *capabilities;
  id responseInfoAndOrUserData;

  if (*((_BYTE *)self + 8) != 19)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 630, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)a3;
  }
  responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (responseInfoAndOrUserData != a4)
  {

    self->_data.basic.responseInfoAndOrUserData = createFixedMutableArray(a4);
  }
}

- (int64_t)uidFlagsChange
{
  if (*((_BYTE *)self + 8) != 24)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 644, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  return -(uint64_t)(*(_BYTE *)(&self->_data.other + 1) & 1);
}

- (void)setUidFlagsChange:(int64_t)a3
{
  char v3;

  v3 = a3;
  if (*((_BYTE *)self + 8) != 24)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 650, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  *((_BYTE *)&self->_data.other + 16) = *(_BYTE *)(&self->_data.other + 1) & 0xFE | v3 & 1;
}

- (id)uids
{
  if (*((_BYTE *)self + 8) != 24)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 656, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  return self->_data.capabilities;
}

- (void)setUids:(id)a3
{
  NSArray *capabilities;

  if (*((_BYTE *)self + 8) != 24)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 662, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)a3;
  }
}

- (id)flagsFetchResult
{
  if (*((_BYTE *)self + 8) != 24)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 670, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  return self->_data.basic.responseInfoAndOrUserData;
}

- (void)setFlagsFetchResult:(id)a3
{
  id responseInfoAndOrUserData;

  if (*((_BYTE *)self + 8) != 24)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 675, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (responseInfoAndOrUserData != a3)
  {

    self->_data.basic.responseInfoAndOrUserData = a3;
  }
}

- (NSArray)privateNamespaces
{
  if (*((_BYTE *)self + 8) != 22)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 685, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  return self->_data.capabilities;
}

- (void)setPrivateNamespaces:(id)a3
{
  NSArray *capabilities;

  if (*((_BYTE *)self + 8) != 22)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 690, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)a3;
  }
}

- (NSArray)publicNamespaces
{
  if (*((_BYTE *)self + 8) != 22)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 699, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  return self->_data.fetch.items;
}

- (void)setPublicNamespaces:(id)a3
{
  id responseInfoAndOrUserData;

  if (*((_BYTE *)self + 8) != 22)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 704, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (responseInfoAndOrUserData != a3)
  {

    self->_data.basic.responseInfoAndOrUserData = a3;
  }
}

- (NSArray)sharedNamespaces
{
  if (*((_BYTE *)self + 8) != 22)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 713, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  return self->_data.list.var0;
}

- (void)setSharedNamespaces:(id)a3
{
  NSArray *var0;

  if (*((_BYTE *)self + 8) != 22)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 718, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  var0 = self->_data.list.var0;
  if (var0 != a3)
  {

    self->_data.fetch.modSeqNumber = (unint64_t)a3;
  }
}

- (id)responseName
{
  if (*((_BYTE *)self + 8) != 23)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 728, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  return self->_data.capabilities;
}

- (id)parameters
{
  if (*((_BYTE *)self + 8) != 23)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 734, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  return self->_data.basic.responseInfoAndOrUserData;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  NSDictionary *keyValuePairs;

  keyValuePairs = self->_keyValuePairs;
  if (!keyValuePairs)
  {
    keyValuePairs = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_keyValuePairs = keyValuePairs;
  }
  -[NSDictionary setValue:forKey:](keyValuePairs, "setValue:forKey:", a3, a4);
}

- (id)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void)setResponseName:(id)a3 parameters:(id)a4
{
  NSArray *capabilities;
  id responseInfoAndOrUserData;

  if (*((_BYTE *)self + 8) != 23)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFIMAPResponse.m"), 750, CFSTR("%@ is invalid for response type %d"), NSStringFromSelector(a2), *((char *)self + 8));
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)a3;
  }
  responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (responseInfoAndOrUserData != a4)
  {

    self->_data.basic.responseInfoAndOrUserData = a4;
  }
}

- (NSString)ef_publicDescription
{
  return (NSString *)-[MFIMAPResponse _descriptionWithFullData:](self, "_descriptionWithFullData:", 0);
}

- (NSString)description
{
  return (NSString *)-[MFIMAPResponse _descriptionWithFullData:](self, "_descriptionWithFullData:", 1);
}

- (id)_descriptionWithFullData:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int64_t v6;
  uint64_t v7;
  id v8;
  __CFString *v9;
  void *v10;
  const __CFString *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  id v18;
  unint64_t v19;
  __CFString *v20;
  id *v21;
  unint64_t v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  const __CFString *v32;
  id v33;
  const __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t n;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  id v51;
  uint64_t v52;
  void *v53;
  NSArray *v54;
  id v55;
  id v56;
  int64_t v57;
  const __CFString *v58;
  id v59;
  const __CFString *v60;
  const __CFString *v61;
  uint64_t v62;
  uint64_t j;
  uint64_t v64;
  id v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id obj;
  void *v71;
  _QWORD v72[2];
  uint64_t (*v73)(uint64_t, void *);
  void *v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v3 = a3;
  v86 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  if (-[MFIMAPResponse isUntagged](self, "isUntagged"))
    objc_msgSend(v5, "appendString:", CFSTR("* "));
  if (self->_tag)
  {
    objc_msgSend(v5, "appendString:");
    objc_msgSend(v5, "appendString:", CFSTR(" "));
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("%s "), ResponseTypeTable[4 * *((char *)self + 8) + 1]);
  v71 = v5;
  switch(*((_BYTE *)self + 8))
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      v6 = -[MFIMAPResponse responseCode](self, "responseCode");
      v7 = ResponseCodeTable[v6];
      v8 = -[MFIMAPResponse responseInfo](self, "responseInfo");
      v9 = -[MFIMAPResponse userString](self, "userString");
      if (v6 || v8)
      {
        objc_msgSend(v5, "appendString:", CFSTR("["));
        if (v6)
          objc_msgSend(v5, "appendFormat:", CFSTR("%s"), v7);
        if (v8)
        {
          objc_msgSend(v5, "appendString:", CFSTR(" "));
          objc_msgSend(v5, "appendString:", objc_msgSend(v8, "description"));
        }
        objc_msgSend(v5, "appendString:", CFSTR("]"));
      }
      if (((unint64_t)(v6 - 15) < 2 || v3) && -[__CFString length](v9, "length"))
      {
        objc_msgSend(v5, "appendString:", CFSTR(" "));
        v10 = v5;
        v11 = v9;
        goto LABEL_97;
      }
      return v5;
    case 7:
      v23 = -[MFIMAPResponse capabilities](self, "capabilities");
      goto LABEL_82;
    case 8:
    case 0x15:
      v12 = -[MFIMAPResponse serverInfo](self, "serverInfo");
      v13 = (void *)objc_msgSend(v12, "allKeys");
      v14 = objc_msgSend(v13, "count");
      objc_msgSend(v5, "appendString:", CFSTR("("));
      if (v14)
      {
        for (i = 0; i != v14; ++i)
        {
          v16 = objc_msgSend(v13, "objectAtIndex:", i);
          if (i)
            objc_msgSend(v5, "appendString:", CFSTR(" "));
          objc_msgSend(v5, "appendFormat:", CFSTR("%@ %@"), v16, objc_msgSend(v12, "objectForKey:", v16));
        }
      }
      goto LABEL_95;
    case 9:
    case 0xA:
    case 0xB:
      objc_msgSend(v5, "appendFormat:", CFSTR("%llu"), -[MFIMAPResponse number](self, "number"), v67, v68, v69);
      return v5;
    case 0xC:
      objc_msgSend(v5, "appendFormat:", CFSTR("(%@)"), objc_msgSend(-[MFIMAPResponse flags](self, "flags"), "componentsJoinedByString:", CFSTR(" ")), v67, v68, v69);
      return v5;
    case 0xD:
      v24 = -[MFIMAPResponse statusEntries](self, "statusEntries");
      v25 = (void *)objc_msgSend(v24, "allKeys");
      v26 = objc_msgSend(v25, "count");
      if (v3)
        v27 = -[MFIMAPResponse mailboxName](self, "mailboxName");
      else
        v27 = (id)objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", -[MFIMAPResponse mailboxName](self, "mailboxName"));
      objc_msgSend(v5, "appendFormat:", CFSTR("\"%@\"), v27);
      objc_msgSend(v5, "appendString:", CFSTR(" ("));
      if (v26)
      {
        for (j = 0; j != v26; ++j)
        {
          v64 = objc_msgSend(v25, "objectAtIndex:", j);
          if (j)
            objc_msgSend(v5, "appendString:", CFSTR(" "));
          objc_msgSend(v5, "appendFormat:", CFSTR("%@ %@"), v64, objc_msgSend(v24, "objectForKey:", v64));
        }
      }
      goto LABEL_95;
    case 0xE:
      objc_msgSend(v5, "appendFormat:", CFSTR("%@"), -[MFIMAPResponse searchResults](self, "searchResults"), v67, v68, v69);
      return v5;
    case 0xF:
    case 0x10:
      if (v3)
      {
        v17 = -[MFIMAPResponse separator](self, "separator");
        v18 = -[MFIMAPResponse mailboxName](self, "mailboxName");
        v19 = -[MFIMAPResponse mailboxAttributes](self, "mailboxAttributes");
        v20 = 0;
        v21 = (id *)&IMAPMailboxAttributeEntries;
        do
        {
          v22 = (unint64_t)v21[1];
          if ((v22 & v19) != 0
            && (v22 != 2 || (objc_msgSend(*v21, "isEqualToString:", CFSTR("\\NonExistent")) & 1) == 0))
          {
            if (v20)
              -[__CFString appendString:](v20, "appendString:", CFSTR(" "));
            else
              v20 = (__CFString *)objc_msgSend(CFSTR("("), "mutableCopy");
            -[__CFString appendString:](v20, "appendString:", *v21);
          }
          v21 += 2;
        }
        while (v21 < &__block_descriptor_40_e8_32o_e25___NSURL_16__0__NSString_8ls32l8);
        if (v20)
          -[__CFString appendString:](v20, "appendString:", CFSTR(")"));
        else
          v20 = CFSTR("()");
        objc_msgSend(v5, "appendString:", v20);

        objc_msgSend(v5, "appendString:", CFSTR(" "));
        if (v17)
          objc_msgSend(v5, "appendFormat:", CFSTR("\"%@\"), v17);
        else
          objc_msgSend(v5, "appendString:", CFSTR("NIL"));
        objc_msgSend(v5, "appendString:", CFSTR(" "));
        objc_msgSend(v5, "appendFormat:", CFSTR("\"%@\"), v18);
        v65 = -[MFIMAPResponse extraAttributes](self, "extraAttributes");
        if (objc_msgSend(v65, "count"))
          objc_msgSend(v5, "appendFormat:", CFSTR(" ==> (%@)"), objc_msgSend(v65, "componentsJoinedByString:", CFSTR(", ")), v67, v68, v69);
      }
      return v5;
    case 0x11:
      v28 = -[MFIMAPResponse fetchResults](self, "fetchResults");
      v29 = objc_msgSend(v28, "count");
      objc_msgSend(v5, "appendString:", CFSTR("("));
      if (v29)
      {
        for (k = 0; k != v29; ++k)
        {
          v31 = (void *)objc_msgSend(v28, "objectAtIndex:", k);
          if (k)
            objc_msgSend(v5, "appendString:", CFSTR(" "));
          objc_msgSend(v5, "appendString:", objc_msgSend(v31, "description"));
        }
      }
LABEL_95:
      v11 = CFSTR(")");
      goto LABEL_96;
    case 0x12:
      v32 = -[MFIMAPResponse mailboxName](self, "mailboxName");
      v33 = -[MFIMAPResponse quotaRootNames](self, "quotaRootNames");
      v34 = CFSTR("NIL");
      if (v32)
        v34 = v32;
      objc_msgSend(v5, "appendFormat:", CFSTR("\"%@\"), v34);
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v81;
        do
        {
          for (m = 0; m != v36; ++m)
          {
            if (*(_QWORD *)v81 != v37)
              objc_enumerationMutation(v33);
            objc_msgSend(v5, "appendFormat:", CFSTR(" \"%@\"), *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * m));
          }
          v36 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
        }
        while (v36);
      }
      return v5;
    case 0x13:
      v39 = -[MFIMAPResponse quotas](self, "quotas");
      objc_msgSend(v5, "appendFormat:", CFSTR("\"%@\"), -[MFIMAPResponse quotaRootName](self, "quotaRootName"));
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      obj = v39;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v77;
        do
        {
          for (n = 0; n != v41; ++n)
          {
            if (*(_QWORD *)v77 != v42)
              objc_enumerationMutation(obj);
            v44 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * n);
            v45 = objc_msgSend(v44, "objectForKey:", CFSTR("_IMAPNameQuotaKey"));
            v46 = objc_msgSend(v44, "objectForKey:", CFSTR("_IMAPCurrentUsageQuotaKey"));
            v47 = objc_msgSend(v44, "objectForKey:", CFSTR("_IMAPMaxUsageQuotaKey"));
            if (v45)
              v48 = (const __CFString *)v45;
            else
              v48 = CFSTR("NIL");
            if (v46)
              v49 = (const __CFString *)v46;
            else
              v49 = CFSTR("0");
            if (v47)
              v50 = (const __CFString *)v47;
            else
              v50 = CFSTR("0");
            v5 = v71;
            objc_msgSend(v71, "appendFormat:", CFSTR(" (%@ %@/%@)"), v48, v49, v50);
          }
          v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
        }
        while (v41);
      }
      return v5;
    case 0x14:
      v51 = -[MFIMAPResponse keyValuePairs](self, "keyValuePairs");
      v52 = objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("IMAPESearchTagKey"));
      if (objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("IMAPESearchAllKey")))
      {
        v53 = (void *)objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("IMAPESearchAllKey"));
        objc_msgSend(v5, "appendFormat:", CFSTR(" TAG (\"%@\") UID ALL (returned %lu uids, lowest = %lu, highest = %lu)"), v52, objc_msgSend(v53, "count"), objc_msgSend(v53, "firstIndex"), objc_msgSend(v53, "lastIndex"));
      }
      else if (objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("IMAPESearchMaxKey")))
      {
        objc_msgSend(v5, "appendFormat:", CFSTR(" TAG (\"%@\") UID MAX %@"), v52, objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("IMAPESearchMaxKey")), v68, v69);
      }
      else if (objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("IMAPESearchMinKey")))
      {
        objc_msgSend(v5, "appendFormat:", CFSTR(" TAG (\"%@\") UID MIN %@"), v52, objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("IMAPESearchMinKey")), v68, v69);
      }
      else if (objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("IMAPESearchCountKey")))
      {
        objc_msgSend(v5, "appendFormat:", CFSTR(" TAG (\"%@\") UID COUNT %@"), v52, objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("IMAPESearchCountKey")), v68, v69);
      }
      return v5;
    case 0x16:
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v73 = __43__MFIMAPResponse__descriptionWithFullData___block_invoke;
      v74 = &unk_1E4E8C548;
      v75 = v5;
      __43__MFIMAPResponse__descriptionWithFullData___block_invoke((uint64_t)v72, -[MFIMAPResponse privateNamespaces](self, "privateNamespaces"));
      objc_msgSend(v5, "appendString:", CFSTR(" "));
      __43__MFIMAPResponse__descriptionWithFullData___block_invoke((uint64_t)v72, -[MFIMAPResponse publicNamespaces](self, "publicNamespaces"));
      objc_msgSend(v5, "appendString:", CFSTR(" "));
      v54 = -[MFIMAPResponse sharedNamespaces](self, "sharedNamespaces");
      v73((uint64_t)v72, v54);
      return v5;
    case 0x17:
      v55 = -[MFIMAPResponse responseName](self, "responseName");
      v56 = -[MFIMAPResponse parameters](self, "parameters");
      if (v55)
      {
        objc_msgSend(v5, "appendString:", CFSTR(" "));
        objc_msgSend(v5, "appendString:", v55);
      }
      if (!v3 || !v56)
        return v5;
      objc_msgSend(v5, "appendString:", CFSTR(" "));
      v23 = v56;
LABEL_82:
      v11 = (const __CFString *)objc_msgSend(v23, "componentsJoinedByString:", CFSTR(" "));
LABEL_96:
      v10 = v5;
LABEL_97:
      objc_msgSend(v10, "appendString:", v11);
      return v5;
    case 0x18:
      v57 = -[MFIMAPResponse uidFlagsChange](self, "uidFlagsChange");
      v58 = -[MFIMAPResponse uids](self, "uids");
      v59 = -[MFIMAPResponse flagsFetchResult](self, "flagsFetchResult");
      v60 = CFSTR("*nil*");
      if (v58)
        v61 = v58;
      else
        v61 = CFSTR("*nil*");
      v62 = byte_1A59996D4[v57];
      if (v59)
        v60 = (const __CFString *)objc_msgSend(v59, "description");
      objc_msgSend(v5, "appendFormat:", CFSTR(" %@ %c%@"), v61, v62, v60, v69);
      return v5;
    default:
      return v5;
  }
}

uint64_t __43__MFIMAPResponse__descriptionWithFullData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!a2)
    return objc_msgSend(v3, "appendString:", CFSTR("NIL"));
  objc_msgSend(v3, "appendString:", CFSTR("("));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(a2);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_IMAPNamespacePrefixKey"));
        v11 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_IMAPNamespaceDelimiterKey"));
        v12 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_IMAPNamespaceExtensionsKey"));
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("(\"%@\" "), v10);
        v13 = *(void **)(a1 + 32);
        if (v11)
          objc_msgSend(v13, "appendFormat:", CFSTR("\"%@\"), v11);
        else
          objc_msgSend(v13, "appendString:", CFSTR("NIL"));
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __43__MFIMAPResponse__descriptionWithFullData___block_invoke_2;
        v15[3] = &unk_1E4E8C520;
        v15[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v15);
        objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(")"));
      }
      v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(")"));
}

uint64_t __43__MFIMAPResponse__descriptionWithFullData___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(" \"%@\" (\"%@\")"), a2, objc_msgSend(a3, "componentsJoinedByString:", CFSTR("\" \")));
}

- (MFIMAPResponse)initWithConnection:(id)a3 responseConsumer:(id)a4
{
  MFIMAPResponse *v6;
  id v7;
  void *v8;
  MFIMAPParseContext *v9;
  MFIMAPResponse *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)MFIMAPResponse;
  v6 = -[MFIMAPResponse init](&v12, sel_init);
  if (!v6)
    return 0;
  v7 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[MFIMAPResponse setResponseConsumer:](v6, "setResponseConsumer:", a4);
  v8 = (void *)objc_msgSend(a3, "_readDataOfLength:", -1);
  if (!v8
    || ((v9 = -[MFIMAPParseContext initWithConnection:response:start:end:]([MFIMAPParseContext alloc], "initWithConnection:response:start:end:", a3, v6, objc_msgSend(v8, "bytes"), objc_msgSend(v8, "bytes") + objc_msgSend(v8, "length")), response(v9), !-[MFIMAPParseContext isValid](v9, "isValid"))? (v10 = 0): (v10 = v6), v9, !v10))
  {

    v10 = 0;
  }

  return v10;
}

- (MFIMAPResponse)initWithString:(id)a3
{
  MFIMAPResponse *v4;
  id v5;
  uint64_t v6;
  MFIMAPParseContext *v7;
  MFIMAPResponse *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)MFIMAPResponse;
  v4 = -[MFIMAPResponse init](&v10, sel_init);
  if (!v4)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v6 = objc_msgSend(a3, "UTF8String");
  v7 = -[MFIMAPParseContext initWithConnection:response:start:end:]([MFIMAPParseContext alloc], "initWithConnection:response:start:end:", 0, v4, v6, v6 + objc_msgSend(a3, "length"));
  response(v7);
  if (-[MFIMAPParseContext isValid](v7, "isValid"))
    v8 = v4;
  else
    v8 = 0;

  if (!v8)
  return v8;
}

- (MFIMAPResponse)initWithResponseType:(int64_t)a3
{
  char v3;
  MFIMAPResponse *result;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFIMAPResponse;
  result = -[MFIMAPResponse init](&v5, sel_init);
  if (result)
    *((_BYTE *)result + 8) = v3;
  return result;
}

- (MFIMAPResponseConsumer)responseConsumer
{
  return self->_responseConsumer;
}

- (void)setResponseConsumer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)fetchResults
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A4F90000, a2, OS_LOG_TYPE_ERROR, "Invalid for response type %d", (uint8_t *)v3, 8u);
}

@end
