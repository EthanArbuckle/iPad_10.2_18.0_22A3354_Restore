@implementation CalVirtualConferenceJoinMethod

- (CalVirtualConferenceJoinMethod)initWithTitle:(id)a3 URL:(id)a4 isBroadcast:(BOOL)a5
{
  id v9;
  id v10;
  CalVirtualConferenceJoinMethod *v11;
  CalVirtualConferenceJoinMethod *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CalVirtualConferenceJoinMethod;
  v11 = -[CalVirtualConferenceJoinMethod init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    objc_storeStrong((id *)&v12->_URL, a4);
    v12->_isBroadcast = a5;
  }

  return v12;
}

- (id)description
{
  CalDescriptionBuilder *v3;
  void *v4;
  CalDescriptionBuilder *v5;
  void *v6;
  objc_super v8;

  v3 = [CalDescriptionBuilder alloc];
  v8.receiver = self;
  v8.super_class = (Class)CalVirtualConferenceJoinMethod;
  -[CalVirtualConferenceJoinMethod description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CalDescriptionBuilder initWithSuperclassDescription:](v3, "initWithSuperclassDescription:", v4);

  -[CalDescriptionBuilder setKey:withString:](v5, "setKey:withString:", CFSTR("title"), self->_title);
  -[CalDescriptionBuilder setKey:withObject:](v5, "setKey:withObject:", CFSTR("URL"), self->_URL);
  -[CalDescriptionBuilder setKey:withBoolean:](v5, "setKey:withBoolean:", CFSTR("isBroadcast"), self->_isBroadcast);
  -[CalDescriptionBuilder build](v5, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CalVirtualConferenceJoinMethod *v4;
  CalVirtualConferenceJoinMethod *v5;
  NSString *title;
  void *v7;
  NSURL *URL;
  void *v9;
  _BOOL4 isBroadcast;
  BOOL v11;

  v4 = (CalVirtualConferenceJoinMethod *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      title = self->_title;
      -[CalVirtualConferenceJoinMethod title](v5, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (CalEqualStrings(title, v7))
      {
        URL = self->_URL;
        -[CalVirtualConferenceJoinMethod URL](v5, "URL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (CalEqualObjects(URL, v9))
        {
          isBroadcast = self->_isBroadcast;
          v11 = isBroadcast == -[CalVirtualConferenceJoinMethod isBroadcast](v5, "isBroadcast");
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)isBroadcast
{
  return self->_isBroadcast;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
