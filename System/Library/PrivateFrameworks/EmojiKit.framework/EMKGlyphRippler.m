@implementation EMKGlyphRippler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsets, 0);
  objc_storeStrong((id *)&self->_scales, 0);
  objc_storeStrong((id *)&self->_darkModeShadowColors, 0);
  objc_storeStrong((id *)&self->_shadowColors, 0);
  objc_storeStrong((id *)&self->_darkModeColors, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

- (EMKGlyphRippler)init
{
  EMKGlyphRippler *v2;
  EMKGlyphRippler *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EMKGlyphRippler;
  v2 = -[EMKGlyphRippler init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_preFrames = xmmword_1DB1A26C0;
    *(_OWORD *)&v2->_postFrames = xmmword_1DB1A26D0;
    -[EMKGlyphRippler generateValues](v2, "generateValues");
    -[EMKGlyphRippler start](v3, "start");
  }
  return v3;
}

- (void)start
{
  -[EMKGlyphRippler startWithDarkMode:](self, "startWithDarkMode:", 0);
}

- (void)startWithDarkMode:(BOOL)a3
{
  self->_startTime = CFAbsoluteTimeGetCurrent();
  self->_reduceMotion = UIAccessibilityIsReduceMotionEnabled();
  self->_darkMode = a3;
}

- (void)generateValues
{
  unint64_t preFrames;
  unint64_t v4;
  unint64_t v5;
  double *v6;
  double *v7;
  double *v8;
  double *v9;
  unint64_t animateFrames;
  unint64_t v11;
  double *v12;
  double *v13;
  double *v14;
  double v15;
  double v16;
  __double2 v17;
  double v18;
  double v19;
  unint64_t postFrames;
  size_t v21;
  NSArray *v22;
  NSArray *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  EMKGlyphRippler *v40;
  NSArray *colors;
  NSArray *darkModeColors;
  NSArray *v43;
  NSArray *shadowColors;
  NSArray *v45;
  NSArray *v46;
  NSArray *darkModeShadowColors;
  NSArray *v48;
  NSArray *v49;
  NSArray *scales;
  NSArray *v51;
  NSArray *v52;
  NSArray *offsets;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  EMKGlyphRippler *v57;
  double v58;
  NSArray *v59;
  NSArray *v60;
  NSArray *v61;
  NSArray *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v55 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v56 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v59 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v60 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v61 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v62 = (NSArray *)objc_claimAutoreleasedReturnValue();
  preFrames = self->_preFrames;
  v4 = self->_animateFrames + preFrames + self->_postFrames;
  v5 = (8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = (double *)((char *)&v54 - v5);
  v7 = (double *)((char *)&v54 - v5);
  v8 = (double *)((char *)&v54 - v5);
  v9 = (double *)((char *)&v54 - v5);
  if (preFrames)
  {
    bzero((char *)&v54 - v5, 8 * preFrames);
    bzero(v9, 8 * preFrames);
    bzero(v8, 8 * preFrames);
    memset_pattern16(v7, &unk_1DB1A26E0, 8 * preFrames);
  }
  animateFrames = self->_animateFrames;
  v57 = self;
  *(_QWORD *)&v58 = animateFrames + preFrames;
  if (preFrames < animateFrames + preFrames)
  {
    bzero(&v8[preFrames], 8 * animateFrames);
    v11 = 0;
    v12 = &v7[preFrames];
    v13 = &v6[preFrames];
    v14 = &v9[preFrames];
    do
    {
      v15 = (double)v11 / (double)animateFrames;
      v16 = exp(v15 * -4.0);
      v17 = __sincos_stret(v15 * 13.6);
      v18 = 1.0 - v16 * (v17.__cosval + v17.__sinval * 0.3);
      v14[v11] = v18;
      v13[v11] = v18;
      v12[v11++] = v16 * 0.3 * v17.__sinval + 1.0;
    }
    while (animateFrames != v11);
  }
  v19 = v58;
  postFrames = v57->_postFrames;
  if (*(_QWORD *)&v19 < postFrames + *(_QWORD *)&v19)
  {
    v21 = 8 * postFrames;
    bzero(&v8[*(_QWORD *)&v58], 8 * postFrames);
    memset_pattern16(&v6[*(_QWORD *)&v19], &unk_1DB1A26E0, v21);
    memset_pattern16(&v9[*(_QWORD *)&v19], &unk_1DB1A26E0, v21);
    memset_pattern16(&v7[*(_QWORD *)&v19], &unk_1DB1A26E0, v21);
  }
  v22 = (NSArray *)v55;
  v23 = (NSArray *)v56;
  if (v4)
  {
    v58 = 127.0;
    do
    {
      v24 = *v6++;
      v25 = v24 * 255.0 / 255.0;
      v26 = v24 * v58 / 255.0;
      v27 = v24 * 0.0 / 255.0;
      v28 = 1.0 - v24 + v25;
      v29 = 1.0 - v24 + v26;
      v30 = 1.0 - v24 + v27;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v25, v26, v27, 1.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v22, "addObject:", v31);

      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v28, v29, v30, 1.0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v23, "addObject:", v32);

      v33 = *v9++;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v25, v26, v27, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v59, "addObject:", v34);

      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v28, v29, v30, v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v60, "addObject:", v35);

      v36 = *v7++;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v61, "addObject:", v37);

      v38 = *v8++;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v62, "addObject:", v39);

      --v4;
    }
    while (v4);
  }
  v40 = v57;
  colors = v57->_colors;
  v57->_colors = v22;
  v58 = COERCE_DOUBLE(v22);

  darkModeColors = v40->_darkModeColors;
  v40->_darkModeColors = v23;
  v43 = v23;

  shadowColors = v40->_shadowColors;
  v45 = v59;
  v40->_shadowColors = v59;
  v46 = v45;

  darkModeShadowColors = v40->_darkModeShadowColors;
  v48 = v60;
  v40->_darkModeShadowColors = v60;
  v49 = v48;

  scales = v40->_scales;
  v51 = v61;
  v40->_scales = v61;
  v52 = v51;

  offsets = v40->_offsets;
  v40->_offsets = v62;

}

- (unint64_t)currentTimeIndex
{
  return (unint64_t)((CFAbsoluteTimeGetCurrent() - self->_startTime) * 60.0);
}

- (unint64_t)currentIndexForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5 isFinished:(BOOL *)a6
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  unint64_t result;

  v6 = self->_animateFrames + self->_preFrames + self->_postFrames;
  v7 = self->_delayFrames + self->_delayFrames * a3;
  v8 = v6 - 1;
  if (a5 < v7)
    v8 = 0;
  v9 = v7 + v6;
  v10 = a5 >= v7 && v9 > a5;
  v11 = !v10 && a5 >= v7;
  if (v10)
    result = a5 - v7;
  else
    result = v8;
  if (a6)
    *a6 = v11;
  return result;
}

- (id)currentColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  uint64_t v9;
  id v10;
  void *v11;

  v9 = 16;
  if (!self->_darkMode)
    v9 = 8;
  v10 = *(id *)((char *)&self->super.isa + v9);
  objc_msgSend(v10, "objectAtIndex:", -[EMKGlyphRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)currentShadowColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  uint64_t v9;
  id v10;
  void *v11;

  v9 = 32;
  if (!self->_darkMode)
    v9 = 24;
  v10 = *(id *)((char *)&self->super.isa + v9);
  objc_msgSend(v10, "objectAtIndex:", -[EMKGlyphRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (double)currentScaleForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  void *v6;
  double v7;
  double v8;

  if (self->_reduceMotion)
    return 1.0;
  -[NSArray objectAtIndex:](self->_scales, "objectAtIndex:", -[EMKGlyphRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (CGSize)currentOffsetForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if (self->_reduceMotion)
  {
    v5 = 0.0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_offsets, "objectAtIndex:", -[EMKGlyphRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v5 = v7;

  }
  v8 = 0.0;
  v9 = v5;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)finishedForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  BOOL v6;

  v6 = 0;
  -[EMKGlyphRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, &v6);
  return v6;
}

- (void)setPreFrames:(unint64_t)a3
{
  unint64_t v3;

  if (a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  self->_preFrames = v3;
  -[EMKGlyphRippler generateValues](self, "generateValues");
}

- (void)setPostFrames:(unint64_t)a3
{
  unint64_t v3;

  if (a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  self->_postFrames = v3;
  -[EMKGlyphRippler generateValues](self, "generateValues");
}

- (void)setDelayFrames:(unint64_t)a3
{
  unint64_t v3;

  if (a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  self->_delayFrames = v3;
  -[EMKGlyphRippler generateValues](self, "generateValues");
}

@end
