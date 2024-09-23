@implementation ECHeaderAuthenticationResultStatement

- (ECHeaderAuthenticationResultStatement)initWithMethod:(id)a3 result:(id)a4 reason:(id)a5 properties:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ECHeaderAuthenticationResultStatement *v15;
  ECHeaderAuthenticationResultStatement *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ECHeaderAuthenticationResultStatement;
  v15 = -[ECHeaderAuthenticationResultStatement init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_method, a3);
    objc_storeStrong((id *)&v16->_result, a4);
    objc_storeStrong((id *)&v16->_reason, a5);
    objc_storeStrong((id *)&v16->_properties, a6);
  }

  return v16;
}

- (id)valueForFullProperty:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__ECHeaderAuthenticationResultStatement_valueForFullProperty___block_invoke;
  v8[3] = &unk_1E7121150;
  v9 = v4;
  v5 = v4;
  -[ECHeaderAuthenticationResultStatement _valueForPropertyPassingTest:](self, "_valueForPropertyPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __62__ECHeaderAuthenticationResultStatement_valueForFullProperty___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "fullProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)valueForPropertyType:(id)a3 property:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__ECHeaderAuthenticationResultStatement_valueForPropertyType_property___block_invoke;
  v12[3] = &unk_1E7121178;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  -[ECHeaderAuthenticationResultStatement _valueForPropertyPassingTest:](self, "_valueForPropertyPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __71__ECHeaderAuthenticationResultStatement_valueForPropertyType_property___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "propertyType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "property");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_valueForPropertyPassingTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ECHeaderAuthenticationResultStatement properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_firstObjectPassingTest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)method
{
  return self->_method;
}

- (NSString)result
{
  return self->_result;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSArray)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_method, 0);
}

@end
