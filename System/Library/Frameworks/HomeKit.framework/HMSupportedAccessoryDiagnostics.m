@implementation HMSupportedAccessoryDiagnostics

- (HMSupportedAccessoryDiagnostics)initWithSupportedTypes:(unint64_t)a3 format:(int64_t)a4 audio:(unint64_t)a5 options:(unint64_t)a6
{
  HMSupportedAccessoryDiagnostics *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMSupportedAccessoryDiagnostics;
  result = -[HMSupportedAccessoryDiagnostics init](&v11, sel_init);
  if (result)
  {
    result->_supportedTypes = a3;
    result->_supportedFormat = a4;
    result->_supportedOptions = a6;
    result->_supportedAudio = a5;
  }
  return result;
}

- (HMSupportedAccessoryDiagnostics)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HMSupportedAccessoryDiagnostics *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.diagnostics.ck.ty"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.diagnostics.ck.sf"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.diagnostics.ck.so"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.diagnostics.ck.sa"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "integerValue");
  if ((unint64_t)(v9 - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    self = -[HMSupportedAccessoryDiagnostics initWithSupportedTypes:format:audio:options:](self, "initWithSupportedTypes:format:audio:options:", objc_msgSend(v5, "integerValue"), v9, objc_msgSend(v8, "integerValue"), objc_msgSend(v7, "integerValue"));
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t supportedTypes;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  supportedTypes = self->_supportedTypes;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", supportedTypes);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("HMA.diagnostics.ck.ty"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_supportedFormat);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("HMA.diagnostics.ck.sf"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_supportedOptions);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("HMA.diagnostics.ck.so"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_supportedAudio);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("HMA.diagnostics.ck.sa"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<HMSupportedAccessoryDiagnostics supportedFormat=%ld, supportedTypes=%lu, supportedAudio=%lu, supportedOptions=%lu>"), -[HMSupportedAccessoryDiagnostics supportedFormat](self, "supportedFormat"), -[HMSupportedAccessoryDiagnostics supportedTypes](self, "supportedTypes"), -[HMSupportedAccessoryDiagnostics supportedAudio](self, "supportedAudio"), -[HMSupportedAccessoryDiagnostics supportedOptions](self, "supportedOptions"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v7 = -[HMSupportedAccessoryDiagnostics supportedTypes](self, "supportedTypes"),
        v7 == objc_msgSend(v6, "supportedTypes"))
    && (v8 = -[HMSupportedAccessoryDiagnostics supportedFormat](self, "supportedFormat"),
        v8 == objc_msgSend(v6, "supportedFormat"))
    && (v9 = -[HMSupportedAccessoryDiagnostics supportedOptions](self, "supportedOptions"),
        v9 == objc_msgSend(v6, "supportedOptions")))
  {
    v10 = -[HMSupportedAccessoryDiagnostics supportedAudio](self, "supportedAudio");
    v11 = v10 == objc_msgSend(v6, "supportedAudio");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  int64_t v4;
  unint64_t v5;

  v3 = -[HMSupportedAccessoryDiagnostics supportedTypes](self, "supportedTypes");
  v4 = -[HMSupportedAccessoryDiagnostics supportedFormat](self, "supportedFormat") ^ v3;
  v5 = -[HMSupportedAccessoryDiagnostics supportedOptions](self, "supportedOptions");
  return v4 ^ v5 ^ -[HMSupportedAccessoryDiagnostics supportedAudio](self, "supportedAudio");
}

- (unint64_t)supportedTypes
{
  return self->_supportedTypes;
}

- (int64_t)supportedFormat
{
  return self->_supportedFormat;
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (unint64_t)supportedAudio
{
  return self->_supportedAudio;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
