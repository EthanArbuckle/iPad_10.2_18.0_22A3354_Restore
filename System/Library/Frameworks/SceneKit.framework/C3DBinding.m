@implementation C3DBinding

- (void)dealloc
{
  objc_super v3;

  -[C3DBinding setSourceObject:](self, "setSourceObject:", 0);
  -[C3DBinding setKeyPathSrc:](self, "setKeyPathSrc:", 0);
  -[C3DBinding setKeyPathDst:](self, "setKeyPathDst:", 0);
  -[C3DBinding setOptions:](self, "setOptions:", 0);
  v3.receiver = self;
  v3.super_class = (Class)C3DBinding;
  -[C3DBinding dealloc](&v3, sel_dealloc);
}

- (id)sourceObject
{
  return self->sourceObject;
}

- (void)setSourceObject:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)keyPathSrc
{
  return self->keyPathSrc;
}

- (void)setKeyPathSrc:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)keyPathDst
{
  return self->keyPathDst;
}

- (void)setKeyPathDst:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSDictionary)options
{
  return self->options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
