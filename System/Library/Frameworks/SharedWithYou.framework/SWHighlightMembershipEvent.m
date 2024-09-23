@implementation SWHighlightMembershipEvent

- (SWHighlightMembershipEvent)initWithHighlightURL:(id)a3 type:(int64_t)a4
{
  id v7;
  SWHighlightMembershipEvent *v8;
  SWHighlightMembershipEvent *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SWHighlightMembershipEvent;
  v8 = -[SWHighlightMembershipEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_highlightURL, a3);
    v9->_membershipEventType = a4;
  }

  return v9;
}

- (SWHighlightMembershipEvent)initWithHighlight:(SWHighlight *)highlight trigger:(SWHighlightMembershipEventTrigger)trigger
{
  void *v6;
  SWHighlightMembershipEvent *v7;

  -[SWHighlight URL](highlight, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SWHighlightMembershipEvent initWithHighlightURL:type:](self, "initWithHighlightURL:type:", v6, trigger);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  id v8;

  v4 = a3;
  -[SWHighlightMembershipEvent highlightURL](self, "highlightURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_highlightURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[SWHighlightMembershipEvent membershipEventType](self, "membershipEventType");
  NSStringFromSelector(sel_membershipEventType);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

}

- (SWHighlightMembershipEvent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SWHighlightMembershipEvent *v10;
  NSObject *v11;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_highlightURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_membershipEventType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", v8);

  if (v7)
  {
    self = -[SWHighlightMembershipEvent initWithHighlightURL:type:](self, "initWithHighlightURL:type:", v7, v9);
    v10 = self;
  }
  else
  {
    SWFrameworkLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SWHighlightMembershipEvent initWithCoder:].cold.1(v11);

    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[SWHighlightMembershipEvent highlightURL](self, "highlightURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHighlightURL:type:", v5, -[SWHighlightMembershipEvent membershipEventType](self, "membershipEventType"));

  return v6;
}

- (NSURL)highlightURL
{
  return self->_highlightURL;
}

- (int64_t)membershipEventType
{
  return self->_membershipEventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightURL, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EAB1000, log, OS_LOG_TYPE_ERROR, "SWHighlightMembershipEvent failed to decode highlightURL", v1, 2u);
}

@end
