@implementation GCDeviceDirectionPadDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDeviceDirectionPadDescription)initWithName:(id)a3 additionalAliases:(id)a4 attributes:(unint64_t)a5 nameLocalizationKey:(id)a6 symbolName:(id)a7 sourceAttributes:(unint64_t)a8 sourceNameLocalizationKey:(id)a9 sourceSymbolName:(id)a10 sourcePressedThreshold:(float)a11 sourceUpExtendedEventField:(unint64_t)a12 sourceDownExtendedEventField:(unint64_t)a13 sourceLeftExtendedEventField:(unint64_t)a14 sourceRightExtendedEventField:(unint64_t)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  GCDeviceDirectionPadDescription *v26;
  uint64_t v27;
  NSString *name;
  void *v29;
  void *v30;
  uint64_t v31;
  NSString *nameLocalizationKey;
  uint64_t v33;
  NSString *symbolName;
  uint64_t v35;
  NSString *sourceNameLocalizationKey;
  uint64_t v37;
  NSString *sourceSymbolName;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)GCDeviceDirectionPadDescription;
  v20 = a10;
  v21 = a9;
  v22 = a7;
  v23 = a6;
  v24 = a4;
  v25 = a3;
  v26 = -[GCDeviceDirectionPadDescription init](&v42, sel_init);
  v27 = objc_msgSend(v25, "copy");

  name = v26->_name;
  v26->_name = (NSString *)v27;

  v29 = (void *)objc_msgSend(v24, "copy");
  v30 = v29;
  if (!v29)
  {
    +[NSSet set](&off_254DEBEC0, "set");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&v26->_additionalAliases, v30);
  if (!v29)

  v26->_attributes = a5;
  v31 = objc_msgSend(v23, "copy");

  nameLocalizationKey = v26->_nameLocalizationKey;
  v26->_nameLocalizationKey = (NSString *)v31;

  v33 = objc_msgSend(v22, "copy");
  symbolName = v26->_symbolName;
  v26->_symbolName = (NSString *)v33;

  v26->_sourceAttributes = a8;
  v35 = objc_msgSend(v21, "copy");

  sourceNameLocalizationKey = v26->_sourceNameLocalizationKey;
  v26->_sourceNameLocalizationKey = (NSString *)v35;

  v37 = objc_msgSend(v20, "copy");
  sourceSymbolName = v26->_sourceSymbolName;
  v26->_sourceSymbolName = (NSString *)v37;

  v26->_sourcePressedThreshold = a11;
  v26->_sourceUpExtendedEventFieldIndex = a12;
  v26->_sourceDownExtendedEventFieldIndex = a13;
  v26->_sourceLeftExtendedEventFieldIndex = a14;
  v26->_sourceRightExtendedEventFieldIndex = a15;
  return v26;
}

- (GCDeviceDirectionPadDescription)initWithName:(id)a3 additionalAliases:(id)a4 attributes:(unint64_t)a5 nameLocalizationKey:(id)a6 symbolName:(id)a7 sourceAttributes:(unint64_t)a8 sourceUpExtendedEventField:(unint64_t)a9 sourceDownExtendedEventField:(unint64_t)a10 sourceLeftExtendedEventField:(unint64_t)a11 sourceRightExtendedEventField:(unint64_t)a12
{
  double v12;

  LODWORD(v12) = 0;
  return -[GCDeviceDirectionPadDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceNameLocalizationKey:sourceSymbolName:sourcePressedThreshold:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:](self, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceNameLocalizationKey:sourceSymbolName:sourcePressedThreshold:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:", a3, a4, a5, a6, a7, a8, v12, a6, a7, a9, a10, a11, a12);
}

- (GCDeviceDirectionPadDescription)init
{
  -[GCDeviceDirectionPadDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCDeviceDirectionPadDescription)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  GCDeviceDirectionPadDescription *v18;
  uint64_t v20;
  void *v21;
  void *v22;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v5, CFSTR("additionalAliases"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("attributes"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nameLocalizationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sourceAttributes"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceNameLocalizationKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceSymbolName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeFloatForKey:", CFSTR("sourcePressedThreshold"));
  v12 = v11;
  v13 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sourceUpExtendedEventFieldIndex"));
  v14 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sourceDownExtendedEventFieldIndex"));
  v15 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sourceLeftExtendedEventFieldIndex"));
  v16 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sourceRightExtendedEventFieldIndex"));

  LODWORD(v17) = v12;
  v18 = -[GCDeviceDirectionPadDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceNameLocalizationKey:sourceSymbolName:sourcePressedThreshold:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:](self, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceNameLocalizationKey:sourceSymbolName:sourcePressedThreshold:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:", v22, v21, v20, v6, v7, v8, v17, v9, v10, v13, v14, v15, v16);

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  double v5;
  id v6;

  name = self->_name;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_additionalAliases, CFSTR("additionalAliases"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_attributes, CFSTR("attributes"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_nameLocalizationKey, CFSTR("nameLocalizationKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_symbolName, CFSTR("symbolName"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_sourceAttributes, CFSTR("sourceAttributes"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sourceNameLocalizationKey, CFSTR("sourceNameLocalizationKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sourceSymbolName, CFSTR("sourceSymbolName"));
  *(float *)&v5 = self->_sourcePressedThreshold;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("sourcePressedThreshold"), v5);
  objc_msgSend(v6, "encodeInteger:forKey:", self->_sourceUpExtendedEventFieldIndex, CFSTR("sourceUpExtendedEventFieldIndex"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_sourceDownExtendedEventFieldIndex, CFSTR("sourceDownExtendedEventFieldIndex"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_sourceLeftExtendedEventFieldIndex, CFSTR("sourceLeftExtendedEventFieldIndex"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_sourceRightExtendedEventFieldIndex, CFSTR("sourceRightExtendedEventFieldIndex"));

}

- (BOOL)isRemappable
{
  return (LOBYTE(self->_attributes) >> 1) & 1;
}

- (BOOL)isMappableToSystemGestures
{
  return (BYTE1(self->_attributes) >> 6) & 1;
}

- (BOOL)isBoundToSystemGesture
{
  return BYTE1(self->_attributes) >> 7;
}

- (BOOL)isDigital
{
  return self->_sourceAttributes & 1;
}

- (id)name
{
  return objc_getProperty(self, a2, 40, 1);
}

- (id)additionalAliases
{
  return objc_getProperty(self, a2, 48, 1);
}

- (id)nameLocalizationKey
{
  return objc_getProperty(self, a2, 56, 1);
}

- (id)symbolName
{
  return objc_getProperty(self, a2, 64, 1);
}

- (NSString)sourceNameLocalizationKey
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)sourceSymbolName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (float)sourcePressedThreshold
{
  return self->_sourcePressedThreshold;
}

- (unint64_t)sourceUpExtendedEventFieldIndex
{
  return self->_sourceUpExtendedEventFieldIndex;
}

- (unint64_t)sourceDownExtendedEventFieldIndex
{
  return self->_sourceDownExtendedEventFieldIndex;
}

- (unint64_t)sourceLeftExtendedEventFieldIndex
{
  return self->_sourceLeftExtendedEventFieldIndex;
}

- (unint64_t)sourceRightExtendedEventFieldIndex
{
  return self->_sourceRightExtendedEventFieldIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceSymbolName, 0);
  objc_storeStrong((id *)&self->_sourceNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_nameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_additionalAliases, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
