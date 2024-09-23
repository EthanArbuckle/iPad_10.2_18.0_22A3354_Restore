@implementation CSCachingVibrancyTransitionProvider

- (id)vibrancyLUTWithStartingLUT:(id)a3 transitionProgress:(double)a4 toIdentifier:(id)a5
{
  void *cachedVibrancyLUT;
  BSUIVibrancyLUT *v7;
  BSUIVibrancyLUT *v8;

  cachedVibrancyLUT = self->_cachedVibrancyLUT;
  if (!cachedVibrancyLUT)
    cachedVibrancyLUT = a3;
  v7 = (BSUIVibrancyLUT *)objc_msgSend(cachedVibrancyLUT, "copyWithBlend:toIdentifier:", a5, a4);
  v8 = self->_cachedVibrancyLUT;
  self->_cachedVibrancyLUT = v7;

  return self->_cachedVibrancyLUT;
}

- (BSUIVibrancyLUT)cachedVibrancyLUT
{
  return self->_cachedVibrancyLUT;
}

- (void)setCachedVibrancyLUT:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedVibrancyLUT, 0);
}

@end
