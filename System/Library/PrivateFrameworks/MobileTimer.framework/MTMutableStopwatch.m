@implementation MTMutableStopwatch

- (id)copyWithZone:(_NSZone *)a3
{
  MTStopwatch *v4;
  void *v5;
  MTStopwatch *v6;

  v4 = +[MTStopwatch allocWithZone:](MTStopwatch, "allocWithZone:", a3);
  -[MTStopwatch identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MTStopwatch initWithId:](v4, "initWithId:", v5);

  -[MTStopwatch _copyStateOntoStopwatch:](self, "_copyStateOntoStopwatch:", v6);
  return v6;
}

@end
