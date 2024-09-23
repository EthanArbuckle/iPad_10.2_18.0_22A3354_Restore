@implementation CRKClassroomInstallation

+ (CRKClassroomInstallation)iOSInstallation
{
  return (CRKClassroomInstallation *)objc_msgSend(a1, "installationWithClassroomBundleIdentifier:bundleHasContentsFolder:instructordBundleIdentifier:", CFSTR("com.apple.classroom"), 0, CFSTR("com.apple.classroom.instructord"));
}

+ (CRKClassroomInstallation)macOSInstallation
{
  return (CRKClassroomInstallation *)objc_msgSend(a1, "installationWithClassroomBundleIdentifier:bundleHasContentsFolder:instructordBundleIdentifier:", CFSTR("com.apple.macos.classroom"), 1, CFSTR("com.apple.macos.classroom.instructord"));
}

+ (CRKClassroomInstallation)installationWithClassroomBundleIdentifier:(id)a3 bundleHasContentsFolder:(BOOL)a4 instructordBundleIdentifier:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v8, 0, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (!v10)
  {
    if (_CRKLogGeneral_onceToken_42 != -1)
      dispatch_once(&_CRKLogGeneral_onceToken_42, &__block_literal_global_117);
    v12 = (void *)_CRKLogGeneral_logObj_42;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_42, OS_LOG_TYPE_ERROR))
      +[CRKClassroomInstallation installationWithClassroomBundleIdentifier:bundleHasContentsFolder:instructordBundleIdentifier:].cold.1((uint64_t)v8, v12, v11);
  }
  objc_msgSend(v10, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(a1, "instructorKitImagePathInBundle:hasContentsFolder:", v13, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClassroomURL:classroomBundleIdentifier:instructorKitImagePath:instructordBundleIdentifier:", v13, v8, v14, v9);

  }
  else
  {
    v15 = 0;
  }

  return (CRKClassroomInstallation *)v15;
}

+ (CRKClassroomInstallation)preferredInstallation
{
  if (CRKIsiOS())
    objc_msgSend(a1, "iOSInstallation");
  else
    objc_msgSend(a1, "macOSInstallation");
  return (CRKClassroomInstallation *)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)anyInstallationExists
{
  void *v2;
  BOOL v3;

  objc_msgSend(a1, "preferredInstallation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CRKClassroomInstallation)initWithClassroomURL:(id)a3 classroomBundleIdentifier:(id)a4 instructorKitImagePath:(id)a5 instructordBundleIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CRKClassroomInstallation *v15;
  CRKClassroomInstallation *v16;
  uint64_t v17;
  NSString *classroomBundleIdentifier;
  uint64_t v19;
  NSString *instructorKitImagePath;
  uint64_t v21;
  NSString *instructordBundleIdentifier;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CRKClassroomInstallation;
  v15 = -[CRKClassroomInstallation init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_classroomURL, a3);
    v17 = objc_msgSend(v12, "copy");
    classroomBundleIdentifier = v16->_classroomBundleIdentifier;
    v16->_classroomBundleIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    instructorKitImagePath = v16->_instructorKitImagePath;
    v16->_instructorKitImagePath = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    instructordBundleIdentifier = v16->_instructordBundleIdentifier;
    v16->_instructordBundleIdentifier = (NSString *)v21;

  }
  return v16;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKClassroomInstallation classroomURL](self, "classroomURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassroomInstallation classroomBundleIdentifier](self, "classroomBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassroomInstallation instructorKitImagePath](self, "instructorKitImagePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassroomInstallation instructordBundleIdentifier](self, "instructordBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { classroomURL = %@,                                                   classroomBundleIdentifier = %@,                                                   instructorKitImagePath = %@,                                                   instructordBundleIdentifier = %@ }>"), v4, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)instructorKitImagePathInBundle:(id)a3 hasContentsFolder:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v7);
  if (v4)
    objc_msgSend(v6, "addObject:", CFSTR("Contents"));
  objc_msgSend(v6, "addObject:", CFSTR("Frameworks"));
  objc_msgSend(v6, "addObject:", CFSTR("InstructorKit.framework"));
  objc_msgSend(v6, "addObject:", CFSTR("InstructorKit"));
  objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSURL)classroomURL
{
  return self->_classroomURL;
}

- (NSString)classroomBundleIdentifier
{
  return self->_classroomBundleIdentifier;
}

- (NSString)instructorKitImagePath
{
  return self->_instructorKitImagePath;
}

- (NSString)instructordBundleIdentifier
{
  return self->_instructordBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructordBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_instructorKitImagePath, 0);
  objc_storeStrong((id *)&self->_classroomBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_classroomURL, 0);
}

+ (void)installationWithClassroomBundleIdentifier:(uint64_t)a1 bundleHasContentsFolder:(void *)a2 instructordBundleIdentifier:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "verboseDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_218C99000, v5, OS_LOG_TYPE_ERROR, "Failed to fetch bundle record for %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
