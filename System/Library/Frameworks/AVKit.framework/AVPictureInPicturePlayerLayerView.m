@implementation AVPictureInPicturePlayerLayerView

- (AVPlayerLayer)playerLayer
{
  return -[_AVSimplePlayerLayerView playerLayer](self->_simplePlayerLayerView, "playerLayer");
}

- (void)attachPlayerLayer
{
  _AVSimplePlayerLayerView *v3;
  _AVSimplePlayerLayerView *v4;
  _AVSimplePlayerLayerView *simplePlayerLayerView;
  void *v6;
  _AVSimplePlayerLayerView *v7;
  void *v8;
  void *v9;
  void *v10;
  _AVSimplePlayerLayerView *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _AVSimplePlayerLayerView *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!self->_simplePlayerLayerView)
  {
    -[AVPictureInPicturePlayerLayerView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("playerLayer"));
    v3 = [_AVSimplePlayerLayerView alloc];
    -[AVPictureInPicturePlayerLayerView bounds](self, "bounds");
    v4 = -[_AVSimplePlayerLayerView initWithFrame:](v3, "initWithFrame:");
    simplePlayerLayerView = self->_simplePlayerLayerView;
    self->_simplePlayerLayerView = v4;

    -[_AVSimplePlayerLayerView setTranslatesAutoresizingMaskIntoConstraints:](self->_simplePlayerLayerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AVPictureInPicturePlayerLayerView addSubview:](self, "addSubview:", self->_simplePlayerLayerView);
    v6 = (void *)MEMORY[0x1E0CB3718];
    v7 = self->_simplePlayerLayerView;
    v16 = CFSTR("simplePlayerLayerView");
    v17[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[simplePlayerLayerView]|"), 0, 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activateConstraints:", v9);

    v10 = (void *)MEMORY[0x1E0CB3718];
    v11 = self->_simplePlayerLayerView;
    v14 = CFSTR("simplePlayerLayerView");
    v15 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[simplePlayerLayerView]|"), 0, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activateConstraints:", v13);

    -[AVPictureInPicturePlayerLayerView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("playerLayer"));
  }
}

- (void)detachPlayerLayer
{
  _AVSimplePlayerLayerView *simplePlayerLayerView;

  if (self->_simplePlayerLayerView)
  {
    -[AVPictureInPicturePlayerLayerView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("playerLayer"));
    -[_AVSimplePlayerLayerView removeFromSuperview](self->_simplePlayerLayerView, "removeFromSuperview");
    simplePlayerLayerView = self->_simplePlayerLayerView;
    self->_simplePlayerLayerView = 0;

    -[AVPictureInPicturePlayerLayerView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("playerLayer"));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simplePlayerLayerView, 0);
}

@end
