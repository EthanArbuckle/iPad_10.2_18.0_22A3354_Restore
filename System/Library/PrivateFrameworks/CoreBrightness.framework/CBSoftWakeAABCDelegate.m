@implementation CBSoftWakeAABCDelegate

- (BOOL)isActive
{
  return self->_state == 1;
}

+ (BOOL)isSupported
{
  return CBU_IsSoftWakeSupported();
}

- (CBSoftWakeAABCDelegate)init
{
  _DWORD v3[41];
  objc_super v4;
  SEL v5;
  CBSoftWakeAABCDelegate *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CBSoftWakeAABCDelegate;
  v6 = -[CBSoftWakeAABCDelegate init](&v4, sel_init);
  if (v6)
  {
    v8 = xmmword_1B5459B20;
    v7 = xmmword_1B5459B30;
    createCustomCurve((const float *)&v8, (const float *)&v7, 4u, v3);
    memcpy(&v6->_curve, v3, sizeof(v6->_curve));
    v6->_state = 0;
  }
  return v6;
}

- (int64_t)action:(int64_t)a3
{
  if ((canTransition(self->_state, a3) & 1) == 0)
    return 1;
  self->_state = a3;
  return 0;
}

- (CustomCurve)curve
{
  return (CustomCurve *)memcpy(retstr, &self->_curve, sizeof(CustomCurve));
}

@end
