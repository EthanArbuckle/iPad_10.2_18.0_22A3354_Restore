@implementation PHPTPAssetHandle

- (PHPTPAssetHandle)initWithResourceType:(int64_t)a3 orientation:(unsigned int)a4 localIdentifier:(id)a5 requiresConversion:(BOOL)a6
{
  id v10;
  PHPTPAssetHandle *v11;
  PHPTPAssetHandle *v12;
  uint64_t v13;
  NSString *localIdentifier;
  objc_super v16;

  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PHPTPAssetHandle;
  v11 = -[PHPTPAssetHandle init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_resourceType = a3;
    v13 = objc_msgSend(v10, "copy");
    localIdentifier = v12->_localIdentifier;
    v12->_localIdentifier = (NSString *)v13;

    v12->_requiresConversion = a6;
    v12->_orientation = a4;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D716C0], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendName:typeCode:value:", CFSTR("resourceType"), "q", &self->_resourceType);
  objc_msgSend(v3, "appendName:typeCode:value:", CFSTR("localIdentifier"), "@", &self->_localIdentifier);
  objc_msgSend(v3, "appendName:typeCode:value:", CFSTR("requiresConversion"), "B", &self->_requiresConversion);
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = self->_resourceType == v5[2]
      && -[NSString isEqualToString:](self->_localIdentifier, "isEqualToString:", v5[3])
      && self->_requiresConversion == *((unsigned __int8 *)v5 + 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)auxiliaryResourceFilenameMarker
{
  id v3;
  int64_t resourceType;
  NSObject *v5;
  int64_t v6;
  void *v8;
  int v9;
  int64_t v10;
  uint64_t v11;

  v3 = 0;
  v11 = *MEMORY[0x1E0C80C00];
  resourceType = self->_resourceType;
  switch(resourceType)
  {
    case 5:
    case 6:
    case 10:
      v8 = (void *)PHAuxiliaryResourceFilenameMarkerRender;
      goto LABEL_10;
    case 7:
    case 9:
    case 17:
    case 18:
      return (NSString *)v3;
    case 8:
    case 11:
    case 12:
      v8 = (void *)PHAuxiliaryResourceFilenameMarkerAdjustmentBase;
      goto LABEL_10;
    case 13:
    case 14:
    case 15:
    case 19:
    case 20:
      PLPTPGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v6 = self->_resourceType;
        v9 = 134217984;
        v10 = v6;
        _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", (uint8_t *)&v9, 0xCu);
      }

      return (NSString *)0;
    case 16:
      v8 = (void *)PHAuxiliaryResourceFilenameMarkerOriginalAdjustment;
      goto LABEL_10;
    default:
      if (resourceType != 110)
        return (NSString *)v3;
      v8 = (void *)PHAuxiliaryResourceFilenameMarkerAdjustmentSecondaryData;
LABEL_10:
      v3 = v8;
      return (NSString *)v3;
  }
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (int64_t)resourceType
{
  return self->_resourceType;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (BOOL)requiresConversion
{
  return self->_requiresConversion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end
