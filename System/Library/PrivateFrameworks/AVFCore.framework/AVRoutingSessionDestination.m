@implementation AVRoutingSessionDestination

- (AVRoutingSessionDestination)initWithFigRoutingSessionDestination:(__CFDictionary *)a3
{
  AVRoutingSessionDestination *v4;
  AVRoutingSessionDestinationInternal *ivars;
  __CFDictionary *v6;
  AVRoutingSessionDestination *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVRoutingSessionDestination;
  v4 = -[AVRoutingSessionDestination init](&v9, sel_init);
  if (v4
    && (ivars = objc_alloc_init(AVRoutingSessionDestinationInternal), (v4->_ivars = ivars) != 0)
    && (!a3 ? (v6 = 0) : (__CFDictionary *)(v6 = (__CFDictionary *)CFRetain(a3), ivars = v4->_ivars),
        ivars->figDestination = v6,
        v4->_ivars->figDestination))
  {
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (AVRoutingSessionDestination)init
{
  return -[AVRoutingSessionDestination initWithFigRoutingSessionDestination:](self, "initWithFigRoutingSessionDestination:", 0);
}

- (void)dealloc
{
  AVRoutingSessionDestinationInternal *ivars;
  __CFDictionary *figDestination;
  objc_super v5;

  ivars = self->_ivars;
  if (ivars)
  {
    figDestination = ivars->figDestination;
    if (figDestination)
    {
      CFRelease(figDestination);
      ivars = self->_ivars;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVRoutingSessionDestination;
  -[AVRoutingSessionDestination dealloc](&v5, sel_dealloc);
}

- (id)description
{
  _BOOL4 v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  const __CFString *v7;
  float v8;
  const __CFString *v10;

  v10 = 0;
  v3 = -[AVRoutingSessionDestination _canQueryOutputDeviceDescriptionsAndReturnCurrentValue:](self, "_canQueryOutputDeviceDescriptionsAndReturnCurrentValue:", &v10);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if (v3)
    v7 = v10;
  else
    v7 = CFSTR("<missing entitlement>");
  -[AVRoutingSessionDestination probability](self, "probability");
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, outputDeviceDescriptions=%@, probability=%f, providesExternalVideoPlayback=%@>"), v6, self, v7, v8, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVRoutingSessionDestination providesExternalVideoPlayback](self, "providesExternalVideoPlayback")));
}

- (NSArray)outputDeviceDescriptions
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  uint64_t v11;
  NSArray *v12;

  v12 = 0;
  if (!-[AVRoutingSessionDestination _canQueryOutputDeviceDescriptionsAndReturnCurrentValue:](self, "_canQueryOutputDeviceDescriptionsAndReturnCurrentValue:", &v12))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Missing required entitlement com.apple.avfoundation.allow-identifying-output-device-details"), v4, v5, v6, v7, v8, v11), 0);
    objc_exception_throw(v10);
  }
  return v12;
}

- (BOOL)_canQueryOutputDeviceDescriptionsAndReturnCurrentValue:(id *)a3
{
  const __CFArray *Value;
  const __CFArray *v5;
  void *v6;
  CFIndex v7;
  AVOutputDevice *v8;

  Value = (const __CFArray *)CFDictionaryGetValue(self->_ivars->figDestination, (const void *)*MEMORY[0x1E0D48DD0]);
  if (Value)
  {
    v5 = Value;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (CFArrayGetCount(v5) >= 1)
    {
      v7 = 0;
      do
      {
        v8 = +[AVOutputDevice outputDeviceWithRouteDescriptor:withRoutingContext:](AVOutputDevice, "outputDeviceWithRouteDescriptor:withRoutingContext:", CFArrayGetValueAtIndex(v5, v7), 0);
        if (v8)
          objc_msgSend(v6, "addObject:", v8);
        ++v7;
      }
      while (v7 < CFArrayGetCount(v5));
    }
    LOBYTE(Value) = v6 != 0;
    if (a3 && v6)
    {
      *a3 = v6;
      LOBYTE(Value) = 1;
    }
  }
  return (char)Value;
}

- (float)probability
{
  FigCFDictionaryGetFloatIfPresent();
  return 0.0;
}

- (BOOL)providesExternalVideoPlayback
{
  FigCFDictionaryGetBooleanIfPresent();
  return 0;
}

@end
