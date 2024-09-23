@implementation _NSBundleODRTag

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSBundleODRTag)initWithCoder:(id)a3
{
  _NSBundleODRTag *v4;
  double v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_NSBundleODRTag;
  v4 = -[_NSBundleODRTag init](&v7, sel_init);
  if (v4)
  {
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("pp"));
    v4->_preservationPriority = v5;
    v4->_alwaysPreserved = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("always"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("pp"), self->_preservationPriority);
  objc_msgSend(a3, "encodeBool:forKey:", self->_alwaysPreserved, CFSTR("always"));
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_NSBundleODRTag;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ preservation: %f always: %d"), -[_NSBundleODRTag description](&v3, sel_description), *(_QWORD *)&self->_preservationPriority, self->_alwaysPreserved);
}

- (double)preservationPriority
{
  return self->_preservationPriority;
}

- (void)setPreservationPriority:(double)a3
{
  self->_preservationPriority = a3;
}

- (BOOL)alwaysPreserved
{
  return self->_alwaysPreserved;
}

- (void)setAlwaysPreserved:(BOOL)a3
{
  self->_alwaysPreserved = a3;
}

@end
