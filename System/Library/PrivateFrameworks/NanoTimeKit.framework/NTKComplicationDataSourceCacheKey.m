@implementation NTKComplicationDataSourceCacheKey

- (void)setNrDeviceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_nrDeviceUUID, a3);
}

- (void)setComplicationType:(unint64_t)a3
{
  self->_complicationType = a3;
}

- (void)setComplicationFamily:(int64_t)a3
{
  self->_complicationFamily = a3;
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
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_nrDeviceUUID);
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_complicationType);
  v6 = (id)objc_msgSend(v3, "appendInteger:", self->_complicationFamily);
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSUUID *nrDeviceUUID;
  uint64_t v7;
  id v8;
  id v9;
  unint64_t complicationType;
  id v11;
  id v12;
  int64_t complicationFamily;
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
  nrDeviceUUID = self->_nrDeviceUUID;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __45__NTKComplicationDataSourceCacheKey_isEqual___block_invoke;
  v21[3] = &unk_1E6BD0630;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", nrDeviceUUID, v21);
  complicationType = self->_complicationType;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __45__NTKComplicationDataSourceCacheKey_isEqual___block_invoke_2;
  v19[3] = &unk_1E6BD2438;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", complicationType, v19);
  complicationFamily = self->_complicationFamily;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __45__NTKComplicationDataSourceCacheKey_isEqual___block_invoke_3;
  v17[3] = &unk_1E6BD0380;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendInteger:counterpart:", complicationFamily, v17);
  LOBYTE(complicationFamily) = objc_msgSend(v5, "isEqual");

  return complicationFamily;
}

id __45__NTKComplicationDataSourceCacheKey_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

uint64_t __45__NTKComplicationDataSourceCacheKey_isEqual___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
}

uint64_t __45__NTKComplicationDataSourceCacheKey_isEqual___block_invoke_3(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_opt_new();
  objc_storeStrong((id *)(v4 + 8), self->_nrDeviceUUID);
  *(_QWORD *)(v4 + 16) = self->_complicationType;
  *(_QWORD *)(v4 + 24) = self->_complicationFamily;
  return (id)v4;
}

- (NSUUID)nrDeviceUUID
{
  return self->_nrDeviceUUID;
}

- (unint64_t)complicationType
{
  return self->_complicationType;
}

- (int64_t)complicationFamily
{
  return self->_complicationFamily;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nrDeviceUUID, 0);
}

@end
