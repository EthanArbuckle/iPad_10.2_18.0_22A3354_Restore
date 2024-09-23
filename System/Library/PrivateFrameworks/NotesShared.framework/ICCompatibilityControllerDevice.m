@implementation ICCompatibilityControllerDevice

- (ICCompatibilityControllerDevice)initWithNotesVersion:(int64_t)a3 maximumNotesVersion:(int64_t)a4 name:(id)a5
{
  id v9;
  ICCompatibilityControllerDevice *v10;
  ICCompatibilityControllerDevice *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ICCompatibilityControllerDevice;
  v10 = -[ICCompatibilityControllerDevice init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_notesVersion = a3;
    v10->_maximumNotesVersion = a4;
    objc_storeStrong((id *)&v10->_name, a5);
  }

  return v11;
}

- (ICCompatibilityControllerDevice)initWithMigrationDeviceInfo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  ICCompatibilityControllerDevice *v9;
  _QWORD v11[3];

  v4 = a3;
  if ((objc_msgSend(v4, "isIOSDevice") & 1) != 0 || objc_msgSend(v4, "isOSXDevice"))
  {
    v5 = objc_msgSend((id)objc_opt_class(), "notesVersionForDeviceInfo:", v4);
    v6 = (void *)objc_opt_class();
    if (v4)
      objc_msgSend(v4, "hardwareInfo");
    else
      memset(v11, 0, sizeof(v11));
    v7 = objc_msgSend(v6, "maximumNotesVersionForHardwareInfo:", v11);
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ICCompatibilityControllerDevice initWithNotesVersion:maximumNotesVersion:name:](self, "initWithNotesVersion:maximumNotesVersion:name:", v5, v7, v8);

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  __CFString *v7;
  int64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICCompatibilityControllerDevice notesVersion](self, "notesVersion");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = CFSTR("—");
  }
  else
  {
    -[ICCompatibilityControllerDevice notesVersion](self, "notesVersion");
    NSStringFromNotesVersion();
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[ICCompatibilityControllerDevice maximumNotesVersion](self, "maximumNotesVersion");
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = CFSTR("—");
  }
  else
  {
    -[ICCompatibilityControllerDevice maximumNotesVersion](self, "maximumNotesVersion");
    NSStringFromNotesVersion();
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[ICCompatibilityControllerDevice name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, notesVersion: %@, maximumNotesVersion: %@, name: %@>"), v5, self, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;

  if (a3 == self)
    return 1;
  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "notesVersion");
  if (v6 == -[ICCompatibilityControllerDevice notesVersion](self, "notesVersion")
    && (v7 = objc_msgSend(v5, "maximumNotesVersion"),
        v7 == -[ICCompatibilityControllerDevice maximumNotesVersion](self, "maximumNotesVersion")))
  {
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCompatibilityControllerDevice name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ICCompatibilityControllerDevice notesVersion](self, "notesVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ICCompatibilityControllerDevice maximumNotesVersion](self, "maximumNotesVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[ICCompatibilityControllerDevice name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hash");
  v15 = ICHashWithHashKeys(v4, v8, v9, v10, v11, v12, v13, v14, v6);

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICCompatibilityControllerDevice)initWithCoder:(id)a3
{
  id v4;
  ICCompatibilityControllerDevice *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCompatibilityControllerDevice;
  v5 = -[ICCompatibilityControllerDevice init](&v9, sel_init);
  if (v5)
  {
    v5->_notesVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("notesVersion"));
    v5->_maximumNotesVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumNotesVersion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ICCompatibilityControllerDevice notesVersion](self, "notesVersion"), CFSTR("notesVersion"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[ICCompatibilityControllerDevice maximumNotesVersion](self, "maximumNotesVersion"), CFSTR("maximumNotesVersion"));
  -[ICCompatibilityControllerDevice name](self, "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

}

- (BOOL)isUpgraded
{
  int64_t v2;

  v2 = -[ICCompatibilityControllerDevice notesVersion](self, "notesVersion");
  return v2 >= +[ICCloudSyncingObject currentNotesVersion](ICCloudSyncingObject, "currentNotesVersion");
}

- (BOOL)isUpgradable
{
  int64_t v2;

  v2 = -[ICCompatibilityControllerDevice maximumNotesVersion](self, "maximumNotesVersion");
  return v2 >= +[ICCloudSyncingObject currentNotesVersion](ICCloudSyncingObject, "currentNotesVersion");
}

+ (int64_t)notesVersionForDeviceInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  int64_t v10;
  void *v11;
  void *v12;
  int v13;

  v3 = a3;
  objc_msgSend(v3, "softwareVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("osx"));

  if (!v6)
  {
LABEL_13:
    objc_msgSend(v3, "softwareVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("ios"));

    if (!v9)
    {
LABEL_35:
      objc_msgSend(v3, "softwareVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("visionos"));

      if (!v13 || (objc_msgSend(v3, "upgradedToMajor:minor:", 1, 0) & 1) == 0)
      {
        v10 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_39;
      }
      goto LABEL_37;
    }
    if ((objc_msgSend(v3, "upgradedToMajor:minor:", 17, 0) & 1) == 0)
    {
      if ((objc_msgSend(v3, "upgradedToMajor:minor:", 16, 0) & 1) != 0)
        goto LABEL_16;
      if ((objc_msgSend(v3, "upgradedToMajor:minor:", 15, 4) & 1) != 0)
      {
LABEL_18:
        v10 = 8;
        goto LABEL_39;
      }
      if ((objc_msgSend(v3, "upgradedToMajor:minor:", 15, 0) & 1) != 0)
      {
LABEL_20:
        v10 = 7;
        goto LABEL_39;
      }
      if ((objc_msgSend(v3, "upgradedToMajor:minor:", 14, 5) & 1) != 0)
      {
LABEL_22:
        v10 = 6;
        goto LABEL_39;
      }
      if ((objc_msgSend(v3, "upgradedToMajor:minor:", 14, 0) & 1) != 0)
      {
LABEL_24:
        v10 = 5;
        goto LABEL_39;
      }
      if ((objc_msgSend(v3, "upgradedToMajor:minor:", 13, 0) & 1) != 0)
      {
LABEL_26:
        v10 = 4;
        goto LABEL_39;
      }
      if ((objc_msgSend(v3, "upgradedToMajor:minor:", 12, 0) & 1) != 0)
      {
LABEL_28:
        v10 = 3;
        goto LABEL_39;
      }
      if ((objc_msgSend(v3, "upgradedToMajor:minor:", 11, 0) & 1) != 0)
      {
LABEL_30:
        v10 = 2;
        goto LABEL_39;
      }
      if ((objc_msgSend(v3, "upgradedToMajor:minor:", 10, 0) & 1) != 0)
      {
LABEL_32:
        v10 = 1;
        goto LABEL_39;
      }
      if ((objc_msgSend(v3, "upgradedToMajor:minor:", 9, 0) & 1) != 0)
      {
LABEL_34:
        v10 = 0;
        goto LABEL_39;
      }
      goto LABEL_35;
    }
LABEL_37:
    v10 = 13;
    goto LABEL_39;
  }
  if ((objc_msgSend(v3, "upgradedToMajor:minor:", 14, 0) & 1) != 0)
    goto LABEL_37;
  if ((objc_msgSend(v3, "upgradedToMajor:minor:", 13, 0) & 1) == 0)
  {
    if ((objc_msgSend(v3, "upgradedToMajor:minor:", 12, 3) & 1) != 0)
      goto LABEL_18;
    if ((objc_msgSend(v3, "upgradedToMajor:minor:", 12, 0) & 1) != 0)
      goto LABEL_20;
    if ((objc_msgSend(v3, "upgradedToMajor:minor:", 11, 3) & 1) != 0)
      goto LABEL_22;
    if ((objc_msgSend(v3, "upgradedToMajor:minor:", 11, 0) & 1) != 0)
      goto LABEL_24;
    if ((objc_msgSend(v3, "upgradedToMajor:minor:", 10, 15) & 1) != 0)
      goto LABEL_26;
    if ((objc_msgSend(v3, "upgradedToMajor:minor:", 10, 14) & 1) != 0)
      goto LABEL_28;
    if ((objc_msgSend(v3, "upgradedToMajor:minor:", 10, 13) & 1) != 0)
      goto LABEL_30;
    if ((objc_msgSend(v3, "upgradedToMajor:minor:", 10, 12) & 1) != 0)
      goto LABEL_32;
    if ((objc_msgSend(v3, "upgradedToMajor:minor:", 10, 11) & 1) != 0)
      goto LABEL_34;
    goto LABEL_13;
  }
LABEL_16:
  v10 = 9;
LABEL_39:

  return v10;
}

+ (int64_t)maximumNotesVersionForHardwareInfo:(ICDeviceHardwareInfo *)a3
{
  int64_t result;
  unint64_t v4;
  _QWORD *v5;
  BOOL v6;
  int64_t v7;
  int64_t v8;

  switch(a3->modelName)
  {
    case 0uLL:
    case 0xCuLL:
    case 0xDuLL:
      return 0x7FFFFFFFFFFFFFFFLL;
    case 1uLL:
      result = -1;
      switch(a3->version)
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
          return result;
        case 9:
          goto LABEL_24;
        case 0xALL:
        case 0xBLL:
        case 0xCLL:
          goto LABEL_12;
        case 0xDLL:
          goto LABEL_26;
        case 0xELL:
          v6 = (unint64_t)(a3->subVersion - 1) >= 3;
          v7 = 6;
          v8 = 4;
          goto LABEL_30;
        case 0xFLL:
          result = 6;
          break;
        case 0x10:
        case 0x11:
          goto LABEL_23;
        case 0x12:
          goto LABEL_25;
        default:
          goto LABEL_21;
      }
      return result;
    case 2uLL:
      goto LABEL_21;
    case 3uLL:
    case 5uLL:
      v4 = a3->version - 1;
      if (v4 >= 7)
        goto LABEL_21;
      v5 = &unk_1BDC15F28;
      goto LABEL_19;
    case 4uLL:
      v4 = a3->version - 1;
      if (v4 >= 6)
        goto LABEL_21;
      v5 = &unk_1BDC15EF8;
      goto LABEL_19;
    case 6uLL:
      v4 = a3->version - 1;
      if (v4 >= 0xA)
        goto LABEL_21;
      v5 = &unk_1BDC15F60;
      goto LABEL_19;
    case 7uLL:
      result = -1;
      switch(a3->version)
      {
        case 1:
        case 2:
          return result;
        case 3:
        case 4:
        case 5:
          goto LABEL_24;
        case 6:
        case 7:
        case 8:
LABEL_12:
          result = 2;
          break;
        case 9:
        case 0xALL:
LABEL_26:
          result = 4;
          break;
        case 0xBLL:
          v6 = (unint64_t)(a3->subVersion - 1) >= 3;
          v7 = 8;
          v8 = 6;
LABEL_30:
          if (v6)
            result = v7;
          else
            result = v8;
          break;
        case 0xCLL:
        case 0xDLL:
          goto LABEL_23;
        case 0xELL:
          goto LABEL_25;
        default:
          goto LABEL_21;
      }
      return result;
    case 8uLL:
      v4 = a3->version - 1;
      if (v4 >= 7)
        goto LABEL_21;
      v5 = &unk_1BDC15FB0;
      goto LABEL_19;
    case 9uLL:
      v4 = a3->version - 1;
      if (v4 < 7)
      {
        v5 = &unk_1BDC15FE8;
        goto LABEL_19;
      }
LABEL_23:
      result = 8;
      break;
    case 0xAuLL:
      v4 = a3->version - 1;
      if (v4 >= 0xA)
      {
LABEL_21:
        result = +[ICCloudSyncingObject currentNotesVersion](ICCloudSyncingObject, "currentNotesVersion");
      }
      else
      {
        v5 = &unk_1BDC16020;
LABEL_19:
        result = v5[v4];
      }
      break;
    case 0xBuLL:
      result = -1;
      switch(a3->version)
      {
        case 1:
          return result;
        case 2:
LABEL_24:
          result = 0;
          break;
        case 3:
          result = (unint64_t)(a3->subVersion - 4) < 0xFFFFFFFFFFFFFFFDLL;
          break;
        case 4:
          result = 3;
          break;
        case 5:
          goto LABEL_23;
        case 6:
LABEL_25:
          result = 12;
          break;
        default:
          goto LABEL_21;
      }
      return result;
    default:
      return 13;
  }
  return result;
}

- (int64_t)notesVersion
{
  return self->_notesVersion;
}

- (void)setNotesVersion:(int64_t)a3
{
  self->_notesVersion = a3;
}

- (int64_t)maximumNotesVersion
{
  return self->_maximumNotesVersion;
}

- (void)setMaximumNotesVersion:(int64_t)a3
{
  self->_maximumNotesVersion = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
