@implementation CSComponent

+ (id)componentWithType:(int64_t)a3
{
  CSComponent *v3;

  switch(a3)
  {
    case 0:
      v3 = objc_alloc_init(CSComponent);
      -[CSComponent setType:](v3, "setType:", 0);
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
      v3 = (CSComponent *)objc_opt_new();
      break;
    default:
      return v3;
  }
  return v3;
}

+ (id)dateView
{
  return (id)objc_msgSend(a1, "componentWithType:", 1);
}

+ (id)statusBar
{
  return (id)objc_msgSend(a1, "componentWithType:", 2);
}

+ (id)pageControl
{
  return (id)objc_msgSend(a1, "componentWithType:", 3);
}

+ (id)pageContent
{
  return (id)objc_msgSend(a1, "componentWithType:", 4);
}

+ (id)slideableContent
{
  return (id)objc_msgSend(a1, "componentWithType:", 5);
}

+ (id)wallpaper
{
  return (id)objc_msgSend(a1, "componentWithType:", 6);
}

+ (id)tinting
{
  return (id)objc_msgSend(a1, "componentWithType:", 7);
}

+ (id)statusBarBackground
{
  return (id)objc_msgSend(a1, "componentWithType:", 8);
}

+ (id)footerCallToActionLabel
{
  return (id)objc_msgSend(a1, "componentWithType:", 9);
}

+ (id)footerStatusLabel
{
  return (id)objc_msgSend(a1, "componentWithType:", 10);
}

+ (id)proudLock
{
  return (id)objc_msgSend(a1, "componentWithType:", 11);
}

+ (id)homeAffordance
{
  return (id)objc_msgSend(a1, "componentWithType:", 12);
}

+ (id)controlCenterGrabber
{
  return (id)objc_msgSend(a1, "componentWithType:", 13);
}

+ (id)quickActions
{
  return (id)objc_msgSend(a1, "componentWithType:", 14);
}

+ (id)content
{
  return (id)objc_msgSend(a1, "componentWithType:", 15);
}

+ (id)statusBarGradient
{
  return (id)objc_msgSend(a1, "componentWithType:", 16);
}

+ (id)poseidon
{
  return (id)objc_msgSend(a1, "componentWithType:", 17);
}

+ (id)whitePoint
{
  return (id)objc_msgSend(a1, "componentWithType:", 18);
}

+ (id)background
{
  return (id)objc_msgSend(a1, "componentWithType:", 19);
}

+ (id)backgroundContent
{
  return (id)objc_msgSend(a1, "componentWithType:", 24);
}

+ (id)complicationContainer
{
  return (id)objc_msgSend(a1, "componentWithType:", 20);
}

+ (id)remoteInlineContent
{
  return (id)objc_msgSend(a1, "componentWithType:", 21);
}

+ (id)modalContent
{
  return (id)objc_msgSend(a1, "componentWithType:", 22);
}

+ (id)wallpaperFloatingLayer
{
  return (id)objc_msgSend(a1, "componentWithType:", 23);
}

+ (id)complicationSidebar
{
  return (id)objc_msgSend(a1, "componentWithType:", 25);
}

+ (id)fullBleedContent
{
  return (id)objc_msgSend(a1, "componentWithType:", 26);
}

+ (id)dimmingLayer
{
  return (id)objc_msgSend(a1, "componentWithType:", 27);
}

- (CSComponent)init
{
  CSComponent *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSComponent;
  result = -[CSComponent init](&v3, sel_init);
  if (result)
  {
    result->_flag = 0x7FFFFFFFFFFFFFFFLL;
    result->_scale = 1.0;
  }
  return result;
}

- (id)priority:(int64_t)a3
{
  -[CSComponent setPriority:](self, "setPriority:", a3);
  return self;
}

- (id)identifier:(id)a3
{
  id v5;
  void *v7;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSComponents.m"), 339, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  -[CSComponent setIdentifier:](self, "setIdentifier:", v5);

  return self;
}

- (id)hidden:(BOOL)a3
{
  -[CSComponent setHidden:](self, "setHidden:", a3);
  return self;
}

- (id)flag:(int64_t)a3
{
  -[CSComponent setFlag:](self, "setFlag:", a3);
  return self;
}

- (id)string:(id)a3
{
  -[CSComponent setString:](self, "setString:", a3);
  return self;
}

- (id)value:(id)a3
{
  -[CSComponent setValue:](self, "setValue:", a3);
  return self;
}

- (id)view:(id)a3
{
  -[CSComponent setView:](self, "setView:", a3);
  return self;
}

- (id)legibilitySettings:(id)a3
{
  -[CSComponent setLegibilitySettings:](self, "setLegibilitySettings:", a3);
  return self;
}

- (id)color:(id)a3
{
  -[CSComponent setColor:](self, "setColor:", a3);
  return self;
}

- (id)offset:(CGPoint)a3
{
  -[CSComponent setOffset:](self, "setOffset:", a3.x, a3.y);
  return self;
}

- (id)transitionModifiers:(unint64_t)a3
{
  -[CSComponent setTransitionModifiers:](self, "setTransitionModifiers:", a3);
  return self;
}

- (id)transitionInputs:(id *)a3
{
  __int128 v4;
  _OWORD v6[3];

  v4 = *(_OWORD *)&a3->var1.y;
  v6[0] = *(_OWORD *)&a3->var0;
  v6[1] = v4;
  v6[2] = *(_OWORD *)&a3->var3;
  -[CSComponent setTransitionInputs:](self, "setTransitionInputs:", v6);
  return self;
}

- (id)scale:(double)a3
{
  -[CSComponent setScale:](self, "setScale:", a3);
  return self;
}

- (id)animationDuration:(double)a3
{
  -[CSComponent setAnimationDuration:](self, "setAnimationDuration:", a3);
  return self;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
  self->_properties |= 1uLL;
}

- (void)setFlag:(int64_t)a3
{
  self->_flag = a3;
  self->_properties = self->_properties & 0xFFFFFFFFFFFFFFF7 | (8 * (a3 != 0x7FFFFFFFFFFFFFFFLL));
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
  self->_properties |= 2uLL;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
  self->_properties |= 4uLL;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
  self->_properties |= 0x10uLL;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  self->_properties |= 0x20uLL;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
  self->_properties |= 0x40uLL;
}

- (void)setTransitionModifiers:(unint64_t)a3
{
  self->_transitionModifiers = a3;
  self->_properties |= 0x80uLL;
}

- (void)setTransitionInputs:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var3;
  *(_OWORD *)&self->_transitionInputs.targetOffset.y = *(_OWORD *)&a3->var1.y;
  *(_OWORD *)&self->_transitionInputs.blurRadius = v4;
  *(_OWORD *)&self->_transitionInputs.duration = v3;
  self->_properties |= 0x100uLL;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
  self->_properties |= 0x200uLL;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
  self->_properties |= 0x400uLL;
}

- (void)setBlurRadius:(double)a3
{
  self->_blurRadius = a3;
  self->_properties |= 0x800uLL;
}

- (void)setLevel:(unint64_t)a3
{
  self->_level = a3;
  self->_properties |= 0x1000uLL;
}

- (BOOL)hasValueForProperty:(unint64_t)a3
{
  return (a3 & ~self->_properties) == 0;
}

- (void)resetAllProperties
{
  -[CSComponent setAlpha:](self, "setAlpha:", 0.0);
  -[CSComponent resetProperties:](self, "resetProperties:", -1);
}

- (void)resetProperties:(unint64_t)a3
{
  _QWORD *v5;
  uint8x8_t v6;
  int v7;
  unint64_t v8;
  _QWORD v9[2];
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  CSComponent *v12;
  char v13;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v10 = __31__CSComponent_resetProperties___block_invoke;
  v11 = &unk_1E8E2F1A8;
  v12 = self;
  v5 = v9;
  if (a3)
  {
    v13 = 0;
    v6 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v6.i16[0] = vaddlv_u8(v6);
    v7 = v6.i32[0];
    if (v6.i32[0])
    {
      v8 = 0;
      do
      {
        if (((1 << v8) & a3) != 0)
        {
          ((void (*)(_QWORD *))v10)(v5);
          if (v13)
            break;
          --v7;
        }
        if (v8 > 0x3E)
          break;
        ++v8;
      }
      while (v7 > 0);
    }
  }

  self->_properties &= ~a3;
}

uint64_t __31__CSComponent_resetProperties___block_invoke(uint64_t result, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a2 > 127)
  {
    if (a2 > 1023)
    {
      switch(a2)
      {
        case 1024:
          return objc_msgSend(*(id *)(result + 32), "setAnimationDuration:", 0.0);
        case 2048:
          return objc_msgSend(*(id *)(result + 32), "setBlurRadius:", 0.0);
        case 4096:
          return objc_msgSend(*(id *)(result + 32), "setLevel:", 0);
      }
    }
    else
    {
      switch(a2)
      {
        case 128:
          return objc_msgSend(*(id *)(result + 32), "setTransitionModifiers:", 0);
        case 256:
          v2 = *(void **)(result + 32);
          v3 = 0;
          v4 = *MEMORY[0x1E0C9D538];
          v6 = 0;
          v7 = 0;
          v5 = 0;
          return objc_msgSend(v2, "setTransitionInputs:", &v3);
        case 512:
          return objc_msgSend(*(id *)(result + 32), "setScale:", 1.0);
      }
    }
  }
  else if (a2 > 15)
  {
    switch(a2)
    {
      case 16:
        return objc_msgSend(*(id *)(result + 32), "setView:", 0);
      case 32:
        return objc_msgSend(*(id *)(result + 32), "setLegibilitySettings:", 0);
      case 64:
        return objc_msgSend(*(id *)(result + 32), "setColor:", 0);
    }
  }
  else
  {
    switch(a2)
    {
      case 1:
        result = objc_msgSend(*(id *)(result + 32), "setHidden:", 0);
        break;
      case 2:
        result = objc_msgSend(*(id *)(result + 32), "setOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
        break;
      case 4:
        result = objc_msgSend(*(id *)(result + 32), "setValue:", 0);
        break;
      case 8:
        result = objc_msgSend(*(id *)(result + 32), "setFlag:", 0x7FFFFFFFFFFFFFFFLL);
        break;
      default:
        return result;
    }
  }
  return result;
}

- (id)description
{
  return -[CSComponent descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isEqual:(id)a3
{
  CSComponent *v4;
  int64_t type;
  unint64_t properties;
  int64_t priority;
  unint64_t transitionModifiers;
  _BOOL4 hidden;
  int64_t flag;
  unint64_t level;
  BOOL v12;
  __int128 v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  BOOL v25;
  _UILegibilitySettings *legibilitySettings;
  _BOOL4 v27;
  BOOL v28;
  _OWORD v30[3];
  _OWORD v31[3];

  v4 = (CSComponent *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    if (!-[CSComponent isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
      goto LABEL_36;
    type = self->_type;
    if (type != -[CSComponent type](v4, "type"))
      goto LABEL_36;
    properties = self->_properties;
    if (properties != -[CSComponent properties](v4, "properties"))
      goto LABEL_36;
    priority = self->_priority;
    if (priority != -[CSComponent priority](v4, "priority"))
      goto LABEL_36;
    transitionModifiers = self->_transitionModifiers;
    if (transitionModifiers != -[CSComponent transitionModifiers](v4, "transitionModifiers"))
      goto LABEL_36;
    hidden = self->_hidden;
    if (hidden != -[CSComponent isHidden](v4, "isHidden"))
      goto LABEL_36;
    flag = self->_flag;
    if (flag != -[CSComponent flag](v4, "flag"))
      goto LABEL_36;
    -[CSComponent alpha](v4, "alpha");
    if (!BSFloatEqualToFloat())
      goto LABEL_36;
    -[CSComponent scale](v4, "scale");
    if (!BSFloatEqualToFloat())
      goto LABEL_36;
    -[CSComponent animationDuration](v4, "animationDuration");
    if (!BSFloatEqualToFloat())
      goto LABEL_36;
    -[CSComponent blurRadius](v4, "blurRadius");
    if (!BSFloatEqualToFloat())
      goto LABEL_36;
    level = self->_level;
    if (level != -[CSComponent level](v4, "level"))
      goto LABEL_36;
    -[CSComponent offset](v4, "offset");
    if (!BSPointEqualToPoint())
      goto LABEL_36;
    if (v4)
      -[CSComponent transitionInputs](v4, "transitionInputs");
    else
      memset(v31, 0, sizeof(v31));
    v13 = *(_OWORD *)&self->_transitionInputs.targetOffset.y;
    v30[0] = *(_OWORD *)&self->_transitionInputs.duration;
    v30[1] = v13;
    v30[2] = *(_OWORD *)&self->_transitionInputs.blurRadius;
    if (!ComponentTransitionInputsEqualToComponentTransitionInputs((uint64_t)v30, (uint64_t)v31))
      goto LABEL_36;
    -[CSComponent identifier](v4, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = BSEqualStrings();

    if (!v15)
      goto LABEL_36;
    -[CSComponent string](v4, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = BSEqualStrings();

    if (!v17)
      goto LABEL_36;
    -[CSComponent color](v4, "color");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = BSEqualObjects();

    if (!v19)
      goto LABEL_36;
    -[CSComponent value](v4, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = BSEqualObjects();

    if (!v21)
      goto LABEL_36;
    -[CSComponent view](v4, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = BSEqualObjects();

    if (v23)
    {
      -[CSComponent legibilitySettings](v4, "legibilitySettings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      legibilitySettings = self->_legibilitySettings;
      if (v24)
        v27 = 1;
      else
        v27 = legibilitySettings == 0;
      if (legibilitySettings)
        v28 = 0;
      else
        v28 = v24 != 0;
      if (v27 && !v28)
        v25 = !legibilitySettings
           || -[_UILegibilitySettings sb_isEqualToLegibilitySettings:](legibilitySettings, "sb_isEqualToLegibilitySettings:", v24);

      v12 = v25;
    }
    else
    {
LABEL_36:
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  return self->_type;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  +[CSComponent componentWithType:](CSComponent, "componentWithType:", -[CSComponent type](self, "type", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSComponent identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  objc_msgSend(v4, "setHidden:", -[CSComponent isHidden](self, "isHidden"));
  objc_msgSend(v4, "setFlag:", -[CSComponent flag](self, "flag"));
  -[CSComponent alpha](self, "alpha");
  objc_msgSend(v4, "setAlpha:");
  -[CSComponent string](self, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setString:", v6);

  -[CSComponent color](self, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v7);

  -[CSComponent offset](self, "offset");
  objc_msgSend(v4, "setOffset:");
  objc_msgSend(v4, "setPriority:", -[CSComponent priority](self, "priority"));
  -[CSComponent value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v8);

  -[CSComponent view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setView:", v9);

  -[CSComponent legibilitySettings](self, "legibilitySettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLegibilitySettings:", v10);

  objc_msgSend(v4, "setTransitionModifiers:", -[CSComponent transitionModifiers](self, "transitionModifiers"));
  -[CSComponent transitionInputs](self, "transitionInputs");
  objc_msgSend(v4, "setTransitionInputs:", &v12);
  -[CSComponent scale](self, "scale");
  objc_msgSend(v4, "setScale:");
  -[CSComponent animationDuration](self, "animationDuration");
  objc_msgSend(v4, "setAnimationDuration:");
  -[CSComponent blurRadius](self, "blurRadius");
  objc_msgSend(v4, "setBlurRadius:");
  objc_msgSend(v4, "setLevel:", -[CSComponent level](self, "level"));
  objc_msgSend(v4, "setProperties:", -[CSComponent properties](self, "properties"));
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CSComponent succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  unint64_t properties;
  id v9;
  _QWORD *v10;
  uint8x8_t v11;
  int v12;
  unint64_t v13;
  id v14;
  _QWORD v16[2];
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  CSComponent *v20;
  char v21;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCoverSheetComponentType(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("type"));

  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  v7 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_priority, CFSTR("priority"));
  properties = self->_properties;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v17 = __41__CSComponent_succinctDescriptionBuilder__block_invoke;
  v18 = &unk_1E8E2F628;
  v9 = v3;
  v19 = v9;
  v20 = self;
  v10 = v16;
  if (properties)
  {
    v21 = 0;
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)properties);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.i32[0];
    if (v11.i32[0])
    {
      v13 = 0;
      do
      {
        if (((1 << v13) & properties) != 0)
        {
          ((void (*)(_QWORD *))v17)(v10);
          if (v21)
            break;
          --v12;
        }
        if (v13 > 0x3E)
          break;
        ++v13;
      }
      while (v12 > 0);
    }
  }

  v14 = v9;
  return v14;
}

void __41__CSComponent_succinctDescriptionBuilder__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  const __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  _OWORD v22[3];

  if (a2 <= 127)
  {
    switch(a2)
    {
      case 1:
        v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isHidden"), CFSTR("hidden"));
        v4 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "alpha");
        v5 = CFSTR("alpha");
        goto LABEL_25;
      case 2:
        v10 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "offset");
        v11 = (id)objc_msgSend(v10, "appendPoint:withName:", CFSTR("offset"));
        return;
      case 3:
      case 5:
      case 6:
      case 7:
        return;
      case 4:
        v12 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "value");
        v13 = objc_claimAutoreleasedReturnValue();
        v21 = (id)v13;
        v14 = CFSTR("value");
        goto LABEL_19;
      case 8:
        v12 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "flag");
        BSSettingFlagDescription();
        v13 = objc_claimAutoreleasedReturnValue();
        v21 = (id)v13;
        v14 = CFSTR("flag");
LABEL_19:
        v15 = (id)objc_msgSend(v12, "appendObject:withName:", v13, v14);
        goto LABEL_29;
      default:
        if (a2 == 32)
        {
          v7 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "legibilitySettings");
          v21 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "succinctDescription");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = CFSTR("legibility");
        }
        else
        {
          if (a2 != 64)
            return;
          v7 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "color");
          v21 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "description");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = CFSTR("color");
        }
        objc_msgSend(v7, "appendString:withName:", v8, v9);

        break;
    }
    goto LABEL_29;
  }
  if (a2 > 1023)
  {
    if (a2 == 1024)
    {
      v4 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "animationDuration");
      v5 = CFSTR("animation duration");
    }
    else
    {
      if (a2 != 2048)
      {
        if (a2 == 4096)
          v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "level"), CFSTR("level"));
        return;
      }
      v4 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "blurRadius");
      v5 = CFSTR("blur radius");
    }
LABEL_25:
    v19 = (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", v5, 2);
    return;
  }
  if (a2 == 128)
  {
    v16 = *(void **)(a1 + 32);
    NSStringFromTransitionModifiers(objc_msgSend(*(id *)(a1 + 40), "transitionModifiers"));
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendString:withName:", v21, CFSTR("transitionModifiers"));
LABEL_29:

    return;
  }
  if (a2 != 256)
  {
    if (a2 != 512)
      return;
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "scale");
    v5 = CFSTR("scale");
    goto LABEL_25;
  }
  v18 = *(void **)(a1 + 32);
  v17 = *(void **)(a1 + 40);
  if (v17)
    objc_msgSend(v17, "transitionInputs");
  else
    memset(v22, 0, sizeof(v22));
  NSStringFromComponentTransitionInputs((uint64_t)v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendString:withName:", v20, CFSTR("transitionInputs"));

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CSComponent descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unint64_t)properties
{
  return self->_properties;
}

- (void)setProperties:(unint64_t)a3
{
  self->_properties = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (int64_t)flag
{
  return self->_flag;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIColor)color
{
  return self->_color;
}

- (NSNumber)value
{
  return self->_value;
}

- (UIView)view
{
  return self->_view;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (unint64_t)transitionModifiers
{
  return self->_transitionModifiers;
}

- ($240ACAF3E4AB77FC88882056553A3BB1)transitionInputs
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var1.y;
  *(_OWORD *)&retstr->var1.y = v3;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&self[4].var0;
  return self;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (unint64_t)level
{
  return self->_level;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
