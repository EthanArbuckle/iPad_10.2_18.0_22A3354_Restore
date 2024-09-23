@implementation SKUniformInfo

- (SKUniformInfo)init
{
  SKUniformInfo *v2;
  SKUniformInfo *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUniformInfo;
  v2 = -[SKUniformInfo init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SKUniformInfo setSeed:](v2, "setSeed:", 0);
  return v3;
}

- (unint64_t)seed
{
  return self->seed;
}

- (void)setSeed:(unint64_t)a3
{
  self->seed = a3;
}

- (unint64_t)textureTarget
{
  return self->textureTarget;
}

- (void)setTextureTarget:(unint64_t)a3
{
  self->textureTarget = a3;
}

- (SKUniform)uniform
{
  return (SKUniform *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUniform:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->uniform, 0);
}

@end
