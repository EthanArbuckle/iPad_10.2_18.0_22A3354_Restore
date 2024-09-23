@implementation MSTrackListCellConfiguration

- (MSTrackListCellConfiguration)init
{
  return -[SUMediaItemCellConfiguration initWithStringCount:imageCount:](self, "initWithStringCount:imageCount:", 4, 0);
}

- (void)setPosition:(id *)a3
{
  $277DA038E07E09C73EBFEAB3003DE8A9 *p_position;
  __int128 v6;
  $3CC19D079FD0B010EE84973AA846B91B v7;
  $277DA038E07E09C73EBFEAB3003DE8A9 position;

  p_position = &self->_position;
  position = self->_position;
  v7 = *a3;
  if ((SUPositionEqualToPosition() & 1) == 0)
  {
    v6 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&p_position->localIndex = *(_OWORD *)&a3->var0;
    *(_OWORD *)&p_position->globalIndex = v6;
    -[SUCellConfiguration setNeedsDisplay:](self, "setNeedsDisplay:", 1, *(_OWORD *)&v7.var0, *(_OWORD *)&v7.var2, *(_OWORD *)&position.localIndex, *(_OWORD *)&position.globalIndex);
  }
}

+ (id)copyDefaultContext
{
  return objc_alloc_init(MSTrackListCellContext);
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 44.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  char v4;
  id result;
  void *v7;
  void *v8;
  int v9;
  int v10;

  v4 = a4;
  if ((a4 & 2) != 0)
  {
    v7 = (void *)MEMORY[0x24BDF6950];
    return (id)objc_msgSend(v7, "grayColor", a3);
  }
  if (a3 == 4)
  {
    if (-[SUCellConfigurationView highlightsOnlyContentView](-[SUCellConfiguration view](self, "view"), "highlightsOnlyContentView"))
    {
      result = (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      if ((v4 & 1) != 0)
        return result;
    }
    else
    {
      result = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      if ((v4 & 1) != 0)
        return result;
    }
    v8 = (void *)MEMORY[0x24BDF6950];
    return (id)objc_msgSend(v8, "blackColor");
  }
  if (a3 == 3)
  {
    if (-[SUCellConfigurationView highlightsOnlyContentView](-[SUCellConfiguration view](self, "view"), "highlightsOnlyContentView"))
    {
      result = (id)SUTableCellGetHighlightedTextColor();
      if ((v4 & 1) != 0)
        return result;
    }
    else
    {
      result = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      if ((v4 & 1) != 0)
        return result;
    }
    v8 = (void *)MEMORY[0x24BDF6950];
    return (id)objc_msgSend(v8, "blackColor");
  }
  if (a3 - 1 <= 1)
  {
    if (-[SUCellConfigurationView highlightsOnlyContentView](-[SUCellConfiguration view](self, "view"), "highlightsOnlyContentView"))
    {
      result = (id)objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
      if ((v4 & 1) != 0)
        return result;
    }
    else
    {
      result = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      if ((v4 & 1) != 0)
        return result;
    }
    v7 = (void *)MEMORY[0x24BDF6950];
    return (id)objc_msgSend(v7, "grayColor", a3);
  }
  v9 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8E20]), "contentRating"), "isExplicitContent");
  v10 = -[SUCellConfigurationView highlightsOnlyContentView](-[SUCellConfiguration view](self, "view"), "highlightsOnlyContentView");
  if (v9)
  {
    if (v10)
    {
      result = (id)SUTableCellGetExplicitColor();
      if ((v4 & 1) != 0)
        return result;
    }
    else
    {
      result = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      if ((v4 & 1) != 0)
        return result;
    }
    return (id)SUTableCellGetExplicitColor();
  }
  if (!v10)
  {
    result = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    if ((v4 & 1) != 0)
      return result;
    return (id)SUTableCellGetCleanColor();
  }
  result = (id)SUTableCellGetCleanColor();
  if ((v4 & 1) == 0)
    return (id)SUTableCellGetCleanColor();
  return result;
}

- (void)drawBackgroundWithModifiers:(unint64_t)a3
{
  objc_super v5;
  CGRect v6;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.899999976, 1.0), "set");
  *(_QWORD *)&v6.size.height = *(id *)((char *)&self->super.super.super.super.super._context + (int)*MEMORY[0x24BEC8E18]);
  v6.origin.x = 41.0;
  v6.origin.y = 0.0;
  v6.size.width = 1.0;
  UIRectFill(v6);
  v5.receiver = self;
  v5.super_class = (Class)MSTrackListCellConfiguration;
  -[SUCellConfiguration drawBackgroundWithModifiers:](&v5, sel_drawBackgroundWithModifiers_, a3);
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  void *v3;
  double v4;
  objc_super v6;

  if (a3 - 1 < 2)
    return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 14.0);
  if (a3 == 3)
  {
    v3 = (void *)MEMORY[0x24BDF6A70];
    v4 = 14.0;
    return (id)objc_msgSend(v3, "boldSystemFontOfSize:", v4);
  }
  if (a3 == 4)
  {
    v3 = (void *)MEMORY[0x24BDF6A70];
    v4 = 16.0;
    return (id)objc_msgSend(v3, "boldSystemFontOfSize:", v4);
  }
  v6.receiver = self;
  v6.super_class = (Class)MSTrackListCellConfiguration;
  return -[SUMediaItemCellConfiguration fontForLabelAtIndex:](&v6, sel_fontForLabelAtIndex_);
}

- (unint64_t)indexOfLabelForPurchaseAnimation
{
  return 3;
}

- (void)reloadImages
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSTrackListCellConfiguration;
  -[SUMediaItemCellConfiguration reloadImages](&v4, sel_reloadImages);
  v3 = (int)*MEMORY[0x24BEC8DF8];

  (*(_QWORD **)((char *)&self->super.super.super.super.super.super.isa + v3))[1] = 0;
}

- (void)reloadLayoutInformation
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  int *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  double *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  double v50;
  double v51;
  uint64_t v52;
  objc_super v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v53.receiver = self;
  v53.super_class = (Class)MSTrackListCellConfiguration;
  -[SUMediaItemCellConfiguration reloadLayoutInformation](&v53, sel_reloadLayoutInformation);
  v3 = (int)*MEMORY[0x24BEC8E08];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  v5 = (void *)v4[4];
  v6 = (int *)MEMORY[0x24BEC8E00];
  if (v5)
  {
    objc_msgSend(v5, "_legacy_sizeWithFont:constrainedToSize:", -[MSTrackListCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 4), 41.0, 19.0);
    v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + *v6);
    *(double *)(v7 + 128) = floor((41.0 - v8) * 0.5);
    *(_QWORD *)(v7 + 136) = 0x4026000000000000;
    *(double *)(v7 + 144) = v8;
    *(_QWORD *)(v7 + 152) = v9;
    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  v10 = (void *)v4[1];
  v11 = (int *)MEMORY[0x24BEC8E18];
  if (v10)
  {
    objc_msgSend(v10, "_legacy_sizeWithFont:constrainedToSize:", -[MSTrackListCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 1), *(double *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8E18]), 17.0);
    v12 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + *v6);
    *(_QWORD *)(v12 + 48) = v13;
    *(_QWORD *)(v12 + 56) = v14;
    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  v15 = v4[3];
  if (v15)
  {
    v16 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8E10]);
    v17 = -[MSTrackListCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 3);
    v18 = *v11;
    objc_msgSend(v16, "sizeForString:font:constrainedToSize:", v15, v17, *(double *)((char *)&self->super.super.super.super.super.super.isa + v18), 18.0);
    v20 = v19;
    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  else
  {
    v20 = *MEMORY[0x24BDBF148];
    v18 = *v11;
  }
  v21 = *(double *)((char *)&self->super.super.super.super.super.super.isa + v18);
  v22 = v21 + -5.0;
  if (v4[2])
  {
    v23 = *v6;
    v24 = v21 + -5.0;
    if (v4[1])
    {
      v25 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v23);
      v26 = *(double *)(v25 + 48);
      v27 = *(_QWORD *)(v25 + 56);
      v28 = v22 - v26;
      if (v20 + 48.0 + 2.0 < v22 - v26)
        v28 = v20 + 48.0 + 2.0;
      *(double *)(v25 + 32) = v28;
      *(_QWORD *)(v25 + 40) = 0x4014000000000000;
      v29 = 5.0;
      v24 = CGRectGetMinX(*(CGRect *)&v28) + -2.0;
      v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    }
    v30 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v23);
    *(_OWORD *)(v30 + 96) = xmmword_2292781E0;
    *(double *)(v30 + 112) = v24 + -48.0;
    *(_QWORD *)(v30 + 120) = 0x4032000000000000;
    if (*v4)
    {
      v54.size.width = *(CGFloat *)(v30 + 16);
      v54.origin.x = v22 - v54.size.width;
      v54.origin.y = *(double *)(v30 + 8) + 25.0;
      *(double *)v30 = v22 - v54.size.width;
      *(CGFloat *)(v30 + 8) = v54.origin.y;
      v54.size.height = *(CGFloat *)(v30 + 24);
      v22 = CGRectGetMinX(v54) + -6.0;
    }
    v31 = (void *)(*(_QWORD **)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8DF0]))[1];
    if (v31)
    {
      v32 = (int)*MEMORY[0x24BEC8DE8];
      v33 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v32);
      objc_msgSend(v31, "size");
      *(_QWORD *)(v33 + 48) = v34;
      *(_QWORD *)(v33 + 56) = v35;
      v36 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v32);
      v55.size.width = *(CGFloat *)(v36 + 48);
      v55.size.height = *(CGFloat *)(v36 + 56);
      v55.origin.x = v22 - v55.size.width;
      *(double *)(v36 + 32) = v22 - v55.size.width;
      *(_QWORD *)(v36 + 40) = 0x4038000000000000;
      v55.origin.y = 24.0;
      v22 = CGRectGetMinX(v55) + -5.0;
    }
    v37 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v23);
    *(_OWORD *)(v37 + 64) = xmmword_2292781F0;
    *(double *)(v37 + 80) = v22 + -48.0;
    v38 = (_QWORD *)(v37 + 88);
  }
  else
  {
    if (*v4)
    {
      v39 = *(double **)((char *)&self->super.super.super.super.super.super.isa + *v6);
      v56.size.width = v39[2];
      v56.origin.x = v22 - v56.size.width;
      v56.origin.y = v39[1] + 17.0;
      *v39 = v22 - v56.size.width;
      v39[1] = v56.origin.y;
      v56.size.height = v39[3];
      v22 = CGRectGetMinX(v56) + -6.0;
    }
    v40 = (void *)(*(_QWORD **)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8DF0]))[1];
    if (v40)
    {
      v41 = (int)*MEMORY[0x24BEC8DE8];
      v42 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v41);
      objc_msgSend(v40, "size");
      *(_QWORD *)(v42 + 48) = v43;
      *(_QWORD *)(v42 + 56) = v44;
      v45 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v41);
      v57.size.width = *(CGFloat *)(v45 + 48);
      v57.size.height = *(CGFloat *)(v45 + 56);
      v57.origin.x = v22 - v57.size.width;
      *(double *)(v45 + 32) = v22 - v57.size.width;
      *(_QWORD *)(v45 + 40) = 0x4030000000000000;
      v57.origin.y = 16.0;
      v22 = CGRectGetMinX(v57) + -5.0;
    }
    v46 = *v6;
    if ((*(_QWORD **)((char *)&self->super.super.super.super.super.super.isa + v3))[1])
    {
      v47 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v46);
      v48 = *(double *)(v47 + 48);
      v49 = *(_QWORD *)(v47 + 56);
      v50 = v22 - v48;
      if (v20 + 48.0 + 2.0 < v22 - v48)
        v50 = v20 + 48.0 + 2.0;
      *(double *)(v47 + 32) = v50;
      *(_QWORD *)(v47 + 40) = 0x402A000000000000;
      v51 = 13.0;
      v22 = CGRectGetMinX(*(CGRect *)&v50) + -2.0;
    }
    v52 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v46);
    *(_OWORD *)(v52 + 96) = xmmword_229278200;
    *(double *)(v52 + 112) = v22 + -48.0;
    v38 = (_QWORD *)(v52 + 120);
  }
  *v38 = 0x4032000000000000;
}

- (void)reloadStrings
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  void *v18;
  id v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MSTrackListCellConfiguration;
  -[SUMediaItemCellConfiguration reloadStrings](&v20, sel_reloadStrings);
  v3 = (int)*MEMORY[0x24BEC8E20];
  v4 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v3), "title");
  v5 = (int)*MEMORY[0x24BEC8E08];

  v6 = (id)objc_msgSend(v4, "length");
  if (v6)
    v6 = v4;
  (*(_QWORD **)((char *)&self->super.super.super.super.super.super.isa + v5))[3] = v6;
  if (!objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8E10]), "showSubtitle"))
  {
    v9 = 0;
    goto LABEL_13;
  }
  v7 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v3), "itemType");
  if (v7 == 11)
    goto LABEL_7;
  if (v7 == 1009)
  {
    v10 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v3), "humanReadableDescription");
LABEL_11:
    v8 = v10;
    goto LABEL_12;
  }
  if (v7 != 1007)
  {
    v10 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v3), "artistName");
    goto LABEL_11;
  }
LABEL_7:
  v8 = (id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v3), "copyReleaseDateStringWithStyle:", 3);
LABEL_12:
  v9 = v8;
LABEL_13:

  v11 = (id)objc_msgSend(v9, "length");
  if (v11)
    v11 = v9;
  (*(_QWORD **)((char *)&self->super.super.super.super.super.super.isa + v5))[2] = v11;

  v12 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v3), "defaultStoreOffer");
  v13 = v12;
  if (v12)
  {
    if (objc_msgSend((id)objc_msgSend(v12, "offerMedia"), "fullDurationInMilliseconds") < 1)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(v13, "offerMedia"), "fullDurationInMilliseconds");
      v14 = (void *)SUCopyProgressStringForSeconds();
      v13 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@)"), v14);

    }
  }

  v15 = (id)objc_msgSend(v13, "length");
  if (v15)
    v15 = v13;
  (*(_QWORD **)((char *)&self->super.super.super.super.super.super.isa + v5))[1] = v15;
  v16 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (v16)
  {
    v17 = objc_msgSend(v16, "integerValueForProperty:", CFSTR("track-number"));
    if (!v17)
      v17 = self->_position.localIndex + 1;
    v18 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v17);
  }
  else
  {
    v18 = 0;
  }

  v19 = (id)objc_msgSend(v18, "length");
  if (v19)
    v19 = v18;
  (*(_QWORD **)((char *)&self->super.super.super.super.super.super.isa + v5))[4] = v19;
}

- (BOOL)showContentRating
{
  unsigned int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSTrackListCellConfiguration;
  v3 = -[SUMediaItemCellConfiguration showContentRating](&v5, sel_showContentRating);
  if (v3)
    LOBYTE(v3) = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8E10]), "shouldHideContentRating") ^ 1;
  return v3;
}

- ($3CC19D079FD0B010EE84973AA846B91B)position
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[4].var1;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

@end
