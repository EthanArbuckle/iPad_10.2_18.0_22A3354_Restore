@implementation CNTimestamped

+ (id)wrapTransformWithScheduler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__CNTimestamped_wrapTransformWithScheduler___block_invoke;
  v8[3] = &unk_1E29BB680;
  v9 = v4;
  v10 = a1;
  v5 = v4;
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

id __44__CNTimestamped_wrapTransformWithScheduler___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = *(objc_class **)(a1 + 40);
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v6 = (void *)objc_msgSend(v5, "initWithValue:timestamp:", v4);

  return v6;
}

+ (id)timestampedWithValue:(id)a3 timestamp:(double)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:timestamp:", v6, a4);

  return v7;
}

- (CNTimestamped)initWithValue:(id)a3 timestamp:(double)a4
{
  id v7;
  CNTimestamped *v8;
  CNTimestamped *v9;
  CNTimestamped *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNTimestamped;
  v8 = -[CNTimestamped init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_value, a3);
    v9->_timestamp = a4;
    v10 = v9;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[CNTimestamped timestamp](self, "timestamp");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNTimestamped value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNDescriptionBuilder descriptionForObject:withNamesAndObjects:](CNDescriptionBuilder, "descriptionForObject:withNamesAndObjects:", self, CFSTR("timestamp"), v4, CFSTR("value"), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t aBlock;
  uint64_t v10;
  BOOL (*v11)(uint64_t);
  void *v12;
  CNTimestamped *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __25__CNTimestamped_isEqual___block_invoke;
  v15[3] = &unk_1E29B9D38;
  v15[4] = self;
  v16 = v4;
  aBlock = v5;
  v10 = 3221225472;
  v11 = __25__CNTimestamped_isEqual___block_invoke_2;
  v12 = &unk_1E29B9D38;
  v13 = self;
  v14 = v16;
  v6 = v16;
  v7 = _Block_copy(&aBlock);
  LOBYTE(self) = +[CNEqualsBuilder isObject:memberOfSameClassAndEqualTo:withBlocks:](CNEqualsBuilder, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

BOOL __25__CNTimestamped_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[CNEqualsBuilder isObject:equalToOther:](CNEqualsBuilder, "isObject:equalToOther:", v2, v3);

  return v4;
}

BOOL __25__CNTimestamped_isEqual___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 40), "timestamp");
  return +[CNEqualsBuilder isDouble:equalToOther:withAccuracy:](CNEqualsBuilder, "isDouble:equalToOther:withAccuracy:", v3, v4, 0.000001);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CNTimestamped value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)value
{
  return self->_value;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
