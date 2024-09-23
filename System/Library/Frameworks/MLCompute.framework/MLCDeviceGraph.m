@implementation MLCDeviceGraph

+ (id)deviceGraphWithLayers:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initDeviceGraphWithLayers:device:", v7, v6);

  return v8;
}

- (id)initDeviceGraphWithLayers:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  MLCDeviceGraph *v8;
  MLCDeviceGraph *v9;
  uint64_t v10;
  NSMutableArray *graphLayerList;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MLCDeviceGraph;
  v8 = -[MLCDeviceGraph init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a4);
    v10 = objc_msgSend(v6, "mutableCopy");
    graphLayerList = v9->_graphLayerList;
    v9->_graphLayerList = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_liveOutputs, v12);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_liveInputs, v13);

  }
  return v9;
}

- (MLCDevice)device
{
  return self->_device;
}

- (NSMutableArray)graphLayerList
{
  return self->_graphLayerList;
}

- (void)setGraphLayerList:(id)a3
{
  objc_storeStrong((id *)&self->_graphLayerList, a3);
}

- (NSMutableSet)liveOutputs
{
  return (NSMutableSet *)objc_loadWeakRetained((id *)&self->_liveOutputs);
}

- (void)setLiveOutputs:(id)a3
{
  objc_storeWeak((id *)&self->_liveOutputs, a3);
}

- (NSMutableSet)liveInputs
{
  return (NSMutableSet *)objc_loadWeakRetained((id *)&self->_liveInputs);
}

- (void)setLiveInputs:(id)a3
{
  objc_storeWeak((id *)&self->_liveInputs, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_liveInputs);
  objc_destroyWeak((id *)&self->_liveOutputs);
  objc_storeStrong((id *)&self->_graphLayerList, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
