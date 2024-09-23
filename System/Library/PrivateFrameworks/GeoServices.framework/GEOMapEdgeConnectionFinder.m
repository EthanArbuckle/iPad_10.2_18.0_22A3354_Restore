@implementation GEOMapEdgeConnectionFinder

- (GEOMapEdgeConnectionFinder)initWithMap:(id)a3 tile:(id)a4 junction:(GeoCodecsConnectivityJunction *)a5 coordinate:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  GEOMapEdgeConnectionFinder *v13;
  GEOMapEdgeConnectionFinder *v14;
  NSMutableArray *v15;
  NSMutableArray *builders;
  objc_super v18;

  var1 = a6.var1;
  var0 = a6.var0;
  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)GEOMapEdgeConnectionFinder;
  v13 = -[GEOMapRequest initWithManager:](&v18, sel_initWithManager_, v11);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_map, v11);
    objc_storeStrong((id *)&v14->_tile, a4);
    v14->_junction = a5;
    v14->_coordinate.latitude = var0;
    v14->_coordinate.longitude = var1;
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    builders = v14->_builders;
    v14->_builders = v15;

  }
  return v14;
}

- (void)cancel
{
  id WeakRetained;
  NSObject *v4;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_map);
  objc_msgSend(WeakRetained, "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__GEOMapEdgeConnectionFinder_cancel__block_invoke;
  block[3] = &unk_1E1C00178;
  block[4] = self;
  dispatch_async(v4, block);

}

id __36__GEOMapEdgeConnectionFinder_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  if (v3)
  {
    v4 = objc_msgSend(v3, "isFinished");
    v2 = *(_QWORD *)(a1 + 32);
    if ((v4 & 1) == 0)
    {
      objc_msgSend(*(id *)(v2 + 48), "cancel");
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 48);
      *(_QWORD *)(v5 + 48) = 0;

      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = *(id *)(v2 + 56);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isFinished") & 1) == 0)
          objc_msgSend(v11, "cancel");
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 56);
  *(_QWORD *)(v12 + 56) = 0;

  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)GEOMapEdgeConnectionFinder;
  return objc_msgSendSuper2(&v15, sel_cancel);
}

- (void)findConnectionsOut:(id)a3
{
  -[GEOMapEdgeConnectionFinder _findConnections:incoming:](self, "_findConnections:incoming:", a3, 0);
}

- (void)findConnectionsIn:(id)a3
{
  -[GEOMapEdgeConnectionFinder _findConnections:incoming:](self, "_findConnections:incoming:", a3, 1);
}

- (void)_findConnections:(id)a3 incoming:(BOOL)a4
{
  -[GEOMapEdgeConnectionFinder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tile, 0);
  objc_storeStrong((id *)&self->_builders, 0);
  objc_storeStrong((id *)&self->_tileFinder, 0);
  objc_destroyWeak((id *)&self->_map);
}

@end
