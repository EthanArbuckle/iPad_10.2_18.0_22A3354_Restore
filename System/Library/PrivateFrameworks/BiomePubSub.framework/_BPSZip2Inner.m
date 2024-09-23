@implementation _BPSZip2Inner

- (id)convertValues:(id)a3
{
  id v3;
  BPSTuple *v4;
  void *v5;
  void *v6;
  BPSTuple *v7;

  v3 = a3;
  v4 = [BPSTuple alloc];
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BPSTuple initWithFirst:second:](v4, "initWithFirst:second:", v5, v6);
  return v7;
}

@end
