@implementation MPMediaKitContentReport

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[MPMediaKitContentReport userID](self, "userID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setUserID:", v6);

  -[MPMediaKitContentReport concernItemID](self, "concernItemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setConcernItemID:", v8);

  -[MPMediaKitContentReport concernTypeID](self, "concernTypeID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setConcernTypeID:", v10);

  objc_msgSend(v4, "setConcernItemType:", -[MPMediaKitContentReport concernItemType](self, "concernItemType"));
  -[MPMediaKitContentReport commentText](self, "commentText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setCommentText:", v12);

  -[MPMediaKitContentReport displayText](self, "displayText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setDisplayText:", v14);

  -[MPMediaKitContentReport parentContentID](self, "parentContentID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setParentContentID:", v16);

  -[MPMediaKitContentReport parentConcernType](self, "parentConcernType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setParentConcernType:", v18);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaKitContentReport concernItemID](self, "concernItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaKitContentReport concernTypeID](self, "concernTypeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@:'%@'>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)concernItemID
{
  return self->_concernItemID;
}

- (void)setConcernItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)concernItemType
{
  return self->_concernItemType;
}

- (void)setConcernItemType:(int64_t)a3
{
  self->_concernItemType = a3;
}

- (NSString)commentText
{
  return self->_commentText;
}

- (void)setCommentText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)concernTypeID
{
  return self->_concernTypeID;
}

- (void)setConcernTypeID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)parentContentID
{
  return self->_parentContentID;
}

- (void)setParentContentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)parentConcernType
{
  return self->_parentConcernType;
}

- (void)setParentConcernType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_parentConcernType, 0);
  objc_storeStrong((id *)&self->_parentContentID, 0);
  objc_storeStrong((id *)&self->_concernTypeID, 0);
  objc_storeStrong((id *)&self->_commentText, 0);
  objc_storeStrong((id *)&self->_concernItemID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

@end
