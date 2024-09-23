@implementation DYGPUDerivedEncoderCounterInfo

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUDerivedEncoderCounterInfo derivedCounterNames](self, "derivedCounterNames"));
  v6 = objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setDerivedCounterNames:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUDerivedEncoderCounterInfo derivedCounters](self, "derivedCounters"));
  v8 = objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDerivedCounters:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUDerivedEncoderCounterInfo encoderInfos](self, "encoderInfos"));
  v10 = objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setEncoderInfos:", v10);

  return v4;
}

- (DYGPUDerivedEncoderCounterInfo)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  DYGPUDerivedEncoderCounterInfo *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  uint64_t v13;
  NSArray *derivedCounterNames;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSSet *v18;
  void *v19;
  uint64_t v20;
  NSData *derivedCounters;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSSet *v25;
  void *v26;
  uint64_t v27;
  NSData *encoderInfos;
  DYGPUDerivedEncoderCounterInfo *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)DYGPUDerivedEncoderCounterInfo;
  v6 = -[DYGPUDerivedEncoderCounterInfo init](&v31, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSArray, v5);
    v9 = objc_opt_class(NSMutableArray, v8);
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v9, objc_opt_class(NSString, v10), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("derivedCounterNames")));
    derivedCounterNames = v6->_derivedCounterNames;
    v6->_derivedCounterNames = (NSArray *)v13;

    v16 = objc_opt_class(NSData, v15);
    v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, objc_opt_class(NSMutableData, v17), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("derivedCounters")));
    derivedCounters = v6->_derivedCounters;
    v6->_derivedCounters = (NSData *)v20;

    v23 = objc_opt_class(NSData, v22);
    v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v23, objc_opt_class(NSMutableData, v24), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("encoderInfos")));
    encoderInfos = v6->_encoderInfos;
    v6->_encoderInfos = (NSData *)v27;

    v29 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_derivedCounterNames, CFSTR("derivedCounterNames"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_derivedCounters, CFSTR("derivedCounters"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_encoderInfos, CFSTR("encoderInfos"));

}

- (DYGPUDerivedEncoderCounterInfo)init
{
  DYGPUDerivedEncoderCounterInfo *v2;
  DYGPUDerivedEncoderCounterInfo *v3;
  DYGPUDerivedEncoderCounterInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DYGPUDerivedEncoderCounterInfo;
  v2 = -[DYGPUDerivedEncoderCounterInfo init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)_enumerateEncoderDerivedData:(id)a3
{
  char *v4;
  char *v5;
  unsigned int v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(id, _QWORD, char *, char *, NSUInteger);

  v12 = (void (**)(id, _QWORD, char *, char *, NSUInteger))a3;
  v4 = -[NSData bytes](self->_encoderInfos, "bytes");
  v5 = -[NSData bytes](self->_derivedCounters, "bytes");
  v6 = -[NSData length](self->_encoderInfos, "length");
  v7 = -[NSArray count](self->_derivedCounterNames, "count");
  if (v6 >= 0x30)
  {
    v8 = v7;
    v9 = 0;
    if (v6 / 0x30 <= 1)
      v10 = 1;
    else
      v10 = v6 / 0x30;
    v11 = 8 * v7;
    do
    {
      v12[2](v12, v9++, v4, v5, v8);
      v5 += v11;
      v4 += 48;
    }
    while (v10 != v9);
  }

}

- (void)_enumerateEncoderDerivedDataAtIndex:(unsigned int)a3 withBlock:(id)a4
{
  const void *v6;
  char *v7;
  NSUInteger v8;
  void (**v9)(id, uint64_t, _QWORD, NSUInteger);

  v9 = (void (**)(id, uint64_t, _QWORD, NSUInteger))a4;
  v6 = -[NSData bytes](self->_encoderInfos, "bytes");
  v7 = -[NSData bytes](self->_derivedCounters, "bytes");
  v8 = -[NSArray count](self->_derivedCounterNames, "count");
  ((void (**)(id, uint64_t, char *, NSUInteger))v9)[2](v9, (uint64_t)v6 + 48 * a3, &v7[8 * v8 * a3], v8);

}

- (NSArray)derivedCounterNames
{
  return self->_derivedCounterNames;
}

- (void)setDerivedCounterNames:(id)a3
{
  objc_storeStrong((id *)&self->_derivedCounterNames, a3);
}

- (NSData)derivedCounters
{
  return self->_derivedCounters;
}

- (void)setDerivedCounters:(id)a3
{
  objc_storeStrong((id *)&self->_derivedCounters, a3);
}

- (NSData)encoderInfos
{
  return self->_encoderInfos;
}

- (void)setEncoderInfos:(id)a3
{
  objc_storeStrong((id *)&self->_encoderInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoderInfos, 0);
  objc_storeStrong((id *)&self->_derivedCounters, 0);
  objc_storeStrong((id *)&self->_derivedCounterNames, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
