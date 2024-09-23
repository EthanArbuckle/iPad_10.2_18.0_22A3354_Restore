@implementation CRKConcreteSharingPrimitives

- (id)startAirDropTransferWithAutoAccept:(BOOL)a3 hideProgress:(BOOL)a4 senderName:(id)a5 previewImageData:(id)a6 bundleID:(id)a7 sourceBundleID:(id)a8 itemsDescription:(id)a9 fileURLs:(id)a10 resultHandler:(id)a11
{
  _BOOL8 v15;
  _BOOL8 v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  CRKConcreteSharingAirDropTransfer *v24;

  v15 = a4;
  v16 = a3;
  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = -[CRKConcreteSharingAirDropTransfer initWithAutoAccept:hideProgress:senderName:previewImageData:bundleID:sourceBundleID:itemsDescription:fileURLs:resultHandler:]([CRKConcreteSharingAirDropTransfer alloc], "initWithAutoAccept:hideProgress:senderName:previewImageData:bundleID:sourceBundleID:itemsDescription:fileURLs:resultHandler:", v16, v15, v23, v22, v21, v20, v19, v18, v17);

  return v24;
}

@end
