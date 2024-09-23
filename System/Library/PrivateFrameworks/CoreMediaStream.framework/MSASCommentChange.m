@implementation MSASCommentChange

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)MSASCommentChange;
  -[MSASCommentChange description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MSASCommentChange type](self, "type");
  -[MSASCommentChange comment](self, "comment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Type: %d, comment: %@, deletion index: %d"), v4, v5, v6, -[MSASCommentChange deletionIndex](self, "deletionIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MSASComment)comment
{
  return self->_comment;
}

- (void)setComment:(id)a3
{
  objc_storeStrong((id *)&self->_comment, a3);
}

- (int)deletionIndex
{
  return self->_deletionIndex;
}

- (void)setDeletionIndex:(int)a3
{
  self->_deletionIndex = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comment, 0);
}

@end
