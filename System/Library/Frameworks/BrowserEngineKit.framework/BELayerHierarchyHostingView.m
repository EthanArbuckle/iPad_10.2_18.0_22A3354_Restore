@implementation BELayerHierarchyHostingView

- (BELayerHierarchyHandle)handle
{
  BSDispatchQueueAssertMain();
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  _UIVisibilityPropagationInteraction *v5;
  void *v6;
  BELayerHierarchyHandle *handle;
  int v8;
  _UIVisibilityPropagationInteraction *v9;
  _UIVisibilityPropagationInteraction *v10;
  id v11;

  v11 = a3;
  BSDispatchQueueAssertMain();
  v5 = self->_visibility;
  -[BELayerHierarchyHostingView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v6, "setContextId:", -[BELayerHierarchyHandle _contextID]((uint64_t)v11));
    handle = self->_handle;
    if (handle
      && (v8 = -[BELayerHierarchyHandle _pid]((uint64_t)handle),
          v8 == -[BELayerHierarchyHandle _pid]((uint64_t)v11)))
    {
      v9 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBDD90], "interactionWithPID:environmentIdentifier:", -[BELayerHierarchyHandle _pid]((uint64_t)v11), CFSTR("BEHostingVisibilitySink"));
      v9 = (_UIVisibilityPropagationInteraction *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
  }
  else
  {
    objc_msgSend(v6, "setContextId:", 0);
    v10 = 0;
  }
  objc_storeStrong((id *)&self->_handle, a3);
  if (v10 != v5)
  {
    objc_storeStrong((id *)&self->_visibility, v10);
    if (v10)
      -[BELayerHierarchyHostingView addInteraction:](self, "addInteraction:", v10);
    if (v5)
      -[BELayerHierarchyHostingView removeInteraction:](self, "removeInteraction:", v5);
  }

}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibility, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
