@implementation JEHLSRollItem

- (JEHLSRollItem)initWithStartOverallPosition:(unint64_t)a3 duration:(unint64_t)a4 metricsData:(id)a5
{
  JEHLSRollItem *v6;
  JEHLSRollItem *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)JEHLSRollItem;
  v6 = -[JEHLSItem initWithStartOverallPosition:metricsData:](&v9, sel_initWithStartOverallPosition_metricsData_, a3, a5);
  v7 = v6;
  if (v6)
    -[JEHLSRollItem setDuration:](v6, "setDuration:", a4);
  return v7;
}

- (unint64_t)endOverallPosition
{
  unint64_t v3;

  v3 = -[JEHLSItem startOverallPosition](self, "startOverallPosition");
  return -[JEHLSRollItem duration](self, "duration") + v3;
}

- (BOOL)containsOverallPosition:(unint64_t)a3
{
  return -[JEHLSItem startOverallPosition](self, "startOverallPosition") <= a3
      && -[JEHLSRollItem endOverallPosition](self, "endOverallPosition") > a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

@end
