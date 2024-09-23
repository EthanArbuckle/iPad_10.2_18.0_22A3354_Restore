@implementation MFSMTPResponse

- (MFSMTPResponse)initWithStatus:(unint64_t)a3
{
  MFSMTPResponse *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFSMTPResponse;
  result = -[MFSMTPResponse init](&v5, sel_init);
  if (result)
  {
    result->_status = a3;
    *((_WORD *)result + 13) &= 0xC00Fu;
    *(_WORD *)((char *)result + 25) &= 0xF003u;
    *((_WORD *)result + 12) &= 0xFC00u;
  }
  return result;
}

- (void)setStatus:(unint64_t)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    *((_WORD *)self + 13) &= 0xC00Fu;
    *(_WORD *)((char *)self + 25) &= 0xF003u;
    *((_WORD *)self + 12) &= 0xFC00u;
  }
}

- (void)_updateEnhancedStatusCodesFromLastResponse
{
  NSString *statusString;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  NSString *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  MFSMTPResponse *v19;
  SEL v20;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    statusString = self->_statusString;
    self->_statusString = 0;

    v5 = objc_msgSend(self->_lastResponseLine, "bytes");
    v6 = objc_msgSend(self->_lastResponseLine, "length");
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __60__MFSMTPResponse__updateEnhancedStatusCodesFromLastResponse__block_invoke;
    v18 = &unk_1E4E89DD0;
    v19 = self;
    v20 = a2;
    if (_updateEnhancedStatusCodesFromLastResponse_once != -1)
      dispatch_once(&_updateEnhancedStatusCodesFromLastResponse_once, &v15);
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v5, v6, 1, 0, v15, v16, v17, v18, v19, v20);
    objc_msgSend((id)_updateEnhancedStatusCodesFromLastResponse__responseEnhancedStatusCodesRegex, "firstMatchInString:options:range:", v8, 0, 0, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      *((_WORD *)self + 12) = *((_WORD *)self + 12) & 0xFC00 | strtoul((const char *)(v5+ objc_msgSend(v9, "rangeAtIndex:", 1)), 0, 10) & 0x3FF;
      *(_WORD *)((char *)self + 25) = (4
                                     * (strtoul((const char *)(v5 + objc_msgSend(v10, "rangeAtIndex:", 2)), 0, 10) & 0x3FF)) | *(_WORD *)((char *)self + 25) & 0xF003;
      *((_WORD *)self + 13) = (16
                             * (strtoul((const char *)(v5 + objc_msgSend(v10, "rangeAtIndex:", 3)), 0, 10) & 0x3FF)) | *((_WORD *)self + 13) & 0xC00F;
      v12 = objc_msgSend(v10, "rangeAtIndex:", 5);
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v8, "substringWithRange:", v12, v11);
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = self->_statusString;
        self->_statusString = v13;

      }
    }
    else
    {
      *((_WORD *)self + 13) &= 0xC00Fu;
      *(_WORD *)((char *)self + 25) &= 0xF003u;
      *((_WORD *)self + 12) &= 0xFC00u;
    }

  }
  else
  {
    *((_WORD *)self + 13) &= 0xC00Fu;
    *(_WORD *)((char *)self + 25) &= 0xF003u;
    *((_WORD *)self + 12) &= 0xFC00u;
  }
}

void __60__MFSMTPResponse__updateEnhancedStatusCodesFromLastResponse__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^([0-9]+)\\.([0-9]+)\\.([0-9]+)([ ]+)(.*)"), 16, 0);
  v3 = (void *)_updateEnhancedStatusCodesFromLastResponse__responseEnhancedStatusCodesRegex;
  _updateEnhancedStatusCodesFromLastResponse__responseEnhancedStatusCodesRegex = v2;

  if (!_updateEnhancedStatusCodesFromLastResponse__responseEnhancedStatusCodesRegex)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SMTPResponse.m"), 89, CFSTR("Unable to init regular expression from %@"), CFSTR("^([0-9]+)\\.([0-9]+)\\.([0-9]+)([ ]+)(.*)"));

  }
}

- (id)lastResponseLine
{
  return self->_lastResponseLine;
}

- (void)setLastResponseLine:(id)a3
{
  id v5;

  v5 = a3;
  if (self->_lastResponseLine != v5)
  {
    objc_storeStrong(&self->_lastResponseLine, a3);
    -[MFSMTPResponse _updateEnhancedStatusCodesFromLastResponse](self, "_updateEnhancedStatusCodesFromLastResponse");
  }

}

- (int64_t)failureReason
{
  id lastResponseLine;
  __int16 *v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

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
  while (*v4 != (*((_WORD *)self + 12) & 0x3FF)
       || v4[1] != ((*(unsigned __int16 *)((char *)self + 25) >> 2) & 0x3FF)
       || v4[2] != ((*((unsigned __int16 *)self + 13) >> 4) & 0x3FF))
  {
    if (*((_QWORD *)v4 + 1) && lastResponseLine != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(lastResponseLine, "rangeOfString:options:", v6, 1);
      v8 = v7;

      v4 = (__int16 *)failureReason_result;
      if (v8)
        break;
    }
    v4 += 12;
    failureReason_result = (uint64_t)v4;
    if (v4 >= (__int16 *)off_1E4E8EEE0)
    {
      v9 = -1;
      goto LABEL_17;
    }
  }
  v9 = *((_QWORD *)v4 + 2);
LABEL_17:

  return v9;
}

- (id)errorMessageWithAddress:(id)a3 defaultMessage:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  v8 = -[MFSMTPResponse failureReason](self, "failureReason");
  if (v8 >= 6)
  {
    v9 = v7;
  }
  else
  {
    MFLookupLocalizedString(off_1E4E8EF20[v8], off_1E4E8EF50[v8], off_1E4E8EF80[v8]);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  if (v6 && v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, v6);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }

  return v10;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*((_WORD *)self + 12) & 0x3FF) != 0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu (%d.%d.%d) %@"), self->_status, *((_WORD *)self + 12) & 0x3FF, (*(unsigned __int16 *)((char *)self + 25) >> 2) & 0x3FF, (*((unsigned __int16 *)self + 13) >> 4) & 0x3FF, self->_statusString);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu %@"), self->_status, self->_statusString, v3, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)status
{
  return self->_status;
}

- (unsigned)statusClass
{
  return *((_WORD *)self + 12) & 0x3FF;
}

- (unsigned)statusSubject
{
  return (*(unsigned __int16 *)((char *)self + 25) >> 2) & 0x3FF;
}

- (unsigned)statusDetail
{
  return (*((unsigned __int16 *)self + 13) >> 4) & 0x3FF;
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
  objc_storeStrong((id *)&self->_continuationResponses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuationResponses, 0);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong(&self->_lastResponseLine, 0);
}

@end
