@implementation MTPrunePromise

- (MTPrunePromise)initWithMaterialLayer:(id)a3
{
  id v4;
  MTPrunePromise *v5;
  MTPrunePromise *v6;
  uint64_t v7;
  NSDate *timeStamp;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTPrunePromise;
  v5 = -[MTPrunePromise init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_materialLayer, v4);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = objc_claimAutoreleasedReturnValue();
    timeStamp = v6->_timeStamp;
    v6->_timeStamp = (NSDate *)v7;

  }
  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  MTPrunePromise *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!self->_promiseFulfilled)
  {
    v3 = MTLogMaterials;
    if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v6 = self;
      _os_log_impl(&dword_1AAB41000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: deallocating with unfulfilled promise", buf, 0xCu);
    }
    -[MTPrunePromise fulfillPromise](self, "fulfillPromise");
  }
  v4.receiver = self;
  v4.super_class = (Class)MTPrunePromise;
  -[MTPrunePromise dealloc](&v4, sel_dealloc);
}

- (void)fulfillPromise
{
  id WeakRetained;
  NSObject *v4;
  int v5;
  MTPrunePromise *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_promiseFulfilled)
  {
    self->_promiseFulfilled = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_materialLayer);
    v4 = MTLogMaterials;
    if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543618;
      v6 = self;
      v7 = 2114;
      v8 = WeakRetained;
      _os_log_impl(&dword_1AAB41000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: pruning layer: %{public}@", (uint8_t *)&v5, 0x16u);
    }
    objc_msgSend(WeakRetained, "prune");

  }
}

- (double)timeIntervalSincePromise
{
  double result;

  -[NSDate timeIntervalSinceNow](self->_timeStamp, "timeIntervalSinceNow");
  return result;
}

- (BOOL)isPromiseFulfilled
{
  return self->_promiseFulfilled;
}

- (void)setPromiseFulfilled:(BOOL)a3
{
  self->_promiseFulfilled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_destroyWeak((id *)&self->_materialLayer);
}

@end
