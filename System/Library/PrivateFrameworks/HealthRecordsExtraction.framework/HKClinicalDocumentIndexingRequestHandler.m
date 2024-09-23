@implementation HKClinicalDocumentIndexingRequestHandler

- (void)indexClinicalDocumentsWithRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  HKHealthRecordAttachmentsIndexerHandler *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HKHealthRecordAttachmentsIndexerHandler);
  -[HKHealthRecordAttachmentsIndexerHandler indexWithRequest:completion:](v7, "indexWithRequest:completion:", v6, v5);

}

- (void)fetchSpotlightSearchResultsForQueryString:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  HKHealthRecordAttachmentsIndexerHandler *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HKHealthRecordAttachmentsIndexerHandler);
  -[HKHealthRecordAttachmentsIndexerHandler fetchSpotlightSearchResultsForQueryString:completion:](v7, "fetchSpotlightSearchResultsForQueryString:completion:", v6, v5);

}

@end
