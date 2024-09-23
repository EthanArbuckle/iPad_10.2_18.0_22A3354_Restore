@implementation AVCaptureSystemStylePicker

+ (void)initialize
{
  objc_opt_class();
}

- (AVCaptureSystemStylePicker)initWithSession:(id)a3
{
  return -[AVCaptureSystemStylePicker initWithSession:styles:action:](self, "initWithSession:styles:action:", a3, -[AVCaptureSystemStylePicker _automaticStylesWithSystemSmartStyle:](self, "_automaticStylesWithSystemSmartStyle:", objc_msgSend(a3, "systemSmartStyle")), 0);
}

- (AVCaptureSystemStylePicker)initWithSession:(id)a3 action:(id)a4
{
  return -[AVCaptureSystemStylePicker initWithSession:styles:action:](self, "initWithSession:styles:action:", a3, -[AVCaptureSystemStylePicker _automaticStylesWithSystemSmartStyle:](self, "_automaticStylesWithSystemSmartStyle:", objc_msgSend(a3, "systemSmartStyle")), a4);
}

- (AVCaptureSystemStylePicker)initWithSession:(id)a3 styles:(id)a4 action:(id)a5
{
  AVCaptureSystemStylePicker *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  _QWORD v24[15];
  _QWORD v25[17];

  v25[15] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)AVCaptureSystemStylePicker;
  v8 = -[AVCaptureControl initSubclass](&v22, sel_initSubclass);
  if (v8)
  {
    v17 = a3;
    v8->_sessionReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", a3);
    v8->_styles = (NSArray *)objc_msgSend(a4, "copy");
    v8->_action = (id)objc_msgSend(a5, "copy");
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AVFCapture"));
    v24[0] = AVSmartStyleCastTypeStandard[0];
    v24[1] = AVSmartStyleCastTypeTanWarm[0];
    v25[0] = CFSTR("SMART_STYLE_STANDARD");
    v25[1] = CFSTR("SMART_STYLE_TAN_WARM");
    v24[2] = AVSmartStyleCastTypeBlushWarm[0];
    v24[3] = AVSmartStyleCastTypeGoldWarm[0];
    v25[2] = CFSTR("SMART_STYLE_BLUSH_WARM");
    v25[3] = CFSTR("SMART_STYLE_GOLD_WARM");
    v24[4] = AVSmartStyleCastTypeCool[0];
    v24[5] = AVSmartStyleCastTypeNeutral[0];
    v25[4] = CFSTR("SMART_STYLE_COOL");
    v25[5] = CFSTR("SMART_STYLE_NEUTRAL");
    v24[6] = AVSmartStyleCastTypeNoFilter[0];
    v24[7] = AVSmartStyleCastTypeWarmAuthentic[0];
    v25[6] = CFSTR("SMART_STYLE_NO_FILTER");
    v25[7] = CFSTR("SMART_STYLE_WARM_AUTHENTIC");
    v24[8] = AVSmartStyleCastTypeStarkBW[0];
    v24[9] = AVSmartStyleCastTypeColorful[0];
    v25[8] = CFSTR("SMART_STYLE_STARK_BW");
    v25[9] = CFSTR("SMART_STYLE_KALEIDOSCOPE");
    v24[10] = AVSmartStyleCastTypeDreamyHues[0];
    v24[11] = AVSmartStyleCastTypeUrbanCool[0];
    v25[10] = CFSTR("SMART_STYLE_DREAMY_HUES");
    v25[11] = CFSTR("SMART_STYLE_URBAN_COOL");
    v24[12] = AVSmartStyleCastTypeEarthy[0];
    v24[13] = AVSmartStyleCastTypeCloudCover[0];
    v25[12] = CFSTR("SMART_STYLE_EARTHY");
    v25[13] = CFSTR("SMART_STYLE_CLOUD_COVER");
    v24[14] = AVSmartStyleCastTypeLongGray;
    v25[14] = CFSTR("SMART_STYLE_LONG_GRAY");
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 15);
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(a4);
          objc_msgSend(v11, "addObject:", objc_msgSend(v9, "localizedStringForKey:value:table:", objc_msgSend(v10, "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15++), "cast")), &stru_1E421DB28, CFSTR("AVCaptureSystemStylePicker")));
        }
        while (v13 != v15);
        v13 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v13);
    }
    v8->_titles = (NSArray *)objc_msgSend(v11, "copy");
    v8->_selectedStyleLock._os_unfair_lock_opaque = 0;
    v8->_selectedStyle = (AVCaptureSmartStyle *)(id)objc_msgSend(v17, "activeSmartStyle");
    v8->_actionLock._os_unfair_lock_opaque = 0;
    v8->_changeSmartStyleInProcess = 1;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  os_unfair_lock_lock(&self->_actionLock);
  os_unfair_lock_unlock(&self->_actionLock);
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSystemStylePicker;
  -[AVCaptureControl dealloc](&v3, sel_dealloc);
}

- (id)_automaticStylesWithSystemSmartStyle:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  AVCaptureSmartStyle *v12;
  double v13;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[8];

  v22[6] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v22[0] = AVSmartStyleCastTypeStandard[0];
  v22[1] = AVSmartStyleCastTypeNeutral[0];
  v22[2] = AVSmartStyleCastTypeBlushWarm[0];
  v22[3] = AVSmartStyleCastTypeGoldWarm[0];
  v22[4] = AVSmartStyleCastTypeTanWarm[0];
  v22[5] = AVSmartStyleCastTypeCool[0];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 6, 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (!a3
          || (v11 = objc_msgSend(v10, "isEqualToString:", objc_msgSend(a3, "cast")),
              v12 = (AVCaptureSmartStyle *)a3,
              (v11 & 1) == 0))
        {
          if (objc_msgSend(v10, "isEqualToString:", AVSmartStyleCastTypeStandard[0]))
            *(float *)&v13 = 0.0;
          else
            *(float *)&v13 = 1.0;
          LODWORD(v14) = 0;
          LODWORD(v15) = 0;
          v12 = +[AVCaptureSmartStyle styleWithCast:intensity:toneBias:colorBias:](AVCaptureSmartStyle, "styleWithCast:intensity:toneBias:colorBias:", v10, v13, v14, v15);
        }
        objc_msgSend(v4, "addObject:", v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  return (id)objc_msgSend(v4, "copy");
}

- (id)overlayControl
{
  os_unfair_lock_s *p_actionLock;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  if (!self->_overlayControl)
  {
    AVCaptureBundleIdentifier();
    self->_overlayControl = (CAMOverlayServicePicker *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D178]), "initWithIdentifier:title:imageName:valueTitles:", -[AVCaptureControl identifier](self, "identifier"), AVLocalizedStringFromTableWithBundleIdentifier(), CFSTR("dot.dot.grid.app"), self->_titles);
  }
  os_unfair_lock_unlock(p_actionLock);
  return self->_overlayControl;
}

- (id)overlayUpdate
{
  os_unfair_lock_s *p_selectedStyleLock;
  NSArray *styles;
  uint64_t v5;
  _QWORD v7[5];

  if (!self->_overlayControl)
    return 0;
  p_selectedStyleLock = &self->_selectedStyleLock;
  os_unfair_lock_lock(&self->_selectedStyleLock);
  styles = self->_styles;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__AVCaptureSystemStylePicker_overlayUpdate__block_invoke;
  v7[3] = &unk_1E4216C50;
  v7[4] = self;
  v5 = -[NSArray indexOfObjectPassingTest:](styles, "indexOfObjectPassingTest:", v7);
  os_unfair_lock_unlock(p_selectedStyleLock);
  return (id)-[CAMOverlayServicePicker updateWithIndexValue:](self->_overlayControl, "updateWithIndexValue:", v5);
}

uint64_t __43__AVCaptureSystemStylePicker_overlayUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "cast"), "isEqualToString:", objc_msgSend(a2, "cast"));
}

- (void)enqueueActionWithUpdate:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  _QWORD v8[6];

  v4 = objc_msgSend(a3, "indexValue");
  if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = v4;
    if (v4 < -[NSArray count](self->_styles, "count"))
    {
      v6 = -[NSArray objectAtIndexedSubscript:](self->_styles, "objectAtIndexedSubscript:", v5);
      if (self->_changeSmartStyleInProcess)
      {
        v7 = (void *)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject");
        if (!v7)
          return;
        objc_msgSend(v7, "setSmartStyle:", v6);
        self->_smartStyleHasChanged = 1;
      }
      os_unfair_lock_lock(&self->_selectedStyleLock);

      self->_selectedStyle = (AVCaptureSmartStyle *)v6;
      os_unfair_lock_unlock(&self->_selectedStyleLock);
      if (self->_action)
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __54__AVCaptureSystemStylePicker_enqueueActionWithUpdate___block_invoke;
        v8[3] = &unk_1E4216408;
        v8[4] = self;
        v8[5] = v6;
        dispatch_async(MEMORY[0x1E0C80D38], v8);
      }
    }
  }
}

uint64_t __54__AVCaptureSystemStylePicker_enqueueActionWithUpdate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))();
}

- (id)actionQueue
{
  os_unfair_lock_s *p_actionLock;
  id v3;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  v3 = MEMORY[0x1E0C80D38];
  os_unfair_lock_unlock(p_actionLock);
  return v3;
}

- (void)setOverlay:(id)a3
{
  os_unfair_lock_s *p_actionLock;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);

  self->_overlayReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", a3);
  os_unfair_lock_unlock(p_actionLock);
}

- (id)overlay
{
  os_unfair_lock_s *p_actionLock;
  id v4;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  v4 = (id)-[AVWeakReference referencedObject](self->_overlayReference, "referencedObject");
  os_unfair_lock_unlock(p_actionLock);
  return v4;
}

- (void)installObservers
{
  os_unfair_lock_s *p_actionLock;
  _BOOL4 observing;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  observing = self->_observing;
  os_unfair_lock_unlock(p_actionLock);
  if (!observing)
    objc_msgSend((id)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject"), "addObserver:forKeyPath:options:context:", self, CFSTR("smartStyle"), 5, 0);
  os_unfair_lock_lock(p_actionLock);
  self->_observing = 1;
  os_unfair_lock_unlock(p_actionLock);
}

- (void)removeObservers
{
  os_unfair_lock_s *p_actionLock;
  _BOOL4 observing;

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  observing = self->_observing;
  os_unfair_lock_unlock(p_actionLock);
  if (observing)
    objc_msgSend((id)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject"), "removeObserver:forKeyPath:", self, CFSTR("smartStyle"));
  os_unfair_lock_lock(p_actionLock);
  self->_observing = 0;
  os_unfair_lock_unlock(p_actionLock);
}

- (void)overlayVisibilityDidChange:(BOOL)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVCaptureSystemStylePicker;
  -[AVCaptureControl overlayVisibilityDidChange:](&v6, sel_overlayVisibilityDidChange_);
  if (!a3)
  {
    v5 = (void *)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject");
    if (v5)
    {
      if (self->_changeSmartStyleInProcess && self->_smartStyleHasChanged)
      {
        objc_msgSend(v5, "saveSystemStyleOverrideToDefaults:", objc_msgSend(v5, "smartStyle"));
        self->_smartStyleHasChanged = 0;
      }
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  os_unfair_lock_s *p_actionLock;
  _BOOL4 observing;
  uint64_t v12;
  void *v14;
  NSArray *styles;
  uint64_t v16;
  _QWORD v17[5];

  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  observing = self->_observing;
  os_unfair_lock_unlock(p_actionLock);
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("smartStyle"))
    && (id)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject") == a4)
  {
    v12 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    if (observing && v12 != 0)
    {
      v14 = (void *)v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        os_unfair_lock_lock(&self->_selectedStyleLock);

        self->_selectedStyle = (AVCaptureSmartStyle *)v14;
        styles = self->_styles;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __77__AVCaptureSystemStylePicker_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v17[3] = &unk_1E4216C50;
        v17[4] = self;
        v16 = -[NSArray indexOfObjectPassingTest:](styles, "indexOfObjectPassingTest:", v17);
        os_unfair_lock_unlock(&self->_selectedStyleLock);
        objc_msgSend(-[AVCaptureSystemStylePicker overlay](self, "overlay"), "updateControl:", -[CAMOverlayServicePicker updateWithIndexValue:](self->_overlayControl, "updateWithIndexValue:", v16));
      }
    }
  }
}

uint64_t __77__AVCaptureSystemStylePicker_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "cast"), "isEqualToString:", objc_msgSend(a2, "cast"));
}

@end
