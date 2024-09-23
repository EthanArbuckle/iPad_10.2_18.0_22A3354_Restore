@implementation GDPersonTaggingOptions

- (GDPersonTaggingOptions)initWithTagThresholds:(id)a3
{
  id v4;
  GDPersonTaggingOptions *v5;
  GDPersonEntityTaggingOptionsInner *v6;
  const char *v7;
  uint64_t v8;
  GDPersonEntityTaggingOptionsInner *inner;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GDPersonTaggingOptions;
  v5 = -[GDPersonTaggingOptions init](&v11, sel_init);
  if (v5)
  {
    v6 = [GDPersonEntityTaggingOptionsInner alloc];
    v8 = objc_msgSend_initWithTagNameThresholds_(v6, v7, (uint64_t)v4);
    inner = v5->inner;
    v5->inner = (GDPersonEntityTaggingOptionsInner *)v8;

  }
  return v5;
}

- (NSDictionary)tagThresholds
{
  return (NSDictionary *)((uint64_t (*)(GDPersonEntityTaggingOptionsInner *, char *))MEMORY[0x1E0DE7D20])(self->inner, sel_tagNameThresholds);
}

- (void)setTagThresholds:(id)a3
{
  objc_storeStrong((id *)&self->_tagThresholds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagThresholds, 0);
  objc_storeStrong((id *)&self->inner, 0);
}

@end
