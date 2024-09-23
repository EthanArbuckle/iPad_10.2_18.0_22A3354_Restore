@implementation VNRPNTrackerEspressoResources

- (id)_initWithRPNInitEspressoResources:(id)a3 RPNTrackEspressoResources:(id)a4
{
  id v7;
  id v8;
  VNRPNTrackerEspressoResources *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VNRPNTrackerEspressoResources;
  v9 = -[VNRPNTrackerEspressoResources init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rpnInitEspressoResources, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rpnTrackEspressoResources, 0);
  objc_storeStrong((id *)&self->_rpnInitEspressoResources, 0);
}

id __110__VNRPNTrackerEspressoResources_resourcesForOptions_PRNInitEspressoModelName_RPNTrackEspressoModelName_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  id v9;
  void *v10;
  id v11;
  id v13;
  unsigned int v14;

  +[VNEspressoHelpers pathForEspressoNetworkModelFileWithName:error:](VNEspressoHelpers, "pathForEspressoNetworkModelFileWithName:error:", a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (v14 = 0,
        +[VNValidationUtilities getEspressoPriority:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getEspressoPriority:forKey:inOptions:withDefaultValue:error:", &v14, CFSTR("VNDetectorOption_EspressoPlanPriority"), *(_QWORD *)(a1 + 32), 0, a3)))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = objc_msgSend(*(id *)(a1 + 48), "BOOLValue");
    v13 = 0;
    v8 = +[VNEspressoHelpers createSingleNetworkPlanFromModelPath:forComputeDevice:lowPriorityMode:priority:inputBlobNames:outputBlobNames:networkConfiguration:memoryPoolId:espressoResources:error:](VNEspressoHelpers, "createSingleNetworkPlanFromModelPath:forComputeDevice:lowPriorityMode:priority:inputBlobNames:outputBlobNames:networkConfiguration:memoryPoolId:espressoResources:error:", v5, v6, v7, v14, 0, 0, 0, 0, &v13, a3);
    v9 = v13;
    v10 = v9;
    if (v8)
      v11 = v9;
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)rpnInitEspressoResources
{
  if (a1)
    a1 = (id *)a1[1];
  return a1;
}

- (id)rpnTrackEspressoResources
{
  if (a1)
    a1 = (id *)a1[2];
  return a1;
}

@end
