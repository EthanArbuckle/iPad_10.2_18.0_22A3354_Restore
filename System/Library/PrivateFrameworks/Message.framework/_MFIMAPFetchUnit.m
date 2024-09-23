@implementation _MFIMAPFetchUnit

- (void)_setupExpectedFetchResult
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  MFIMAPFetchResult *v13;
  MFIMAPFetchResult *expectedFetchResult;
  uint64_t v15;
  MFIMAPFetchResult *v16;
  MFIMAPFetchResult *v17;
  MFIMAPFetchResult *v18;
  MFIMAPFetchResult *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  MFIMAPFetchResult *v27;

  if (!objc_msgSend(CFSTR("BODYSTRUCTURE"), "caseInsensitiveCompare:", self->_fetchItem))
  {
    v13 = -[MFIMAPFetchResult initWithType:]([MFIMAPFetchResult alloc], "initWithType:", 6);
    expectedFetchResult = self->_expectedFetchResult;
    self->_expectedFetchResult = v13;
LABEL_13:

    return;
  }
  if (objc_msgSend(CFSTR("X-APPLE-REMOTE-LINKS"), "caseInsensitiveCompare:", self->_fetchItem))
  {
    v3 = -[NSString length](self->_fetchItem, "length");
    v4 = -[NSString rangeOfString:options:](self->_fetchItem, "rangeOfString:options:", CFSTR("BODY"), 9);
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = -[NSString rangeOfString:options:range:](self->_fetchItem, "rangeOfString:options:range:", CFSTR(".PEEK"), 9, v4 + v5, v3 - (v4 + v5));
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = -[NSString rangeOfString:options:range:](self->_fetchItem, "rangeOfString:options:range:", CFSTR("["), 8, v6 + v7, v3 - (v6 + v7));
        if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = v8 + v9;
          v11 = -[NSString rangeOfString:options:range:](self->_fetchItem, "rangeOfString:options:range:", CFSTR("]"), 4, v8 + v9, v3 - (v8 + v9));
          if (v11 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v15 = v11;
            -[NSString substringWithRange:](self->_fetchItem, "substringWithRange:", v10, v11 - v10);
            v27 = (MFIMAPFetchResult *)objc_claimAutoreleasedReturnValue();
            if (-[MFIMAPFetchResult rangeOfString:options:](v27, "rangeOfString:options:", CFSTR("HEADER"), 9) == 0x7FFFFFFFFFFFFFFFLL)
            {
              v16 = -[MFIMAPFetchResult initWithType:]([MFIMAPFetchResult alloc], "initWithType:", 7);
              v17 = self->_expectedFetchResult;
              self->_expectedFetchResult = v16;

              -[MFIMAPFetchResult setSection:](self->_expectedFetchResult, "setSection:", v27);
            }
            else
            {
              v18 = -[MFIMAPFetchResult initWithType:]([MFIMAPFetchResult alloc], "initWithType:", 4);
              v19 = self->_expectedFetchResult;
              self->_expectedFetchResult = v18;

            }
            v21 = -[NSString rangeOfString:options:range:](self->_fetchItem, "rangeOfString:options:range:", CFSTR("<"), 0, v15, v3 - v15);
            if (v21 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v22 = v20;
              if (-[NSString hasSuffix:](self->_fetchItem, "hasSuffix:", CFSTR(">")))
              {
                v23 = v21 + v22;
                v24 = -[NSString rangeOfString:options:range:](self->_fetchItem, "rangeOfString:options:range:", CFSTR("."), 0, v23, v3 - v23);
                if (v24 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  -[NSString substringWithRange:](self->_fetchItem, "substringWithRange:", v23, v24 - v23);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v25, "intValue");

                  -[MFIMAPFetchResult setStartOffset:](self->_expectedFetchResult, "setStartOffset:", v26);
                }
              }
            }
            expectedFetchResult = v27;
            goto LABEL_13;
          }
        }
      }
    }
  }
}

- (BOOL)matchesFetchResponse:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v13;
  void *v14;
  BOOL v15;
  BOOL v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_expectedFetchResult
    || self->_fetchItem
    && (-[_MFIMAPFetchUnit _setupExpectedFetchResult](self, "_setupExpectedFetchResult"), self->_expectedFetchResult))
  {
    v18 = v4;
    objc_msgSend(v4, "fetchResults");
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v20;
LABEL_4:
      v9 = 0;
      while (2)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        switch(objc_msgSend(v10, "type"))
        {
          case 4:
          case 5:
          case 7:
            v11 = -[MFIMAPFetchResult type](self->_expectedFetchResult, "type");
            if (v11 <= 7 && ((1 << v11) & 0xB0) != 0)
            {
              objc_msgSend(v10, "section");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              -[MFIMAPFetchResult section](self->_expectedFetchResult, "section");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = objc_msgSend(v13, "caseInsensitiveCompare:", v14) == 0;

            }
            goto LABEL_13;
          case 6:
            v15 = -[MFIMAPFetchResult type](self->_expectedFetchResult, "type") == 6;
            goto LABEL_17;
          case 12:
            v15 = -[MFIMAPFetchResult type](self->_expectedFetchResult, "type") == 12;
LABEL_17:
            v6 = v15;
            if (!v6)
              goto LABEL_21;
            break;
          default:
LABEL_13:
            if (v6)
              break;
LABEL_21:
            if (v7 != ++v9)
              continue;
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            if (!v7)
              goto LABEL_23;
            goto LABEL_4;
        }
        break;
      }
    }
LABEL_23:

    v16 = v6;
    v4 = v18;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)copyFailedFetchResponse
{
  MFIMAPResponse *v3;
  void *v4;
  uint64_t i;
  MFIMAPFetchResult *v7;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x1E0C80C00];
  if (!self->_uid)
    return 0;
  if (!self->_expectedFetchResult)
  {
    -[_MFIMAPFetchUnit _setupExpectedFetchResult](self, "_setupExpectedFetchResult");
    if (!self->_expectedFetchResult)
      return 0;
  }
  v3 = objc_alloc_init(MFIMAPResponse);
  -[MFIMAPResponse setResponseType:](v3, "setResponseType:", 17);
  -[MFIMAPResponse setNumber:](v3, "setNumber:", 0);
  v8[0] = 0;
  v7 = -[MFIMAPFetchResult initWithType:]([MFIMAPFetchResult alloc], "initWithType:", 8);

  -[MFIMAPFetchResult setUid:](v7, "setUid:", self->_uid);
  objc_storeStrong(v8, self->_expectedFetchResult);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v7, 2);
  -[MFIMAPResponse setFetchResults:](v3, "setFetchResults:", v4);

  for (i = 1; i != -1; --i)
  return v3;
}

- (MFDataConsumer)bodyDataConsumer
{
  return self->_bodyDataConsumer;
}

- (void)setBodyDataConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_bodyDataConsumer, a3);
}

- (NSString)consumerSection
{
  return self->_consumerSection;
}

- (void)setConsumerSection:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSection, a3);
}

- (NSString)fetchItem
{
  return self->_fetchItem;
}

- (void)setFetchItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchItem, 0);
  objc_storeStrong((id *)&self->_consumerSection, 0);
  objc_storeStrong((id *)&self->_bodyDataConsumer, 0);
  objc_storeStrong((id *)&self->_expectedFetchResult, 0);
}

@end
