@implementation GKNoise

- (GKNoise)init
{
  void *v3;
  GKNoise *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[GKNoise initWithNoiseSource:](self, "initWithNoiseSource:", v3);

  return v4;
}

+ (GKNoise)noiseWithNoiseSource:(GKNoiseSource *)noiseSource
{
  GKNoiseSource *v3;
  void *v4;

  v3 = noiseSource;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNoiseSource:", v3);

  return (GKNoise *)v4;
}

+ (GKNoise)noiseWithNoiseSource:(GKNoiseSource *)noiseSource gradientColors:(NSDictionary *)gradientColors
{
  GKNoiseSource *v5;
  NSDictionary *v6;
  void *v7;

  v5 = noiseSource;
  v6 = gradientColors;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNoiseSource:gradientColors:", v5, v6);

  return (GKNoise *)v7;
}

- (GKNoise)initWithNoiseSource:(GKNoiseSource *)noiseSource
{
  GKNoiseSource *v4;
  unsigned __int8 v5;
  GKNoise *v6;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v4 = noiseSource;
  v5 = atomic_load((unsigned __int8 *)&qword_25591E728);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_25591E728))
  {
    v10[0] = &unk_24F0592B8;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = &unk_24F0592C8;
    v11[0] = v8;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    _MergedGlobals_0 = objc_claimAutoreleasedReturnValue();

    __cxa_guard_release(&qword_25591E728);
  }
  v6 = -[GKNoise initWithNoiseSource:gradientColors:](self, "initWithNoiseSource:gradientColors:", v4, _MergedGlobals_0);

  return v6;
}

- (GKNoise)initWithNoiseSource:(GKNoiseSource *)noiseSource gradientColors:(NSDictionary *)gradientColors
{
  GKNoiseSource *v6;
  NSDictionary *v7;
  GKNoise *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *modules;
  objc_super v13;

  v6 = noiseSource;
  v7 = gradientColors;
  v13.receiver = self;
  v13.super_class = (Class)GKNoise;
  v8 = -[GKNoise init](&v13, sel_init);
  if (v8)
  {
    -[GKNoiseSource cloneModule](v6, "cloneModule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    modules = v8->_modules;
    v8->_modules = v10;

    -[NSMutableArray addObject:](v8->_modules, "addObject:", v9);
    -[GKNoise setGradientColors:](v8, "setGradientColors:", v7);

  }
  return v8;
}

+ (GKNoise)noiseWithComponentNoises:(NSArray *)noises selectionNoise:(GKNoise *)selectionNoise
{
  NSArray *v5;
  GKNoise *v6;
  unint64_t v7;
  id v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;

  v5 = noises;
  v6 = selectionNoise;
  v7 = -[NSArray count](v5, "count");
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v7 != 1)
  {
    for (i = 1; i != v7; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)i * (1.0 / (double)v7 + 1.0 / (double)v7) + -1.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v11);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v12);

    }
  }
  objc_msgSend((id)objc_opt_class(), "noiseWithComponentNoises:selectionNoise:componentBoundaries:boundaryBlendDistances:", v5, v6, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (GKNoise *)v13;
}

+ (GKNoise)noiseWithComponentNoises:(NSArray *)noises selectionNoise:(GKNoise *)selectionNoise componentBoundaries:(NSArray *)componentBoundaries boundaryBlendDistances:(NSArray *)blendDistances
{
  NSArray *v9;
  GKNoise *v10;
  unint64_t v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  uint64_t v47;
  void *v48;
  void *v49;
  double v50;
  BOOL v51;
  double v52;
  void *v53;
  uint64_t i;
  void *v55;
  void *v56;
  double v57;
  BOOL v58;
  double v59;
  void *v60;
  unint64_t j;
  void *v62;
  void *v63;
  double v64;
  BOOL v65;
  double v66;
  void *v67;
  GKNoise *v69;
  id v70;
  NSArray *v71;
  NSArray *v72;
  id v73;
  NSArray *v74;
  unint64_t v75;

  v9 = noises;
  v10 = selectionNoise;
  v74 = componentBoundaries;
  v72 = blendDistances;
  v75 = -[NSArray count](v9, "count");
  if (v75)
  {
    v11 = 0;
    v12 = -1.0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 1.0;
      if (v11 < v75 - 1)
      {
        -[NSArray objectAtIndexedSubscript:](v74, "objectAtIndexedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v14 = v16;

      }
      +[GKConstantNoiseSource constantNoiseWithValue:](GKConstantNoiseSource, "constantNoiseWithValue:", (v14 - v12) * 0.5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[GKNoise noiseWithNoiseSource:](GKNoise, "noiseWithNoiseSource:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "multiplyWithNoise:", v18);

      +[GKConstantNoiseSource constantNoiseWithValue:](GKConstantNoiseSource, "constantNoiseWithValue:", (v14 + v12) * 0.5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[GKNoise noiseWithNoiseSource:](GKNoise, "noiseWithNoiseSource:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addWithNoise:", v20);

      ++v11;
      v12 = v14;
    }
    while (v75 != v11);
  }
  -[NSArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v21;
  if (v75 >= 2)
  {
    v22 = 1;
    do
    {
      -[NSArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v22 - 1;
      -[NSArray objectAtIndexedSubscript:](v74, "objectAtIndexedSubscript:", v22 - 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      v27 = v26;
      -[NSArray objectAtIndexedSubscript:](v72, "objectAtIndexedSubscript:", v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      objc_msgSend(v21, "__blendWithNoise:selectionNoise:selectionRangeLowerBound:selectionRangeUpperBound:selectionBoundaryBlendDistance:", v23, v10, v27, 1.79769313e308, v29);

      v22 = v24 + 2;
    }
    while (v24 + 2 != v75);
  }
  v69 = v10;
  v30 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v71 = v9;
  v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v32 = v31;
  if (v75)
  {
    v33 = 0;
    v73 = v31;
    do
    {
      -[NSArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "gradientColors");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v35);

      ++v33;
    }
    while (v75 != v33);
    v36 = 0;
    v37 = v75 - 1;
    v38 = -1.0;
    do
    {
      v39 = v38;
      objc_msgSend(v32, "objectAtIndexedSubscript:", v36);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");
      v38 = 1.0;
      if (v36 < v37)
      {
        -[NSArray objectAtIndexedSubscript:](v74, "objectAtIndexedSubscript:", v36);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "doubleValue");
        v38 = v43;

      }
      objc_msgSend(v40, "allKeys");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "sortedArrayUsingComparator:", &__block_literal_global_2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = v38 - v39;
      v47 = v41 - 1;
      if (v36)
      {
        if (objc_msgSend(v45, "count"))
        {
          objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "doubleValue");
          v51 = v41 != 1 || v36 >= v37;
          v52 = v39 + (v50 * 0.5 + 0.5) * v46;
          if (v51)
            v52 = v52 + 2.22044605e-16;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKey:", v49, v53);

          for (i = 2; i - 1 < (unint64_t)objc_msgSend(v45, "count"); ++i)
          {
            objc_msgSend(v45, "objectAtIndexedSubscript:");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "objectForKeyedSubscript:", v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "doubleValue");
            v58 = v41 != i || v36 >= v37;
            v59 = v39 + (v57 * 0.5 + 0.5) * v46;
            if (!v58)
              v59 = v59 + -2.22044605e-16;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKey:", v56, v60);

          }
        }
      }
      else
      {
        for (j = 0; j < objc_msgSend(v45, "count"); ++j)
        {
          objc_msgSend(v45, "objectAtIndexedSubscript:", j);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "doubleValue");
          v65 = v47 != j || v75 == 1;
          v66 = v39 + (v64 * 0.5 + 0.5) * v46;
          if (!v65)
            v66 = v66 + -2.22044605e-16;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKey:", v63, v67);

        }
      }

      ++v36;
      v32 = v73;
    }
    while (v36 != v75);
  }
  if (objc_msgSend(v30, "count"))
    objc_msgSend(v70, "setGradientColors:", v30);

  return (GKNoise *)v70;
}

uint64_t __94__GKNoise_noiseWithComponentNoises_selectionNoise_componentBoundaries_boundaryBlendDistances___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "doubleValue");
  v7 = v6;
  objc_msgSend(v5, "doubleValue");
  if (v7 <= v8)
  {
    objc_msgSend(v4, "doubleValue");
    v11 = v10;
    objc_msgSend(v5, "doubleValue");
    if (v11 >= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (float)valueAtPosition:(vector_float2)position
{
  void *v3;
  __int128 v4;
  double v5;
  float v6;
  float v7;
  _OWORD v10[2];

  -[NSMutableArray lastObject](self->_modules, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)&v4 = position.f32[1];
  v10[0] = COERCE_UNSIGNED_INT64(position.f32[0]);
  v10[1] = v4;
  objc_msgSend(v3, "valueAt:", v10);
  v6 = v5;
  v7 = -1.0;
  if (v6 >= -1.0)
  {
    v7 = v6;
    if (v6 > 1.0)
      v7 = 1.0;
  }

  return v7;
}

- (void)dealloc
{
  NSMutableArray *modules;
  objc_super v4;

  -[NSMutableArray removeAllObjects](self->_modules, "removeAllObjects");
  modules = self->_modules;
  self->_modules = 0;

  v4.receiver = self;
  v4.super_class = (Class)GKNoise;
  -[GKNoise dealloc](&v4, sel_dealloc);
}

- (id)__modules
{
  return self->_modules;
}

- (void)cacheUnaryModule:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableArray lastObject](self->_modules, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputModule:atIndex:", v4, 0);

  -[NSMutableArray addObject:](self->_modules, "addObject:", v5);
}

- (void)cacheBinaryModule:(id)a3 rhsNoise:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[NSMutableArray lastObject](self->_modules, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInputModule:atIndex:", v7, 0);

  objc_msgSend(v6, "__modules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[GKNoise cloneRecursive:](self, "cloneRecursive:", v9);
  -[NSMutableArray lastObject](self->_modules, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInputModule:atIndex:", v11, 1);

  -[NSMutableArray addObject:](self->_modules, "addObject:", v12);
}

- (void)cacheTernaryModule:(id)a3 rhsNoise:(id)a4 selectionNoise:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  -[NSMutableArray lastObject](self->_modules, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setInputModule:atIndex:", v10, 0);

  objc_msgSend(v8, "__modules");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[GKNoise cloneRecursive:](self, "cloneRecursive:", v12);
  -[NSMutableArray lastObject](self->_modules, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setInputModule:atIndex:", v14, 1);

  objc_msgSend(v9, "__modules");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[GKNoise cloneRecursive:](self, "cloneRecursive:", v16);
  -[NSMutableArray lastObject](self->_modules, "lastObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setInputModule:atIndex:", v18, 2);

  -[NSMutableArray addObject:](self->_modules, "addObject:", v19);
}

- (void)cacheQuaternaryModule:(id)a3 xDisplacementNoise:(id)a4 yDisplacementNoise:(id)a5 zDisplacementNoise:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[NSMutableArray lastObject](self->_modules, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setInputModule:atIndex:", v13, 0);

  if (!v10)
  {
    +[GKConstantNoiseSource constantNoiseWithValue:](GKConstantNoiseSource, "constantNoiseWithValue:", 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKNoise noiseWithNoiseSource:](GKNoise, "noiseWithNoiseSource:", v14);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "__modules");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[GKNoise cloneRecursive:](self, "cloneRecursive:", v15);
  -[NSMutableArray lastObject](self->_modules, "lastObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setInputModule:atIndex:", v17, 1);

  if (!v11)
  {
    +[GKConstantNoiseSource constantNoiseWithValue:](GKConstantNoiseSource, "constantNoiseWithValue:", 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKNoise noiseWithNoiseSource:](GKNoise, "noiseWithNoiseSource:", v18);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v11, "__modules");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[GKNoise cloneRecursive:](self, "cloneRecursive:", v20);
  -[NSMutableArray lastObject](self->_modules, "lastObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setInputModule:atIndex:", v22, 2);

  if (!v12)
  {
    +[GKConstantNoiseSource constantNoiseWithValue:](GKConstantNoiseSource, "constantNoiseWithValue:", 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKNoise noiseWithNoiseSource:](GKNoise, "noiseWithNoiseSource:", v23);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v12, "__modules");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[GKNoise cloneRecursive:](self, "cloneRecursive:", v25);
  -[NSMutableArray lastObject](self->_modules, "lastObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setInputModule:atIndex:", v27, 3);

  -[NSMutableArray addObject:](self->_modules, "addObject:", v29);
}

- (id)cloneRecursive:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "cloneModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "requiredInputModuleCount");
  if (v6 >= 1)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v4, "inputModuleAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKNoise cloneRecursive:](self, "cloneRecursive:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setInputModule:atIndex:", v9, v7);

      v7 = (v7 + 1);
    }
    while (v6 != (_DWORD)v7);
  }
  -[NSMutableArray addObject:](self->_modules, "addObject:", v5);

  return v5;
}

- (void)applyAbsoluteValue
{
  GKAbsoluteValueNoiseModifier *v3;

  v3 = objc_alloc_init(GKAbsoluteValueNoiseModifier);
  -[GKNoise cacheUnaryModule:](self, "cacheUnaryModule:");

}

- (void)clampWithLowerBound:(double)lowerBound upperBound:(double)upperBound
{
  GKClampNoiseModifier *v5;

  v5 = -[GKClampNoiseModifier initWithLowerBound:upperBound:]([GKClampNoiseModifier alloc], "initWithLowerBound:upperBound:", lowerBound, upperBound);
  -[GKNoise cacheUnaryModule:](self, "cacheUnaryModule:");

}

- (void)raiseToPower:(double)power
{
  GKConstantPowerNoiseModifier *v4;

  v4 = -[GKConstantPowerNoiseModifier initWithConstantPower:]([GKConstantPowerNoiseModifier alloc], "initWithConstantPower:", power);
  -[GKNoise cacheUnaryModule:](self, "cacheUnaryModule:");

}

- (void)invert
{
  GKInvertNoiseModifier *v3;

  v3 = objc_alloc_init(GKInvertNoiseModifier);
  -[GKNoise cacheUnaryModule:](self, "cacheUnaryModule:");

}

- (void)applyTurbulenceWithFrequency:(double)frequency power:(double)power roughness:(int)roughness seed:(int32_t)seed
{
  GKTurbulenceNoiseModifier *v7;

  v7 = -[GKTurbulenceNoiseModifier initWithFrequency:power:roughness:seed:]([GKTurbulenceNoiseModifier alloc], "initWithFrequency:power:roughness:seed:", *(_QWORD *)&seed, frequency, power, (double)roughness);
  -[GKNoise cacheUnaryModule:](self, "cacheUnaryModule:");

}

- (void)remapValuesToCurveWithControlPoints:(NSDictionary *)controlPoints
{
  GKCurveNoiseModifier *v4;
  NSDictionary *v5;

  v5 = controlPoints;
  v4 = -[GKCurveNoiseModifier initWithControlPoints:]([GKCurveNoiseModifier alloc], "initWithControlPoints:", v5);
  -[GKNoise cacheUnaryModule:](self, "cacheUnaryModule:", v4);

}

- (void)remapValuesToTerracesWithPeaks:(NSArray *)peakInputValues terracesInverted:(BOOL)inverted
{
  _BOOL8 v4;
  GKTerraceNoiseModifier *v6;
  NSArray *v7;

  v4 = inverted;
  v7 = peakInputValues;
  -[NSArray count](v7, "count");
  v6 = -[GKTerraceNoiseModifier initWithPeakInputValues:terracesInverted:]([GKTerraceNoiseModifier alloc], "initWithPeakInputValues:terracesInverted:", v7, v4);
  -[GKNoise cacheUnaryModule:](self, "cacheUnaryModule:", v6);

}

- (void)moveBy:(_OWORD *)a3
{
  GKMoveNoiseModifier *v4;
  __int128 v5;
  _OWORD v6[2];

  v5 = a3[1];
  v6[0] = *a3;
  v6[1] = v5;
  v4 = -[GKMoveNoiseModifier initWithDelta:]([GKMoveNoiseModifier alloc], "initWithDelta:", v6);
  objc_msgSend(a1, "cacheUnaryModule:", v4);

}

- (void)scaleBy:(_OWORD *)a3
{
  GKScaleNoiseModifier *v4;
  __int128 v5;
  _OWORD v6[2];

  v5 = a3[1];
  v6[0] = *a3;
  v6[1] = v5;
  v4 = -[GKScaleNoiseModifier initWithFactor:]([GKScaleNoiseModifier alloc], "initWithFactor:", v6);
  objc_msgSend(a1, "cacheUnaryModule:", v4);

}

- (void)rotateBy:(_OWORD *)a3
{
  GKRotateNoiseModifier *v4;
  __int128 v5;
  _OWORD v6[2];

  v5 = a3[1];
  v6[0] = *a3;
  v6[1] = v5;
  v4 = -[GKRotateNoiseModifier initWithRadians:]([GKRotateNoiseModifier alloc], "initWithRadians:", v6);
  objc_msgSend(a1, "cacheUnaryModule:", v4);

}

- (void)addWithNoise:(GKNoise *)noise
{
  GKAddNoiseModifier *v4;
  GKNoise *v5;

  v5 = noise;
  v4 = objc_alloc_init(GKAddNoiseModifier);
  -[GKNoise cacheBinaryModule:rhsNoise:](self, "cacheBinaryModule:rhsNoise:", v4, v5);

}

- (void)multiplyWithNoise:(GKNoise *)noise
{
  GKMultiplyNoiseModifier *v4;
  GKNoise *v5;

  v5 = noise;
  v4 = objc_alloc_init(GKMultiplyNoiseModifier);
  -[GKNoise cacheBinaryModule:rhsNoise:](self, "cacheBinaryModule:rhsNoise:", v4, v5);

}

- (void)minimumWithNoise:(GKNoise *)noise
{
  GKMinimumNoiseModifier *v4;
  GKNoise *v5;

  v5 = noise;
  v4 = objc_alloc_init(GKMinimumNoiseModifier);
  -[GKNoise cacheBinaryModule:rhsNoise:](self, "cacheBinaryModule:rhsNoise:", v4, v5);

}

- (void)maximumWithNoise:(GKNoise *)noise
{
  GKMaximumNoiseModifier *v4;
  GKNoise *v5;

  v5 = noise;
  v4 = objc_alloc_init(GKMaximumNoiseModifier);
  -[GKNoise cacheBinaryModule:rhsNoise:](self, "cacheBinaryModule:rhsNoise:", v4, v5);

}

- (void)raiseToPowerWithNoise:(GKNoise *)noise
{
  GKPowerNoiseModifier *v4;
  GKNoise *v5;

  v5 = noise;
  v4 = objc_alloc_init(GKPowerNoiseModifier);
  -[GKNoise cacheBinaryModule:rhsNoise:](self, "cacheBinaryModule:rhsNoise:", v4, v5);

}

- (void)displaceXWithNoise:(GKNoise *)xDisplacementNoise yWithNoise:(GKNoise *)yDisplacementNoise zWithNoise:(GKNoise *)zDisplacementNoise
{
  GKNoise *v8;
  GKNoise *v9;
  GKDisplaceNoiseModifier *v10;
  GKNoise *v11;

  v11 = xDisplacementNoise;
  v8 = yDisplacementNoise;
  v9 = zDisplacementNoise;
  v10 = objc_alloc_init(GKDisplaceNoiseModifier);
  -[GKNoise cacheQuaternaryModule:xDisplacementNoise:yDisplacementNoise:zDisplacementNoise:](self, "cacheQuaternaryModule:xDisplacementNoise:yDisplacementNoise:zDisplacementNoise:", v10, v11, v8, v9);

}

- (void)__blendWithNoise:(id)a3 selectionNoise:(id)a4 selectionRangeLowerBound:(double)a5 selectionRangeUpperBound:(double)a6 selectionBoundaryBlendDistance:(double)a7
{
  id v12;
  GKBlendNoiseModifier *v13;
  id v14;

  v14 = a3;
  v12 = a4;
  v13 = -[GKBlendNoiseModifier initWithSelectionRangeLowerBound:selectionRangeUpperBound:selectionBoundaryBlendDistance:]([GKBlendNoiseModifier alloc], "initWithSelectionRangeLowerBound:selectionRangeUpperBound:selectionBoundaryBlendDistance:", a5, a6, a7);
  -[GKNoise cacheTernaryModule:rhsNoise:selectionNoise:](self, "cacheTernaryModule:rhsNoise:selectionNoise:", v13, v14, v12);

}

- (NSDictionary)gradientColors
{
  return self->_gradientColors;
}

- (void)setGradientColors:(NSDictionary *)gradientColors
{
  objc_setProperty_nonatomic_copy(self, a2, gradientColors, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientColors, 0);
  objc_storeStrong((id *)&self->_modules, 0);
}

@end
