@implementation EKVirtualConferenceURLDescriptor

- (EKVirtualConferenceURLDescriptor)initWithTitle:(NSString *)title URL:(NSURL *)URL
{
  NSString *v7;
  NSURL *v8;
  EKVirtualConferenceURLDescriptor *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v7 = title;
  v8 = URL;
  v13.receiver = self;
  v13.super_class = (Class)EKVirtualConferenceURLDescriptor;
  v9 = -[EKVirtualConferenceURLDescriptor init](&v13, sel_init);
  if (v9)
  {
    -[NSURL absoluteString](v8, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (!v11)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("url is empty"));
    objc_storeStrong((id *)&v9->_title, title);
    objc_storeStrong((id *)&v9->_URL, URL);
  }

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
