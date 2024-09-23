@implementation TimedBuffer

- (TimedBuffer)initWithBuffer:(__CVBuffer *)a3 atTimestamp:(id *)a4
{
  TimedBuffer *result;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TimedBuffer;
  result = -[TimedBuffer init](&v8, sel_init);
  if (result)
  {
    v7 = *(_OWORD *)&a4->var0;
    result->_timestamp.epoch = a4->var3;
    *(_OWORD *)&result->_timestamp.value = v7;
    result->_buffer = a3;
  }
  return result;
}

- (__CVBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(__CVBuffer *)a3
{
  self->_buffer = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (void)setTimestamp:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_timestamp.epoch = a3->var3;
  *(_OWORD *)&self->_timestamp.value = v3;
}

@end
