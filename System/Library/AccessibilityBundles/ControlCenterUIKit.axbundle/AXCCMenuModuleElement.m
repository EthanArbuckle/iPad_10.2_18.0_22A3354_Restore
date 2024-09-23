@implementation AXCCMenuModuleElement

- (id)accessibilityLabel
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;

  -[AXCCMenuModuleElement provider](self, "provider");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, AXCCMenuModuleElement *))v3)[2](v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)accessibilityFrame
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[AXCCMenuModuleElement provider](self, "provider");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, AXCCMenuModuleElement *))v3)[2](v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)accessibilityValue
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;

  -[AXCCMenuModuleElement provider](self, "provider");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, AXCCMenuModuleElement *))v3)[2](v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  unint64_t v5;

  -[AXCCMenuModuleElement provider](self, "provider");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, AXCCMenuModuleElement *))v3)[2](v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessibilityTraits");

  return v5;
}

- (id)accessibilityHint
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;

  -[AXCCMenuModuleElement provider](self, "provider");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, AXCCMenuModuleElement *))v3)[2](v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isAccessibilityElement
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  char v5;

  -[AXCCMenuModuleElement provider](self, "provider");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, AXCCMenuModuleElement *))v3)[2](v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAccessibilityElement");

  return v5;
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (id)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_provider, 0);
}

@end
