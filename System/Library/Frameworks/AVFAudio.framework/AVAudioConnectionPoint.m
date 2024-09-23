@implementation AVAudioConnectionPoint

- (AVAudioConnectionPoint)init
{

  return 0;
}

- (AVAudioConnectionPoint)initWithNode:(AVAudioNode *)node bus:(AVAudioNodeBus)bus
{
  AVAudioConnectionPoint *result;
  objc_super v7;

  if (node)
  {
    v7.receiver = self;
    v7.super_class = (Class)AVAudioConnectionPoint;
    result = -[AVAudioConnectionPoint init](&v7, sel_init);
    if (result)
    {
      result->_node = node;
      result->_bus = bus;
    }
  }
  else
  {

    return 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVAudioConnectionPoint;
  -[AVAudioConnectionPoint dealloc](&v2, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && (AVAudioNode *)objc_msgSend(a3, "node") == self->_node
      && objc_msgSend(a3, "bus") == self->_bus;
}

- (unint64_t)hash
{
  return (unint64_t)&self->_node[2 * self->_bus + 60].super.isa - self->_bus + 1;
}

- (AVAudioNode)node
{
  return self->_node;
}

- (AVAudioNodeBus)bus
{
  return self->_bus;
}

+ (AVAudioConnectionPoint)connectionPointWithNode:(id)a3 bus:(unint64_t)a4
{
  return -[AVAudioConnectionPoint initWithNode:bus:]([AVAudioConnectionPoint alloc], "initWithNode:bus:", a3, a4);
}

@end
