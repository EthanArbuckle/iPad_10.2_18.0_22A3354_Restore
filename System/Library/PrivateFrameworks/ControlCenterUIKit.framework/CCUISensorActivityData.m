@implementation CCUISensorActivityData

- (void)setUsedRecently:(BOOL)a3
{
  self->_usedRecently = a3;
}

- (void)setSensorType:(unint64_t)a3
{
  self->_sensorType = a3;
}

- (void)setWebsite:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setIsSystemService:(BOOL)a3
{
  self->_isSystemService = a3;
}

- (void)setExecutableDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setAttributionGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

uint64_t __34__CCUISensorActivityData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sensorType");
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CCUISensorActivityData bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUISensorActivityData displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUISensorActivityData executableDisplayName](self, "executableDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUISensorActivityData attributionGroup](self, "attributionGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUISensorActivityData website](self, "website");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CCUISensorActivityData usedRecently](self, "usedRecently");
  v10 = CFSTR("NO");
  if (v9)
    v10 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("bundle:%@ display:%@ executableDisplayName:%@ attributionGroup:%@ domain:%@ recently:%@"), v4, v5, v6, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CCUISensorActivityData *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  CCUISensorActivityData *v8;
  id v9;
  void *v10;
  CCUISensorActivityData *v11;
  id v12;
  void *v13;
  CCUISensorActivityData *v14;
  id v15;
  void *v16;
  CCUISensorActivityData *v17;
  id v18;
  void *v19;
  CCUISensorActivityData *v20;
  id v21;
  void *v22;
  CCUISensorActivityData *v23;
  id v24;
  _BOOL8 v25;
  CCUISensorActivityData *v26;
  id v27;
  _BOOL8 v28;
  id v29;
  char v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  void *v35;
  CCUISensorActivityData *v36;
  _QWORD v37[4];
  CCUISensorActivityData *v38;
  _QWORD v39[4];
  CCUISensorActivityData *v40;
  _QWORD v41[4];
  CCUISensorActivityData *v42;
  _QWORD v43[4];
  CCUISensorActivityData *v44;
  _QWORD v45[4];
  CCUISensorActivityData *v46;
  _QWORD v47[4];
  CCUISensorActivityData *v48;
  _QWORD v49[4];
  CCUISensorActivityData *v50;

  v4 = (CCUISensorActivityData *)a3;
  if (self == v4)
  {
    v30 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CCUISensorActivityData sensorType](self, "sensorType");
    v7 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __34__CCUISensorActivityData_isEqual___block_invoke;
    v49[3] = &unk_1E8E20908;
    v8 = v4;
    v50 = v8;
    v9 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v6, v49);
    -[CCUISensorActivityData displayName](self, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v7;
    v47[1] = 3221225472;
    v47[2] = __34__CCUISensorActivityData_isEqual___block_invoke_2;
    v47[3] = &unk_1E8E20930;
    v11 = v8;
    v48 = v11;
    v12 = (id)objc_msgSend(v5, "appendString:counterpart:", v10, v47);

    -[CCUISensorActivityData executableDisplayName](self, "executableDisplayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v7;
    v45[1] = 3221225472;
    v45[2] = __34__CCUISensorActivityData_isEqual___block_invoke_3;
    v45[3] = &unk_1E8E20930;
    v14 = v11;
    v46 = v14;
    v15 = (id)objc_msgSend(v5, "appendString:counterpart:", v13, v45);

    -[CCUISensorActivityData bundleIdentifier](self, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v7;
    v43[1] = 3221225472;
    v43[2] = __34__CCUISensorActivityData_isEqual___block_invoke_4;
    v43[3] = &unk_1E8E20930;
    v17 = v14;
    v44 = v17;
    v18 = (id)objc_msgSend(v5, "appendString:counterpart:", v16, v43);

    -[CCUISensorActivityData attributionGroup](self, "attributionGroup");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v7;
    v41[1] = 3221225472;
    v41[2] = __34__CCUISensorActivityData_isEqual___block_invoke_5;
    v41[3] = &unk_1E8E20930;
    v20 = v17;
    v42 = v20;
    v21 = (id)objc_msgSend(v5, "appendString:counterpart:", v19, v41);

    -[CCUISensorActivityData website](self, "website");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v7;
    v39[1] = 3221225472;
    v39[2] = __34__CCUISensorActivityData_isEqual___block_invoke_6;
    v39[3] = &unk_1E8E20930;
    v23 = v20;
    v40 = v23;
    v24 = (id)objc_msgSend(v5, "appendString:counterpart:", v22, v39);

    v25 = -[CCUISensorActivityData isSystemService](self, "isSystemService");
    v37[0] = v7;
    v37[1] = 3221225472;
    v37[2] = __34__CCUISensorActivityData_isEqual___block_invoke_7;
    v37[3] = &unk_1E8E20958;
    v26 = v23;
    v38 = v26;
    v27 = (id)objc_msgSend(v5, "appendBool:counterpart:", v25, v37);
    v28 = -[CCUISensorActivityData usedRecently](self, "usedRecently");
    v32 = v7;
    v33 = 3221225472;
    v34 = __34__CCUISensorActivityData_isEqual___block_invoke_8;
    v35 = &unk_1E8E20958;
    v36 = v26;
    v29 = (id)objc_msgSend(v5, "appendBool:counterpart:", v28, &v32);
    v30 = objc_msgSend(v5, "isEqual", v32, v33, v34, v35);

  }
  return v30;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[CCUISensorActivityData sensorType](self, "sensorType"));
  -[CCUISensorActivityData displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:", v5);

  -[CCUISensorActivityData executableDisplayName](self, "executableDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:", v7);

  -[CCUISensorActivityData bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:", v9);

  -[CCUISensorActivityData attributionGroup](self, "attributionGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:", v11);

  -[CCUISensorActivityData website](self, "website");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendObject:", v13);

  v15 = (id)objc_msgSend(v3, "appendBool:", -[CCUISensorActivityData isSystemService](self, "isSystemService"));
  v16 = (id)objc_msgSend(v3, "appendBool:", -[CCUISensorActivityData usedRecently](self, "usedRecently"));
  v17 = objc_msgSend(v3, "hash");

  return v17;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)executableDisplayName
{
  return self->_executableDisplayName;
}

- (NSString)attributionGroup
{
  return self->_attributionGroup;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)usedRecently
{
  return self->_usedRecently;
}

- (NSString)website
{
  return self->_website;
}

- (unint64_t)sensorType
{
  return self->_sensorType;
}

- (BOOL)isSystemService
{
  return self->_isSystemService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensorIndicatorColor, 0);
  objc_storeStrong((id *)&self->_website, 0);
  objc_storeStrong((id *)&self->_attributionGroup, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_executableDisplayName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

uint64_t __34__CCUISensorActivityData_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayName");
}

+ (id)_genericLocationSystemServiceActivity
{
  CCUISensorActivityData *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(CCUISensorActivityData);
  +[CCUISensorAttributionEntity genericLocationSystemServiceEntity](CCUISensorAttributionEntity, "genericLocationSystemServiceEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUISensorActivityData setSensorType:](v2, "setSensorType:", 2);
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUISensorActivityData setBundleIdentifier:](v2, "setBundleIdentifier:", v4);

  -[CCUISensorActivityData setIsSystemService:](v2, "setIsSystemService:", 1);
  return v2;
}

uint64_t __34__CCUISensorActivityData_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "executableDisplayName");
}

uint64_t __34__CCUISensorActivityData_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
}

uint64_t __34__CCUISensorActivityData_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "attributionGroup");
}

uint64_t __34__CCUISensorActivityData_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "website");
}

uint64_t __34__CCUISensorActivityData_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isSystemService");
}

uint64_t __34__CCUISensorActivityData_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "usedRecently");
}

- (UIColor)sensorIndicatorColor
{
  return self->_sensorIndicatorColor;
}

- (void)setSensorIndicatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_sensorIndicatorColor, a3);
}

- (BOOL)launchToSettings
{
  return self->_launchToSettings;
}

- (void)setLaunchToSettings:(BOOL)a3
{
  self->_launchToSettings = a3;
}

@end
