@implementation CHUISWatchComplicationsWidgetSnapshotMetadata

- (id)_initWithSnapshotMetadata:(id)a3
{
  id *v4;
  CHUISWatchComplicationsWidgetSnapshotMetadata *v5;
  id *p_isa;
  objc_super v8;

  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CHUISWatchComplicationsWidgetSnapshotMetadata;
  v5 = -[CHUISWatchComplicationsWidgetSnapshotMetadata init](&v8, sel_init);
  p_isa = (id *)&v5->super.isa;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_labelData, v4[1]);
    objc_storeStrong(p_isa + 2, v4[2]);
    objc_storeStrong(p_isa + 3, v4[3]);
    objc_storeStrong(p_isa + 4, v4[4]);
    objc_storeStrong(p_isa + 5, v4[5]);
    objc_storeStrong(p_isa + 6, v4[6]);
  }

  return p_isa;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  NSArray *labelData;
  uint64_t v11;
  id v12;
  id v13;
  CHSGaugeParameters *gauge;
  id v15;
  id v16;
  NSData *gaugeProviderData;
  id v18;
  id v19;
  NSArray *gaugeMinimumLabelData;
  id v21;
  id v22;
  NSArray *gaugeMaximumLabelData;
  id v24;
  id v25;
  NSArray *outerLabelData;
  id v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v4;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  labelData = self->_labelData;
  v11 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke;
  v43[3] = &unk_1E6B84B68;
  v12 = v9;
  v44 = v12;
  v13 = (id)objc_msgSend(v5, "appendObject:counterpart:", labelData, v43);
  gauge = self->_gauge;
  v41[0] = v11;
  v41[1] = 3221225472;
  v41[2] = __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_2;
  v41[3] = &unk_1E6B84B90;
  v15 = v12;
  v42 = v15;
  v16 = (id)objc_msgSend(v5, "appendObject:counterpart:", gauge, v41);
  gaugeProviderData = self->_gaugeProviderData;
  v39[0] = v11;
  v39[1] = 3221225472;
  v39[2] = __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_3;
  v39[3] = &unk_1E6B84BB8;
  v18 = v15;
  v40 = v18;
  v19 = (id)objc_msgSend(v5, "appendObject:counterpart:", gaugeProviderData, v39);
  gaugeMinimumLabelData = self->_gaugeMinimumLabelData;
  v37[0] = v11;
  v37[1] = 3221225472;
  v37[2] = __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_4;
  v37[3] = &unk_1E6B84B68;
  v21 = v18;
  v38 = v21;
  v22 = (id)objc_msgSend(v5, "appendObject:counterpart:", gaugeMinimumLabelData, v37);
  gaugeMaximumLabelData = self->_gaugeMaximumLabelData;
  v35[0] = v11;
  v35[1] = 3221225472;
  v35[2] = __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_5;
  v35[3] = &unk_1E6B84B68;
  v24 = v21;
  v36 = v24;
  v25 = (id)objc_msgSend(v5, "appendObject:counterpart:", gaugeMaximumLabelData, v35);
  outerLabelData = self->_outerLabelData;
  v30 = v11;
  v31 = 3221225472;
  v32 = __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_6;
  v33 = &unk_1E6B84B68;
  v27 = v24;
  v34 = v27;
  v28 = (id)objc_msgSend(v5, "appendObject:counterpart:", outerLabelData, &v30);
  LOBYTE(v24) = objc_msgSend(v5, "isEqual", v30, v31, v32, v33);

  return (char)v24;
}

uint64_t __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "labelData");
}

uint64_t __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "gauge");
}

uint64_t __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "gaugeProviderData");
}

uint64_t __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "gaugeMinimumLabelData");
}

uint64_t __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "gaugeMaximumLabelData");
}

uint64_t __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "outerLabelData");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_labelData);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_gauge);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_gaugeProviderData);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_gaugeMinimumLabelData);
  v8 = (id)objc_msgSend(v3, "appendObject:", self->_gaugeMaximumLabelData);
  v9 = (id)objc_msgSend(v3, "appendObject:", self->_outerLabelData);
  v10 = objc_msgSend(v3, "hash");

  return v10;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_labelData, CFSTR("labelData"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_gauge, CFSTR("gauge"), 1);
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_gaugeProviderData, CFSTR("gaugeProviderData"), 1);
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_gaugeMinimumLabelData, CFSTR("gaugeMinimumLabelData"), 1);
  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_gaugeMaximumLabelData, CFSTR("gaugeMaximumLabelData"), 1);
  v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_outerLabelData, CFSTR("outerLabelData"), 1);
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeCollection:forKey:", self->_labelData, CFSTR("labelData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_gauge, CFSTR("gauge"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_gaugeProviderData, CFSTR("gaugeProviderData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_gaugeMinimumLabelData, CFSTR("gaugeMinimumLabelData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_gaugeMaximumLabelData, CFSTR("gaugeMaximumLabelData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_outerLabelData, CFSTR("outerLabelData"));

}

- (CHUISWatchComplicationsWidgetSnapshotMetadata)initWithBSXPCCoder:(id)a3
{
  id v4;
  CHUISWatchComplicationsWidgetSnapshotMetadata *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *labelData;
  uint64_t v9;
  CHSGaugeParameters *gauge;
  uint64_t v11;
  NSData *gaugeProviderData;
  uint64_t v13;
  uint64_t v14;
  NSArray *gaugeMinimumLabelData;
  uint64_t v16;
  uint64_t v17;
  NSArray *gaugeMaximumLabelData;
  uint64_t v19;
  uint64_t v20;
  NSArray *outerLabelData;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CHUISWatchComplicationsWidgetSnapshotMetadata;
  v5 = -[CHUISWatchComplicationsWidgetSnapshotMetadata init](&v23, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_opt_class(), CFSTR("labelData"));
    v7 = objc_claimAutoreleasedReturnValue();
    labelData = v5->_labelData;
    v5->_labelData = (NSArray *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gauge"));
    v9 = objc_claimAutoreleasedReturnValue();
    gauge = v5->_gauge;
    v5->_gauge = (CHSGaugeParameters *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gaugeProviderData"));
    v11 = objc_claimAutoreleasedReturnValue();
    gaugeProviderData = v5->_gaugeProviderData;
    v5->_gaugeProviderData = (NSData *)v11;

    v13 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v13, objc_opt_class(), CFSTR("gaugeMinimumLabelData"));
    v14 = objc_claimAutoreleasedReturnValue();
    gaugeMinimumLabelData = v5->_gaugeMinimumLabelData;
    v5->_gaugeMinimumLabelData = (NSArray *)v14;

    v16 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v16, objc_opt_class(), CFSTR("gaugeMaximumLabelData"));
    v17 = objc_claimAutoreleasedReturnValue();
    gaugeMaximumLabelData = v5->_gaugeMaximumLabelData;
    v5->_gaugeMaximumLabelData = (NSArray *)v17;

    v19 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v19, objc_opt_class(), CFSTR("outerLabelData"));
    v20 = objc_claimAutoreleasedReturnValue();
    outerLabelData = v5->_outerLabelData;
    v5->_outerLabelData = (NSArray *)v20;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHUISWatchComplicationsWidgetSnapshotMetadata _initWithSnapshotMetadata:](+[CHUISWatchComplicationsWidgetSnapshotMetadata allocWithZone:](CHUISWatchComplicationsWidgetSnapshotMetadata, "allocWithZone:", a3), "_initWithSnapshotMetadata:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CHUISWatchComplicationsWidgetSnapshotMetadata _initWithSnapshotMetadata:](+[CHUISMutableWatchComplicationsWidgetSnapshotMetadata allocWithZone:](CHUISMutableWatchComplicationsWidgetSnapshotMetadata, "allocWithZone:", a3), "_initWithSnapshotMetadata:", self);
}

- (id)copyForEncodingAtUrlDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;

  v4 = a3;
  -[CHUISWatchComplicationsWidgetSnapshotMetadata labelData](self, "labelData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHUISWatchComplicationsWidgetSnapshotMetadata _encodedLabelData:atDirectory:](self, "_encodedLabelData:atDirectory:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CHUISWatchComplicationsWidgetSnapshotMetadata gaugeMinimumLabelData](self, "gaugeMinimumLabelData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHUISWatchComplicationsWidgetSnapshotMetadata _encodedLabelData:atDirectory:](self, "_encodedLabelData:atDirectory:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CHUISWatchComplicationsWidgetSnapshotMetadata gaugeMaximumLabelData](self, "gaugeMaximumLabelData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHUISWatchComplicationsWidgetSnapshotMetadata _encodedLabelData:atDirectory:](self, "_encodedLabelData:atDirectory:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CHUISWatchComplicationsWidgetSnapshotMetadata outerLabelData](self, "outerLabelData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHUISWatchComplicationsWidgetSnapshotMetadata _encodedLabelData:atDirectory:](self, "_encodedLabelData:atDirectory:", v11, v4);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = (_QWORD *)-[CHUISWatchComplicationsWidgetSnapshotMetadata copy](self, "copy");
  v14 = (void *)v13[1];
  v13[1] = v6;
  v15 = v6;

  v16 = (void *)v13[4];
  v13[4] = v8;
  v17 = v8;

  v18 = (void *)v13[5];
  v13[5] = v10;
  v19 = v10;

  v20 = (void *)v13[6];
  v13[6] = v12;

  return v13;
}

- (id)_encodedLabelData:(id)a3 atDirectory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyForEncodingAtUrlDirectory:", v6, (_QWORD)v14);
          objc_msgSend(v7, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)labelData
{
  return self->_labelData;
}

- (CHSGaugeParameters)gauge
{
  return self->_gauge;
}

- (NSData)gaugeProviderData
{
  return self->_gaugeProviderData;
}

- (NSArray)gaugeMinimumLabelData
{
  return self->_gaugeMinimumLabelData;
}

- (NSArray)gaugeMaximumLabelData
{
  return self->_gaugeMaximumLabelData;
}

- (NSArray)outerLabelData
{
  return self->_outerLabelData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerLabelData, 0);
  objc_storeStrong((id *)&self->_gaugeMaximumLabelData, 0);
  objc_storeStrong((id *)&self->_gaugeMinimumLabelData, 0);
  objc_storeStrong((id *)&self->_gaugeProviderData, 0);
  objc_storeStrong((id *)&self->_gauge, 0);
  objc_storeStrong((id *)&self->_labelData, 0);
}

@end
