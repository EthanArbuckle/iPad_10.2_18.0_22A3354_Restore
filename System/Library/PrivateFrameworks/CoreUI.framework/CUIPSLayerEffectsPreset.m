@implementation CUIPSLayerEffectsPreset

- (CUIPSLayerEffectsPreset)initWithLayerEffects:(id)a3 forScaleFactor:(double)a4
{
  CUIPSLayerEffectsPreset *v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];

  v4 = self;
  if (a3)
  {
    if (a4 > 0.0)
    {
      v24.receiver = self;
      v24.super_class = (Class)CUIPSLayerEffectsPreset;
      v4 = -[CUIShapeEffectPreset initWithEffectScale:](&v24, sel_initWithEffectScale_);
      if (v4)
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v6 = objc_msgSend(objc_msgSend(a3, "effectList"), "allValues");
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v21;
          while (2)
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(_QWORD *)v21 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
              v19 = 0;
              if (objc_msgSend(v11, "visible")
                && (objc_msgSend(v11, "updateLayerEffectPreset:error:", v4, &v19) & 1) == 0
                && v19)
              {
                _CUILog(4, (uint64_t)"Unable to update layer effect preset: %@", v12, v13, v14, v15, v16, v17, v19);

                return 0;
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
            if (v8)
              continue;
            break;
          }
        }
      }
    }
  }
  return v4;
}

@end
