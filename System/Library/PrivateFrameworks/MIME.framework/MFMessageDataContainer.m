@implementation MFMessageDataContainer

- (MFMessageDataContainer)initWithData:(id)a3 partial:(BOOL)a4 incomplete:(BOOL)a5
{
  MFMessageDataContainer *result;

  result = -[MFMessageDataContainer initWithData:](self, "initWithData:", a3);
  if (result)
  {
    result->_partial = a4;
    result->_incomplete = a5;
  }
  return result;
}

- (MFMessageDataContainer)initWithData:(id)a3
{
  id v5;
  MFMessageDataContainer *v6;
  MFMessageDataContainer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMessageDataContainer;
  v6 = -[MFMessageDataContainer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (id)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
