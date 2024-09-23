@implementation ISGraphicIconConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSArray copy](self->_enclosureColors, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSArray copy](self->_symbolColors, "copy");
  v8 = (void *)v4[1];
  v4[1] = v7;

  v4[3] = self->_renderingMode;
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)ISGraphicIconConfiguration;
  -[ISGraphicIconConfiguration description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISGraphicIconConfiguration symbolColors](self, "symbolColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISGraphicIconConfiguration enclosureColors](self, "enclosureColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Symbol color: %@ Enclosure color: %@ Rendering mode: %ld"), v4, v5, v6, -[ISGraphicIconConfiguration renderingMode](self, "renderingMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)symbolColors
{
  return self->_symbolColors;
}

- (void)setSymbolColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)enclosureColors
{
  return self->_enclosureColors;
}

- (void)setEnclosureColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (void)setRenderingMode:(int64_t)a3
{
  self->_renderingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enclosureColors, 0);
  objc_storeStrong((id *)&self->_symbolColors, 0);
}

@end
