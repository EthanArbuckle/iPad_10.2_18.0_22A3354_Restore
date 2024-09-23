@implementation EKUIYearMonthView

- (EKUIYearMonthView)initWithCalendarDate:(id)a3 calendar:(id)a4
{
  id v6;
  id v7;
  EKUIYearMonthView *v8;
  void *v9;
  uint64_t v10;
  EKCalendarDate *calendarDate;
  uint64_t v12;
  EKCalendarDate *endCalendarDate;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EKUIYearMonthView;
  v8 = -[EKUIYearMonthView init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIYearMonthView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    objc_storeStrong((id *)&v8->_calendar, a4);
    objc_msgSend(v6, "calendarDateForMonth");
    v10 = objc_claimAutoreleasedReturnValue();
    calendarDate = v8->_calendarDate;
    v8->_calendarDate = (EKCalendarDate *)v10;

    objc_msgSend(v6, "calendarDateForEndOfMonth");
    v12 = objc_claimAutoreleasedReturnValue();
    endCalendarDate = v8->_endCalendarDate;
    v8->_endCalendarDate = (EKCalendarDate *)v12;

    -[EKUIYearMonthView _reloadCachedValues](v8, "_reloadCachedValues");
    -[EKUIYearMonthView setWantsDeepColorDrawing:](v8, "setWantsDeepColorDrawing:", 0);
    if (-[EKUIYearMonthView shouldAddPreciseInteractivity](v8, "shouldAddPreciseInteractivity"))
      -[EKUIYearMonthView _setUpInteraction](v8, "_setUpInteraction");
    -[EKUIYearMonthView layer](v8, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("separatedOptions.enableContext"));
    objc_msgSend(v14, "setNeedsDisplay");

  }
  return v8;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)EKUIYearMonthView;
  -[EKUIYearMonthView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIYearMonthView calendarDate](self, "calendarDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@;\n\tcalendarDate: [%@]\n\t_endCalendarDate: [%@]"),
    v4,
    v5,
    self->_endCalendarDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)drawRect:(CGRect)a3
{
  CGContextRef CurrentContext;
  CGContextRef v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double x;
  double y;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  int64_t firstDayIndex;
  double v41;
  int64_t daysInWeek;
  void *v43;
  void *v44;
  uint64_t v45;
  int64_t v46;
  id v47;
  double v48;
  double v49;
  uint64_t v50;
  double v51;
  CGContext *v52;
  int64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGContext *v63;
  double v64;
  uint64_t v65;
  int64_t v66;
  double v67;
  double v68;
  NSSet *firstOfOverlayYearIndices;
  void *v70;
  NSSet *firstOfOverlayMonthIndices;
  void *v72;
  void *v73;
  _BOOL4 v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  int IsLeftToRight;
  double v88;
  CGContext *v89;
  void *v90;
  void *v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  CGContext *c;
  void *v98;
  void *v99;
  double v100;
  CGRect v101;
  __int128 v102;
  __int128 v103;
  CGRect v104;
  CGRect v105;

  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext)
  {
    v5 = CurrentContext;
    if (-[EKUIYearMonthView showMonthName](self, "showMonthName"))
    {
      -[EKUIYearMonthView _monthNameOriginPoint](self, "_monthNameOriginPoint");
      v7 = v6;
      v9 = v8;
      -[EKUIYearMonthView _imageForMonthName:](self, "_imageForMonthName:", self->_monthString);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((CalInterfaceIsLeftToRight() & 1) == 0)
      {
        objc_msgSend(v10, "size");
        v7 = v7 - v11;
      }
      -[EKUIYearMonthView tintColor](self, "tintColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "set");

      objc_msgSend(v10, "drawAtPoint:", v7, v9);
    }
    -[EKUIYearMonthView bounds](self, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[EKUIYearMonthView xInset](self, "xInset");
    v22 = v21;
    -[EKUIYearMonthView yInset](self, "yInset");
    v24 = v23;
    v104.origin.x = v14;
    v104.origin.y = v16;
    v104.size.width = v18;
    v104.size.height = v20;
    v105 = CGRectInset(v104, v22, v24);
    x = v105.origin.x;
    y = v105.origin.y;
    if (-[EKUIYearMonthView showWeekDayInitials](self, "showWeekDayInitials"))
    {
      -[EKUIYearMonthView weekDayInitialsAdjustLeft](self, "weekDayInitialsAdjustLeft");
      v28 = x + v27;
      -[EKUIYearMonthView weekDayInitialsAdjustTop](self, "weekDayInitialsAdjustTop");
      v30 = y + v29;
      -[EKUIYearMonthView _weekDayInitialsImage](self, "_weekDayInitialsImage");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "drawAtPoint:", v28, v30);

    }
    -[EKUIYearMonthView daysXAdjustLeft](self, "daysXAdjustLeft", v5);
    v33 = x + v32;
    -[EKUIYearMonthView daysYAdjustTop](self, "daysYAdjustTop");
    v35 = y + v34;
    -[EKUIYearMonthView xSpacing](self, "xSpacing");
    v37 = v36;
    -[EKUIYearMonthView ySpacing](self, "ySpacing");
    v39 = v38;
    if (CalTimeDirectionIsLeftToRight())
    {
      firstDayIndex = self->_firstDayIndex;
      v41 = v33 + v37 * (double)firstDayIndex;
      daysInWeek = self->_daysInWeek;
    }
    else
    {
      daysInWeek = self->_daysInWeek;
      firstDayIndex = self->_firstDayIndex;
      v41 = v33 + v37 * (double)(daysInWeek + ~firstDayIndex);
    }
    objc_msgSend((id)objc_opt_class(), "_defaultTextColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "set");

    -[EKUIYearMonthView calendarDate](self, "calendarDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "daysInMonth");

    v46 = self->_firstDayIndex + v45;
    v47 = objc_alloc_init(MEMORY[0x1E0DC3508]);
    objc_msgSend(v47, "moveToPoint:", 0.0, v35);
    -[EKUIYearMonthView bounds](self, "bounds");
    v49 = v48 + 0.0;
    objc_msgSend(v47, "addLineToPoint:", v48 + 0.0, v35);
    v50 = v46 / 7;
    if (CalTimeDirectionIsLeftToRight())
    {
      objc_msgSend(v47, "addLineToPoint:", v49, v35 + (double)v50 * v39);
      v49 = v33 + (double)(v46 % 7) * v37;
      objc_msgSend(v47, "addLineToPoint:", v49, v35 + (double)v50 * v39);
    }
    v51 = v35 + (double)(v50 + 1) * v39;
    objc_msgSend(v47, "addLineToPoint:", v49, v51);
    v100 = v39;
    if ((CalTimeDirectionIsLeftToRight() & 1) == 0)
    {
      objc_msgSend(v47, "addLineToPoint:", v33 + (double)(7 * v50 - v46 + 7) * v37, v35 + (double)(v50 + 1) * v39);
      v51 = v51 - v39;
      objc_msgSend(v47, "addLineToPoint:", v33 + (double)(7 * v50 - v46 + 7) * v37, v51);
    }
    objc_msgSend(v47, "addLineToPoint:", 0.0, v51);
    objc_msgSend(v47, "closePath");
    v52 = UIGraphicsGetCurrentContext();
    CGContextSaveGState(v52);
    v99 = v47;
    objc_msgSend(v47, "addClip");
    v53 = self->_daysInWeek + ~self->_firstDayIndex;
    -[EKUIYearMonthView bounds](self, "bounds");
    v55 = v54;
    v57 = v56;
    -[EKUIYearMonthView daysYAdjustTop](self, "daysYAdjustTop");
    v59 = v57 - v58;
    v60 = *MEMORY[0x1E0C9D538];
    -[EKUIYearMonthView daysYAdjustTop](self, "daysYAdjustTop");
    v62 = v61;
    -[EKUIYearMonthView _imageForMonthDays:size:underlineThickness:](self, "_imageForMonthDays:size:underlineThickness:", v53, v55, v59, 0.0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "drawAtPoint:", v60, v62);
    v63 = UIGraphicsGetCurrentContext();
    CGContextRestoreGState(v63);
    v64 = v100;
    if (v45)
    {
      v65 = 0;
      v66 = daysInWeek - firstDayIndex;
      v67 = -1.0;
      do
      {
        v68 = 0.0;
        if (v65 != self->_todayIndex)
        {
          firstOfOverlayYearIndices = self->_firstOfOverlayYearIndices;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v65 + 1);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(firstOfOverlayYearIndices) = -[NSSet containsObject:](firstOfOverlayYearIndices, "containsObject:", v70);

          if ((_DWORD)firstOfOverlayYearIndices)
          {
            if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self))
              v68 = 2.0;
            else
              v68 = 1.5;
          }
          else
          {
            firstOfOverlayMonthIndices = self->_firstOfOverlayMonthIndices;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v65 + 1);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(firstOfOverlayMonthIndices) = -[NSSet containsObject:](firstOfOverlayMonthIndices, "containsObject:", v72);

            if ((_DWORD)firstOfOverlayMonthIndices)
            {
              if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self))
                v68 = 1.0;
              else
                v68 = 0.5;
            }
          }
        }
        -[EKUIYearMonthView traitCollection](self, "traitCollection");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = EKUIUsesLargeTextYearView(v73);

        if (v74)
          v68 = v68 + v68;
        if (v68 > 0.0 && v65 != self->_todayIndex)
        {
          CUIKLocalizedStringForInteger();
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          CalRoundToScreenScale(v37);
          v77 = v76;
          CalRoundToScreenScale(v64);
          v79 = v78;
          CalRoundToScreenScale(v68);
          v81 = v80;
          v82 = v77;
          v67 = -1.0;
          v83 = v79;
          v64 = v100;
          -[EKUIYearMonthView _imageForDayNumber:size:underlineThickness:](self, "_imageForDayNumber:size:underlineThickness:", v75, v82, v83, v81);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "drawAtPoint:", v41, v35);

        }
        if (v66-- <= 1)
        {
          IsLeftToRight = CalTimeDirectionIsLeftToRight();
          v66 = self->_daysInWeek;
          if (IsLeftToRight)
            v41 = v33;
          else
            v41 = v33 + v37 * (double)(v66 - 1);
          v35 = v64 + v35;
        }
        else
        {
          if (CalTimeDirectionIsLeftToRight())
            v88 = 1.0;
          else
            v88 = v67;
          v41 = v41 + v37 * v88;
        }
        ++v65;
      }
      while (v45 != v65);
    }
    if ((self->_todayIndex & 0x8000000000000000) == 0)
    {
      v102 = 0u;
      v103 = 0u;
      memset(&v101, 0, sizeof(v101));
      -[EKUIYearMonthView _getTodayNumberTextFrame:circleFrame:](self, "_getTodayNumberTextFrame:circleFrame:", &v102, &v101);
      if (-[EKUIYearMonthView vibrant](self, "vibrant"))
      {
        v89 = c;
        CGContextSaveGState(c);
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.52);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[EKUIYearMonthView tintColor](self, "tintColor");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = c;
      }
      objc_msgSend(v90, "set");

      if (-[EKUIYearMonthView _shouldUseRoundedRectInsteadOfCircle](self, "_shouldUseRoundedRectInsteadOfCircle"))
      {
        v91 = (void *)MEMORY[0x1E0DC3508];
        -[EKUIYearMonthView roundedRectCornerRadius](self, "roundedRectCornerRadius");
        objc_msgSend(v91, "bezierPathWithRoundedRect:cornerRadius:", *(_OWORD *)&v101.origin, *(_OWORD *)&v101.size, v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "fill");

      }
      else
      {
        CGContextFillEllipseInRect(v89, v101);
      }
      if (-[EKUIYearMonthView vibrant](self, "vibrant"))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "set");

        CGContextSetBlendMode(v89, kCGBlendModeXOR);
      }
      CUIKLocalizedStringForInteger();
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIYearMonthView _todayAttributes](self, "_todayAttributes");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "drawInRect:withAttributes:", v96, v102, v103);

      if (-[EKUIYearMonthView vibrant](self, "vibrant"))
        CGContextRestoreGState(v89);

    }
  }
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKUIYearMonthView;
  -[EKUIYearMonthView tintColorDidChange](&v4, sel_tintColorDidChange);
  -[EKUIYearMonthView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDisplay");

}

- (BOOL)pointIsAboveMonthNameBaseline:(CGPoint)a3
{
  double y;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  y = a3.y;
  -[EKUIYearMonthView _monthNameOriginPoint](self, "_monthNameOriginPoint", a3.x);
  v6 = v5;
  -[EKUIYearMonthView headerFont](self, "headerFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ascender");
  v9 = v8;

  return y <= v6 + v9;
}

- (void)updateToday
{
  self->_todayIndex = -1;
  -[EKUIYearMonthView _updateToday](self, "_updateToday");
}

- (void)setCalendarDate:(id)a3
{
  EKCalendarDate *v4;
  EKCalendarDate *v5;
  EKCalendarDate *endCalendarDate;
  EKCalendarDate *v7;

  objc_msgSend(a3, "calendarDateForMonth");
  v4 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue();
  if (self->_calendarDate != v4)
  {
    v7 = v4;
    objc_storeStrong((id *)&self->_calendarDate, v4);
    -[EKCalendarDate calendarDateForEndOfMonth](v7, "calendarDateForEndOfMonth");
    v5 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue();
    endCalendarDate = self->_endCalendarDate;
    self->_endCalendarDate = v5;

    -[EKUIYearMonthView _reloadCachedValues](self, "_reloadCachedValues");
    v4 = v7;
  }

}

- (BOOL)containsCalendarDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  -[EKUIYearMonthView calendarDate](self, "calendarDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "compare:", v4);

  v7 = v6 != 1 && -[EKCalendarDate compare:](self->_endCalendarDate, "compare:", v4) != -1;
  return v7;
}

- (CGRect)frameForGridOfDays:(BOOL)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGPoint)headerOrigin
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  _BOOL4 v8;
  double v9;
  double v10;
  CGPoint result;

  -[EKUIYearMonthView _monthNameOriginPoint](self, "_monthNameOriginPoint");
  v4 = v3;
  v6 = v5 + 0.5;
  -[EKUIYearMonthView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = EKUIUsesLargeTextYearView(v7);

  if (v8)
    v9 = v6 + 0.5;
  else
    v9 = v6;
  v10 = v4;
  result.y = v9;
  result.x = v10;
  return result;
}

- (void)_getTodayNumberTextFrame:(CGRect *)a3 circleFrame:(CGRect *)a4
{
  -[EKUIYearMonthView _getMetricsForDayIndex:textFrame:circleFrame:](self, "_getMetricsForDayIndex:textFrame:circleFrame:", self->_todayIndex, a3, a4);
}

- (void)_getMetricsForDayIndex:(int64_t)a3 textFrame:(CGRect *)a4 circleFrame:(CGRect *)a5
{
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  int64_t v16;
  int64_t v17;
  int IsLeftToRight;
  int64_t daysInWeek;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  double v61;

  -[EKUIYearMonthView todayNumberFont](self, "todayNumberFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "capHeight");
  v11 = v10;
  -[EKUIYearMonthView dayNumberFont](self, "dayNumberFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "capHeight");
  CalRoundToScreenScale((v11 - v13) * 0.5);
  v15 = v14;

  v16 = self->_firstDayIndex + a3;
  v17 = v16 / self->_daysInWeek;
  IsLeftToRight = CalTimeDirectionIsLeftToRight();
  daysInWeek = self->_daysInWeek;
  v20 = v16 - daysInWeek * v17;
  v21 = daysInWeek + ~v16 + daysInWeek * v17;
  if (IsLeftToRight)
    v22 = v20;
  else
    v22 = v21;
  -[EKUIYearMonthView xInset](self, "xInset");
  v24 = v23;
  -[EKUIYearMonthView daysXAdjustLeft](self, "daysXAdjustLeft");
  v26 = v24 + v25;
  -[EKUIYearMonthView yInset](self, "yInset");
  v28 = v27;
  -[EKUIYearMonthView daysYAdjustTop](self, "daysYAdjustTop");
  v30 = v28 + v29;
  -[EKUIYearMonthView xSpacing](self, "xSpacing");
  v32 = v31;
  -[EKUIYearMonthView ySpacing](self, "ySpacing");
  v33 = v26 + v32 * (double)v22;
  v61 = v34;
  v35 = v30 + v34 * (double)v17;
  if (-[EKUIYearMonthView _shouldUseRoundedRectInsteadOfCircle](self, "_shouldUseRoundedRectInsteadOfCircle"))
  {
    CUIKLocalizedStringForInteger();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIYearMonthView roundedRectSizeForDayNumberString:](self, "roundedRectSizeForDayNumberString:", v36);
    v38 = v37;
    v40 = v39;

  }
  else
  {
    if (a3 < 9)
      -[EKUIYearMonthView circleSize](self, "circleSize");
    else
      -[EKUIYearMonthView circleSizeForDoubleDigit](self, "circleSizeForDoubleDigit");
    v38 = v41;
    v40 = v41;
  }
  v42 = v35 - v15;
  v43 = (v32 - v38) * 0.5;
  v44 = v33 + v43;
  if (-[EKUIYearMonthView computeCircleFrameWithoutAdjustments](self, "computeCircleFrameWithoutAdjustments"))
  {
    -[EKUIYearMonthView todayNumberFont](self, "todayNumberFont");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "ascender");
    v47 = v42 + v46;
    -[EKUIYearMonthView todayNumberFont](self, "todayNumberFont");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "capHeight");
    v50 = v47 - v49 * 0.5 - v40 * 0.5;

    if (!a4)
      goto LABEL_17;
LABEL_16:
    a4->origin.x = CalRoundRectToScreenScale(v33, v42, v32, v61);
    a4->origin.y = v55;
    a4->size.width = v56;
    a4->size.height = v57;
    goto LABEL_17;
  }
  v51 = v42 + v43 + -0.5;
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self))
  {
    v51 = v51 + -4.0;
    v42 = v42 + -1.0;
  }
  -[EKUIYearMonthView circleFrameYAdjustment](self, "circleFrameYAdjustment");
  v50 = v51 + v52;
  -[EKUIYearMonthView circleFrameXAdjustment](self, "circleFrameXAdjustment");
  v44 = v44 + v53;
  -[EKUIYearMonthView todayTextYAdjustment](self, "todayTextYAdjustment");
  v42 = v42 + v54;
  if (a4)
    goto LABEL_16;
LABEL_17:
  if (a5)
  {
    a5->origin.x = CalRoundRectToScreenScale(v44, v50, v38, v40);
    a5->origin.y = v58;
    a5->size.width = v59;
    a5->size.height = v60;
  }
}

- (id)_todayAttributes
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v3, "setAlignment:", 1);
  if (-[EKUIYearMonthView vibrant](self, "vibrant"))
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = *MEMORY[0x1E0DC1138];
  -[EKUIYearMonthView todayNumberFont](self, "todayNumberFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DC1178];
  v14[0] = v5;
  v14[1] = v3;
  v7 = *MEMORY[0x1E0DC1140];
  v13[1] = v6;
  v13[2] = v7;
  v14[2] = v4;
  v13[3] = *MEMORY[0x1E0DC1150];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[EKUIYearMonthView todayNumberKerning](self, "todayNumberKerning");
  *(float *)&v9 = v9;
  objc_msgSend(v8, "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)pulseTodayCircle
{
  int64_t todayIndex;
  int64_t v4;
  _BOOL4 IsRegularInViewHierarchy;
  double v6;
  EKUITodayCirclePulseView *v7;
  EKUITodayCirclePulseView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  EKUITodayCirclePulseView *v15;
  _QWORD v16[4];
  EKUITodayCirclePulseView *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  todayIndex = self->_todayIndex;
  if ((todayIndex & 0x8000000000000000) == 0)
  {
    v4 = todayIndex + 1;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[EKUIYearMonthView _getTodayNumberTextFrame:circleFrame:](self, "_getTodayNumberTextFrame:circleFrame:", &v20, &v18);
    IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self);
    v6 = 1.0;
    if (IsRegularInViewHierarchy)
      CalRoundToScreenScale(0.4);
    *((double *)&v20 + 1) = v6 + *((double *)&v20 + 1);
    v7 = [EKUITodayCirclePulseView alloc];
    v8 = -[EKUITodayCirclePulseView initWithFrame:](v7, "initWithFrame:", v20, v21);
    -[EKUITodayCirclePulseView setDontApplyCenteringOffset:](v8, "setDontApplyCenteringOffset:", 1);
    if (-[EKUIYearMonthView _shouldUseRoundedRectInsteadOfCircle](self, "_shouldUseRoundedRectInsteadOfCircle"))
    {
      -[EKUITodayCirclePulseView setUsesRoundedRectInsteadOfCircle:](v8, "setUsesRoundedRectInsteadOfCircle:", 1);
      -[EKUIYearMonthView roundedRectCornerRadius](self, "roundedRectCornerRadius");
      -[EKUITodayCirclePulseView setRoundedRectCornerRadius:](v8, "setRoundedRectCornerRadius:");
      -[EKUITodayCirclePulseView setFrame:](v8, "setFrame:", v18, v19);
      -[EKUITodayCirclePulseView setCircleShouldFillFrame:](v8, "setCircleShouldFillFrame:", 1);
    }
    else
    {
      -[EKUITodayCirclePulseView setCircleDiameter:](v8, "setCircleDiameter:", *(double *)&v19 + -0.5);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUITodayCirclePulseView setString:](v8, "setString:", v10);

    -[EKUIYearMonthView todayNumberFont](self, "todayNumberFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUITodayCirclePulseView setFont:](v8, "setFont:", v11);

    -[EKUIYearMonthView _todayAttributes](self, "_todayAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUITodayCirclePulseView setAttributes:](v8, "setAttributes:", v12);

    if (-[EKUIYearMonthView _shouldUseRoundedRectInsteadOfCircle](self, "_shouldUseRoundedRectInsteadOfCircle"))
    {
      v13 = *((double *)&v20 + 1) - *((double *)&v18 + 1);
    }
    else
    {
      v14 = EKUIScaleFactor();
      v13 = 1.0;
      if (v14 > 1.0)
        v13 = -0.5;
    }
    -[EKUITodayCirclePulseView setTextOffsetFromCircle:](v8, "setTextOffsetFromCircle:", 0.0, v13);
    -[EKUITodayCirclePulseView layoutIfNeeded](v8, "layoutIfNeeded");
    -[EKUIYearMonthView addSubview:](self, "addSubview:", v8);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __37__EKUIYearMonthView_pulseTodayCircle__block_invoke;
    v16[3] = &unk_1E6018688;
    v17 = v8;
    v15 = v8;
    -[EKUITodayCirclePulseView pulse:](v15, "pulse:", v16);

  }
}

uint64_t __37__EKUIYearMonthView_pulseTodayCircle__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (CGRect)frameForTodayHighlight
{
  __int128 v2;
  double v3;
  double v4;
  double v5;
  double v6;
  __int128 v7;
  __int128 v8;
  CGRect result;

  v2 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *MEMORY[0x1E0C9D648];
  v8 = v2;
  if ((self->_todayIndex & 0x8000000000000000) == 0)
    -[EKUIYearMonthView _getTodayNumberTextFrame:circleFrame:](self, "_getTodayNumberTextFrame:circleFrame:", 0, &v7);
  v4 = *((double *)&v7 + 1);
  v3 = *(double *)&v7;
  v6 = *((double *)&v8 + 1);
  v5 = *(double *)&v8;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (int64_t)daysInWeek
{
  return self->_daysInWeek;
}

- (id)monthString
{
  return self->_monthString;
}

- (BOOL)_shouldUseRoundedRectInsteadOfCircle
{
  void *v2;
  uint64_t v3;
  char v4;

  -[EKUIYearMonthView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = EKUIUsesRoundedRectsInsteadOfCircles(v2, v3);

  return v4;
}

- (void)localeChanged
{
  void *v3;

  v3 = (void *)__weekDayInitialsImages;
  __weekDayInitialsImages = 0;

  -[EKUIYearMonthView _reloadCachedValues](self, "_reloadCachedValues");
}

- (double)dayNumberKerning
{
  return 0.0;
}

- (double)todayNumberKerning
{
  return 0.0;
}

- (double)roundedRectCornerRadius
{
  double v2;
  double result;

  -[EKUIYearMonthView circleSize](self, "circleSize");
  CalRoundToScreenScale(v2 / 4.5);
  return result;
}

- (CGSize)roundedRectSizeForDayNumberString:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  -[EKUIYearMonthView circleSize](self, "circleSize", a3);
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)showMonthName
{
  return 1;
}

- (BOOL)vibrant
{
  return 0;
}

- (double)circleFrameXAdjustment
{
  return 0.0;
}

- (double)circleFrameYAdjustment
{
  return 0.0;
}

- (double)todayTextYAdjustment
{
  return 0.0;
}

- (NSString)dayColorKey
{
  return 0;
}

- (UIColor)dayColor
{
  return (UIColor *)objc_msgSend((id)objc_opt_class(), "_defaultTextColor");
}

- (BOOL)shouldAddPreciseInteractivity
{
  return 0;
}

- (id)calendarDateForPoint:(CGPoint)a3
{
  int64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[EKUIYearMonthView _dayIndexForPoint:](self, "_dayIndexForPoint:", a3.x, a3.y);
  if (v4 < 0
    || (v5 = v4,
        -[EKUIYearMonthView calendarDate](self, "calendarDate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "daysInMonth"),
        v6,
        v5 >= v7))
  {
    v10 = 0;
  }
  else
  {
    -[EKUIYearMonthView calendarDate](self, "calendarDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "calendarDateForMonth");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "calendarDateByAddingDays:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (int64_t)_dayIndexForPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  int64_t firstDayIndex;
  void *v21;
  int64_t v22;
  uint64_t v23;
  int64_t daysInWeek;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  void *v30;
  BOOL v31;

  y = a3.y;
  x = a3.x;
  -[EKUIYearMonthView xInset](self, "xInset");
  v7 = v6;
  -[EKUIYearMonthView daysXAdjustLeft](self, "daysXAdjustLeft");
  v9 = v8;
  -[EKUIYearMonthView yInset](self, "yInset");
  v11 = v10;
  -[EKUIYearMonthView daysYAdjustTop](self, "daysYAdjustTop");
  v13 = v11 + v12;
  if (y < v13)
    return -1;
  v14 = v7 + v9;
  -[EKUIYearMonthView xSpacing](self, "xSpacing");
  v16 = v15;
  -[EKUIYearMonthView ySpacing](self, "ySpacing");
  v18 = (uint64_t)((y - v13) / v17);
  v19 = (uint64_t)((x - v14) / v16);
  firstDayIndex = self->_firstDayIndex;
  -[EKUIYearMonthView calendarDate](self, "calendarDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (unint64_t)(objc_msgSend(v21, "daysInMonth") + firstDayIndex) / self->_daysInWeek;

  if (v22 >= v18)
    v23 = v18;
  else
    v23 = v22;
  if (v18 < 0)
    v23 = 0;
  daysInWeek = self->_daysInWeek;
  v25 = daysInWeek - 1;
  if (daysInWeek > v19)
    v25 = (uint64_t)((x - v14) / v16);
  if (v19 >= 0)
    v26 = v25;
  else
    v26 = 0;
  v27 = v23 * daysInWeek;
  if (CalInterfaceIsLeftToRight())
  {
    v28 = v26 + v27 - self->_firstDayIndex;
    if ((v28 & 0x8000000000000000) != 0)
      return -1;
  }
  else
  {
    v28 = v27 - v26 + self->_firstDayIndex;
    if ((v28 & 0x8000000000000000) != 0)
      return -1;
  }
  -[EKUIYearMonthView calendarDate](self, "calendarDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v28 < objc_msgSend(v30, "daysInMonth");

  if (v31)
    return v28;
  else
    return -1;
}

- (void)_setUpInteraction
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", self);
  -[EKUIYearMonthView addInteraction:](self, "addInteraction:", v3);

}

- (CGRect)_monthNameFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  if (self->_monthString)
  {
    -[EKUIYearMonthView _monthNameOriginPoint](self, "_monthNameOriginPoint");
    v4 = v3;
    v6 = v5;
    -[EKUIYearMonthView _imageForMonthName:](self, "_imageForMonthName:", self->_monthString);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "size");
    v9 = v8;
    objc_msgSend(v7, "size");
    v11 = v10;

  }
  else
  {
    v4 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v12 = v4;
  v13 = v6;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)_pointIntersectsMonthName:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[EKUIYearMonthView _monthNameFrame](self, "_monthNameFrame");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (void)_adjustHidingViewToFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UIView *hidingView;
  UIView *v9;
  UIView *v10;
  void *v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  hidingView = self->_hidingView;
  if (!hidingView)
  {
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v10 = self->_hidingView;
    self->_hidingView = v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_hidingView, "setBackgroundColor:", v11);

    -[EKUIYearMonthView addSubview:](self, "addSubview:", self->_hidingView);
    hidingView = self->_hidingView;
  }
  -[UIView setHidden:](hidingView, "setHidden:", 0);
  -[UIView setFrame:](self->_hidingView, "setFrame:", x, y, width, height);
}

- (id)_containerForPreview
{
  id v3;
  UIView *v4;
  UIView *previewContainerView;
  void *v6;

  if (!self->_previewContainerView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[EKUIYearMonthView bounds](self, "bounds");
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    previewContainerView = self->_previewContainerView;
    self->_previewContainerView = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_previewContainerView, "setBackgroundColor:", v6);

    -[UIView setUserInteractionEnabled:](self->_previewContainerView, "setUserInteractionEnabled:", 0);
    -[EKUIYearMonthView addSubview:](self, "addSubview:", self->_previewContainerView);
    -[UIView setAutoresizingMask:](self->_previewContainerView, "setAutoresizingMask:", 18);
  }
  -[EKUIYearMonthView bounds](self, "bounds");
  -[UIView setFrame:](self->_previewContainerView, "setFrame:");
  -[EKUIYearMonthView bringSubviewToFront:](self, "bringSubviewToFront:", self->_previewContainerView);
  return self->_previewContainerView;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  int64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  _OWORD v22[2];

  v6 = a4;
  if (!-[EKUIYearMonthView shouldAddPreciseInteractivity](self, "shouldAddPreciseInteractivity"))
    goto LABEL_8;
  objc_msgSend(v6, "location");
  v7 = -[EKUIYearMonthView _dayIndexForPoint:](self, "_dayIndexForPoint:");
  if (v7 < 0
    || (v8 = v7,
        -[EKUIYearMonthView calendarDate](self, "calendarDate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "daysInMonth"),
        v9,
        v8 >= v10))
  {
    objc_msgSend(v6, "location");
    if (-[EKUIYearMonthView _pointIntersectsMonthName:](self, "_pointIntersectsMonthName:"))
    {
      v17 = (void *)MEMORY[0x1E0DC3B28];
      -[EKUIYearMonthView _monthNameFrame](self, "_monthNameFrame");
      v16 = CFSTR("year_month_name");
      v11 = v17;
      goto LABEL_7;
    }
LABEL_8:
    v18 = 0;
    goto LABEL_9;
  }
  memset(v22, 0, sizeof(v22));
  v20 = 0u;
  v21 = 0u;
  -[EKUIYearMonthView _getMetricsForDayIndex:textFrame:circleFrame:](self, "_getMetricsForDayIndex:textFrame:circleFrame:", v8, v22, &v20);
  v11 = (void *)MEMORY[0x1E0DC3B28];
  v13 = *((double *)&v20 + 1);
  v12 = *(double *)&v20;
  v15 = *((double *)&v21 + 1);
  v14 = *(double *)&v21;
  v16 = 0;
LABEL_7:
  objc_msgSend(v11, "regionWithRect:identifier:", v16, v12, v13, v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v18;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v6;

  v6 = a4;
  if (-[EKUIYearMonthView shouldAddPreciseInteractivity](self, "shouldAddPreciseInteractivity"))
  {
    objc_msgSend(v6, "rect");
    -[EKUIYearMonthView _adjustHidingViewToFrame:](self, "_adjustHidingViewToFrame:");
  }

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  if (-[EKUIYearMonthView shouldAddPreciseInteractivity](self, "shouldAddPreciseInteractivity", a3, a4, a5))
    -[UIView setHidden:](self->_hidingView, "setHidden:", 1);
}

- (CGPoint)_monthNameOriginPoint
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  double v20;
  double MaxX;
  double v22;
  double v23;
  CGPoint result;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  -[EKUIYearMonthView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[EKUIYearMonthView xInset](self, "xInset");
  v12 = v11;
  -[EKUIYearMonthView yInset](self, "yInset");
  v14 = v13;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v26 = CGRectInset(v25, v12, v14);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  if (CalInterfaceIsLeftToRight())
  {
    -[EKUIYearMonthView headerXAdjust](self, "headerXAdjust");
    v20 = x + v19;
  }
  else
  {
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    MaxX = CGRectGetMaxX(v27);
    -[EKUIYearMonthView headerXAdjust](self, "headerXAdjust");
    v20 = MaxX - v22;
  }
  v23 = y;
  result.y = v23;
  result.x = v20;
  return result;
}

- (void)_reloadCachedValues
{
  NSCalendar *v3;
  NSCalendar *calendar;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *monthString;
  id v16;

  CUIKCalendar();
  v3 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
  calendar = self->_calendar;
  self->_calendar = v3;

  -[EKUIYearMonthView calendarDate](self, "calendarDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[NSCalendar rangeOfUnit:inUnit:forDate:](self->_calendar, "rangeOfUnit:inUnit:forDate:", 512, 4096, v16);
  v7 = v6;
  -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 528, v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CUIKOneIndexedWeekStart();
  v10 = objc_msgSend(v8, "weekday");
  v11 = v7 - v9 + v10;
  if (v10 > v9)
    v11 = v10 - v9;
  if (v10 == v9)
    v11 = 0;
  self->_firstDayIndex = v11;
  self->_daysInWeek = v7;
  if ((CUIKCurrentLocaleRequiresUnabbrevatedMonthNames() & 1) != 0)
    CUIKLongStringForMonth();
  else
    CUIKStringForMonth();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "capitalizedStringWithLocale:", v13);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();

  monthString = self->_monthString;
  self->_monthString = v14;

  self->_todayIndex = -1;
  -[EKUIYearMonthView setNeedsDisplay](self, "setNeedsDisplay");
  -[EKUIYearMonthView _updateToday](self, "_updateToday");
  -[EKUIYearMonthView _updateFirstOfMonthAndYearIndices](self, "_updateFirstOfMonthAndYearIndices");

}

- (void)_updateFirstOfMonthAndYearIndices
{
  EKUIOverlayCalendarSignificantDatesProvider *overlaySignificantDatesProvider;
  void *v4;
  NSSet *v5;
  NSSet *firstOfOverlayMonthIndices;
  EKUIOverlayCalendarSignificantDatesProvider *v7;
  void *v8;
  NSSet *v9;
  NSSet *firstOfOverlayYearIndices;

  overlaySignificantDatesProvider = self->_overlaySignificantDatesProvider;
  -[EKCalendarDate date](self->_calendarDate, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIOverlayCalendarSignificantDatesProvider firstOfOverlayMonthsForCalendarMonth:](overlaySignificantDatesProvider, "firstOfOverlayMonthsForCalendarMonth:", v4);
  v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  firstOfOverlayMonthIndices = self->_firstOfOverlayMonthIndices;
  self->_firstOfOverlayMonthIndices = v5;

  v7 = self->_overlaySignificantDatesProvider;
  -[EKCalendarDate date](self->_calendarDate, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIOverlayCalendarSignificantDatesProvider firstOfOverlayYearsForCalendarMonth:](v7, "firstOfOverlayYearsForCalendarMonth:", v8);
  v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
  firstOfOverlayYearIndices = self->_firstOfOverlayYearIndices;
  self->_firstOfOverlayYearIndices = v9;

  -[EKUIYearMonthView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)overlaySignificantDatesChangedInRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v5 = v4;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (v4)
  {
    objc_msgSend(v4, "distinctRanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__EKUIYearMonthView_overlaySignificantDatesChangedInRange___block_invoke;
    v7[3] = &unk_1E6019FE8;
    v7[4] = self;
    v7[5] = &v8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

    if (!*((_BYTE *)v9 + 24))
      goto LABEL_6;
  }
  else
  {
    v11 = 1;
  }
  -[EKUIYearMonthView _updateFirstOfMonthAndYearIndices](self, "_updateFirstOfMonthAndYearIndices");
LABEL_6:
  _Block_object_dispose(&v8, 8);

}

void __59__EKUIYearMonthView_overlaySignificantDatesChangedInRange___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  int v8;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 504);
  v6 = a2;
  objc_msgSend(v5, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsDate:", v7);

  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)setOverlaySignificantDatesProvider:(id)a3
{
  objc_storeStrong((id *)&self->_overlaySignificantDatesProvider, a3);
  -[EKUIYearMonthView _updateFirstOfMonthAndYearIndices](self, "_updateFirstOfMonthAndYearIndices");
}

- (void)_updateToday
{
  NSCalendar *calendar;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int64_t todayIndex;
  id v11;

  calendar = self->_calendar;
  CUIKTodayDate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar components:fromDate:](calendar, "components:fromDate:", 14, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIYearMonthView calendarDate](self, "calendarDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToDate:", v8);

  if (v9)
  {
    CUIKTodayComponents();
    v11 = (id)objc_claimAutoreleasedReturnValue();

    todayIndex = self->_todayIndex;
    if (todayIndex != objc_msgSend(v11, "day") - 1)
    {
      self->_todayIndex = objc_msgSend(v11, "day") - 1;
      -[EKUIYearMonthView setNeedsDisplay](self, "setNeedsDisplay");
    }
  }
  else
  {
    v11 = v5;
  }

}

- (BOOL)isCurrentMonth
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D0C420];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar timeZone](self->_calendar, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarDateWithDate:timeZone:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[EKUIYearMonthView containsCalendarDate:](self, "containsCalendarDate:", v6);
  return (char)self;
}

- (void)_drawMonthName:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double Width;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double *v31;
  unint64_t v32;
  void *v33;
  double v34;
  double v35;
  id v36;
  void *v37;
  uint64_t v38;
  double *v39;
  double v40;
  CGFloat v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  CGRect v45;
  CGRect v46;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[EKUIYearMonthView headerFontMaxSize](self, "headerFontMaxSize");
  if (vabdd_f64(v8, *(double *)&_drawMonthName_atPoint__s_desiredFontSizeForSmallestUsedFontSize) >= 2.22044605e-16)
    _drawMonthName_atPoint__s_smallestUsedFontSize = 0x7FF0000000000000;
  -[EKUIYearMonthView headerFontMaxSize](self, "headerFontMaxSize");
  if (v9 >= *(double *)&_drawMonthName_atPoint__s_smallestUsedFontSize)
    v10 = *(double *)&_drawMonthName_atPoint__s_smallestUsedFontSize;
  else
    v10 = v9;
  -[EKUIYearMonthView headerFontMinSize](self, "headerFontMinSize");
  v12 = v11;
  -[EKUIYearMonthView bounds](self, "bounds");
  Width = CGRectGetWidth(v45);
  -[EKUIYearMonthView xSpacing](self, "xSpacing");
  v15 = Width - v14;
  -[EKUIYearMonthView headerFont](self, "headerFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fontDescriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v17, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKUIYearMonthView isCurrentMonth](self, "isCurrentMonth"))
    -[EKUIYearMonthView tintColor](self, "tintColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0C99E08];
  v21 = *MEMORY[0x1E0DC1138];
  v22 = *MEMORY[0x1E0DC1140];
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[EKUIYearMonthView headerFontKerning](self, "headerFontKerning");
  *(float *)&v24 = v24;
  objc_msgSend(v23, "numberWithFloat:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryWithObjectsAndKeys:", v18, v21, v19, v22, v25, *MEMORY[0x1E0DC1150], 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sizeWithAttributes:", v26);
  v28 = v27;
  v30 = v29;
  if (v27 <= v15)
  {
    v31 = (double *)&unk_1EEE69000;
    v32 = 0x1E0DC3000;
  }
  else if (v10 >= v12)
  {
    v31 = (double *)&unk_1EEE69000;
    v32 = 0x1E0DC3000uLL;
    while (1)
    {
      v33 = v18;
      v10 = v10 + -1.0;
      objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v17, v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "setObject:forKey:", v18, v21);
      objc_msgSend(v7, "sizeWithAttributes:", v26);
      v28 = v34;
      v30 = v35;
      if (v34 <= v15)
        break;
      if (v10 < v12)
        goto LABEL_16;
    }
  }
  else
  {
    v31 = (double *)&unk_1EEE69000;
    v32 = 0x1E0DC3000;
LABEL_16:
    v36 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    objc_msgSend(v36, "setLineBreakMode:", 4);
    objc_msgSend(v26, "setObject:forKey:", v36, *MEMORY[0x1E0DC1178]);

  }
  if (v10 < v31[85])
  {
    v31[85] = v10;
    +[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setMinYearMonthHeaderFontSizeUsed:", v10);

    -[EKUIYearMonthView headerFontMaxSize](self, "headerFontMaxSize");
    _drawMonthName_atPoint__s_desiredFontSizeForSmallestUsedFontSize = v38;
  }
  v43 = 0;
  v44 = 0;
  CTFontGetLanguageAwareOutsets();
  if (CalInterfaceIsLeftToRight())
    v39 = (double *)&v43;
  else
    v39 = (double *)&v44;
  v40 = CalCeilToScreenScale(v28 + *v39);
  v41 = ceil(v30 + 0.0 + 0.0);
  objc_msgSend(*(id *)(v32 + 1624), "systemBackgroundColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFill");

  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = v40;
  v46.size.height = v41;
  UIRectFill(v46);
  objc_msgSend(v7, "drawInRect:withAttributes:", v26, x, y, v40, v41);

}

- (id)_imageForMonthName:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double Width;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  id v54;
  void *v55;
  uint64_t v56;
  double *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  id v62;
  const __CFString *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  id v71;
  double v72;
  double v73;
  double v74;
  double v75;
  uint64_t v76;
  uint64_t v77;
  CGRect v78;

  v4 = a3;
  if (_imageForMonthName__onceToken != -1)
    dispatch_once(&_imageForMonthName__onceToken, &__block_literal_global_22);
  v68 = v4;
  if ((_imageForMonthName__warmingCache & 1) == 0)
  {
    +[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minYearMonthHeaderFontSizeUsed");
    v7 = v6;

    if (v7 == 0.0)
    {
      _imageForMonthName__warmingCache = 1;
      -[EKUIYearMonthView _warmImageCache](self, "_warmImageCache");
      _imageForMonthName__warmingCache = 0;
    }
  }
  v8 = -[EKUIYearMonthView tintAdjustmentMode](self, "tintAdjustmentMode");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[EKUIYearMonthView bounds](self, "bounds");
  *(float *)&v11 = v10;
  objc_msgSend(v9, "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", EKUICurrentWindowSizeParadigmForViewHierarchy(self));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)MEMORY[0x1E0CB3940];
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("normal");
  if (v8 == 2)
    v17 = CFSTR("dimmed");
  else
    v17 = CFSTR("normal");
  objc_msgSend(v12, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKUIYearMonthView vibrant](self, "vibrant"))
    v16 = CFSTR("vibrant");
  if (-[EKUIYearMonthView isCurrentMonth](self, "isCurrentMonth"))
    v20 = CFSTR("current");
  else
    v20 = CFSTR("not");
  -[EKUIYearMonthView traitCollection](self, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceStyle");
  v23 = CFSTR("light");
  if (v22 == 2)
    v23 = CFSTR("dark");
  v64 = v16;
  v24 = v68;
  objc_msgSend(v67, "stringWithFormat:", CFSTR("%@:%@:%@:%@:%@:%@:%@:%@"), v68, v15, v17, v18, v19, v64, v20, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_imageForMonthName__s_cache, "objectForKey:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    v66 = v12;
    -[EKUIYearMonthView headerFontMaxSize](self, "headerFontMaxSize");
    if (vabdd_f64(v27, *(double *)&_imageForMonthName__s_desiredFontSizeForSmallestUsedFontSize) >= 2.22044605e-16)
      _imageForMonthName__s_smallestUsedFontSize = 0x7FF0000000000000;
    -[EKUIYearMonthView headerFontMaxSize](self, "headerFontMaxSize");
    if (v28 >= *(double *)&_imageForMonthName__s_smallestUsedFontSize)
      v29 = *(double *)&_imageForMonthName__s_smallestUsedFontSize;
    else
      v29 = v28;
    -[EKUIYearMonthView headerFontMinSize](self, "headerFontMinSize");
    v31 = v30;
    -[EKUIYearMonthView bounds](self, "bounds");
    Width = CGRectGetWidth(v78);
    -[EKUIYearMonthView xSpacing](self, "xSpacing");
    v34 = Width - v33;
    -[EKUIYearMonthView headerFont](self, "headerFont");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "fontDescriptor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v36, v29);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v25;
    if (-[EKUIYearMonthView isCurrentMonth](self, "isCurrentMonth"))
      -[EKUIYearMonthView tintColor](self, "tintColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x1E0C99E08];
    v40 = *MEMORY[0x1E0DC1138];
    v41 = *MEMORY[0x1E0DC1140];
    v42 = (void *)MEMORY[0x1E0CB37E8];
    -[EKUIYearMonthView headerFontKerning](self, "headerFontKerning");
    *(float *)&v43 = v43;
    objc_msgSend(v42, "numberWithFloat:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "dictionaryWithObjectsAndKeys:", v37, v40, v38, v41, v44, *MEMORY[0x1E0DC1150], 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = v68;
    objc_msgSend(v68, "sizeWithAttributes:", v45);
    v48 = v47;
    v50 = v49;
    if (v47 > v34)
    {
      if (v29 < v31)
      {
LABEL_29:
        v54 = objc_alloc_init(MEMORY[0x1E0DC1288]);
        objc_msgSend(v54, "setLineBreakMode:", 4);
        objc_msgSend(v45, "setObject:forKey:", v54, *MEMORY[0x1E0DC1178]);

        v46 = v68;
      }
      else
      {
        while (1)
        {
          v51 = v37;
          v29 = v29 + -1.0;
          objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v36, v29);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v45, "setObject:forKey:", v37, v40);
          objc_msgSend(v68, "sizeWithAttributes:", v45);
          v48 = v52;
          v50 = v53;
          if (v52 <= v34)
            break;
          if (v29 < v31)
            goto LABEL_29;
        }
      }
    }
    if (v29 < *(double *)&_imageForMonthName__s_smallestUsedFontSize)
    {
      _imageForMonthName__s_smallestUsedFontSize = *(_QWORD *)&v29;
      +[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setMinYearMonthHeaderFontSizeUsed:", v29);

      v46 = v68;
      -[EKUIYearMonthView headerFontMaxSize](self, "headerFontMaxSize");
      _imageForMonthName__s_desiredFontSizeForSmallestUsedFontSize = v56;
      objc_msgSend((id)_imageForMonthName__s_cache, "removeAllObjects");
    }
    v76 = 0;
    v77 = 0;
    v75 = 0.0;
    v74 = 0.0;
    CTFontGetLanguageAwareOutsets();
    if (CalInterfaceIsLeftToRight())
      v57 = (double *)&v76;
    else
      v57 = (double *)&v77;
    v58 = CalCeilToScreenScale(v48 + *v57);
    v59 = ceil(v50 + v75 + v74);
    v60 = (void *)objc_opt_new();
    objc_msgSend(v60, "setScale:", EKUIScaleFactor());
    objc_msgSend(v60, "setOpaque:", 1);
    objc_msgSend(v60, "setPreferredRange:", 2);
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v60, v58, v59);
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __40__EKUIYearMonthView__imageForMonthName___block_invoke_2;
    v69[3] = &unk_1E601A010;
    v72 = v58;
    v73 = v59;
    v70 = v46;
    v71 = v45;
    v24 = v46;
    v62 = v45;
    objc_msgSend(v61, "imageWithActions:", v69);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v65;
    objc_msgSend((id)_imageForMonthName__s_cache, "setObject:forKey:", v26, v65);

    v12 = v66;
  }

  return v26;
}

void __40__EKUIYearMonthView__imageForMonthName___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_imageForMonthName__s_cache;
  _imageForMonthName__s_cache = (uint64_t)v0;

}

uint64_t __40__EKUIYearMonthView__imageForMonthName___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  CGRect v6;

  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFill");

  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = v2;
  v6.size.height = v3;
  UIRectFill(v6);
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:withAttributes:", *(_QWORD *)(a1 + 40), 0.0, 0.0, v2, v3);
}

- (double)minHeaderFontSizeUsed
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  +[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minYearMonthHeaderFontSizeUsed");
  v5 = v4;

  if (v5 == 0.0)
    -[EKUIYearMonthView _warmImageCache](self, "_warmImageCache");
  +[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minYearMonthHeaderFontSizeUsed");
  v8 = v7;

  return v8;
}

- (void)_warmImageCache
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[NSCalendar monthSymbols](self->_calendar, "monthSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      -[EKCalendarDate calendarDateByAddingMonths:](self->_calendarDate, "calendarDateByAddingMonths:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIYearMonthView monthNameForDate:](self, "monthNameForDate:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = -[EKUIYearMonthView _imageForMonthName:](self, "_imageForMonthName:", v8);
    }
  }
}

- (id)monthNameForDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((CUIKCurrentLocaleRequiresUnabbrevatedMonthNames() & 1) != 0)
    CUIKLongStringForMonth();
  else
    CUIKStringForMonth();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "capitalizedStringWithLocale:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_drawWeekDayInitialsAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  _QWORD v26[3];
  _QWORD v27[4];
  CGRect v28;

  y = a3.y;
  x = a3.x;
  v27[3] = *MEMORY[0x1E0C80C00];
  CUIKWeekdayVeryShortAbbreviations();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIYearMonthView xSpacing](self, "xSpacing");
  v8 = v7;
  v9 = CUIKZeroIndexedWeekStart();
  v10 = objc_msgSend(v6, "count");
  -[EKUIYearMonthView weekDayInitialsFont](self, "weekDayInitialsFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ascender");
  v13 = v12;
  objc_msgSend(v11, "descender");
  CalRoundToScreenScale(v13 - v14);
  v16 = v15;
  if (CTFontGetLanguageAwareOutsets())
    v16 = CalCeilToScreenScale(v16 + 0.0 + 0.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFill");

  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = v8 * (double)v10;
  v28.size.height = v16;
  UIRectFill(v28);
  v18 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v18, "setAlignment:", 1);
  +[EKUIYearMonthView _defaultTextColor](EKUIYearMonthView, "_defaultTextColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKUIYearMonthView vibrant](self, "vibrant"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.52);
    v20 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v20;
  }
  v21 = *MEMORY[0x1E0DC1178];
  v26[0] = *MEMORY[0x1E0DC1138];
  v26[1] = v21;
  v27[0] = v11;
  v27[1] = v18;
  v26[2] = *MEMORY[0x1E0DC1140];
  v27[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v23 = v10;
    do
    {
      if (CalTimeDirectionIsLeftToRight())
        v24 = v9 % v10;
      else
        v24 = v10 + ~(v9 % v10);
      objc_msgSend(v6, "objectAtIndexedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "drawInRect:withAttributes:", v22, x, y, v8, v16);
      x = v8 + x;

      ++v9;
      --v23;
    }
    while (v23);
  }

}

- (id)_weekDayInitialsImage
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v25[5];
  id v26;
  id v27;
  double v28;
  double v29;
  unint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;

  if (!__weekDayInitialsImages)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)__weekDayInitialsImages;
    __weekDayInitialsImages = (uint64_t)v3;

  }
  CUIKWeekdayVeryShortAbbreviations();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIYearMonthView xSpacing](self, "xSpacing");
  v7 = v6;
  v8 = objc_msgSend(v5, "count") * (int)v6;
  v9 = (void *)MEMORY[0x1E0CB3940];
  -[EKUIYearMonthView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("weekdayInitialImage:%d:%tu"), v8, objc_msgSend(v10, "userInterfaceStyle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)__weekDayInitialsImages, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v13 = CUIKZeroIndexedWeekStart();
    v14 = objc_msgSend(v5, "count");
    -[EKUIYearMonthView weekDayInitialsFont](self, "weekDayInitialsFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ascender");
    v17 = v16;
    objc_msgSend(v15, "descender");
    CalRoundToScreenScale(v17 - v18);
    v20 = v19;
    v35 = 0.0;
    v34 = 0.0;
    if (CTFontGetLanguageAwareOutsets())
      v20 = CalCeilToScreenScale(v20 + v35 + v34);
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setScale:", EKUIScaleFactor());
    objc_msgSend(v21, "setOpaque:", 1);
    objc_msgSend(v21, "setPreferredRange:", 2);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v21, v7 * (double)v14, v20);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __42__EKUIYearMonthView__weekDayInitialsImage__block_invoke;
    v25[3] = &unk_1E601A038;
    v28 = v7 * (double)v14;
    v29 = v20;
    v25[4] = self;
    v26 = v15;
    v30 = v14;
    v31 = v13;
    v27 = v5;
    v32 = v7;
    v33 = v20;
    v23 = v15;
    objc_msgSend(v22, "imageWithActions:", v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__weekDayInitialsImages, "setObject:forKey:", v12, v11);

  }
  return v12;
}

void __42__EKUIYearMonthView__weekDayInitialsImage__block_invoke(uint64_t a1)
{
  CGFloat v2;
  CGFloat v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  unint64_t v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[4];
  CGRect v19;

  v18[3] = *MEMORY[0x1E0C80C00];
  v2 = *(double *)(a1 + 56);
  v3 = *(double *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFill");

  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = v2;
  v19.size.height = v3;
  UIRectFill(v19);
  v5 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v5, "setAlignment:", 1);
  +[EKUIYearMonthView _defaultTextColor](EKUIYearMonthView, "_defaultTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "vibrant"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.52);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *MEMORY[0x1E0DC1178];
  v17[0] = *MEMORY[0x1E0DC1138];
  v17[1] = v9;
  v18[0] = v8;
  v18[1] = v5;
  v17[2] = *MEMORY[0x1E0DC1140];
  v18[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 72);
  if (v11)
  {
    v12 = 0;
    v14 = *MEMORY[0x1E0C9D538];
    v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    do
    {
      v15 = (v12 + *(_QWORD *)(a1 + 80)) % v11;
      if ((CalTimeDirectionIsLeftToRight() & 1) == 0)
        v15 = *(_QWORD *)(a1 + 72) + ~v15;
      objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "drawInRect:withAttributes:", v10, v14, v13, *(double *)(a1 + 88), *(double *)(a1 + 96));
      v14 = v14 + *(double *)(a1 + 88);

      ++v12;
      v11 = *(_QWORD *)(a1 + 72);
    }
    while (v12 < v11);
  }

}

- (void)_drawMonthDays:(int64_t)a3 size:(CGSize)a4 underlineThickness:(double)a5 atPoint:(CGPoint)a6
{
  double y;
  double x;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int64_t daysInWeek;
  uint64_t v32;
  uint64_t v33;
  int64_t firstDayIndex;
  void *v35;
  void *v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  int64_t v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  int IsLeftToRight;
  int v50;
  double v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  y = a6.y;
  x = a6.x;
  -[EKUIYearMonthView bounds](self, "bounds", a4.width, a4.height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[EKUIYearMonthView xInset](self, "xInset");
  v20 = v19;
  -[EKUIYearMonthView yInset](self, "yInset");
  v22 = v21;
  v52.origin.x = v12;
  v52.origin.y = v14;
  v52.size.width = v16;
  v52.size.height = v18;
  v53 = CGRectInset(v52, v20, v22);
  v23 = v53.origin.x;
  v24 = v53.origin.y;
  -[EKUIYearMonthView daysXAdjustLeft](self, "daysXAdjustLeft");
  v26 = v25;
  -[EKUIYearMonthView xSpacing](self, "xSpacing");
  v28 = v27;
  -[EKUIYearMonthView ySpacing](self, "ySpacing");
  v30 = v29;
  daysInWeek = self->_daysInWeek;
  v32 = 2 * daysInWeek - a3 + 29;
  v33 = v32 % daysInWeek;
  if (CalTimeDirectionIsLeftToRight())
    firstDayIndex = self->_firstDayIndex;
  else
    firstDayIndex = self->_daysInWeek + ~self->_firstDayIndex;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFill");

  -[EKUIYearMonthView bounds](self, "bounds");
  UIRectFill(v54);
  objc_msgSend((id)objc_opt_class(), "_defaultTextColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "set");

  v37 = self->_firstDayIndex;
  v38 = v32 - v33;
  if (v38 - v37 >= 1)
  {
    v39 = 0;
    v40 = v26 + x + v23;
    v41 = y + v24;
    v42 = v40 + v28 * (double)firstDayIndex;
    v43 = self->_daysInWeek - v37;
    do
    {
      ++v39;
      CUIKLocalizedStringForInteger();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      CalRoundToScreenScale(v28);
      v46 = v45;
      CalRoundToScreenScale(v30);
      -[EKUIYearMonthView _drawDayNumber:size:underlineThickness:atPoint:](self, "_drawDayNumber:size:underlineThickness:atPoint:", v44, v46, v47, a5, v42, v41);
      if (v43-- <= 1)
      {
        IsLeftToRight = CalTimeDirectionIsLeftToRight();
        v43 = self->_daysInWeek;
        if (IsLeftToRight)
          v42 = v40;
        else
          v42 = v40 + v28 * (double)(v43 - 1);
        v41 = v30 + v41;
      }
      else
      {
        v50 = CalTimeDirectionIsLeftToRight();
        v51 = -1.0;
        if (v50)
          v51 = 1.0;
        v42 = v42 + v28 * v51;
      }

    }
    while (v39 < v38 - self->_firstDayIndex);
  }
}

- (id)_imageForMonthDays:(int64_t)a3 size:(CGSize)a4 underlineThickness:(double)a5
{
  double width;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  id v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double x;
  CGFloat y;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  int64_t daysInWeek;
  uint64_t v44;
  double v45;
  uint64_t v46;
  void *v47;
  void *v48;
  _QWORD v50[11];
  CGRect v51;
  CGRect v52;

  width = a4.width;
  if (_imageForMonthDays_size_underlineThickness__onceToken != -1)
    dispatch_once(&_imageForMonthDays_size_underlineThickness__onceToken, &__block_literal_global_54);
  -[EKUIYearMonthView bounds](self, "bounds");
  v10 = (int)v9;
  v11 = EKUICurrentWindowSizeParadigmForViewHierarchy(self);
  -[EKUIYearMonthView dayNumberFont](self, "dayNumberFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pointSize");
  v14 = (int)v13;

  -[EKUIYearMonthView dayColorKey](self, "dayColorKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[EKUIYearMonthView dayColorKey](self, "dayColorKey");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = CFSTR("default");
  }

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[EKUIYearMonthView traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "userInterfaceStyle");
  v20 = CFSTR("light");
  if (v19 == 2)
    v20 = CFSTR("dark");
  v21 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%d:%d:%d:%d:%@:%f:%@"), a3, v10, v11, v14, v16, *(_QWORD *)&a5, v20);

  objc_msgSend((id)_imageForMonthDays_size_underlineThickness__cache, "objectForKey:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    -[EKUIYearMonthView bounds](self, "bounds");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[EKUIYearMonthView xInset](self, "xInset");
    v32 = v31;
    -[EKUIYearMonthView yInset](self, "yInset");
    v34 = v33;
    v51.origin.x = v24;
    v51.origin.y = v26;
    v51.size.width = v28;
    v51.size.height = v30;
    v52 = CGRectInset(v51, v32, v34);
    x = v52.origin.x;
    y = v52.origin.y;
    -[EKUIYearMonthView daysXAdjustLeft](self, "daysXAdjustLeft");
    v38 = v37 + x;
    -[EKUIYearMonthView xSpacing](self, "xSpacing");
    v40 = v39;
    -[EKUIYearMonthView ySpacing](self, "ySpacing");
    v42 = v41;
    daysInWeek = self->_daysInWeek;
    v44 = (2 * daysInWeek - a3 + 29) / daysInWeek;
    v45 = v41 * (double)v44;
    v46 = v44 * daysInWeek;
    v47 = (void *)objc_opt_new();
    objc_msgSend(v47, "setScale:", EKUIScaleFactor());
    objc_msgSend(v47, "setOpaque:", 1);
    objc_msgSend(v47, "setPreferredRange:", 2);
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v47, width, v45);
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __64__EKUIYearMonthView__imageForMonthDays_size_underlineThickness___block_invoke_2;
    v50[3] = &unk_1E601A080;
    v50[5] = v40;
    *(double *)&v50[6] = v42;
    v50[4] = self;
    *(double *)&v50[7] = v38;
    *(CGFloat *)&v50[8] = y;
    v50[9] = v46;
    *(double *)&v50[10] = a5;
    objc_msgSend(v48, "imageWithActions:", v50);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_imageForMonthDays_size_underlineThickness__cache, "setObject:forKey:", v22, v21);

  }
  return v22;
}

void __64__EKUIYearMonthView__imageForMonthDays_size_underlineThickness___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_imageForMonthDays_size_underlineThickness__cache;
  _imageForMonthDays_size_underlineThickness__cache = (uint64_t)v0;

}

void __64__EKUIYearMonthView__imageForMonthDays_size_underlineThickness___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  int IsLeftToRight;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  int v23;
  double v24;
  double v26;
  CGRect v27;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  IsLeftToRight = CalTimeDirectionIsLeftToRight();
  v5 = *(_QWORD *)(a1 + 32);
  if (IsLeftToRight)
    v6 = *(_QWORD *)(v5 + 432);
  else
    v6 = *(_QWORD *)(v5 + 440) + ~*(_QWORD *)(v5 + 432);
  v7 = *(double *)(a1 + 40);
  v9 = *(double *)(a1 + 56);
  v8 = *(double *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFill");

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  UIRectFill(v27);
  objc_msgSend((id)objc_opt_class(), "_defaultTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "set");

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(v12 + 432);
  if (*(_QWORD *)(a1 + 72) > v13)
  {
    v14 = 0;
    v15 = v9 + v7 * (double)v6;
    v16 = *(_QWORD *)(v12 + 440) - v13;
    do
    {
      ++v14;
      CUIKLocalizedStringForInteger();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CalRoundToScreenScale(v2);
      v19 = v18;
      CalRoundToScreenScale(v3);
      objc_msgSend(*(id *)(a1 + 32), "_imageForDayNumber:size:underlineThickness:", v17, v19, v20, *(double *)(a1 + 80));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "drawAtPoint:", v15, v8);
      if (v16-- <= 1)
      {
        v23 = CalTimeDirectionIsLeftToRight();
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440);
        if (v23)
          v15 = *(double *)(a1 + 56);
        else
          v15 = *(double *)(a1 + 56) + *(double *)(a1 + 40) * (double)(v16 - 1);
        v8 = v8 + *(double *)(a1 + 48);
      }
      else
      {
        v24 = *(double *)(a1 + 40);
        if (CalTimeDirectionIsLeftToRight())
          v26 = 1.0;
        else
          v26 = -1.0;
        v15 = v15 + v24 * v26;
      }

    }
    while (v14 < *(_QWORD *)(a1 + 72) - *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));
  }
}

- (void)_drawDayNumber:(id)a3 size:(CGSize)a4 underlineThickness:(double)a5 atPoint:(CGPoint)a6
{
  double y;
  double x;
  double height;
  double width;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  _BOOL4 IsRegularInViewHierarchy;
  double v34;
  CGFloat v35;
  _QWORD v36[4];
  _QWORD v37[5];
  CGRect v38;
  CGRect v39;

  y = a6.y;
  x = a6.x;
  height = a4.height;
  width = a4.width;
  v37[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v13, "setAlignment:", 1);
  -[EKUIYearMonthView dayNumberFont](self, "dayNumberFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKUIYearMonthView _defaultTextColor](EKUIYearMonthView, "_defaultTextColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIYearMonthView dayColorKey](self, "dayColorKey");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[EKUIYearMonthView dayColor](self, "dayColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[EKUIYearMonthView dayColor](self, "dayColor");
      v19 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v19;
    }
  }
  v20 = *MEMORY[0x1E0DC1178];
  v36[0] = *MEMORY[0x1E0DC1138];
  v36[1] = v20;
  v37[0] = v14;
  v37[1] = v13;
  v21 = *MEMORY[0x1E0DC1140];
  v37[2] = v15;
  v22 = *MEMORY[0x1E0DC1150];
  v36[2] = v21;
  v36[3] = v22;
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[EKUIYearMonthView dayNumberKerning](self, "dayNumberKerning");
  *(float *)&v24 = v24;
  objc_msgSend(v23, "numberWithFloat:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFill");

  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  UIRectFill(v38);
  objc_msgSend(v12, "drawInRect:withAttributes:", v26, x, y, width, height);
  if (a5 > 0.0)
  {
    CalendarAppTintColor();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "set");

    objc_msgSend(v12, "boundingRectWithSize:options:attributes:context:", 0, v26, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v30 = v29;
    CalRoundToScreenScale(x + (width - v29) * 0.5);
    v32 = v31;
    IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self);
    v34 = 3.0;
    if (IsRegularInViewHierarchy)
      v34 = 6.5;
    CalRoundToScreenScale(y + height - v34);
    v39.origin.y = v35;
    v39.origin.x = v32;
    v39.size.width = v30;
    v39.size.height = a5;
    UIRectFill(v39);
  }

}

- (id)_imageForDayNumber:(id)a3 size:(CGSize)a4 underlineThickness:(double)a5
{
  return -[EKUIYearMonthView _imageForDayNumber:size:underlineThickness:forPreview:](self, "_imageForDayNumber:size:underlineThickness:forPreview:", a3, 0, a4.width, a4.height, a5);
}

- (id)_imageForDayNumber:(id)a3 size:(CGSize)a4 underlineThickness:(double)a5 forPreview:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  id v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v47;
  __CFString *v48;
  BOOL v49;
  id v50;
  _BOOL8 v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  EKUIYearMonthView *v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  BOOL v64;
  BOOL v65;
  _QWORD v66[4];
  _QWORD v67[6];

  v6 = a6;
  height = a4.height;
  width = a4.width;
  v67[4] = *MEMORY[0x1E0C80C00];
  v50 = a3;
  if (_imageForDayNumber_size_underlineThickness_forPreview__onceToken != -1)
    dispatch_once(&_imageForDayNumber_size_underlineThickness_forPreview__onceToken, &__block_literal_global_60);
  v49 = v6;
  v51 = !v6;
  -[EKUIYearMonthView bounds](self, "bounds");
  v12 = (int)v11;
  v13 = EKUICurrentWindowSizeParadigmForViewHierarchy(self);
  -[EKUIYearMonthView dayColorKey](self, "dayColorKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[EKUIYearMonthView dayColorKey](self, "dayColorKey");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("default");
  }

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIYearMonthView traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "preferredContentSizeCategory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIYearMonthView dayNumberFont](self, "dayNumberFont");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pointSize");
  v23 = v22;
  -[EKUIYearMonthView traitCollection](self, "traitCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "userInterfaceStyle") == 2)
    v25 = CFSTR("dark");
  else
    v25 = CFSTR("light");
  v26 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("%@:%@:%@:%d:%d:%f:%@:%f%i:%@"), v50, v18, v20, v12, v13, v23, v15, *(_QWORD *)&a5, v51, v25);

  objc_msgSend((id)_imageForDayNumber_size_underlineThickness_forPreview__cache, "objectForKey:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    v48 = v15;
    v28 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    objc_msgSend(v28, "setAlignment:", 1);
    -[EKUIYearMonthView dayNumberFont](self, "dayNumberFont");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKUIYearMonthView _defaultTextColor](EKUIYearMonthView, "_defaultTextColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIYearMonthView dayColorKey](self, "dayColorKey");
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = (void *)v31;
      -[EKUIYearMonthView dayColor](self, "dayColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        -[EKUIYearMonthView dayColor](self, "dayColor");
        v34 = objc_claimAutoreleasedReturnValue();

        v30 = (void *)v34;
      }
    }
    v35 = *MEMORY[0x1E0DC1178];
    v66[0] = *MEMORY[0x1E0DC1138];
    v66[1] = v35;
    v67[0] = v29;
    v67[1] = v28;
    v36 = *MEMORY[0x1E0DC1140];
    v67[2] = v30;
    v37 = *MEMORY[0x1E0DC1150];
    v66[2] = v36;
    v66[3] = v37;
    v38 = (void *)MEMORY[0x1E0CB37E8];
    -[EKUIYearMonthView dayNumberKerning](self, "dayNumberKerning");
    *(float *)&v39 = v39;
    objc_msgSend(v38, "numberWithFloat:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v67[3] = v40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 4);
    v47 = v28;
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = (void *)objc_opt_new();
    objc_msgSend(v42, "setScale:", EKUIScaleFactor());
    objc_msgSend(v42, "setOpaque:", v51);
    objc_msgSend(v42, "setPreferredRange:", 2);
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v42, width, height);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __75__EKUIYearMonthView__imageForDayNumber_size_underlineThickness_forPreview___block_invoke_2;
    v52[3] = &unk_1E601A0C8;
    v64 = v51;
    v57 = 0;
    v58 = 0;
    v59 = width;
    v60 = height;
    v65 = v49;
    v61 = width;
    v62 = height;
    v53 = v29;
    v54 = v50;
    v55 = v41;
    v63 = a5;
    v56 = self;
    v44 = v41;
    v45 = v29;
    objc_msgSend(v43, "imageWithActions:", v52);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_imageForDayNumber_size_underlineThickness_forPreview__cache, "setObject:forKey:", v27, v26);

    v15 = v48;
  }

  return v27;
}

void __75__EKUIYearMonthView__imageForDayNumber_size_underlineThickness_forPreview___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_imageForDayNumber_size_underlineThickness_forPreview__cache;
  _imageForDayNumber_size_underlineThickness_forPreview__cache = (uint64_t)v0;

}

void __75__EKUIYearMonthView__imageForDayNumber_size_underlineThickness_forPreview___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  _BOOL4 IsRegularInViewHierarchy;
  double v19;
  CGFloat v20;
  id v21;
  CGRect v22;

  v21 = a2;
  if (*(_BYTE *)(a1 + 120))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFill");

    UIRectFill(*(CGRect *)(a1 + 64));
  }
  if (*(_BYTE *)(a1 + 121))
  {
    v4 = *(double *)(a1 + 104) * 0.5;
    objc_msgSend(*(id *)(a1 + 32), "lineHeight");
    v6 = v4 - v5 * 0.5;
    v7 = *(double *)(a1 + 80);
    v8 = *(double *)(a1 + 88);
    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v11 = 0.0;
  }
  else
  {
    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(double *)(a1 + 64);
    v6 = *(double *)(a1 + 72);
    v7 = *(double *)(a1 + 80);
    v8 = *(double *)(a1 + 88);
  }
  objc_msgSend(v9, "drawInRect:withAttributes:", v10, v11, v6, v7, v8);
  if (*(double *)(a1 + 112) > 0.0)
  {
    CalendarAppTintColor();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "set");

    objc_msgSend(*(id *)(a1 + 40), "boundingRectWithSize:options:attributes:context:", 0, *(_QWORD *)(a1 + 48), 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v14 = v13;
    CalRoundToScreenScale((*(double *)(a1 + 96) - v13) * 0.5);
    v16 = v15;
    v17 = *(double *)(a1 + 104);
    IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(*(void **)(a1 + 56));
    v19 = 3.0;
    if (IsRegularInViewHierarchy)
      v19 = 6.5;
    CalRoundToScreenScale(v17 - v19);
    v22.origin.y = v20;
    v22.size.height = *(CGFloat *)(a1 + 112);
    v22.origin.x = v16;
    v22.size.width = v14;
    UIRectFill(v22);
  }

}

+ (id)_defaultTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (EKCalendarDate)calendarDate
{
  return self->_calendarDate;
}

- (EKUIOverlayCalendarSignificantDatesProvider)overlaySignificantDatesProvider
{
  return self->_overlaySignificantDatesProvider;
}

- (double)circleSizeForDoubleDigit
{
  return self->_circleSizeForDoubleDigit;
}

- (BOOL)computeCircleFrameWithoutAdjustments
{
  return self->_computeCircleFrameWithoutAdjustments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlaySignificantDatesProvider, 0);
  objc_storeStrong((id *)&self->_calendarDate, 0);
  objc_storeStrong((id *)&self->_previewContainerView, 0);
  objc_storeStrong((id *)&self->_hidingView, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_firstOfOverlayYearIndices, 0);
  objc_storeStrong((id *)&self->_firstOfOverlayMonthIndices, 0);
  objc_storeStrong((id *)&self->_monthString, 0);
  objc_storeStrong((id *)&self->_endCalendarDate, 0);
}

+ (double)heightForInterfaceOrientation:(int64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5
{
  double result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (double)xInset
{
  double result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (double)yInset
{
  double result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (double)headerXAdjust
{
  double result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (double)headerFontMaxSize
{
  double result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (double)headerFontMinSize
{
  double result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (UIFont)headerFont
{
  void *v2;
  const char *v3;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  v2 = (void *)MEMORY[0x1E0DC1350];
  OUTLINED_FUNCTION_4();
  return (UIFont *)OUTLINED_FUNCTION_3(v2, v3);
}

- (double)headerFontKerning
{
  double result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (UIFont)dayNumberFont
{
  void *v2;
  const char *v3;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  v2 = (void *)MEMORY[0x1E0DC1350];
  OUTLINED_FUNCTION_4();
  return (UIFont *)OUTLINED_FUNCTION_3(v2, v3);
}

- (UIFont)todayNumberFont
{
  void *v2;
  const char *v3;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  v2 = (void *)MEMORY[0x1E0DC1350];
  OUTLINED_FUNCTION_4();
  return (UIFont *)OUTLINED_FUNCTION_3(v2, v3);
}

- (double)dayTextSize
{
  double result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (double)todayTextSize
{
  double result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (double)circleSize
{
  double result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (double)daysXAdjustLeft
{
  double result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (double)daysYAdjustTop
{
  double result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (double)xSpacing
{
  double result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (double)ySpacing
{
  double result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (BOOL)showWeekDayInitials
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return 0;
}

- (double)weekDayInitialsAdjustLeft
{
  double result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (double)weekDayInitialsAdjustTop
{
  double result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (UIFont)weekDayInitialsFont
{
  void *v2;
  const char *v3;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  v2 = (void *)MEMORY[0x1E0DC1350];
  OUTLINED_FUNCTION_4();
  return (UIFont *)OUTLINED_FUNCTION_3(v2, v3);
}

@end
