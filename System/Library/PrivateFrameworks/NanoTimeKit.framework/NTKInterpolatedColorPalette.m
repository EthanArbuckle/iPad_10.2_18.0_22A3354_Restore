@implementation NTKInterpolatedColorPalette

- (NTKInterpolatedColorPalette)initWithFromPalette:(id)a3 toPalette:(id)a4
{
  id v6;
  id v7;
  NTKInterpolatedColorPalette *v8;
  uint64_t v9;
  NTKFaceColorPalette *fromPalette;
  uint64_t v11;
  NTKFaceColorPalette *toPalette;
  NSCache *v13;
  NSCache *cache;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NTKInterpolatedColorPalette;
  v8 = -[NTKInterpolatedColorPalette init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    fromPalette = v8->_fromPalette;
    v8->_fromPalette = (NTKFaceColorPalette *)v9;

    v11 = objc_msgSend(v7, "copy");
    toPalette = v8->_toPalette;
    v8->_toPalette = (NTKFaceColorPalette *)v11;

    v13 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cache = v8->_cache;
    v8->_cache = v13;

  }
  return v8;
}

- (NTKInterpolatedColorPalette)initWithColorPalette:(id)a3
{
  id v4;
  NTKInterpolatedColorPalette *v5;
  uint64_t v6;
  NTKFaceColorPalette *fromPalette;
  uint64_t v8;
  NTKFaceColorPalette *toPalette;
  NSCache *v10;
  NSCache *cache;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKInterpolatedColorPalette;
  v5 = -[NTKInterpolatedColorPalette init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    fromPalette = v5->_fromPalette;
    v5->_fromPalette = (NTKFaceColorPalette *)v6;

    v8 = objc_msgSend(v4, "copy");
    toPalette = v5->_toPalette;
    v5->_toPalette = (NTKFaceColorPalette *)v8;

    v10 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cache = v5->_cache;
    v5->_cache = v10;

  }
  return v5;
}

- (id)valueForKey:(id)a3
{
  return -[NTKInterpolatedColorPalette interpolatedColorFromSelector:parameter:](self, "interpolatedColorFromSelector:parameter:", NSSelectorFromString((NSString *)a3), 0);
}

- (id)interpolatedColorFromSelector:(SEL)a3 parameter:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  float v20;
  double v21;
  float v22;
  double v23;
  void *v24;
  double (**v25)(_QWORD, double, double, double);
  double v26;
  double v27;
  uint64_t v28;
  double v29;

  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCache objectForKey:](self->_cache, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    PerformSelectorWithArgument(self->_fromPalette, (uint64_t)a3, (uint64_t)v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceColorPalette identifier](self->_fromPalette, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceColorPalette identifier](self->_toPalette, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if (v15)
    {
      v16 = v12;
      if (!v16)
        goto LABEL_21;
      goto LABEL_20;
    }
    PerformSelectorWithArgument(self->_toPalette, (uint64_t)a3, (uint64_t)v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[NTKInterpolatedColorPalette colorInterpolator](self, "colorInterpolator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[NTKInterpolatedColorPalette colorInterpolator](self, "colorInterpolator");
        v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[NTKInterpolatedColorPalette transitionFraction](self, "transitionFraction");
        ((void (**)(_QWORD, void *, void *))v19)[2](v19, v12, v17);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      }
      -[NTKInterpolatedColorPalette transitionFraction](self, "transitionFraction");
      NTKInterpolateBetweenColors(v12, v17);
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v16 = 0;
        goto LABEL_19;
      }
      objc_msgSend(v12, "floatValue");
      v21 = v20;
      objc_msgSend(v17, "floatValue");
      v23 = v22;
      -[NTKInterpolatedColorPalette floatInterpolator](self, "floatInterpolator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        -[NTKInterpolatedColorPalette floatInterpolator](self, "floatInterpolator");
        v25 = (double (**)(_QWORD, double, double, double))objc_claimAutoreleasedReturnValue();
        -[NTKInterpolatedColorPalette transitionFraction](self, "transitionFraction");
        v27 = v25[2](v25, v21, v23, v26);

      }
      else
      {
        -[NTKInterpolatedColorPalette transitionFraction](self, "transitionFraction");
        CLKInterpolateBetweenFloatsClipped();
        v27 = v29;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
      v28 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (id)v28;
LABEL_19:

    if (!v16)
    {
LABEL_21:
      v11 = v16;

      goto LABEL_22;
    }
LABEL_20:
    -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", v16, v9);
    goto LABEL_21;
  }
  v11 = v10;
LABEL_22:

  return v11;
}

- (void)setTransitionFraction:(double)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  self->_transitionFraction = a3;
  -[NSCache removeAllObjects](self->_cache, "removeAllObjects");
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void (*v8)(void);
  const char *v9;
  unsigned __int8 v10;
  BOOL v11;
  objc_super v13;

  NSStringFromSelector(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(":"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 == 2)
  {
    v8 = (void (*)(void))NTKInterpolatedColorPalette_singleArgumentMethodImplementation;
    v9 = "@@:@";
  }
  else
  {
    if (v7 != 1)
    {
      v13.receiver = a1;
      v13.super_class = (Class)&OBJC_METACLASS___NTKInterpolatedColorPalette;
      v10 = objc_msgSendSuper2(&v13, sel_resolveInstanceMethod_, a3);
      goto LABEL_7;
    }
    v8 = (void (*)(void))NTKInterpolatedColorPalette_noArgumentMethodImplementation;
    v9 = "@@:";
  }
  v10 = class_addMethod((Class)a1, a3, v8, v9);
LABEL_7:
  v11 = v10;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  NTKInterpolatedColorPalette *v4;
  NTKInterpolatedColorPalette *v5;
  NTKFaceColorPalette *fromPalette;
  void *v7;
  NTKFaceColorPalette *toPalette;
  void *v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  v4 = (NTKInterpolatedColorPalette *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    fromPalette = self->_fromPalette;
    -[NTKInterpolatedColorPalette fromPalette](v4, "fromPalette");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NTKFaceColorPalette isEqual:](fromPalette, "isEqual:", v7))
    {
      toPalette = self->_toPalette;
      -[NTKInterpolatedColorPalette toPalette](v5, "toPalette");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NTKFaceColorPalette isEqual:](toPalette, "isEqual:", v9))
      {
        -[NTKInterpolatedColorPalette transitionFraction](self, "transitionFraction");
        v11 = v10;
        -[NTKInterpolatedColorPalette transitionFraction](v5, "transitionFraction");
        v13 = v11 == v12;
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (double)transitionFraction
{
  return self->_transitionFraction;
}

- (NTKFaceColorPalette)fromPalette
{
  return self->_fromPalette;
}

- (void)setFromPalette:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NTKFaceColorPalette)toPalette
{
  return self->_toPalette;
}

- (void)setToPalette:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)colorInterpolator
{
  return self->_colorInterpolator;
}

- (void)setColorInterpolator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)floatInterpolator
{
  return self->_floatInterpolator;
}

- (void)setFloatInterpolator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_floatInterpolator, 0);
  objc_storeStrong(&self->_colorInterpolator, 0);
  objc_storeStrong((id *)&self->_toPalette, 0);
  objc_storeStrong((id *)&self->_fromPalette, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
