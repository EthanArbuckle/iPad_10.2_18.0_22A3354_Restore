@implementation _MLNeuralNetworkBasicTensorDataStore

- (_MLNeuralNetworkBasicTensorDataStore)initWithContentsOfFile:(id)a3 error:(id *)a4
{
  id v6;
  _MLNeuralNetworkBasicTensorDataStore *v7;
  uint64_t v8;
  NSMutableData *data;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MLNeuralNetworkBasicTensorDataStore;
  v7 = -[_MLNeuralNetworkBasicTensorDataStore init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithContentsOfFile:options:error:", v6, 0, a4);
    data = v7->_data;
    v7->_data = (NSMutableData *)v8;

  }
  return v7;
}

- (_MLNeuralNetworkBasicTensorDataStore)initWithData:(id)a3
{
  id v5;
  _MLNeuralNetworkBasicTensorDataStore *v6;
  _MLNeuralNetworkBasicTensorDataStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MLNeuralNetworkBasicTensorDataStore;
  v6 = -[_MLNeuralNetworkBasicTensorDataStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (id)tensorDataForOffset:(unint64_t)a3 expectedLength:(unint64_t)a4
{
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;

  v7 = a4 + a3;
  -[_MLNeuralNetworkBasicTensorDataStore data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v7 <= v9)
  {
    -[_MLNeuralNetworkBasicTensorDataStore data](self, "data");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "mutableBytes") + a3;

    objc_msgSend(MEMORY[0x1E0CC1400], "dataWithBytesNoCopy:length:", v12, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (BOOL)writeToFile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[_MLNeuralNetworkBasicTensorDataStore data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "writeToFile:options:error:", v6, 1, a4);

  return (char)a4;
}

- (NSMutableData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
