@implementation _LSDisplayNameConstructor

+ (id)displayNameConstructorWithContextIfNeeded:(Context *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 preferredLocalizations:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  _BOOL4 v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _LSDServiceDomain *v23;
  LSContext *v24;
  uint64_t v25;
  _LSDServiceDomain *v26;
  void *v27;
  void *v28;
  NSString *v29;
  void *v30;
  LaunchServices::CanonicalString *v31;
  uint64_t LocalizedString;
  char v33;
  void *v34;
  void *v36;
  _LSDatabase *v37;
  LaunchServices::CanonicalString **v38;
  id v41;
  int v42;
  unsigned int v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v43 = a4;
  v12 = a6;
  v13 = a7;
  v14 = v13 != 0;
  if (a4 || !objc_msgSend(v12, "isVolume"))
  {
    v15 = 0;
    v16 = 0;
    v42 = 0;
    if (!objc_msgSend(v12, "isDirectory"))
      goto LABEL_8;
  }
  else
  {
    v42 = 0;
    v15 = 1;
  }
  if ((objc_msgSend(v12, "isBusyDirectory") & 1) != 0)
    goto LABEL_62;
  v16 = 1;
  if ((v15 & 1) != 0)
  {
    v17 = 0;
    v18 = 1;
    v19 = v13;
    goto LABEL_23;
  }
LABEL_8:
  v19 = v13;
  if (!v13)
  {
    objc_msgSend(v12, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ls_preferredLocalizations");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _LSGetBRDisplayNameForContainerNode(v12, v19);
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21 || (_LSGetBRDisplayNameForSideFaultFileNode(v12), (v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v22 = 0;
    v17 = (id)v21;
    goto LABEL_54;
  }
  if (!a5)
  {
    if (!_LSDNCGetBundleClass((id *)&a3->_contextPointer, v12, v16, &v42, a8))
      goto LABEL_60;
    a5 = (const unsigned int *)&v42;
  }
  if (*a5)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v23 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v24 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a3, v23, 0);

    if (!v24)
    {
      if (!a8)
        goto LABEL_60;
      goto LABEL_66;
    }
    v25 = v43;
    if (v43)
      goto LABEL_19;
    if (!_LSFindOrFindOrRegisterBundleNode(v24, v12, (unsigned int *)a5, 0x2000000u, 0, &v43, 0))
    {
      v25 = v43;
LABEL_19:
      _LSBundleGetLocalizedName(v24->db, v25, 0, v12, v19, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      goto LABEL_22;
    }
  }
  v18 = 0;
  v17 = 0;
LABEL_22:
  v14 = 1;
  if (!(_DWORD)v16)
    goto LABEL_43;
LABEL_23:
  if (v17)
    goto LABEL_43;
  +[_LSDServiceDomain defaultServiceDomain]();
  v26 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v38 = (LaunchServices::CanonicalString **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a3, v26, 0);

  if (!v38)
  {
    if (!a8)
      goto LABEL_60;
LABEL_66:
    LaunchServices::Database::Context::error((id *)&a3->_contextPointer);
    v34 = 0;
    v17 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_55;
  }
  objc_msgSend(v12, "extensionWithError:", a8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if (!objc_msgSend(v27, "length"))
    {

      v17 = 0;
      v28 = 0;
      goto LABEL_42;
    }
    if ((v18 & 1) != 0)
    {
      v17 = 0;
LABEL_42:

LABEL_43:
      v33 = v18 ^ 1;
      if (v17)
        v33 = 1;
      if ((v33 & 1) != 0)
      {
        v22 = 0;
      }
      else
      {
        v41 = 0;
        v22 = objc_msgSend(v12, "getResourceValue:forKey:options:error:", &v41, *MEMORY[0x1E0C99C40], 1, 0);
        if ((_DWORD)v22)
          v17 = v41;
        else
          v17 = 0;

      }
      if (v17)
        goto LABEL_54;
      goto LABEL_52;
    }
    if (a5 && *a5 == 10)
    {
      objc_msgSend(v12, "nameWithError:", 0);
      v37 = (_LSDatabase *)objc_claimAutoreleasedReturnValue();
      if (!v37 || !-[_LSDatabase isEqual:](v37, "isEqual:", CFSTR("myDocuments.cannedSearch")))
        goto LABEL_39;
      if (!v14)
      {
        objc_msgSend(v12, "URL");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "ls_preferredLocalizations");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v31 = (LaunchServices::CanonicalString *)LaunchServices::CanonicalString::Find(*v38, v37, v29);
      if (v31)
      {
        LocalizedString = LaunchServices::CanonicalString::getLocalizedString(v31);
        LaunchServices::LocalizedString::localizeUnsafely(LocalizedString, *v38, v19);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        if (v17)
          goto LABEL_42;
      }
      else
      {
LABEL_39:

      }
    }
    if (objc_msgSend(v12, "canIssueIO"))
    {
      _LSBundleGetDisplayNameForNodeWithUnregisteredBundleType((void **)v38, v12, v28, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_42;
    }
    if (a8)
    {
      v44 = *MEMORY[0x1E0CB2938];
      v45[0] = CFSTR("node had unregistered bundle type but can't issue IO to localize its name");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 5, (uint64_t)"+[_LSDisplayNameConstructor(ConstructForAnyFile) displayNameConstructorWithContextIfNeeded:bundle:bundleClass:node:preferredLocalizations:error:]", 444, v36);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_60:
    v34 = 0;
    v17 = 0;
    goto LABEL_55;
  }
LABEL_62:
  v16 = 1;
LABEL_52:
  objc_msgSend(v12, "nameWithError:", a8);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v34 = 0;
    goto LABEL_55;
  }
  v22 = 1;
LABEL_54:
  v34 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContextIfNeeded:node:isDirectory:bundleClass:desiredDisplayName:treatAsFSName:", a3, v12, v16, a5, v17, v22);
LABEL_55:

  return v34;
}

- (_LSDisplayNameConstructor)initWithContextIfNeeded:(Context *)a3 node:(id)a4 isDirectory:(BOOL)a5 bundleClass:(const unsigned int *)a6 desiredDisplayName:(id)a7 treatAsFSName:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v11;
  id v15;
  id v16;
  _LSDisplayNameConstructor *v17;
  void *v19;
  void *v20;
  objc_super v21;

  v8 = a8;
  v11 = a5;
  v15 = a4;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_LSDisplayNameConstructor;
  v17 = -[_LSDisplayNameConstructor init](&v21, sel_init);
  if (v15)
  {
    if (v16)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("LSDisplayNameConstructor.mm"), 880, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayName != nil"));

    if (!v17)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("LSDisplayNameConstructor.mm"), 879, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("node != NULL"));

  if (!v16)
    goto LABEL_7;
LABEL_3:
  if (v17)
  {
LABEL_4:
    -[_LSDisplayNameConstructor initNodeBitsWithContextIfNeeded:node:isDirectory:bundleClass:](v17, "initNodeBitsWithContextIfNeeded:node:isDirectory:bundleClass:", a3, v15, v11, a6);
    -[_LSDisplayNameConstructor initContentBitsWithDisplayName:treatAsFSName:](v17, "initContentBitsWithDisplayName:treatAsFSName:", v16, v8);
    -[_LSDisplayNameConstructor initNamePartsWithDisplayName:](v17, "initNamePartsWithDisplayName:", v16);
  }
LABEL_5:

  return v17;
}

- (void)initNodeBitsWithContextIfNeeded:(Context *)a3 node:(id)a4 isDirectory:(BOOL)a5 bundleClass:(const unsigned int *)a6
{
  _BOOL4 v7;
  char v10;
  _LSDServiceDomain *v11;
  LSContext *v12;
  int v13;
  id v14;

  v7 = a5;
  v14 = a4;
  v10 = *((_BYTE *)self + 32) & 0xFE | objc_msgSend(v14, "hasHiddenExtension");
  *((_BYTE *)self + 32) = v10;
  if (v7)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v11 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v12 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a3, v11, 0);

    v10 = *((_BYTE *)self + 32) & 0xFD | (2 * (_LSNodeIsPackage(v12, v14, 0) == 0));
    *((_BYTE *)self + 32) = v10;
  }
  if (a6)
  {
    v13 = *a6;
  }
  else
  {
    v13 = _LSGetBundleClassForNode(0, v14);
    v10 = *((_BYTE *)self + 32);
  }
  *((_BYTE *)self + 32) = v10 & 0xFB | (4 * (v13 == 2));

}

- (void)initNamePartsWithDisplayName:(id)a3
{
  id v5;
  NSString *v6;
  NSString *originalName;
  uint64_t v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  void *baseName;
  NSString *v13;
  NSString *extension;
  NSString *v15;
  void *v16;
  __int128 v17;

  v5 = a3;
  v17 = xmmword_1829FAAD0;
  objc_msgSend((id)objc_opt_class(), "getExtensionRange:secondaryExtensionRange:fromFileName:considerConfusables:", &v17, 0, v5, 0);
  v6 = (NSString *)objc_msgSend(v5, "copy");
  originalName = self->_originalName;
  self->_originalName = v6;

  v8 = v17;
  if ((_QWORD)v17 == 0x7FFFFFFFFFFFFFFFLL || !*((_QWORD *)&v17 + 1))
  {
    v15 = (NSString *)objc_msgSend(v5, "copy", (_QWORD)v17);
    baseName = self->_baseName;
    self->_baseName = v15;
  }
  else
  {
    if (!(_QWORD)v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSDisplayNameConstructor.mm"), 1039, CFSTR("Path extension allegedly starts at the beginning of the display name, which is invalid."));

      v8 = v17;
    }
    objc_msgSend(v5, "substringToIndex:", v8 - 1, (_QWORD)v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSString *)objc_msgSend(v9, "copy");
    v11 = self->_baseName;
    self->_baseName = v10;

    objc_msgSend(v5, "substringFromIndex:", (_QWORD)v17);
    baseName = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (NSString *)objc_msgSend(baseName, "copy");
    extension = self->_extension;
    self->_extension = v13;

  }
}

- (void)initContentBitsWithDisplayName:(id)a3 treatAsFSName:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83___LSDisplayNameConstructor_Private__initContentBitsWithDisplayName_treatAsFSName___block_invoke;
  v4[3] = &unk_1E1043320;
  v5 = a4;
  v4[4] = self;
  _LSDNCWithInlineBuffer(a3, v4);
}

+ (void)getExtensionRange:(_NSRange *)a3 secondaryExtensionRange:(_NSRange *)a4 fromFileName:(id)a5 considerConfusables:(BOOL)a6
{
  _CFGetPathExtensionRangesFromPathComponent();
  if (a3)
  {
    a3->location = 0x7FFFFFFFFFFFFFFFLL;
    a3->length = 0;
  }
  if (a4)
  {
    a4->location = 0x7FFFFFFFFFFFFFFFLL;
    a4->length = 0;
  }
}

+ (id)concatenateBaseName:(id)a3 andExtension:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSDisplayNameConstructor.mm"), 1203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("baseName != nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSDisplayNameConstructor.mm"), 1204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extension != nil"));

LABEL_3:
  v10 = objc_msgSend(v9, "length");
  if (v10)
  {
    v11 = objc_msgSend(v7, "length");
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", v10 + v11 + 1);
    objc_msgSend(v12, "appendString:", v7);
    objc_msgSend(v12, "appendString:", CFSTR("."));
    objc_msgSend(v12, "appendString:", v9);
  }
  else
  {
    v12 = v7;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_baseName, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
}

- (BOOL)canSetExtensionHiddenWithContext:(LSContext *)a3
{
  NSString *v5;
  BOOL v6;
  id v7;
  id v8;
  LSContext *v10;
  id v11;
  char v12;
  id v13;

  if ((*((_BYTE *)self + 32) & 4) != 0)
    return 0;
  v5 = self->_extension;
  if (v5)
  {
    v10 = a3;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v6 = -[_LSDisplayNameConstructor mayHideExtensionWithContextIfNeeded:](self, "mayHideExtensionWithContextIfNeeded:", &v10);
    if (v10 && v12)
      _LSContextDestroy((void **)&v10->db);
    v7 = v11;
    v10 = 0;
    v11 = 0;

    v12 = 0;
    v8 = v13;
    v13 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)unlocalizedNameWithContextIfNeeded:(Context *)a3 asIfShowingAllExtensions:(id)a4
{
  id v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;

  v6 = a4;
  v7 = self->_baseName;
  v8 = self->_extension;
  if (!v8
    || !-[_LSDisplayNameConstructor showExtensionWithContextIfNeeded:asIfShowingAllExtensions:](self, "showExtensionWithContextIfNeeded:asIfShowingAllExtensions:", a3, v6)|| (-[_LSDisplayNameConstructor combineBaseName:extension:](self, "combineBaseName:extension:", v7, v8), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[_LSDisplayNameConstructor combineBaseName:extension:](self, "combineBaseName:extension:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = (__CFString *)objc_msgSend(v9, "copy");

  if (v10)
    v11 = v10;
  else
    v11 = CFSTR("?");
  v12 = v11;

  return v12;
}

- (id)combineBaseName:(id)a3 extension:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *v9;
  int v10;
  NSString *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  id v17;
  id v18;
  __int16 v19;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v17 = v7;
  v18 = v6;
  -[_LSDisplayNameConstructor getTransformedBaseName:extension:needsBiDiControlCharacters:](self, "getTransformedBaseName:extension:needsBiDiControlCharacters:", &v18, &v17, &v19);
  v8 = (NSString *)v18;

  v9 = (NSString *)v17;
  v10 = HIBYTE(v19);
  if (v19)
  {
    if ((_BYTE)v19)
    {
      -[_LSDisplayNameConstructor insertNameComponentBiDiControlCharacters:](self, "insertNameComponentBiDiControlCharacters:", v8);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = HIBYTE(v19);
      v8 = (NSString *)v12;
    }
    if (v10)
    {
      -[_LSDisplayNameConstructor insertNameComponentBiDiControlCharacters:](self, "insertNameComponentBiDiControlCharacters:", v9);
      v13 = objc_claimAutoreleasedReturnValue();

      v9 = (NSString *)v13;
    }
  }
  else if (v8 == self->_baseName && v9 == self->_extension)
  {
    v11 = self->_originalName;
    goto LABEL_14;
  }
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "concatenateBaseName:andExtension:", v8, v9);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v8;
  }
  v11 = v14;
  if (v19 | HIBYTE(v19))
  {
    -[_LSDisplayNameConstructor insertCompleteNameBiDiControlCharacters:](self, "insertCompleteNameBiDiControlCharacters:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (NSString *)v15;
  }
LABEL_14:

  return v11;
}

- (void)getTransformedBaseName:(id *)a3 extension:(id *)a4 needsBiDiControlCharacters:(BOOL)a5[2]
{
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  __int16 v14;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSDisplayNameConstructor.mm"), 1267, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ioExtension != NULL"));

    if (a3)
      goto LABEL_4;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSDisplayNameConstructor.mm"), 1266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ioBaseName != NULL"));

  if (!a4)
    goto LABEL_11;
LABEL_3:
  if (a3)
    goto LABEL_4;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSDisplayNameConstructor.mm"), 1268, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ioBaseName != NULL"));

LABEL_4:
  v14 = 0;
  if (*a3)
  {
    -[_LSDisplayNameConstructor transformBeforeCombining:needsBiDiControlCharacters:](self, "transformBeforeCombining:needsBiDiControlCharacters:", *a3, (char *)&v14 + 1);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (*a4)
  {
    -[_LSDisplayNameConstructor transformBeforeCombining:needsBiDiControlCharacters:](self, "transformBeforeCombining:needsBiDiControlCharacters:", *a4, &v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v14;
  }
  else
  {
    v10 = 0;
  }
  *a5 = HIBYTE(v14);
  a5[1] = v10;
}

- (id)transformBeforeCombining:(id)a3 needsBiDiControlCharacters:(BOOL *)a4
{
  NSString *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v6 = (NSString *)a3;
  v7 = v6;
  if (v6)
  {
    if ((*((_BYTE *)self + 32) & 8) != 0)
    {
      v8 = v6;
      if ((*((_BYTE *)self + 32) & 0x20) != 0)
      {
        _LSDNCBalanceBiDiControlCharacters(v6);
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
      }
      LOBYTE(v6) = -[_LSDisplayNameConstructor isStringNaturallyRTL:](self, "isStringNaturallyRTL:", v8);
    }
    else
    {
      LOBYTE(v6) = 0;
      v8 = v7;
    }
  }
  else
  {
    v8 = 0;
  }
  if (a4)
    *a4 = (char)v6;
  if (v8)
  {
    v10 = *((_BYTE *)self + 32);
    if ((v10 & 0x10) != 0)
    {
      objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("/"));
      v11 = objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v8 = 0;
        goto LABEL_17;
      }
      v10 = *((_BYTE *)self + 32);
      v8 = (void *)v11;
    }
    if ((v10 & 0x40) != 0)
    {
      _LSDNCReplaceForbiddenCharacters((NSString *)v8, 0);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
  }
LABEL_17:

  return v8;
}

- (BOOL)showExtensionWithContextIfNeeded:(Context *)a3 asIfShowingAllExtensions:(id)a4
{
  id v6;
  void *v7;
  char v8;
  _BOOL4 v9;

  v6 = a4;
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "BOOLValue");
  else
    v8 = objc_msgSend((id)objc_opt_class(), "showAllExtensions");
  if ((v8 & 1) != 0 || !-[_LSDisplayNameConstructor wantsHiddenExtension](self, "wantsHiddenExtension"))
    LOBYTE(v9) = 1;
  else
    v9 = !-[_LSDisplayNameConstructor mayHideExtensionWithContextIfNeeded:](self, "mayHideExtensionWithContextIfNeeded:", a3);

  return v9;
}

- (BOOL)wantsHiddenExtension
{
  return *((_BYTE *)self + 32) & 1;
}

- (BOOL)mayHideExtensionWithContextIfNeeded:(Context *)a3
{
  return self->_extension != 0;
}

- (BOOL)isStringNaturallyRTL:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = a3;
  v4 = v3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55___LSDisplayNameConstructor_RTL__isStringNaturallyRTL___block_invoke;
    v7[3] = &unk_1E1043370;
    v7[4] = &v8;
    _LSDNCWithCharacters(v3, v7);
    v5 = *((_BYTE *)v9 + 24) != 0;
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)unlocalizedNameWithContextIfNeeded:(Context *)a3
{
  return -[_LSDisplayNameConstructor unlocalizedNameWithContextIfNeeded:asIfShowingAllExtensions:](self, "unlocalizedNameWithContextIfNeeded:asIfShowingAllExtensions:", a3, 0);
}

+ (id)displayNameConstructorWithContextIfNeeded:(Context *)a3 node:(id)a4 error:(id *)a5
{
  objc_msgSend(a1, "displayNameConstructorWithContextIfNeeded:bundle:bundleClass:node:preferredLocalizations:error:", a3, 0, 0, a4, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)showAllExtensions
{
  return 0;
}

- (id)insertCompleteNameBiDiControlCharacters:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v3, "length") + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendCharacters:length:", &UNICHAR_LEFT_TO_RIGHT_MARK, 1);
    objc_msgSend(v5, "appendString:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)insertNameComponentBiDiControlCharacters:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    v5 = -[_LSDisplayNameConstructor isStringNaturallyRTL:](self, "isStringNaturallyRTL:", v4);
    v6 = v4;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v4, "length") + 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendCharacters:length:", &UNICHAR_FIRST_STRONG_ISOLATE, 1);
      objc_msgSend(v6, "appendString:", v4);
      objc_msgSend(v6, "appendCharacters:length:", &UNICHAR_POP_DIRECTIONAL_ISOLATE, 1);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)displayNameConstructorsWithContextIfNeeded:(Context *)a3 node:(id)a4 error:(id *)a5
{
  objc_msgSend(a1, "displayNameConstructorsWithContextIfNeeded:bundle:bundleClass:node:error:", a3, 0, 0, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)displayNameConstructorsWithContextIfNeeded:(Context *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 error:(id *)a7
{
  id v11;
  int v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  _LSDServiceDomain *v21;
  LSContext *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  _LSDatabase *v27;
  _LSDatabase *v28;
  NSString *v29;
  LaunchServices::CanonicalString *v30;
  LaunchServices::LocalizedString *LocalizedString;
  void *v32;
  NSDictionary *v33;
  objc_class *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  _BOOL4 v39;
  _BOOL4 v40;
  id v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  objc_class *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  objc_class *v53;
  Context *v54;
  const unsigned int *v55;
  char v56;
  char v57;
  id v58;
  int v59;
  unsigned int v60;
  uint64_t v61;
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  v60 = a4;
  v11 = a6;
  v12 = objc_msgSend(v11, "isVolume");
  if ((v12 & 1) != 0)
    v13 = 1;
  else
    v13 = objc_msgSend(v11, "isDirectory");
  v59 = 0;
  _LSGetBRDisplayNameForSideFaultFileNode(v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v14;

  if (v14)
  {
    v15 = v14;
    if ((v12 & 1) != 0)
    {
LABEL_12:
      v48 = (objc_class *)a1;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5)
      {
        if (!(_DWORD)v13)
          goto LABEL_49;
      }
      else
      {
        if ((_LSDNCGetBundleClass((id *)&a3->_contextPointer, v11, v13, &v59, a7) & 1) == 0)
          goto LABEL_39;
        a5 = (const unsigned int *)&v59;
        if (!(_DWORD)v13)
        {
LABEL_49:
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("LSDefaultLocalizedValue"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38 == 0;

          if (v58)
            v40 = v39;
          else
            v40 = 0;
          if (v40)
          {
            v41 = [v48 alloc];
            v42 = (void *)objc_msgSend(v41, "initWithContextIfNeeded:node:isDirectory:bundleClass:desiredDisplayName:treatAsFSName:", a3, v11, v13, a5, v58, 1);
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v42, CFSTR("LSDefaultLocalizedValue"));

          }
          v16 = (void *)objc_msgSend(v20, "copy");
          goto LABEL_55;
        }
      }
      if ((objc_msgSend(v11, "isBusyDirectory") & 1) == 0)
      {
        +[_LSDServiceDomain defaultServiceDomain]();
        v21 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
        v22 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a3, v21, 0);

        if (v22)
        {
          objc_msgSend(v11, "extensionWithError:", 0);
          v47 = (id)objc_claimAutoreleasedReturnValue();
          v23 = v60;
          if (v60
            || (_LSFindOrFindOrRegisterBundleNode(v22, v11, (unsigned int *)a5, 0x2000000u, 0, &v60, 0),
                (v23 = v60) != 0))
          {
            _LSBundleGetLocalizedNameDictionary(v22->db, v23, v11, v15);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
LABEL_47:
              v25 = v47;
              goto LABEL_48;
            }
          }
          else
          {
            v24 = 0;
          }
          v25 = v47;
          if (!v47)
            goto LABEL_48;
          if (objc_msgSend(v47, "length"))
            v26 = v12;
          else
            v26 = 1;
          if ((v26 & 1) != 0
            || !_LSBundleNodeHasUnregisteredPersonality((void **)&v22->db, v11, v47, (int *)a5))
          {
LABEL_46:
            v24 = 0;
            goto LABEL_47;
          }
          if ((objc_msgSend(v11, "canIssueIO") & 1) != 0)
          {
            if (*a5 != 10)
              goto LABEL_41;
            objc_msgSend(v11, "nameWithError:", 0);
            v27 = (_LSDatabase *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (!v27
              || !-[_LSDatabase isEqual:](v27, "isEqual:", CFSTR("myDocuments.cannedSearch"))
              || (v30 = (LaunchServices::CanonicalString *)LaunchServices::CanonicalString::Find((LaunchServices::CanonicalString *)v22->db, v28, v29)) == 0)
            {

              goto LABEL_41;
            }
            LocalizedString = (LaunchServices::LocalizedString *)LaunchServices::CanonicalString::getLocalizedString(v30);
            LaunchServices::LocalizedString::getAllUnsafeLocalizations(LocalizedString, v22->db, 0, 0, 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = v47;
            if (!v24)
            {
LABEL_41:
              if (objc_msgSend(v11, "canIssueIO"))
              {
                objc_msgSend(v11, "bundleInfoDictionaryWithError:", 0);
                v33 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
                if (v33)
                {
                  v34 = (objc_class *)objc_opt_class();
                  v35 = *MEMORY[0x1E0C9AAC8];
                  XNSDictionaryObjectForKeyOfClass(v33, (objc_object *)*MEMORY[0x1E0C9AAC8], v34);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v36)
                  {
                    objc_msgSend(v15, "stringByDeletingPathExtension");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v36, "caseInsensitiveCompare:"))
                    {
                      v24 = 0;
                    }
                    else
                    {
                      _LSBundleGetLocalizer(v22->db, 0, 0, v11);
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      v45 = v44;
                      if (v44)
                      {
                        objc_msgSend(v44, "localizedStringDictionaryWithString:defaultValue:", v35, 0);
                        v24 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        v24 = 0;
                      }

                    }
                  }
                  else
                  {
                    v24 = 0;
                  }

                }
                else
                {
                  v24 = 0;
                }

                goto LABEL_47;
              }
              goto LABEL_46;
            }
LABEL_48:
            v49[0] = MEMORY[0x1E0C809B0];
            v49[1] = 3221225472;
            v49[2] = __123___LSDisplayNameConstructor_ConstructForAnyFile__displayNameConstructorsWithContextIfNeeded_bundle_bundleClass_node_error___block_invoke;
            v49[3] = &unk_1E10432D0;
            v37 = v25;
            v56 = 1;
            v50 = v37;
            v53 = v48;
            v51 = v20;
            v54 = a3;
            v57 = v13;
            v52 = v11;
            v55 = a5;
            objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v49);

            goto LABEL_49;
          }
          if (a7)
          {
            v61 = *MEMORY[0x1E0CB2938];
            v62[0] = CFSTR("node had unregistered personality but cannot do IO to localize its name");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 5, (uint64_t)"+[_LSDisplayNameConstructor(ConstructForAnyFile) displayNameConstructorsWithContextIfNeeded:bundle:bundleClass:node:error:]", 628, v32);
            *a7 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
        else if (a7)
        {
          LaunchServices::Database::Context::error((id *)&a3->_contextPointer);
          v16 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_55;
        }
LABEL_39:
        v16 = 0;
LABEL_55:

        goto LABEL_56;
      }
      goto LABEL_49;
    }
  }
  else
  {
    if (v12)
    {
      objc_msgSend(v11, "getResourceValue:forKey:options:error:", &v58, *MEMORY[0x1E0C99C40], 1, a7);
      v15 = v58;
      if (v15)
        goto LABEL_12;
      goto LABEL_9;
    }
    objc_msgSend(v11, "nameWithError:", a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v58;
    v58 = v17;

    v15 = v17;
  }
  objc_msgSend(v15, "stringByDeletingPathExtension");
  v19 = objc_claimAutoreleasedReturnValue();

  v15 = (id)v19;
  if (v19)
    goto LABEL_12;
LABEL_9:
  v16 = 0;
LABEL_56:

  return v16;
}

- (_LSDisplayNameConstructor)init
{
  abort();
}

- (id)unlocalizedNameWithContext:(LSContext *)a3
{
  void *v3;
  BOOL v4;
  id v5;
  id v6;
  LSContext *v8;
  id v9;
  char v10;
  id v11;

  v8 = a3;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  -[_LSDisplayNameConstructor unlocalizedNameWithContextIfNeeded:asIfShowingAllExtensions:](self, "unlocalizedNameWithContextIfNeeded:asIfShowingAllExtensions:", &v8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v4 = v10 == 0;
  else
    v4 = 1;
  if (!v4)
    _LSContextDestroy((void **)&v8->db);
  v5 = v9;
  v8 = 0;
  v9 = 0;

  v10 = 0;
  v6 = v11;
  v11 = 0;

  return v3;
}

- (id)unlocalizedNameWithContext:(LSContext *)a3 asIfShowingAllExtensions:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  id v10;
  LSContext *v12;
  id v13;
  char v14;
  id v15;

  v6 = a4;
  v12 = a3;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  -[_LSDisplayNameConstructor unlocalizedNameWithContextIfNeeded:asIfShowingAllExtensions:](self, "unlocalizedNameWithContextIfNeeded:asIfShowingAllExtensions:", &v12, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v8 = v14 == 0;
  else
    v8 = 1;
  if (!v8)
    _LSContextDestroy((void **)&v12->db);
  v9 = v13;
  v12 = 0;
  v13 = 0;

  v14 = 0;
  v10 = v15;
  v15 = 0;

  return v7;
}

- (void)getUnlocalizedBaseName:(id *)a3 extension:(id *)a4 requiresAdditionalBiDiControlCharacters:(BOOL *)a5
{
  NSString *baseName;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  NSString *v22;
  __int16 v23;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSDisplayNameConstructor.mm"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outSafeExtension != NULL"));

    if (a5)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSDisplayNameConstructor.mm"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outRequiresBiDi != NULL"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSDisplayNameConstructor.mm"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outSafeBaseName != NULL"));

  if (!a4)
    goto LABEL_6;
LABEL_3:
  if (!a5)
    goto LABEL_7;
LABEL_4:
  baseName = self->_baseName;
  v11 = self->_extension;
  v23 = 0;
  v21 = v11;
  v22 = baseName;
  v12 = baseName;
  -[_LSDisplayNameConstructor getTransformedBaseName:extension:needsBiDiControlCharacters:](self, "getTransformedBaseName:extension:needsBiDiControlCharacters:", &v22, &v21, &v23);
  v13 = v22;

  v14 = v21;
  v15 = objc_retainAutorelease(v13);
  *a3 = v15;
  v16 = objc_retainAutorelease(v14);
  *a4 = v16;
  v17 = v23 | HIBYTE(v23);

  *a5 = v17 != 0;
}

+ (NSString)suffixForRemoteXCTests
{
  void *v2;

  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInXCTestRigInsecure"))
  {
    v2 = getenv("LS_SUFFIX_FOR_REMOTE_XCTESTS");
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

+ (void)setSuffixForRemoteXCTests:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInXCTestRigInsecure"))
  {
    if (v3)
      setenv("LS_SUFFIX_FOR_REMOTE_XCTESTS", (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), 1);
    else
      unsetenv("LS_SUFFIX_FOR_REMOTE_XCTESTS");
  }

}

+ (id)displayNameConstructorWithContext:(LSContext *)a3 node:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  id v12;
  LSContext *v14;
  id v15;
  char v16;
  id v17;

  v8 = a4;
  v14 = a3;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  objc_msgSend(a1, "displayNameConstructorWithContextIfNeeded:bundle:bundleClass:node:preferredLocalizations:error:", &v14, 0, 0, v8, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v10 = v16 == 0;
  else
    v10 = 1;
  if (!v10)
    _LSContextDestroy((void **)&v14->db);
  v11 = v15;
  v14 = 0;
  v15 = 0;

  v16 = 0;
  v12 = v17;
  v17 = 0;

  return v9;
}

+ (id)displayNameConstructorWithContext:(LSContext *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 preferredLocalizations:(id)a7 error:(id *)a8
{
  uint64_t v11;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  id v18;
  id v19;
  LSContext *v21;
  id v22;
  char v23;
  id v24;

  v11 = *(_QWORD *)&a4;
  v14 = a6;
  v15 = a7;
  v21 = a3;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  objc_msgSend(a1, "displayNameConstructorWithContextIfNeeded:bundle:bundleClass:node:preferredLocalizations:error:", &v21, v11, a5, v14, v15, a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    v17 = v23 == 0;
  else
    v17 = 1;
  if (!v17)
    _LSContextDestroy((void **)&v21->db);
  v18 = v22;
  v21 = 0;
  v22 = 0;

  v23 = 0;
  v19 = v24;
  v24 = 0;

  return v16;
}

+ (id)displayNameConstructorsWithContext:(LSContext *)a3 node:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  id v12;
  LSContext *v14;
  id v15;
  char v16;
  id v17;

  v8 = a4;
  v14 = a3;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  objc_msgSend(a1, "displayNameConstructorsWithContextIfNeeded:bundle:bundleClass:node:error:", &v14, 0, 0, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v10 = v16 == 0;
  else
    v10 = 1;
  if (!v10)
    _LSContextDestroy((void **)&v14->db);
  v11 = v15;
  v14 = 0;
  v15 = 0;

  v16 = 0;
  v12 = v17;
  v17 = 0;

  return v9;
}

+ (id)displayNameConstructorsWithContext:(LSContext *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 error:(id *)a7
{
  uint64_t v9;
  id v12;
  void *v13;
  BOOL v14;
  id v15;
  id v16;
  LSContext *v18;
  id v19;
  char v20;
  id v21;

  v9 = *(_QWORD *)&a4;
  v12 = a6;
  v18 = a3;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  objc_msgSend(a1, "displayNameConstructorsWithContextIfNeeded:bundle:bundleClass:node:error:", &v18, v9, a5, v12, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v14 = v20 == 0;
  else
    v14 = 1;
  if (!v14)
    _LSContextDestroy((void **)&v18->db);
  v15 = v19;
  v18 = 0;
  v19 = 0;

  v20 = 0;
  v16 = v21;
  v21 = 0;

  return v13;
}

+ (unsigned)prepareMimicWithPopulator:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  _QWORD v11[3];

  v5 = a3;
  if (_LSPrepareMimicForBundleLookup(v5, (uint64_t)a4))
  {
    v11[0] = sel_isBusyDirectory;
    v11[1] = sel_hasHiddenExtension;
    v11[2] = sel_isSideFault;
    v6 = v5;
    v7 = 0;
    LOBYTE(v8) = 1;
    do
    {
      while (!(_BYTE)v8)
      {
        if (++v7 == 3)
        {

          goto LABEL_11;
        }
        LOBYTE(v8) = 0;
      }
      v8 = objc_msgSend(v6, "populateSimpleSelector:error:", v11[v7++], a4);
    }
    while (v7 != 3);

    if (v8)
    {
      v9 = objc_msgSend(v6, "populateValueForKey:error:", *MEMORY[0x1E0C99C40], a4);
      goto LABEL_12;
    }
  }
LABEL_11:
  v9 = 0;
LABEL_12:

  return v9;
}

- (id)cleanSecondaryExtension:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  if (-[_LSDisplayNameConstructor(Private) cleanSecondaryExtension:]::once != -1)
    dispatch_once(&-[_LSDisplayNameConstructor(Private) cleanSecondaryExtension:]::once, &__block_literal_global_29);
  v4 = v3;
  if (objc_msgSend(v3, "rangeOfCharacterFromSet:", -[_LSDisplayNameConstructor(Private) cleanSecondaryExtension:]::nonExtensionCharacters) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__20;
    v11 = __Block_byref_object_dispose__20;
    v12 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62___LSDisplayNameConstructor_Private__cleanSecondaryExtension___block_invoke_2;
    v6[3] = &unk_1E1043348;
    v6[4] = &v7;
    _LSDNCWithInlineBuffer(v3, v6);
    v4 = (id)v8[5];

    _Block_object_dispose(&v7, 8);
  }

  return v4;
}

@end
