@implementation PAREngagementResponse

+ (id)responseFromReply:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PARDefaultFactory *v9;
  PARDefaultFactory *v10;
  PAREngagementResponse *v11;
  void *v12;
  PAREngagementResponse *v13;

  v3 = a3;
  objc_msgSend(v3, "task");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "factory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = objc_alloc_init(PARDefaultFactory);
  v10 = v9;

  v11 = [PAREngagementResponse alloc];
  objc_msgSend(v3, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PARResponse initWithReply:factory:responseData:](v11, "initWithReply:factory:responseData:", v3, v10, v12);

  return v13;
}

@end
