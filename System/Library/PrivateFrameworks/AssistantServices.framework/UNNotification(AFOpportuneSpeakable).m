@implementation UNNotification(AFOpportuneSpeakable)

- (id)speakableIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "request");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)speakableContent
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "request");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "body");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
