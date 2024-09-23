@implementation CKChatItemCachedSizeMetrics

- (CKChatItemCachedSizeMetrics)initWithCoder:(id)a3
{
  id v4;
  CKChatItemCachedSizeMetrics *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(CKChatItemCachedSizeMetrics);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CGUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatItemCachedSizeMetrics setChatItemGUID:](v5, "setChatItemGUID:", v6);

  objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("CAS"));
  -[CKChatItemCachedSizeMetrics setSize:](v5, "setSize:");
  objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("CITAI"));
  -[CKChatItemCachedSizeMetrics setTextAlignmentInsets:](v5, "setTextAlignmentInsets:");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CILA"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKChatItemCachedSizeMetrics setLastAccess:](v5, "setLastAccess:", v7);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CKChatItemCachedSizeMetrics chatItemGUID](self, "chatItemGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CGUID"));

  -[CKChatItemCachedSizeMetrics size](self, "size");
  objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("CAS"));
  -[CKChatItemCachedSizeMetrics textAlignmentInsets](self, "textAlignmentInsets");
  objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", CFSTR("CITAI"));
  -[CKChatItemCachedSizeMetrics lastAccess](self, "lastAccess");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CILA"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  CGSize v9;
  UIEdgeInsets v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CKChatItemCachedSizeMetrics size](self, "size");
  NSStringFromCGSize(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatItemCachedSizeMetrics textAlignmentInsets](self, "textAlignmentInsets");
  NSStringFromUIEdgeInsets(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ - size %@ insets %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)chatItemGUID
{
  return self->_chatItemGUID;
}

- (void)setChatItemGUID:(id)a3
{
  objc_storeStrong((id *)&self->_chatItemGUID, a3);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (UIEdgeInsets)textAlignmentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textAlignmentInsets.top;
  left = self->_textAlignmentInsets.left;
  bottom = self->_textAlignmentInsets.bottom;
  right = self->_textAlignmentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTextAlignmentInsets:(UIEdgeInsets)a3
{
  self->_textAlignmentInsets = a3;
}

- (NSDate)lastAccess
{
  return self->_lastAccess;
}

- (void)setLastAccess:(id)a3
{
  objc_storeStrong((id *)&self->_lastAccess, a3);
}

- (IMDoubleLinkedListNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  objc_storeStrong((id *)&self->_node, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_lastAccess, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_chatItemGUID, 0);
}

@end
