@implementation CNAutocompleteStoreReproStringRecorder

- (CNAutocompleteStoreReproStringRecorder)init
{
  void *v3;
  CNAutocompleteStoreReproStringRecorder *v4;

  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNAutocompleteStoreReproStringRecorder initWithTimeProvider:](self, "initWithTimeProvider:", v3);

  return v4;
}

- (CNAutocompleteStoreReproStringRecorder)initWithTimeProvider:(id)a3
{
  id v5;
  CNAutocompleteStoreReproStringRecorder *v6;
  CNAutocompleteStoreReproStringRecorder *v7;
  NSMutableString *v8;
  NSMutableString *reproStringStorage;
  NSString *lastString;
  NSNumber *lastTimestamp;
  CNAutocompleteStoreReproStringRecorder *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNAutocompleteStoreReproStringRecorder;
  v6 = -[CNAutocompleteStoreReproStringRecorder init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_timeProvider, a3);
    v8 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    reproStringStorage = v7->_reproStringStorage;
    v7->_reproStringStorage = v8;

    lastString = v7->_lastString;
    v7->_lastString = (NSString *)&stru_1E70E0E70;

    lastTimestamp = v7->_lastTimestamp;
    v7->_lastTimestamp = 0;

    v12 = v7;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteStoreReproStringRecorder reproStringStorage](self, "reproStringStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("reproString"), v4);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)clear
{
  void *v3;

  -[CNAutocompleteStoreReproStringRecorder reproStringStorage](self, "reproStringStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setString:", &stru_1E70E0E70);

  -[CNAutocompleteStoreReproStringRecorder setLastString:](self, "setLastString:", &stru_1E70E0E70);
}

- (NSString)reproString
{
  void *v2;
  void *v3;

  -[CNAutocompleteStoreReproStringRecorder reproStringStorage](self, "reproStringStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (void)recordString:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    -[CNAutocompleteStoreReproStringRecorder clear](self, "clear");
  }
  else
  {
    -[CNAutocompleteStoreReproStringRecorder timeProvider](self, "timeProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    v6 = v5;

    -[CNAutocompleteStoreReproStringRecorder stringForIntervalSinceLastTimestamp:](self, "stringForIntervalSinceLastTimestamp:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteStoreReproStringRecorder reproStringStorage](self, "reproStringStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9 && v7)
    {
      -[CNAutocompleteStoreReproStringRecorder reproStringStorage](self, "reproStringStorage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendFormat:", CFSTR("~%@~"), v7);

    }
    -[CNAutocompleteStoreReproStringRecorder stringForKeystrokesSinceLastString:](self, "stringForKeystrokesSinceLastString:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteStoreReproStringRecorder reproStringStorage](self, "reproStringStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendString:", v11);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteStoreReproStringRecorder setLastTimestamp:](self, "setLastTimestamp:", v13);

    -[CNAutocompleteStoreReproStringRecorder setLastString:](self, "setLastString:", v14);
  }

}

- (id)stringForIntervalSinceLastTimestamp:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;

  -[CNAutocompleteStoreReproStringRecorder lastTimestamp](self, "lastTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[CNAutocompleteStoreReproStringRecorder lastTimestamp](self, "lastTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%lu"), (unint64_t)((a3 - v8) * 1000.0));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)stringForKeystrokesSinceLastString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  -[CNAutocompleteStoreReproStringRecorder lastString](self, "lastString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_rangeOfCommonPrefixWithString:", v5);
  v7 = v6;

  -[CNAutocompleteStoreReproStringRecorder lastString](self, "lastString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "substringFromIndex:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "substringFromIndex:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v9, "_cn_flatMap:", &__block_literal_global_3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendString:", v12);

  objc_msgSend(v11, "appendString:", v10);
  return v11;
}

- (CNTimeProvider)timeProvider
{
  return (CNTimeProvider *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableString)reproStringStorage
{
  return (NSMutableString *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)lastTimestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastTimestamp:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)lastString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastString, 0);
  objc_storeStrong((id *)&self->_lastTimestamp, 0);
  objc_storeStrong((id *)&self->_reproStringStorage, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);
}

@end
