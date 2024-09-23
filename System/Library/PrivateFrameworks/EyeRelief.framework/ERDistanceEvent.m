@implementation ERDistanceEvent

- (ERDistanceEvent)initWithDistance:(float)a3 distanceCategory:(int64_t)a4 andAttention:(BOOL)a5
{
  ERDistanceEvent *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ERDistanceEvent;
  result = -[ERDistanceEvent init](&v9, sel_init);
  if (result)
  {
    result->_distance = a3;
    result->_distanceCategory = a4;
    result->_didDetectAttention = a5;
  }
  return result;
}

- (id)description
{
  void *v3;
  float v4;
  double v5;
  int64_t v6;
  _BOOL4 v7;
  const char *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ERDistanceEvent distance](self, "distance");
  v5 = v4;
  v6 = -[ERDistanceEvent distanceCategory](self, "distanceCategory");
  v7 = -[ERDistanceEvent didDetectAttention](self, "didDetectAttention");
  v8 = "no";
  if (v7)
    v8 = "yes";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("Distance: %f, Distance Category: %li, didDetectAttention: %s"), *(_QWORD *)&v5, v6, v8);
}

- (float)distance
{
  return self->_distance;
}

- (void)setDistance:(float)a3
{
  self->_distance = a3;
}

- (int64_t)distanceCategory
{
  return self->_distanceCategory;
}

- (void)setDistanceCategory:(int64_t)a3
{
  self->_distanceCategory = a3;
}

- (BOOL)didDetectAttention
{
  return self->_didDetectAttention;
}

- (void)setDidDetectAttention:(BOOL)a3
{
  self->_didDetectAttention = a3;
}

@end
