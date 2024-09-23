@implementation SCNTimingFunction

- (SCNTimingFunction)initWithTimingFunctionRef:(__C3DTimingFunction *)a3
{
  SCNTimingFunction *v4;
  __C3DTimingFunction *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNTimingFunction;
  v4 = -[SCNTimingFunction init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (__C3DTimingFunction *)CFRetain(a3);
    else
      v5 = 0;
    v4->_timingFunction = v5;
  }
  return v4;
}

- (void)dealloc
{
  __C3DTimingFunction *timingFunction;
  objc_super v4;

  timingFunction = self->_timingFunction;
  if (timingFunction)
  {
    CFRelease(timingFunction);
    self->_timingFunction = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNTimingFunction;
  -[SCNTimingFunction dealloc](&v4, sel_dealloc);
}

+ (SCNTimingFunction)functionWithTimingMode:(SCNActionTimingMode)timingMode
{
  uint64_t v3;

  if ((unint64_t)timingMode <= SCNActionTimingModeEaseInEaseOut
    && (C3DTimingFunctionCreateWithName(*off_1EA5A2748[timingMode]), v3))
  {
    return -[SCNTimingFunction initWithTimingFunctionRef:]([SCNTimingFunction alloc], "initWithTimingFunctionRef:", v3);
  }
  else
  {
    return 0;
  }
}

+ (SCNTimingFunction)functionWithCAMediaTimingFunction:(CAMediaTimingFunction *)caTimingFunction
{
  id v3;

  if (caTimingFunction && (v3 = C3DTimingFunctionFromCAMediaTimingFunction(caTimingFunction)) != 0)
    return -[SCNTimingFunction initWithTimingFunctionRef:]([SCNTimingFunction alloc], "initWithTimingFunctionRef:", v3);
  else
    return 0;
}

- (__C3DTimingFunction)c3dTimingFunction
{
  return self->_timingFunction;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = (id)C3DCopyPropertyList(self->_timingFunction, 0, 0, 0);
  objc_msgSend(a3, "encodeObject:forKey:", v4, CFSTR("c3dTimingFunction"));

}

- (SCNTimingFunction)initWithCoder:(id)a3
{
  SCNTimingFunction *v4;
  const void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNTimingFunction;
  v4 = -[SCNTimingFunction init](&v7, sel_init);
  if (v4)
  {
    v5 = (const void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", SCNPlistClasses(), CFSTR("c3dTimingFunction"));
    v4->_timingFunction = (__C3DTimingFunction *)C3DTimingFunctionCreateWithPropertyList(v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
