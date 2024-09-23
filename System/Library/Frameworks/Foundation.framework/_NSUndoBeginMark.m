@implementation _NSUndoBeginMark

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSUndoBeginMark;
  -[_NSUndoBeginMark dealloc](&v3, sel_dealloc);
}

- (void)setGroupIdentifier:(id)a3
{
  id groupIdentifier;

  groupIdentifier = self->_groupIdentifier;
  self->_groupIdentifier = (id)objc_msgSend(a3, "copyWithZone:", -[_NSUndoBeginMark zone](self, "zone"));

}

- (id)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setUserInfo:(id)a3
{
  NSMutableDictionary *userInfo;

  userInfo = self->_userInfo;
  self->_userInfo = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopyWithZone:", -[_NSUndoBeginMark zone](self, "zone"));

}

- (id)userInfo
{
  return self->_userInfo;
}

- (BOOL)isDiscardable
{
  return self->_isDiscardable;
}

- (void)setDiscardable:(BOOL)a3
{
  self->_isDiscardable = a3;
}

- (BOOL)isBeginMark
{
  return 1;
}

- (id)description
{
  const __CFString *groupIdentifier;
  _BOOL4 isDiscardable;
  NSMutableDictionary *userInfo;
  const __CFString *v5;
  const __CFString *v6;
  const char *v7;

  groupIdentifier = (const __CFString *)self->_groupIdentifier;
  isDiscardable = self->_isDiscardable;
  userInfo = self->_userInfo;
  if (userInfo)
    v5 = (const __CFString *)-[NSMutableDictionary description](userInfo, "description");
  else
    v5 = &stru_1E0F56070;
  if (groupIdentifier)
    v6 = groupIdentifier;
  else
    v6 = &stru_1E0F56070;
  v7 = "(discardable)";
  if (!isDiscardable)
    v7 = "";
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("beginUndoGrouping %@ %s %@"), v6, v7, v5);
}

@end
