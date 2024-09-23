@implementation _GCHIDEventIOKitClient

- (_GCHIDEventIOKitClient)initWithClient:(__IOHIDEventSystemClient *)a3 queue:(id)a4
{
  id v7;
  _GCHIDEventIOKitClient *v8;
  void *v10;
  objc_super v11;

  v7 = a4;
  if (!a3)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCHIDEventIOKitClient.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client != NULL"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_GCHIDEventIOKitClient;
  v8 = -[_GCHIDEventSubject init](&v11, sel_init);
  if (v8)
  {
    v8->_ioClient = (__IOHIDEventSystemClient *)CFRetain(a3);
    IOHIDEventSystemClientRegisterEventCallback();
  }

  return v8;
}

- (_GCHIDEventIOKitClient)init
{
  -[_GCHIDEventIOKitClient doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_ioClient);
  self->_ioClient = 0;
  v3.receiver = self;
  v3.super_class = (Class)_GCHIDEventIOKitClient;
  -[_GCHIDEventIOKitClient dealloc](&v3, sel_dealloc);
}

@end
