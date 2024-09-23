@implementation FCBundleSubscriptionChangeSet

- (FCBundleSubscriptionChangeSet)initWithTagIDsAdded:(id)a3 tagIDsRemoved:(id)a4
{
  id v6;
  id v7;
  FCBundleSubscriptionChangeSet *v8;
  uint64_t v9;
  NSArray *tagIDsAdded;
  uint64_t v11;
  NSArray *tagIDsRemoved;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCBundleSubscriptionChangeSet;
  v8 = -[FCBundleSubscriptionChangeSet init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    tagIDsAdded = v8->_tagIDsAdded;
    v8->_tagIDsAdded = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    tagIDsRemoved = v8->_tagIDsRemoved;
    v8->_tagIDsRemoved = (NSArray *)v11;

  }
  return v8;
}

- (NSArray)tagIDsAdded
{
  return self->_tagIDsAdded;
}

- (void)setTagIDsAdded:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)tagIDsRemoved
{
  return self->_tagIDsRemoved;
}

- (void)setTagIDsRemoved:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagIDsRemoved, 0);
  objc_storeStrong((id *)&self->_tagIDsAdded, 0);
}

@end
