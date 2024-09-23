@implementation NSFileProviderMovingResponse

+ (id)providingRequiredResponse
{
  _WORD *v2;

  v2 = (_WORD *)objc_opt_new();
  v2[4] = 257;
  return v2;
}

+ (id)providingNotRequiredResponseWithSyncRootID:(unint64_t)a3
{
  uint64_t v4;

  v4 = objc_opt_new();
  *(_WORD *)(v4 + 8) = 0;
  *(_QWORD *)(v4 + 16) = a3;
  return (id)v4;
}

- (NSNumber)syncRootID
{
  if (self->_syncRootID)
    return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  else
    return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileProviderMovingResponse instances should only ever be encoded by XPC"), 0));
  objc_msgSend(a3, "encodeBool:forKey:", self->_requiresProviding, CFSTR("requiresProviding"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_requiresAccessorBlockMaterializationPolicy, CFSTR("requiresMaterialization"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFileProviderMovingResponse syncRootID](self, "syncRootID"), CFSTR("syncRootID"));
}

- (NSFileProviderMovingResponse)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileProviderMovingResponse should only ever be decoded by XPC"), 0));
  }
  self->_requiresProviding = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("requiresProviding"));
  self->_requiresAccessorBlockMaterializationPolicy = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("requiresMaterialization"));
  self->_syncRootID = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("syncRootID")), "unsignedLongLongValue");
  return self;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Requires providing: %@, syncRootID: %llu"), NSStringFromBOOL(self->_requiresProviding), self->_syncRootID);
}

- (BOOL)requiresProviding
{
  return self->_requiresProviding;
}

- (BOOL)requiresAccessorBlockMaterializationPolicy
{
  return self->_requiresAccessorBlockMaterializationPolicy;
}

- (void)setRequiresAccessorBlockMaterializationPolicy:(BOOL)a3
{
  self->_requiresAccessorBlockMaterializationPolicy = a3;
}

@end
