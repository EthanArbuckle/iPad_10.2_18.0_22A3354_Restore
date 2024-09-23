@implementation NSISInlineStorageVariable

- (int)valueRestriction
{
  return self->_valueRestriction;
}

- (int)nsis_orientationHintForVariable:(id)a3
{
  return 0;
}

- (id)markedConstraint
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSISInlineStorageVariable;
  -[NSISVariable dealloc](&v3, sel_dealloc);
}

- (void)setValueRestriction:(int)a3
{
  self->_valueRestriction = a3;
}

- (void)setValueIsUserObservable:(BOOL)a3
{
  self->_valueIsUserObservable = a3;
}

- (void)setShouldBeMinimized:(BOOL)a3
{
  self->_shouldBeMinimized = a3;
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSISInlineStorageVariable)initWithCoder:(id)a3
{
  NSISInlineStorageVariable *v4;
  int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSISInlineStorageVariable;
  v4 = -[NSISVariable initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v4->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSISVariable_name")), "copy");
    v5 = objc_msgSend(a3, "containsValueForKey:", CFSTR("NSISVariable_valueRestriction"));
    if (v5)
      v5 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSISVariable_valueRestriction"));
    v4->_valueRestriction = v5;
    v4->_shouldBeMinimized = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSISVariable_shouldBeMinimized"));
    v4->_valueIsUserObservable = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSISVariable_valueIsUserObservable"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  uint64_t valueRestriction;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSISInlineStorageVariable;
  -[NSISVariable encodeWithCoder:](&v7, sel_encodeWithCoder_);
  name = self->_name;
  if (name)
    objc_msgSend(a3, "encodeObject:forKey:", name, CFSTR("NSISVariable_name"));
  valueRestriction = self->_valueRestriction;
  if ((_DWORD)valueRestriction)
    objc_msgSend(a3, "encodeInteger:forKey:", valueRestriction, CFSTR("NSISVariable_valueRestriction"));
  if (self->_shouldBeMinimized)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSISVariable_shouldBeMinimized"));
  if (self->_valueIsUserObservable)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSISVariable_valueIsUserObservable"));
}

- (BOOL)nsis_valueOfVariableIsUserObservable:(id)a3
{
  return self->_valueIsUserObservable;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)shouldBeMinimized
{
  return self->_shouldBeMinimized;
}

- (BOOL)valueIsUserObservable
{
  return self->_valueIsUserObservable;
}

@end
