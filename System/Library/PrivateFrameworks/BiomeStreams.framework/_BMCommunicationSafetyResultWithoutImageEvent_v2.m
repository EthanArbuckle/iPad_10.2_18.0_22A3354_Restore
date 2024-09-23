@implementation _BMCommunicationSafetyResultWithoutImageEvent_v2

- (_BMCommunicationSafetyResultWithoutImageEvent_v2)initWithProtoData:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_BMCommunicationSafetyResultWithoutImageEvent_v2;
  return -[BMCommunicationSafetyResultEvent initWithProtoData:skipImage:](&v4, sel_initWithProtoData_skipImage_, a3, 1);
}

@end
