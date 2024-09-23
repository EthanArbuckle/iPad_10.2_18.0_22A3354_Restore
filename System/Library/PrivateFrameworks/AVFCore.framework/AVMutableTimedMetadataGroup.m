@implementation AVMutableTimedMetadataGroup

- (AVMutableTimedMetadataGroup)initWithItems:(id)a3 timeRange:(id *)a4
{
  __int128 v4;
  AVMutableTimedMetadataGroup *v5;
  AVMutableTimedMetadataGroup *v6;
  _OWORD v8[3];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVMutableTimedMetadataGroup;
  v4 = *(_OWORD *)&a4->var0.var3;
  v8[0] = *(_OWORD *)&a4->var0.var0;
  v8[1] = v4;
  v8[2] = *(_OWORD *)&a4->var1.var1;
  v5 = -[AVTimedMetadataGroup initWithItems:timeRange:](&v9, sel_initWithItems_timeRange_, a3, v8);
  v6 = v5;
  if (v5)
    v5->_mutablePriv = -[AVTimedMetadataGroup _timedMetadataGroupInternal](v5, "_timedMetadataGroupInternal");
  return v6;
}

- (CMTimeRange)timeRange
{
  _OWORD *epoch;
  __int128 v4;

  epoch = (_OWORD *)self->start.epoch;
  v4 = epoch[2];
  *(_OWORD *)&retstr->start.value = epoch[1];
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = epoch[3];
  return self;
}

- (NSArray)items
{
  return self->_mutablePriv->items;
}

- (void)setItems:(NSArray *)items
{
  NSArray *v3;
  NSArray *v4;

  if (items)
    v3 = items;
  else
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  v4 = self->_mutablePriv->items;
  if (v4 != v3)
  {

    self->_mutablePriv->items = (NSArray *)-[NSArray copy](v3, "copy");
  }
}

- (void)setTimeRange:(CMTimeRange *)timeRange
{
  AVTimedMetadataGroupInternal *mutablePriv;
  __int128 v4;
  __int128 v5;

  mutablePriv = self->_mutablePriv;
  v5 = *(_OWORD *)&timeRange->start.epoch;
  v4 = *(_OWORD *)&timeRange->duration.timescale;
  *(_OWORD *)&mutablePriv->timeRange.start.value = *(_OWORD *)&timeRange->start.value;
  *(_OWORD *)&mutablePriv->timeRange.start.epoch = v5;
  *(_OWORD *)&mutablePriv->timeRange.duration.timescale = v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVTimedMetadataGroup *v4;
  NSArray *v5;
  _OWORD v7[3];

  v4 = [AVTimedMetadataGroup alloc];
  v5 = -[AVMutableTimedMetadataGroup items](self, "items");
  if (self)
    -[AVMutableTimedMetadataGroup timeRange](self, "timeRange");
  else
    memset(v7, 0, sizeof(v7));
  return -[AVTimedMetadataGroup initWithItems:timeRange:](v4, "initWithItems:timeRange:", v5, v7);
}

@end
