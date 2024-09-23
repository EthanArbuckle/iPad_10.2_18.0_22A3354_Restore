@implementation CNRenderingSessionFrameAttributes

- (CNRenderingSessionFrameAttributes)initWithSampleBuffer:(CMSampleBufferRef)sampleBuffer sessionAttributes:(CNRenderingSessionAttributes *)sessionAttributes
{
  objc_class *v6;
  CNRenderingSessionAttributes *v7;
  void *v8;
  CNRenderingSessionFrameAttributes *v9;

  v6 = (objc_class *)MEMORY[0x24BDB26C0];
  v7 = sessionAttributes;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithSampleBuffer:", sampleBuffer);
  v9 = -[CNRenderingSessionFrameAttributes initWithTimedMetadataGroup:sessionAttributes:](self, "initWithTimedMetadataGroup:sessionAttributes:", v8, v7);

  return v9;
}

- (CNRenderingSessionFrameAttributes)initWithTimedMetadataGroup:(AVTimedMetadataGroup *)metadataGroup sessionAttributes:(CNRenderingSessionAttributes *)sessionAttributes
{
  CNRenderingSessionAttributes *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  CNRenderingSessionFrameAttributes *v15;
  void *v16;
  char isKindOfClass;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = sessionAttributes;
  if (metadataGroup)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[AVTimedMetadataGroup items](metadataGroup, "items", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v12, "key");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", 0x2504502E8);

          if (v14)
          {
            objc_msgSend(v12, "value");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v12, "value");
              v18 = objc_claimAutoreleasedReturnValue();
              self = (CNRenderingSessionFrameAttributes *)-[CNRenderingSessionFrameAttributes _initWithTimedData:sessionAttributes:](self, "_initWithTimedData:sessionAttributes:", v18, v6);
              v15 = self;
            }
            else
            {
              _CNLogSystem();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                -[CNRenderingSessionFrameAttributes initWithTimedMetadataGroup:sessionAttributes:].cold.1(0x2504502E8, v12, v18);
              v15 = 0;
            }

            goto LABEL_18;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v9)
          continue;
        break;
      }
    }
    v15 = 0;
LABEL_18:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (int64_t)majorVersion
{
  return -[PTTimedRenderingMetadata majorVersion](self->_internalMetadata, "majorVersion");
}

- (int64_t)minorVersion
{
  return -[PTTimedRenderingMetadata minorVersion](self->_internalMetadata, "minorVersion");
}

- (float)originalFocusDisparity
{
  int64_t v3;
  float result;

  v3 = -[CNRenderingSessionFrameAttributes majorVersion](self, "majorVersion");
  if (v3 == 2)
  {
    -[PTTimedRenderingMetadata focusDisparity](self->_internalMetadata, "focusDisparity");
  }
  else if (v3 == 1)
  {
    -[PTTimedRenderingMetadata focusDistance](self->_internalMetadata, "focusDistance");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (float)originalFNumber
{
  int64_t v3;
  float result;

  v3 = -[CNRenderingSessionFrameAttributes majorVersion](self, "majorVersion");
  if (v3 == 2)
  {
    -[PTTimedRenderingMetadata fNumber](self->_internalMetadata, "fNumber");
  }
  else if (v3 == 1)
  {
    -[PTTimedRenderingMetadata aperture](self->_internalMetadata, "aperture");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initJustWithPTTimedRenderingMetadata:", self->_internalMetadata);
  -[CNRenderingSessionFrameAttributes focusDisparity](self, "focusDisparity");
  objc_msgSend(v4, "setFocusDisparity:");
  -[CNRenderingSessionFrameAttributes fNumber](self, "fNumber");
  objc_msgSend(v4, "setFNumber:");
  return v4;
}

- (id)_initWithPTTimedRenderingMetadata:(id)a3
{
  id v5;
  CNRenderingSessionFrameAttributes *v6;
  CNRenderingSessionFrameAttributes *v7;
  float v8;
  float v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNRenderingSessionFrameAttributes;
  v6 = -[CNRenderingSessionFrameAttributes init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_internalMetadata, a3);
    -[CNRenderingSessionFrameAttributes originalFocusDisparity](v7, "originalFocusDisparity");
    v7->_focusDisparity = v8;
    -[CNRenderingSessionFrameAttributes originalFNumber](v7, "originalFNumber");
    v7->_fNumber = v9;
  }

  return v7;
}

- (id)_initJustWithPTTimedRenderingMetadata:(id)a3
{
  id v5;
  CNRenderingSessionFrameAttributes *v6;
  CNRenderingSessionFrameAttributes *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNRenderingSessionFrameAttributes;
  v6 = -[CNRenderingSessionFrameAttributes init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_internalMetadata, a3);

  return v7;
}

- (id)_initWithTimedData:(id)a3 sessionAttributes:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CNRenderingSessionFrameAttributes *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BE74BB8];
  v8 = a4;
  v9 = objc_msgSend(v8, "majorVersion");
  v10 = objc_msgSend(v8, "minorVersion");

  objc_msgSend(v7, "objectFromData:withMajorVersion:minorVersion:", v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    self = (CNRenderingSessionFrameAttributes *)-[CNRenderingSessionFrameAttributes _initWithPTTimedRenderingMetadata:](self, "_initWithPTTimedRenderingMetadata:", v11);
    v12 = self;
  }
  else
  {
    _CNLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CNRenderingSessionFrameAttributes _initWithTimedData:sessionAttributes:].cold.1((uint64_t)v6, v13, v14, v15, v16, v17, v18, v19);

    v12 = 0;
  }

  return v12;
}

- (float)focusDisparity
{
  return self->_focusDisparity;
}

- (void)setFocusDisparity:(float)focusDisparity
{
  self->_focusDisparity = focusDisparity;
}

- (float)fNumber
{
  return self->_fNumber;
}

- (void)setFNumber:(float)fNumber
{
  self->_fNumber = fNumber;
}

- (PTTimedRenderingMetadata)internalMetadata
{
  return (PTTimedRenderingMetadata *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalMetadata, 0);
}

- (void)initWithTimedMetadataGroup:(NSObject *)a3 sessionAttributes:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = a1;
  v11 = 2112;
  v12 = v7;
  OUTLINED_FUNCTION_1_0(&dword_23307F000, a3, v8, "error: metadata item %@ of class %@ (expected NSData) -- skipping", (uint8_t *)&v9);

}

- (void)_initWithTimedData:(uint64_t)a3 sessionAttributes:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23307F000, a2, a3, "Failed to deserialize timed rendering metadata: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
