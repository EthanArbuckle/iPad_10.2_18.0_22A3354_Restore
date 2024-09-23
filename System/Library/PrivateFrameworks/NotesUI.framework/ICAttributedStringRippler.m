@implementation ICAttributedStringRippler

- (ICAttributedStringRippler)initWithAttributedString:(id)a3 animatedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  ICAttributedStringRippler *v8;
  ICAttributedStringRippler *v9;
  void *v10;
  void *v11;
  objc_super v13;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICAttributedStringRippler;
  v8 = -[ICAttributedStringRippler init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ICAttributedStringRippler setString:](v8, "setString:", v7);
    -[ICAttributedStringRippler setAnimatedRange:](v9, "setAnimatedRange:", location, length);
    -[ICAttributedStringRippler setPreFrames:](v9, "setPreFrames:", 0);
    -[ICAttributedStringRippler setAnimateFrames:](v9, "setAnimateFrames:", 60);
    -[ICAttributedStringRippler setPostFrames:](v9, "setPostFrames:", 10);
    -[ICAttributedStringRippler setDelayFrames:](v9, "setDelayFrames:", 3);
    objc_msgSend(v7, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttributedStringRippler setInitialFont:](v9, "setInitialFont:", v10);

    -[ICAttributedStringRippler initialFont](v9, "initialFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pointSize");
    -[ICAttributedStringRippler setInitialFontSize:](v9, "setInitialFontSize:");

    -[ICAttributedStringRippler generateValues](v9, "generateValues");
    -[ICAttributedStringRippler start](v9, "start");
  }

  return v9;
}

+ (BOOL)canAnimateString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "ic_animatableTokenCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v6);

  return v7 == 0x7FFFFFFFFFFFFFFFLL;
}

+ (double)refreshInterval
{
  return 1.0 / (double)(unint64_t)objc_msgSend(a1, "framesPerSecond");
}

+ (unint64_t)framesPerSecond
{
  return 60;
}

- (void)generateValues
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  double v27;
  double v28;
  double v29;
  __double2 v30;
  double v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t i;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  ICAttributedStringRippler *v55;
  id v56;
  id v57;
  ICAttributedStringRippler *v58;
  id v59;
  uint64_t v60;
  ICAttributedStringRippler *v61;
  char *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  unint64_t v67;
  id v68;
  double v69;
  double v70;
  double v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[96];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v66 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v65 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v64 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[ICAttributedStringRippler preFrames](self, "preFrames");
  v4 = -[ICAttributedStringRippler animateFrames](self, "animateFrames") + v3;
  v5 = -[ICAttributedStringRippler postFrames](self, "postFrames");
  v60 = (uint64_t)&v60;
  v67 = v4 + v5;
  v6 = 8 * (v4 + v5);
  v7 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v60 - v10;
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v60 - v12;
  v14 = (void *)MEMORY[0x1E0C99DE8];
  -[ICAttributedStringRippler string](self, "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithCapacity:", objc_msgSend(v15, "length"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[ICAttributedStringRippler animatedRange](self, "animatedRange");
  v18 = -[ICAttributedStringRippler animatedRange](self, "animatedRange");
  if (v17 < v18 + v19)
  {
    v20 = *MEMORY[0x1E0DC1140];
    do
    {
      -[ICAttributedStringRippler string](self, "string");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "attribute:atIndex:effectiveRange:", v20, v17, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "addObject:", v22);
      ++v17;
      v23 = -[ICAttributedStringRippler animatedRange](self, "animatedRange");
    }
    while (v17 < v23 + v24);
  }
  if (v67)
  {
    bzero(v8, v6);
    bzero(v13, v6);
    memset_pattern16(v11, &unk_1ACA58700, v6);
  }
  v63 = v16;
  v25 = -[ICAttributedStringRippler preFrames](self, "preFrames");
  v26 = -[ICAttributedStringRippler preFrames](self, "preFrames");
  if (v25 < -[ICAttributedStringRippler animateFrames](self, "animateFrames") + v26)
  {
    do
    {
      v27 = (double)(v25 - -[ICAttributedStringRippler preFrames](self, "preFrames"));
      v28 = v27 / (double)-[ICAttributedStringRippler animateFrames](self, "animateFrames");
      v29 = exp(v28 * -4.0);
      v30 = __sincos_stret(v28 * 13.6);
      v31 = 1.0 - v29 * (v30.__cosval + v30.__sinval * 0.3);
      *(double *)&v13[8 * v25] = v31;
      *(double *)&v8[8 * v25] = v31;
      *(double *)&v11[8 * v25++] = v29 * 0.3 * v30.__sinval + 1.0;
      v32 = -[ICAttributedStringRippler preFrames](self, "preFrames");
    }
    while (v25 < -[ICAttributedStringRippler animateFrames](self, "animateFrames") + v32);
  }
  v33 = -[ICAttributedStringRippler preFrames](self, "preFrames");
  v34 = -[ICAttributedStringRippler animateFrames](self, "animateFrames") + v33;
  v35 = -[ICAttributedStringRippler preFrames](self, "preFrames");
  v36 = -[ICAttributedStringRippler animateFrames](self, "animateFrames") + v35;
  if (v34 < v36 + -[ICAttributedStringRippler postFrames](self, "postFrames"))
  {
    do
    {
      *(_QWORD *)&v8[8 * v34] = 0x3FF0000000000000;
      *(_QWORD *)&v13[8 * v34] = 0x3FF0000000000000;
      *(_QWORD *)&v11[8 * v34++] = 0x3FF0000000000000;
      v37 = -[ICAttributedStringRippler preFrames](self, "preFrames");
      v38 = -[ICAttributedStringRippler animateFrames](self, "animateFrames") + v37;
    }
    while (v34 < v38 + -[ICAttributedStringRippler postFrames](self, "postFrames"));
  }
  v62 = v11;
  v61 = self;
  if (v67)
  {
    v39 = v13;
    for (i = 0; i != v67; ++i)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v68 = v63;
      v43 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v73;
        do
        {
          for (j = 0; j != v44; ++j)
          {
            if (*(_QWORD *)v73 != v45)
              objc_enumerationMutation(v68);
            v47 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
            v71 = 0.0;
            v70 = 0.0;
            v69 = 0.0;
            objc_msgSend(v47, "getRed:green:blue:alpha:", &v71, &v70, &v69, 0);
            v48 = *(double *)&v8[8 * i];
            v49 = v48 * v71;
            v50 = v48 * v70;
            v51 = v48 * v69;
            objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v48 * v71, v48 * v70, v48 * v69, 1.0);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "addObject:", v52);

            objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v49, v50, v51, *(double *)&v39[8 * i]);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "addObject:", v53);

          }
          v44 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
        }
        while (v44);
      }

      objc_msgSend(v66, "addObject:", v41);
      objc_msgSend(v65, "addObject:", v42);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v62[8 * i]);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "addObject:", v54);

    }
  }
  v55 = v61;
  v56 = v66;
  -[ICAttributedStringRippler setColors:](v61, "setColors:", v66);
  v57 = v65;
  -[ICAttributedStringRippler setShadowColors:](v55, "setShadowColors:", v65);
  v58 = v55;
  v59 = v64;
  -[ICAttributedStringRippler setScales:](v58, "setScales:", v64);

}

- (void)start
{
  -[ICAttributedStringRippler setStartTime:](self, "setStartTime:", CFAbsoluteTimeGetCurrent());
  -[ICAttributedStringRippler setReduceMotion:](self, "setReduceMotion:", UIAccessibilityIsReduceMotionEnabled());
}

- (unint64_t)currentTimeIndex
{
  double Current;
  double v4;

  Current = CFAbsoluteTimeGetCurrent();
  -[ICAttributedStringRippler startTime](self, "startTime");
  return (unint64_t)((Current - v4) * 60.0);
}

- (unint64_t)finishedTimeIndex
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[ICAttributedStringRippler preFrames](self, "preFrames");
  v4 = -[ICAttributedStringRippler animateFrames](self, "animateFrames") + v3;
  return v4 + -[ICAttributedStringRippler postFrames](self, "postFrames");
}

- (unint64_t)currentIndexForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5 isFinished:(BOOL *)a6
{
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  unint64_t result;
  unint64_t v19;

  v11 = -[ICAttributedStringRippler preFrames](self, "preFrames");
  v12 = -[ICAttributedStringRippler animateFrames](self, "animateFrames") + v11;
  v13 = v12 + -[ICAttributedStringRippler postFrames](self, "postFrames");
  v14 = a5 % (2 * (v13 + -[ICAttributedStringRippler delayFrames](self, "delayFrames") * a4));
  v15 = a3 + 1;
  if (v14 >= -[ICAttributedStringRippler delayFrames](self, "delayFrames") * (a3 + 1)
    && v14 < v13 + -[ICAttributedStringRippler delayFrames](self, "delayFrames") * v15)
  {
    v16 = -[ICAttributedStringRippler delayFrames](self, "delayFrames");
    v17 = 0;
    result = v14 - v16 * v15;
    if (!a6)
      return result;
LABEL_9:
    *a6 = v17;
    return result;
  }
  v19 = -[ICAttributedStringRippler delayFrames](self, "delayFrames");
  v17 = v14 >= v19 * v15;
  if (v14 < v19 * v15)
    result = 0;
  else
    result = v13 - 1;
  if (a6)
    goto LABEL_9;
  return result;
}

- (id)currentColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  void *v9;
  void *v10;
  void *v11;

  -[ICAttributedStringRippler colors](self, "colors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", -[ICAttributedStringRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)currentShadowColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  void *v9;
  void *v10;
  void *v11;

  -[ICAttributedStringRippler shadowColors](self, "shadowColors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", -[ICAttributedStringRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (double)currentScaleForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  void *v10;
  void *v11;
  double v12;
  double v13;

  if (-[ICAttributedStringRippler reduceMotion](self, "reduceMotion"))
    return 1.0;
  -[ICAttributedStringRippler scales](self, "scales");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", -[ICAttributedStringRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  return v13;
}

- (id)attributedStringForTimeIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__41;
  v17 = __Block_byref_object_dispose__41;
  -[ICAttributedStringRippler string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v5, "mutableCopy");

  -[ICAttributedStringRippler string](self, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICAttributedStringRippler animatedRange](self, "animatedRange");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__ICAttributedStringRippler_attributedStringForTimeIndex___block_invoke;
  v12[3] = &unk_1E5C20D88;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = a3;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", v8, v9, 2, v12);

  v10 = (void *)objc_msgSend((id)v14[5], "copy");
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __58__ICAttributedStringRippler_attributedStringForTimeIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v7 = a3 - objc_msgSend(*(id *)(a1 + 32), "animatedRange");
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "animatedRange");
  objc_msgSend(v8, "currentColorForGlyphIndex:numberOfGlyphs:timeIndex:", v7, v9, *(_QWORD *)(a1 + 48));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v10, "animatedRange");
  objc_msgSend(v10, "currentScaleForGlyphIndex:numberOfGlyphs:timeIndex:", v7, v11, *(_QWORD *)(a1 + 48));
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "initialFontSize");
  v15 = v13 * v14;
  v16 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(*(id *)(a1 + 32), "initialFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fontDescriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fontWithDescriptor:size:", v18, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  objc_msgSend(v20, "ic_setNonNilObject:forKey:", v21, *MEMORY[0x1E0DC1140]);
  objc_msgSend(v20, "ic_setNonNilObject:forKey:", 0, *MEMORY[0x1E0DC1198]);
  objc_msgSend(v20, "ic_setNonNilObject:forKey:", v19, *MEMORY[0x1E0DC1138]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setAttributes:range:", v20, a3, a4);

}

- (BOOL)finishedForTimeIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v10;

  v10 = 0;
  v5 = -[ICAttributedStringRippler animatedRange](self, "animatedRange");
  v7 = v5 + v6;
  -[ICAttributedStringRippler animatedRange](self, "animatedRange");
  -[ICAttributedStringRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", v7, v8, a3, &v10);
  return v10;
}

- (NSAttributedString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_NSRange)animatedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_animatedRange.length;
  location = self->_animatedRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setAnimatedRange:(_NSRange)a3
{
  self->_animatedRange = a3;
}

- (NSArray)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)shadowColors
{
  return self->_shadowColors;
}

- (void)setShadowColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)scales
{
  return self->_scales;
}

- (void)setScales:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (unint64_t)preFrames
{
  return self->_preFrames;
}

- (void)setPreFrames:(unint64_t)a3
{
  self->_preFrames = a3;
}

- (unint64_t)animateFrames
{
  return self->_animateFrames;
}

- (void)setAnimateFrames:(unint64_t)a3
{
  self->_animateFrames = a3;
}

- (unint64_t)postFrames
{
  return self->_postFrames;
}

- (void)setPostFrames:(unint64_t)a3
{
  self->_postFrames = a3;
}

- (unint64_t)delayFrames
{
  return self->_delayFrames;
}

- (void)setDelayFrames:(unint64_t)a3
{
  self->_delayFrames = a3;
}

- (BOOL)reduceMotion
{
  return self->_reduceMotion;
}

- (void)setReduceMotion:(BOOL)a3
{
  self->_reduceMotion = a3;
}

- (UIFont)initialFont
{
  return self->_initialFont;
}

- (void)setInitialFont:(id)a3
{
  objc_storeStrong((id *)&self->_initialFont, a3);
}

- (double)initialFontSize
{
  return self->_initialFontSize;
}

- (void)setInitialFontSize:(double)a3
{
  self->_initialFontSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialFont, 0);
  objc_storeStrong((id *)&self->_scales, 0);
  objc_storeStrong((id *)&self->_shadowColors, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
