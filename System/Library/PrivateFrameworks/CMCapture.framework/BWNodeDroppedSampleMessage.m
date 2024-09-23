@implementation BWNodeDroppedSampleMessage

- (BWDroppedSample)droppedSample
{
  return self->_droppedSample;
}

- (_QWORD)_initWithDroppedSample:(void *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)BWNodeDroppedSampleMessage;
  v3 = objc_msgSendSuper2(&v6, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[1] = 0x200000002;
    v3[2] = a2;
  }
  return v4;
}

+ (id)newMessageWithDroppedSample:(id)a3
{
  return -[BWNodeDroppedSampleMessage _initWithDroppedSample:]([BWNodeDroppedSampleMessage alloc], a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWNodeDroppedSampleMessage;
  -[BWNodeDroppedSampleMessage dealloc](&v3, sel_dealloc);
}

@end
