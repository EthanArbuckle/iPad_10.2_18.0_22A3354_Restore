@implementation MTMutableTimer

- (id)copyWithZone:(_NSZone *)a3
{
  MTTimer *v4;
  void *v5;
  MTTimer *v6;

  v4 = +[MTTimer allocWithZone:](MTTimer, "allocWithZone:", a3);
  -[MTTimer timerID](self, "timerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MTTimer initWithIdentifier:](v4, "initWithIdentifier:", v5);

  -[MTTimer _copyStateOntoTimer:](self, "_copyStateOntoTimer:", v6);
  return v6;
}

@end
