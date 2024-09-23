@implementation HKMCCycleTimelineFlowLayoutAttributes

- (BOOL)isEqual:(id)a3
{
  id v4;
  double shrinkFactor;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  BOOL v11;
  objc_super v13;
  CGRect v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v13.receiver = self,
        v13.super_class = (Class)HKMCCycleTimelineFlowLayoutAttributes,
        -[UICollectionViewLayoutAttributes isEqual:](&v13, sel_isEqual_, v4))
    && (shrinkFactor = self->_shrinkFactor,
        objc_msgSend(v4, "shrinkFactor"),
        vabdd_f64(shrinkFactor, v6) < 2.22044605e-16))
  {
    objc_msgSend(v4, "pillFrame");
    v14.origin.x = v7;
    v14.origin.y = v8;
    v14.size.width = v9;
    v14.size.height = v10;
    v11 = CGRectEqualToRect(self->_pillFrame, v14);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKMCCycleTimelineFlowLayoutAttributes;
  v3 = -[UICollectionViewLayoutAttributes hash](&v9, sel_hash);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_shrinkFactor);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", self->_pillFrame.origin.x, self->_pillFrame.origin.y, self->_pillFrame.size.width, self->_pillFrame.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKMCCycleTimelineFlowLayoutAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v6, sel_copyWithZone_, a3);
  -[HKMCCycleTimelineFlowLayoutAttributes shrinkFactor](self, "shrinkFactor");
  objc_msgSend(v4, "setShrinkFactor:");
  -[HKMCCycleTimelineFlowLayoutAttributes pillFrame](self, "pillFrame");
  objc_msgSend(v4, "setPillFrame:");
  return v4;
}

- (double)shrinkFactor
{
  return self->_shrinkFactor;
}

- (void)setShrinkFactor:(double)a3
{
  self->_shrinkFactor = a3;
}

- (CGRect)pillFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_pillFrame.origin.x;
  y = self->_pillFrame.origin.y;
  width = self->_pillFrame.size.width;
  height = self->_pillFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPillFrame:(CGRect)a3
{
  self->_pillFrame = a3;
}

@end
