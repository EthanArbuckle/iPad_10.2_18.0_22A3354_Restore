@implementation AKShapesPicker

- (AKShapesPicker)initWithFrame:(CGRect)a3 shapeTags:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  AKShapesPicker *v10;
  AKShapesPicker *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AKShapesPicker;
  v10 = -[AKModernToolbarPicker initWithFrame:controller:](&v16, sel_initWithFrame_controller_, 0, x, y, width, height);
  if (v10)
  {
    if (objc_msgSend(v9, "count"))
    {
      v11 = v10;
      v12 = v9;
    }
    else
    {
      v12 = &unk_24F1CF0C0;
      v11 = v10;
    }
    -[AKShapesPicker setShapes:](v11, "setShapes:", v12);
    -[AKShapesPicker traitCollection](v10, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_style = objc_msgSend(v13, "userInterfaceStyle");

    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKShapesPicker setTintColor:](v10, "setTintColor:", v14);

  }
  return v10;
}

- (void)setShapes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *shapes;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AKModernToolbarPicker stackview](self, "stackview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  v7 = (NSArray *)objc_msgSend(v4, "copy");
  shapes = self->_shapes;
  self->_shapes = v7;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v27 = *(_QWORD *)v29;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v27)
        objc_enumerationMutation(obj);
      v12 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v11), "longValue");
      v13 = v12 - 764000;
      if ((unint64_t)(v12 - 764000) > 7 || ((0xA5u >> v13) & 1) == 0)
        break;
      v14 = v12;
      v15 = (uint64_t)*(&off_24F1A78C8 + v13);
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", *(&off_24F1A7908 + v13));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithScale:", 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "imageByApplyingSymbolConfiguration:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "configuration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_configurationIgnoringDynamicType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "imageWithConfiguration:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v22, "widthAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToConstant:", 36.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setActive:", 1);

      objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel__shapeButtonPressed_, 64);
      objc_msgSend(v22, "setImage:forState:", v21, 0);
      objc_msgSend(v22, "setTag:", v14);
      objc_msgSend(v22, "setAccessibilityIdentifier:", v15);
      -[AKModernToolbarPicker stackview](self, "stackview");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addArrangedSubview:", v22);

      if (v10 == ++v11)
      {
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  void *v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  -[AKShapesPicker shapes](self, "shapes", a3.width);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (double)(unint64_t)objc_msgSend(v4, "count") * 45.0 + -9.0;

  v6 = v5;
  v7 = height;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)_shapeButtonPressed:(id)a3
{
  objc_msgSend(a3, "tag");
  MEMORY[0x24BEDD108](self, sel_setCurrentTag_);
}

- (void)_updateCurrentAppearanceIfNeeded
{
  void *v3;
  int64_t v4;

  -[AKShapesPicker traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 != self->_style)
  {
    self->_style = v4;
    -[AKShapesPicker setShapes:](self, "setShapes:", self->_shapes);
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKShapesPicker;
  -[AKShapesPicker layoutSubviews](&v3, sel_layoutSubviews);
  -[AKShapesPicker _updateCurrentAppearanceIfNeeded](self, "_updateCurrentAppearanceIfNeeded");
}

- (NSArray)shapes
{
  return self->_shapes;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapes, 0);
}

@end
