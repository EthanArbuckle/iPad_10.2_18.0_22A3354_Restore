@implementation HSPCHomeKitHomeProvider

- (id)loadData
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allHomesFuture"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100052B74;
  v6[3] = &unk_1000A3328;
  objc_copyWeak(&v7, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addSuccessBlock:", v6));
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

- (id)userFacingStringForItem:(id)a3
{
  return objc_msgSend(a3, "name");
}

@end
