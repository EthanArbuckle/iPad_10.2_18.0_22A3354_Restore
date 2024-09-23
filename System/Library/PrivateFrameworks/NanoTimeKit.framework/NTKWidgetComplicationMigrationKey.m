@implementation NTKWidgetComplicationMigrationKey

- (NTKWidgetComplicationMigrationKey)initWithComplicationType:(unint64_t)a3 family:(id)a4
{
  NTKWidgetComplicationMigrationKey *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKWidgetComplicationMigrationKey;
  result = -[NTKWidgetComplicationMigrationKey init](&v7, sel_init);
  if (result)
  {
    result->_complicationType = a3;
    result->_family = (NSNumber *)a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithComplicationType:family:", self->_complicationType, self->_family);
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[NTKWidgetComplicationMigrationKey complicationType](self, "complicationType");
  -[NTKWidgetComplicationMigrationKey family](self, "family");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  NTKWidgetComplicationMigrationKey *v4;
  char v5;

  v4 = (NTKWidgetComplicationMigrationKey *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_complicationType == v4->_complicationType)
      v5 = CLKEqualObjects();
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)complicationType
{
  return self->_complicationType;
}

- (void)setComplicationType:(unint64_t)a3
{
  self->_complicationType = a3;
}

- (NSNumber)family
{
  return self->_family;
}

- (void)setFamily:(id)a3
{
  self->_family = (NSNumber *)a3;
}

@end
