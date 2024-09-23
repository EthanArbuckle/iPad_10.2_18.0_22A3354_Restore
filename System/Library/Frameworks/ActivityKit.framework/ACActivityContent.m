@implementation ACActivityContent

- (ACActivityContent)initWithContentData:(id)a3 staleDate:(id)a4 relevanceScore:(double)a5
{
  id v9;
  id v10;
  ACActivityContent *v11;
  ACActivityContent *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ACActivityContent;
  v11 = -[ACActivityContent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contentData, a3);
    objc_storeStrong((id *)&v12->_staleDate, a4);
    v12->_relevanceScore = a5;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ACActivityContent *v4;
  void *v5;
  void *v6;
  ACActivityContent *v7;

  v4 = [ACActivityContent alloc];
  -[ACActivityContent contentData](self, "contentData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACActivityContent staleDate](self, "staleDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACActivityContent relevanceScore](self, "relevanceScore");
  v7 = -[ACActivityContent initWithContentData:staleDate:relevanceScore:](v4, "initWithContentData:staleDate:relevanceScore:", v5, v6);

  return v7;
}

- (NSData)contentData
{
  return self->_contentData;
}

- (void)setContentData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)staleDate
{
  return self->_staleDate;
}

- (void)setStaleDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)relevanceScore
{
  return self->_relevanceScore;
}

- (void)setRelevanceScore:(double)a3
{
  self->_relevanceScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staleDate, 0);
  objc_storeStrong((id *)&self->_contentData, 0);
}

@end
