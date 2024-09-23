@implementation HLPHelpTopicHistoryItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HLPHelpTopicHistoryItem *v4;

  v4 = +[HLPHelpTopicHistoryItem allocWithZone:](HLPHelpTopicHistoryItem, "allocWithZone:", a3);
  -[HLPHelpTopicHistoryItem setIdentifier:](v4, "setIdentifier:", self->_identifier);
  -[HLPHelpTopicHistoryItem setName:](v4, "setName:", self->_name);
  -[HLPHelpTopicHistoryItem setContentSize:](v4, "setContentSize:", self->_contentSize.width, self->_contentSize.height);
  -[HLPHelpTopicHistoryItem setContentOffset:](v4, "setContentOffset:", self->_contentOffset.x, self->_contentOffset.y);
  -[HLPHelpTopicHistoryItem setAnchor:](v4, "setAnchor:", self->_anchor);
  return v4;
}

- (HLPHelpTopicHistoryItem)initWithCoder:(id)a3
{
  id v4;
  HLPHelpTopicHistoryItem *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *name;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  NSString *anchor;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HLPHelpTopicHistoryItem;
  v5 = -[HLPHelpTopicHistoryItem init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("HLPHelpHistoryIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("HLPHelpHistoryName"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("HLPHelpHistoryContentOffset"));
    v5->_contentOffset.x = v10;
    v5->_contentOffset.y = v11;
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("HLPHelpHistoryContentSize"));
    v5->_contentSize.width = v12;
    v5->_contentSize.height = v13;
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("HLPHelpHistoryAnchor"));
    v14 = objc_claimAutoreleasedReturnValue();
    anchor = v5->_anchor;
    v5->_anchor = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("HLPHelpHistoryIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("HLPHelpHistoryName"));
  objc_msgSend(v5, "encodeCGPoint:forKey:", CFSTR("HLPHelpHistoryContentOffset"), self->_contentOffset.x, self->_contentOffset.y);
  objc_msgSend(v5, "encodeCGSize:forKey:", CFSTR("HLPHelpHistoryContentSize"), self->_contentSize.width, self->_contentSize.height);
  objc_msgSend(v5, "encodeObject:forKey:", self->_anchor, CFSTR("HLPHelpHistoryAnchor"));

}

- (CGPoint)contentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentOffset.x;
  y = self->_contentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  self->_contentOffset = a3;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_anchor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
