@implementation CIMLFeatureProvider

- (CIMLFeatureProvider)init
{
  CIMLFeatureProvider *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CIMLFeatureProvider;
  v2 = -[CIMLFeatureProvider init](&v4, sel_init);
  if (v2)
    -[CIMLFeatureProvider setContents:](v2, "setContents:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
  return v2;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[NSMutableDictionary allKeys](self->contents, "allKeys"));
}

- (void)addOject:(id)a3 forName:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](-[CIMLFeatureProvider contents](self, "contents"), "setObject:forKey:", a3, a4);
}

- (id)featureValueForName:(id)a3
{
  const void *v3;
  CFTypeID v5;

  v3 = (const void *)-[NSMutableDictionary objectForKey:](-[CIMLFeatureProvider contents](self, "contents"), "objectForKey:", a3);
  getMLMultiArrayClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend((id)getMLFeatureValueClass(), "featureValueWithMultiArray:", v3);
  v5 = CFGetTypeID(v3);
  if (v5 == CVPixelBufferGetTypeID())
    return (id)objc_msgSend((id)getMLFeatureValueClass(), "featureValueWithPixelBuffer:", v3);
  else
    return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[CIMLFeatureProvider setContents:](self, "setContents:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CIMLFeatureProvider;
  -[CIMLFeatureProvider dealloc](&v3, sel_dealloc);
}

- (NSMutableDictionary)contents
{
  return self->contents;
}

- (void)setContents:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
