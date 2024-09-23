@implementation CommunicationFilterItemCache

- (CommunicationFilterItemCache)initWithFilterItem:(id)a3 isInList:(int64_t)a4
{
  id v7;
  CommunicationFilterItemCache *v8;
  CommunicationFilterItemCache *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CommunicationFilterItemCache;
  v8 = -[CommunicationFilterItemCache init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_filterItem, a3);
    v9->_isInList = a4;
  }

  return v9;
}

- (BOOL)matchesItem:(id)a3
{
  return -[CommunicationFilterItem matchesFilterItem:](self->_filterItem, "matchesFilterItem:", a3);
}

- (int64_t)isInList
{
  return self->_isInList;
}

- (void)setIsInList:(int64_t)a3
{
  self->_isInList = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterItem, 0);
}

@end
