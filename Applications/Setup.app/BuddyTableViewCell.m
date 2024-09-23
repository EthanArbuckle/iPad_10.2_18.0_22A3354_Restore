@implementation BuddyTableViewCell

- (void)resizeCellLabelAndFieldIfOverlap
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double rect_16;
  CGFloat r2;
  CGFloat r2_8;
  double r2_16;
  CGFloat r2_24;
  _BYTE v18[32];
  CGRect v20;
  CGRect v21;

  if (-[BuddyTableViewCell style](self, "style") == (id)1000)
  {
    v2 = -[BuddyTableViewCell editableTextField](self, "editableTextField");
    objc_msgSend(v2, "frame");
    *(_QWORD *)&v18[8] = v3;
    *(_QWORD *)v18 = v4;
    *(_QWORD *)&v18[24] = v5;
    *(_QWORD *)&v18[16] = v6;

    if (!CGRectIsEmpty(*(CGRect *)v18))
    {
      v7 = -[BuddyTableViewCell textLabel](self, "textLabel");
      objc_msgSend(v7, "frame");
      r2_8 = v8;
      r2 = v9;
      r2_24 = v10;
      r2_16 = v11;

      v21.size.height = r2_24;
      v21.size.width = r2_16 + 10.0;
      v21.origin.y = r2_8;
      v21.origin.x = r2;
      v20 = CGRectIntersection(*(CGRect *)v18, v21);
      rect_16 = v20.size.width;
      if (!CGRectIsNull(v20))
      {
        v12 = -[BuddyTableViewCell editableTextField](self, "editableTextField");
        objc_msgSend(v12, "setFrame:", *(double *)v18 + rect_16, *(double *)&v18[8], *(double *)&v18[16] - rect_16, *(double *)&v18[24], *(double *)v18 + rect_16, *(_QWORD *)&v18[8], *(double *)&v18[16] - rect_16, *(_QWORD *)&v18[24]);

      }
    }
  }
}

- (void)layoutSubviews
{
  objc_super v2;
  SEL v3;
  BuddyTableViewCell *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)BuddyTableViewCell;
  -[BuddyTableViewCell layoutSubviews](&v2, "layoutSubviews");
  -[BuddyTableViewCell resizeCellLabelAndFieldIfOverlap](v4, "resizeCellLabelAndFieldIfOverlap");
}

@end
