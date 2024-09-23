@implementation ACUISSystemApertureSceneHandle

- (ACUISSystemApertureSceneHandle)initWithDescriptor:(id)a3 metricsRequest:(id)a4
{
  id v6;
  id v7;
  _TtC18ActivityUIServices33ActivitySystemApertureSceneHandle *v8;
  void *v9;
  _TtC18ActivityUIServices33ActivitySystemApertureSceneHandle *v10;
  ACUISSystemApertureSceneHandle *v11;

  v6 = a4;
  v7 = a3;
  v8 = [_TtC18ActivityUIServices33ActivitySystemApertureSceneHandle alloc];
  objc_msgSend(v6, "_activityMetricsRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ActivitySystemApertureSceneHandle initWithAcActivityDescritor:systemMetricsRequest:](v8, "initWithAcActivityDescritor:systemMetricsRequest:", v7, v9);
  v11 = -[ACUISSystemApertureSceneHandle initWithActivitySystemApertureSceneHandle:](self, "initWithActivitySystemApertureSceneHandle:", v10);

  return v11;
}

- (ACUISSystemApertureSceneHandle)initWithActivitySystemApertureSceneHandle:(id)a3
{
  id v5;
  ACUISSystemApertureSceneHandle *v6;
  ACUISSystemApertureSceneHandle *v7;
  uint64_t v8;
  FBScene *scene;
  uint64_t v10;
  ACActivityDescriptor *descriptor;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACUISSystemApertureSceneHandle;
  v6 = -[ACUISSystemApertureSceneHandle init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_handle, a3);
    -[ActivitySystemApertureSceneHandle setDelegate:](v7->_handle, "setDelegate:", v7);
    objc_msgSend(v5, "scene");
    v8 = objc_claimAutoreleasedReturnValue();
    scene = v7->_scene;
    v7->_scene = (FBScene *)v8;

    objc_msgSend(v5, "descriptor");
    v10 = objc_claimAutoreleasedReturnValue();
    descriptor = v7->_descriptor;
    v7->_descriptor = (ACActivityDescriptor *)v10;

  }
  return v7;
}

- (void)invalidate
{
  -[ActivitySystemApertureSceneHandle invalidate](self->_handle, "invalidate");
}

- (void)activitySystemApertureWithSceneHandle:(id)a3 requestsLaunchWithAction:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[ACUISSystemApertureSceneHandle delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "activitySystemApertureSceneHandle:requestsLaunchWithAction:", self, v6);

}

- (void)activitySystemApertureWithSceneHandle:(id)a3 updatedContentPayloadID:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[ACUISSystemApertureSceneHandle delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "activitySystemApertureSceneHandle:updatedContentPayloadID:", self, v6);

}

- (ACUISSystemApertureSceneHandleDelegate)delegate
{
  return (ACUISSystemApertureSceneHandleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FBScene)scene
{
  return self->_scene;
}

- (ACActivityDescriptor)descriptor
{
  return self->_descriptor;
}

- (_TtC18ActivityUIServices33ActivitySystemApertureSceneHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
