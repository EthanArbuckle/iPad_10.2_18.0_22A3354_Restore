@implementation AVFigRoutingContextCommandOutputDeviceConfiguration

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVFigRoutingContextCommandOutputDeviceConfiguration)init
{
  return -[AVFigRoutingContextCommandOutputDeviceConfiguration initWithRoutingContextComandResponse:](self, "initWithRoutingContextComandResponse:", 0);
}

- (AVFigRoutingContextCommandOutputDeviceConfiguration)initWithRoutingContextComandResponse:(__CFDictionary *)a3
{
  AVFigRoutingContextCommandOutputDeviceConfiguration *v4;
  AVFigRoutingContextCommandOutputDeviceConfiguration *v5;
  __CFDictionary *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVFigRoutingContextCommandOutputDeviceConfiguration;
  v4 = -[AVFigRoutingContextCommandOutputDeviceConfiguration init](&v8, sel_init);
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  if (!a3)
  {
    v4->_response = 0;
    goto LABEL_6;
  }
  v6 = (__CFDictionary *)CFRetain(a3);
  v5->_response = v6;
  if (!v6)
  {
LABEL_7:
    a3 = 0;
    goto LABEL_6;
  }
  a3 = v5;
LABEL_6:

  return (AVFigRoutingContextCommandOutputDeviceConfiguration *)a3;
}

- (void)dealloc
{
  __CFDictionary *response;
  objc_super v4;

  response = self->_response;
  if (response)
    CFRelease(response);
  v4.receiver = self;
  v4.super_class = (Class)AVFigRoutingContextCommandOutputDeviceConfiguration;
  -[AVFigRoutingContextCommandOutputDeviceConfiguration dealloc](&v4, sel_dealloc);
}

- (NSString)deviceName
{
  return (NSString *)CFDictionaryGetValue(self->_response, (const void *)*MEMORY[0x1E0CA3920]);
}

- (NSString)devicePassword
{
  return (NSString *)CFDictionaryGetValue(self->_response, (const void *)*MEMORY[0x1E0CA3938]);
}

- (NSString)deviceID
{
  return (NSString *)CFDictionaryGetValue(self->_response, (const void *)*MEMORY[0x1E0CA38F0]);
}

- (NSData)devicePublicKey
{
  return (NSData *)CFDictionaryGetValue(self->_response, (const void *)*MEMORY[0x1E0CA3900]);
}

- (BOOL)automaticallyAllowsConnectionsFromPeersInHomeGroup
{
  const __CFBoolean *Value;

  Value = (const __CFBoolean *)CFDictionaryGetValue(self->_response, (const void *)*MEMORY[0x1E0CA3928]);
  if (Value)
    LOBYTE(Value) = CFBooleanGetValue(Value) != 0;
  return (char)Value;
}

- (BOOL)onlyAllowsConnectionsFromPeersInHomeGroup
{
  _BOOL4 v3;

  v3 = -[AVFigRoutingContextCommandOutputDeviceConfiguration automaticallyAllowsConnectionsFromPeersInHomeGroup](self, "automaticallyAllowsConnectionsFromPeersInHomeGroup");
  if (v3)
  {
    CFDictionaryGetValue(self->_response, (const void *)*MEMORY[0x1E0CA3930]);
    LOBYTE(v3) = FigCFEqual() == 0;
  }
  return v3;
}

- (NSArray)peersInHomeGroup
{
  NSArray *v3;
  void *Value;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  AVOutputDeviceAuthorizedPeer *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  Value = (void *)CFDictionaryGetValue(self->_response, (const void *)*MEMORY[0x1E0CA3918]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = Value;
  v5 = objc_msgSend(Value, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = *MEMORY[0x1E0CA38F0];
    v9 = *MEMORY[0x1E0CA3900];
    v10 = *MEMORY[0x1E0CA38F8];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v12 = -[AVOutputDeviceAuthorizedPeer initWithID:publicKey:hasAdministratorPrivileges:]([AVOutputDeviceAuthorizedPeer alloc], "initWithID:publicKey:hasAdministratorPrivileges:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "objectForKeyedSubscript:", v8), objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "objectForKeyedSubscript:", v9), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "objectForKeyedSubscript:", v10), "unsignedIntegerValue") == 1);
        -[NSArray addObject:](v3, "addObject:", v12);

        ++v11;
      }
      while (v6 != v11);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  return v3;
}

@end
