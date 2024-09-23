@implementation PHStaticDialerPad

- (PHStaticDialerPad)initWithDialerType:(int)a3
{
  uint64_t v3;
  PHStaticDialerPad *v4;
  PHStaticDialerPad *v5;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)PHStaticDialerPad;
  v4 = -[PHStaticDialerPad initWithFrame:](&v7, "initWithFrame:", 0.0, 0.0, 147.0, 180.0);
  v5 = v4;
  if (v4)
  {
    -[PHStaticDialerPad setDialerType:](v4, "setDialerType:", v3);
    *(_QWORD *)&v5->TPPhonePad_opaque[OBJC_IVAR___TPPhonePad__topHeight] = 0x4045C00000000000;
    *(_QWORD *)&v5->TPPhonePad_opaque[OBJC_IVAR___TPPhonePad__midHeight] = 0x4047800000000000;
    *(_QWORD *)&v5->TPPhonePad_opaque[OBJC_IVAR___TPPhonePad__bottomHeight] = 0x4045400000000000;
    *(_QWORD *)&v5->TPPhonePad_opaque[OBJC_IVAR___TPPhonePad__leftWidth] = 0x4047600000000000;
    *(_QWORD *)&v5->TPPhonePad_opaque[OBJC_IVAR___TPPhonePad__midWidth] = 0x404A800000000000;
    *(_QWORD *)&v5->TPPhonePad_opaque[OBJC_IVAR___TPPhonePad__rightWidth] = 0x4047A00000000000;
    -[PHStaticDialerPad setOpaque:](v5, "setOpaque:", 1);
    -[PHStaticDialerPad setFrame:](v5, "setFrame:", 0.0, 0.0, 147.0, 180.0);
  }
  return v5;
}

- (void)layoutSubviews
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  CPKeyView *v12;
  id v13;
  _UIFocusLinearMovementSequence *v14;
  _UIFocusLinearMovementSequence *linearSequence;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PHStaticDialerPad;
  -[PHStaticDialerPad layoutSubviews](&v17, "layoutSubviews");
  v3 = objc_alloc_init((Class)NSMutableArray);
  -[PHStaticDialerPad frame](self, "frame");
  v4 = 0;
  v5 = 0;
  v7 = v6 * 0.25;
  v9 = v8 / 3.0;
  do
  {
    v10 = 0;
    v16 = v5;
    v11 = v7 * (double)v5;
    do
    {
      v12 = objc_alloc_init(CPKeyView);
      -[CPKeyView setKeyIndex:](v12, "setKeyIndex:", v4 + v10);
      -[CPKeyView setFrame:](v12, "setFrame:", v9 * (double)v10, v11, v9, v7);
      v13 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "keyPressed:");
      objc_msgSend(v13, "setMinimumPressDuration:", 0.0);
      objc_msgSend(v13, "setAllowedPressTypes:", &off_100297320);
      -[CPKeyView addGestureRecognizer:](v12, "addGestureRecognizer:", v13);
      -[PHStaticDialerPad addSubview:](self, "addSubview:", v12);
      objc_msgSend(v3, "addObject:", v12);

      ++v10;
    }
    while (v10 != 3);
    v5 = v16 + 1;
    v4 += 3;
  }
  while (v16 != 3);
  v14 = (_UIFocusLinearMovementSequence *)objc_claimAutoreleasedReturnValue(+[_UIFocusLinearMovementSequence sequenceWithItems:loops:](_UIFocusLinearMovementSequence, "sequenceWithItems:loops:", v3, 0));
  linearSequence = self->_linearSequence;
  self->_linearSequence = v14;

}

- (void)keyPressed:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "state");
  if (v4 == (id)4)
  {
    -[PHStaticDialerPad performTapActionCancelForHighlightedKey](self, "performTapActionCancelForHighlightedKey");
  }
  else if (v4 == (id)3)
  {
    -[PHStaticDialerPad performTapActionEndForHighlightedKey](self, "performTapActionEndForHighlightedKey");
  }
  else if (v4 == (id)1)
  {
    -[PHStaticDialerPad performTapActionDownForHighlightedKey](self, "performTapActionDownForHighlightedKey");
  }
}

- (PHStaticDialerPad)initWithFrame:(CGRect)a3
{
  return -[PHStaticDialerPad initWithDialerType:](self, "initWithDialerType:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_pressedImage
{
  void *v3;

  if (-[PHStaticDialerPad dialerType](self, "dialerType") == 1
    || -[PHStaticDialerPad dialerType](self, "dialerType") == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:](UIImage, "phCarPlayImageNamed:", CFSTR("carplay_keypad_highlighted")));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _deviceSpecificImageNamed:](UIImage, "_deviceSpecificImageNamed:", CFSTR("dialerView-pressed")));
  }
  return v3;
}

- (id)_keypadImage
{
  void *v3;

  if (-[PHStaticDialerPad dialerType](self, "dialerType") == 1
    || -[PHStaticDialerPad dialerType](self, "dialerType") == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:](UIImage, "phCarPlayImageNamed:", CFSTR("carplay_keypad")));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _deviceSpecificImageNamed:](UIImage, "_deviceSpecificImageNamed:", CFSTR("dialerView-normal")));
  }
  return v3;
}

- (id)_highlightedImage
{
  void *v3;

  if (-[PHStaticDialerPad dialerType](self, "dialerType") == 1
    || -[PHStaticDialerPad dialerType](self, "dialerType") == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:](UIImage, "phCarPlayImageNamed:", CFSTR("carplay_keypad_highlighted")));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (float)_yFudge
{
  return 0.0;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHStaticDialerPad _keypadImage](self, "_keypadImage"));
  objc_msgSend(v3, "size");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHStaticDialerPad _keypadImage](self, "_keypadImage"));
  objc_msgSend(v6, "size");
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  uint64_t v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  -[PHStaticDialerPad performTapActionCancelForHighlightedKey](self, "performTapActionCancelForHighlightedKey");
  v16.receiver = self;
  v16.super_class = (Class)PHStaticDialerPad;
  -[PHStaticDialerPad didUpdateFocusInContext:withAnimationCoordinator:](&v16, "didUpdateFocusInContext:withAnimationCoordinator:", v6, v7);

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedItem"));
  if (v8
    && (v9 = (void *)v8,
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedItem")),
        objc_opt_class(CPKeyView, v11),
        isKindOfClass = objc_opt_isKindOfClass(v10, v12),
        v10,
        v9,
        (isKindOfClass & 1) != 0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedItem"));
    v15 = (uint64_t)objc_msgSend(v14, "keyIndex");

  }
  else
  {
    v15 = -1;
  }
  -[PHStaticDialerPad highlightKeyAtIndex:](self, "highlightKeyAtIndex:", v15);

}

- (id)_linearFocusMovementSequences
{
  _UIFocusLinearMovementSequence *linearSequence;

  linearSequence = self->_linearSequence;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &linearSequence, 1));
}

- (int)dialerType
{
  return self->_dialerType;
}

- (void)setDialerType:(int)a3
{
  self->_dialerType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linearSequence, 0);
}

@end
