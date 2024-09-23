@implementation EKVirtualConferenceJoinMethod

- (EKVirtualConferenceJoinMethod)initWithTitle:(id)a3 url:(id)a4
{
  id v6;
  id v7;
  EKVirtualConferenceJoinMethod *v8;
  uint64_t v9;
  NSString *title;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EKVirtualConferenceJoinMethod;
  v8 = -[EKVirtualConferenceJoinMethod init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    objc_storeStrong((id *)&v8->_URL, a4);
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTitle:url:", self->_title, self->_URL);
  objc_msgSend(v4, "setIsBroadcast:", self->_isBroadcast);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  EKVirtualConferenceJoinMethod *v4;
  EKVirtualConferenceJoinMethod *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;

  v4 = (EKVirtualConferenceJoinMethod *)a3;
  if (v4 == self)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[EKVirtualConferenceJoinMethod isBroadcast](v5, "isBroadcast");
      v7 = -[EKVirtualConferenceJoinMethod isBroadcast](self, "isBroadcast");
      -[EKVirtualConferenceJoinMethod title](v5, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKVirtualConferenceJoinMethod title](self, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (CalEqualStrings())
      {
        v10 = v6 ^ v7 ^ 1;
        -[EKVirtualConferenceJoinMethod URL](v5, "URL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKVirtualConferenceJoinMethod URL](self, "URL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CalEqualObjects() & v10;

      }
      else
      {
        LOBYTE(v13) = 0;
      }

    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (id)description
{
  void *v2;
  NSString *title;
  NSURL *URL;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  title = self->_title;
  URL = self->_URL;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isBroadcast);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("EKVirtualConferenceJoinMethod title: %@, url: %@, isBroadcast: %@"), title, URL, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (BOOL)isBroadcast
{
  return self->_isBroadcast;
}

- (void)setIsBroadcast:(BOOL)a3
{
  self->_isBroadcast = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
