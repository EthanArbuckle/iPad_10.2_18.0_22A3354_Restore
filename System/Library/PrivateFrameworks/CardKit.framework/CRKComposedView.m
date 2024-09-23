@implementation CRKComposedView

- (CRKComposedView)initWithFrame:(CGRect)a3
{
  CRKComposedView *v3;
  NSMutableArray *v4;
  NSMutableArray *mutableCardSectionSubviews;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRKComposedView;
  v3 = -[CRKComposedView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mutableCardSectionSubviews = v3->_mutableCardSectionSubviews;
    v3->_mutableCardSectionSubviews = v4;

  }
  return v3;
}

- (UIEdgeInsets)cardSectionContentMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x24BDF7718];
  v3 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v4 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v5 = *(double *)(MEMORY[0x24BDF7718] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)addCardSectionSubview:(id)a3 withKeyline:(int64_t)a4
{
  NSMutableArray *mutableCardSectionSubviews;
  id v6;

  if (a3)
  {
    mutableCardSectionSubviews = self->_mutableCardSectionSubviews;
    v6 = a3;
    -[NSMutableArray addObject:](mutableCardSectionSubviews, "addObject:", v6);
    -[CRKComposedView addSubview:](self, "addSubview:", v6);
    objc_msgSend(v6, "setComposedSuperview:", self);

    -[CRKComposedView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)cardSectionSubviewWantsToBeRemovedFromHierarchy:(id)a3
{
  NSMutableArray *mutableCardSectionSubviews;
  id v4;

  mutableCardSectionSubviews = self->_mutableCardSectionSubviews;
  v4 = a3;
  -[NSMutableArray removeObject:](mutableCardSectionSubviews, "removeObject:", v4);
  objc_msgSend(v4, "removeFromSuperview");
  objc_msgSend(v4, "setComposedSuperview:", 0);

}

- (NSArray)cardSectionSubviews
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableCardSectionSubviews, "copy");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setCardSectionSubviews:(id)a3
{
  objc_storeStrong((id *)&self->_cardSectionSubviews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSectionSubviews, 0);
  objc_storeStrong((id *)&self->_mutableCardSectionSubviews, 0);
}

@end
