@implementation CPSDiagnosticsService

+ (void)fetchABRMetadataWithURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchABRMetadataForDiagnosticsWithURL:completion:", v6, v5);

}

+ (void)fetchAMPMetadataWithBundleID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchAMPMetadataForDiagnosticsWithBundleID:completion:", v6, v5);

}

@end
