@implementation SKOverlayConfiguration

- (SKOverlayConfiguration)initWithBacking:(id)a3
{
  id v5;
  SKOverlayConfiguration *v6;
  SKOverlayConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKOverlayConfiguration;
  v6 = -[SKOverlayConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->__backing, a3);

  return v7;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKOverlayConfiguration;
  return -[SKOverlayConfiguration init](&v3, sel_init);
}

- (ASOOverlayConfiguration)_backing
{
  return self->__backing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__backing, 0);
}

@end
