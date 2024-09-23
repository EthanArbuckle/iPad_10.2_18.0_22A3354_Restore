@implementation CKContextItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKContextItem)initWithCoder:(id)a3
{
  id v4;
  CKContextItem *v5;
  NSString *v6;
  NSString *title;
  NSString *v8;
  uint64_t v9;
  NSString *topicId;
  CKContextItem *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKContextItem;
  v5 = -[CKContextItem init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v11 = 0;
      goto LABEL_6;
    }
    title = v5->_title;
    v5->_title = v6;
    v8 = v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topicId"));
    v9 = objc_claimAutoreleasedReturnValue();
    topicId = v5->_topicId;
    v5->_topicId = (NSString *)v9;

  }
  v11 = v5;
LABEL_6:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_topicId, CFSTR("topicId"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v4, "setTitle:", self->_title);
  objc_msgSend(v4, "setTopicId:", self->_topicId);
  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CKContextItem title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 31 * objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)topicId
{
  return self->_topicId;
}

- (void)setTopicId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicId, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
