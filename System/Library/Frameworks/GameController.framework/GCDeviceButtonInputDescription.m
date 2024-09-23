@implementation GCDeviceButtonInputDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDeviceButtonInputDescription)initWithName:(id)a3 additionalAliases:(id)a4 attributes:(unint64_t)a5 nameLocalizationKey:(id)a6 symbolName:(id)a7 sourceAttributes:(unint64_t)a8 sourceNameLocalizationKey:(id)a9 sourceSymbolName:(id)a10 sourceTouchedThreshold:(float)a11 sourcePressedThreshold:(float)a12 sourceExtendedEventField:(int64_t)a13
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  GCDeviceButtonInputDescription *v26;
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
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)GCDeviceButtonInputDescription;
  v20 = a10;
  v21 = a9;
  v22 = a7;
  v23 = a6;
  v24 = a4;
  v25 = a3;
  v26 = -[GCDeviceButtonInputDescription init](&v41, sel_init);
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

  v26->_sourceTouchedThreshold = a11;
  v26->_sourcePressedThreshold = a12;
  v26->_sourceExtendedEventFieldIndex = a13;
  return v26;
}

- (GCDeviceButtonInputDescription)initWithName:(id)a3 additionalAliases:(id)a4 attributes:(unint64_t)a5 nameLocalizationKey:(id)a6 symbolName:(id)a7 sourceAttributes:(unint64_t)a8 sourceExtendedEventField:(int64_t)a9
{
  double v9;
  double v10;

  LODWORD(v9) = 0;
  LODWORD(v10) = 0;
  return -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceNameLocalizationKey:sourceSymbolName:sourceTouchedThreshold:sourcePressedThreshold:sourceExtendedEventField:](self, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceNameLocalizationKey:sourceSymbolName:sourceTouchedThreshold:sourcePressedThreshold:sourceExtendedEventField:", a3, a4, a5, a6, a7, a8, v9, v10, a6, a7, a9);
}

- (GCDeviceButtonInputDescription)init
{
  -[GCDeviceButtonInputDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCDeviceButtonInputDescription)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  double v19;
  double v20;
  GCDeviceButtonInputDescription *v21;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("additionalAliases"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("attributes"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nameLocalizationKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sourceAttributes"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceNameLocalizationKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceSymbolName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeFloatForKey:", CFSTR("sourceTouchedThreshold"));
  v15 = v14;
  objc_msgSend(v3, "decodeFloatForKey:", CFSTR("sourcePressedThreshold"));
  v17 = v16;
  v18 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sourceExtendedEventFieldIndex"));

  LODWORD(v19) = v15;
  LODWORD(v20) = v17;
  v21 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceNameLocalizationKey:sourceSymbolName:sourceTouchedThreshold:sourcePressedThreshold:sourceExtendedEventField:](self, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceNameLocalizationKey:sourceSymbolName:sourceTouchedThreshold:sourcePressedThreshold:sourceExtendedEventField:", v4, v7, v8, v9, v10, v11, v19, v20, v12, v13, v18);

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  double v5;
  double v6;
  id v7;

  name = self->_name;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_additionalAliases, CFSTR("additionalAliases"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_attributes, CFSTR("attributes"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_nameLocalizationKey, CFSTR("nameLocalizationKey"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_symbolName, CFSTR("symbolName"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_sourceAttributes, CFSTR("sourceAttributes"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_sourceNameLocalizationKey, CFSTR("sourceNameLocalizationKey"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_sourceSymbolName, CFSTR("sourceSymbolName"));
  *(float *)&v5 = self->_sourceTouchedThreshold;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("sourceTouchedThreshold"), v5);
  *(float *)&v6 = self->_sourcePressedThreshold;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("sourcePressedThreshold"), v6);
  objc_msgSend(v7, "encodeInteger:forKey:", self->_sourceExtendedEventFieldIndex, CFSTR("sourceExtendedEventFieldIndex"));

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

- (BOOL)supportsTouch
{
  return BYTE2(self->_sourceAttributes) & 1;
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

- (float)sourceTouchedThreshold
{
  return self->_sourceTouchedThreshold;
}

- (float)sourcePressedThreshold
{
  return self->_sourcePressedThreshold;
}

- (int64_t)sourceExtendedEventFieldIndex
{
  return self->_sourceExtendedEventFieldIndex;
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
