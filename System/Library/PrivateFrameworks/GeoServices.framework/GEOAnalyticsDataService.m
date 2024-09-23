@implementation GEOAnalyticsDataService

+ (void)useLocalProxy
{
  _MergedGlobals_179 = 1;
}

+ (id)sharedService
{
  if (qword_1ECDBB8E0 != -1)
    dispatch_once(&qword_1ECDBB8E0, &__block_literal_global_9);
  return (id)qword_1ECDBB8D8;
}

void __40__GEOAnalyticsDataService_sharedService__block_invoke()
{
  GEOAnalyticsDataService *v0;
  void *v1;

  v0 = -[GEOAnalyticsDataService initWithProxyClass:]([GEOAnalyticsDataService alloc], "initWithProxyClass:", objc_opt_class());
  v1 = (void *)qword_1ECDBB8D8;
  qword_1ECDBB8D8 = (uint64_t)v0;

}

- (GEOAnalyticsDataService)initWithProxyClass:(Class)a3
{
  GEOAnalyticsDataService *v4;
  GEOAnalyticsDataServiceProxy *v5;
  GEOAnalyticsDataServiceProxy *proxyObj;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOAnalyticsDataService;
  v4 = -[GEOAnalyticsDataService init](&v8, sel_init);
  if (v4)
  {
    v5 = (GEOAnalyticsDataServiceProxy *)objc_alloc_init(a3);
    proxyObj = v4->_proxyObj;
    v4->_proxyObj = v5;

  }
  return v4;
}

- (int)networkEventFileDescriptorForRepresentativeDate:(id)a3
{
  return -[GEOAnalyticsDataServiceProxy networkEventFileDescriptorForRepresentativeDate:](self->_proxyObj, "networkEventFileDescriptorForRepresentativeDate:", a3);
}

- (int)requestResponseMetadataFileDescriptorForBatchID:(unint64_t)a3
{
  return -[GEOAnalyticsDataServiceProxy requestResponseMetadataFileDescriptorForBatchID:](self->_proxyObj, "requestResponseMetadataFileDescriptorForBatchID:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyObj, 0);
}

@end
