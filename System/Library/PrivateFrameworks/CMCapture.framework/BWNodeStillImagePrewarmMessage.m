@implementation BWNodeStillImagePrewarmMessage

+ (id)newMessageWithStillImageSettings:(id)a3
{
  return -[BWNodeStillImagePrewarmMessage _initWithStillImageSettings:]([BWNodeStillImagePrewarmMessage alloc], a3);
}

- (_QWORD)_initWithStillImageSettings:(void *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)BWNodeStillImagePrewarmMessage;
  v3 = objc_msgSendSuper2(&v6, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[1] = 0x700000001;
    v3[2] = a2;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWNodeStillImagePrewarmMessage;
  -[BWNodeStillImagePrewarmMessage dealloc](&v3, sel_dealloc);
}

- (BWStillImageSettings)stillImageSettings
{
  return self->_stillImageSettings;
}

@end
