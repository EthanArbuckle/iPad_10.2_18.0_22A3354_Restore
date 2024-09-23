@implementation SWHighlightMentionEvent

- (SWHighlightMentionEvent)initWithHighlightURL:(id)a3 mentionedPersonHandle:(id)a4 mentionedPersonIdentity:(id)a5
{
  id v9;
  id v10;
  id v11;
  SWHighlightMentionEvent *v12;
  SWHighlightMentionEvent *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SWHighlightMentionEvent;
  v12 = -[SWHighlightMentionEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_highlightURL, a3);
    objc_storeStrong((id *)&v13->_mentionedPersonHandle, a4);
    objc_storeStrong((id *)&v13->_mentionedPersonIdentity, a5);
  }

  return v13;
}

- (SWHighlightMentionEvent)initWithHighlight:(SWHighlight *)highlight mentionedPersonCloudKitShareHandle:(NSString *)handle
{
  NSString *v6;
  void *v7;
  SWHighlightMentionEvent *v8;

  v6 = handle;
  -[SWHighlight URL](highlight, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SWHighlightMentionEvent initWithHighlightURL:mentionedPersonHandle:mentionedPersonIdentity:](self, "initWithHighlightURL:mentionedPersonHandle:mentionedPersonIdentity:", v7, v6, 0);

  return v8;
}

- (SWHighlightMentionEvent)initWithHighlight:(SWHighlight *)highlight mentionedPersonIdentity:(SWPersonIdentity *)identity
{
  SWPersonIdentity *v6;
  void *v7;
  SWHighlightMentionEvent *v8;

  v6 = identity;
  -[SWHighlight URL](highlight, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SWHighlightMentionEvent initWithHighlightURL:mentionedPersonHandle:mentionedPersonIdentity:](self, "initWithHighlightURL:mentionedPersonHandle:mentionedPersonIdentity:", v7, &stru_1E2875070, v6);

  return v8;
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
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[SWHighlightMentionEvent highlightURL](self, "highlightURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_highlightURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SWHighlightMentionEvent mentionedPersonHandle](self, "mentionedPersonHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_mentionedPersonHandle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[SWHighlightMentionEvent mentionedPersonIdentity](self, "mentionedPersonIdentity");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_mentionedPersonIdentity);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (SWHighlightMentionEvent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  SWHighlightMentionEvent *v14;
  NSObject *v15;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_highlightURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_mentionedPersonHandle);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_mentionedPersonIdentity);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    self = -[SWHighlightMentionEvent initWithHighlightURL:mentionedPersonHandle:mentionedPersonIdentity:](self, "initWithHighlightURL:mentionedPersonHandle:mentionedPersonIdentity:", v7, v10, v13);
    v14 = self;
  }
  else
  {
    SWFrameworkLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SWHighlightMentionEvent initWithCoder:].cold.1(v15);

    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[SWHighlightMentionEvent highlightURL](self, "highlightURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWHighlightMentionEvent mentionedPersonHandle](self, "mentionedPersonHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWHighlightMentionEvent mentionedPersonIdentity](self, "mentionedPersonIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithHighlightURL:mentionedPersonHandle:mentionedPersonIdentity:", v5, v6, v7);

  return v8;
}

- (NSURL)highlightURL
{
  return self->_highlightURL;
}

- (NSString)mentionedPersonHandle
{
  return self->_mentionedPersonHandle;
}

- (_SWPersonIdentity)mentionedPersonIdentity
{
  return self->_mentionedPersonIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionedPersonIdentity, 0);
  objc_storeStrong((id *)&self->_mentionedPersonHandle, 0);
  objc_storeStrong((id *)&self->_highlightURL, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EAB1000, log, OS_LOG_TYPE_ERROR, "SWHighlightMentionEvent failed to decode highlight", v1, 2u);
}

@end
