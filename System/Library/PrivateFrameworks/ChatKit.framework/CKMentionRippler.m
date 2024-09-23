@implementation CKMentionRippler

- (void)generateValues
{
  unint64_t v3;
  double *v4;
  double *v5;
  double *v6;
  double *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t animateFrames;
  unint64_t preFrames;
  unint64_t v13;
  double *v14;
  double v15;
  double v16;
  __double2 v17;
  double v18;
  unint64_t postFrames;
  unint64_t v20;
  size_t v21;
  NSArray *v22;
  NSArray *i;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  CKMentionRippler *v35;
  NSArray *colors;
  NSArray *v37;
  NSArray *shadowColors;
  NSArray *v39;
  CKMentionRippler *v40;
  NSArray *scales;
  NSArray *v42;
  NSArray *v43;
  NSArray *offsets;
  unint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  CKMentionRippler *v49;
  NSArray *v50;
  NSArray *v51;
  double v52;
  double v53;
  double v54[3];

  v54[1] = *(double *)MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v51 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v3 = self->_animateFrames + self->_preFrames + self->_postFrames;
  v4 = (double *)((char *)&v45 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v4, 8 * v3);
  v5 = v4;
  bzero(v4, 8 * v3);
  v6 = v4;
  bzero(v4, 8 * v3);
  v7 = v4;
  bzero(v4, 8 * v3);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "theme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entryFieldConfirmedMentionColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = 0.0;
  v54[0] = 0.0;
  v52 = 0.0;
  v46 = v10;
  objc_msgSend(v10, "getRed:green:blue:alpha:", v54, &v53, &v52, 0);
  if (v3)
  {
    bzero(v4, 8 * v3);
    bzero(v4, 8 * v3);
    bzero(v4, 8 * v3);
    memset_pattern16(v4, &unk_18E7CAB10, 8 * v3);
  }
  preFrames = self->_preFrames;
  animateFrames = self->_animateFrames;
  v49 = self;
  v45 = animateFrames + preFrames;
  if (preFrames < animateFrames + preFrames)
  {
    bzero(&v4[preFrames], 8 * animateFrames);
    v13 = 0;
    v14 = &v4[preFrames];
    do
    {
      v15 = (double)v13 / (double)animateFrames;
      v16 = exp(v15 * -4.0);
      v17 = __sincos_stret(v15 * 13.6);
      v18 = 1.0 - v16 * (v17.__cosval + v17.__sinval * 0.3);
      v14[v13] = v18;
      v14[v13] = v18;
      v14[v13++] = v16 * 0.3 * v17.__sinval + 1.0;
    }
    while (animateFrames != v13);
  }
  postFrames = v49->_postFrames;
  v20 = v45;
  if (v20 < postFrames + v20)
  {
    v21 = 8 * postFrames;
    bzero(&v4[v45], 8 * postFrames);
    memset_pattern16(&v4[v20], &unk_18E7CAB10, v21);
    memset_pattern16(&v4[v20], &unk_18E7CAB10, v21);
    memset_pattern16(&v4[v20], &unk_18E7CAB10, v21);
  }
  v22 = (NSArray *)v47;
  for (i = (NSArray *)v48; v3; --v3)
  {
    v24 = *v4++;
    v25 = v24 * v54[0];
    v26 = v24 * v53;
    v27 = v24 * v52;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v24 * v54[0], v24 * v53, v24 * v52, 1.0, v45);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v22, "addObject:", v28);

    v29 = *v7++;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v25, v26, v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](i, "addObject:", v30);

    v31 = *v5++;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v50, "addObject:", v32);

    v33 = *v6++;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v51, "addObject:", v34);

  }
  v35 = v49;
  colors = v49->_colors;
  v49->_colors = v22;
  v37 = v22;

  shadowColors = v35->_shadowColors;
  v35->_shadowColors = i;
  v39 = i;

  v40 = v35;
  scales = v35->_scales;
  v42 = v50;
  v40->_scales = v50;
  v43 = v42;

  offsets = v40->_offsets;
  v40->_offsets = v51;

}

- (void)start
{
  self->_startTime = CFAbsoluteTimeGetCurrent();
  self->_reduceMotion = UIAccessibilityIsReduceMotionEnabled();
}

- (CKMentionRippler)init
{
  CKMentionRippler *v2;
  CKMentionRippler *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMentionRippler;
  v2 = -[CKMentionRippler init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_preFrames = xmmword_18E7CAAF0;
    *(_OWORD *)&v2->_postFrames = xmmword_18E7CAB00;
    -[CKMentionRippler generateValues](v2, "generateValues");
    -[CKMentionRippler start](v3, "start");
  }
  return v3;
}

- (unint64_t)currentTimeIndex
{
  return (unint64_t)((CFAbsoluteTimeGetCurrent() - self->_startTime) * 60.0);
}

- (unint64_t)finishedTimeIndex
{
  return self->_animateFrames + self->_preFrames + self->_postFrames;
}

- (unint64_t)currentIndexForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5 isFinished:(BOOL *)a6
{
  unint64_t delayFrames;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  BOOL v13;
  unint64_t result;

  delayFrames = self->_delayFrames;
  v7 = self->_animateFrames + self->_preFrames + self->_postFrames;
  v8 = a5 % (2 * (v7 + delayFrames * a4));
  v9 = delayFrames + delayFrames * a3;
  v10 = v7 - 1;
  if (v8 < v9)
    v10 = 0;
  v11 = v9 + v7;
  v12 = v8 < v9 || v8 >= v11;
  v13 = v12 && v8 >= v9;
  if (v12)
    result = v10;
  else
    result = v8 - v9;
  if (a6)
    *a6 = v13;
  return result;
}

- (id)currentColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  return -[NSArray objectAtIndex:](self->_colors, "objectAtIndex:", -[CKMentionRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, 0));
}

- (id)currentShadowColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  return -[NSArray objectAtIndex:](self->_shadowColors, "objectAtIndex:", -[CKMentionRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, 0));
}

- (double)currentScaleForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  void *v6;
  double v7;
  double v8;

  if (self->_reduceMotion)
    return 1.0;
  -[NSArray objectAtIndex:](self->_scales, "objectAtIndex:", -[CKMentionRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, 0));
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
    -[NSArray objectAtIndex:](self->_offsets, "objectAtIndex:", -[CKMentionRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, 0));
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
  -[CKMentionRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, &v6);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsets, 0);
  objc_storeStrong((id *)&self->_scales, 0);
  objc_storeStrong((id *)&self->_shadowColors, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
