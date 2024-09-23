@implementation HMBMutableModelField

- (id)copyWithZone:(_NSZone *)a3
{
  HMBModelField *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = -[HMBModelField initWithClass:](+[HMBModelField allocWithZone:](HMBModelField, "allocWithZone:", a3), "initWithClass:", -[HMBModelField classObj](self, "classObj"));
  -[HMBModelField setOptional:](v4, "setOptional:", -[HMBModelField isOptional](self, "isOptional"));
  -[HMBModelField setLoggingVisibility:](v4, "setLoggingVisibility:", -[HMBModelField loggingVisibility](self, "loggingVisibility"));
  -[HMBModelField defaultValue](self, "defaultValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelField setDefaultValue:](v4, "setDefaultValue:", v5);

  -[HMBModelField readonlyVersion](self, "readonlyVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelField setReadonlyVersion:](v4, "setReadonlyVersion:", v6);

  -[HMBModelField unavailableVersion](self, "unavailableVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelField setUnavailableVersion:](v4, "setUnavailableVersion:", v7);

  -[HMBModelField externalRecordField](self, "externalRecordField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelField setExternalRecordField:](v4, "setExternalRecordField:", v8);

  -[HMBModelField setConformsToHMBModelNativeCKWrapper:](v4, "setConformsToHMBModelNativeCKWrapper:", -[HMBModelField conformsToHMBModelNativeCKWrapper](self, "conformsToHMBModelNativeCKWrapper"));
  -[HMBModelField setExcludeFromCloudStorage:](v4, "setExcludeFromCloudStorage:", -[HMBModelField excludeFromCloudStorage](self, "excludeFromCloudStorage"));
  -[HMBModelField encodeBlock](self, "encodeBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelField setEncodeBlock:](v4, "setEncodeBlock:", v9);

  -[HMBModelField decodeBlock](self, "decodeBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelField setDecodeBlock:](v4, "setDecodeBlock:", v10);

  -[HMBModelField descriptionBlock](self, "descriptionBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelField setDescriptionBlock:](v4, "setDescriptionBlock:", v11);

  return v4;
}

@end
