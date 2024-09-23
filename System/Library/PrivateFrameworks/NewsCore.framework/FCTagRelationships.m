@implementation FCTagRelationships

- (FCTagRelationships)initWithRelatedChannelsForOnboarding:(id)a3
{
  id v4;
  FCTagRelationships *v5;
  uint64_t v6;
  NSArray *relatedChannelsForOnboarding;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCTagRelationships;
  v5 = -[FCTagRelationships init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    relatedChannelsForOnboarding = v5->_relatedChannelsForOnboarding;
    v5->_relatedChannelsForOnboarding = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)relatedChannelsForOnboarding
{
  return self->_relatedChannelsForOnboarding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedChannelsForOnboarding, 0);
}

@end
