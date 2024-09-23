@implementation ALSOcclusionStats

- (void)recordOcclusionByProx:(BOOL)a3 andByTouch:(BOOL)a4
{
  if (a4 && a3)
  {
    ++self->_touchAndProx;
  }
  else if (a3)
  {
    ++self->_prox;
  }
  else if (a4)
  {
    ++self->_touch;
  }
  else
  {
    ++self->_none;
  }
}

- (ALSOcclusionStats)init
{
  objc_super v3;
  SEL v4;
  ALSOcclusionStats *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)ALSOcclusionStats;
  v5 = -[ALSOcclusionStats init](&v3, sel_init);
  if (v5)
    -[ALSOcclusionStats reset](v5, "reset");
  return v5;
}

- (void)reset
{
  self->_prox = 0;
  self->_touch = 0;
  self->_touchAndProx = 0;
  self->_none = 0;
}

- (void)submit
{
  +[CBAnalytics alsOcclusionsByProx:andByTouch:touchProx:none:](CBAnalytics, "alsOcclusionsByProx:andByTouch:touchProx:none:", self->_prox, self->_touch, self->_touchAndProx, self->_none);
  -[ALSOcclusionStats reset](self, "reset");
}

@end
