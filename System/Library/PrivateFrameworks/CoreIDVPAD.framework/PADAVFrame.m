@implementation PADAVFrame

- (id)pixelBuffer
{
  return objc_loadWeakRetained(&self->_pixelBuffer);
}

- (void)setPixelBuffer:(id)a3
{
  objc_storeWeak(&self->_pixelBuffer, a3);
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

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_pixelBuffer);
}

@end
