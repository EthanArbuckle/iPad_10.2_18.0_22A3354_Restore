@implementation ATXWidgetDescriptorCacheMetadata

- (ATXWidgetDescriptorCacheMetadata)initWithInstallDate:(id)a3 containerBundleId:(id)a4 hasHomeScreenWidgetFamiliesOnly:(BOOL)a5 hasAccessoryWidgetFamiliesOnly:(BOOL)a6
{
  id v11;
  id v12;
  ATXWidgetDescriptorCacheMetadata *v13;
  ATXWidgetDescriptorCacheMetadata *v14;
  uint64_t v15;
  NSString *containerBundleId;
  ATXWidgetDescriptorCacheMetadata *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ATXWidgetDescriptorCacheMetadata;
  v13 = -[ATXWidgetDescriptorCacheMetadata init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_installDate, a3);
    v15 = objc_msgSend(v12, "copy");
    containerBundleId = v14->_containerBundleId;
    v14->_containerBundleId = (NSString *)v15;

    v14->_hasHomeScreenWidgetFamiliesOnly = a5;
    v14->_hasAccessoryWidgetFamiliesOnly = a6;
    v17 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *installDate;
  id v5;

  installDate = self->_installDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", installDate, CFSTR("installDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerBundleId, CFSTR("containerBundleId"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasHomeScreenWidgetFamiliesOnly, CFSTR("hasHomeScreenWidgetFamiliesOnly"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasAccessoryWidgetFamiliesOnly, CFSTR("hasAccessoryWidgetFamiliesOnly"));

}

- (ATXWidgetDescriptorCacheMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ATXWidgetDescriptorCacheMetadata *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerBundleId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ATXWidgetDescriptorCacheMetadata initWithInstallDate:containerBundleId:hasHomeScreenWidgetFamiliesOnly:hasAccessoryWidgetFamiliesOnly:](self, "initWithInstallDate:containerBundleId:hasHomeScreenWidgetFamiliesOnly:hasAccessoryWidgetFamiliesOnly:", v5, v6, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasHomeScreenWidgetFamiliesOnly")), objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAccessoryWidgetFamiliesOnly")));

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  ATXWidgetDescriptorCacheMetadata *v4;
  ATXWidgetDescriptorCacheMetadata *v5;
  BOOL v6;

  v4 = (ATXWidgetDescriptorCacheMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXWidgetDescriptorCacheMetadata isEqualToATXWidgetDescriptorCacheMetadata:](self, "isEqualToATXWidgetDescriptorCacheMetadata:", v5);

  return v6;
}

- (BOOL)isEqualToATXWidgetDescriptorCacheMetadata:(id)a3
{
  id *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  NSString *containerBundleId;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  char v13;
  BOOL v14;

  v4 = (id *)a3;
  -[NSDate timeIntervalSinceReferenceDate](self->_installDate, "timeIntervalSinceReferenceDate");
  v6 = v5;
  objc_msgSend(v4, "installDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  if (vabdd_f64(v6, v8) >= 1.0)
    goto LABEL_8;
  containerBundleId = self->_containerBundleId;
  v10 = (NSString *)v4[3];
  if (containerBundleId == v10)
  {

  }
  else
  {
    v11 = v10;
    v12 = containerBundleId;
    v13 = -[NSString isEqual:](v12, "isEqual:", v11);

    if ((v13 & 1) == 0)
      goto LABEL_8;
  }
  if (self->_hasAccessoryWidgetFamiliesOnly != *((unsigned __int8 *)v4 + 9))
  {
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  v14 = self->_hasHomeScreenWidgetFamiliesOnly == *((unsigned __int8 *)v4 + 8);
LABEL_9:

  return v14;
}

- (NSDate)installDate
{
  return self->_installDate;
}

- (NSString)containerBundleId
{
  return self->_containerBundleId;
}

- (BOOL)hasHomeScreenWidgetFamiliesOnly
{
  return self->_hasHomeScreenWidgetFamiliesOnly;
}

- (BOOL)hasAccessoryWidgetFamiliesOnly
{
  return self->_hasAccessoryWidgetFamiliesOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerBundleId, 0);
  objc_storeStrong((id *)&self->_installDate, 0);
}

@end
