@implementation PARSearchReplayRequest

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PARSearchReplayRequest;
  v4 = a3;
  -[PARSearchRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_replaySearchURL, CFSTR("replaySearchUrl"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_replayHeaderItems, CFSTR("replayHeaderItems"));

}

- (PARSearchReplayRequest)initWithCoder:(id)a3
{
  id v4;
  PARSearchReplayRequest *v5;
  uint64_t v6;
  NSString *replaySearchURL;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *replayHeaderItems;
  objc_super v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PARSearchReplayRequest;
  v5 = -[PARSearchRequest initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("replaySearchUrl"));
    v6 = objc_claimAutoreleasedReturnValue();
    replaySearchURL = v5->_replaySearchURL;
    v5->_replaySearchURL = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("replayHeaderItems"));
    v11 = objc_claimAutoreleasedReturnValue();
    replayHeaderItems = v5->_replayHeaderItems;
    v5->_replayHeaderItems = (NSDictionary *)v11;

  }
  return v5;
}

- (NSString)replaySearchURL
{
  return self->_replaySearchURL;
}

- (void)setReplaySearchURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSDictionary)replayHeaderItems
{
  return self->_replayHeaderItems;
}

- (void)setReplayHeaderItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replayHeaderItems, 0);
  objc_storeStrong((id *)&self->_replaySearchURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
