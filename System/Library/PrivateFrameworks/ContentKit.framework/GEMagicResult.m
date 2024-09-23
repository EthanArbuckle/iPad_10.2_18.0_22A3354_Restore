@implementation GEMagicResult

- (GEMagicResult)initWithMimeType:(id)a3 description:(id)a4 typeHierarchy:(id)a5
{
  GEMagicResult *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEMagicResult;
  v8 = -[GEMagicResult init](&v10, sel_init);
  if (v8)
  {
    v8->mimeType = (NSString *)objc_msgSend(a3, "copy");
    v8->description = (NSString *)objc_msgSend(a4, "copy");
    v8->uniformTypeHierarchy = (NSArray *)objc_msgSend(a5, "copy");
    if (-[NSArray count](-[GEMagicResult uniformTypeHierarchy](v8, "uniformTypeHierarchy"), "count"))
      v8->uniformType = (NSString *)-[NSArray objectAtIndex:](-[GEMagicResult uniformTypeHierarchy](v8, "uniformTypeHierarchy"), "objectAtIndex:", 0);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GEMagicResult;
  -[GEMagicResult dealloc](&v3, sel_dealloc);
}

- (NSString)mimeType
{
  return self->mimeType;
}

- (NSString)description
{
  return self->description;
}

- (NSString)uniformType
{
  return self->uniformType;
}

- (NSArray)uniformTypeHierarchy
{
  return self->uniformTypeHierarchy;
}

@end
