@implementation MKDataClassMetrics

- (MKDataClassMetrics)initWithDictionary:(id)a3
{
  id v4;
  MKDataClassMetrics *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MKDataClassMetrics;
  v5 = -[MKDataClassMetrics init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKDataClassMetrics setName:](v5, "setName:", v6);

    objc_msgSend(v4, "objectForKey:", CFSTR("size"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKDataClassMetrics setSize:](v5, "setSize:", objc_msgSend(v7, "unsignedLongValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("item_count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKDataClassMetrics setItemCount:](v5, "setItemCount:", objc_msgSend(v8, "intValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("transfer_speed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    -[MKDataClassMetrics setTransferSpeed:](v5, "setTransferSpeed:");

    objc_msgSend(v4, "objectForKey:", CFSTR("durations"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("preparation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    -[MKDataClassMetrics setPreparationTime:](v5, "setPreparationTime:");

    objc_msgSend(v10, "objectForKey:", CFSTR("export"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    -[MKDataClassMetrics setExportTime:](v5, "setExportTime:");

    objc_msgSend(v10, "objectForKey:", CFSTR("network_queue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    -[MKDataClassMetrics setNetworkQueueTime:](v5, "setNetworkQueueTime:");

    objc_msgSend(v10, "objectForKey:", CFSTR("transfer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    -[MKDataClassMetrics setTransferTime:](v5, "setTransferTime:");

  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)itemCount
{
  return self->_itemCount;
}

- (void)setItemCount:(int)a3
{
  self->_itemCount = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (double)transferSpeed
{
  return self->_transferSpeed;
}

- (void)setTransferSpeed:(double)a3
{
  self->_transferSpeed = a3;
}

- (double)preparationTime
{
  return self->_preparationTime;
}

- (void)setPreparationTime:(double)a3
{
  self->_preparationTime = a3;
}

- (double)exportTime
{
  return self->_exportTime;
}

- (void)setExportTime:(double)a3
{
  self->_exportTime = a3;
}

- (double)networkQueueTime
{
  return self->_networkQueueTime;
}

- (void)setNetworkQueueTime:(double)a3
{
  self->_networkQueueTime = a3;
}

- (double)transferTime
{
  return self->_transferTime;
}

- (void)setTransferTime:(double)a3
{
  self->_transferTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
