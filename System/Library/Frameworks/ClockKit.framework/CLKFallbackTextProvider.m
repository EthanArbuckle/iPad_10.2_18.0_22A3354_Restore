@implementation CLKFallbackTextProvider

- (CLKFallbackTextProvider)initWithTextProviders:(id)a3
{
  id v4;
  CLKFallbackTextProvider *v5;
  uint64_t v6;
  NSArray *textProviders;
  NSArray *v8;
  _QWORD v10[4];
  CLKFallbackTextProvider *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLKFallbackTextProvider;
  v5 = -[CLKTextProvider initPrivate](&v12, sel_initPrivate);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    textProviders = v5->_textProviders;
    v5->_textProviders = (NSArray *)v6;

    v8 = v5->_textProviders;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __49__CLKFallbackTextProvider_initWithTextProviders___block_invoke;
    v10[3] = &unk_24CBF9F10;
    v11 = v5;
    -[NSArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v10);

  }
  return v5;
}

uint64_t __49__CLKFallbackTextProvider_initWithTextProviders___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "paused");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setPaused:", 0);
  return result;
}

+ (id)providerWithProviders:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTextProviders:", v4);

  return v5;
}

- (int64_t)timeTravelUpdateFrequency
{
  NSArray *textProviders;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  textProviders = self->_textProviders;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__CLKFallbackTextProvider_timeTravelUpdateFrequency__block_invoke;
  v5[3] = &unk_24CBF9F38;
  v5[4] = &v6;
  -[NSArray enumerateObjectsUsingBlock:](textProviders, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__CLKFallbackTextProvider_timeTravelUpdateFrequency__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "timeTravelUpdateFrequency");
  if (v3 <= result)
    v5 = result;
  else
    v5 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

- (int64_t)_updateFrequency
{
  NSArray *textProviders;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  textProviders = self->_textProviders;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__CLKFallbackTextProvider__updateFrequency__block_invoke;
  v5[3] = &unk_24CBF9F38;
  v5[4] = &v6;
  -[NSArray enumerateObjectsUsingBlock:](textProviders, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__CLKFallbackTextProvider__updateFrequency__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "_updateFrequency");
  if (v3 <= result)
    v5 = result;
  else
    v5 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLKFallbackTextProvider *v4;
  uint64_t v5;
  NSArray *textProviders;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLKFallbackTextProvider;
  v4 = -[CLKTextProvider copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4 != self)
  {
    v5 = -[NSArray copy](self->_textProviders, "copy");
    textProviders = v4->_textProviders;
    v4->_textProviders = (NSArray *)v5;

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && (v7.receiver = self,
        v7.super_class = (Class)CLKFallbackTextProvider,
        -[CLKTextProvider isEqual:](&v7, sel_isEqual_, v4))
    && -[NSArray isEqualToArray:](self->_textProviders, "isEqualToArray:", v4[16]);

  return v5;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_textProviders, "hash");
}

- (CLKFallbackTextProvider)initWithCoder:(id)a3
{
  id v4;
  CLKFallbackTextProvider *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *textProviders;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLKFallbackTextProvider;
  v5 = -[CLKTextProvider initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("textProviders"));
    v9 = objc_claimAutoreleasedReturnValue();
    textProviders = v5->_textProviders;
    v5->_textProviders = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKFallbackTextProvider;
  v4 = a3;
  -[CLKTextProvider encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_textProviders, CFSTR("textProviders"), v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)textProviders
{
  return self->_textProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProviders, 0);
}

@end
