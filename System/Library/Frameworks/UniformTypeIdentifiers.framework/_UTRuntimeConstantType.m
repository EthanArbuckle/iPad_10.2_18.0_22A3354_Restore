@implementation _UTRuntimeConstantType

+ (id)typeWithIdentifier:(id)a3 bundle:(id)a4 infoPlistKey:(__CFString *)a5
{
  _QWORD *Instance;
  void *v10;
  void *v11;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 0, a4, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTCoreTypes.mm"), 685, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  Instance = class_createInstance((Class)a1, 0);
  if (!Instance)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTCoreTypes.mm"), 688, CFSTR("Failed to allocate instance of %@."), a1);

  }
  Instance[2] = objc_msgSend(a3, "copy");
  return Instance;
}

- (void)dealloc
{
  NSString *identifier;
  objc_super v4;

  identifier = self->super._fields.identifier;
  if (identifier)
    CFRelease(identifier);
  v4.receiver = self;
  v4.super_class = (Class)_UTRuntimeConstantType;
  -[_UTRuntimeConstantType dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
