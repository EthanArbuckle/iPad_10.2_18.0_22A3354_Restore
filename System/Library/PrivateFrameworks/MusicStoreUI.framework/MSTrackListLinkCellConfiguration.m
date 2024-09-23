@implementation MSTrackListLinkCellConfiguration

- (MSTrackListLinkCellConfiguration)init
{
  return -[SUArrayCellConfiguration initWithStringCount:imageCount:](self, "initWithStringCount:imageCount:", 1, 1);
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 44.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  if ((a4 & 2) != 0)
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "grayColor", a3);
  if ((a4 & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor", a3);
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor", a3);
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", a3, 14.0);
}

- (void)reloadImages
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (int)*MEMORY[0x24BEC8E20];
  if (objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "itemDisplayType") == 10000
    && (v4 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "reviewStatistics"),
        objc_msgSend(v4, "numberOfUserRatings") >= 1))
  {
    v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8E10]);
    objc_msgSend(v4, "averageUserRating");
    v6 = (void *)objc_msgSend(v5, "ratingImageForRating:style:", 1);
  }
  else
  {
    v6 = 0;
  }
  v7 = (int)*MEMORY[0x24BEC8DF0];

  **(_QWORD **)((char *)&self->super.super.super.super.super.isa + v7) = v6;
}

- (void)reloadLayoutInformation
{
  double v3;
  void *v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  uint64_t v13;
  CGRect v14;

  v3 = *(double *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8E18]) + -5.0;
  v4 = **(void ***)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8DF0]);
  v5 = (int *)MEMORY[0x24BEC8DE8];
  if (v4)
  {
    v6 = (int)*MEMORY[0x24BEC8DE8];
    v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v6);
    objc_msgSend(v4, "size");
    *(_QWORD *)(v7 + 16) = v8;
    *(_QWORD *)(v7 + 24) = v9;
    v3 = v3 - ((*(double **)((char *)&self->super.super.super.super.super.isa + v6))[2] + 6.0);
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8E10]), "sizeForString:font:constrainedToSize:", **(_QWORD **)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8E08]), -[MSTrackListLinkCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 0), v3 + -48.0, 18.0);
  v14.size.width = v10;
  v14.size.height = v11;
  v12 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8E00]);
  *(_OWORD *)v12 = xmmword_229278200;
  *(CGFloat *)(v12 + 16) = v10;
  *(CGFloat *)(v12 + 24) = v11;
  v13 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + *v5);
  v14.origin.x = 48.0;
  v14.origin.y = 13.0;
  *(CGFloat *)v13 = CGRectGetMaxX(v14) + 6.0;
  *(_QWORD *)(v13 + 8) = 0x402C000000000000;
}

- (void)reloadStrings
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v3 = (int)*MEMORY[0x24BEC8E20];
  v4 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "itemDisplayType");
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4 == 10000)
  {
    v6 = (void *)objc_msgSend(v5, "reviewStatistics");
    v7 = (void *)objc_msgSend(v6, "numberOfUserRatingsString");
    if (objc_msgSend(v7, "length"))
      goto LABEL_6;
    objc_msgSend(v6, "numberOfUserRatings");
    v8 = (id)SUCopyLocalizedReviewsStringForCount();
  }
  else
  {
    v8 = (id)objc_msgSend(v5, "title");
  }
  v7 = v8;
LABEL_6:
  v9 = (int)*MEMORY[0x24BEC8E08];

  v10 = (id)objc_msgSend(v7, "length");
  if (v10)
    v10 = v7;
  **(_QWORD **)((char *)&self->super.super.super.super.super.isa + v9) = v10;
}

@end
