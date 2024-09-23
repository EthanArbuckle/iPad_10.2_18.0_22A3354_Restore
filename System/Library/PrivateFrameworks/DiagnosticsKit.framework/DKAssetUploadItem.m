@implementation DKAssetUploadItem

+ (id)assetWithData:(id)a3 andExtra:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:andExtra:", v7, v6);

  return v8;
}

- (DKAssetUploadItem)initWithData:(id)a3 andExtra:(id)a4
{
  id v7;
  id v8;
  DKAssetUploadItem *v9;
  DKAssetUploadItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DKAssetUploadItem;
  v9 = -[DKAssetUploadItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_extra, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_decoderClasses
{
  if (_decoderClasses_onceToken != -1)
    dispatch_once(&_decoderClasses_onceToken, &__block_literal_global_2);
  return (id)_decoderClasses_decoderClasses;
}

void __36__DKAssetUploadItem__decoderClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_decoderClasses_decoderClasses;
  _decoderClasses_decoderClasses = v6;

}

- (DKAssetUploadItem)initWithCoder:(id)a3
{
  id v4;
  DKAssetUploadItem *v5;
  DKAssetUploadItem *v6;
  void *v7;
  uint64_t v8;
  NSData *data;
  void *v10;
  uint64_t v11;
  NSDictionary *extra;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DKAssetUploadItem;
  v5 = -[DKAssetUploadItem init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    -[DKAssetUploadItem _decoderClasses](v5, "_decoderClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("data"));
    v8 = objc_claimAutoreleasedReturnValue();
    data = v6->_data;
    v6->_data = (NSData *)v8;

    -[DKAssetUploadItem _decoderClasses](v6, "_decoderClasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("extra"));
    v11 = objc_claimAutoreleasedReturnValue();
    extra = v6->_extra;
    v6->_extra = (NSDictionary *)v11;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DKAssetUploadItem data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

  -[DKAssetUploadItem extra](self, "extra");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("extra"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_data, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSDictionary copyWithZone:](self->_extra, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (NSDictionary)extra
{
  return self->_extra;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extra, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
