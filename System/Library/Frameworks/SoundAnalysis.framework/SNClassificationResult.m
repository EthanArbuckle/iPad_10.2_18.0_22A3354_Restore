@implementation SNClassificationResult

- (NSArray)classifications
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SNClassification *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[_SNClassificationResult classifications](self->_impl, "classifications", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = -[SNClassification initWithImpl:]([SNClassification alloc], "initWithImpl:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (CMTimeRange)timeRange
{
  CMTimeRange *result;

  result = (CMTimeRange *)self->_impl;
  if (result)
    return (CMTimeRange *)-[CMTimeRange timeRange](result, "timeRange");
  *(_OWORD *)&retstr->start.epoch = 0u;
  *(_OWORD *)&retstr->duration.timescale = 0u;
  *(_OWORD *)&retstr->start.value = 0u;
  return result;
}

- (SNClassificationResult)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("-init is not a valid initializer for the class SNClassificationResult"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (SNClassificationResult)new
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("+new is not a valid class method for the class SNClassificationResult"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (SNClassification)classificationForIdentifier:(NSString *)identifier
{
  void *v3;
  SNClassification *v4;

  -[_SNClassificationResult classificationForIdentifier:](self->_impl, "classificationForIdentifier:", identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[SNClassification initWithImpl:]([SNClassification alloc], "initWithImpl:", v3);
  else
    v4 = 0;

  return v4;
}

- (void)setTimeRange:(id *)a3
{
  __int128 v3;
  _OWORD v4[3];

  v3 = *(_OWORD *)&a3->var0.var3;
  v4[0] = *(_OWORD *)&a3->var0.var0;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->var1.var1;
  -[_SNClassificationResult setTimeRange:](self->_impl, "setTimeRange:", v4);
}

- (NSString)classifierIdentifier
{
  return (NSString *)MEMORY[0x1E0DE7D20](self->_impl, sel_classifierIdentifier);
}

- (void)setClassifierIdentifier:(id)a3
{
  MEMORY[0x1E0DE7D20](self->_impl, sel_setClassifierIdentifier_);
}

- (SNClassificationResult)initWithClassificationDictionary:(id)a3
{
  id v4;
  SNClassificationResult *v5;
  _SNClassificationResult *v6;
  _SNClassificationResult *impl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNClassificationResult;
  v5 = -[SNClassificationResult init](&v9, sel_init);
  if (v5)
  {
    v6 = -[_SNClassificationResult initWithClassificationDictionary:]([_SNClassificationResult alloc], "initWithClassificationDictionary:", v4);
    impl = v5->_impl;
    v5->_impl = v6;

    if (!v5->_impl)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (NSDictionary)classificationDictionary
{
  return (NSDictionary *)MEMORY[0x1E0DE7D20](self->_impl, sel_classificationDictionary);
}

- (void)setClassificationDictionary:(id)a3
{
  MEMORY[0x1E0DE7D20](self->_impl, sel_setClassificationDictionary_);
}

- (SNClassificationResult)initWithImpl:(id)a3
{
  id v5;
  SNClassificationResult *v6;
  SNClassificationResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNClassificationResult;
  v6 = -[SNClassificationResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_impl, a3);

  return v7;
}

- (id)_initPrivate:(id)a3
{
  id v4;
  SNClassificationResult *v5;
  _SNClassificationResult *v6;
  _SNClassificationResult *impl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNClassificationResult;
  v5 = -[SNClassificationResult init](&v9, sel_init);
  if (v5)
  {
    v6 = -[_SNClassificationResult _initPrivate:]([_SNClassificationResult alloc], "_initPrivate:", v4);
    impl = v5->_impl;
    v5->_impl = v6;

    if (!v5->_impl)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[_SNClassificationResult copyWithZone:](self->_impl, "copyWithZone:", a3);
  v7 = (void *)objc_msgSend(v5, "initWithImpl:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SNClassificationResult *v4;
  SNClassificationResult *v5;
  BOOL v6;

  v4 = (SNClassificationResult *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[_SNClassificationResult isEqual:](self->_impl, "isEqual:", v5->_impl);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  return MEMORY[0x1E0DE7D20](self->_impl, sel_hash);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SNClassificationResult)initWithCoder:(id)a3
{
  id v4;
  SNClassificationResult *v5;
  SNClassificationResult *v6;
  _SNClassificationResult *v7;
  _SNClassificationResult *impl;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SNClassificationResult;
  v5 = -[SNClassificationResult init](&v10, sel_init);
  v6 = v5;
  if (!v4
    || v5
    && (v7 = -[_SNClassificationResult initWithCoder:]([_SNClassificationResult alloc], "initWithCoder:", v4), impl = v6->_impl, v6->_impl = v7, impl, !v6->_impl))
  {

    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (a3)
    MEMORY[0x1E0DE7D20](self->_impl, sel_encodeWithCoder_);
}

- (SNClassificationResult)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  id v8;
  id v9;
  SNClassificationResult *v10;
  _SNClassificationResult *v11;
  _SNClassificationResult *impl;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SNClassificationResult;
  v10 = -[SNClassificationResult init](&v14, sel_init);
  if (v10)
  {
    v11 = -[_SNClassificationResult initWithBinarySampleRepresentation:metadata:timestamp:]([_SNClassificationResult alloc], "initWithBinarySampleRepresentation:metadata:timestamp:", v8, v9, a5);
    impl = v10->_impl;
    v10->_impl = v11;

    if (!v10->_impl)
    {

      v10 = 0;
    }
  }

  return v10;
}

- (SNClassificationResult)initWithBinarySampleRepresentation:(id)a3
{
  id v4;
  SNClassificationResult *v5;
  _SNClassificationResult *v6;
  _SNClassificationResult *impl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNClassificationResult;
  v5 = -[SNClassificationResult init](&v9, sel_init);
  if (v5)
  {
    v6 = -[_SNClassificationResult initWithBinarySampleRepresentation:]([_SNClassificationResult alloc], "initWithBinarySampleRepresentation:", v4);
    impl = v5->_impl;
    v5->_impl = v6;

    if (!v5->_impl)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)binarySampleRepresentation
{
  return (id)MEMORY[0x1E0DE7D20](self->_impl, sel_binarySampleRepresentation);
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1E0DE7D20](self->_impl, sel_description);
}

- (id)impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
