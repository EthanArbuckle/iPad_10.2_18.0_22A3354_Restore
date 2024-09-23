@implementation _HAPBTLEDiscoveryContext

- (_HAPBTLEDiscoveryContext)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (_HAPBTLEDiscoveryContext)initWithDiscoveryType:(int64_t)a3
{
  _HAPBTLEDiscoveryContext *v4;
  _HAPBTLEDiscoveryContext *v5;
  uint64_t v6;
  NSMutableArray *discoveringServices;
  uint64_t v8;
  NSMutableArray *discoveringCharacteristics;
  uint64_t v10;
  NSMutableArray *readingCharacteristics;
  uint64_t v12;
  NSMutableArray *discoveringDescriptors;
  uint64_t v14;
  NSMutableArray *readingDescriptors;
  uint64_t v16;
  NSMutableArray *readingSignatureCharacteristics;
  uint64_t v18;
  NSMutableArray *readingSignatureServices;
  uint64_t v20;
  NSMapTable *characteristicSignatures;
  uint64_t v22;
  NSMapTable *serviceSignatures;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)_HAPBTLEDiscoveryContext;
  v4 = -[_HAPBTLEDiscoveryContext init](&v25, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_discoveryType = a3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    discoveringServices = v5->_discoveringServices;
    v5->_discoveringServices = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    discoveringCharacteristics = v5->_discoveringCharacteristics;
    v5->_discoveringCharacteristics = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    readingCharacteristics = v5->_readingCharacteristics;
    v5->_readingCharacteristics = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    discoveringDescriptors = v5->_discoveringDescriptors;
    v5->_discoveringDescriptors = (NSMutableArray *)v12;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    readingDescriptors = v5->_readingDescriptors;
    v5->_readingDescriptors = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    readingSignatureCharacteristics = v5->_readingSignatureCharacteristics;
    v5->_readingSignatureCharacteristics = (NSMutableArray *)v16;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    readingSignatureServices = v5->_readingSignatureServices;
    v5->_readingSignatureServices = (NSMutableArray *)v18;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v20 = objc_claimAutoreleasedReturnValue();
    characteristicSignatures = v5->_characteristicSignatures;
    v5->_characteristicSignatures = (NSMapTable *)v20;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v22 = objc_claimAutoreleasedReturnValue();
    serviceSignatures = v5->_serviceSignatures;
    v5->_serviceSignatures = (NSMapTable *)v22;

  }
  return v5;
}

- (void)reset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[_HAPBTLEDiscoveryContext setDiscovering:](self, "setDiscovering:", 0);
  -[_HAPBTLEDiscoveryContext discoveringServices](self, "discoveringServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[_HAPBTLEDiscoveryContext discoveringCharacteristics](self, "discoveringCharacteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[_HAPBTLEDiscoveryContext readingCharacteristics](self, "readingCharacteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[_HAPBTLEDiscoveryContext discoveringDescriptors](self, "discoveringDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[_HAPBTLEDiscoveryContext readingDescriptors](self, "readingDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[_HAPBTLEDiscoveryContext readingSignatureCharacteristics](self, "readingSignatureCharacteristics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[_HAPBTLEDiscoveryContext readingSignatureServices](self, "readingSignatureServices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  -[_HAPBTLEDiscoveryContext characteristicSignatures](self, "characteristicSignatures");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  -[_HAPBTLEDiscoveryContext serviceSignatures](self, "serviceSignatures");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

}

- (BOOL)isComplete
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[_HAPBTLEDiscoveryContext discoveringServices](self, "discoveringServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[_HAPBTLEDiscoveryContext discoveringCharacteristics](self, "discoveringCharacteristics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v4 = 0;
    }
    else
    {
      -[_HAPBTLEDiscoveryContext readingCharacteristics](self, "readingCharacteristics");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        v4 = 0;
      }
      else
      {
        -[_HAPBTLEDiscoveryContext discoveringDescriptors](self, "discoveringDescriptors");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "count"))
        {
          v4 = 0;
        }
        else
        {
          -[_HAPBTLEDiscoveryContext readingDescriptors](self, "readingDescriptors");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "count"))
          {
            v4 = 0;
          }
          else
          {
            -[_HAPBTLEDiscoveryContext readingSignatureCharacteristics](self, "readingSignatureCharacteristics");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v9, "count"))
            {
              v4 = 0;
            }
            else
            {
              -[_HAPBTLEDiscoveryContext readingSignatureServices](self, "readingSignatureServices");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v4 = objc_msgSend(v10, "count") == 0;

            }
          }

        }
      }

    }
  }

  return v4;
}

- (int64_t)discoveryType
{
  return self->_discoveryType;
}

- (NSMutableArray)discoveringServices
{
  return self->_discoveringServices;
}

- (NSMutableArray)discoveringCharacteristics
{
  return self->_discoveringCharacteristics;
}

- (NSMutableArray)readingCharacteristics
{
  return self->_readingCharacteristics;
}

- (NSMutableArray)discoveringDescriptors
{
  return self->_discoveringDescriptors;
}

- (NSMutableArray)readingDescriptors
{
  return self->_readingDescriptors;
}

- (NSMutableArray)readingSignatureCharacteristics
{
  return self->_readingSignatureCharacteristics;
}

- (NSMutableArray)readingSignatureServices
{
  return self->_readingSignatureServices;
}

- (NSMapTable)characteristicSignatures
{
  return self->_characteristicSignatures;
}

- (NSMapTable)serviceSignatures
{
  return self->_serviceSignatures;
}

- (BOOL)isDiscovering
{
  return self->_discovering;
}

- (void)setDiscovering:(BOOL)a3
{
  self->_discovering = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_serviceSignatures, 0);
  objc_storeStrong((id *)&self->_characteristicSignatures, 0);
  objc_storeStrong((id *)&self->_readingSignatureServices, 0);
  objc_storeStrong((id *)&self->_readingSignatureCharacteristics, 0);
  objc_storeStrong((id *)&self->_readingDescriptors, 0);
  objc_storeStrong((id *)&self->_discoveringDescriptors, 0);
  objc_storeStrong((id *)&self->_readingCharacteristics, 0);
  objc_storeStrong((id *)&self->_discoveringCharacteristics, 0);
  objc_storeStrong((id *)&self->_discoveringServices, 0);
}

@end
