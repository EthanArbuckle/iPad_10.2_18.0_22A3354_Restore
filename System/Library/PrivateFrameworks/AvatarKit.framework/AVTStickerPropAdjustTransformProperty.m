@implementation AVTStickerPropAdjustTransformProperty

- (AVTStickerPropAdjustTransformProperty)initWithPresetCategory:(int64_t)a3 presetValue:(id)a4 position:rotation:scale:
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  id v10;
  AVTStickerPropAdjustTransformProperty *v11;
  AVTStickerPropAdjustTransformProperty *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;

  v15 = v5;
  v16 = v6;
  v14 = v4;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AVTStickerPropAdjustTransformProperty;
  v11 = -[AVTStickerPropAdjustTransformProperty init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    *(_OWORD *)v11->_rotation = v15;
    *(_OWORD *)v11->_scale = v16;
    *(_OWORD *)v11->_position = v14;
    v11->_presetCategory = a3;
    objc_storeStrong(&v11->_presetValue, a4);
  }

  return v12;
}

- (void)applyAdjustmentIfNeededToNode:(id)a3 forMemoji:(id)a4 ignoreScaleZ:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  char isKindOfClass;
  id presetValue;
  void *v12;
  char v13;
  id v14;
  void *v15;
  float32x4_t v16;
  float32x4_t v17;
  uint64_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  id v25;

  v5 = a5;
  v25 = a3;
  v8 = a4;
  objc_msgSend(v8, "presetForCategory:", -[AVTStickerPropAdjustTransformProperty presetCategory](self, "presetCategory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  presetValue = self->_presetValue;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(presetValue, "isEqualToString:", v12);

    if ((v13 & 1) == 0)
      goto LABEL_10;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
    v14 = self->_presetValue;
    objc_msgSend(v9, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v14, "containsObject:", v15);

    if (!(_DWORD)v14)
      goto LABEL_10;
  }
  -[AVTStickerPropAdjustTransformProperty position](self, "position");
  v23 = v16;
  objc_msgSend(v25, "simdPosition");
  objc_msgSend(v25, "setSimdPosition:", *(double *)vaddq_f32(v23, v17).i64);
  -[AVTStickerPropAdjustTransformProperty rotation](self, "rotation");
  v23.i64[0] = v18;
  objc_msgSend(v25, "simdEulerAngles");
  objc_msgSend(v25, "setSimdEulerAngles:", *(double *)vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 0)).i64);
  if (v5)
  {
    objc_msgSend(v25, "simdScale");
    v24 = v20;
    -[AVTStickerPropAdjustTransformProperty scale](self, "scale");
  }
  else
  {
    -[AVTStickerPropAdjustTransformProperty scale](self, "scale");
    v24 = v22;
    objc_msgSend(v25, "simdScale");
  }
  objc_msgSend(v25, "setSimdScale:", *(double *)vmulq_f32(v24, v21).i64);
LABEL_10:

}

- (int64_t)presetCategory
{
  return self->_presetCategory;
}

- (id)presetValue
{
  return self->_presetValue;
}

- (__n128)position
{
  return a1[2];
}

- (__n128)rotation
{
  return a1[3];
}

- (__n128)scale
{
  return a1[4];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presetValue, 0);
}

@end
