@implementation FBKSFeedback

- (FBKSFeedback)initWithSwiftObject:(id)a3
{
  id v5;
  FBKSFeedback *v6;
  FBKSFeedback *v7;
  FBKSFeedback *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)FBKSFeedback;
    v6 = -[FBKSFeedback init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_swiftObject, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)formIdentifier
{
  void *v2;
  void *v3;

  -[FBKSFeedback swiftObject](self, "swiftObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)submissionDate
{
  void *v2;
  void *v3;

  -[FBKSFeedback swiftObject](self, "swiftObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submissionDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSString)build
{
  void *v2;
  void *v3;

  -[FBKSFeedback swiftObject](self, "swiftObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)ID
{
  void *v2;
  int64_t v3;

  -[FBKSFeedback swiftObject](self, "swiftObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "id");

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[FBKSFeedback swiftObject](self, "swiftObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setID:(int64_t)a3
{
  self->_ID = a3;
}

- (FBKSFeedback_FrameworkPrivateName)swiftObject
{
  return self->_swiftObject;
}

- (void)setSwiftObject:(id)a3
{
  objc_storeStrong((id *)&self->_swiftObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftObject, 0);
}

@end
