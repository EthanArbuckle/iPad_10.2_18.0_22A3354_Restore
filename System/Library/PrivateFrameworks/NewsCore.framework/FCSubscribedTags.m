@implementation FCSubscribedTags

- (FCSubscribedTags)initWithSubscribedTags:(id)a3 mutedTags:(id)a4 autoFavoriteTags:(id)a5 groupableTags:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FCSubscribedTags *v14;
  FCSubscribedTags *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)FCSubscribedTags;
  v14 = -[FCSubscribedTags init](&v22, sel_init);
  v15 = v14;
  if (v14)
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
    if (v10)
      v17 = v10;
    else
      v17 = (id)MEMORY[0x1E0C9AA60];
    -[FCSubscribedTags setSubscribedTags:](v14, "setSubscribedTags:", v17);
    if (v11)
      v18 = v11;
    else
      v18 = v16;
    -[FCSubscribedTags setMutedTags:](v15, "setMutedTags:", v18);
    if (v12)
      v19 = v12;
    else
      v19 = v16;
    -[FCSubscribedTags setAutoFavoriteTags:](v15, "setAutoFavoriteTags:", v19);
    if (v13)
      v20 = v13;
    else
      v20 = v16;
    -[FCSubscribedTags setGroupableTags:](v15, "setGroupableTags:", v20);
  }

  return v15;
}

- (NSArray)subscribedTags
{
  return self->_subscribedTags;
}

- (void)setSubscribedTags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)mutedTags
{
  return self->_mutedTags;
}

- (void)setMutedTags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)autoFavoriteTags
{
  return self->_autoFavoriteTags;
}

- (void)setAutoFavoriteTags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)groupableTags
{
  return self->_groupableTags;
}

- (void)setGroupableTags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupableTags, 0);
  objc_storeStrong((id *)&self->_autoFavoriteTags, 0);
  objc_storeStrong((id *)&self->_mutedTags, 0);
  objc_storeStrong((id *)&self->_subscribedTags, 0);
}

@end
