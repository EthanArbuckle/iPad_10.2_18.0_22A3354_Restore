@implementation BLDAAPHideItemsRequest

- (BLDAAPHideItemsRequest)initWithDSID:(id)a3 databaseID:(id)a4 body:(id)a5
{
  id v8;
  id v9;
  BLDAAPHideItemsRequest *v10;
  BLDAAPHideItemsRequest *v11;
  void *v12;
  objc_super v14;

  v8 = a4;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BLDAAPHideItemsRequest;
  v10 = -[BLDAAPURLRequest initWithDSID:reason:](&v14, sel_initWithDSID_reason_, a3, 6);
  v11 = v10;
  if (v10)
  {
    -[BLDAAPURLRequest setContentType:](v10, "setContentType:", 0);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("databases/%@/edit"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDAAPURLRequest setDaapURL:](v11, "setDaapURL:", v12);

    -[BLDAAPURLRequest setBody:](v11, "setBody:", v9);
    -[BLDAAPURLRequest setDataEncoding:](v11, "setDataEncoding:", 1);
  }

  return v11;
}

@end
