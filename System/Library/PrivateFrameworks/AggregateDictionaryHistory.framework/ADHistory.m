@implementation ADHistory

- (ADHistory)initWithDefaultPath
{
  return -[ADHistory initWithPath:](self, "initWithPath:", 0);
}

- (ADHistory)initWithPath:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ADHistory;
  return -[ADHistory init](&v4, sel_init, a3);
}

- (BOOL)scalarsForKeyPrefix:(id)a3 minDaysSince1970:(int)a4 maxDaysSince1970:(int)a5 rowHandler:(id)a6
{
  BOOL v6;

  if (a3)
    v6 = a6 == 0;
  else
    v6 = 1;
  return !v6;
}

- (BOOL)distributionsForKeyPrefix:(id)a3 minDaysSince1970:(int)a4 maxDaysSince1970:(int)a5 rowHandler:(id)a6
{
  BOOL v6;

  if (a3)
    v6 = a6 == 0;
  else
    v6 = 1;
  return !v6;
}

- (NSString)path
{
  return self->_path;
}

@end
