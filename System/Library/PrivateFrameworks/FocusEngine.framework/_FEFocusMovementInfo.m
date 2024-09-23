@implementation _FEFocusMovementInfo

+ (id)_movementWithHeading:(unint64_t)a3 isInitial:(BOOL)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:", a3, 0, a4, 1, 0, 0, 5);
}

+ (id)_movementWithHeading:(unint64_t)a3 isInitial:(BOOL)a4 fallbackMovementOriginatingFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v9;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:", a3, 0, a4, 1, 0, 0, 5);
  objc_msgSend(v9, "_setFallbackMovementOriginatingFrame:", x, y, width, height);
  return v9;
}

- (_FEFocusMovementInfo)init
{
  _FEFocusMovementInfo *result;
  CGSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_FEFocusMovementInfo;
  result = -[_FEFocusMovementInfo init](&v4, sel_init);
  if (result)
  {
    result->_heading = 0;
    result->_linearHeading = 0;
    result->_velocity.dx = 0.0;
    result->_velocity.dy = 0.0;
    *(_DWORD *)&result->_looping = 65792;
    v3 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    result->_fallbackMovementOriginatingFrame.origin = (CGPoint)*MEMORY[0x24BDBF070];
    result->_fallbackMovementOriginatingFrame.size = v3;
    result->_groupFilter = 0;
    result->_inputType = 0;
  }
  return result;
}

- (_FEFocusMovementInfo)initWithHeading:(unint64_t)a3 velocity:(CGVector)a4 isInitial:(BOOL)a5 shouldLoadScrollableContainer:(BOOL)a6 groupFilter:(int64_t)a7 inputType:(unint64_t)a8
{
  double dy;
  double dx;
  _FEFocusMovementInfo *result;
  double v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;

  dy = a4.dy;
  dx = a4.dx;
  result = -[_FEFocusMovementInfo init](self, "init");
  if (result)
  {
    if (!a3)
    {
      v16 = fabs(dx);
      v17 = 8;
      v18 = 4;
      if (dx >= 0.0)
        v18 = 0;
      if (dx <= 0.0)
        v17 = v18;
      if (v16 >= 0.0001)
        a3 = v17;
      else
        a3 = 0;
      if (fabs(dy) >= 0.0001)
      {
        v19 = a3 | 1;
        if (dy >= 0.0)
          v19 = a3;
        if (dy > 0.0)
          a3 |= 2uLL;
        else
          a3 = v19;
      }
    }
    result->_heading = a3;
    result->_velocity.dx = dx;
    result->_velocity.dy = dy;
    result->_isVelocityBased = 1;
    result->_isInitialMovement = a5;
    result->_shouldLoadScrollableContainer = a6;
    result->_groupFilter = a7;
    result->_inputType = a8;
  }
  return result;
}

- (_FEFocusMovementInfo)initWithHeading:(unint64_t)a3 linearHeading:(unint64_t)a4 isInitial:(BOOL)a5 shouldLoadScrollableContainer:(BOOL)a6 looping:(BOOL)a7 groupFilter:(int64_t)a8 inputType:(unint64_t)a9
{
  _FEFocusMovementInfo *v15;
  _FEFocusMovementInfo *v16;
  CGFloat v17;

  v15 = -[_FEFocusMovementInfo init](self, "init");
  v16 = v15;
  if (v15)
  {
    v15->_heading = a3;
    v15->_linearHeading = a4;
    v15->_velocity.dx = _UIVectorForFocusHeading(a3);
    v16->_velocity.dy = v17;
    v16->_isVelocityBased = 0;
    v16->_isInitialMovement = a5;
    v16->_shouldLoadScrollableContainer = a6;
    v16->_looping = a7;
    v16->_groupFilter = a8;
    v16->_inputType = a9;
  }
  return v16;
}

- (_FEFocusMovementInfo)initWithHeading:(unint64_t)a3 velocity:(CGVector)a4 isInitial:(BOOL)a5 shouldLoadScrollableContainer:(BOOL)a6 groupFilter:(int64_t)a7
{
  return -[_FEFocusMovementInfo initWithHeading:velocity:isInitial:shouldLoadScrollableContainer:groupFilter:inputType:](self, "initWithHeading:velocity:isInitial:shouldLoadScrollableContainer:groupFilter:inputType:", a3, a5, a6, a7, 5, a4.dx, a4.dy);
}

- (_FEFocusMovementInfo)initWithHeading:(unint64_t)a3 linearHeading:(unint64_t)a4 isInitial:(BOOL)a5 shouldLoadScrollableContainer:(BOOL)a6 looping:(BOOL)a7 groupFilter:(int64_t)a8
{
  return -[_FEFocusMovementInfo initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:](self, "initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:", a3, a4, a5, a6, a7, a8, 5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CGSize *v4;
  CGSize size;

  v4 = (CGSize *)objc_alloc_init((Class)objc_opt_class());
  -[CGSize _setHeading:](v4, "_setHeading:", self->_heading);
  -[CGSize _setLinearHeading:](v4, "_setLinearHeading:", self->_linearHeading);
  -[CGSize _setVelocity:](v4, "_setVelocity:", self->_velocity.dx, self->_velocity.dy);
  -[CGSize _setIsVelocityBased:](v4, "_setIsVelocityBased:", self->_isVelocityBased);
  -[CGSize _setIsInitialMovement:](v4, "_setIsInitialMovement:", self->_isInitialMovement);
  -[CGSize _setShouldLoadScrollableContainer:](v4, "_setShouldLoadScrollableContainer:", self->_shouldLoadScrollableContainer);
  -[CGSize _setLooping:](v4, "_setLooping:", self->_looping);
  -[CGSize _setGroupFilter:](v4, "_setGroupFilter:", self->_groupFilter);
  -[CGSize _setInputType:](v4, "_setInputType:", self->_inputType);
  size = self->_fallbackMovementOriginatingFrame.size;
  v4[4] = (CGSize)self->_fallbackMovementOriginatingFrame.origin;
  v4[5] = size;
  return v4;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _FEStringFromFocusHeading(-[_FEFocusMovementInfo heading](self, "heading"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; heading = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)_isLinearMovement
{
  return self->_linearHeading || (-[_FEFocusMovementInfo heading](self, "heading") & 0x330) != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_FEFocusMovementInfo)initWithXPCDictionary:(id)a3
{
  id v4;
  _FEFocusMovementInfo *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_FEFocusMovementInfo;
  v5 = -[_FEFocusMovementInfo init](&v11, sel_init);
  if (v5)
  {
    v5->_heading = xpc_dictionary_get_int64(v4, (const char *)objc_msgSend(CFSTR("FocusMovementHeadingKey"), "UTF8String"));
    v5->_linearHeading = xpc_dictionary_get_int64(v4, (const char *)objc_msgSend(CFSTR("FocusMovementLinearHeadingKey"), "UTF8String"));
    v5->_velocity.dx = xpc_dictionary_get_double(v4, (const char *)objc_msgSend(CFSTR("FocusMovementVelocityXKey"), "UTF8String"));
    v5->_velocity.dy = xpc_dictionary_get_double(v4, (const char *)objc_msgSend(CFSTR("FocusMovementVelocityYKey"), "UTF8String"));
    v5->_isVelocityBased = xpc_dictionary_get_BOOL(v4, (const char *)objc_msgSend(CFSTR("FocusMovementIsVelocityBasedKey"), "UTF8String"));
    v5->_isInitialMovement = xpc_dictionary_get_BOOL(v4, (const char *)objc_msgSend(CFSTR("FocusMovementIsInitialMovementKey"), "UTF8String"));
    v5->_shouldLoadScrollableContainer = xpc_dictionary_get_BOOL(v4, (const char *)objc_msgSend(CFSTR("FocusMovementShouldLoadScrollableContainerKey"), "UTF8String"));
    v5->_looping = xpc_dictionary_get_BOOL(v4, (const char *)objc_msgSend(CFSTR("FocusMovementLoopingKey"), "UTF8String"));
    v5->_groupFilter = xpc_dictionary_get_int64(v4, (const char *)objc_msgSend(CFSTR("FocusMovementGroupFilterKey"), "UTF8String"));
    v5->_inputType = xpc_dictionary_get_int64(v4, (const char *)objc_msgSend(CFSTR("FocusMovementInputTypeKey"), "UTF8String"));
    objc_msgSend(CFSTR("FocusMovementFallbackOriginatingFrameKey"), "UTF8String");
    BSDeserializeCGRectFromXPCDictionaryWithKey();
    v5->_fallbackMovementOriginatingFrame.origin.x = v6;
    v5->_fallbackMovementOriginatingFrame.origin.y = v7;
    v5->_fallbackMovementOriginatingFrame.size.width = v8;
    v5->_fallbackMovementOriginatingFrame.size.height = v9;
  }

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("FocusMovementHeadingKey"), "UTF8String"), self->_heading);
  xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("FocusMovementLinearHeadingKey"), "UTF8String"), self->_linearHeading);
  xpc_dictionary_set_double(xdict, (const char *)objc_msgSend(CFSTR("FocusMovementVelocityXKey"), "UTF8String"), self->_velocity.dx);
  xpc_dictionary_set_double(xdict, (const char *)objc_msgSend(CFSTR("FocusMovementVelocityYKey"), "UTF8String"), self->_velocity.dy);
  xpc_dictionary_set_BOOL(xdict, (const char *)objc_msgSend(CFSTR("FocusMovementIsVelocityBasedKey"), "UTF8String"), self->_isVelocityBased);
  xpc_dictionary_set_BOOL(xdict, (const char *)objc_msgSend(CFSTR("FocusMovementIsInitialMovementKey"), "UTF8String"), self->_isInitialMovement);
  xpc_dictionary_set_BOOL(xdict, (const char *)objc_msgSend(CFSTR("FocusMovementShouldLoadScrollableContainerKey"), "UTF8String"), self->_shouldLoadScrollableContainer);
  xpc_dictionary_set_BOOL(xdict, (const char *)objc_msgSend(CFSTR("FocusMovementLoopingKey"), "UTF8String"), self->_looping);
  xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("FocusMovementGroupFilterKey"), "UTF8String"), self->_groupFilter);
  xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("FocusMovementInputTypeKey"), "UTF8String"), self->_inputType);
  objc_msgSend(CFSTR("FocusMovementFallbackOriginatingFrameKey"), "UTF8String");
  BSSerializeCGRectToXPCDictionaryWithKey();

}

- (_FEFocusMovementInfo)initWithCoder:(id)a3
{
  id v4;
  _FEFocusMovementInfo *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_FEFocusMovementInfo;
  v5 = -[_FEFocusMovementInfo init](&v13, sel_init);
  if (v5)
  {
    v5->_heading = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FocusMovementHeadingKey"));
    v5->_linearHeading = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FocusMovementLinearHeadingKey"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FocusMovementVelocityXKey"));
    v5->_velocity.dx = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FocusMovementVelocityYKey"));
    v5->_velocity.dy = v7;
    v5->_isVelocityBased = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FocusMovementIsVelocityBasedKey"));
    v5->_isInitialMovement = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FocusMovementIsInitialMovementKey"));
    v5->_shouldLoadScrollableContainer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FocusMovementShouldLoadScrollableContainerKey"));
    v5->_looping = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FocusMovementLoopingKey"));
    v5->_groupFilter = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FocusMovementGroupFilterKey"));
    v5->_inputType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FocusMovementInputTypeKey"));
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("FocusMovementFallbackOriginatingFrameKey"));
    v5->_fallbackMovementOriginatingFrame.origin.x = v8;
    v5->_fallbackMovementOriginatingFrame.origin.y = v9;
    v5->_fallbackMovementOriginatingFrame.size.width = v10;
    v5->_fallbackMovementOriginatingFrame.size.height = v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[_FEFocusMovementInfo heading](self, "heading"), CFSTR("FocusMovementHeadingKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[_FEFocusMovementInfo _linearHeading](self, "_linearHeading"), CFSTR("FocusMovementLinearHeadingKey"));
  -[_FEFocusMovementInfo _velocity](self, "_velocity");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("FocusMovementVelocityXKey"));
  -[_FEFocusMovementInfo _velocity](self, "_velocity");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("FocusMovementVelocityYKey"), v4);
  objc_msgSend(v5, "encodeBool:forKey:", -[_FEFocusMovementInfo _isVelocityBased](self, "_isVelocityBased"), CFSTR("FocusMovementIsVelocityBasedKey"));
  objc_msgSend(v5, "encodeBool:forKey:", -[_FEFocusMovementInfo _isInitialMovement](self, "_isInitialMovement"), CFSTR("FocusMovementIsInitialMovementKey"));
  objc_msgSend(v5, "encodeBool:forKey:", -[_FEFocusMovementInfo _shouldLoadScrollableContainer](self, "_shouldLoadScrollableContainer"), CFSTR("FocusMovementShouldLoadScrollableContainerKey"));
  objc_msgSend(v5, "encodeBool:forKey:", -[_FEFocusMovementInfo _isLooping](self, "_isLooping"), CFSTR("FocusMovementLoopingKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[_FEFocusMovementInfo _groupFilter](self, "_groupFilter"), CFSTR("FocusMovementGroupFilterKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[_FEFocusMovementInfo _inputType](self, "_inputType"), CFSTR("FocusMovementInputTypeKey"));
  -[_FEFocusMovementInfo _fallbackMovementOriginatingFrame](self, "_fallbackMovementOriginatingFrame");
  objc_msgSend(v5, "encodeCGRect:forKey:", CFSTR("FocusMovementFallbackOriginatingFrameKey"));

}

- (unint64_t)heading
{
  return self->_heading;
}

- (void)_setHeading:(unint64_t)a3
{
  self->_heading = a3;
}

- (BOOL)_isLooping
{
  return self->_looping;
}

- (void)_setLooping:(BOOL)a3
{
  self->_looping = a3;
}

- (unint64_t)_linearHeading
{
  return self->_linearHeading;
}

- (void)_setLinearHeading:(unint64_t)a3
{
  self->_linearHeading = a3;
}

- (BOOL)_shouldLoadScrollableContainer
{
  return self->_shouldLoadScrollableContainer;
}

- (void)_setShouldLoadScrollableContainer:(BOOL)a3
{
  self->_shouldLoadScrollableContainer = a3;
}

- (CGVector)_velocity
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_velocity.dx;
  dy = self->_velocity.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (void)_setVelocity:(CGVector)a3
{
  self->_velocity = a3;
}

- (BOOL)_isInitialMovement
{
  return self->_isInitialMovement;
}

- (void)_setIsInitialMovement:(BOOL)a3
{
  self->_isInitialMovement = a3;
}

- (BOOL)_isVelocityBased
{
  return self->_isVelocityBased;
}

- (void)_setIsVelocityBased:(BOOL)a3
{
  self->_isVelocityBased = a3;
}

- (CGRect)_fallbackMovementOriginatingFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_fallbackMovementOriginatingFrame.origin.x;
  y = self->_fallbackMovementOriginatingFrame.origin.y;
  width = self->_fallbackMovementOriginatingFrame.size.width;
  height = self->_fallbackMovementOriginatingFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setFallbackMovementOriginatingFrame:(CGRect)a3
{
  self->_fallbackMovementOriginatingFrame = a3;
}

- (int64_t)_groupFilter
{
  return self->_groupFilter;
}

- (void)_setGroupFilter:(int64_t)a3
{
  self->_groupFilter = a3;
}

- (unint64_t)_inputType
{
  return self->_inputType;
}

- (void)_setInputType:(unint64_t)a3
{
  self->_inputType = a3;
}

@end
