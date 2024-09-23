@implementation MFUUDecoderFilter

- (int64_t)appendData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *data;
  OS_dispatch_data *concat;
  int64_t v9;
  OS_dispatch_data *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "_createDispatchData");
    data = self->_data;
    if (data)
      concat = (OS_dispatch_data *)dispatch_data_create_concat(data, v6);
    else
      concat = v6;
    v10 = self->_data;
    self->_data = concat;

    v9 = objc_msgSend(v5, "length");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)done
{
  OS_dispatch_data *v3;
  void *v4;
  objc_super v5;
  objc_super v6;

  v3 = self->_data;
  -[OS_dispatch_data mf_decodeUuencoded](v3, "mf_decodeUuencoded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)MFUUDecoderFilter;
  -[MFBaseFilterDataConsumer appendData:](&v6, sel_appendData_, v4);
  v5.receiver = self;
  v5.super_class = (Class)MFUUDecoderFilter;
  -[MFBaseFilterDataConsumer done](&v5, sel_done);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
