@implementation AVCABackdropLayerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_enumerateDependents:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)-[NSHashTable copy](self->_dependents, "copy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

void __64__AVCABackdropLayerView_updateActiveBackdropEffectIfGroupLeader__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "_isInAWindow") && (objc_msgSend(v3, "isHidden") & 1) == 0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

void __42__AVCABackdropLayerView_colorMatrixFilter__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  _OWORD v4[30];

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)colorMatrixFilter_colorMatrixFilter;
  colorMatrixFilter_colorMatrixFilter = v0;

  CAColorMatrixMakeSaturation();
  CAColorMatrixMakeColorSourceOver();
  CAColorMatrixMakeColorSourceOver();
  memset(&v4[10], 0, 320);
  CAColorMatrixConcat();
  CAColorMatrixConcat();
  v2 = (void *)colorMatrixFilter_colorMatrixFilter;
  memset(v4, 0, 80);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("inputColorMatrix"));

}

uint64_t __35__AVCABackdropLayerView_blurFilter__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)blurFilter_blurFilter;
  blurFilter_blurFilter = v0;

  objc_msgSend((id)blurFilter_blurFilter, "setValue:forKey:", &unk_1E5BF4358, CFSTR("inputRadius"));
  objc_msgSend((id)blurFilter_blurFilter, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdges"));
  objc_msgSend((id)blurFilter_blurFilter, "setValue:forKey:", CFSTR("low"), CFSTR("inputQuality"));
  return objc_msgSend((id)blurFilter_blurFilter, "setValue:forKey:", CFSTR("low"), CFSTR("inputIntermediateBitDepth"));
}

- (void)updateActiveBackdropEffectIfGroupLeader
{
  AVCABackdropLayerView *v3;
  int64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  -[AVCABackdropLayerView groupLeader](self, "groupLeader");
  v3 = (AVCABackdropLayerView *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    v4 = -[AVCABackdropLayerView activeBackdropEffect](self, "activeBackdropEffect");
    if (UIAccessibilityIsReduceTransparencyEnabled())
    {
      v5 = 3;
    }
    else if (-[AVCABackdropLayerView forceLowQualityEffect](self, "forceLowQualityEffect"))
    {
      v5 = 2;
    }
    else
    {
      -[AVCABackdropLayerView dependents](self, "dependents");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7 < 1)
      {
        v5 = 1;
      }
      else
      {
        v10 = 0;
        v11 = &v10;
        v12 = 0x2020000000;
        v13 = 0;
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __64__AVCABackdropLayerView_updateActiveBackdropEffectIfGroupLeader__block_invoke;
        v9[3] = &unk_1E5BB2D58;
        v9[4] = &v10;
        -[AVCABackdropLayerView _enumerateDependents:](self, "_enumerateDependents:", v9);
        v8 = v11[3];
        if (v8)
        {
          if (v8 <= 2 && -[UIView avkit_isInAScrollView](self, "avkit_isInAScrollView"))
            v5 = 2;
          else
            v5 = 1;
        }
        else
        {
          v5 = 0;
        }
        _Block_object_dispose(&v10, 8);
      }
    }
    -[AVCABackdropLayerView setActiveBackdropEffect:](self, "setActiveBackdropEffect:", v5);
    if (v4 != -[AVCABackdropLayerView activeBackdropEffect](self, "activeBackdropEffect"))
      -[AVCABackdropLayerView _updateFilters](self, "_updateFilters");
  }
}

- (void)_updateFilters
{
  void *v3;
  AVCABackdropLayerView *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[3];

  v51[2] = *MEMORY[0x1E0C80C00];
  -[AVCABackdropLayerView groupLeader](self, "groupLeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVCABackdropLayerView groupLeader](self, "groupLeader");
  v4 = (AVCABackdropLayerView *)objc_claimAutoreleasedReturnValue();

  -[AVCABackdropLayerView dependents](self, "dependents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v3)
  {
    -[AVCABackdropLayerView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setGroupName:", 0);

    -[AVCABackdropLayerView layer](self, "layer");
    v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setFilters:", MEMORY[0x1E0C9AA60]);
LABEL_7:

    return;
  }
  if (v4 == self && (v6 || -[AVCABackdropLayerView isCaptureOnly](self, "isCaptureOnly")))
  {
    -[AVCABackdropLayerView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "groupName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "globallyUniqueString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVCABackdropLayerView layer](self, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setGroupName:", v15);

    }
    v17 = -[AVCABackdropLayerView activeBackdropEffect](self, "activeBackdropEffect");
    if ((unint64_t)(v17 - 2) >= 2)
    {
      if (v17 == 1)
      {
        -[AVCABackdropLayerView setHidden:](self, "setHidden:", 0);
        -[AVCABackdropLayerView layer](self, "layer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setEnabled:", 1);

        -[AVCABackdropLayerView layer](self, "layer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setScale:", 0.25);

        +[AVCABackdropLayerView blurFilter](AVCABackdropLayerView, "blurFilter");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = v20;
        +[AVCABackdropLayerView colorMatrixFilter](AVCABackdropLayerView, "colorMatrixFilter");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v51[1] = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVCABackdropLayerView layer](self, "layer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setFilters:", v26);

        goto LABEL_19;
      }
      if (v17)
      {
LABEL_20:
        -[AVCABackdropLayerView setBackgroundColor:](self, "setBackgroundColor:", 0);
        -[AVCABackdropLayerView _enumerateDependents:](self, "_enumerateDependents:", &__block_literal_global_29_14721);
        return;
      }
    }
    -[AVCABackdropLayerView setHidden:](self, "setHidden:", -[AVCABackdropLayerView isCaptureOnly](self, "isCaptureOnly"));
    -[AVCABackdropLayerView layer](self, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setEnabled:", 0);

    -[AVCABackdropLayerView layer](self, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setScale:", 0.0);

    -[AVCABackdropLayerView layer](self, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFilters:", MEMORY[0x1E0C9AA60]);
LABEL_19:

    goto LABEL_20;
  }
  -[AVCABackdropLayerView customBackgroundColor](self, "customBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AVCABackdropLayerView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGroupName:", 0);

    -[AVCABackdropLayerView setActiveBackdropEffect:](self, "setActiveBackdropEffect:", 0);
    -[AVCABackdropLayerView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", 0);

    -[AVCABackdropLayerView customBackgroundColor](self, "customBackgroundColor");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    -[AVCABackdropLayerView setBackgroundColor:](self, "setBackgroundColor:", v10);
    goto LABEL_7;
  }
  -[AVCABackdropLayerView groupLeader](self, "groupLeader");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVCABackdropLayerView setActiveBackdropEffect:](self, "setActiveBackdropEffect:", objc_msgSend(v21, "activeBackdropEffect"));

  switch(-[AVCABackdropLayerView activeBackdropEffect](self, "activeBackdropEffect"))
  {
    case 0:
      -[AVCABackdropLayerView setBackgroundColor:](self, "setBackgroundColor:", 0);
      -[AVCABackdropLayerView layer](self, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setGroupName:", 0);

      -[AVCABackdropLayerView layer](self, "layer");
      v48 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setEnabled:", 0);
      goto LABEL_7;
    case 1:
      -[AVCABackdropLayerView setBackgroundColor:](self, "setBackgroundColor:", 0);
      -[AVCABackdropLayerView groupLeader](self, "groupLeader");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "layer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "groupName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVCABackdropLayerView layer](self, "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setGroupName:", v30);

      if (v4 == self)
      {
        +[AVCABackdropLayerView blurFilter](AVCABackdropLayerView, "blurFilter");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = v28;
        +[AVCABackdropLayerView colorMatrixFilter](AVCABackdropLayerView, "colorMatrixFilter");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v49[1] = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[AVCABackdropLayerView groupLeader](self, "groupLeader");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "layer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "filters");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[AVCABackdropLayerView layer](self, "layer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setFilters:", v32);

      if (v4 == self)
      {

        v45 = 0.25;
      }
      else
      {

        -[AVCABackdropLayerView groupLeader](self, "groupLeader");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "layer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "scale");
        v45 = v44;
      }
      -[AVCABackdropLayerView layer](self, "layer");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setScale:", v45);

      if (v4 != self)
      {

      }
      -[AVCABackdropLayerView layer](self, "layer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setEnabled:", 1);

      break;
    case 2:
      -[AVCABackdropLayerView setBackgroundColor:](self, "setBackgroundColor:", 0);
      -[AVCABackdropLayerView layer](self, "layer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setGroupName:", 0);

      -[AVCABackdropLayerView layer](self, "layer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setEnabled:", 1);

      -[AVCABackdropLayerView layer](self, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setScale:", 0.25);

      +[AVCABackdropLayerView averageFilter](AVCABackdropLayerView, "averageFilter");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v36;
      +[AVCABackdropLayerView colorMatrixFilter](AVCABackdropLayerView, "colorMatrixFilter");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVCABackdropLayerView layer](self, "layer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setFilters:", v38);

      break;
    case 3:
      -[AVCABackdropLayerView layer](self, "layer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setGroupName:", 0);

      -[AVCABackdropLayerView layer](self, "layer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setEnabled:", 0);

      -[AVCABackdropLayerView layer](self, "layer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setFilters:", MEMORY[0x1E0C9AA60]);

      +[AVCABackdropLayerView reducedTransparencyColor](AVCABackdropLayerView, "reducedTransparencyColor");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    default:
      return;
  }
}

- (AVCABackdropLayerView)groupLeader
{
  return (AVCABackdropLayerView *)objc_loadWeakRetained((id *)&self->_groupLeader);
}

- (int64_t)activeBackdropEffect
{
  return self->_activeBackdropEffect;
}

- (NSHashTable)dependents
{
  return self->_dependents;
}

- (void)setActiveBackdropEffect:(int64_t)a3
{
  self->_activeBackdropEffect = a3;
}

- (UIColor)customBackgroundColor
{
  return self->_customBackgroundColor;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCABackdropLayerView;
  -[AVCABackdropLayerView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[AVCABackdropLayerView updateGroupLeader](self, "updateGroupLeader");
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCABackdropLayerView;
  -[AVCABackdropLayerView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[AVCABackdropLayerView updateGroupLeader](self, "updateGroupLeader");
}

- (void)updateGroupLeader
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[UIView avkit_backdropGroupLeader](self, "avkit_backdropGroupLeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVCABackdropLayerView setGroupLeader:](self, "setGroupLeader:", v3);

  -[AVCABackdropLayerView window](self, "window");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[AVCABackdropLayerView groupLeader](self, "groupLeader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      -[AVCABackdropLayerView setGroupLeader:](self, "setGroupLeader:", self);
  }
}

- (void)setGroupLeader:(id)a3
{
  AVCABackdropLayerView *WeakRetained;
  AVCABackdropLayerView *v5;
  AVCABackdropLayerView *v6;
  _BOOL4 v7;
  id v8;
  id v9;
  void *v10;
  AVCABackdropLayerView *obj;

  obj = (AVCABackdropLayerView *)a3;
  WeakRetained = (AVCABackdropLayerView *)objc_loadWeakRetained((id *)&self->_groupLeader);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = (AVCABackdropLayerView *)objc_loadWeakRetained((id *)&self->_groupLeader);
    v7 = v6 != self;

    v8 = objc_loadWeakRetained((id *)&self->_groupLeader);
    objc_msgSend(v8, "removeDependent:", self);

    v9 = objc_storeWeak((id *)&self->_groupLeader, obj);
    -[AVCABackdropLayerView addDependent:](obj, "addDependent:", self);

    if ((((obj == self) ^ v7) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (obj == self)
      {
        objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_updateActiveBackdropEffectIfGroupLeader, *MEMORY[0x1E0DC45B8], 0);

        -[AVCABackdropLayerView updateActiveBackdropEffectIfGroupLeader](self, "updateActiveBackdropEffectIfGroupLeader");
      }
      else
      {
        objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0DC45B8], 0);

      }
    }
    -[AVCABackdropLayerView _updateFilters](self, "_updateFilters");
    v5 = obj;
  }

}

- (void)addDependent:(id)a3
{
  AVCABackdropLayerView *v4;
  AVCABackdropLayerView *v5;
  void *v6;
  AVCABackdropLayerView *v7;

  v4 = (AVCABackdropLayerView *)a3;
  if (v4 != self)
  {
    v7 = v4;
    -[AVCABackdropLayerView groupLeader](self, "groupLeader");
    v5 = (AVCABackdropLayerView *)objc_claimAutoreleasedReturnValue();

    if (v5 == self)
    {
      -[AVCABackdropLayerView _ensureDependents](self, "_ensureDependents");
      -[AVCABackdropLayerView dependents](self, "dependents");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);
    }
    else
    {
      -[AVCABackdropLayerView groupLeader](self, "groupLeader");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addDependent:", v7);
    }

    v4 = v7;
  }

}

- (BOOL)isCaptureOnly
{
  void *v2;
  char v3;

  -[AVCABackdropLayerView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "captureOnly");

  return v3;
}

+ (id)colorMatrixFilter
{
  if (colorMatrixFilter_onceToken != -1)
    dispatch_once(&colorMatrixFilter_onceToken, &__block_literal_global_12_14737);
  return (id)colorMatrixFilter_colorMatrixFilter;
}

+ (id)blurFilter
{
  if (blurFilter_onceToken != -1)
    dispatch_once(&blurFilter_onceToken, &__block_literal_global_14743);
  return (id)blurFilter_blurFilter;
}

- (BOOL)forceLowQualityEffect
{
  return self->_forceLowQualityEffect;
}

- (void)_ensureDependents
{
  NSHashTable *v3;
  NSHashTable *dependents;

  if (!self->_dependents)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    dependents = self->_dependents;
    self->_dependents = v3;

  }
}

- (void)setCaptureOnly:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AVCABackdropLayerView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaptureOnly:", v3);

}

- (AVCABackdropLayerView)initWithFrame:(CGRect)a3
{
  AVCABackdropLayerView *v3;
  AVCABackdropLayerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVCABackdropLayerView;
  v3 = -[AVCABackdropLayerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AVCABackdropLayerView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  return v4;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)setCustomBackgroundColor:(id)a3
{
  UIColor *v4;
  UIColor *customBackgroundColor;

  v4 = (UIColor *)objc_msgSend(a3, "copy");
  customBackgroundColor = self->_customBackgroundColor;
  self->_customBackgroundColor = v4;

  -[AVCABackdropLayerView _updateFilters](self, "_updateFilters");
}

- (void)removeDependent:(id)a3
{
  AVCABackdropLayerView *v4;
  AVCABackdropLayerView *v5;
  void *v6;
  AVCABackdropLayerView *v7;

  v4 = (AVCABackdropLayerView *)a3;
  if (v4 != self)
  {
    v7 = v4;
    -[AVCABackdropLayerView groupLeader](self, "groupLeader");
    v5 = (AVCABackdropLayerView *)objc_claimAutoreleasedReturnValue();

    if (v5 == self)
    {
      -[AVCABackdropLayerView _ensureDependents](self, "_ensureDependents");
      -[AVCABackdropLayerView dependents](self, "dependents");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", v7);
    }
    else
    {
      -[AVCABackdropLayerView groupLeader](self, "groupLeader");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeDependent:", v7);
    }

    v4 = v7;
  }

}

- (void)setForceLowQualityEffect:(BOOL)a3
{
  self->_forceLowQualityEffect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependents, 0);
  objc_destroyWeak((id *)&self->_groupLeader);
  objc_storeStrong((id *)&self->_customBackgroundColor, 0);
}

uint64_t __39__AVCABackdropLayerView__updateFilters__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateFilters");
}

+ (id)averageFilter
{
  if (averageFilter_onceToken != -1)
    dispatch_once(&averageFilter_onceToken, &__block_literal_global_11_14742);
  return (id)averageFilter_averageFilter;
}

+ (id)reducedTransparencyColor
{
  if (reducedTransparencyColor_onceToken != -1)
    dispatch_once(&reducedTransparencyColor_onceToken, &__block_literal_global_16_14735);
  return (id)reducedTransparencyColor_reducedTransparencyColor;
}

void __49__AVCABackdropLayerView_reducedTransparencyColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.168627451, 0.180392157, 0.188235294, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reducedTransparencyColor_reducedTransparencyColor;
  reducedTransparencyColor_reducedTransparencyColor = v0;

}

void __38__AVCABackdropLayerView_averageFilter__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2B88]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)averageFilter_averageFilter;
  averageFilter_averageFilter = v0;

}

@end
