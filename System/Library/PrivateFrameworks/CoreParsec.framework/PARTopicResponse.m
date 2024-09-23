@implementation PARTopicResponse

- (PARTopicResponse)initWithReply:(id)a3 factory:(id)a4 dataZKW:(id)a5
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

  return (PARTopicResponse *)PARTopicResponse.init(reply:factory:dataZKW:)(v7, a4, v9, v11);
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
  PARTopicResponse *v12;
  PARDefaultFactory *v13;
  PARTopicResponse *v14;
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

    v14 = [PARTopicResponse alloc];
    objc_msgSend(v3, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PARTopicResponse initWithReply:factory:dataZKW:](v14, "initWithReply:factory:dataZKW:", v3, v13, v15);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
