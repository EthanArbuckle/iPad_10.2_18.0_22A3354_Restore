@implementation MFSMTPResponse

- (MFSMTPResponse)initWithStatus:(int)a3
{
  MFSMTPResponse *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFSMTPResponse;
  result = -[MFSMTPResponse init](&v5, sel_init);
  if (result)
  {
    result->_status = a3;
    *((_WORD *)result + 11) &= 0xC00Fu;
    *(_WORD *)((char *)result + 21) &= 0xF003u;
    *((_WORD *)result + 10) &= 0xFC00u;
  }
  return result;
}

- (void)setStatus:(int)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    *((_WORD *)self + 11) &= 0xC00Fu;
    *(_WORD *)((char *)self + 21) &= 0xF003u;
    *((_WORD *)self + 10) &= 0xFC00u;
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFSMTPResponse;
  -[MFSMTPResponse dealloc](&v3, sel_dealloc);
}

- (void)_updateEnhancedStatusCodesFromLastResponse
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD block[6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    self->_statusString = 0;
    v4 = objc_msgSend(self->_lastResponseLine, "bytes");
    v5 = objc_msgSend(self->_lastResponseLine, "length");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__MFSMTPResponse__updateEnhancedStatusCodesFromLastResponse__block_invoke;
    block[3] = &unk_1E81CACB0;
    block[4] = self;
    block[5] = a2;
    if (_updateEnhancedStatusCodesFromLastResponse_once != -1)
      dispatch_once(&_updateEnhancedStatusCodesFromLastResponse_once, block);
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v4, v5, 1, 0);
    v6 = (void *)objc_msgSend((id)_updateEnhancedStatusCodesFromLastResponse__responseEnhancedStatusCodesRegex, "firstMatchInString:options:range:");
    if (v6)
    {
      v7 = v6;
      *((_WORD *)self + 10) = *((_WORD *)self + 10) & 0xFC00 | strtoul((const char *)(v4+ objc_msgSend(v6, "rangeAtIndex:", 1)), 0, 10) & 0x3FF;
      *(_WORD *)((char *)self + 21) = (4
                                     * (strtoul((const char *)(v4 + objc_msgSend(v7, "rangeAtIndex:", 2)), 0, 10) & 0x3FF)) | *(_WORD *)((char *)self + 21) & 0xF003;
      *((_WORD *)self + 11) = (16
                             * (strtoul((const char *)(v4 + objc_msgSend(v7, "rangeAtIndex:", 3)), 0, 10) & 0x3FF)) | *((_WORD *)self + 11) & 0xC00F;
      v8 = objc_msgSend(v7, "rangeAtIndex:", 5);
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        self->_statusString = (NSString *)(id)objc_msgSend(v10, "substringWithRange:", v8, v9);
    }
    else
    {
      *((_WORD *)self + 11) &= 0xC00Fu;
      *(_WORD *)((char *)self + 21) &= 0xF003u;
      *((_WORD *)self + 10) &= 0xFC00u;
    }

  }
  else
  {
    *((_WORD *)self + 11) &= 0xC00Fu;
    *(_WORD *)((char *)self + 21) &= 0xF003u;
    *((_WORD *)self + 10) &= 0xFC00u;
  }
}

uint64_t __60__MFSMTPResponse__updateEnhancedStatusCodesFromLastResponse__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^([0-9]+)\\.([0-9]+)\\.([0-9]+)([ ]+)(.*)"), 16, 0);
  _updateEnhancedStatusCodesFromLastResponse__responseEnhancedStatusCodesRegex = result;
  if (!result)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SMTPResponse.m"), 96, CFSTR("Unable to init regular expression from %@"), CFSTR("^([0-9]+)\\.([0-9]+)\\.([0-9]+)([ ]+)(.*)"));
  return result;
}

- (id)lastResponseLine
{
  return self->_lastResponseLine;
}

- (void)setLastResponseLine:(id)a3
{
  id lastResponseLine;

  lastResponseLine = self->_lastResponseLine;
  if (lastResponseLine != a3)
  {

    self->_lastResponseLine = a3;
    -[MFSMTPResponse _updateEnhancedStatusCodesFromLastResponse](self, "_updateEnhancedStatusCodesFromLastResponse");
  }
}

- (int)failureReason
{
  id lastResponseLine;
  __int16 *v4;
  uint64_t v6;
  int v7;

  lastResponseLine = self->_lastResponseLine;
  if (lastResponseLine)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      lastResponseLine = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_lastResponseLine, 4);
    else
      lastResponseLine = 0;
  }
  v4 = &ExtendedStatusCodesTable;
  failureReason_result = (uint64_t)&ExtendedStatusCodesTable;
  while (*v4 != (*((_WORD *)self + 10) & 0x3FF)
       || v4[1] != ((*(unsigned __int16 *)((char *)self + 21) >> 2) & 0x3FF)
       || v4[2] != ((*((unsigned __int16 *)self + 11) >> 4) & 0x3FF))
  {
    if (*((_QWORD *)v4 + 1) && lastResponseLine != 0)
    {
      objc_msgSend(lastResponseLine, "rangeOfString:options:");
      v4 = (__int16 *)failureReason_result;
      if (v6)
        break;
    }
    v4 += 12;
    failureReason_result = (uint64_t)v4;
    if (v4 >= (__int16 *)off_1E81CBCE8)
    {
      v7 = -1;
      goto LABEL_17;
    }
  }
  v7 = *((_DWORD *)v4 + 4);
LABEL_17:

  return v7;
}

- (id)errorMessageWithAddress:(id)a3 defaultMessage:(id)a4
{
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  switch(-[MFSMTPResponse failureReason](self, "failureReason"))
  {
    case 0:
      v6 = CFSTR("MF_SMTP_RECIPIENT_UNKNOWN");
      v7 = CFSTR("The recipient “%@” was rejected by the server because the user is unknown.");
      goto LABEL_8;
    case 1:
      v6 = CFSTR("MF_SMTP_RECIPIENT_RELAYING_NOT_ALLOWED");
      v7 = CFSTR("The recipient “%@” was rejected by the server because it does not allow relaying.");
      goto LABEL_8;
    case 2:
      v6 = CFSTR("MF_SMTP_RECIPIENT_INVALID_ADDRESS");
      v7 = CFSTR("The recipient “%@” was rejected by the server because it is not a valid email address.");
      goto LABEL_8;
    case 3:
      v6 = CFSTR("MF_SMTP_SENDING_LIMIT_EXCEEDED");
      v7 = CFSTR("Sending the message failed because you exceeded your sending limit.");
      goto LABEL_8;
    case 4:
      v6 = CFSTR("NO_PASSWORD_PROVIDED_ERROR");
      v7 = CFSTR("No password provided.\n\nPlease go to Mail Account Settings and enter a password.");
      v8 = 0;
      goto LABEL_9;
    case 5:
      v6 = CFSTR("SMTP_INVALID_SENDER_ADDRESS");
      v7 = CFSTR("The sender address “%@” was rejected by the server.");
LABEL_8:
      v8 = CFSTR("Delayed");
LABEL_9:
      a4 = (id)MFLookupLocalizedString((uint64_t)v6, (uint64_t)v7, v8);
      break;
    default:
      break;
  }
  if (a3 && a4)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", a4, a3);
  else
    return a4;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*((_WORD *)self + 10) & 0x3FF) != 0)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d (%d.%d.%d) %@"), self->_status, *((_WORD *)self + 10) & 0x3FF, (*(unsigned __int16 *)((char *)self + 21) >> 2) & 0x3FF, (*((unsigned __int16 *)self + 11) >> 4) & 0x3FF, self->_statusString);
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d %@"), self->_status, self->_statusString, v3, v4, v5);
}

- (int)status
{
  return self->_status;
}

- (unsigned)statusClass
{
  return *((_WORD *)self + 10) & 0x3FF;
}

- (unsigned)statusSubject
{
  return (*(unsigned __int16 *)((char *)self + 21) >> 2) & 0x3FF;
}

- (unsigned)statusDetail
{
  return (*((unsigned __int16 *)self + 11) >> 4) & 0x3FF;
}

- (NSString)statusString
{
  return self->_statusString;
}

- (NSArray)continuationResponses
{
  return self->_continuationResponses;
}

- (void)setContinuationResponses:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
