@implementation ICInstrumentationUtilitiesRecentPasswordMode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  id v8;

  v4 = a3;
  v5 = -[ICInstrumentationUtilitiesRecentPasswordMode lockedNotesMode](self, "lockedNotesMode");
  NSStringFromSelector(sel_lockedNotesMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  v7 = -[ICInstrumentationUtilitiesRecentPasswordMode contextPath](self, "contextPath");
  NSStringFromSelector(sel_contextPath);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

}

- (ICInstrumentationUtilitiesRecentPasswordMode)initWithCoder:(id)a3
{
  id v4;
  ICInstrumentationUtilitiesRecentPasswordMode *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICInstrumentationUtilitiesRecentPasswordMode;
  v5 = -[ICInstrumentationUtilitiesRecentPasswordMode init](&v9, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_lockedNotesMode);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_lockedNotesMode = objc_msgSend(v4, "decodeIntegerForKey:", v6);

    NSStringFromSelector(sel_contextPath);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_contextPath = objc_msgSend(v4, "decodeIntegerForKey:", v7);

  }
  return v5;
}

- (signed)lockedNotesMode
{
  return self->_lockedNotesMode;
}

- (void)setLockedNotesMode:(signed __int16)a3
{
  self->_lockedNotesMode = a3;
}

- (int64_t)contextPath
{
  return self->_contextPath;
}

- (void)setContextPath:(int64_t)a3
{
  self->_contextPath = a3;
}

@end
