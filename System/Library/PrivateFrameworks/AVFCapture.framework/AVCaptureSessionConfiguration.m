@implementation AVCaptureSessionConfiguration

- (AVCaptureSessionConfiguration)initWithConfigurationID:(int64_t)a3 inputs:(id)a4 outputs:(id)a5 videoPreviewLayers:(id)a6 connections:(id)a7
{
  AVCaptureSessionConfiguration *v12;
  AVCaptureSessionConfiguration *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVCaptureSessionConfiguration;
  v12 = -[AVCaptureSessionConfiguration init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_configurationID = a3;
    v12->_inputs = (NSArray *)objc_msgSend(a4, "copy");
    v13->_outputs = (NSArray *)objc_msgSend(a5, "copy");
    v13->_videoPreviewLayers = (NSHashTable *)objc_msgSend(a6, "copy");
    v13->_connections = (NSArray *)objc_msgSend(a7, "copy");
  }
  return v13;
}

- (int64_t)configurationID
{
  return self->_configurationID;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSessionConfiguration;
  -[AVCaptureSessionConfiguration dealloc](&v3, sel_dealloc);
}

- (id)uniqueVideoPreviewLayers:(id)a3
{
  void *v5;
  NSHashTable *videoPreviewLayers;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  videoPreviewLayers = self->_videoPreviewLayers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](videoPreviewLayers, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(videoPreviewLayers);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](videoPreviewLayers, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  objc_msgSend(v5, "minusHashTable:", objc_msgSend(a3, "videoPreviewLayers"));
  return v5;
}

- (id)uniqueOutputs:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", self->_outputs);
  objc_msgSend(v4, "minusSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(a3, "outputs")));
  return v4;
}

- (id)uniqueInputs:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", self->_inputs);
  objc_msgSend(v4, "minusSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(a3, "inputs")));
  return v4;
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (id)uniqueConnections:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", self->_connections);
  objc_msgSend(v4, "minusSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(a3, "connections")));
  return v4;
}

- (NSArray)outputs
{
  return self->_outputs;
}

- (NSHashTable)videoPreviewLayers
{
  return self->_videoPreviewLayers;
}

- (NSArray)connections
{
  return self->_connections;
}

@end
