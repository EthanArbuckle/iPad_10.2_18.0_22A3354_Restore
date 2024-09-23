@implementation MTLMotionKeyframeData

+ (MTLMotionKeyframeData)data
{
  return objc_alloc_init(MTLMotionKeyframeData);
}

- (MTLMotionKeyframeData)init
{
  MTLMotionKeyframeData *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLMotionKeyframeData;
  result = -[MTLMotionKeyframeData init](&v3, sel_init);
  if (result)
  {
    result->_buffer = 0;
    result->_offset = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLMotionKeyframeData;
  -[MTLMotionKeyframeData dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setBuffer:", self->_buffer);
  objc_msgSend(v4, "setOffset:", self->_offset);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  id v6;
  NSUInteger v8;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  if (Class != object_getClass(a3))
    return 0;
  v6 = -[MTLMotionKeyframeData buffer](self, "buffer");
  if (v6 != (id)objc_msgSend(a3, "buffer"))
    return 0;
  v8 = -[MTLMotionKeyframeData offset](self, "offset");
  return v8 == objc_msgSend(a3, "offset");
}

- (unint64_t)hash
{
  _QWORD v4[2];

  bzero(v4, 0x10uLL);
  v4[1] = -[MTLMotionKeyframeData offset](self, "offset", objc_msgSend(-[MTLMotionKeyframeData buffer](self, "buffer"), "hash"));
  return _MTLHashState((int *)v4, 0x10uLL);
}

- (id)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)buffer
{
  objc_setProperty_nonatomic(self, a2, buffer, 8);
}

- (NSUInteger)offset
{
  return self->_offset;
}

- (void)setOffset:(NSUInteger)offset
{
  self->_offset = offset;
}

@end
