@implementation IDSIDInfoOptions

+ (id)currentIDInfo
{
  IDSIDInfoOptions *v2;
  const char *v3;
  double v4;

  v2 = [IDSIDInfoOptions alloc];
  return (id)objc_msgSend_initWithBypassLimit_allowRefresh_forceRefresh_respectExpiry_waitForReply_(v2, v3, 0, v4, 0, 0, 1, 0);
}

+ (id)refreshIDInfo
{
  IDSIDInfoOptions *v2;
  const char *v3;
  double v4;

  v2 = [IDSIDInfoOptions alloc];
  return (id)objc_msgSend_initWithBypassLimit_allowRefresh_forceRefresh_respectExpiry_waitForReply_(v2, v3, 0, v4, 1, 0, 1, 0);
}

+ (id)refreshIDInfoAndBypassLimit
{
  IDSIDInfoOptions *v2;
  const char *v3;
  double v4;

  v2 = [IDSIDInfoOptions alloc];
  return (id)objc_msgSend_initWithBypassLimit_allowRefresh_forceRefresh_respectExpiry_waitForReply_(v2, v3, 1, v4, 1, 0, 1, 0);
}

+ (id)sync_currentIDInfo
{
  IDSIDInfoOptions *v2;
  const char *v3;
  double v4;

  v2 = [IDSIDInfoOptions alloc];
  return (id)objc_msgSend_initWithBypassLimit_allowRefresh_forceRefresh_respectExpiry_waitForReply_(v2, v3, 0, v4, 0, 0, 1, 1);
}

+ (id)sync_refreshIDInfo
{
  IDSIDInfoOptions *v2;
  const char *v3;
  double v4;

  v2 = [IDSIDInfoOptions alloc];
  return (id)objc_msgSend_initWithBypassLimit_allowRefresh_forceRefresh_respectExpiry_waitForReply_(v2, v3, 0, v4, 1, 0, 1, 1);
}

- (IDSIDInfoOptions)init
{
  IDSIDInfoOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IDSIDInfoOptions;
  result = -[IDSIDInfoOptions init](&v3, sel_init);
  if (result)
  {
    result->_bypassLimit = 0;
    *(_DWORD *)&result->_allowRefresh = 257;
  }
  return result;
}

- (IDSIDInfoOptions)initWithBypassLimit:(BOOL)a3 allowRefresh:(BOOL)a4 forceRefresh:(BOOL)a5 respectExpiry:(BOOL)a6 waitForReply:(BOOL)a7
{
  IDSIDInfoOptions *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IDSIDInfoOptions;
  result = -[IDSIDInfoOptions init](&v13, sel_init);
  if (result)
  {
    result->_bypassLimit = a3;
    result->_allowRefresh = a4;
    result->_forceRefresh = a5;
    result->_respectExpiry = a6;
    result->_waitForReply = a7;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  const char *v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  const char *v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  const char *v26;
  double v27;
  const char *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  const char *v32;
  double v33;
  id v34;

  v34 = a3;
  v7 = objc_msgSend_bypassLimit(self, v4, v5, v6);
  objc_msgSend_encodeBool_forKey_(v34, v8, v7, v9, CFSTR("bypassLimit"));
  v13 = objc_msgSend_allowRefresh(self, v10, v11, v12);
  objc_msgSend_encodeBool_forKey_(v34, v14, v13, v15, CFSTR("allowRefresh"));
  v19 = objc_msgSend_forceRefresh(self, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v34, v20, v19, v21, CFSTR("forceRefresh"));
  v25 = objc_msgSend_respectExpiry(self, v22, v23, v24);
  objc_msgSend_encodeBool_forKey_(v34, v26, v25, v27, CFSTR("respectExpiry"));
  v31 = objc_msgSend_waitForReply(self, v28, v29, v30);
  objc_msgSend_encodeBool_forKey_(v34, v32, v31, v33, CFSTR("waitForReply"));

}

- (IDSIDInfoOptions)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  uint64_t v7;
  const char *v8;
  double v9;
  uint64_t v10;
  const char *v11;
  double v12;
  uint64_t v13;
  const char *v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  uint64_t v19;
  const char *v20;
  double v21;

  v4 = a3;
  v7 = objc_msgSend_decodeBoolForKey_(v4, v5, (uint64_t)CFSTR("bypassLimit"), v6);
  v10 = objc_msgSend_decodeBoolForKey_(v4, v8, (uint64_t)CFSTR("allowRefresh"), v9);
  v13 = objc_msgSend_decodeBoolForKey_(v4, v11, (uint64_t)CFSTR("forceRefresh"), v12);
  v16 = objc_msgSend_decodeBoolForKey_(v4, v14, (uint64_t)CFSTR("respectExpiry"), v15);
  v19 = objc_msgSend_decodeBoolForKey_(v4, v17, (uint64_t)CFSTR("waitForReply"), v18);

  return (IDSIDInfoOptions *)objc_msgSend_initWithBypassLimit_allowRefresh_forceRefresh_respectExpiry_waitForReply_(self, v20, v7, v21, v10, v13, v16, v19);
}

- (BOOL)allowRefresh
{
  return self->_allowRefresh;
}

- (void)setAllowRefresh:(BOOL)a3
{
  self->_allowRefresh = a3;
}

- (BOOL)respectExpiry
{
  return self->_respectExpiry;
}

- (void)setRespectExpiry:(BOOL)a3
{
  self->_respectExpiry = a3;
}

- (BOOL)waitForReply
{
  return self->_waitForReply;
}

- (void)setWaitForReply:(BOOL)a3
{
  self->_waitForReply = a3;
}

- (BOOL)forceRefresh
{
  return self->_forceRefresh;
}

- (void)setForceRefresh:(BOOL)a3
{
  self->_forceRefresh = a3;
}

- (BOOL)bypassLimit
{
  return self->_bypassLimit;
}

- (void)setBypassLimit:(BOOL)a3
{
  self->_bypassLimit = a3;
}

@end
