@implementation CalSpotlightQueryController

+ (id)searchWithString:(id)a3 clientBundleID:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  CalSpotlightPendingSearch *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CalSpotlightPendingSearch initWithString:clientBundleID:completionHandler:]([CalSpotlightPendingSearch alloc], "initWithString:clientBundleID:completionHandler:", v9, v8, v7);

  return v10;
}

@end
