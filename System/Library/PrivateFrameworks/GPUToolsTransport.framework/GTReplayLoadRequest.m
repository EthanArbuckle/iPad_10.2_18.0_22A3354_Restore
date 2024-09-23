@implementation GTReplayLoadRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayLoadRequest)initWithCoder:(id)a3
{
  id v4;
  GTReplayLoadRequest *v5;
  void *v6;
  uint64_t v7;
  NSURL *gputraceURL;
  GTReplayLoadRequest *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GTReplayLoadRequest;
  v5 = -[GTReplayRequest init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gputraceURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    gputraceURL = v5->_gputraceURL;
    v5->_gputraceURL = (NSURL *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *gputraceURL;
  id v4;
  id v5;

  gputraceURL = self->_gputraceURL;
  v4 = a3;
  -[NSURL path](gputraceURL, "path");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("gputraceURL"));

}

- (NSURL)gputraceURL
{
  return self->_gputraceURL;
}

- (void)setGputraceURL:(id)a3
{
  objc_storeStrong((id *)&self->_gputraceURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gputraceURL, 0);
}

@end
