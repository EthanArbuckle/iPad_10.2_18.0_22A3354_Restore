@implementation DOCTagSymbolImageConfiguration

- (DOCTagSymbolImageConfiguration)initWithTag:(id)a3 color:(id)a4 variant:(unint64_t)a5 differentiateWithShapes:(BOOL)a6
{
  id v11;
  id v12;
  DOCTagSymbolImageConfiguration *v13;
  DOCTagSymbolImageConfiguration *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DOCTagSymbolImageConfiguration;
  v13 = -[DOCTagSymbolImageConfiguration init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_tag, a3);
    objc_storeStrong((id *)&v14->_color, a4);
    v14->_variant = a5;
    v14->_differentiateWithShapes = a6;
  }

  return v14;
}

- (id)loadedImageForSettings
{
  void *v3;
  unint64_t v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BEBD640];
  v4 = -[DOCTagSymbolImageConfiguration variant](self, "variant");
  v5 = -[DOCTagSymbolImageConfiguration differentiateWithShapes](self, "differentiateWithShapes");
  -[DOCTagSymbolImageConfiguration tag](self, "tag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "labelIndex");
  -[DOCTagSymbolImageConfiguration color](self, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_doc_tagImageForRenderingVariant:differentiateWithShapes:tagColorType:renderedColor:", v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (DOCTag)tag
{
  return self->_tag;
}

- (UIColor)color
{
  return self->_color;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (BOOL)differentiateWithShapes
{
  return self->_differentiateWithShapes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
