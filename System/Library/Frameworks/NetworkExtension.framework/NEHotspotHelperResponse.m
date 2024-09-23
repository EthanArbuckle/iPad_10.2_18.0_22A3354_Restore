@implementation NEHotspotHelperResponse

- (void)dealloc
{
  __CNPluginResponse *response;
  objc_super v4;

  if (self)
  {
    response = self->_response;
    if (response)
      CFRelease(response);
    self->_response = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NEHotspotHelperResponse;
  -[NEHotspotHelperResponse dealloc](&v4, sel_dealloc);
}

- (id)description
{
  if (self)
    self = (NEHotspotHelperResponse *)self->_response;
  return (id)(id)CFCopyDescription(self);
}

- (void)setNetwork:(NEHotspotNetwork *)network
{
  NEHotspotNetwork *v3;

  v3 = network;
  CNPluginResponseSetNetwork();

}

- (void)setNetworkList:(NSArray *)networkList
{
  NSArray *v3;
  __CFArray *Mutable;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = networkList;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (v10)
          v11 = *(const void **)(v10 + 8);
        else
          v11 = 0;
        CFArrayAppendValue(Mutable, v11);
        ++v9;
      }
      while (v7 != v9);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 = v12;
    }
    while (v12);
  }

  if (Mutable)
  {
    CNPluginResponseSetNetworkList();
    CFRelease(Mutable);
  }

}

- (void)deliver
{
  CNPluginResponseDeliver();
}

@end
