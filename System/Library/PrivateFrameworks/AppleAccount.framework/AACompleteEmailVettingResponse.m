@implementation AACompleteEmailVettingResponse

- (int)vettingStatus
{
  void *v2;
  int v3;

  -[NSDictionary objectForKey:](self->super._responseDictionary, "objectForKey:", CFSTR("status"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

@end
