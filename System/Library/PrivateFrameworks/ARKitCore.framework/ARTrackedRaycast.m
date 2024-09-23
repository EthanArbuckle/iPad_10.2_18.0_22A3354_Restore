@implementation ARTrackedRaycast

- (ARTrackedRaycast)initWithIdentifier:(id)a3 ray:(id)a4 worldTrackingTechnique:(id)a5 updateHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ARTrackedRaycast *v15;
  ARTrackedRaycast *v16;
  uint64_t v17;
  id updateHandler;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ARTrackedRaycast;
  v15 = -[ARTrackedRaycast init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_trackedQuery, a4);
    v17 = MEMORY[0x1B5E2DF90](v14);
    updateHandler = v16->_updateHandler;
    v16->_updateHandler = (id)v17;

    objc_storeWeak((id *)&v16->_attachedWorldTrackingTechnique, v13);
  }

  return v16;
}

- (id)query
{
  return self->_trackedQuery;
}

- (void)stopTracking
{
  void *v3;
  void *v4;

  -[ARTrackedRaycast attachedWorldTrackingTechnique](self, "attachedWorldTrackingTechnique");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ARTrackedRaycast attachedWorldTrackingTechnique](self, "attachedWorldTrackingTechnique");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopRaycast:", self);

    -[ARTrackedRaycast setAttachedWorldTrackingTechnique:](self, "setAttachedWorldTrackingTechnique:", 0);
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARTrackedRaycast query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p ray=%@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (ARWorldTrackingTechnique)attachedWorldTrackingTechnique
{
  return (ARWorldTrackingTechnique *)objc_loadWeakRetained((id *)&self->_attachedWorldTrackingTechnique);
}

- (void)setAttachedWorldTrackingTechnique:(id)a3
{
  objc_storeWeak((id *)&self->_attachedWorldTrackingTechnique, a3);
}

- (ARRaycastQuery)trackedQuery
{
  return (ARRaycastQuery *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTrackedQuery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedQuery, 0);
  objc_destroyWeak((id *)&self->_attachedWorldTrackingTechnique);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
