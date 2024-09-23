@implementation ASCompetitionGraphView

+ (id)companionGraph
{
  ASCompetitionGraphView *v2;
  ASCompetitionGraphView *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = [ASCompetitionGraphView alloc];
  v3 = -[ASCompetitionGraphView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionGraphView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  -[ASCompetitionGraphView setAlignment:](v3, "setAlignment:", 1);
  -[ASCompetitionGraphView setDateFormat:](v3, "setDateFormat:", CFSTR("EEE"));
  -[ASCompetitionGraphView setHorizontalInset:](v3, "setHorizontalInset:", 0.0);
  -[ASCompetitionGraphView setBarWidth:](v3, "setBarWidth:", 5.0);
  -[ASCompetitionGraphView setSpaceBetweenBars:](v3, "setSpaceBetweenBars:", 1.0);
  -[ASCompetitionGraphView setMaxBarHeight:](v3, "setMaxBarHeight:", 76.0);
  -[ASCompetitionGraphView setBottomPadding:](v3, "setBottomPadding:", 1.0);
  -[ASCompetitionGraphView setHighlightsCurrentDay:](v3, "setHighlightsCurrentDay:", 0);
  -[ASCompetitionGraphView setShowsBackgroundDateGuide:](v3, "setShowsBackgroundDateGuide:", 1);
  -[ASCompetitionGraphView setShowsBackgroundScoreGuide:](v3, "setShowsBackgroundScoreGuide:", 1);
  -[ASCompetitionGraphView setDrawsDailyScoreLabels:](v3, "setDrawsDailyScoreLabels:", 1);
  -[ASCompetitionGraphView setDrawsFutureScoreDots:](v3, "setDrawsFutureScoreDots:", 1);
  v5 = *MEMORY[0x24BEBE1E0];
  objc_msgSend(MEMORY[0x24BEBB520], "defaultFontForTextStyle:", *MEMORY[0x24BEBE1E0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionGraphView setCurrentDateFont:](v3, "setCurrentDateFont:", v6);

  objc_msgSend(MEMORY[0x24BEBB520], "defaultFontForTextStyle:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionGraphView setDateFont:](v3, "setDateFont:", v7);

  -[ASCompetitionGraphView currentDateFont](v3, "currentDateFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_scaledValueForValue:", 13.0);
  -[ASCompetitionGraphView setDayLabelBaselineOffset:](v3, "setDayLabelBaselineOffset:");

  objc_msgSend(MEMORY[0x24BEBD4B8], "fu_systemTextGreyColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionGraphView setDateColor:](v3, "setDateColor:", v9);

  return v3;
}

+ (id)gizmoGraph
{
  ASCompetitionGraphView *v2;
  ASCompetitionGraphView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = [ASCompetitionGraphView alloc];
  v3 = -[ASCompetitionGraphView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[ASCompetitionGraphView setAlignment:](v3, "setAlignment:", 0);
  -[ASCompetitionGraphView setDateFormat:](v3, "setDateFormat:", CFSTR("EEEEE"));
  -[ASCompetitionGraphView setHorizontalInset:](v3, "setHorizontalInset:", 0.0);
  -[ASCompetitionGraphView setBarWidth:](v3, "setBarWidth:", 5.0);
  -[ASCompetitionGraphView setSpaceBetweenBars:](v3, "setSpaceBetweenBars:", 1.0);
  -[ASCompetitionGraphView setMaxBarHeight:](v3, "setMaxBarHeight:", 28.5);
  -[ASCompetitionGraphView setDayLabelBaselineOffset:](v3, "setDayLabelBaselineOffset:", 14.0);
  -[ASCompetitionGraphView setHighlightsCurrentDay:](v3, "setHighlightsCurrentDay:", 1);
  objc_msgSend(MEMORY[0x24BEBB520], "fu_heavySausageFontOfSize:", 9.5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionGraphView setCurrentDateFont:](v3, "setCurrentDateFont:", v4);

  objc_msgSend(MEMORY[0x24BEBB520], "fu_mediumSausageFontOfSize:", 11.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionGraphView setDateFont:](v3, "setDateFont:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionGraphView setDateColor:](v3, "setDateColor:", v6);

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionGraphView setHighlightedDateColor:](v3, "setHighlightedDateColor:", v7);

  -[ASCompetitionGraphView setBottomPadding:](v3, "setBottomPadding:", 5.0);
  return v3;
}

- (ASCompetitionGraphView)initWithFrame:(CGRect)a3
{
  ASCompetitionGraphView *v3;
  NSDateFormatter *v4;
  NSDateFormatter *dateFormatter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCompetitionGraphView;
  v3 = -[ASCompetitionGraphView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    dateFormatter = v3->_dateFormatter;
    v3->_dateFormatter = v4;

    -[ASCompetitionGraphView setClearsContextBeforeDrawing:](v3, "setClearsContextBeforeDrawing:", 1);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCompetitionGraphView;
  -[ASCompetitionGraphView layoutSubviews](&v4, sel_layoutSubviews);
  -[ASCompetitionGraphView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDisplay");

}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  double barWidth;
  double v13;
  double v14;
  CGPath *Mutable;
  CGContext *CurrentContext;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  double horizontalInset;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  int v32;
  int *v33;
  double v34;
  id v35;
  double maxBarHeight;
  double v37;
  double v38;
  double v39;
  id v40;
  id v41;
  CGFloat v42;
  CGFloat v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  const __CFArray *v48;
  CGGradient *v49;
  CGFloat MinX;
  CGFloat MidY;
  CGFloat MaxX;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  UIFont *dateFont;
  void *v61;
  UIFont *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  CGFloat v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  float v86;
  float v87;
  double v88;
  double v89;
  float v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  unint64_t v96;
  double v97;
  double v98;
  CGFloat v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  uint64_t v105;
  double v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  id v114;
  uint64_t v115;
  void *v116;
  void *v117;
  double v118;
  double v119;
  double v120;
  void *v121;
  void *v122;
  void *v123;
  CGPath *v124;
  CGPath *path;
  CGContext *c;
  CGPath *v127;
  CGPath *v128;
  uint64_t v129;
  uint64_t v130;
  double v131;
  double v132;
  unint64_t v133;
  uint64_t v134;
  CGPath *v135;
  CGPath *v136;
  void *v137;
  double v138;
  void *v139;
  void *v140;
  void *v141;
  int v142;
  void *v143;
  _QWORD v144[2];
  _QWORD v145[2];
  _QWORD v146[2];
  _QWORD v147[2];
  _QWORD v148[2];
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  CGPoint v152;
  CGPoint v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v151 = *MEMORY[0x24BDAC8D0];
  -[ASCompetition durationDateComponents](self->_competition, "durationDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "day");

  if (-[ASCompetition isDailyScoreCapped](self->_competition, "isDailyScoreCapped"))
  {
    v134 = -[ASCompetition maximumNumberOfPointsPerDay](self->_competition, "maximumNumberOfPointsPerDay");
  }
  else
  {
    v10 = -[ASCompetitionGraphView _maxDailyScore](self, "_maxDailyScore");
    v11 = 100;
    if (v10 > 0x64)
      v11 = v10;
    v134 = v11;
  }
  barWidth = self->_barWidth;
  v13 = 0.5;
  -[ASCompetitionGraphView bounds](self, "bounds");
  v14 = CGRectGetWidth(v154) + self->_horizontalInset * -2.0;
  Mutable = CGPathCreateMutable();
  v128 = CGPathCreateMutable();
  path = CGPathCreateMutable();
  v136 = CGPathCreateMutable();
  v127 = CGPathCreateMutable();
  v124 = CGPathCreateMutable();
  v135 = CGPathCreateMutable();
  objc_msgSend(MEMORY[0x24BEBD4B8], "as_competitionGraphBackgroundGold");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "as_colorForParticipant:competition:", 0, self->_competition);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "colorWithAlphaComponent:", 0.5);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "as_colorForParticipant:competition:", 1, self->_competition);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "colorWithAlphaComponent:", 0.5);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  CurrentContext = UIGraphicsGetCurrentContext();
  UIGraphicsPushContext(CurrentContext);
  v155.origin.x = x;
  v155.origin.y = y;
  v155.size.width = width;
  v155.size.height = height;
  CGContextClearRect(CurrentContext, v155);
  CGContextSetLineWidth(CurrentContext, self->_barWidth);
  c = CurrentContext;
  CGContextSetLineCap(CurrentContext, kCGLineCapButt);
  -[ASCompetition startDate](self->_competition, "startDate");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v120 = v14;
  if (v9)
  {
    v19 = 0;
    v20 = v14 / (double)v9;
    v129 = *MEMORY[0x24BEBB360];
    v130 = *MEMORY[0x24BEBB368];
    v21 = (void *)v17;
    v133 = v9;
    v131 = v20;
    v132 = barWidth * 0.5;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = objc_msgSend(v21, "hk_isAfterDate:", v22);

      horizontalInset = self->_horizontalInset;
      -[ASCompetitionGraphView _attributesForDateLabelWithDate:](self, "_attributesForDateLabelWithDate:", v21);
      v24 = objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v21);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "sizeWithAttributes:", v24);
      v26 = v25;
      v28 = v27;
      v29 = (v20 - v25) * v13;
      if (self->_alignment)
        v30 = -0.0;
      else
        v30 = v29;
      if (self->_highlightsCurrentDay)
      {
        objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isDateInToday:", v21);

        v33 = &OBJC_IVAR___ASCompetitionGraphView__dateFont;
        if (v32)
          v33 = &OBJC_IVAR___ASCompetitionGraphView__currentDateFont;
      }
      else
      {
        v32 = 0;
        v33 = &OBJC_IVAR___ASCompetitionGraphView__dateFont;
      }
      v34 = horizontalInset + (double)v19 * v20 + v30;
      v35 = *(id *)((char *)&self->super.super.super.isa + *v33);
      maxBarHeight = self->_maxBarHeight;
      if (self->_showsBackgroundScoreGuide)
        maxBarHeight = maxBarHeight + 5.0;
      v37 = maxBarHeight + self->_dayLabelBaselineOffset;
      v140 = v35;
      objc_msgSend(v35, "ascender");
      v39 = v37 - v38;
      v141 = (void *)v24;
      if (v32)
      {
        v40 = v139;
        v41 = v137;
        v156.origin.x = v34;
        v156.origin.y = v39;
        v156.size.width = v26;
        v156.size.height = v28;
        v42 = CGRectGetMidX(v156) + -6.5;
        v157.origin.x = v34;
        v157.origin.y = v39;
        v157.size.width = v26;
        v157.size.height = v28;
        v138 = v39;
        v43 = CGRectGetMidY(v157) + -6.5;
        v44 = objc_retainAutorelease(v40);
        v45 = objc_msgSend(v44, "CGColor");

        v149 = v45;
        v46 = objc_retainAutorelease(v41);
        v47 = objc_msgSend(v46, "CGColor");

        v150 = v47;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v149, 2);
        v48 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
        v49 = CGGradientCreateWithColors(0, v48, 0);

        v24 = (uint64_t)v141;
        CGContextSaveGState(c);
        v158.size.width = 13.0;
        v158.size.height = 13.0;
        v158.origin.x = v42;
        v158.origin.y = v43;
        CGContextAddEllipseInRect(c, v158);
        CGContextClip(c);
        v159.size.width = 13.0;
        v159.size.height = 13.0;
        v159.origin.x = v42;
        v159.origin.y = v43;
        MinX = CGRectGetMinX(v159);
        v160.size.width = 13.0;
        v160.size.height = 13.0;
        v160.origin.x = v42;
        v160.origin.y = v43;
        MidY = CGRectGetMidY(v160);
        v161.size.width = 13.0;
        v161.size.height = 13.0;
        v161.origin.x = v42;
        v161.origin.y = v43;
        MaxX = CGRectGetMaxX(v161);
        v162.size.width = 13.0;
        v162.size.height = 13.0;
        v162.origin.x = v42;
        v162.origin.y = v43;
        v39 = v138;
        v153.y = CGRectGetMidY(v162);
        v152.x = MinX;
        v13 = 0.5;
        v152.y = MidY;
        v153.x = MaxX;
        CGContextDrawLinearGradient(c, v49, v152, v153, 0);
        CGGradientRelease(v49);
        CGContextRestoreGState(c);
      }
      objc_msgSend(v143, "drawInRect:withAttributes:", v24, v34, v39, v26, v28);
      if (self->_drawsDailyScoreLabels)
      {
        v53 = -[ASCompetition dailyScoreForParticipant:onDate:](self->_competition, "dailyScoreForParticipant:onDate:", 0, v21);
        v54 = -[ASCompetition dailyScoreForParticipant:onDate:](self->_competition, "dailyScoreForParticipant:onDate:", 1, v21);
        if ((v142 & 1) != 0)
        {
          ActivitySharingBundle();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("COMPETITION_FUTURE_EMPTY_POINTS"), &stru_24EE9E808, CFSTR("Localizable"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          ActivitySharingBundle();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("COMPETITION_FUTURE_EMPTY_POINTS"), &stru_24EE9E808, CFSTR("Localizable"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v59 = v54;
          ASCompetitionZeroPaddedScoreString(v53);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          ASCompetitionZeroPaddedScoreString(v59);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v146[0] = v130;
        v146[1] = v129;
        dateFont = self->_dateFont;
        v147[0] = v139;
        v147[1] = dateFont;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v147, v146, 2);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v144[0] = v130;
        v144[1] = v129;
        v62 = self->_dateFont;
        v145[0] = v137;
        v145[1] = v62;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v145, v144, 2);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "sizeWithAttributes:", v61);
        v65 = v64;
        v67 = v66;
        objc_msgSend(v58, "sizeWithAttributes:", v63);
        v69 = v68;
        v71 = v70;
        -[UIFont _scaledValueForValue:](self->_dateFont, "_scaledValueForValue:", 13.0);
        v73 = v39 + v72;
        -[UIFont _scaledValueForValue:](self->_dateFont, "_scaledValueForValue:", 13.0);
        objc_msgSend(v56, "drawInRect:withAttributes:", v61, v34, v73 + v74, v65, v67);
        objc_msgSend(v58, "drawInRect:withAttributes:", v63, v34, v73, v69, v71);

      }
      -[ASCompetitionGraphView _firstBarOriginXForDateLabelOriginX:dateLabelWidth:](self, "_firstBarOriginXForDateLabelOriginX:dateLabelWidth:", v34, v26);
      v76 = v75;
      if (self->_showsBackgroundScoreGuide)
        v77 = 2.5;
      else
        v77 = 0.0;
      v78 = self->_maxBarHeight + v77;
      v79 = v75 + self->_barWidth + self->_spaceBetweenBars;
      -[ASCompetition opponentScores](self->_competition, "opponentScores");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCompetitionGraphView _percentForScoreAtIndex:scores:maxScore:](self, "_percentForScoreAtIndex:scores:maxScore:", v19, v80, v134);
      v82 = v81;

      -[ASCompetition scores](self->_competition, "scores");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCompetitionGraphView _percentForScoreAtIndex:scores:maxScore:](self, "_percentForScoreAtIndex:scores:maxScore:", v19, v83, v134);
      v85 = v84;

      v86 = v82 * self->_maxBarHeight;
      v87 = self->_barWidth;
      *(float *)&v82 = fmaxf(v86, v87);
      -[ASCompetitionGraphView maxBarHeight](self, "maxBarHeight");
      *(float *)&v88 = v88;
      v89 = fminf(*(float *)&v82, *(float *)&v88);
      *(float *)&v88 = v85 * self->_maxBarHeight;
      v90 = self->_barWidth;
      *(float *)&v82 = fmaxf(*(float *)&v88, v90);
      -[ASCompetitionGraphView maxBarHeight](self, "maxBarHeight");
      *(float *)&v91 = v91;
      v92 = fminf(*(float *)&v82, *(float *)&v91);
      v93 = v78 - v89;
      v94 = v78 - v92;
      v95 = self->_barWidth;
      if (v142)
      {
        v96 = v133;
        if (self->_drawsFutureScoreDots)
        {
          v97 = v79;
          v98 = self->_barWidth;
          CGPathAddRoundedRect(path, 0, *(CGRect *)(&v94 - 1), v132, v132);
          v163.origin.x = v76;
          v163.origin.y = v93;
          v163.size.width = v95;
          v99 = v132;
          v163.size.height = v89;
          CGPathAddRoundedRect(v124, 0, v163, v99, v99);
        }
        else
        {
          v99 = v132;
        }
      }
      else
      {
        v100 = v79;
        v101 = self->_barWidth;
        CGPathAddRoundedRect(v128, 0, *(CGRect *)(&v94 - 1), v132, v132);
        v164.origin.x = v76;
        v164.origin.y = v93;
        v164.size.width = v95;
        v99 = v132;
        v164.size.height = v89;
        CGPathAddRoundedRect(v127, 0, v164, v99, v99);
        v96 = v133;
      }
      v20 = v131;
      v102 = self->_barWidth;
      v103 = self->_maxBarHeight;
      v165.origin.x = v79;
      v165.origin.y = v77;
      v165.size.width = v102;
      v165.size.height = v103;
      CGPathAddRoundedRect(v136, 0, v165, v99, v99);
      v166.origin.x = v76;
      v166.origin.y = v77;
      v166.size.width = v102;
      v166.size.height = v103;
      CGPathAddRoundedRect(v135, 0, v166, v99, v99);
      objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "dateByAddingUnit:value:toDate:options:", 16, 1, v21, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      ++v19;
      v21 = v18;
    }
    while (v96 != v19);
  }
  if (self->_showsBackgroundScoreGuide)
  {
    -[ASCompetitionGraphView maxBarHeight](self, "maxBarHeight");
    v105 = 0;
    v107 = 0.0;
    v108 = (v106 + 3.5) / 3.0;
    do
    {
      if (v120 > 0.0)
      {
        v109 = 0.0;
        do
        {
          v167.size.width = 1.5;
          v167.size.height = 1.5;
          v167.origin.x = v109;
          v167.origin.y = v107;
          CGPathAddEllipseInRect(Mutable, 0, v167);
          v109 = v109 + 3.5;
        }
        while (v109 < v120);
      }
      v107 = v108 + v107;
      ++v105;
    }
    while (v105 != 4);
    -[ASCompetitionGraphView maxBarHeight](self, "maxBarHeight");
    v110 = (void *)MEMORY[0x24BEBB520];
    v111 = v123;
    objc_msgSend(v110, "fu_sausageFontOfSize:", 13.0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    ASCompetitionZeroPaddedScoreString(v134);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_alloc(MEMORY[0x24BDD1458]);
    v115 = *MEMORY[0x24BEBB368];
    v148[0] = *MEMORY[0x24BEBB360];
    v148[1] = v115;
    v149 = (uint64_t)v112;
    v150 = (uint64_t)v111;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v149, v148, 2);
    v116 = (void *)objc_claimAutoreleasedReturnValue();

    v117 = (void *)objc_msgSend(v114, "initWithString:attributes:", v113, v116);
    objc_msgSend(v117, "size");
    objc_msgSend(v117, "drawInRect:", v120 - v118 + -1.0, 0.0, v118, v119);

  }
  _DrawPathWithColor(c, Mutable, v123);
  _DrawPathWithColor(c, v136, v123);
  _DrawPathWithColor(c, v135, v123);
  _DrawPathWithColor(c, v128, v139);
  _DrawPathWithColor(c, path, v122);
  _DrawPathWithColor(c, v127, v137);
  _DrawPathWithColor(c, v124, v121);
  CGPathRelease(Mutable);
  CGPathRelease(v128);
  CGPathRelease(v127);
  CGPathRelease(path);
  CGPathRelease(v124);
  CGPathRelease(v136);
  CGPathRelease(v135);
  UIGraphicsPopContext();

}

- (void)setCompetition:(id)a3
{
  objc_storeStrong((id *)&self->_competition, a3);
  -[ASCompetitionGraphView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDateFormat:(id)a3
{
  -[NSDateFormatter setDateFormat:](self->_dateFormatter, "setDateFormat:", a3);
  -[ASCompetitionGraphView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)dateFormat
{
  return -[NSDateFormatter dateFormat](self->_dateFormatter, "dateFormat");
}

- (double)preferredHeight
{
  double v3;

  -[ASCompetitionGraphView lastBaselineY](self, "lastBaselineY");
  return v3 + self->_bottomPadding;
}

- (double)lastBaselineY
{
  double v3;
  double v4;
  double v5;
  double maxBarHeight;
  double v7;

  v3 = 0.0;
  v4 = 0.0;
  if (-[ASCompetitionGraphView drawsDailyScoreLabels](self, "drawsDailyScoreLabels"))
  {
    -[UIFont _scaledValueForValue:](self->_dateFont, "_scaledValueForValue:", 13.0);
    v4 = v5 + v5;
  }
  if (-[ASCompetitionGraphView showsBackgroundScoreGuide](self, "showsBackgroundScoreGuide"))
    v3 = 5.0;
  maxBarHeight = self->_maxBarHeight;
  -[UIFont _scaledValueForValue:](self->_dateFont, "_scaledValueForValue:", self->_dayLabelBaselineOffset);
  return v3 + v4 + maxBarHeight + v7;
}

- (id)_attributesForDateLabelWithDate:(id)a3
{
  id v4;
  int *v5;
  int *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = &OBJC_IVAR___ASCompetitionGraphView__dateFont;
  v6 = &OBJC_IVAR___ASCompetitionGraphView__dateColor;
  if (self->_highlightsCurrentDay)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isDateInToday:", v4);

    if (v8)
    {
      v6 = &OBJC_IVAR___ASCompetitionGraphView__highlightedDateColor;
      v5 = &OBJC_IVAR___ASCompetitionGraphView__currentDateFont;
    }
  }
  v9 = *(id *)((char *)&self->super.super.super.isa + *v6);
  v10 = *(Class *)((char *)&self->super.super.super.isa + *v5);
  v11 = *MEMORY[0x24BEBB360];
  v16[0] = *MEMORY[0x24BEBB368];
  v16[1] = v11;
  v17[0] = v9;
  v17[1] = v10;
  v12 = (void *)MEMORY[0x24BDBCE70];
  v13 = v10;
  objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (double)_firstBarOriginXForDateLabelOriginX:(double)result dateLabelWidth:(double)a4
{
  if (!self->_alignment)
    result = a4 * 0.5 + result - self->_barWidth - self->_spaceBetweenBars * 0.5;
  if (self->_showsBackgroundDateGuide)
    return result + 1.0 + 1.0;
  return result;
}

- (unint64_t)_maxDailyScore
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  unint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[ASCompetitionGraphView _allScores](self, "_allScores");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "unsignedIntegerValue");
        if (v5 <= v8)
          v5 = v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)_minDailyScore
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[ASCompetitionGraphView _allScores](self, "_allScores");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      v7 = -1;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v11);
          if (v7 >= v9)
            v7 = v9;
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }
    else
    {
      v7 = -1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_allScores
{
  void *v3;
  void *v4;
  void *v5;

  -[ASCompetition scores](self->_competition, "scores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetition opponentScores](self->_competition, "opponentScores");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)_percentForScoreAtIndex:(unint64_t)a3 scores:(id)a4 maxScore:(unint64_t)a5
{
  id v7;
  double v8;
  void *v9;
  unint64_t v10;

  v7 = a4;
  v8 = 0.0;
  if (objc_msgSend(v7, "count") > a3)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    if (v10)
      v8 = (double)v10 / (double)a5;
  }

  return v8;
}

- (ASCompetition)competition
{
  return self->_competition;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (double)horizontalInset
{
  return self->_horizontalInset;
}

- (void)setHorizontalInset:(double)a3
{
  self->_horizontalInset = a3;
}

- (double)barWidth
{
  return self->_barWidth;
}

- (void)setBarWidth:(double)a3
{
  self->_barWidth = a3;
}

- (double)spaceBetweenBars
{
  return self->_spaceBetweenBars;
}

- (void)setSpaceBetweenBars:(double)a3
{
  self->_spaceBetweenBars = a3;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void)setBottomPadding:(double)a3
{
  self->_bottomPadding = a3;
}

- (double)dayLabelBaselineOffset
{
  return self->_dayLabelBaselineOffset;
}

- (void)setDayLabelBaselineOffset:(double)a3
{
  self->_dayLabelBaselineOffset = a3;
}

- (double)maxBarHeight
{
  return self->_maxBarHeight;
}

- (void)setMaxBarHeight:(double)a3
{
  self->_maxBarHeight = a3;
}

- (UIFont)currentDateFont
{
  return self->_currentDateFont;
}

- (void)setCurrentDateFont:(id)a3
{
  objc_storeStrong((id *)&self->_currentDateFont, a3);
}

- (UIFont)dateFont
{
  return self->_dateFont;
}

- (void)setDateFont:(id)a3
{
  objc_storeStrong((id *)&self->_dateFont, a3);
}

- (UIColor)dateColor
{
  return self->_dateColor;
}

- (void)setDateColor:(id)a3
{
  objc_storeStrong((id *)&self->_dateColor, a3);
}

- (UIColor)highlightedDateColor
{
  return self->_highlightedDateColor;
}

- (void)setHighlightedDateColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedDateColor, a3);
}

- (BOOL)highlightsCurrentDay
{
  return self->_highlightsCurrentDay;
}

- (void)setHighlightsCurrentDay:(BOOL)a3
{
  self->_highlightsCurrentDay = a3;
}

- (BOOL)showsBackgroundDateGuide
{
  return self->_showsBackgroundDateGuide;
}

- (void)setShowsBackgroundDateGuide:(BOOL)a3
{
  self->_showsBackgroundDateGuide = a3;
}

- (BOOL)showsBackgroundScoreGuide
{
  return self->_showsBackgroundScoreGuide;
}

- (void)setShowsBackgroundScoreGuide:(BOOL)a3
{
  self->_showsBackgroundScoreGuide = a3;
}

- (BOOL)drawsDailyScoreLabels
{
  return self->_drawsDailyScoreLabels;
}

- (void)setDrawsDailyScoreLabels:(BOOL)a3
{
  self->_drawsDailyScoreLabels = a3;
}

- (BOOL)drawsFutureScoreDots
{
  return self->_drawsFutureScoreDots;
}

- (void)setDrawsFutureScoreDots:(BOOL)a3
{
  self->_drawsFutureScoreDots = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedDateColor, 0);
  objc_storeStrong((id *)&self->_dateColor, 0);
  objc_storeStrong((id *)&self->_dateFont, 0);
  objc_storeStrong((id *)&self->_currentDateFont, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_competition, 0);
}

@end
