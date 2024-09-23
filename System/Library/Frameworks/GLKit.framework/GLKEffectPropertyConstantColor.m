@implementation GLKEffectPropertyConstantColor

- (GLKEffectPropertyConstantColor)init
{
  GLKEffectPropertyConstantColor *v2;
  GLKEffectPropertyConstantColor *v3;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GLKEffectPropertyConstantColor;
  v2 = -[GLKEffectProperty init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    __asm { FMOV            V0.4S, #1.0 }
    v2->_color = _Q0;
    -[GLKEffectProperty setNameString:](v2, "setNameString:", "a_color");
    v3->_enabled = 1;
  }
  return v3;
}

- (void)setShaderBindings
{
  GLint params;

  if (self->_enabled)
  {
    params = 0;
    glGetIntegerv(0x8B8Du, &params);
    -[GLKEffectProperty setLocation:](self, "setLocation:", glGetAttribLocation(params, -[GLKEffectProperty nameString](self, "nameString")));
  }
}

- (void)bind
{
  if (self->_enabled)
    glVertexAttrib4fv(-[GLKEffectProperty location](self, "location"), &self->_color.x);
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ = %p\n{\n"), objc_msgSend((id)objc_opt_class(), "description"), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("\t{%7.3f,%7.3f,%7.3f,%7.3f}\n"), self->_color.x, self->_color.y, self->_color.z, self->_color.w);
  objc_msgSend(v3, "appendFormat:", CFSTR("}"));
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GLKEffectPropertyConstantColor;
  -[GLKEffectProperty dealloc](&v2, sel_dealloc);
}

- (_GLKVector4)color
{
  _GLKVector4 result;

  *(_QWORD *)&result.v[2] = a2;
  *(_QWORD *)&result.x = self;
  return result;
}

- (void)setColor:(_GLKVector4)a3
{
  float v3;
  float v4;
  float v5;
  float v6;

  self->_color.x = v3;
  self->_color.y = v4;
  self->_color.z = v5;
  self->_color.w = v6;
}

- (unsigned)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(unsigned __int8)a3
{
  self->_enabled = a3;
}

@end
