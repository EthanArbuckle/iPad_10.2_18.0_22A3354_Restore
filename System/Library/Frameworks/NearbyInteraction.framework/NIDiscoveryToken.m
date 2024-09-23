@implementation NIDiscoveryToken

+ (id)generateFindingTokenWithIRK:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NIDiscoveryToken *v9;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NIFindingSupport.mm"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("IRK"));

  }
  if (objc_msgSend(v5, "length") != 16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NIFindingSupport.mm"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("IRK.length == NIDiscoveryTokenIRKLengthBytes"));

  }
  v14[0] = &unk_1E43703A8;
  v14[1] = &unk_1E43703D8;
  v15[0] = &unk_1E43703C0;
  v15[1] = v5;
  v14[2] = &unk_1E43703F0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &kFixedSessionIdentifierBytes, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1A1AF8054](v7, 8, 0);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NIFindingSupport.mm"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tokenData"));

  }
  v9 = -[NIDiscoveryToken initWithBytes:]([NIDiscoveryToken alloc], "initWithBytes:", v8);

  return v9;
}

+ (id)generateFindingTokenWithIRK:(id)a3 forExternalUse:(BOOL)a4
{
  +[NIDiscoveryToken generateFindingTokenWithIRK:](NIDiscoveryToken, "generateFindingTokenWithIRK:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NIDiscoveryToken)initWithBytes:(id)a3
{
  id v6;
  NIDiscoveryToken *v7;
  NIDiscoveryToken *v8;
  uint64_t v9;
  NSData *identifyingSequence;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIConfiguration.mm"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bytes"));

  }
  v13.receiver = self;
  v13.super_class = (Class)NIDiscoveryToken;
  v7 = -[NIDiscoveryToken init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_rawToken, a3);
    +[NIDiscoveryToken _identifyingSequenceFromBytes:](NIDiscoveryToken, "_identifyingSequenceFromBytes:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    identifyingSequence = v8->_identifyingSequence;
    v8->_identifyingSequence = (NSData *)v9;

  }
  return v8;
}

+ (id)_identifyingSequenceFromBytes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a3;
  v4 = v3;
  if (!v3)
    __assert_rtn("+[NIDiscoveryToken _identifyingSequenceFromBytes:]", "NIConfiguration.mm", 67, "bytes");
  v5 = (void *)objc_msgSend(v3, "copy");
  v6 = (void *)OPACKDecodeData();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__0;
    v18 = __Block_byref_object_dispose__0;
    v19 = (id)objc_opt_new();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__NIDiscoveryToken__identifyingSequenceFromBytes___block_invoke;
    v11[3] = &unk_1E43629C0;
    v12 = v6;
    v13 = &v14;
    objc_msgSend(&unk_1E4370508, "enumerateObjectsUsingBlock:", v11);
    v7 = objc_msgSend((id)v15[5], "length");
    v8 = v5;
    if (v7)
      v8 = (void *)v15[5];
    v9 = v8;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

void __50__NIDiscoveryToken__identifyingSequenceFromBytes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v3, "length"))
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendData:", v3);
    }
  }

}

- (id)objectInRawTokenOPACKDictForKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIConfiguration.mm"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  v6 = (void *)OPACKDecodeData();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)tokenVariant
{
  void *v2;
  int64_t v3;

  -[NIDiscoveryToken objectInRawTokenOPACKDictForKey:](self, "objectInRawTokenOPACKDictForKey:", &unk_1E4370480);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t)objc_msgSend(v2, "integerValue") <= 1)
  {
    v3 = objc_msgSend(v2, "integerValue");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)deviceCapabilities
{
  void *v2;
  NIDeviceCapabilities *v3;

  -[NIDiscoveryToken objectInRawTokenOPACKDictForKey:](self, "objectInRawTokenOPACKDictForKey:", &unk_1E4370498);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = -[NIDeviceCapabilities initWithBitmap:]([NIDeviceCapabilities alloc], "initWithBitmap:", objc_msgSend(v2, "unsignedCharValue"));
  else
    v3 = 0;

  return v3;
}

- (id)getIRK
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NIDiscoveryToken rawToken](self, "rawToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)OPACKDecodeData();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "objectForKey:", &unk_1E4370420);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "length") == 16)
      v6 = v5;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)getSessionIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NIDiscoveryToken rawToken](self, "rawToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)OPACKDecodeData();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "objectForKey:", &unk_1E4370408);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "length") == 3)
      v6 = v5;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)serialize:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") <= 0x3E8)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__0;
    v11 = __Block_byref_object_dispose__0;
    v12 = (id)objc_opt_new();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __30__NIDiscoveryToken_serialize___block_invoke;
    v6[3] = &unk_1E43629E8;
    v6[4] = &v7;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
    v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __30__NIDiscoveryToken_serialize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a2;
  objc_msgSend(v3, "rawToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5 >= 0x100)
    __assert_rtn("+[NIDiscoveryToken serialize:]_block_invoke", "NIConfiguration.mm", 195, "tokenLength <= std::numeric_limits<uint8_t>::max()");
  v8 = v5;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendBytes:length:", &v8, 1);
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v3, "rawToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v7);

}

+ (id)deserialize:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  NIDiscoveryToken *v11;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") <= 0xF4240)
  {
    v4 = (void *)objc_opt_new();
    v5 = 0;
    do
    {
      if (v5 >= objc_msgSend(v3, "length"))
        break;
      v6 = objc_retainAutorelease(v3);
      v7 = objc_msgSend(v6, "bytes");
      v8 = *(unsigned __int8 *)(v7 + v5);
      v9 = v5 + 1;
      if (*(_BYTE *)(v7 + v5))
      {
        if (v5 + v8 >= objc_msgSend(v6, "length"))
          break;
        objc_msgSend(v6, "subdataWithRange:", v5 + 1, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[NIDiscoveryToken initWithBytes:]([NIDiscoveryToken alloc], "initWithBytes:", v10);
        objc_msgSend(v4, "addObject:", v11);
        v9 += v8;

      }
      v5 = v9;
    }
    while (v9 < 0xF4240);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)rawTokenAsString
{
  return (NSString *)PRCommonConvertNSDataToHexNSString(self->_rawToken, 0);
}

- (NIDiscoveryToken)initWithDeviceAddress:(unsigned __int16)a3
{
  void *v4;
  NIDiscoveryToken *v5;
  uint64_t v6;
  NSNumber *shortDeviceAddress;
  unsigned __int16 v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NIDiscoveryToken initWithBytes:]([NIDiscoveryToken alloc], "initWithBytes:", v4);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v9);
    v6 = objc_claimAutoreleasedReturnValue();
    shortDeviceAddress = v5->_shortDeviceAddress;
    v5->_shortDeviceAddress = (NSNumber *)v6;

  }
  return v5;
}

- (id)shortDeviceAddress
{
  return self->_shortDeviceAddress;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSNumber *shortDeviceAddress;
  void *v5;

  shortDeviceAddress = self->_shortDeviceAddress;
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (shortDeviceAddress)
    return (id)objc_msgSend(v5, "initWithDeviceAddress:", (unsigned __int16)-[NSNumber intValue](self->_shortDeviceAddress, "intValue"));
  else
    return (id)objc_msgSend(v5, "initWithBytes:", self->_rawToken);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_rawToken, CFSTR("rawToken"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shortDeviceAddress, CFSTR("shortDeviceAddress"));

}

- (NIDiscoveryToken)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NIDiscoveryToken *v7;
  NIDiscoveryToken *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortDeviceAddress"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v8 = 0;
          goto LABEL_10;
        }
        v7 = -[NIDiscoveryToken initWithDeviceAddress:](self, "initWithDeviceAddress:", (unsigned __int16)objc_msgSend(v6, "intValue"));
      }
      else
      {
        v7 = -[NIDiscoveryToken initWithBytes:](self, "initWithBytes:", v5);
      }
      self = v7;
      v8 = self;
LABEL_10:

      goto LABEL_11;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  NIDiscoveryToken *v4;
  BOOL v5;

  v4 = (NIDiscoveryToken *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = v4 == self || -[NSData isEqualToData:](self->_identifyingSequence, "isEqualToData:", v4->_identifyingSequence);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[NSData hash](self->_identifyingSequence, "hash");
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NIDiscoveryToken descriptionInternal](self, "descriptionInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v5, v6);

  return v7;
}

- (id)descriptionInternal
{
  return (id)CUPrintNSObjectMasked();
}

- (NSData)rawToken
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifyingSequence, 0);
  objc_storeStrong((id *)&self->_shortDeviceAddress, 0);
  objc_storeStrong((id *)&self->_rawToken, 0);
}

@end
