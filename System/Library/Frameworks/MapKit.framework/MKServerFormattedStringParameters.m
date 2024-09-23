@implementation MKServerFormattedStringParameters

- (MKServerFormattedStringParameters)initWithOptions:(id *)a3 variableOverrides:(id)a4
{
  id v6;
  MKServerFormattedStringParameters *v7;
  MKServerFormattedStringParameters *v8;
  __int128 v9;
  uint64_t v10;
  NSDictionary *variableOverrides;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MKServerFormattedStringParameters;
  v7 = -[MKServerFormattedStringParameters init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v9 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&v7->_options.abbreviatedUnits = *(_OWORD *)&a3->var0;
    *(_OWORD *)&v7->_options.spoken = v9;
    v10 = objc_msgSend(v6, "copy");
    variableOverrides = v8->_variableOverrides;
    v8->_variableOverrides = (NSDictionary *)v10;

  }
  return v8;
}

- (MKServerFormattedStringParameters)initWithInstructionsDistanceDetailLevel:(int64_t)a3 variableOverrides:(id)a4
{
  id v6;
  MKServerFormattedStringParameters *v7;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v6 = a4;
  MKFormattedStringOptionsMakeDefault((uint64_t)&v10);
  *((_QWORD *)&v10 + 1) = a3;
  v9[0] = v10;
  v9[1] = v11;
  v7 = -[MKServerFormattedStringParameters initWithOptions:variableOverrides:](self, "initWithOptions:variableOverrides:", v9, v6);

  return v7;
}

- (MKServerFormattedStringParameters)initWithCoder:(id)a3
{
  id v4;
  MKServerFormattedStringParameters *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *variableOverrides;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MKServerFormattedStringParameters;
  v5 = -[MKServerFormattedStringParameters init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getBytes:length:", &v5->_options, 32);
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("variableOverrides"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    variableOverrides = v5->_variableOverrides;
    v5->_variableOverrides = (NSDictionary *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  $CFC90E569448E1712EA5B4B1FF577D37 *p_options;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0C99D50];
  p_options = &self->_options;
  v7 = a3;
  objc_msgSend(v4, "dataWithBytes:length:", p_options, 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("options"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_variableOverrides, CFSTR("variableOverrides"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  MKServerFormattedStringParameters *v4;
  MKServerFormattedStringParameters *v5;
  BOOL v6;

  v4 = (MKServerFormattedStringParameters *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[MKServerFormattedStringParameters isEqualToServerFormattedStringParameters:](self, "isEqualToServerFormattedStringParameters:", v5);

  return v6;
}

- (BOOL)isEqualToServerFormattedStringParameters:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = a3;
  -[MKServerFormattedStringParameters options](self, "options");
  if (v4)
    objc_msgSend(v4, "options");
  if (MNFormattedStringOptionsIsEqual())
  {
    -[MKServerFormattedStringParameters variableOverrides](self, "variableOverrides");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "variableOverrides");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 | v6)
      v7 = objc_msgSend((id)v5, "isEqual:", v6);
    else
      v7 = 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  -[MKServerFormattedStringParameters options](self, "options");
  v3 = MNFormattedStringOptionsHash();
  -[MKServerFormattedStringParameters variableOverrides](self, "variableOverrides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- ($14769AC32134521FBB471D523793ADA4)options
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (NSDictionary)variableOverrides
{
  return self->_variableOverrides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableOverrides, 0);
}

@end
