@implementation ICASSearchResultExposureData

- (ICASSearchResultExposureData)initWithTopHitCountForLongestSearchString:(id)a3 hasNonTopHitResultsForLongestSearchString:(id)a4 attachmentHitCountForLongestSearchString:(id)a5 searchBufferArray:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICASSearchResultExposureData *v15;
  ICASSearchResultExposureData *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASSearchResultExposureData;
  v15 = -[ICASSearchResultExposureData init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_topHitCountForLongestSearchString, a3);
    objc_storeStrong((id *)&v16->_hasNonTopHitResultsForLongestSearchString, a4);
    objc_storeStrong((id *)&v16->_attachmentHitCountForLongestSearchString, a5);
    objc_storeStrong((id *)&v16->_searchBufferArray, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("SearchResultExposureData");
}

- (id)toDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("topHitCountForLongestSearchString");
  -[ICASSearchResultExposureData topHitCountForLongestSearchString](self, "topHitCountForLongestSearchString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASSearchResultExposureData topHitCountForLongestSearchString](self, "topHitCountForLongestSearchString");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = CFSTR("hasNonTopHitResultsForLongestSearchString");
  -[ICASSearchResultExposureData hasNonTopHitResultsForLongestSearchString](self, "hasNonTopHitResultsForLongestSearchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASSearchResultExposureData hasNonTopHitResultsForLongestSearchString](self, "hasNonTopHitResultsForLongestSearchString");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = CFSTR("attachmentHitCountForLongestSearchString");
  -[ICASSearchResultExposureData attachmentHitCountForLongestSearchString](self, "attachmentHitCountForLongestSearchString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASSearchResultExposureData attachmentHitCountForLongestSearchString](self, "attachmentHitCountForLongestSearchString");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = CFSTR("searchBufferArray");
  -[ICASSearchResultExposureData searchBufferArray](self, "searchBufferArray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ICASSearchResultExposureData searchBufferArray](self, "searchBufferArray");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v18[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSNumber)topHitCountForLongestSearchString
{
  return self->_topHitCountForLongestSearchString;
}

- (NSNumber)hasNonTopHitResultsForLongestSearchString
{
  return self->_hasNonTopHitResultsForLongestSearchString;
}

- (NSNumber)attachmentHitCountForLongestSearchString
{
  return self->_attachmentHitCountForLongestSearchString;
}

- (NSArray)searchBufferArray
{
  return self->_searchBufferArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBufferArray, 0);
  objc_storeStrong((id *)&self->_attachmentHitCountForLongestSearchString, 0);
  objc_storeStrong((id *)&self->_hasNonTopHitResultsForLongestSearchString, 0);
  objc_storeStrong((id *)&self->_topHitCountForLongestSearchString, 0);
}

@end
