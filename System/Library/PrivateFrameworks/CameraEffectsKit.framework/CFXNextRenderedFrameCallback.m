@implementation CFXNextRenderedFrameCallback

- (CFXNextRenderedFrameCallback)initWithBlock:(id)a3 sendAfterRenderTime:(id *)a4
{
  id v6;
  CFXNextRenderedFrameCallback *v7;
  uint64_t v8;
  id block;
  __int128 v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CFXNextRenderedFrameCallback;
  v7 = -[CFXNextRenderedFrameCallback init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    block = v7->_block;
    v7->_block = (id)v8;

    v10 = *(_OWORD *)&a4->var0;
    v7->_sendAfterRenderTime.epoch = a4->var3;
    *(_OWORD *)&v7->_sendAfterRenderTime.value = v10;
  }

  return v7;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sendAfterRenderTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
