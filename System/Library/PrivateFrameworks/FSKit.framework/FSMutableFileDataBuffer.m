@implementation FSMutableFileDataBuffer

- (unint64_t)capacity
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FSMutableFileDataBuffer;
  return -[FSFileDataBuffer internalCapacity](&v3, sel_internalCapacity);
}

+ (id)dataWithLength:(unint64_t)a3
{
  return -[FSFileDataBuffer initWithLength:]([FSMutableFileDataBuffer alloc], "initWithLength:", a3);
}

+ (id)dataWithCapacity:(unint64_t)a3
{
  return -[FSMutableFileDataBuffer initWithCapacity:]([FSMutableFileDataBuffer alloc], "initWithCapacity:", a3);
}

- (FSMutableFileDataBuffer)initWithCapacity:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FSMutableFileDataBuffer;
  return -[FSFileDataBuffer initWithCapacity:andLength:](&v4, sel_initWithCapacity_andLength_, a3, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FSMutableFileDataBuffer;
  -[FSFileDataBuffer encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be encoded by an NSXPCCoder."), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }

}

- (FSMutableFileDataBuffer)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FSMutableFileDataBuffer;
  return -[FSFileDataBuffer initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)withMutableBytes:(id)a3
{
  id v5;

  v5 = a3;
  (*((void (**)(id, void *))a3 + 2))(v5, -[FSMutableFileDataBuffer mutableBytes](self, "mutableBytes"));

}

@end
