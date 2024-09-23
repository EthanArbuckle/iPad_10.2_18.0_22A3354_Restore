@implementation HKOverlayContextLocation

- (HKOverlayContextLocation)initWithContainerIndex:(int64_t)a3 sectionIndex:(int64_t)a4 itemIndex:(int64_t)a5
{
  HKOverlayContextLocation *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKOverlayContextLocation;
  result = -[HKOverlayContextLocation init](&v9, sel_init);
  if (result)
  {
    result->_containerIndex = a3;
    result->_sectionIndex = a4;
    result->_itemIndex = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "containerIndex");
    if (v6 == -[HKOverlayContextLocation containerIndex](self, "containerIndex")
      && (v7 = objc_msgSend(v5, "sectionIndex"), v7 == -[HKOverlayContextLocation sectionIndex](self, "sectionIndex")))
    {
      v8 = objc_msgSend(v5, "itemIndex");
      v9 = v8 == -[HKOverlayContextLocation itemIndex](self, "itemIndex");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)containerIndex
{
  return self->_containerIndex;
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (int64_t)itemIndex
{
  return self->_itemIndex;
}

@end
