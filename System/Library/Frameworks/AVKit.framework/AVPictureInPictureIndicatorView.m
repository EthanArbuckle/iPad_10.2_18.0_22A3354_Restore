@implementation AVPictureInPictureIndicatorView

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPictureInPictureIndicatorView;
  -[AVPictureInPictureIndicatorView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[AVPictureInPictureIndicatorView _updateGeometry](self, "_updateGeometry");
}

- (void)layoutSublayersOfLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVPictureInPictureIndicatorView;
  -[AVPictureInPictureIndicatorView layoutSublayersOfLayer:](&v4, sel_layoutSublayersOfLayer_, a3);
  -[AVPictureInPictureIndicatorView _updateGeometry](self, "_updateGeometry");
}

- (void)setCustomMessage:(id)a3
{
  id v4;
  NSString *v5;
  NSString *customMessage;
  id v7;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  customMessage = self->_customMessage;
  self->_customMessage = v5;

  -[AVPictureInPictureIndicatorView pipIndicatorLayer](self, "pipIndicatorLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCustomText:", v4);

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVPictureInPictureIndicatorView;
  v4 = a3;
  -[AVPictureInPictureIndicatorView setBackgroundColor:](&v8, sel_setBackgroundColor_, v4);
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor", v8.receiver, v8.super_class);

  -[AVPictureInPictureIndicatorView pipIndicatorLayer](self, "pipIndicatorLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (void)_updateGeometry
{
  AVPictureInPictureIndicatorView *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  AVPictureInPictureIndicatorView *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v2 = self;
  v47 = *MEMORY[0x1E0C80C00];
  -[AVPictureInPictureIndicatorView _addIndicatorLayerIfNeeded](self, "_addIndicatorLayerIfNeeded");
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[AVPictureInPictureIndicatorView layer](v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v42;
    do
    {
      v8 = 0;
      v35 = v6;
      do
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v8);
        -[AVPictureInPictureIndicatorView layer](v2, "layer", v35);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "animationForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ((objc_msgSend(v9, "containsString:", CFSTR("position")) & 1) != 0
           || objc_msgSend(v9, "containsString:", CFSTR("bounds.origin"))))
        {
          v12 = v7;
          -[AVPictureInPictureIndicatorView pipIndicatorLayer](v2, "pipIndicatorLayer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addAnimation:forKey:", v11, v9);

          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v14 = v2;
          -[AVPictureInPictureIndicatorView pipIndicatorLayer](v2, "pipIndicatorLayer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "sublayers");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v38;
            do
            {
              v20 = 0;
              do
              {
                if (*(_QWORD *)v38 != v19)
                  objc_enumerationMutation(v16);
                objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v20++), "addAnimation:forKey:", v11, v9);
              }
              while (v18 != v20);
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            }
            while (v18);
          }

          v7 = v12;
          v6 = v35;
          v2 = v14;
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v6);
  }

  -[AVPictureInPictureIndicatorView bounds](v2, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[AVPictureInPictureIndicatorView pipIndicatorLayer](v2, "pipIndicatorLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBounds:", v22, v24, v26, v28);

  -[AVPictureInPictureIndicatorView bounds](v2, "bounds");
  UIRectGetCenter();
  v31 = v30;
  v33 = v32;
  -[AVPictureInPictureIndicatorView pipIndicatorLayer](v2, "pipIndicatorLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setPosition:", v31, v33);

}

- (void)_addIndicatorLayerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AVPictureInPictureIndicatorLayer *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  AVPictureInPictureIndicatorLayer *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  -[AVPictureInPictureIndicatorView pipIndicatorLayer](self, "pipIndicatorLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[AVPictureInPictureIndicatorView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return;
    v5 = (void *)MEMORY[0x1E0DC3870];
    AVBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureIndicatorView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("PictureInPictureIndicatorLarge"), v6, v8);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "AV_indicatorForegroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_flatImageWithColor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = [AVPictureInPictureIndicatorLayer alloc];
    -[AVPictureInPictureIndicatorView window](self, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayScale");
    v15 = v14;
    v16 = objc_retainAutorelease(v10);
    v17 = objc_msgSend(v16, "CGImage");
    v18 = -[AVPictureInPictureIndicatorLayer initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:](v11, "initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:", v17, 0, v15, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

    -[AVPictureInPictureIndicatorView setPipIndicatorLayer:](self, "setPipIndicatorLayer:", v18);
    -[AVPictureInPictureIndicatorView customMessage](self, "customMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[AVPictureInPictureIndicatorView customMessage](self, "customMessage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPictureInPictureIndicatorView pipIndicatorLayer](self, "pipIndicatorLayer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setCustomText:", v20);

    }
    -[AVPictureInPictureIndicatorView layer](self, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureIndicatorView pipIndicatorLayer](self, "pipIndicatorLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSublayer:", v23);

    v3 = v24;
  }

}

- (NSString)customMessage
{
  return self->_customMessage;
}

- (AVPictureInPictureIndicatorLayer)pipIndicatorLayer
{
  return self->_pipIndicatorLayer;
}

- (void)setPipIndicatorLayer:(id)a3
{
  objc_storeStrong((id *)&self->_pipIndicatorLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipIndicatorLayer, 0);
  objc_storeStrong((id *)&self->_customMessage, 0);
}

@end
