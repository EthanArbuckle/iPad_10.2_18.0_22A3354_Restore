@implementation SCNKeyedArchiver

+ (id)archivedDataWithRootObject:(id)a3 options:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DF0]), "initWithLength:", 0);
  v8 = (void *)objc_opt_new();
  v9 = (id)objc_msgSend(objc_allocWithZone((Class)a1), "initForWritingWithMutableData:", v7);
  objc_msgSend(v9, "setOptions:", a4);
  objc_msgSend(v9, "encodeObject:forKey:", a3, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v9, "finishEncoding");
  objc_msgSend(v8, "drain");
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNKeyedArchiver;
  -[NSKeyedArchiver dealloc](&v3, sel_dealloc);
}

- (NSDictionary)options
{
  return self->options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)skipMorphTargets
{
  return self->skipMorphTargets;
}

- (void)setSkipMorphTargets:(BOOL)a3
{
  self->skipMorphTargets = a3;
}

@end
