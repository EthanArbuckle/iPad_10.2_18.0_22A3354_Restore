@implementation EspressoBrickTensor

- (EspressoBrickTensor)init
{
  EspressoBrickTensor *v2;
  void *v3;
  EspressoBrickTensor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EspressoBrickTensor;
  v2 = -[EspressoBrickTensor init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[EspressoBrickTensor setShape:](v2, "setShape:", v3);

    v4 = v2;
  }

  return v2;
}

- (EspressoBrickTensorShape)shape
{
  return (EspressoBrickTensorShape *)objc_getProperty(self, a2, 8, 1);
}

- (void)setShape:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
}

@end
