@implementation PARLookupSearchResponse

- (PARLookupSearchResponse)initWithReply:(id)a3 factory:(id)a4 data:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v7 = a3;
  swift_unknownObjectRetain();
  v8 = a5;
  v9 = sub_19A8C3E40();
  v11 = v10;

  return (PARLookupSearchResponse *)PARLookupSearchResponse.init(reply:factory:data:)(v7, (uint64_t)a4, v9, v11);
}

+ (id)responseFromReply:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PARDefaultFactory *v11;
  PARLookupSearchResponse *v12;
  PARDefaultFactory *v13;
  PARLookupSearchResponse *v14;
  void *v15;

  v3 = a3;
  objc_msgSend(v3, "task");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "factory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = objc_alloc_init(PARDefaultFactory);
    v13 = v11;

    if (v13)
    {
      objc_msgSend(v3, "data");
      v12 = (PARLookupSearchResponse *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v14 = [PARLookupSearchResponse alloc];
        objc_msgSend(v3, "data");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[PARLookupSearchResponse initWithReply:factory:data:](v14, "initWithReply:factory:data:", v3, v13, v15);

      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
