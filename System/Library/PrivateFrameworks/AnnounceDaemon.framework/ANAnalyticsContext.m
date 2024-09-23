@implementation ANAnalyticsContext

- (NSDictionary)analyticsPayload
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ANAnalyticsContext isEndpoint](self, "isEndpoint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("endpoint"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v5;
}

- (BOOL)isEndpoint
{
  return self->_isEndpoint;
}

- (void)setIsEndpoint:(BOOL)a3
{
  self->_isEndpoint = a3;
}

+ (id)contextWithAnnouncer:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v3)
    objc_msgSend(v4, "setIsEndpoint:", objc_msgSend(v3, "isEndpoint"));

  return v4;
}

+ (id)contextWithEndpointID:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v3)
    objc_msgSend(v4, "setIsEndpoint:", objc_msgSend(v3, "an_isLocalDevice") ^ 1);

  return v4;
}

@end
