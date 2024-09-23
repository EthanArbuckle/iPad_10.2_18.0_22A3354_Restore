@implementation GCDeviceElementDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDeviceElementDescription)initWithCoder:(id)a3
{
  -[GCDeviceElementDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[GCDeviceElementDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (NSString)name
{
  -[GCDeviceElementDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (NSSet)additionalAliases
{
  -[GCDeviceElementDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isRemappable
{
  -[GCDeviceElementDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isMappableToSystemGestures
{
  -[GCDeviceElementDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isBoundToSystemGesture
{
  -[GCDeviceElementDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)localizedName
{
  -[GCDeviceElementDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (NSString)symbolName
{
  -[GCDeviceElementDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GCDeviceElementDescription name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GCDeviceElementDescription name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = 0;
      goto LABEL_7;
    }
    -[GCDeviceElementDescription name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v4);
  }

LABEL_7:
  return v7;
}

- (NSString)nameLocalizationKey
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLocalizationKey, 0);
}

@end
