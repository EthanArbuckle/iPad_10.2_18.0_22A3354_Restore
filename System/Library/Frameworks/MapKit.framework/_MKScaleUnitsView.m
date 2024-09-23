@implementation _MKScaleUnitsView

- (_MKScaleUnitsView)init
{
  _MKScaleUnitsView *v2;
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *strings;
  uint64_t v6;
  NSMapTable *legendStringWidthCache;
  NSMutableDictionary *v8;
  NSMutableDictionary *legendStringForDistanceStringCache;
  uint64_t i;
  NSMutableArray *v11;
  _MKLegendString *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_MKScaleUnitsView;
  v2 = -[_MKScaleUnitsView init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKScaleUnitsView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    strings = v2->_strings;
    v2->_strings = v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 5);
    legendStringWidthCache = v2->_legendStringWidthCache;
    v2->_legendStringWidthCache = (NSMapTable *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    legendStringForDistanceStringCache = v2->_legendStringForDistanceStringCache;
    v2->_legendStringForDistanceStringCache = v8;

    for (i = 0; i != 5; ++i)
    {
      v11 = v2->_strings;
      v12 = objc_alloc_init(_MKLegendString);
      -[NSMutableArray addObject:](v11, "addObject:", v12);

      -[_MKScaleUnitsView layer](v2, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](v2->_strings, "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSublayer:", v14);

    }
    -[_MKScaleUnitsView setUseLightText:](v2, "setUseLightText:", 0);
    -[_MKScaleUnitsView setClipsToBounds:](v2, "setClipsToBounds:", 0);
  }
  return v2;
}

- (void)clearCaches:(id)a3
{
  -[NSMapTable removeAllObjects](self->_legendStringWidthCache, "removeAllObjects", a3);
}

- (double)_widthForString:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  NSMapTable *legendStringWidthCache;
  void *v14;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[NSMapTable objectForKey:](self->_legendStringWidthCache, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "doubleValue");
      v11 = v10;
    }
    else
    {
      objc_msgSend(v6, "sizeWithAttributes:", v7);
      v11 = v12;
      legendStringWidthCache = self->_legendStringWidthCache;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](legendStringWidthCache, "setObject:forKey:", v14, v6);

    }
  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

- (void)setUnits:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKScaleUnitsView unpaddedUnitsString](self, "unpaddedUnitsString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR(" "), "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKScaleUnitsView setUnitsString:](self, "setUnitsString:", v8);

    objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKScaleUnitsView setUnpaddedUnitsString:](self, "setUnpaddedUnitsString:", v9);

    -[_MKScaleUnitsView _widthForString:attributes:](self, "_widthForString:attributes:", self->_unitsString, self->_legendAttributes);
    self->_justUnitsWidth = v10;
    -[NSMutableDictionary removeAllObjects](self->_legendStringForDistanceStringCache, "removeAllObjects");
  }
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKScaleUnitsView legendBaseString](self, "legendBaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKScaleUnitsView setLegendBaseString:](self, "setLegendBaseString:", v14);

  }
  -[_MKScaleUnitsView _calculateLegend:](self, "_calculateLegend:", v13 ^ 1u);
  -[_MKScaleUnitsView setNeedsLayout](self, "setNeedsLayout");
  -[_MKScaleUnitsView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)_calculateLegend:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  double segmentLengthInPixels;
  CGFloat v44;
  CGFloat rect;
  void *rect_8;
  void *rect_8a;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  -[_MKScaleUnitsView bounds](self, "bounds", a3);
  v44 = v5;
  rect = v4;
  v7 = v6;
  v9 = v8;
  -[_MKScaleUnitsView legendMarginLeft](self, "legendMarginLeft");
  v11 = v10;
  segmentLengthInPixels = self->_segmentLengthInPixels;
  -[_MKScaleUnitsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v12 = 0;
  v13 = 0;
  v14 = 0.5;
  do
  {
    v15 = 0.0;
    if (v12 && v12 != 3)
    {
      -[_MKScaleUnitsView _legendStringForDistanceString:appendUnits:index:](self, "_legendStringForDistanceString:appendUnits:index:", self->_legendBaseString, 0, (v12 + 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKScaleUnitsView _widthForString:attributes:](self, "_widthForString:attributes:", v16, self->_legendAttributes);
      v15 = self->_justUnitsWidth + v17 * v14;

    }
    v48.origin.y = v44;
    v18 = segmentLengthInPixels + v11;
    v48.origin.x = rect;
    v48.size.width = v7;
    v48.size.height = v9;
    v20 = segmentLengthInPixels + v11 + v15 > CGRectGetMaxX(v48) || v12 == 3;
    -[_MKScaleUnitsView _legendStringForDistanceString:appendUnits:index:](self, "_legendStringForDistanceString:appendUnits:index:", self->_legendBaseString, 0, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKScaleUnitsView _widthForString:attributes:](self, "_widthForString:attributes:", v21, self->_legendAttributes);
    if (v20)
    {
      -[_MKScaleUnitsView _legendStringForDistanceString:appendUnits:index:](self, "_legendStringForDistanceString:appendUnits:index:", self->_legendBaseString, 1, v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKScaleUnitsView _widthForString:attributes:](self, "_widthForString:attributes:", v22, self->_legendAttributes);
      rect_8 = v22;
    }
    else
    {
      rect_8 = 0;
      v22 = v21;
    }
    -[NSMutableArray objectAtIndexedSubscript:](self->_strings, "objectAtIndexedSubscript:", v12, 456);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v22;
    objc_msgSend(v23, "string");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "string");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqual:", v24);

    if ((v27 & 1) == 0)
    {
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v24, self->_legendAttributes);
      objc_msgSend(v23, "setString:", v28);

      objc_msgSend(v23, "opacity");
      if (*(float *)&v29 != 1.0)
      {
        LODWORD(v29) = 1.0;
        objc_msgSend(v23, "setOpacity:", v29);
      }
      objc_msgSend(v23, "sizeToFit");
      objc_msgSend(v23, "setNeedsDisplay");
    }
    objc_msgSend(v23, "frame");
    v31 = v30;
    v33 = v32;
    v14 = 0.5;
    if (self->_RTL)
    {
      UIRoundToViewScale();
      v35 = v34;
      v49.origin.y = v44;
      v49.origin.x = rect;
      v49.size.width = v7;
      v49.size.height = v9;
      v36 = CGRectGetMaxX(v49) - (v31 + v35);
    }
    else
    {
      UIRoundToViewScale();
      v36 = v37;
    }
    -[_MKScaleUnitsView bounds](self, "bounds");
    CGRectGetMaxY(v50);
    objc_msgSend(v23, "baselineDistanceFromBottom");
    UIRoundToViewScale();
    v39 = v38;
    objc_msgSend(v23, "frame");
    v52.origin.x = v36;
    v52.origin.y = v39;
    v52.size.width = v31;
    v52.size.height = v33;
    if (!CGRectEqualToRect(v51, v52))
      objc_msgSend(v23, "setFrame:", v36, v39, v31, v33);

    ++v12;
    v13 = v23;
    v11 = v18;
  }
  while (!v20);
  if ((unint64_t)(v12 - 1) > 3)
  {
    v41 = v23;
  }
  else
  {
    do
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v42), "objectAtIndexedSubscript:", v12);
      rect_8a = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(rect_8a, "setString:", 0);
      LODWORD(v40) = 0;
      objc_msgSend(rect_8a, "setOpacity:", v40);
      v41 = rect_8a;
      ++v12;
      v23 = rect_8a;
    }
    while (v12 != 5);
  }

}

- (BOOL)canDisplaySegment:(unint64_t)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[NSMutableArray objectAtIndexedSubscript:](self->_strings, "objectAtIndexedSubscript:", a3 + 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)setSegmentLengthInPixels:(double)a3
{
  self->_segmentLengthInPixels = a3;
}

- (void)setUseLightText:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  const __CTFontDescriptor *v13;
  CTFontRef v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  NSDictionary *v25;
  NSDictionary *legendAttributes;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[4];
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[3];

  v3 = a3;
  v45[2] = *MEMORY[0x1E0C80C00];
  self->_useLightText = a3;
  v5 = (id)*MEMORY[0x1E0CA8420];
  v44[0] = *MEMORY[0x1E0CA8418];
  v6 = *MEMORY[0x1E0CA8450];
  v43[0] = v5;
  v7 = *MEMORY[0x1E0CA84E8];
  v42[0] = v6;
  v42[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CA84C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v9;
  v44[1] = *MEMORY[0x1E0CA83D8];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[_MKScaleUnitsView fontSize](self, "fontSize");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v13 = CTFontDescriptorCreateWithAttributes(v12);
  v14 = CTFontCreateWithFontDescriptor(v13, 0.0, 0);
  CFRelease(v13);
  v15 = *MEMORY[0x1E0CA8188];
  if (v3)
  {
    v41[0] = v14;
    v16 = *MEMORY[0x1E0CA8550];
    v40[0] = v15;
    v40[1] = v16;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v41[1] = objc_msgSend(v17, "CGColor");
    v40[2] = *MEMORY[0x1E0CA85C8];
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "CGColor");
    v40[3] = *MEMORY[0x1E0DC6630];
    v41[2] = v19;
    v41[3] = &unk_1E21590A0;
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = v41;
    v22 = v40;
  }
  else
  {
    v39[0] = v14;
    v23 = *MEMORY[0x1E0CA8550];
    v38[0] = v15;
    v38[1] = v23;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.282352954, 0.270588249, 0.254901975, 1.0);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v39[1] = objc_msgSend(v17, "CGColor");
    v38[2] = *MEMORY[0x1E0CA85C8];
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.5);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = objc_msgSend(v18, "CGColor");
    v38[3] = *MEMORY[0x1E0DC6630];
    v39[2] = v24;
    v39[3] = &unk_1E21590A0;
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = v39;
    v22 = v38;
  }
  objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 4);
  v25 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  legendAttributes = self->_legendAttributes;
  self->_legendAttributes = v25;

  CFRelease(v14);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v27 = self->_strings;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v34 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v32, "setString:", 0, (_QWORD)v33);
        objc_msgSend(v32, "setNeedsDisplay");
      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v29);
  }

  -[_MKScaleUnitsView setNeedsLayout](self, "setNeedsLayout");
  -[_MKScaleUnitsView _calculateLegend:](self, "_calculateLegend:", 1);

}

- (BOOL)useLightText
{
  return self->_useLightText;
}

- (id)_uncachedLegendStringsForDistanceString:(id)a3
{
  void *v4;
  float v5;
  double v6;
  NSNumberFormatter *floatNumberFormatter;
  void *v8;
  void *v9;
  NSNumberFormatter *v10;
  void *v11;
  void *v12;
  NSNumberFormatter *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[7];

  v21[6] = *MEMORY[0x1E0C80C00];
  -[NSNumberFormatter numberFromString:](self->_floatNumberFormatter, "numberFromString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  floatNumberFormatter = self->_floatNumberFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](floatNumberFormatter, "stringFromNumber:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = self->_floatNumberFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 + v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](v10, "stringFromNumber:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = self->_floatNumberFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 * 3.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](v13, "stringFromNumber:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v9;
  v21[1] = v12;
  v21[2] = v15;
  objc_msgSend(v9, "stringByAppendingString:", self->_unitsString);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v16;
  objc_msgSend(v12, "stringByAppendingString:", self->_unitsString);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v17;
  objc_msgSend(v15, "stringByAppendingString:", self->_unitsString);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSString)zeroUnitsString
{
  NSString *zeroUnitsString;
  NSString *v4;
  NSString *v5;

  zeroUnitsString = self->_zeroUnitsString;
  if (!zeroUnitsString)
  {
    objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", &unk_1E21590B8, 0);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_zeroUnitsString;
    self->_zeroUnitsString = v4;

    zeroUnitsString = self->_zeroUnitsString;
  }
  return zeroUnitsString;
}

- (id)_legendStringForDistanceString:(id)a3 appendUnits:(BOOL)a4 index:(int)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v6 = a4;
  v8 = a3;
  if (a5 && self->_unitsString)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_legendStringForDistanceStringCache, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[_MKScaleUnitsView _uncachedLegendStringsForDistanceString:](self, "_uncachedLegendStringsForDistanceString:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_legendStringForDistanceStringCache, "setObject:forKeyedSubscript:", v10, v8);

    }
    if (v6)
      v11 = 3;
    else
      v11 = 0;
    objc_msgSend(v9, "objectAtIndexedSubscript:", a5 + v11 - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_MKScaleUnitsView zeroUnitsString](self, "zeroUnitsString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (double)unitsWidth
{
  return self->_unitsWidth;
}

- (NSString)unitsString
{
  return self->_unitsString;
}

- (void)setUnitsString:(id)a3
{
  objc_storeStrong((id *)&self->_unitsString, a3);
}

- (NSString)unpaddedUnitsString
{
  return self->_unpaddedUnitsString;
}

- (void)setUnpaddedUnitsString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (NSString)legendBaseString
{
  return self->_legendBaseString;
}

- (void)setLegendBaseString:(id)a3
{
  objc_storeStrong((id *)&self->_legendBaseString, a3);
}

- (NSNumberFormatter)floatNumberFormatter
{
  return self->_floatNumberFormatter;
}

- (void)setFloatNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_floatNumberFormatter, a3);
}

- (BOOL)isRTL
{
  return self->_RTL;
}

- (void)setRTL:(BOOL)a3
{
  self->_RTL = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)legendMarginLeft
{
  return self->_legendMarginLeft;
}

- (void)setLegendMarginLeft:(double)a3
{
  self->_legendMarginLeft = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zeroUnitsString, 0);
  objc_storeStrong((id *)&self->_floatNumberFormatter, 0);
  objc_storeStrong((id *)&self->_legendStringForDistanceStringCache, 0);
  objc_storeStrong((id *)&self->_legendStringWidthCache, 0);
  objc_storeStrong((id *)&self->_unpaddedUnitsString, 0);
  objc_storeStrong((id *)&self->_unitsString, 0);
  objc_storeStrong((id *)&self->_legendBaseString, 0);
  objc_storeStrong((id *)&self->_strings, 0);
  objc_storeStrong((id *)&self->_legendAttributes, 0);
}

@end
