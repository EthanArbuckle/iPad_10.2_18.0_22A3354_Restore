@implementation CXCallDirectoryMutableLabeledPhoneNumberEntryData

- (CXCallDirectoryMutableLabeledPhoneNumberEntryData)initWithCapacity:(unint64_t)a3
{
  CXCallDirectoryMutableLabeledPhoneNumberEntryData *v4;
  uint64_t v5;
  NSMutableData *mutablePhoneNumberData;
  NSMutableData *v7;
  NSMutableData *mutableLabelData;
  NSMutableDictionary *v9;
  NSMutableDictionary *labelToLabelDataOffset;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CXCallDirectoryMutableLabeledPhoneNumberEntryData;
  v4 = -[CXCallDirectoryLabeledPhoneNumberEntryData init](&v12, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 16 * a3);
    mutablePhoneNumberData = v4->_mutablePhoneNumberData;
    v4->_mutablePhoneNumberData = (NSMutableData *)v5;

    -[CXCallDirectoryLabeledPhoneNumberEntryData setPhoneNumberData:](v4, "setPhoneNumberData:", v4->_mutablePhoneNumberData);
    v7 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    mutableLabelData = v4->_mutableLabelData;
    v4->_mutableLabelData = v7;

    -[CXCallDirectoryLabeledPhoneNumberEntryData setLabelData:](v4, "setLabelData:", v4->_mutableLabelData);
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    labelToLabelDataOffset = v4->_labelToLabelDataOffset;
    v4->_labelToLabelDataOffset = v9;

  }
  return v4;
}

- (CXCallDirectoryMutableLabeledPhoneNumberEntryData)init
{
  return -[CXCallDirectoryMutableLabeledPhoneNumberEntryData initWithCapacity:](self, "initWithCapacity:", 0);
}

- (BOOL)appendPhoneNumber:(int64_t)a3 label:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[2];

  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_labelToLabelDataOffset, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "unsignedIntegerValue");
  }
  else
  {
    v10 = objc_msgSend(v6, "lengthOfBytesUsingEncoding:", 4);
    v9 = -1;
    if (v10)
    {
      v11 = v10;
      v12 = v10 + 1;
      if (!((unint64_t)(v10 + 1) >> 16))
      {
        v9 = -[NSMutableData length](self->_mutableLabelData, "length");
        LOWORD(v15[0]) = v11;
        -[NSMutableData appendBytes:length:](self->_mutableLabelData, "appendBytes:length:", v15, 2);
        -[NSMutableData appendBytes:length:](self->_mutableLabelData, "appendBytes:length:", objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), v12);
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_labelToLabelDataOffset, "setObject:forKeyedSubscript:", v13, v6);

  }
  if (v9 != -1)
  {
    v15[0] = a3;
    v15[1] = v9;
    -[NSMutableData appendBytes:length:](self->_mutablePhoneNumberData, "appendBytes:length:", v15, 16);
  }

  return v9 != -1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CXCallDirectoryLabeledPhoneNumberEntryData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_alloc_init(CXCallDirectoryLabeledPhoneNumberEntryData);
  -[CXCallDirectoryMutableLabeledPhoneNumberEntryData mutablePhoneNumberData](self, "mutablePhoneNumberData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[CXCallDirectoryLabeledPhoneNumberEntryData setPhoneNumberData:](v5, "setPhoneNumberData:", v7);

  -[CXCallDirectoryMutableLabeledPhoneNumberEntryData mutableLabelData](self, "mutableLabelData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[CXCallDirectoryLabeledPhoneNumberEntryData setLabelData:](v5, "setLabelData:", v9);

  return v5;
}

- (NSMutableData)mutablePhoneNumberData
{
  return self->_mutablePhoneNumberData;
}

- (void)setMutablePhoneNumberData:(id)a3
{
  objc_storeStrong((id *)&self->_mutablePhoneNumberData, a3);
}

- (NSMutableData)mutableLabelData
{
  return self->_mutableLabelData;
}

- (void)setMutableLabelData:(id)a3
{
  objc_storeStrong((id *)&self->_mutableLabelData, a3);
}

- (NSMutableDictionary)labelToLabelDataOffset
{
  return self->_labelToLabelDataOffset;
}

- (void)setLabelToLabelDataOffset:(id)a3
{
  objc_storeStrong((id *)&self->_labelToLabelDataOffset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelToLabelDataOffset, 0);
  objc_storeStrong((id *)&self->_mutableLabelData, 0);
  objc_storeStrong((id *)&self->_mutablePhoneNumberData, 0);
}

@end
