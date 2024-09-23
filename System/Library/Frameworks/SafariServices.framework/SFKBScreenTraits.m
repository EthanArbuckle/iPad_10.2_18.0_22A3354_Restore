@implementation SFKBScreenTraits

+ (id)traitsWithScreen:(id)a3 orientation:(int64_t)a4
{
  id v5;
  SFKBScreenTraits *v6;
  SFKBScreenTraits *v7;

  v5 = a3;
  if (+[SFKBScreenTraits instancesRespondToSelector:](SFKBScreenTraits, "instancesRespondToSelector:", sel_initWithScreen_orientation_allowFloating_ignoreRemoteKeyboard_))
  {
    v6 = -[UIKBScreenTraits initWithScreen:orientation:allowFloating:ignoreRemoteKeyboard:]([SFKBScreenTraits alloc], "initWithScreen:orientation:allowFloating:ignoreRemoteKeyboard:", v5, a4, 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3910], "traitsWithScreen:orientation:", v5, a4);
    v6 = (SFKBScreenTraits *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (BOOL)isKeyboardMinorEdgeWidth
{
  return self->_sf_isKeyboardMinorEdgeWidth;
}

- (BOOL)sf_isKeyboardMinorEdgeWidth
{
  return self->_sf_isKeyboardMinorEdgeWidth;
}

- (void)setSf_isKeyboardMinorEdgeWidth:(BOOL)a3
{
  self->_sf_isKeyboardMinorEdgeWidth = a3;
}

@end
