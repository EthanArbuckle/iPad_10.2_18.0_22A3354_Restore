@implementation AVMutableDateRangeMetadataGroup

- (id)_initWithTaggedRangeMetadataDictionary:(id)a3 items:(id)a4
{
  _QWORD *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMutableDateRangeMetadataGroup;
  v4 = -[AVDateRangeMetadataGroup _initWithTaggedRangeMetadataDictionary:items:](&v7, sel__initWithTaggedRangeMetadataDictionary_items_, a3, a4);
  v5 = v4;
  if (v4)
    v4[2] = objc_msgSend(v4, "_dateRangeMetadataGroupInternal");
  return v5;
}

- (NSDate)startDate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableDateRangeMetadataGroup;
  return -[AVDateRangeMetadataGroup startDate](&v3, sel_startDate);
}

- (void)setStartDate:(NSDate *)startDate
{
  NSDate *v4;

  v4 = (NSDate *)-[NSDate copy](startDate, "copy");

  self->_mutablePriv->startDate = v4;
}

- (NSDate)endDate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableDateRangeMetadataGroup;
  return -[AVDateRangeMetadataGroup endDate](&v3, sel_endDate);
}

- (void)setEndDate:(NSDate *)endDate
{
  NSDate *v4;

  v4 = (NSDate *)-[NSDate copy](endDate, "copy");

  self->_mutablePriv->endDate = v4;
}

- (NSArray)items
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableDateRangeMetadataGroup;
  return -[AVDateRangeMetadataGroup items](&v3, sel_items);
}

- (void)setItems:(NSArray *)items
{
  NSArray *v4;

  if (!items)
    items = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v4 = (NSArray *)-[NSArray copy](items, "copy");

  self->_mutablePriv->metadataItems = v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AVDateRangeMetadataGroup _initWithTaggedRangeMetadataDictionary:items:]([AVDateRangeMetadataGroup alloc], "_initWithTaggedRangeMetadataDictionary:items:", -[AVDateRangeMetadataGroup _taggedRangeMetadataDictionary](self, "_taggedRangeMetadataDictionary"), -[AVMutableDateRangeMetadataGroup items](self, "items"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableDateRangeMetadataGroup;
  return -[AVDateRangeMetadataGroup mutableCopyWithZone:](&v4, sel_mutableCopyWithZone_, a3);
}

@end
