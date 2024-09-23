@implementation _SFKeyboardGeometry

- (id)_initWithSizeWithoutBar:(CGSize)a3 sizeWithBar:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat v6;
  CGFloat v7;
  _SFKeyboardGeometry *v8;
  _SFKeyboardGeometry *v9;
  _SFKeyboardGeometry *v10;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)_SFKeyboardGeometry;
  v8 = -[_SFKeyboardGeometry init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_sizeWithoutBar.width = v7;
    v8->_sizeWithoutBar.height = v6;
    v8->_sizeWithBar.width = width;
    v8->_sizeWithBar.height = height;
    v10 = v8;
  }

  return v9;
}

- (id)_initWithFallbackSizeForOrientation:(int64_t)a3
{
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0DC3958], "defaultSizeForInterfaceOrientation:", a3);
  return -[_SFKeyboardGeometry _initWithSizeWithoutBar:sizeWithBar:](self, "_initWithSizeWithoutBar:sizeWithBar:", v4, v5, v4, v5);
}

+ (id)_keyboardGeometryForCurrentDeviceWithInterfaceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  Class v10;
  Class v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  void *v21;
  double Height;
  double Width;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1A8598190](CFSTR("en"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_msgSend(v5, "inputModeWithIdentifier:", v7), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v10 = NSClassFromString(CFSTR("UIKeyboardLayoutStar"));
    if (v10 && (v11 = v10, (-[objc_class isSubclassOfClass:](v10, "isSubclassOfClass:", objc_opt_class()) & 1) != 0))
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_referenceBounds");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      +[SFKBScreenTraits traitsWithScreen:orientation:](SFKBScreenTraits, "traitsWithScreen:orientation:", v12, a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      Height = v18;
      Width = v20;
      if ((unint64_t)(a3 - 1) >= 2)
      {
        v39.origin.x = v14;
        v39.origin.y = v16;
        v39.size.width = v18;
        v39.size.height = v20;
        Width = CGRectGetWidth(v39);
        v40.origin.x = v14;
        v40.origin.y = v16;
        v40.size.width = v18;
        v40.size.height = v20;
        Height = CGRectGetHeight(v40);
      }
      objc_msgSend(v21, "setBounds:", v14, v16, Height, Width);
      v41.origin.x = v14;
      v41.origin.y = v16;
      v41.size.width = Height;
      v41.size.height = Width;
      v24 = CGRectGetWidth(v41);
      objc_msgSend(v21, "setKeyboardWidth:");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42.origin.x = v14;
        v42.origin.y = v16;
        v42.size.width = v18;
        v42.size.height = v20;
        v25 = CGRectGetWidth(v42);
        v43.origin.x = v14;
        v43.origin.y = v16;
        v43.size.width = v18;
        v43.size.height = v20;
        objc_msgSend(v21, "setSf_isKeyboardMinorEdgeWidth:", v24 == fmin(v25, CGRectGetHeight(v43)));
      }
      objc_msgSend(v9, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class keyboardSizeForInputMode:screenTraits:keyboardType:](v11, "keyboardSizeForInputMode:screenTraits:keyboardType:", v26, v21, 0);
      v28 = v27;
      v30 = v29;

      v31 = v21;
      if (objc_msgSend(v31, "idiom") == 1)
      {

        v32 = 55.0;
      }
      else if ((unint64_t)(objc_msgSend(v31, "orientation") - 3) > 1)
      {
        objc_msgSend(v31, "bounds");
        if (v34 <= 375.0)
        {
          v35 = v34;

          v32 = 38.0;
          if (v35 > 320.0)
            v32 = 44.0;
        }
        else
        {

          v32 = 45.0;
        }
      }
      else
      {

        v32 = 38.0;
      }
      v36 = v30 + v32;
      if (v18 <= 320.0)
        v37 = v36 + -1.0;
      else
        v37 = v36;
      v33 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithSizeWithoutBar:sizeWithBar:", v28, v30, v28, v37);

    }
    else
    {
      v33 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithFallbackSizeForOrientation:", a3);
    }

  }
  else
  {
    v33 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithFallbackSizeForOrientation:", a3);
  }

  return v33;
}

+ (id)keyboardGeometryForInterfaceOrientation:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = keyboardGeometryForInterfaceOrientation__portraitKeyboardGeometry;
  v5 = keyboardGeometryForInterfaceOrientation__landscapeKeyboardGeometry;
  if (keyboardGeometryForInterfaceOrientation__portraitKeyboardGeometry)
    v6 = keyboardGeometryForInterfaceOrientation__landscapeKeyboardGeometry == 0;
  else
    v6 = 1;
  if (v6)
  {
    objc_msgSend(a1, "_keyboardGeometryForCurrentDeviceWithInterfaceOrientation:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)keyboardGeometryForInterfaceOrientation__portraitKeyboardGeometry;
    keyboardGeometryForInterfaceOrientation__portraitKeyboardGeometry = v8;

    objc_msgSend(a1, "_keyboardGeometryForCurrentDeviceWithInterfaceOrientation:", 4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)keyboardGeometryForInterfaceOrientation__landscapeKeyboardGeometry;
    keyboardGeometryForInterfaceOrientation__landscapeKeyboardGeometry = v10;

    v4 = keyboardGeometryForInterfaceOrientation__portraitKeyboardGeometry;
    v5 = keyboardGeometryForInterfaceOrientation__landscapeKeyboardGeometry;
  }
  if ((unint64_t)(a3 - 1) >= 2)
    v12 = (void *)v5;
  else
    v12 = (void *)v4;
  return v12;
}

- (CGSize)sizeWithoutBar
{
  double width;
  double height;
  CGSize result;

  width = self->_sizeWithoutBar.width;
  height = self->_sizeWithoutBar.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)sizeWithBar
{
  double width;
  double height;
  CGSize result;

  width = self->_sizeWithBar.width;
  height = self->_sizeWithBar.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
