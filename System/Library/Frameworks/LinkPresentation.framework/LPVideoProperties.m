@implementation LPVideoProperties

- (id)copyWithZone:(_NSZone *)a3
{
  LPVideoProperties *v4;
  void *v5;
  void *v6;
  void *v7;
  LPVideoProperties *v8;

  v4 = +[LPVideoProperties allocWithZone:](LPVideoProperties, "allocWithZone:", a3);
  if (v4)
  {
    -[LPVideoProperties setHasAudio:](v4, "setHasAudio:", -[LPVideoProperties hasAudio](self, "hasAudio"));
    -[LPVideoProperties _overlappingControlsColor](self, "_overlappingControlsColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPVideoProperties _setOverlappingControlsColor:](v4, "_setOverlappingControlsColor:", v5);

    -[LPVisualMediaProperties accessibilityText](self, "accessibilityText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    -[LPVisualMediaProperties setAccessibilityText:](v4, "setAccessibilityText:", v7);

    v8 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  unsigned __int8 *v6;
  void **v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPVideoProperties;
  if (-[LPVisualMediaProperties isEqual:](&v12, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (unsigned __int8 *)v4;
      v7 = (void **)v6;
      if (v6[16] == self->_hasAudio
        && (objc_msgSend(v6, "accessibilityText"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            -[LPVisualMediaProperties accessibilityText](self, "accessibilityText"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objectsAreEqual_1(v8, v9),
            v9,
            v8,
            (v10 & 1) != 0))
      {
        v5 = objectsAreEqual_1(v7[3], self->_overlappingControlsColor);
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (UIColor)_overlappingControlsColor
{
  return self->_overlappingControlsColor;
}

- (void)_setOverlappingControlsColor:(id)a3
{
  objc_storeStrong((id *)&self->_overlappingControlsColor, a3);
}

- (BOOL)hasAudio
{
  return self->_hasAudio;
}

- (void)setHasAudio:(BOOL)a3
{
  self->_hasAudio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlappingControlsColor, 0);
}

@end
