@implementation _HKAuthorizationRecord

- (_HKAuthorizationRecord)initWithAuthorizationStatus:(int64_t)a3 authorizationRequest:(int64_t)a4 authorizationMode:(int64_t)a5 anchorLimitModifiedDate:(id)a6
{
  id v10;
  _HKAuthorizationRecord *v11;
  _HKAuthorizationRecord *v12;
  uint64_t v13;
  NSDate *anchorLimitModifiedDate;
  objc_super v16;

  v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_HKAuthorizationRecord;
  v11 = -[_HKAuthorizationRecord init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_status = a3;
    v11->_request = a4;
    v11->_mode = a5;
    v13 = objc_msgSend(v10, "copy");
    anchorLimitModifiedDate = v12->_anchorLimitModifiedDate;
    v12->_anchorLimitModifiedDate = (NSDate *)v13;

  }
  return v12;
}

+ (id)recordWithStatus:(int64_t)a3 request:(int64_t)a4 mode:(int64_t)a5 anchorLimitModifiedDate:(id)a6
{
  id v10;
  void *v11;

  v10 = a6;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAuthorizationStatus:authorizationRequest:authorizationMode:anchorLimitModifiedDate:", a3, a4, a5, v10);

  return v11;
}

- (id)_deepCopy
{
  _HKAuthorizationRecord *v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  _HKAuthorizationRecord *v8;

  v3 = [_HKAuthorizationRecord alloc];
  v4 = -[_HKAuthorizationRecord status](self, "status");
  v5 = -[_HKAuthorizationRecord request](self, "request");
  v6 = -[_HKAuthorizationRecord mode](self, "mode");
  -[_HKAuthorizationRecord anchorLimitModifiedDate](self, "anchorLimitModifiedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_HKAuthorizationRecord initWithAuthorizationStatus:authorizationRequest:authorizationMode:anchorLimitModifiedDate:](v3, "initWithAuthorizationStatus:authorizationRequest:authorizationMode:anchorLimitModifiedDate:", v4, v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  NSDate *anchorLimitModifiedDate;
  NSDate *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    if (self->_status != v5[1] || self->_request != v5[2] || self->_mode != v5[3])
      goto LABEL_9;
    anchorLimitModifiedDate = self->_anchorLimitModifiedDate;
    v8 = (NSDate *)v6[4];
    if (anchorLimitModifiedDate == v8)
    {
      v9 = 1;
      goto LABEL_10;
    }
    if (v8)
      v9 = -[NSDate isEqualToDate:](anchorLimitModifiedDate, "isEqualToDate:");
    else
LABEL_9:
      v9 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (unint64_t)hash
{
  return self->_status ^ (self->_request << 8) ^ (self->_mode << 16);
}

- (BOOL)requestedSharing
{
  return (self->_request & 0xFFFFFFFFFFFFFFFDLL) == 201;
}

- (BOOL)requestedReading
{
  return (self->_request & 0xFFFFFFFFFFFFFFFELL) == 202;
}

- (BOOL)deniedSharing
{
  _BOOL4 v3;

  v3 = -[_HKAuthorizationRecord requestedSharing](self, "requestedSharing");
  if (v3)
    LOBYTE(v3) = (unint64_t)(self->_status - 103) < 2;
  return v3;
}

- (BOOL)deniedReading
{
  _BOOL4 v3;
  int64_t status;

  v3 = -[_HKAuthorizationRecord requestedReading](self, "requestedReading");
  if (v3)
  {
    status = self->_status;
    LOBYTE(v3) = status == 104 || status == 102;
  }
  return v3;
}

- (BOOL)sharingEnabled
{
  _BOOL4 v3;

  v3 = -[_HKAuthorizationRecord requestedSharing](self, "requestedSharing");
  if (v3)
    LOBYTE(v3) = (unint64_t)(self->_status - 101) < 2;
  return v3;
}

- (BOOL)readingEnabled
{
  _BOOL4 v3;

  v3 = -[_HKAuthorizationRecord requestedReading](self, "requestedReading");
  if (v3)
    LOBYTE(v3) = ((self->_status - 101) & 0xFFFFFFFFFFFFFFFDLL) == 0;
  return v3;
}

- (BOOL)isCompatibleStatus:(int64_t)a3
{
  BOOL v5;
  BOOL v6;
  BOOL result;

  v5 = -[_HKAuthorizationRecord requestedSharing](self, "requestedSharing");
  v6 = -[_HKAuthorizationRecord requestedReading](self, "requestedReading");
  result = 1;
  switch(a3)
  {
    case 'd':
    case 'h':
      return result;
    case 'e':
      result = v5 && v6;
      break;
    case 'f':
      result = v5;
      break;
    case 'g':
      result = v6;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (_HKAuthorizationRecord)recordWithReadingDisabled
{
  int64_t v3;
  void *v4;

  v3 = -[_HKAuthorizationRecord status](self, "status");
  if (-[_HKAuthorizationRecord status](self, "status") == 101)
  {
    v3 = 102;
  }
  else if (-[_HKAuthorizationRecord status](self, "status") == 103)
  {
    v3 = 104;
  }
  -[_HKAuthorizationRecord _deepCopy](self, "_deepCopy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStatus:", v3);
  return (_HKAuthorizationRecord *)v4;
}

- (_HKAuthorizationRecord)recordWithSharingDisabled
{
  int64_t v3;
  void *v4;

  v3 = -[_HKAuthorizationRecord status](self, "status");
  if (-[_HKAuthorizationRecord status](self, "status") == 101)
  {
    v3 = 103;
  }
  else if (-[_HKAuthorizationRecord status](self, "status") == 102)
  {
    v3 = 104;
  }
  -[_HKAuthorizationRecord _deepCopy](self, "_deepCopy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStatus:", v3);
  return (_HKAuthorizationRecord *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKAuthorizationRecord)initWithCoder:(id)a3
{
  id v4;
  _HKAuthorizationRecord *v5;
  uint64_t v6;
  NSDate *anchorLimitModifiedDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKAuthorizationRecord;
  v5 = -[_HKAuthorizationRecord init](&v9, sel_init);
  if (v5)
  {
    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    v5->_request = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("request"));
    v5->_mode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anchor_limit_mod_date"));
    v6 = objc_claimAutoreleasedReturnValue();
    anchorLimitModifiedDate = v5->_anchorLimitModifiedDate;
    v5->_anchorLimitModifiedDate = (NSDate *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t status;
  id v5;

  status = self->_status;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", status, CFSTR("status"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_request, CFSTR("request"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mode, CFSTR("mode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_anchorLimitModifiedDate, CFSTR("anchor_limit_mod_date"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  __CFString *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  int64_t mode;
  NSDate *anchorLimitModifiedDate;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = self->_status - 100;
  if (v5 > 4)
    v6 = 0;
  else
    v6 = off_1E37F7018[v5];
  v7 = self->_request - 200;
  if (v7 > 3)
    v8 = 0;
  else
    v8 = off_1E37F6FF8[v7];
  v9 = CFSTR("anchor-limited");
  mode = self->_mode;
  anchorLimitModifiedDate = self->_anchorLimitModifiedDate;
  if (mode != 1)
    v9 = 0;
  if (!mode)
    v9 = CFSTR("unlimited");
  if (anchorLimitModifiedDate)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = v9;
    objc_msgSend(v12, "stringWithFormat:", CFSTR(" anchor-updated:%@"), anchorLimitModifiedDate);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p status:%@ request:%@ mode:%@%@>"), v4, self, v6, v8, v13, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v9;
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p status:%@ request:%@ mode:%@%@>"), v4, self, v6, v8, v14, &stru_1E37FD4C0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)request
{
  return self->_request;
}

- (int64_t)mode
{
  return self->_mode;
}

- (NSDate)anchorLimitModifiedDate
{
  return self->_anchorLimitModifiedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorLimitModifiedDate, 0);
}

@end
