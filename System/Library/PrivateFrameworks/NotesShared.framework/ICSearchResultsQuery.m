@implementation ICSearchResultsQuery

- (id)attributesToFetch
{
  NSArray *attributes;
  objc_super v4;

  attributes = self->_attributes;
  if (attributes)
    return attributes;
  v4.receiver = self;
  v4.super_class = (Class)ICSearchResultsQuery;
  -[ICSearchQuery attributesToFetch](&v4, sel_attributesToFetch);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newSearchQueryWithContext:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0CA6B28];
  v5 = a3;
  v6 = [v4 alloc];
  -[ICSearchResultsQuery queryString](self, "queryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithQueryString:context:", v7, v5);

  return v8;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (id)newSearchQueryContext
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CA6B30]);
  -[ICSearchQuery rankingQueries](self, "rankingQueries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRankingQueries:", v4);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
}

+ (id)queryForClassifiedImages
{
  ICSearchResultsQuery *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  ICSearchResultsQuery *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = [ICSearchResultsQuery alloc];
  v3 = *MEMORY[0x1E0CA65C0];
  v8[0] = *MEMORY[0x1E0CA6590];
  v8[1] = v3;
  v4 = *MEMORY[0x1E0CA6658];
  v8[2] = *MEMORY[0x1E0CA6608];
  v8[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICSearchResultsQuery initWithQueryString:externalRankingQueries:modernResultsOnly:attributes:](v2, "initWithQueryString:externalRankingQueries:modernResultsOnly:attributes:", CFSTR("*==*"), 0, 0, v5);

  return v6;
}

- (ICSearchResultsQuery)initWithQueryString:(id)a3 externalRankingQueries:(id)a4 modernResultsOnly:(BOOL)a5 attributes:(id)a6
{
  id v11;
  id v12;
  ICSearchResultsQuery *v13;
  ICSearchResultsQuery *v14;
  objc_super v16;

  v11 = a3;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ICSearchResultsQuery;
  v13 = -[ICSearchQuery initWithExternalRankingQueries:](&v16, sel_initWithExternalRankingQueries_, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queryString, a3);
    v14->_modernResultsOnly = a5;
    objc_storeStrong((id *)&v14->_attributes, a6);
  }

  return v14;
}

- (ICSearchResultsQuery)initWithQueryString:(id)a3 rankingQueriesDefinition:(id)a4 modernResultsOnly:(BOOL)a5
{
  id v9;
  ICSearchResultsQuery *v10;
  ICSearchResultsQuery *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICSearchResultsQuery;
  v10 = -[ICSearchQuery initWithRankingQueriesDefinition:](&v13, sel_initWithRankingQueriesDefinition_, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queryString, a3);
    v11->_modernResultsOnly = a5;
  }

  return v11;
}

- (ICSearchResultsQuery)initWithQueryString:(id)a3 externalRankingQueries:(id)a4 modernResultsOnly:(BOOL)a5
{
  return -[ICSearchResultsQuery initWithQueryString:externalRankingQueries:modernResultsOnly:attributes:](self, "initWithQueryString:externalRankingQueries:modernResultsOnly:attributes:", a3, a4, a5, 0);
}

- (BOOL)modernResultsOnly
{
  return self->_modernResultsOnly;
}

- (void)setQueryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

@end
