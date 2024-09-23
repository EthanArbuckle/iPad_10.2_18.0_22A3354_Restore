@implementation _NTKComplicationCacheKey

+ (id)keyWithVariant:(id)a3 complication:(id)a4 forDevice:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init((Class)a1);
  v12 = (void *)v11[1];
  v11[1] = v8;
  v13 = v8;

  v14 = (void *)v11[2];
  v11[2] = v9;
  v15 = v9;

  objc_msgSend(v10, "nrDeviceUUID");
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = (void *)v11[3];
  v11[3] = v16;

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_variant);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_complication);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_deviceUUID);
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NTKComplicationVariant *variant;
  uint64_t v7;
  id v8;
  id v9;
  NTKComplication *complication;
  id v11;
  id v12;
  NSUUID *deviceUUID;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  variant = self->_variant;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __36___NTKComplicationCacheKey_isEqual___block_invoke;
  v21[3] = &unk_1E6BD0630;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", variant, v21);
  complication = self->_complication;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __36___NTKComplicationCacheKey_isEqual___block_invoke_2;
  v19[3] = &unk_1E6BD0630;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", complication, v19);
  deviceUUID = self->_deviceUUID;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __36___NTKComplicationCacheKey_isEqual___block_invoke_3;
  v17[3] = &unk_1E6BD0630;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendObject:counterpart:", deviceUUID, v17);
  LOBYTE(deviceUUID) = objc_msgSend(v5, "isEqual");

  return (char)deviceUUID;
}

- (NTKComplication)complication
{
  return (NTKComplication *)objc_getProperty(self, a2, 16, 1);
}

- (NTKComplicationVariant)variant
{
  return (NTKComplicationVariant *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)deviceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_complication, 0);
  objc_storeStrong((id *)&self->_variant, 0);
}

@end
