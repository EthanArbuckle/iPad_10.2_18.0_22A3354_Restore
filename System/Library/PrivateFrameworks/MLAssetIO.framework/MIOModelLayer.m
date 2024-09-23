@implementation MIOModelLayer

- (MIOModelLayer)initWithName:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  MIOModelLayer *v8;
  uint64_t v9;
  NSString *name;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MIOModelLayer;
  v8 = -[MIOModelLayer init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_type, a4);
  }

  return v8;
}

- (MIOModelLayer)initWithName:(id)a3 type:(id)a4 histogram:(id)a5 computePrecision:(id)a6 storagePrecision:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MIOModelLayer *v17;
  uint64_t v18;
  NSString *name;
  uint64_t v20;
  NSDictionary *layerHistogram;
  uint64_t v22;
  NSArray *computePrecision;
  uint64_t v24;
  NSArray *storagePrecision;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)MIOModelLayer;
  v17 = -[MIOModelLayer init](&v27, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    name = v17->_name;
    v17->_name = (NSString *)v18;

    objc_storeStrong((id *)&v17->_type, a4);
    v20 = objc_msgSend(v14, "copy");
    layerHistogram = v17->_layerHistogram;
    v17->_layerHistogram = (NSDictionary *)v20;

    v22 = objc_msgSend(v15, "copy");
    computePrecision = v17->_computePrecision;
    v17->_computePrecision = (NSArray *)v22;

    v24 = objc_msgSend(v16, "copy");
    storagePrecision = v17->_storagePrecision;
    v17->_storagePrecision = (NSArray *)v24;

  }
  return v17;
}

- (MIOModelLayer)initWithMessageStream:(CodedInputStream *)a3 error:(id *)a4
{
  MIOModelLayer *v5;
  __int128 v7;
  __int128 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v7 = 0u;
  v8 = 0u;
  MIOParseNeuralNetworkLayerSpecification(a3, (uint64_t)&v7);
  v5 = -[MIOModelLayer initWithName:type:histogram:computePrecision:storagePrecision:](self, "initWithName:type:histogram:computePrecision:storagePrecision:", v7, v8, v9);

  return v5;
}

- (id)layerHistogram
{
  return self->_layerHistogram;
}

- (id)computePrecision
{
  return self->_computePrecision;
}

- (id)storagePrecision
{
  return self->_storagePrecision;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MIOModelLayer name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("MIOModelLayer (%p) %@"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  MIOModelLayer *v4;
  MIOModelLayer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (MIOModelLayer *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIOModelLayer name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOModelLayer name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[MIOModelLayer type](self, "type");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIOModelLayer type](v5, "type");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[MIOModelLayer name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MIOModelLayer type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storagePrecision, 0);
  objc_storeStrong((id *)&self->_computePrecision, 0);
  objc_storeStrong((id *)&self->_layerHistogram, 0);
}

- (BOOL)initWithMessageStream:(uint64_t)a3 error:(_QWORD *)a4 .cold.1(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  void *v6;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = __cxa_begin_catch(a1);
  *a4 = v6;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (*(uint64_t (**)(void *))(*(_QWORD *)v6 + 16))(v6);
    v9 = 136315138;
    v10 = v8;
    _os_log_error_impl(&dword_1D3AC6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to parse the Layer specification. Error: %s", (uint8_t *)&v9, 0xCu);
  }
  return a3 == 0;
}

@end
