@implementation FCGroupTypeFeature

- (FCGroupTypeFeature)initWithGroupType:(int64_t)a3
{
  FCGroupTypeFeature *v4;
  FCGroupTypeFeature *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *personalizationIdentifier;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FCGroupTypeFeature;
  v4 = -[FCPersonalizationFeature init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    -[FCGroupTypeFeature setGroupType:](v4, "setGroupType:", a3);
    v6 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromFCFeedGroupType(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("f6"), CFSTR("+"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    personalizationIdentifier = v5->super._personalizationIdentifier;
    v5->super._personalizationIdentifier = (NSString *)v8;

  }
  return v5;
}

- (FCGroupTypeFeature)initWithPersonalizationIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  FCGroupTypeFeature *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("+"));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "substringWithRange:", v5 + v6, objc_msgSend(v4, "length") - (v5 + v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[FCGroupTypeFeature initWithGroupType:](self, "initWithGroupType:", FCFeedGroupTypeFromNSString(v8));

    v7 = self;
  }

  return v7;
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (void)setGroupType:(int64_t)a3
{
  self->_groupType = a3;
}

@end
