@implementation FCForYouGroupConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setPrecedingGroupsCountForFirstGroup:(unint64_t)a3
{
  self->_precedingGroupsCountForFirstGroup = a3;
}

- (void)setPrecedingGroupsCount:(unint64_t)a3
{
  self->_precedingGroupsCount = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setGroupType:(int64_t)a3
{
  self->_groupType = a3;
}

- (void)setGroupPosition:(unint64_t)a3
{
  self->_groupPosition = a3;
}

- (void)setAllowsNativeAds:(BOOL)a3
{
  self->_allowsNativeAds = a3;
}

- (unint64_t)precedingGroupsCount
{
  return self->_precedingGroupsCount;
}

- (int64_t)compareGroupPosition:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[FCForYouGroupConfiguration groupPosition](self, "groupPosition"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "groupPosition");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (id)copyWithGroupPosition:(unint64_t)a3 precedingGroupsCount:(unint64_t)a4 precedingGroupsCountForFirstGroup:(unint64_t)a5
{
  FCForYouGroupConfiguration *v9;
  void *v10;

  v9 = objc_alloc_init(FCForYouGroupConfiguration);
  -[FCForYouGroupConfiguration identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCForYouGroupConfiguration setIdentifier:](v9, "setIdentifier:", v10);

  -[FCForYouGroupConfiguration setGroupType:](v9, "setGroupType:", -[FCForYouGroupConfiguration groupType](self, "groupType"));
  -[FCForYouGroupConfiguration setGroupPosition:](v9, "setGroupPosition:", a3);
  -[FCForYouGroupConfiguration setPrecedingGroupsCount:](v9, "setPrecedingGroupsCount:", a4);
  -[FCForYouGroupConfiguration setPrecedingGroupsCountForFirstGroup:](v9, "setPrecedingGroupsCountForFirstGroup:", a5);
  -[FCForYouGroupConfiguration setAllowsNativeAds:](v9, "setAllowsNativeAds:", -[FCForYouGroupConfiguration allowsNativeAds](self, "allowsNativeAds"));
  return v9;
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)allowsNativeAds
{
  return self->_allowsNativeAds;
}

- (unint64_t)groupPosition
{
  return self->_groupPosition;
}

- (unint64_t)precedingGroupsCountForFirstGroup
{
  return self->_precedingGroupsCountForFirstGroup;
}

@end
