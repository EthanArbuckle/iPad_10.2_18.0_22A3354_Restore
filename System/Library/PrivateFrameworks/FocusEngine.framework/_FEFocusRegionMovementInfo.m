@implementation _FEFocusRegionMovementInfo

+ (id)_movementWithHeading:(unint64_t)a3 linearHeading:(unint64_t)a4 originatingHeading:(unint64_t)a5 isInitial:(BOOL)a6 inputType:(unint64_t)a7
{
  void *v8;

  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:", a3, a4, a6, 1, 0, 0, a7);
  objc_msgSend(v8, "setOriginatingHeading:", a5);
  return v8;
}

- (unint64_t)originatingHeading
{
  return self->_originatingHeading;
}

- (void)setOriginatingHeading:(unint64_t)a3
{
  self->_originatingHeading = a3;
}

@end
