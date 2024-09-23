@implementation MSTrackListLoadMoreCellConfiguration

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  double v6;
  double v7;
  uint64_t v8;
  double v9;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
  v7 = v6 + -10.0 + -5.0;
  v8 = objc_msgSend(a4, "unmodifiedTitle");
  objc_msgSend(a3, "sizeForString:font:constrainedToSize:", v8, objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 14.0), v7, 1.79769313e308);
  return v9 + 26.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  objc_super v5;

  if (!a4)
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor", a3);
  v5.receiver = self;
  v5.super_class = (Class)MSTrackListLoadMoreCellConfiguration;
  return -[SULoadMoreMediaCellConfiguration colorForLabelAtIndex:withModifiers:](&v5, sel_colorForLabelAtIndex_withModifiers_, a3);
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", a3, 14.0);
}

- (void)reloadLayoutInformation
{
  uint64_t v2;
  double *v3;
  double v4;

  if ((*(_QWORD **)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8E08]))[1])
  {
    v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8E00]);
    *(_OWORD *)(v2 + 32) = xmmword_229278210;
    v3 = (double *)((char *)self + (int)*MEMORY[0x24BEC8E18]);
    v4 = v3[1] + -26.0;
    *(double *)(v2 + 48) = *v3 + -5.0 + -10.0;
    *(double *)(v2 + 56) = v4;
  }
}

- (int64_t)textAlignmentForLabelAtIndex:(unint64_t)a3
{
  return 1;
}

@end
