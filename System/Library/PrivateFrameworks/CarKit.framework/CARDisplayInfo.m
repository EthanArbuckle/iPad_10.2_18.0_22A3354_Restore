@implementation CARDisplayInfo

- (CARDisplayInfo)initWithPhysicalScreenDictionary:(id)a3
{
  id v4;
  CARDisplayInfo *v5;
  CARDisplayInfo *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSString *identifier;
  id v12;
  id v13;
  CARDisplayInfo *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  CARDisplayInfo *v19;
  NSArray *oemPunchThroughs;
  _QWORD v22[4];
  CARDisplayInfo *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CARDisplayInfo;
  v5 = -[CARDisplayInfo init](&v24, sel_init);
  v6 = v5;
  if (!v5)
  {
LABEL_36:
    v19 = v6;
    goto LABEL_37;
  }
  if ((CRSizeFromAirPlayDictionary(v4, &v5->_pixelSize.width) & 1) == 0)
  {
    CarGeneralLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CARDisplayInfo initWithPhysicalScreenDictionary:].cold.4();
    goto LABEL_27;
  }
  if ((CRPhysicalSizeFromAirPlayDictionary(v4, &v6->_physicalSize.width) & 1) == 0)
  {
    CarGeneralLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CARDisplayInfo initWithPhysicalScreenDictionary:].cold.3();
    goto LABEL_27;
  }
  objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("uid"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if (!v8)
  {
    CarGeneralLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CARDisplayInfo initWithPhysicalScreenDictionary:].cold.1();
LABEL_27:

    goto LABEL_28;
  }
  v10 = objc_msgSend(v8, "copy");
  identifier = v6->_identifier;
  v6->_identifier = (NSString *)v10;

  objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("properties"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __51__CARDisplayInfo_initWithPhysicalScreenDictionary___block_invoke;
  v22[3] = &unk_1E5428F28;
  v14 = v6;
  v23 = v14;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v22);
  objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("initialVideoStreams"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15 && (objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;

  if (v16)
  {
    -[CARDisplayInfo updateStreams:](v14, "updateStreams:", v16);
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("automakerInputStreams"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17 && (objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    if (v18)
    {
      -[CARDisplayInfo _updateOEMViews:](v14, "_updateOEMViews:", v18);
    }
    else
    {
      oemPunchThroughs = v14->_oemPunchThroughs;
      v14->_oemPunchThroughs = (NSArray *)MEMORY[0x1E0C9AA60];

    }
  }
  else
  {
    CarGeneralLogging();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CARDisplayInfo initWithPhysicalScreenDictionary:].cold.2();
  }

  if (v16)
    goto LABEL_36;
LABEL_28:
  v19 = 0;
LABEL_37:

  return v19;
}

void __51__CARDisplayInfo_initWithPhysicalScreenDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  v7 = v4;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v7;
    else
      v5 = 0;
    v4 = v7;
  }
  else
  {
    v5 = 0;
  }

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("CarPlay")) & 1) != 0)
  {
    v6 = 8;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Instrument Cluster")) & 1) != 0)
  {
    v6 = 9;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Map")) & 1) != 0)
  {
    v6 = 10;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DPManaged")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("DDPManaged")) & 1) != 0)
  {
    v6 = 11;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("additionalContent")))
      goto LABEL_17;
    v6 = 12;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + v6) = 1;
LABEL_17:

}

- (CARDisplayInfo)initWithLogicalScreenDictionary:(id)a3
{
  id v4;
  CARDisplayInfo *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSString *identifier;
  CARStreamInfo *v11;
  CARStreamInfo *v12;
  NSArray *v13;
  uint64_t v14;
  NSArray *streams;
  CARDisplayInfo *v16;
  NSArray *oemPunchThroughs;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CARDisplayInfo;
  v5 = -[CARDisplayInfo init](&v19, sel_init);
  if (!v5)
  {
LABEL_20:
    v16 = v5;
    goto LABEL_21;
  }
  if (CRSizeFromDictionary((const __CFDictionary *)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CA45C8]), &v5->_pixelSize))
  {
    if (CRSizeFromDictionary((const __CFDictionary *)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CA45C0]), &v5->_physicalSize))
    {
      objc_opt_class();
      objc_msgSend(v4, "objectForKey:", CFSTR("ScreenID"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;

      if (v7)
      {
        v9 = objc_msgSend(v7, "copy");
        identifier = v5->_identifier;
        v5->_identifier = (NSString *)v9;

        *(_WORD *)&v5->_supportsCarPlayContent = 257;
        v5->_supportsMapContent = 1;
        v11 = -[CARStreamInfo initWithStreamInfoDictionary:]([CARStreamInfo alloc], "initWithStreamInfoDictionary:", v4);
        v12 = v11;
        v13 = (NSArray *)MEMORY[0x1E0C9AA60];
        if (v11)
        {
          v20[0] = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
          v14 = objc_claimAutoreleasedReturnValue();
          streams = v5->_streams;
          v5->_streams = (NSArray *)v14;
        }
        else
        {
          streams = v5->_streams;
          v5->_streams = (NSArray *)MEMORY[0x1E0C9AA60];
        }

        oemPunchThroughs = v5->_oemPunchThroughs;
        v5->_oemPunchThroughs = v13;

        goto LABEL_20;
      }
      CarGeneralLogging();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CARDisplayInfo initWithPhysicalScreenDictionary:].cold.1();
    }
    else
    {
      CarGeneralLogging();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CARDisplayInfo initWithPhysicalScreenDictionary:].cold.3();
    }
  }
  else
  {
    CarGeneralLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CARDisplayInfo initWithPhysicalScreenDictionary:].cold.4();
  }

  v16 = 0;
LABEL_21:

  return v16;
}

- (id)punchThroughWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[CARDisplayInfo oemPunchThroughs](self, "oemPunchThroughs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__CARDisplayInfo_punchThroughWithIdentifier___block_invoke;
  v9[3] = &unk_1E5428F50;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __45__CARDisplayInfo_punchThroughWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)hasPunchThroughWithIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[CARDisplayInfo punchThroughWithIdentifier:](self, "punchThroughWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (NSSet)punchThroughIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[CARDisplayInfo oemPunchThroughs](self, "oemPunchThroughs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_map:", &__block_literal_global_16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

uint64_t __41__CARDisplayInfo_punchThroughIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *identifier;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)CARDisplayInfo;
  -[CARDisplayInfo description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  BSStringFromCGSize();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BSStringFromCGSize();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CARDisplayInfo supportsAdditionalContent](self, "supportsAdditionalContent");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {identifier: %@, physicalSize: %@, pixelSize: %@, additionalContent: %@}"), v4, identifier, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)updateStreams:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  NSArray *v7;
  NSArray *streams;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__CARDisplayInfo_updateStreams___block_invoke;
  v10[3] = &unk_1E5428DA8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  v7 = (NSArray *)objc_msgSend(v9, "copy");
  streams = self->_streams;
  self->_streams = v7;

}

void __32__CARDisplayInfo_updateStreams___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  CARStreamInfo *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[CARStreamInfo initWithDictionary:]([CARStreamInfo alloc], "initWithDictionary:", v4);
    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

    v6 = v4;
  }
  else
  {

    CarGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __32__CARDisplayInfo_updateStreams___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

}

- (CGPoint)originForScreenInfoIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[4];
  id v15;
  CGPoint result;

  v4 = a3;
  -[CARDisplayInfo streams](self, "streams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__CARDisplayInfo_originForScreenInfoIdentifier___block_invoke;
  v14[3] = &unk_1E5428DF8;
  v15 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "origin");
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D538];
    v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

uint64_t __48__CARDisplayInfo_originForScreenInfoIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_updateOEMViews:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  NSArray *v7;
  NSArray *oemPunchThroughs;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__CARDisplayInfo__updateOEMViews___block_invoke;
  v10[3] = &unk_1E5428DA8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  v7 = (NSArray *)objc_msgSend(v9, "copy");
  oemPunchThroughs = self->_oemPunchThroughs;
  self->_oemPunchThroughs = v7;

}

void __34__CARDisplayInfo__updateOEMViews___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  CAROEMPunchThrough *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[CAROEMPunchThrough initWithDictionary:]([CAROEMPunchThrough alloc], "initWithDictionary:", v4);
    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

    v6 = v4;
  }
  else
  {

    CarGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __34__CARDisplayInfo__updateOEMViews___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (CGSize)physicalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_physicalSize.width;
  height = self->_physicalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)pixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pixelSize.width;
  height = self->_pixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)supportsCarPlayContent
{
  return self->_supportsCarPlayContent;
}

- (BOOL)supportsInstrumentClusterContent
{
  return self->_supportsInstrumentClusterContent;
}

- (BOOL)supportsMapContent
{
  return self->_supportsMapContent;
}

- (BOOL)supportsDDPContent
{
  return self->_supportsDDPContent;
}

- (BOOL)supportsAdditionalContent
{
  return self->_supportsAdditionalContent;
}

- (NSArray)oemPunchThroughs
{
  return self->_oemPunchThroughs;
}

- (NSArray)streams
{
  return self->_streams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streams, 0);
  objc_storeStrong((id *)&self->_oemPunchThroughs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithPhysicalScreenDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "Unable to parse display identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithPhysicalScreenDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "Unable to parse logical displays: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithPhysicalScreenDictionary:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "Unable to parse display physical size: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithPhysicalScreenDictionary:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "Unable to parse display pixel size: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __32__CARDisplayInfo_updateStreams___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A83A2000, a1, a3, "Unable to parse stream dictionary: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __34__CARDisplayInfo__updateOEMViews___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A83A2000, a1, a3, "Unable to parse punch through dictionary: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
