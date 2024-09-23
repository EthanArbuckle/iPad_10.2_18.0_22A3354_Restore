@implementation ARUICelebration

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARUICelebration type](self, "type");
  objc_msgSend(v3, "appendString:withName:", CFSTR("sparks"), CFSTR("type"));
  v4 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("duration"), 3, self->_duration);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  +[ARUIHashBuilder builder](ARUIHashBuilder, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendDouble:", self->_duration);
  objc_msgSend(v3, "appendUnsignedInt:", self->_type);
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (_TtC3VFX8VFXScene)scene
{
  return self->_scene;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
