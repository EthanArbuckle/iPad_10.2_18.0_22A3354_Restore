@implementation NNCLastNewsStoryResult

- (NNCLastNewsStoryResult)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NNCLastNewsStoryResult;
  return -[NNCLastNewsStoryResult init](&v3, sel_init);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  -[NNCLastNewsStoryResult headlineIdentifier](self, "headlineIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NNCLastNewsStoryResult headlineTitle](self, "headlineTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[NNCLastNewsStoryResult sectionName](self, "sectionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[NNCLastNewsStoryResult headlineIndex](self, "headlineIndex");
  v10 = v9 ^ -[NNCLastNewsStoryResult totalHeadlineCount](self, "totalHeadlineCount");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  char v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[NNCLastNewsStoryResult headlineIdentifier](self, "headlineIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "headlineIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v11 = 0;
    }
    else
    {
      -[NNCLastNewsStoryResult headlineIdentifier](self, "headlineIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "headlineIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      v11 = v10 ^ 1;
    }

    -[NNCLastNewsStoryResult headlineTitle](self, "headlineTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "headlineTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v18 = 0;
    }
    else
    {
      -[NNCLastNewsStoryResult headlineTitle](self, "headlineTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "headlineTitle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      v18 = v17 ^ 1;
    }

    -[NNCLastNewsStoryResult sectionName](self, "sectionName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sectionName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == v20)
    {
      v24 = 0;
    }
    else
    {
      -[NNCLastNewsStoryResult sectionName](self, "sectionName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sectionName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqualToString:", v22);

      v24 = v23 ^ 1;
    }

    v25 = -[NNCLastNewsStoryResult headlineIndex](self, "headlineIndex");
    v26 = objc_msgSend(v5, "headlineIndex");
    v27 = -[NNCLastNewsStoryResult totalHeadlineCount](self, "totalHeadlineCount");
    v28 = objc_msgSend(v5, "totalHeadlineCount");
    v12 = 0;
    if (((v11 | v18) & 1) == 0 && (v24 & 1) == 0)
      v12 = v25 == v26 && v27 == v28;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)headlineIdentifier
{
  return self->_headlineIdentifier;
}

- (void)setHeadlineIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)headlineTitle
{
  return self->_headlineTitle;
}

- (void)setHeadlineTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)sectionName
{
  return self->_sectionName;
}

- (void)setSectionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (void)setSourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)excerpt
{
  return self->_excerpt;
}

- (void)setExcerpt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)headlineIndex
{
  return self->_headlineIndex;
}

- (void)setHeadlineIndex:(unint64_t)a3
{
  self->_headlineIndex = a3;
}

- (unint64_t)totalHeadlineCount
{
  return self->_totalHeadlineCount;
}

- (void)setTotalHeadlineCount:(unint64_t)a3
{
  self->_totalHeadlineCount = a3;
}

- (int64_t)family
{
  return self->_family;
}

- (void)setFamily:(int64_t)a3
{
  self->_family = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excerpt, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionName, 0);
  objc_storeStrong((id *)&self->_headlineTitle, 0);
  objc_storeStrong((id *)&self->_headlineIdentifier, 0);
}

@end
