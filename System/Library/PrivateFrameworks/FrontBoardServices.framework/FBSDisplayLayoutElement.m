@implementation FBSDisplayLayoutElement

- (BSMutableSettings)otherSettings
{
  return self->_otherSettings;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)level
{
  return self->_level;
}

- (BOOL)isUIApplicationElement
{
  return self->_application;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherSettings, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)hasKeyboardFocus
{
  return self->_keyboardFocus;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isUIApplicationElement");
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSDisplayLayoutElement descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CGRect)referenceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_referenceFrame.origin.x;
  y = self->_referenceFrame.origin.y;
  width = self->_referenceFrame.size.width;
  height = self->_referenceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:", self->_identifier);
  objc_msgSend(v4, "setFrame:", self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
  objc_msgSend(v4, "setReferenceFrame:", self->_referenceFrame.origin.x, self->_referenceFrame.origin.y, self->_referenceFrame.size.width, self->_referenceFrame.size.height);
  objc_msgSend(v4, "setLevel:", self->_level);
  objc_msgSend(v4, "setFillsDisplayBounds:", self->_fillsDisplayBounds);
  objc_msgSend(v4, "setUIApplicationElement:", self->_application);
  objc_msgSend(v4, "setBundleIdentifier:", self->_bundleIdentifier);
  objc_msgSend(v4, "setHasKeyboardFocus:", self->_keyboardFocus);
  if ((-[BSMutableSettings isEmpty](self->_otherSettings, "isEmpty") & 1) == 0)
    objc_msgSend(v4, "setOtherSettings:", self->_otherSettings);
  return v4;
}

- (FBSDisplayLayoutElement)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  FBSDisplayLayoutElement *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  BSDeserializeStringFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FBSDisplayLayoutElement initWithIdentifier:](self, "initWithIdentifier:", v5);

  if (v6)
  {
    BSDeserializeCGRectFromXPCDictionaryWithKey();
    -[FBSDisplayLayoutElement setFrame:](v6, "setFrame:");
    BSDeserializeCGRectFromXPCDictionaryWithKey();
    -[FBSDisplayLayoutElement setReferenceFrame:](v6, "setReferenceFrame:");
    -[FBSDisplayLayoutElement setLevel:](v6, "setLevel:", xpc_dictionary_get_int64(v4, "level"));
    -[FBSDisplayLayoutElement setFillsDisplayBounds:](v6, "setFillsDisplayBounds:", xpc_dictionary_get_BOOL(v4, "fillsDisplayBounds"));
    -[FBSDisplayLayoutElement setUIApplicationElement:](v6, "setUIApplicationElement:", xpc_dictionary_get_BOOL(v4, "app"));
    BSDeserializeStringFromXPCDictionaryWithKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSDisplayLayoutElement setBundleIdentifier:](v6, "setBundleIdentifier:", v7);

    -[FBSDisplayLayoutElement setHasKeyboardFocus:](v6, "setHasKeyboardFocus:", xpc_dictionary_get_BOOL(v4, "keyboard"));
    v8 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v9 = v8;
    if (v8 && (objc_msgSend(v8, "isEmpty") & 1) == 0)
      -[FBSDisplayLayoutElement setOtherSettings:](v6, "setOtherSettings:", v9);

  }
  return v6;
}

- (void)setHasKeyboardFocus:(BOOL)a3
{
  self->_keyboardFocus = a3;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void)setReferenceFrame:(CGRect)a3
{
  self->_referenceFrame = a3;
}

- (FBSDisplayLayoutElement)initWithIdentifier:(id)a3
{
  id v4;
  FBSDisplayLayoutElement *v5;
  uint64_t v6;
  NSString *identifier;
  BSMutableSettings *v8;
  BSMutableSettings *otherSettings;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FBSDisplayLayoutElement;
  v5 = -[FBSDisplayLayoutElement init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (BSMutableSettings *)objc_alloc_init((Class)off_1E38E9E40);
    otherSettings = v5->_otherSettings;
    v5->_otherSettings = v8;

    -[BSMutableSettings setDescriptionProvider:](v5->_otherSettings, "setDescriptionProvider:", v5);
  }

  return v5;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setUIApplicationElement:(BOOL)a3
{
  self->_application = a3;
}

- (void)setOtherSettings:(id)a3
{
  BSMutableSettings *v4;
  BSMutableSettings *otherSettings;
  BSMutableSettings *v6;
  BSMutableSettings *v7;
  BSMutableSettings *v8;

  v4 = (BSMutableSettings *)a3;
  otherSettings = self->_otherSettings;
  if (otherSettings != v4)
  {
    v8 = v4;
    -[BSMutableSettings setDescriptionProvider:](otherSettings, "setDescriptionProvider:", 0);
    if (v8)
      v6 = (BSMutableSettings *)-[BSMutableSettings mutableCopy](v8, "mutableCopy");
    else
      v6 = (BSMutableSettings *)objc_alloc_init((Class)off_1E38E9E40);
    v7 = self->_otherSettings;
    self->_otherSettings = v6;

    -[BSMutableSettings setDescriptionProvider:](self->_otherSettings, "setDescriptionProvider:", self);
    v4 = v8;
  }

}

- (void)setFillsDisplayBounds:(BOOL)a3
{
  self->_fillsDisplayBounds = a3;
}

- (BOOL)fillsDisplayBounds
{
  return self->_fillsDisplayBounds;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, 0);
  if (self->_bundleIdentifier && !-[NSString isEqualToString:](self->_identifier, "isEqualToString:"))
    v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_bundleIdentifier, CFSTR("bundleID"));
  if (!CGRectIsEmpty(self->_frame))
    v6 = (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("frame"), self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
  v7 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_level, CFSTR("level"));
  return v3;
}

- (Class)fallbackXPCEncodableClass
{
  return (Class)objc_opt_class();
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "identifier");
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fillsDisplayBounds");
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasKeyboardFocus");
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "frame");
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "referenceFrame");
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "level");
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "otherSettings");
}

- (void)encodeWithXPCDictionary:(id)a3
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  int64_t level;
  void *v9;
  xpc_object_t xdict;
  CGRect v11;
  CGRect v12;

  xdict = a3;
  BSSerializeStringToXPCDictionaryWithKey();
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v11.origin.y = v5;
  v11.size.width = v6;
  v11.size.height = v7;
  if (!CGRectEqualToRect(self->_frame, v11))
    BSSerializeCGRectToXPCDictionaryWithKey();
  v12.origin.x = v4;
  v12.origin.y = v5;
  v12.size.width = v6;
  v12.size.height = v7;
  if (!CGRectEqualToRect(self->_referenceFrame, v12))
    BSSerializeCGRectToXPCDictionaryWithKey();
  level = self->_level;
  v9 = xdict;
  if (level)
  {
    xpc_dictionary_set_int64(xdict, "level", level);
    v9 = xdict;
  }
  if (self->_fillsDisplayBounds)
  {
    xpc_dictionary_set_BOOL(v9, "fillsDisplayBounds", 1);
    v9 = xdict;
  }
  if (self->_application)
    xpc_dictionary_set_BOOL(v9, "app", 1);
  BSSerializeStringToXPCDictionaryWithKey();
  if (self->_keyboardFocus)
    xpc_dictionary_set_BOOL(xdict, "keyboard", 1);
  if ((-[BSMutableSettings isEmpty](self->_otherSettings, "isEmpty") & 1) == 0)
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 application;
  uint64_t v7;
  id v8;
  id v9;
  _BOOL8 keyboardFocus;
  id v11;
  id v12;
  _BOOL8 fillsDisplayBounds;
  id v14;
  id v15;
  NSString *identifier;
  id v17;
  id v18;
  NSString *bundleIdentifier;
  id v20;
  id v21;
  int64_t level;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  BSMutableSettings *otherSettings;
  id v30;
  id v31;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;

  v4 = a3;
  objc_msgSend(off_1E38E9E00, "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  application = self->_application;
  v7 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke;
  v49[3] = &unk_1E38EB998;
  v8 = v4;
  v50 = v8;
  v9 = (id)objc_msgSend(v5, "appendBool:counterpart:", application, v49);
  keyboardFocus = self->_keyboardFocus;
  v47[0] = v7;
  v47[1] = 3221225472;
  v47[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke_2;
  v47[3] = &unk_1E38EB998;
  v11 = v8;
  v48 = v11;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", keyboardFocus, v47);
  fillsDisplayBounds = self->_fillsDisplayBounds;
  v45[0] = v7;
  v45[1] = 3221225472;
  v45[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke_3;
  v45[3] = &unk_1E38EB998;
  v14 = v11;
  v46 = v14;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", fillsDisplayBounds, v45);
  identifier = self->_identifier;
  v43[0] = v7;
  v43[1] = 3221225472;
  v43[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke_4;
  v43[3] = &unk_1E38EB9C0;
  v17 = v14;
  v44 = v17;
  v18 = (id)objc_msgSend(v5, "appendString:counterpart:", identifier, v43);
  bundleIdentifier = self->_bundleIdentifier;
  v41[0] = v7;
  v41[1] = 3221225472;
  v41[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke_5;
  v41[3] = &unk_1E38EB9C0;
  v20 = v17;
  v42 = v20;
  v21 = (id)objc_msgSend(v5, "appendString:counterpart:", bundleIdentifier, v41);
  level = self->_level;
  v39[0] = v7;
  v39[1] = 3221225472;
  v39[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke_6;
  v39[3] = &unk_1E38EB9E8;
  v23 = v20;
  v40 = v23;
  v24 = (id)objc_msgSend(v5, "appendInteger:counterpart:", level, v39);
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke_7;
  v37[3] = &unk_1E38EBA10;
  v25 = v23;
  v38 = v25;
  v26 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v37, self->_referenceFrame.origin.x, self->_referenceFrame.origin.y, self->_referenceFrame.size.width, self->_referenceFrame.size.height);
  v35[0] = v7;
  v35[1] = 3221225472;
  v35[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke_8;
  v35[3] = &unk_1E38EBA10;
  v27 = v25;
  v36 = v27;
  v28 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v35, self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
  otherSettings = self->_otherSettings;
  v33[0] = v7;
  v33[1] = 3221225472;
  v33[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke_9;
  v33[3] = &unk_1E38EBA38;
  v34 = v27;
  v30 = v27;
  v31 = (id)objc_msgSend(v5, "appendObject:counterpart:", otherSettings, v33);
  LOBYTE(v27) = objc_msgSend(v5, "isEqual");

  return (char)v27;
}

- (FBSDisplayLayoutElement)init
{
  return -[FBSDisplayLayoutElement initWithIdentifier:](self, "initWithIdentifier:", 0);
}

- (NSString)description
{
  return (NSString *)-[FBSDisplayLayoutElement descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  return 0;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  return 0;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSDisplayLayoutElement succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
