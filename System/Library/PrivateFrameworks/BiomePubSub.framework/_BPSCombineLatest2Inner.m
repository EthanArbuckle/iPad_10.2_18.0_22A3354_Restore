@implementation _BPSCombineLatest2Inner

- (id)convertValues:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BPSTuple *v6;

  v3 = a3;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[BPSTuple initWithFirst:second:]([BPSTuple alloc], "initWithFirst:second:", v4, v5);
  return v6;
}

@end
