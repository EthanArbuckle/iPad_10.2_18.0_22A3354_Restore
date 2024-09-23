@implementation LoadingRequestHandler

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v6;
  AVAssetResourceLoaderInternal *v7;
  AVAssetResourceLoader v8;
  Class isa;
  AVAssetResourceLoadingRequest v10;

  v6 = a3;
  v7 = (AVAssetResourceLoaderInternal *)a4;
  v8.super.isa = (Class)self;
  isa = v8.super.isa;
  v8._resourceLoader = v7;
  LoadingRequestHandler.resourceLoader(_:shouldWaitForLoadingOfRequestedResource:)(v8, v10);

  return 1;
}

- (void)resourceLoader:(id)a3 didCancelLoadingRequest:(id)a4
{
  AVAssetResourceLoaderInternal *v6;
  AVAssetResourceLoader v7;
  Class isa;
  AVAssetResourceLoadingRequest v9;
  id v10;

  v10 = a3;
  v6 = (AVAssetResourceLoaderInternal *)a4;
  v7.super.isa = (Class)self;
  isa = v7.super.isa;
  v7._resourceLoader = v6;
  LoadingRequestHandler.resourceLoader(_:didCancel:)(v7, v9);

}

- (BOOL)resourceLoader:(id)a3 shouldWaitForRenewalOfRequestedResource:(id)a4
{
  id v6;
  AVAssetResourceLoaderInternal *v7;
  AVAssetResourceLoader v8;
  Class isa;
  AVAssetResourceRenewalRequest v10;

  v6 = a3;
  v7 = (AVAssetResourceLoaderInternal *)a4;
  v8.super.isa = (Class)self;
  isa = v8.super.isa;
  v8._resourceLoader = v7;
  LoadingRequestHandler.resourceLoader(_:shouldWaitForRenewalOfRequestedResource:)(v8, v10);

  return 1;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForResponseToAuthenticationChallenge:(id)a4
{
  id v6;
  AVAssetResourceLoaderInternal *v7;
  AVAssetResourceLoader v8;
  Class isa;
  NSURLAuthenticationChallenge v10;

  v6 = a3;
  v7 = (AVAssetResourceLoaderInternal *)a4;
  v8.super.isa = (Class)self;
  isa = v8.super.isa;
  v8._resourceLoader = v7;
  LoadingRequestHandler.resourceLoader(_:shouldWaitForResponseTo:)(v8, v10);

  return 1;
}

- (_TtC11CloudAssets21LoadingRequestHandler)init
{
  LoadingRequestHandler.init()();
}

- (void).cxx_destruct
{
  sub_237F91A00((uint64_t)self + OBJC_IVAR____TtC11CloudAssets21LoadingRequestHandler_assetStreamHandle);
  sub_237FAC1B8((uint64_t)self + OBJC_IVAR____TtC11CloudAssets21LoadingRequestHandler_type, &qword_2568B7D70);
  swift_release();
  swift_release();
}

@end
