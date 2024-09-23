@implementation AVAudioMixCinematicAudioEffect

- (AVAudioMixCinematicAudioEffect)initWithData:(id)a3
{
  AVAudioMixCinematicAudioEffect *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAudioMixCinematicAudioEffect;
  v4 = -[AVAudioMixEffect init](&v6, sel_init);
  if (v4)
    v4->_data = (NSData *)objc_msgSend(a3, "copy");
  return v4;
}

+ (id)cinematicAudioEffectWithData:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithData:", a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAudioMixCinematicAudioEffect;
  -[AVAudioMixCinematicAudioEffect dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[NSData isEqualToData:](-[AVAudioMixCinematicAudioEffect data](self, "data"), "isEqualToData:", objc_msgSend(a3, "data"));
}

- (unint64_t)hash
{
  return -[NSData hash](self->_data, "hash");
}

- (NSData)data
{
  return self->_data;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> data=%p"), NSStringFromClass(v4), self, -[AVAudioMixCinematicAudioEffect data](self, "data"));
}

@end
