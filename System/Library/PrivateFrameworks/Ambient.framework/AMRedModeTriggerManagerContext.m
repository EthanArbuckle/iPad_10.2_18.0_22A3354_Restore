@implementation AMRedModeTriggerManagerContext

- (AMAmbientIlluminationTrigger)ambientIlluminationTrigger
{
  return self->_ambientIlluminationTrigger;
}

- (void)setAmbientIlluminationTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_ambientIlluminationTrigger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ambientIlluminationTrigger, 0);
}

@end
