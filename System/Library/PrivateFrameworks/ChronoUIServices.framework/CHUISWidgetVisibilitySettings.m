@implementation CHUISWidgetVisibilitySettings

- (CHUISWidgetVisibilitySettings)init
{
  CHUISWidgetVisibilitySettings *result;
  CGSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHUISWidgetVisibilitySettings;
  result = -[CHUISWidgetVisibilitySettings init](&v4, sel_init);
  if (result)
  {
    result->_settled = 0;
    v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    result->_visibleBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    result->_visibleBounds.size = v3;
  }
  return result;
}

- (id)_initWithVisibilitySettings:(id)a3
{
  _BYTE *v4;
  CHUISWidgetVisibilitySettings *v5;
  CHUISWidgetVisibilitySettings *v6;
  CGSize v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHUISWidgetVisibilitySettings;
  v5 = -[CHUISWidgetVisibilitySettings init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_settled = v4[8];
    v7 = (CGSize)*((_OWORD *)v4 + 2);
    v5->_visibleBounds.origin = (CGPoint)*((_OWORD *)v4 + 1);
    v5->_visibleBounds.size = v7;
  }

  return v6;
}

- (BOOL)isSettled
{
  return self->_settled;
}

- (CGRect)visibleBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleBounds.origin.x;
  y = self->_visibleBounds.origin.y;
  width = self->_visibleBounds.size.width;
  height = self->_visibleBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v4;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  v10 = -[CHUISWidgetVisibilitySettings isSettled](self, "isSettled");
  v11 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __41__CHUISWidgetVisibilitySettings_isEqual___block_invoke;
  v30[3] = &unk_1E6B84C90;
  v12 = v9;
  v31 = v12;
  v13 = (id)objc_msgSend(v5, "appendBool:counterpart:", v10, v30);
  -[CHUISWidgetVisibilitySettings visibleBounds](self, "visibleBounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v25 = v11;
  v26 = 3221225472;
  v27 = __41__CHUISWidgetVisibilitySettings_isEqual___block_invoke_2;
  v28 = &unk_1E6B84CB8;
  v22 = v12;
  v29 = v22;
  v23 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", &v25, v15, v17, v19, v21);
  LOBYTE(v12) = objc_msgSend(v5, "isEqual", v25, v26, v27, v28);

  return (char)v12;
}

uint64_t __41__CHUISWidgetVisibilitySettings_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isSettled");
}

uint64_t __41__CHUISWidgetVisibilitySettings_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "visibleBounds");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", -[CHUISWidgetVisibilitySettings isSettled](self, "isSettled"));
  -[CHUISWidgetVisibilitySettings visibleBounds](self, "visibleBounds");
  v5 = (id)objc_msgSend(v3, "appendCGRect:");
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CHUISWidgetVisibilitySettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[CHUISWidgetVisibilitySettings isSettled](self, "isSettled"), CFSTR("settled"));
  -[CHUISWidgetVisibilitySettings visibleBounds](self, "visibleBounds");
  v5 = (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("visibleBounds"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CHUISWidgetVisibilitySettings descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  CHUISWidgetVisibilitySettings *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__CHUISWidgetVisibilitySettings_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6B84B40;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);
  v7 = v6;

  return v7;
}

id __71__CHUISWidgetVisibilitySettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSettled"), CFSTR("settled"));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "visibleBounds");
  return (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("visibleBounds"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CHUISWidgetVisibilitySettings _initWithVisibilitySettings:]([CHUISMutableWidgetVisibilitySettings alloc], "_initWithVisibilitySettings:", self);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;

  v4 = a3;
  xpc_dictionary_set_BOOL(v4, "s", self->_settled);
  BSSerializeCGRectToXPCDictionaryWithKey();

}

- (CHUISWidgetVisibilitySettings)initWithXPCDictionary:(id)a3
{
  id v4;
  CHUISWidgetVisibilitySettings *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  v4 = a3;
  v5 = -[CHUISWidgetVisibilitySettings init](self, "init");
  if (v5)
  {
    v5->_settled = xpc_dictionary_get_BOOL(v4, "s");
    BSDeserializeCGRectFromXPCDictionaryWithKey();
    v5->_visibleBounds.origin.x = v6;
    v5->_visibleBounds.origin.y = v7;
    v5->_visibleBounds.size.width = v8;
    v5->_visibleBounds.size.height = v9;
  }

  return v5;
}

@end
