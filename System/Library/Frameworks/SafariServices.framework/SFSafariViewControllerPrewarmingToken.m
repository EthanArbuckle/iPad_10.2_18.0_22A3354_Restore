@implementation SFSafariViewControllerPrewarmingToken

- (SFSafariViewControllerPrewarmingToken)initWithURLs:(id)a3
{
  id v5;
  SFSafariViewControllerPrewarmingToken *v6;
  SFSafariViewControllerPrewarmingToken *v7;
  uint64_t v8;
  SFSafariViewControllerPrewarmingToken *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFSafariViewControllerPrewarmingToken;
  v6 = -[SFSafariViewControllerPrewarmingToken init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URLs, a3);
    v7->_valid = 1;
    v8 = initWithURLs__requestID++;
    v7->_requestID = v8;
    v9 = v7;
  }

  return v7;
}

- (void)invalidate
{
  id v3;

  if (self->_valid)
  {
    self->_valid = 0;
    +[_SFSafariViewControllerPrewarmingSession sharedSessionIfExists](_SFSafariViewControllerPrewarmingSession, "sharedSessionIfExists");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tokenWithIDDidInvalidate:", self->_requestID);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[SFSafariViewControllerPrewarmingToken invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SFSafariViewControllerPrewarmingToken;
  -[SFSafariViewControllerPrewarmingToken dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  SFSafariViewControllerPrewarmingToken *v4;
  SFSafariViewControllerPrewarmingToken *v5;
  BOOL v6;

  v4 = (SFSafariViewControllerPrewarmingToken *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NSOrderedSet isEqualToOrderedSet:](self->_URLs, "isEqualToOrderedSet:", v5->_URLs)
        && self->_valid == v5->_valid
        && self->_requestID == v5->_requestID;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSafariViewControllerPrewarmingToken)initWithCoder:(id)a3
{
  id v4;
  SFSafariViewControllerPrewarmingToken *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSOrderedSet *URLs;
  SFSafariViewControllerPrewarmingToken *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFSafariViewControllerPrewarmingToken;
  v5 = -[SFSafariViewControllerPrewarmingToken init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("URLs"));
    v9 = objc_claimAutoreleasedReturnValue();
    URLs = v5->_URLs;
    v5->_URLs = (NSOrderedSet *)v9;

    v5->_valid = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("valid"));
    v5->_requestID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestID"));
    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSOrderedSet *URLs;
  id v5;

  URLs = self->_URLs;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", URLs, CFSTR("URLs"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_valid, CFSTR("valid"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_requestID, CFSTR("requestID"));

}

- (NSOrderedSet)URLs
{
  return self->_URLs;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLs, 0);
}

@end
