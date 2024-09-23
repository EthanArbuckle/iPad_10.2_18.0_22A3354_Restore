@implementation NTKMultiInterpolatedColorPalette

- (NTKMultiInterpolatedColorPalette)initWithPalettes:(id)a3
{
  id v5;
  unint64_t v6;
  double v7;
  NTKMultiInterpolatedColorPalette *v8;
  NSCache *v9;
  NSCache *cache;
  uint64_t v11;
  NSMutableArray *freeAxes;
  uint64_t v13;
  NSMutableArray *paletteIndices;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v5 = a3;
  if (initWithPalettes__once != -1)
    dispatch_once(&initWithPalettes__once, &__block_literal_global_157);
  self->_arity = -1;
  v6 = 1;
  do
  {
    v7 = (double)(unint64_t)objc_msgSend(v5, "count");
    if (ldexp(1.0, v6) == v7)
    {
      self->_arity = v6;
      goto LABEL_9;
    }
    ++v6;
  }
  while ((_DWORD)v6 != 8);
  if (self->_arity == -1)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("invalid palette count: %lu (must be a power of two)"), objc_msgSend(v5, "count"));
LABEL_9:
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_8_3);
  v23.receiver = self;
  v23.super_class = (Class)NTKMultiInterpolatedColorPalette;
  v8 = -[NTKMultiInterpolatedColorPalette init](&v23, sel_init);
  if (v8)
  {
    v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cache = v8->_cache;
    v8->_cache = v9;

    objc_storeStrong((id *)&v8->_palettes, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8->_arity);
    freeAxes = v8->_freeAxes;
    v8->_freeAxes = (NSMutableArray *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    paletteIndices = v8->_paletteIndices;
    v8->_paletteIndices = (NSMutableArray *)v13;

    -[NSMutableArray addObject:](v8->_paletteIndices, "addObject:", &unk_1E6CA17A0);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8->_arity);
    -[NTKMultiInterpolatedColorPalette setColorInterpolators:](v8, "setColorInterpolators:", v15);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8->_arity);
    -[NTKMultiInterpolatedColorPalette setFloatInterpolators:](v8, "setFloatInterpolators:", v16);

    if (v8->_arity)
    {
      v17 = 0;
      do
      {
        v18 = _Block_copy((const void *)_defaultColorInterpolator);
        -[NTKMultiInterpolatedColorPalette colorInterpolators](v8, "colorInterpolators");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:atIndexedSubscript:", v18, v17);

        v20 = _Block_copy((const void *)_defaultFloatInterpolator);
        -[NTKMultiInterpolatedColorPalette floatInterpolators](v8, "floatInterpolators");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:atIndexedSubscript:", v20, v17);

        ++v17;
      }
      while (v8->_arity > v17);
    }
  }

  return v8;
}

void __53__NTKMultiInterpolatedColorPalette_initWithPalettes___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)_invalid;
  _invalid = (uint64_t)&unk_1E6CAAD08;

  v1 = (void *)_defaultColorInterpolator;
  _defaultColorInterpolator = (uint64_t)&__block_literal_global_3_5;

  v2 = (void *)_defaultFloatInterpolator;
  _defaultFloatInterpolator = (uint64_t)&__block_literal_global_5_4;

}

uint64_t __53__NTKMultiInterpolatedColorPalette_initWithPalettes___block_invoke_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NTKInterpolateBetweenColors(a2, a3);
}

- (id)valueForKey:(id)a3
{
  return -[NTKMultiInterpolatedColorPalette interpolatedColorFromSelector:parameter:](self, "interpolatedColorFromSelector:parameter:", NSSelectorFromString((NSString *)a3), 0);
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
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  float v27;
  float v28;
  unint64_t v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  void *v38;
  void *v40;
  void *v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCache objectForKey:](self->_cache, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    v12 = v11;
  }
  else
  {
    -[NTKMultiInterpolatedColorPalette palettes](self, "palettes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableArray count](self->_paletteIndices, "count") == 1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_paletteIndices, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", (int)objc_msgSend(v14, "intValue"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _PerformSelectorWithArgument(v15, (uint64_t)a3, (uint64_t)v6);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v41 = v9;
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_paletteIndices, "count"));
      if (-[NSMutableArray count](self->_paletteIndices, "count"))
      {
        v17 = 0;
        do
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_paletteIndices, "objectAtIndexedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", (int)objc_msgSend(v18, "intValue"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          _PerformSelectorWithArgument(v19, (uint64_t)a3, (uint64_t)v6);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            v21 = v16;
            v22 = (uint64_t)v20;
          }
          else
          {
            v22 = _invalid;
            v21 = v16;
          }
          objc_msgSend(v21, "addObject:", v22);

          ++v17;
        }
        while (-[NSMutableArray count](self->_paletteIndices, "count") > v17);
      }
      v40 = v13;
      v42 = v6;
      if (-[NSMutableArray count](self->_freeAxes, "count"))
      {
        v23 = 0;
        do
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (unint64_t)objc_msgSend(v16, "count") >> 1);
          -[NTKMultiInterpolatedColorPalette transitionFractions](self, "transitionFractions");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray objectAtIndexedSubscript:](self->_freeAxes, "objectAtIndexedSubscript:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", (int)objc_msgSend(v25, "intValue"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "floatValue");
          v28 = v27;

          if (objc_msgSend(v16, "count"))
          {
            v29 = 0;
            v30 = v28;
            do
            {
              objc_msgSend(v16, "objectAtIndexedSubscript:", v29);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectAtIndexedSubscript:", v29 + 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray objectAtIndexedSubscript:](self->_freeAxes, "objectAtIndexedSubscript:", v23);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[NTKMultiInterpolatedColorPalette _combineValue:and:with:onAxis:](self, "_combineValue:and:with:onAxis:", v31, v32, (int)objc_msgSend(v33, "intValue"), v30);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "addObject:", v34);
              v29 += 2;
            }
            while (objc_msgSend(v16, "count") > v29);
          }

          ++v23;
          v16 = v14;
        }
        while (-[NSMutableArray count](self->_freeAxes, "count") > v23);
      }
      else
      {
        v14 = v16;
      }
      v9 = v41;
      if (objc_msgSend(v14, "count") != 1)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Expected one palette value to remain at this point"));
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v6 = v42;
      v13 = v40;
    }

    if (v11 == (id)_invalid)
    {
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a3);
        v37 = v6;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v44 = v38;
        _os_log_impl(&dword_1B72A3000, v36, OS_LOG_TYPE_DEFAULT, "MultiInterpolatedPalette got invalid value for %@", buf, 0xCu);

        v6 = v37;
      }

      objc_msgSend(MEMORY[0x1E0DC3658], "systemCyanColor");
      v35 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v11)
        -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", v11, v9);
      v35 = v11;
    }
    v12 = v35;

  }
  return v12;
}

- (id)_combineValue:(id)a3 and:(id)a4 with:(double)a5 onAxis:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, double);
  uint64_t v15;
  float v16;
  double v17;
  float v18;
  double v19;
  void *v20;
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = (id)_invalid;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NTKMultiInterpolatedColorPalette colorInterpolators](self, "colorInterpolators");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", a6);
      v14 = (void (**)(_QWORD, _QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();

      ((void (**)(_QWORD, id, id, double))v14)[2](v14, v10, v11, a5);
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v21 = (void *)v15;

      v12 = v21;
      goto LABEL_8;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "floatValue");
      v17 = v16;
      objc_msgSend(v11, "floatValue");
      v19 = v18;
      -[NTKMultiInterpolatedColorPalette floatInterpolators](self, "floatInterpolators");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", a6);
      v14 = (void (**)(_QWORD, _QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();

      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, double), double, double, double))v14[2])(v14, v17, v19, a5);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
LABEL_8:

  return v12;
}

- (void)setTransitionFractions:(id)a3
{
  void *v3;
  id v6;
  uint64_t v7;
  void *v8;
  float v9;
  double v10;
  uint64_t v11;
  NSMutableArray *paletteIndices;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  NSMutableArray *v24;
  void *v25;
  void *v26;
  void *v27;
  NSMutableArray *freeAxes;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __CFString *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  __CFString *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (objc_msgSend(v6, "count") != self->_arity)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("transitionFractions count must be %lu"), self->_arity);
  if ((-[NSArray isEqual:](self->_transitionFractions, "isEqual:", v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_transitionFractions, a3);
    -[NSCache removeAllObjects](self->_cache, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_freeAxes, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_paletteIndices, "removeAllObjects");
    v7 = objc_msgSend(v6, "count") - 1;
    if (v7 >= 0)
    {
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "floatValue");
        v10 = v9;

        if (fabs(v10) >= 0.00000011920929)
        {
          v16 = -[NSMutableArray count](self->_paletteIndices, "count");
          paletteIndices = self->_paletteIndices;
          if (fabs(v10 + -1.0) >= 0.00000011920929)
          {
            if (v16)
            {
              v20 = -[NSMutableArray count](paletteIndices, "count") - 1;
              if (v20 >= 0)
              {
                do
                {
                  v21 = v20;
                  -[NSMutableArray objectAtIndexedSubscript:](self->_paletteIndices, "objectAtIndexedSubscript:", v20);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v22, "unsignedIntValue");

                  v24 = self->_paletteIndices;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (2 * v23) | 1);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableArray insertObject:atIndex:](v24, "insertObject:atIndex:", v25, v21 + 1);

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 2 * v23);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableArray setObject:atIndexedSubscript:](self->_paletteIndices, "setObject:atIndexedSubscript:", v26, v21);

                  v20 = v21 - 1;
                }
                while (v21);
              }
            }
            else
            {
              -[NSMutableArray addObject:](paletteIndices, "addObject:", &unk_1E6CA17A0);
              -[NSMutableArray addObject:](self->_paletteIndices, "addObject:", &unk_1E6CA17B8);
            }
            freeAxes = self->_freeAxes;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray insertObject:atIndex:](freeAxes, "insertObject:atIndex:", v3, 0);

            continue;
          }
          if (v16)
          {
            if (-[NSMutableArray count](paletteIndices, "count"))
            {
              v17 = 0;
              do
              {
                v18 = (void *)MEMORY[0x1E0CB37E8];
                -[NSMutableArray objectAtIndexedSubscript:](self->_paletteIndices, "objectAtIndexedSubscript:", v17);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "numberWithInt:", (2 * objc_msgSend(v19, "intValue")) | 1);
                v3 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableArray setObject:atIndexedSubscript:](self->_paletteIndices, "setObject:atIndexedSubscript:", v3, v17);

                ++v17;
              }
              while (-[NSMutableArray count](self->_paletteIndices, "count") > v17);
            }
            continue;
          }
          v27 = &unk_1E6CA17B8;
        }
        else
        {
          v11 = -[NSMutableArray count](self->_paletteIndices, "count");
          paletteIndices = self->_paletteIndices;
          if (v11)
          {
            if (-[NSMutableArray count](paletteIndices, "count"))
            {
              v13 = 0;
              do
              {
                v14 = (void *)MEMORY[0x1E0CB37E8];
                -[NSMutableArray objectAtIndexedSubscript:](self->_paletteIndices, "objectAtIndexedSubscript:", v13);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "numberWithInt:", 2 * objc_msgSend(v15, "intValue"));
                v3 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableArray setObject:atIndexedSubscript:](self->_paletteIndices, "setObject:atIndexedSubscript:", v3, v13);

                ++v13;
              }
              while (-[NSMutableArray count](self->_paletteIndices, "count") > v13);
            }
            continue;
          }
          v27 = &unk_1E6CA17A0;
        }
        -[NSMutableArray addObject:](paletteIndices, "addObject:", v27);
      }
      while (v7-- > 0);
    }
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "valueForKey:", CFSTR("description"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR(","));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[NSMutableArray count](self->_freeAxes, "count");
      if (v33)
      {
        -[NSMutableArray valueForKey:](self->_freeAxes, "valueForKey:", CFSTR("description"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v34 = CFSTR("(none)");
      }
      -[NSMutableArray valueForKey:](self->_paletteIndices, "valueForKey:", CFSTR("description"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "componentsJoinedByString:", CFSTR(","));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v38 = v32;
      v39 = 2112;
      v40 = v34;
      v41 = 2112;
      v42 = v36;
      _os_log_impl(&dword_1B72A3000, v30, OS_LOG_TYPE_DEFAULT, "MultiInterpolatedPalette setTransitionFractions to %@ and have free axes %@ and palettes %@", buf, 0x20u);

      if (v33)
      {

      }
    }

  }
}

- (NSArray)palettes
{
  return self->_palettes;
}

- (void)setPalettes:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_palettes, a3);
  v5 = a3;
  -[NSCache removeAllObjects](self->_cache, "removeAllObjects");

}

- (void)clearCache
{
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
    v8 = (void (*)(void))NTKMultiInterpolatedColorPalette_singleArgumentMethodImplementation;
    v9 = "@@:@";
  }
  else
  {
    if (v7 != 1)
    {
      v13.receiver = a1;
      v13.super_class = (Class)&OBJC_METACLASS___NTKMultiInterpolatedColorPalette;
      v10 = objc_msgSendSuper2(&v13, sel_resolveInstanceMethod_, a3);
      goto LABEL_7;
    }
    v8 = (void (*)(void))NTKMultiInterpolatedColorPalette_noArgumentMethodImplementation;
    v9 = "@@:";
  }
  v10 = class_addMethod((Class)a1, a3, v8, v9);
LABEL_7:
  v11 = v10;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  NTKMultiInterpolatedColorPalette *v4;
  NTKMultiInterpolatedColorPalette *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  unint64_t v33;

  v4 = (NTKMultiInterpolatedColorPalette *)a3;
  v5 = v4;
  if (v4 == self
    || (-[NTKMultiInterpolatedColorPalette palettes](v4, "palettes"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NTKMultiInterpolatedColorPalette palettes](self, "palettes"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v6 == v7))
  {
LABEL_14:
    v31 = 1;
    goto LABEL_17;
  }
  -[NTKMultiInterpolatedColorPalette palettes](v5, "palettes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[NTKMultiInterpolatedColorPalette palettes](self, "palettes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 != objc_msgSend(v10, "count"))
  {

    goto LABEL_16;
  }
  -[NTKMultiInterpolatedColorPalette transitionFractions](self, "transitionFractions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  -[NTKMultiInterpolatedColorPalette transitionFractions](v5, "transitionFractions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v12 != v14)
  {
LABEL_16:
    v31 = 0;
    goto LABEL_17;
  }
  -[NTKMultiInterpolatedColorPalette transitionFractions](self, "transitionFractions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v17 = 0;
    do
    {
      -[NTKMultiInterpolatedColorPalette transitionFractions](self, "transitionFractions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKMultiInterpolatedColorPalette transitionFractions](v5, "transitionFractions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19 != v21)
        goto LABEL_16;
      ++v17;
      -[NTKMultiInterpolatedColorPalette transitionFractions](self, "transitionFractions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

    }
    while (v23 > v17);
  }
  -[NTKMultiInterpolatedColorPalette palettes](self, "palettes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (!v25)
    goto LABEL_14;
  v26 = 0;
  do
  {
    -[NTKMultiInterpolatedColorPalette palettes](self, "palettes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKMultiInterpolatedColorPalette palettes](v5, "palettes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v28, "isEqual:", v30);

    if ((v31 & 1) == 0)
      break;
    ++v26;
    -[NTKMultiInterpolatedColorPalette palettes](self, "palettes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

  }
  while (v33 > v26);
LABEL_17:

  return v31;
}

- (NSArray)transitionFractions
{
  return self->_transitionFractions;
}

- (NSMutableArray)colorInterpolators
{
  return self->_colorInterpolators;
}

- (void)setColorInterpolators:(id)a3
{
  objc_storeStrong((id *)&self->_colorInterpolators, a3);
}

- (NSMutableArray)floatInterpolators
{
  return self->_floatInterpolators;
}

- (void)setFloatInterpolators:(id)a3
{
  objc_storeStrong((id *)&self->_floatInterpolators, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatInterpolators, 0);
  objc_storeStrong((id *)&self->_colorInterpolators, 0);
  objc_storeStrong((id *)&self->_transitionFractions, 0);
  objc_storeStrong((id *)&self->_palettes, 0);
  objc_storeStrong((id *)&self->_paletteIndices, 0);
  objc_storeStrong((id *)&self->_freeAxes, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
