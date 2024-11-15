@implementation ICNASearchResultExposureItem

- (ICNASearchResultExposureItem)initWithSearchString:(id)a3
{
  id v5;
  ICNASearchResultExposureItem *v6;
  ICNASearchResultExposureItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICNASearchResultExposureItem;
  v6 = -[ICNASearchResultExposureItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_searchString, a3);

  return v7;
}

- (void)updateWithTopHitResultCount:(unint64_t)a3 nonTopHitResultCount:(unint64_t)a4 attachmentSectionCount:(unint64_t)a5
{
  -[ICNASearchResultExposureItem setTopHitResultCount:](self, "setTopHitResultCount:", a3);
  -[ICNASearchResultExposureItem setNonTopHitResultCount:](self, "setNonTopHitResultCount:", a4);
  -[ICNASearchResultExposureItem setAttachmentSectionCount:](self, "setAttachmentSectionCount:", a5);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (unint64_t)topHitResultCount
{
  return self->_topHitResultCount;
}

- (void)setTopHitResultCount:(unint64_t)a3
{
  self->_topHitResultCount = a3;
}

- (unint64_t)nonTopHitResultCount
{
  return self->_nonTopHitResultCount;
}

- (void)setNonTopHitResultCount:(unint64_t)a3
{
  self->_nonTopHitResultCount = a3;
}

- (unint64_t)attachmentSectionCount
{
  return self->_attachmentSectionCount;
}

- (void)setAttachmentSectionCount:(unint64_t)a3
{
  self->_attachmentSectionCount = a3;
}

- (BOOL)searchResultWasSelected
{
  return self->_searchResultWasSelected;
}

- (void)setSearchResultWasSelected:(BOOL)a3
{
  self->_searchResultWasSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
