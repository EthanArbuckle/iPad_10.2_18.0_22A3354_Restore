@implementation GTMTLReplayObjectMap

- (GTMTLReplayObjectMap)initWithDevice:(id)a3
{
  id v5;
  GTMTLReplayObjectMap *v6;
  GTMTLReplayObjectMap *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *argumentEncoders;
  NSMutableDictionary *v10;
  NSMutableDictionary *commandBuffers;
  NSMutableDictionary *v12;
  NSMutableDictionary *commandEncoders;
  NSMutableDictionary *v14;
  NSMutableDictionary *ioCommandQueues;
  NSMutableDictionary *v16;
  NSMutableDictionary *ioCommandBuffers;
  NSMutableDictionary *v18;
  NSMutableDictionary *ioHandles;
  NSMutableDictionary *v20;
  NSMutableDictionary *ioScratchBuffers;
  NSMutableDictionary *v22;
  NSMutableDictionary *ioScratchBufferAllocators;
  NSMutableDictionary *v24;
  NSMutableDictionary *commandQueues;
  NSMutableDictionary *v26;
  NSMutableDictionary *computePipelineStates;
  NSMutableDictionary *v28;
  NSMutableDictionary *counterSampleBuffers;
  NSMutableDictionary *v30;
  NSMutableDictionary *depthStencilStates;
  NSMutableDictionary *v32;
  NSMutableDictionary *devices;
  NSMutableDictionary *v34;
  NSMutableDictionary *drawables;
  NSMutableDictionary *v36;
  NSMutableDictionary *events;
  NSMutableDictionary *v38;
  NSMutableDictionary *fences;
  NSMutableDictionary *v40;
  NSMutableDictionary *functions;
  NSMutableDictionary *v42;
  NSMutableDictionary *heaps;
  NSMutableDictionary *v44;
  NSMutableDictionary *indirectComputeCommands;
  NSMutableDictionary *v46;
  NSMutableDictionary *indirectRenderCommands;
  NSMutableDictionary *v48;
  NSMutableDictionary *iosurfaces;
  NSMutableDictionary *v50;
  NSMutableDictionary *layers;
  NSMutableDictionary *v52;
  NSMutableDictionary *libraries;
  NSMutableDictionary *v54;
  NSMutableDictionary *dynamicLibraries;
  NSMutableDictionary *v56;
  NSMutableDictionary *motionEstimationPipelines;
  NSMutableDictionary *v58;
  NSMutableDictionary *parallelRenderCommandEncoders;
  NSMutableDictionary *v60;
  NSMutableDictionary *objectPayloadBinding;
  NSMutableDictionary *v62;
  NSMutableDictionary *pipelineLibraries;
  NSMutableDictionary *v64;
  NSMutableDictionary *rasterizationRateMaps;
  NSMutableDictionary *v66;
  NSMutableDictionary *renderPipelineStates;
  NSMutableDictionary *v68;
  NSMutableDictionary *residencySets;
  NSMutableDictionary *v70;
  NSMutableDictionary *resourceGroups;
  NSMutableDictionary *v72;
  NSMutableDictionary *resources;
  NSMutableDictionary *v74;
  NSMutableDictionary *samplerStates;
  NSMutableDictionary *v76;
  NSMutableDictionary *sharedEventHandles;
  NSMutableDictionary *v78;
  NSMutableDictionary *functionHandles;
  NSMutableDictionary *v80;
  NSMutableDictionary *functionPointerHandles;
  NSMutableDictionary *v82;
  NSMutableDictionary *functionPrivateArguments;
  NSMutableDictionary *v84;
  NSMutableDictionary *deadlineProfiles;
  NSMutableDictionary *v86;
  NSMutableDictionary *spatialScalers;
  NSMutableDictionary *v88;
  NSMutableDictionary *temporalScalers;
  NSMutableDictionary *v90;
  NSMutableDictionary *logStates;
  NSMutableDictionary *v92;
  NSMutableDictionary *mpsExternalPluginBases;
  uint64_t v94;
  NSMutableSet *v95;
  NSMutableSet *unusedResources;
  NSMutableDictionary *v97;
  NSMutableDictionary *bufferForHeap;
  objc_super v100;

  v5 = a3;
  v100.receiver = self;
  v100.super_class = (Class)GTMTLReplayObjectMap;
  v6 = -[GTMTLReplayObjectMap init](&v100, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_defaultDevice, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    argumentEncoders = v7->_argumentEncoders;
    v7->_argumentEncoders = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    commandBuffers = v7->_commandBuffers;
    v7->_commandBuffers = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    commandEncoders = v7->_commandEncoders;
    v7->_commandEncoders = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    ioCommandQueues = v7->_ioCommandQueues;
    v7->_ioCommandQueues = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    ioCommandBuffers = v7->_ioCommandBuffers;
    v7->_ioCommandBuffers = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    ioHandles = v7->_ioHandles;
    v7->_ioHandles = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    ioScratchBuffers = v7->_ioScratchBuffers;
    v7->_ioScratchBuffers = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    ioScratchBufferAllocators = v7->_ioScratchBufferAllocators;
    v7->_ioScratchBufferAllocators = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    commandQueues = v7->_commandQueues;
    v7->_commandQueues = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    computePipelineStates = v7->_computePipelineStates;
    v7->_computePipelineStates = v26;

    v28 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    counterSampleBuffers = v7->_counterSampleBuffers;
    v7->_counterSampleBuffers = v28;

    v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    depthStencilStates = v7->_depthStencilStates;
    v7->_depthStencilStates = v30;

    v32 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    devices = v7->_devices;
    v7->_devices = v32;

    v34 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    drawables = v7->_drawables;
    v7->_drawables = v34;

    v36 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    events = v7->_events;
    v7->_events = v36;

    v38 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    fences = v7->_fences;
    v7->_fences = v38;

    v40 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    functions = v7->_functions;
    v7->_functions = v40;

    v42 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    heaps = v7->_heaps;
    v7->_heaps = v42;

    v44 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    indirectComputeCommands = v7->_indirectComputeCommands;
    v7->_indirectComputeCommands = v44;

    v46 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    indirectRenderCommands = v7->_indirectRenderCommands;
    v7->_indirectRenderCommands = v46;

    v48 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    iosurfaces = v7->_iosurfaces;
    v7->_iosurfaces = v48;

    v50 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    layers = v7->_layers;
    v7->_layers = v50;

    v52 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    libraries = v7->_libraries;
    v7->_libraries = v52;

    v54 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    dynamicLibraries = v7->_dynamicLibraries;
    v7->_dynamicLibraries = v54;

    v56 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    motionEstimationPipelines = v7->_motionEstimationPipelines;
    v7->_motionEstimationPipelines = v56;

    v58 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    parallelRenderCommandEncoders = v7->_parallelRenderCommandEncoders;
    v7->_parallelRenderCommandEncoders = v58;

    v60 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    objectPayloadBinding = v7->_objectPayloadBinding;
    v7->_objectPayloadBinding = v60;

    v62 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pipelineLibraries = v7->_pipelineLibraries;
    v7->_pipelineLibraries = v62;

    v64 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    rasterizationRateMaps = v7->_rasterizationRateMaps;
    v7->_rasterizationRateMaps = v64;

    v66 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    renderPipelineStates = v7->_renderPipelineStates;
    v7->_renderPipelineStates = v66;

    v68 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    residencySets = v7->_residencySets;
    v7->_residencySets = v68;

    v70 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    resourceGroups = v7->_resourceGroups;
    v7->_resourceGroups = v70;

    v72 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    resources = v7->_resources;
    v7->_resources = v72;

    v74 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    samplerStates = v7->_samplerStates;
    v7->_samplerStates = v74;

    v76 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sharedEventHandles = v7->_sharedEventHandles;
    v7->_sharedEventHandles = v76;

    v78 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    functionHandles = v7->_functionHandles;
    v7->_functionHandles = v78;

    v80 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    functionPointerHandles = v7->_functionPointerHandles;
    v7->_functionPointerHandles = v80;

    v82 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    functionPrivateArguments = v7->_functionPrivateArguments;
    v7->_functionPrivateArguments = v82;

    v84 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deadlineProfiles = v7->_deadlineProfiles;
    v7->_deadlineProfiles = v84;

    v86 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    spatialScalers = v7->_spatialScalers;
    v7->_spatialScalers = v86;

    v88 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    temporalScalers = v7->_temporalScalers;
    v7->_temporalScalers = v88;

    v90 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    logStates = v7->_logStates;
    v7->_logStates = v90;

    v92 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mpsExternalPluginBases = v7->_mpsExternalPluginBases;
    v7->_mpsExternalPluginBases = v92;

    v7->_layerClass = (Class)objc_opt_class(DYMetalLayer, v94);
    v95 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    unusedResources = v7->_unusedResources;
    v7->_unusedResources = v95;

    v97 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bufferForHeap = v7->_bufferForHeap;
    v7->_bufferForHeap = v97;

  }
  return v7;
}

- (GTMTLReplayObjectMap)initWithObjectMap:(id)a3
{
  id v4;
  GTMTLReplayObjectMap *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *argumentEncoders;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *commandBuffers;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *commandEncoders;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *commandQueues;
  void *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *ioCommandBuffers;
  void *v20;
  NSMutableDictionary *v21;
  NSMutableDictionary *ioScratchBuffers;
  void *v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *ioScratchBufferAllocators;
  void *v26;
  NSMutableDictionary *v27;
  NSMutableDictionary *ioHandles;
  void *v29;
  NSMutableDictionary *v30;
  NSMutableDictionary *ioCommandQueues;
  void *v32;
  NSMutableDictionary *v33;
  NSMutableDictionary *computePipelineStates;
  void *v35;
  NSMutableDictionary *v36;
  NSMutableDictionary *counterSampleBuffers;
  void *v38;
  NSMutableDictionary *v39;
  NSMutableDictionary *depthStencilStates;
  void *v41;
  NSMutableDictionary *v42;
  NSMutableDictionary *devices;
  void *v44;
  NSMutableDictionary *v45;
  NSMutableDictionary *drawables;
  void *v47;
  NSMutableDictionary *v48;
  NSMutableDictionary *events;
  void *v50;
  NSMutableDictionary *v51;
  NSMutableDictionary *fences;
  void *v53;
  NSMutableDictionary *v54;
  NSMutableDictionary *functions;
  void *v56;
  NSMutableDictionary *v57;
  NSMutableDictionary *heaps;
  void *v59;
  NSMutableDictionary *v60;
  NSMutableDictionary *indirectComputeCommands;
  void *v62;
  NSMutableDictionary *v63;
  NSMutableDictionary *indirectRenderCommands;
  void *v65;
  NSMutableDictionary *v66;
  NSMutableDictionary *iosurfaces;
  void *v68;
  NSMutableDictionary *v69;
  NSMutableDictionary *layers;
  void *v71;
  NSMutableDictionary *v72;
  NSMutableDictionary *libraries;
  void *v74;
  NSMutableDictionary *v75;
  NSMutableDictionary *dynamicLibraries;
  void *v77;
  NSMutableDictionary *v78;
  NSMutableDictionary *motionEstimationPipelines;
  void *v80;
  NSMutableDictionary *v81;
  NSMutableDictionary *parallelRenderCommandEncoders;
  void *v83;
  NSMutableDictionary *v84;
  NSMutableDictionary *objectPayloadBinding;
  void *v86;
  NSMutableDictionary *v87;
  NSMutableDictionary *pipelineLibraries;
  void *v89;
  NSMutableDictionary *v90;
  NSMutableDictionary *rasterizationRateMaps;
  void *v92;
  NSMutableDictionary *v93;
  NSMutableDictionary *renderPipelineStates;
  void *v95;
  NSMutableDictionary *v96;
  NSMutableDictionary *residencySets;
  void *v98;
  NSMutableDictionary *v99;
  NSMutableDictionary *resourceGroups;
  void *v101;
  NSMutableDictionary *v102;
  NSMutableDictionary *resources;
  void *v104;
  NSMutableDictionary *v105;
  NSMutableDictionary *samplerStates;
  void *v107;
  NSMutableDictionary *v108;
  NSMutableDictionary *sharedEventHandles;
  void *v110;
  NSMutableDictionary *v111;
  NSMutableDictionary *functionHandles;
  void *v113;
  NSMutableDictionary *v114;
  NSMutableDictionary *functionPointerHandles;
  void *v116;
  NSMutableDictionary *v117;
  NSMutableDictionary *functionPrivateArguments;
  void *v119;
  NSMutableDictionary *v120;
  NSMutableDictionary *mpsExternalPluginBases;
  void *v122;
  NSMutableDictionary *v123;
  NSMutableDictionary *deadlineProfiles;
  void *v125;
  NSMutableDictionary *v126;
  NSMutableDictionary *spatialScalers;
  void *v128;
  NSMutableDictionary *v129;
  NSMutableDictionary *temporalScalers;
  void *v131;
  NSMutableDictionary *v132;
  NSMutableDictionary *logStates;
  void *v134;
  GTMTLReplayObjectMap *v135;
  objc_super v137;

  v4 = a3;
  v137.receiver = self;
  v137.super_class = (Class)GTMTLReplayObjectMap;
  v5 = -[GTMTLReplayObjectMap init](&v137, "init");

  if (v5)
  {
    objc_storeStrong((id *)&v5->_defaultDevice, *((id *)v4 + 58));
    objc_storeStrong((id *)&v5->_defaultCommandQueue, *((id *)v4 + 59));
    if (objc_msgSend(*((id *)v4 + 1), "count"))
    {
      v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 1), "allKeys"));
      argumentEncoders = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", argumentEncoders));
      objc_storeStrong((id *)&v5->_argumentEncoders, v8);

    }
    else
    {
      v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      argumentEncoders = v5->_argumentEncoders;
      v5->_argumentEncoders = v6;
    }

    if (objc_msgSend(*((id *)v4 + 2), "count"))
    {
      v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 2), "allKeys"));
      commandBuffers = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v9));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", commandBuffers));
      objc_storeStrong((id *)&v5->_commandBuffers, v11);

    }
    else
    {
      v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      commandBuffers = v5->_commandBuffers;
      v5->_commandBuffers = v9;
    }

    if (objc_msgSend(*((id *)v4 + 3), "count"))
    {
      v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 3), "allKeys"));
      commandEncoders = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v12));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", commandEncoders));
      objc_storeStrong((id *)&v5->_commandEncoders, v14);

    }
    else
    {
      v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      commandEncoders = v5->_commandEncoders;
      v5->_commandEncoders = v12;
    }

    if (objc_msgSend(*((id *)v4 + 4), "count"))
    {
      v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 4), "allKeys"));
      commandQueues = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v15));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", commandQueues));
      objc_storeStrong((id *)&v5->_commandQueues, v17);

    }
    else
    {
      v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      commandQueues = v5->_commandQueues;
      v5->_commandQueues = v15;
    }

    if (objc_msgSend(*((id *)v4 + 5), "count"))
    {
      v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 5), "allKeys"));
      ioCommandBuffers = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", ioCommandBuffers));
      objc_storeStrong((id *)&v5->_ioCommandBuffers, v20);

    }
    else
    {
      v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      ioCommandBuffers = v5->_ioCommandBuffers;
      v5->_ioCommandBuffers = v18;
    }

    if (objc_msgSend(*((id *)v4 + 7), "count"))
    {
      v21 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 7), "allKeys"));
      ioScratchBuffers = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v21));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", ioScratchBuffers));
      objc_storeStrong((id *)&v5->_ioScratchBuffers, v23);

    }
    else
    {
      v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      ioScratchBuffers = v5->_ioScratchBuffers;
      v5->_ioScratchBuffers = v21;
    }

    if (objc_msgSend(*((id *)v4 + 8), "count"))
    {
      v24 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 8), "allKeys"));
      ioScratchBufferAllocators = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v24));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", ioScratchBufferAllocators));
      objc_storeStrong((id *)&v5->_ioScratchBufferAllocators, v26);

    }
    else
    {
      v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      ioScratchBufferAllocators = v5->_ioScratchBufferAllocators;
      v5->_ioScratchBufferAllocators = v24;
    }

    if (objc_msgSend(*((id *)v4 + 6), "count"))
    {
      v27 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 6), "allKeys"));
      ioHandles = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v27));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", ioHandles));
      objc_storeStrong((id *)&v5->_ioHandles, v29);

    }
    else
    {
      v27 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      ioHandles = v5->_ioHandles;
      v5->_ioHandles = v27;
    }

    if (objc_msgSend(*((id *)v4 + 9), "count"))
    {
      v30 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 9), "allKeys"));
      ioCommandQueues = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v30));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", ioCommandQueues));
      objc_storeStrong((id *)&v5->_ioCommandQueues, v32);

    }
    else
    {
      v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      ioCommandQueues = v5->_ioCommandQueues;
      v5->_ioCommandQueues = v30;
    }

    if (objc_msgSend(*((id *)v4 + 10), "count"))
    {
      v33 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 10), "allKeys"));
      computePipelineStates = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v33));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", computePipelineStates));
      objc_storeStrong((id *)&v5->_computePipelineStates, v35);

    }
    else
    {
      v33 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      computePipelineStates = v5->_computePipelineStates;
      v5->_computePipelineStates = v33;
    }

    if (objc_msgSend(*((id *)v4 + 11), "count"))
    {
      v36 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 11), "allKeys"));
      counterSampleBuffers = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v36));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", counterSampleBuffers));
      objc_storeStrong((id *)&v5->_counterSampleBuffers, v38);

    }
    else
    {
      v36 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      counterSampleBuffers = v5->_counterSampleBuffers;
      v5->_counterSampleBuffers = v36;
    }

    if (objc_msgSend(*((id *)v4 + 12), "count"))
    {
      v39 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 12), "allKeys"));
      depthStencilStates = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v39));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", depthStencilStates));
      objc_storeStrong((id *)&v5->_depthStencilStates, v41);

    }
    else
    {
      v39 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      depthStencilStates = v5->_depthStencilStates;
      v5->_depthStencilStates = v39;
    }

    if (objc_msgSend(*((id *)v4 + 13), "count"))
    {
      v42 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 13), "allKeys"));
      devices = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v42));
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", devices));
      objc_storeStrong((id *)&v5->_devices, v44);

    }
    else
    {
      v42 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      devices = v5->_devices;
      v5->_devices = v42;
    }

    if (objc_msgSend(*((id *)v4 + 14), "count"))
    {
      v45 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 14), "allKeys"));
      drawables = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v45));
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", drawables));
      objc_storeStrong((id *)&v5->_drawables, v47);

    }
    else
    {
      v45 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      drawables = v5->_drawables;
      v5->_drawables = v45;
    }

    if (objc_msgSend(*((id *)v4 + 15), "count"))
    {
      v48 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 15), "allKeys"));
      events = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v48));
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", events));
      objc_storeStrong((id *)&v5->_events, v50);

    }
    else
    {
      v48 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      events = v5->_events;
      v5->_events = v48;
    }

    if (objc_msgSend(*((id *)v4 + 16), "count"))
    {
      v51 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 16), "allKeys"));
      fences = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v51));
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", fences));
      objc_storeStrong((id *)&v5->_fences, v53);

    }
    else
    {
      v51 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      fences = v5->_fences;
      v5->_fences = v51;
    }

    if (objc_msgSend(*((id *)v4 + 17), "count"))
    {
      v54 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 17), "allKeys"));
      functions = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v54));
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", functions));
      objc_storeStrong((id *)&v5->_functions, v56);

    }
    else
    {
      v54 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      functions = v5->_functions;
      v5->_functions = v54;
    }

    if (objc_msgSend(*((id *)v4 + 18), "count"))
    {
      v57 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 18), "allKeys"));
      heaps = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v57));
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", heaps));
      objc_storeStrong((id *)&v5->_heaps, v59);

    }
    else
    {
      v57 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      heaps = v5->_heaps;
      v5->_heaps = v57;
    }

    if (objc_msgSend(*((id *)v4 + 19), "count"))
    {
      v60 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 19), "allKeys"));
      indirectComputeCommands = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v60));
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", indirectComputeCommands));
      objc_storeStrong((id *)&v5->_indirectComputeCommands, v62);

    }
    else
    {
      v60 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      indirectComputeCommands = v5->_indirectComputeCommands;
      v5->_indirectComputeCommands = v60;
    }

    if (objc_msgSend(*((id *)v4 + 20), "count"))
    {
      v63 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 20), "allKeys"));
      indirectRenderCommands = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v63));
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", indirectRenderCommands));
      objc_storeStrong((id *)&v5->_indirectRenderCommands, v65);

    }
    else
    {
      v63 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      indirectRenderCommands = v5->_indirectRenderCommands;
      v5->_indirectRenderCommands = v63;
    }

    if (objc_msgSend(*((id *)v4 + 21), "count"))
    {
      v66 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 21), "allKeys"));
      iosurfaces = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v66));
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", iosurfaces));
      objc_storeStrong((id *)&v5->_iosurfaces, v68);

    }
    else
    {
      v66 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      iosurfaces = v5->_iosurfaces;
      v5->_iosurfaces = v66;
    }

    if (objc_msgSend(*((id *)v4 + 22), "count"))
    {
      v69 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 22), "allKeys"));
      layers = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v69));
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", layers));
      objc_storeStrong((id *)&v5->_layers, v71);

    }
    else
    {
      v69 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      layers = v5->_layers;
      v5->_layers = v69;
    }

    if (objc_msgSend(*((id *)v4 + 23), "count"))
    {
      v72 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 23), "allKeys"));
      libraries = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v72));
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", libraries));
      objc_storeStrong((id *)&v5->_libraries, v74);

    }
    else
    {
      v72 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      libraries = v5->_libraries;
      v5->_libraries = v72;
    }

    if (objc_msgSend(*((id *)v4 + 24), "count"))
    {
      v75 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 24), "allKeys"));
      dynamicLibraries = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v75));
      v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", dynamicLibraries));
      objc_storeStrong((id *)&v5->_dynamicLibraries, v77);

    }
    else
    {
      v75 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      dynamicLibraries = v5->_dynamicLibraries;
      v5->_dynamicLibraries = v75;
    }

    if (objc_msgSend(*((id *)v4 + 25), "count"))
    {
      v78 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 25), "allKeys"));
      motionEstimationPipelines = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v78));
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", motionEstimationPipelines));
      objc_storeStrong((id *)&v5->_motionEstimationPipelines, v80);

    }
    else
    {
      v78 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      motionEstimationPipelines = v5->_motionEstimationPipelines;
      v5->_motionEstimationPipelines = v78;
    }

    if (objc_msgSend(*((id *)v4 + 26), "count"))
    {
      v81 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 26), "allKeys"));
      parallelRenderCommandEncoders = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v81));
      v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", parallelRenderCommandEncoders));
      objc_storeStrong((id *)&v5->_parallelRenderCommandEncoders, v83);

    }
    else
    {
      v81 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      parallelRenderCommandEncoders = v5->_parallelRenderCommandEncoders;
      v5->_parallelRenderCommandEncoders = v81;
    }

    if (objc_msgSend(*((id *)v4 + 27), "count"))
    {
      v84 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 27), "allKeys"));
      objectPayloadBinding = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v84));
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", objectPayloadBinding));
      objc_storeStrong((id *)&v5->_objectPayloadBinding, v86);

    }
    else
    {
      v84 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      objectPayloadBinding = v5->_objectPayloadBinding;
      v5->_objectPayloadBinding = v84;
    }

    if (objc_msgSend(*((id *)v4 + 28), "count"))
    {
      v87 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 28), "allKeys"));
      pipelineLibraries = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v87));
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", pipelineLibraries));
      objc_storeStrong((id *)&v5->_pipelineLibraries, v89);

    }
    else
    {
      v87 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      pipelineLibraries = v5->_pipelineLibraries;
      v5->_pipelineLibraries = v87;
    }

    if (objc_msgSend(*((id *)v4 + 29), "count"))
    {
      v90 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 29), "allKeys"));
      rasterizationRateMaps = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v90));
      v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", rasterizationRateMaps));
      objc_storeStrong((id *)&v5->_rasterizationRateMaps, v92);

    }
    else
    {
      v90 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      rasterizationRateMaps = v5->_rasterizationRateMaps;
      v5->_rasterizationRateMaps = v90;
    }

    if (objc_msgSend(*((id *)v4 + 30), "count"))
    {
      v93 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 30), "allKeys"));
      renderPipelineStates = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v93));
      v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", renderPipelineStates));
      objc_storeStrong((id *)&v5->_renderPipelineStates, v95);

    }
    else
    {
      v93 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      renderPipelineStates = v5->_renderPipelineStates;
      v5->_renderPipelineStates = v93;
    }

    if (objc_msgSend(*((id *)v4 + 31), "count"))
    {
      v96 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 31), "allKeys"));
      residencySets = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v96));
      v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", residencySets));
      objc_storeStrong((id *)&v5->_residencySets, v98);

    }
    else
    {
      v96 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      residencySets = v5->_residencySets;
      v5->_residencySets = v96;
    }

    if (objc_msgSend(*((id *)v4 + 32), "count"))
    {
      v99 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 32), "allKeys"));
      resourceGroups = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v99));
      v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", resourceGroups));
      objc_storeStrong((id *)&v5->_resourceGroups, v101);

    }
    else
    {
      v99 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      resourceGroups = v5->_resourceGroups;
      v5->_resourceGroups = v99;
    }

    if (objc_msgSend(*((id *)v4 + 33), "count"))
    {
      v102 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 33), "allKeys"));
      resources = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v102));
      v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", resources));
      objc_storeStrong((id *)&v5->_resources, v104);

    }
    else
    {
      v102 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      resources = v5->_resources;
      v5->_resources = v102;
    }

    if (objc_msgSend(*((id *)v4 + 35), "count"))
    {
      v105 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 35), "allKeys"));
      samplerStates = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v105));
      v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", samplerStates));
      objc_storeStrong((id *)&v5->_samplerStates, v107);

    }
    else
    {
      v105 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      samplerStates = v5->_samplerStates;
      v5->_samplerStates = v105;
    }

    if (objc_msgSend(*((id *)v4 + 36), "count"))
    {
      v108 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 36), "allKeys"));
      sharedEventHandles = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v108));
      v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", sharedEventHandles));
      objc_storeStrong((id *)&v5->_sharedEventHandles, v110);

    }
    else
    {
      v108 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      sharedEventHandles = v5->_sharedEventHandles;
      v5->_sharedEventHandles = v108;
    }

    if (objc_msgSend(*((id *)v4 + 37), "count"))
    {
      v111 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 37), "allKeys"));
      functionHandles = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v111));
      v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", functionHandles));
      objc_storeStrong((id *)&v5->_functionHandles, v113);

    }
    else
    {
      v111 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      functionHandles = v5->_functionHandles;
      v5->_functionHandles = v111;
    }

    if (objc_msgSend(*((id *)v4 + 39), "count"))
    {
      v114 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 39), "allKeys"));
      functionPointerHandles = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v114));
      v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", functionPointerHandles));
      objc_storeStrong((id *)&v5->_functionPointerHandles, v116);

    }
    else
    {
      v114 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      functionPointerHandles = v5->_functionPointerHandles;
      v5->_functionPointerHandles = v114;
    }

    if (objc_msgSend(*((id *)v4 + 40), "count"))
    {
      v117 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 40), "allKeys"));
      functionPrivateArguments = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v117));
      v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", functionPrivateArguments));
      objc_storeStrong((id *)&v5->_functionPrivateArguments, v119);

    }
    else
    {
      v117 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      functionPrivateArguments = v5->_functionPrivateArguments;
      v5->_functionPrivateArguments = v117;
    }

    if (objc_msgSend(*((id *)v4 + 41), "count"))
    {
      v120 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 41), "allKeys"));
      mpsExternalPluginBases = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v120));
      v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", mpsExternalPluginBases));
      objc_storeStrong((id *)&v5->_mpsExternalPluginBases, v122);

    }
    else
    {
      v120 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      mpsExternalPluginBases = v5->_mpsExternalPluginBases;
      v5->_mpsExternalPluginBases = v120;
    }

    if (objc_msgSend(*((id *)v4 + 42), "count"))
    {
      v123 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 42), "allKeys"));
      deadlineProfiles = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v123));
      v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", deadlineProfiles));
      objc_storeStrong((id *)&v5->_deadlineProfiles, v125);

    }
    else
    {
      v123 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      deadlineProfiles = v5->_deadlineProfiles;
      v5->_deadlineProfiles = v123;
    }

    if (objc_msgSend(*((id *)v4 + 43), "count"))
    {
      v126 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 43), "allKeys"));
      spatialScalers = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v126));
      v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", spatialScalers));
      objc_storeStrong((id *)&v5->_spatialScalers, v128);

    }
    else
    {
      v126 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      spatialScalers = v5->_spatialScalers;
      v5->_spatialScalers = v126;
    }

    if (objc_msgSend(*((id *)v4 + 44), "count"))
    {
      v129 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 44), "allKeys"));
      temporalScalers = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v129));
      v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", temporalScalers));
      objc_storeStrong((id *)&v5->_temporalScalers, v131);

    }
    else
    {
      v129 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      temporalScalers = v5->_temporalScalers;
      v5->_temporalScalers = v129;
    }

    if (objc_msgSend(*((id *)v4 + 45), "count"))
    {
      v132 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v4 + 45), "allKeys"));
      logStates = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary sharedKeySetForKeys:](NSDictionary, "sharedKeySetForKeys:", v132));
      v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithSharedKeySet:](NSMutableDictionary, "dictionaryWithSharedKeySet:", logStates));
      objc_storeStrong((id *)&v5->_logStates, v134);

    }
    else
    {
      v132 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      logStates = v5->_logStates;
      v5->_logStates = v132;
    }

    v5->_layerClass = (Class)*((_QWORD *)v4 + 47);
    -[GTMTLReplayObjectMap addEntriesFromObjectMap:](v5, "addEntriesFromObjectMap:", v4);
  }
  v135 = v5;

  return v135;
}

- (void)addEntriesFromObjectMap:(id)a3
{
  NSMutableDictionary *argumentEncoders;
  uint64_t v5;
  _QWORD *v6;
  NSMutableSet *unusedResources;
  uint64_t v8;

  argumentEncoders = self->_argumentEncoders;
  v5 = *((_QWORD *)a3 + 1);
  v6 = a3;
  -[NSMutableDictionary addEntriesFromDictionary:](argumentEncoders, "addEntriesFromDictionary:", v5);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_commandBuffers, "addEntriesFromDictionary:", v6[2]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_commandEncoders, "addEntriesFromDictionary:", v6[3]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_commandQueues, "addEntriesFromDictionary:", v6[4]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_ioCommandQueues, "addEntriesFromDictionary:", v6[9]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_ioCommandBuffers, "addEntriesFromDictionary:", v6[5]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_ioScratchBuffers, "addEntriesFromDictionary:", v6[7]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_ioScratchBufferAllocators, "addEntriesFromDictionary:", v6[8]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_ioHandles, "addEntriesFromDictionary:", v6[6]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_computePipelineStates, "addEntriesFromDictionary:", v6[10]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_counterSampleBuffers, "addEntriesFromDictionary:", v6[11]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_depthStencilStates, "addEntriesFromDictionary:", v6[12]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_devices, "addEntriesFromDictionary:", v6[13]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_drawables, "addEntriesFromDictionary:", v6[14]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_events, "addEntriesFromDictionary:", v6[15]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_fences, "addEntriesFromDictionary:", v6[16]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_functions, "addEntriesFromDictionary:", v6[17]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_heaps, "addEntriesFromDictionary:", v6[18]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_indirectComputeCommands, "addEntriesFromDictionary:", v6[19]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_indirectRenderCommands, "addEntriesFromDictionary:", v6[20]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_iosurfaces, "addEntriesFromDictionary:", v6[21]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_layers, "addEntriesFromDictionary:", v6[22]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_libraries, "addEntriesFromDictionary:", v6[23]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_dynamicLibraries, "addEntriesFromDictionary:", v6[24]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_motionEstimationPipelines, "addEntriesFromDictionary:", v6[25]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_parallelRenderCommandEncoders, "addEntriesFromDictionary:", v6[26]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_objectPayloadBinding, "addEntriesFromDictionary:", v6[27]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_pipelineLibraries, "addEntriesFromDictionary:", v6[28]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_rasterizationRateMaps, "addEntriesFromDictionary:", v6[29]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_renderPipelineStates, "addEntriesFromDictionary:", v6[30]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_residencySets, "addEntriesFromDictionary:", v6[31]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_resourceGroups, "addEntriesFromDictionary:", v6[33]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_resources, "addEntriesFromDictionary:", v6[33]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_samplerStates, "addEntriesFromDictionary:", v6[35]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_sharedEventHandles, "addEntriesFromDictionary:", v6[36]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_functionHandles, "addEntriesFromDictionary:", v6[37]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_functionPointerHandles, "addEntriesFromDictionary:", v6[39]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_functionPrivateArguments, "addEntriesFromDictionary:", v6[40]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_deadlineProfiles, "addEntriesFromDictionary:", v6[42]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_mpsExternalPluginBases, "addEntriesFromDictionary:", v6[41]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_spatialScalers, "addEntriesFromDictionary:", v6[43]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_temporalScalers, "addEntriesFromDictionary:", v6[44]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_logStates, "addEntriesFromDictionary:", v6[45]);
  unusedResources = self->_unusedResources;
  v8 = v6[46];

  -[NSMutableSet unionSet:](unusedResources, "unionSet:", v8);
}

- (void)removeResourcesForKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectsForKeys:notFoundMarker:](self->_resources, "objectsForKeys:notFoundMarker:", v4, v6, 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11);
        if (v12 != v6)
          MakeRootResourceAliasable(v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[NSMutableDictionary removeObjectsForKeys:](self->_argumentEncoders, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_commandQueues, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_ioCommandQueues, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_computePipelineStates, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_counterSampleBuffers, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_depthStencilStates, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_drawables, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_events, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_fences, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_functions, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_heaps, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_indirectComputeCommands, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_indirectRenderCommands, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_iosurfaces, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_layers, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_libraries, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_dynamicLibraries, "removeObjectForKey:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_motionEstimationPipelines, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_objectPayloadBinding, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_pipelineLibraries, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_rasterizationRateMaps, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_renderPipelineStates, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_residencySets, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_resourceGroups, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_resources, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_samplerStates, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_functionHandles, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_functionPointerHandles, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_functionPrivateArguments, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_deadlineProfiles, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_spatialScalers, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_temporalScalers, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_logStates, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_mpsExternalPluginBases, "removeObjectsForKeys:", v4);

  objc_autoreleasePoolPop(v5);
}

- (Class)layerClass
{
  return self->_layerClass;
}

- (void)setLayerClass:(Class)a3
{
  NSMutableDictionary *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  NSMutableDictionary *layers;
  NSMutableDictionary *obj;
  _OWORD v16[8];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  if (self->_layerClass != a3)
  {
    v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSMutableDictionary count](self->_layers, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = self->_layers;
    v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_layers, "objectForKeyedSubscript:", v10));
          v12 = objc_alloc_init(a3);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "device"));
          objc_msgSend(v12, "setDevice:", v13);

          objc_msgSend(v12, "setColorspace:", objc_msgSend(v11, "colorspace"));
          objc_msgSend(v12, "setPixelFormat:", objc_msgSend(v11, "pixelFormat"));
          objc_msgSend(v12, "setFramebufferOnly:", objc_msgSend(v11, "framebufferOnly"));
          objc_msgSend(v11, "drawableSize");
          objc_msgSend(v12, "setDrawableSize:");
          objc_msgSend(v11, "bounds");
          objc_msgSend(v12, "setBounds:");
          objc_msgSend(v11, "contentsScale");
          objc_msgSend(v12, "setContentsScale:");
          if (v11)
          {
            objc_msgSend(v11, "transform");
          }
          else
          {
            v23 = 0u;
            v24 = 0u;
            v21 = 0u;
            v22 = 0u;
            v19 = 0u;
            v20 = 0u;
            v17 = 0u;
            v18 = 0u;
          }
          v16[4] = v21;
          v16[5] = v22;
          v16[6] = v23;
          v16[7] = v24;
          v16[0] = v17;
          v16[1] = v18;
          v16[2] = v19;
          v16[3] = v20;
          objc_msgSend(v12, "setTransform:", v16);
          objc_msgSend(v11, "anchorPoint");
          objc_msgSend(v12, "setAnchorPoint:");
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v12, v10);

        }
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v7);
    }

    layers = self->_layers;
    self->_layers = v5;

    self->_layerClass = a3;
  }
}

- (void)setArgumentEncoder:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *argumentEncoders;
  id v6;
  id v7;

  argumentEncoders = self->_argumentEncoders;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](argumentEncoders, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setBlitCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *commandEncoders;
  id v6;
  id v7;

  commandEncoders = self->_commandEncoders;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](commandEncoders, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setBuffer:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *resources;
  id v6;
  id v7;

  resources = self->_resources;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](resources, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setBuffer:(id)a3 forHeapKey:(unint64_t)a4
{
  NSMutableDictionary *bufferForHeap;
  id v6;
  id v7;

  bufferForHeap = self->_bufferForHeap;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](bufferForHeap, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setCommandBuffer:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *commandBuffers;
  id v6;
  id v7;

  commandBuffers = self->_commandBuffers;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](commandBuffers, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setCommandQueue:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *commandQueues;
  id v6;
  id v7;

  commandQueues = self->_commandQueues;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](commandQueues, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setIOCommandQueue:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *ioCommandQueues;
  id v6;
  id v7;

  ioCommandQueues = self->_ioCommandQueues;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](ioCommandQueues, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setIOCommandBuffer:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *ioCommandBuffers;
  id v6;
  id v7;

  ioCommandBuffers = self->_ioCommandBuffers;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](ioCommandBuffers, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setIOScratchBuffer:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *ioScratchBuffers;
  id v6;
  id v7;

  ioScratchBuffers = self->_ioScratchBuffers;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](ioScratchBuffers, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setIOScratchBufferAllocator:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *ioScratchBufferAllocators;
  id v6;
  id v7;

  ioScratchBufferAllocators = self->_ioScratchBufferAllocators;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](ioScratchBufferAllocators, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setComputeCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *commandEncoders;
  id v6;
  id v7;

  commandEncoders = self->_commandEncoders;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](commandEncoders, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setComputePipelineState:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *computePipelineStates;
  id v6;
  id v7;

  computePipelineStates = self->_computePipelineStates;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](computePipelineStates, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setCounterSampleBuffer:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *counterSampleBuffers;
  id v6;
  id v7;

  counterSampleBuffers = self->_counterSampleBuffers;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](counterSampleBuffers, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setDebugCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *commandEncoders;
  id v6;
  id v7;

  commandEncoders = self->_commandEncoders;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](commandEncoders, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setDepthStencilState:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *depthStencilStates;
  id v6;
  id v7;

  depthStencilStates = self->_depthStencilStates;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](depthStencilStates, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setDevice:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *devices;
  id v6;
  id v7;

  devices = self->_devices;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setDrawable:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *drawables;
  id v6;
  id v7;

  drawables = self->_drawables;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](drawables, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setEvent:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *events;
  id v6;
  id v7;

  events = self->_events;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](events, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setFence:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *fences;
  id v6;
  id v7;

  fences = self->_fences;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](fences, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setFunction:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *functions;
  id v6;
  id v7;

  functions = self->_functions;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](functions, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setHeap:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *heaps;
  id v6;
  id v7;

  heaps = self->_heaps;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](heaps, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setIndirectCommandBuffer:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *resources;
  id v6;
  id v7;

  resources = self->_resources;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](resources, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setIndirectComputeCommand:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *indirectComputeCommands;
  id v6;
  id v7;

  indirectComputeCommands = self->_indirectComputeCommands;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](indirectComputeCommands, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setIndirectRenderCommand:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *indirectRenderCommands;
  id v6;
  id v7;

  indirectRenderCommands = self->_indirectRenderCommands;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](indirectRenderCommands, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setLayer:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *layers;
  id v6;
  id v7;

  layers = self->_layers;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](layers, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setLibrary:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *libraries;
  id v6;
  id v7;

  libraries = self->_libraries;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](libraries, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setParallelRenderCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *parallelRenderCommandEncoders;
  id v6;
  id v7;

  parallelRenderCommandEncoders = self->_parallelRenderCommandEncoders;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](parallelRenderCommandEncoders, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setObjectPayloadBinding:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *objectPayloadBinding;
  id v6;
  id v7;

  objectPayloadBinding = self->_objectPayloadBinding;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](objectPayloadBinding, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setPipelineLibrarySPI:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *pipelineLibraries;
  id v6;
  id v7;

  pipelineLibraries = self->_pipelineLibraries;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](pipelineLibraries, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setRasterizationRateMap:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *rasterizationRateMaps;
  id v6;
  id v7;

  rasterizationRateMaps = self->_rasterizationRateMaps;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](rasterizationRateMaps, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setRenderCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *commandEncoders;
  id v6;
  id v7;

  commandEncoders = self->_commandEncoders;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](commandEncoders, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setRenderPipelineState:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *renderPipelineStates;
  id v6;
  id v7;

  renderPipelineStates = self->_renderPipelineStates;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](renderPipelineStates, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setResourceStateCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *commandEncoders;
  id v6;
  id v7;

  commandEncoders = self->_commandEncoders;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](commandEncoders, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setSamplerState:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *samplerStates;
  id v6;
  id v7;

  samplerStates = self->_samplerStates;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](samplerStates, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setSharedEvent:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *events;
  id v6;
  id v7;

  events = self->_events;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](events, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setSharedEventHandle:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *sharedEventHandles;
  id v6;
  id v7;

  sharedEventHandles = self->_sharedEventHandles;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](sharedEventHandles, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setTexture:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *resources;
  id v6;
  id v7;

  resources = self->_resources;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](resources, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setDynamicLibrary:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *dynamicLibraries;
  id v6;
  id v7;

  dynamicLibraries = self->_dynamicLibraries;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](dynamicLibraries, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setDynamicLibrary:(id)a3 forPath:(const char *)a4
{
  NSMutableDictionary *dynamicLibraries;
  id v6;
  id v7;

  dynamicLibraries = self->_dynamicLibraries;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](dynamicLibraries, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setVisibleFunctionTable:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *resources;
  id v6;
  id v7;

  resources = self->_resources;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](resources, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setFunctionHandle:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *functionHandles;
  id v6;
  id v7;

  functionHandles = self->_functionHandles;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](functionHandles, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setAccelerationStructureCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *commandEncoders;
  id v6;
  id v7;

  commandEncoders = self->_commandEncoders;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](commandEncoders, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setAccelerationStructure:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *resources;
  id v6;
  id v7;

  resources = self->_resources;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](resources, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setIntersectionFunctionTable:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *resources;
  id v6;
  id v7;

  resources = self->_resources;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](resources, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setResidencySet:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *residencySets;
  id v6;
  id v7;

  residencySets = self->_residencySets;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](residencySets, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setResourceGroupSPI:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *resourceGroups;
  id v6;
  id v7;

  resourceGroups = self->_resourceGroups;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](resourceGroups, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setLateEvalEvent:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *events;
  id v6;
  id v7;

  events = self->_events;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](events, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setFunctionPointerHandle:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *functionPointerHandles;
  id v6;
  id v7;

  functionPointerHandles = self->_functionPointerHandles;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](functionPointerHandles, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setFunctionPrivateArgument:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *functionPrivateArguments;
  id v6;
  id v7;

  functionPrivateArguments = self->_functionPrivateArguments;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](functionPrivateArguments, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setDeadlineProfile:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *deadlineProfiles;
  id v6;
  id v7;

  deadlineProfiles = self->_deadlineProfiles;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](deadlineProfiles, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setSpatialScaler:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *spatialScalers;
  id v6;
  id v7;

  spatialScalers = self->_spatialScalers;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](spatialScalers, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setTemporalScaler:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *temporalScalers;
  id v6;
  id v7;

  temporalScalers = self->_temporalScalers;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](temporalScalers, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setLogState:(id)a3 forKey:(unint64_t)a4
{
  NSMutableDictionary *logStates;
  id v6;
  id v7;

  logStates = self->_logStates;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](logStates, "setObject:forKeyedSubscript:", v6, v7);

}

- (CGRect)contentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentRect.origin.x;
  y = self->_contentRect.origin.y;
  width = self->_contentRect.size.width;
  height = self->_contentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)windowRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_windowRect.origin.x;
  y = self->_windowRect.origin.y;
  width = self->_windowRect.size.width;
  height = self->_windowRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)windowProperties
{
  return self->_windowProperties;
}

- (int64_t)interfaceOrientation
{
  return self->_orientation;
}

- (void)setContentRect:(CGRect)a3 windowRect:(CGRect)a4 properties:(id)a5
{
  self->_contentRect = a3;
  self->_windowRect = a4;
  objc_storeStrong((id *)&self->_windowProperties, a5);
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (id)accelerationStructureCommandEncoderForKey:(unint64_t)a3
{
  NSMutableDictionary *commandEncoders;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableSet *unusedResources;
  void *v11;

  commandEncoders = self->_commandEncoders;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](commandEncoders, "objectForKeyedSubscript:", v6));

  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MTLAccelerationStructureCommandEncoder))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)argumentEncoderForKey:(unint64_t)a3
{
  NSMutableDictionary *argumentEncoders;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  argumentEncoders = self->_argumentEncoders;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](argumentEncoders, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)blitCommandEncoderForKey:(unint64_t)a3
{
  NSMutableDictionary *commandEncoders;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableSet *unusedResources;
  void *v11;

  commandEncoders = self->_commandEncoders;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](commandEncoders, "objectForKeyedSubscript:", v6));

  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MTLBlitCommandEncoder))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)bufferForKey:(unint64_t)a3
{
  NSMutableDictionary *resources;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableSet *unusedResources;
  void *v11;

  resources = self->_resources;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resources, "objectForKeyedSubscript:", v6));

  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MTLBuffer))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)commandBufferForKey:(unint64_t)a3
{
  NSMutableDictionary *commandBuffers;
  void *v4;
  void *v5;

  commandBuffers = self->_commandBuffers;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](commandBuffers, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)iOCommandBufferForKey:(unint64_t)a3
{
  NSMutableDictionary *ioCommandBuffers;
  void *v4;
  void *v5;

  ioCommandBuffers = self->_ioCommandBuffers;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](ioCommandBuffers, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)iOHandleForKey:(unint64_t)a3
{
  NSMutableDictionary *ioHandles;
  void *v4;
  void *v5;

  ioHandles = self->_ioHandles;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](ioHandles, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)iOScratchBufferForKey:(unint64_t)a3
{
  NSMutableDictionary *ioScratchBuffers;
  void *v4;
  void *v5;

  ioScratchBuffers = self->_ioScratchBuffers;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](ioScratchBuffers, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)iOScratchBufferAllocatorForKey:(unint64_t)a3
{
  NSMutableDictionary *ioScratchBufferAllocators;
  void *v4;
  void *v5;

  ioScratchBufferAllocators = self->_ioScratchBufferAllocators;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](ioScratchBufferAllocators, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)iOCommandQueueForKey:(unint64_t)a3
{
  NSMutableDictionary *ioCommandQueues;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  ioCommandQueues = self->_ioCommandQueues;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](ioCommandQueues, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)commandQueueForKey:(unint64_t)a3
{
  NSMutableDictionary *commandQueues;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  commandQueues = self->_commandQueues;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](commandQueues, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)computeCommandEncoderForKey:(unint64_t)a3
{
  NSMutableDictionary *commandEncoders;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableSet *unusedResources;
  void *v11;

  commandEncoders = self->_commandEncoders;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](commandEncoders, "objectForKeyedSubscript:", v6));

  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MTLComputeCommandEncoder))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)computePipelineStateForKey:(unint64_t)a3
{
  NSMutableDictionary *computePipelineStates;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  computePipelineStates = self->_computePipelineStates;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](computePipelineStates, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)counterSampleBufferForKey:(unint64_t)a3
{
  NSMutableDictionary *counterSampleBuffers;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  counterSampleBuffers = self->_counterSampleBuffers;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](counterSampleBuffers, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)depthStencilStateForKey:(unint64_t)a3
{
  NSMutableDictionary *depthStencilStates;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  depthStencilStates = self->_depthStencilStates;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](depthStencilStates, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)deviceForKey:(unint64_t)a3
{
  return self->_defaultDevice;
}

- (id)drawableForKey:(unint64_t)a3
{
  NSMutableDictionary *drawables;
  void *v4;
  void *v5;

  drawables = self->_drawables;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](drawables, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)eventForKey:(unint64_t)a3
{
  NSMutableDictionary *events;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  events = self->_events;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](events, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)fenceForKey:(unint64_t)a3
{
  NSMutableDictionary *fences;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  fences = self->_fences;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](fences, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)functionForKey:(unint64_t)a3
{
  NSMutableDictionary *functions;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  functions = self->_functions;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](functions, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)heapForKey:(unint64_t)a3
{
  NSMutableDictionary *heaps;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  heaps = self->_heaps;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](heaps, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)indirectCommandBufferForKey:(unint64_t)a3
{
  NSMutableDictionary *resources;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  resources = self->_resources;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resources, "objectForKeyedSubscript:", v4));

  if (IsResourceIndirectCommandBuffer(v5))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)indirectComputeCommandForKey:(unint64_t)a3
{
  NSMutableDictionary *indirectComputeCommands;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  indirectComputeCommands = self->_indirectComputeCommands;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](indirectComputeCommands, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)indirectRenderCommandForKey:(unint64_t)a3
{
  NSMutableDictionary *indirectRenderCommands;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  indirectRenderCommands = self->_indirectRenderCommands;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](indirectRenderCommands, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)iosurfaceForProperties:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iosurfaces, "objectForKeyedSubscript:", v4));
  if (!v5)
  {
    v5 = objc_msgSend(objc_alloc((Class)IOSurface), "initWithProperties:", v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iosurfaces, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (id)layerForKey:(unint64_t)a3
{
  NSMutableDictionary *layers;
  void *v4;
  void *v5;

  layers = self->_layers;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](layers, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)libraryForKey:(unint64_t)a3
{
  NSMutableDictionary *libraries;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  libraries = self->_libraries;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](libraries, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)parallelRenderCommandEncoderForKey:(unint64_t)a3
{
  NSMutableDictionary *parallelRenderCommandEncoders;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  parallelRenderCommandEncoders = self->_parallelRenderCommandEncoders;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](parallelRenderCommandEncoders, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)objectPayloadBindingForKey:(unint64_t)a3
{
  NSMutableDictionary *objectPayloadBinding;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  objectPayloadBinding = self->_objectPayloadBinding;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](objectPayloadBinding, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)pipelineLibraryForKey:(unint64_t)a3
{
  NSMutableDictionary *pipelineLibraries;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  pipelineLibraries = self->_pipelineLibraries;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](pipelineLibraries, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)rasterizationRateMapForKey:(unint64_t)a3
{
  NSMutableDictionary *rasterizationRateMaps;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  rasterizationRateMaps = self->_rasterizationRateMaps;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](rasterizationRateMaps, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)residencySetForKey:(unint64_t)a3
{
  NSMutableDictionary *residencySets;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  residencySets = self->_residencySets;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](residencySets, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)renderCommandEncoderForKey:(unint64_t)a3
{
  NSMutableDictionary *commandEncoders;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableSet *unusedResources;
  void *v11;

  commandEncoders = self->_commandEncoders;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](commandEncoders, "objectForKeyedSubscript:", v6));

  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MTLRenderCommandEncoder))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)renderPipelineStateForKey:(unint64_t)a3
{
  NSMutableDictionary *renderPipelineStates;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  renderPipelineStates = self->_renderPipelineStates;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](renderPipelineStates, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)resourceForKey:(unint64_t)a3
{
  NSMutableDictionary *resources;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  resources = self->_resources;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resources, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)resourceStateCommandEncoderForKey:(unint64_t)a3
{
  NSMutableDictionary *commandEncoders;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableSet *unusedResources;
  void *v11;

  commandEncoders = self->_commandEncoders;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](commandEncoders, "objectForKeyedSubscript:", v6));

  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MTLResourceStateCommandEncoder))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)samplerStateForKey:(unint64_t)a3
{
  NSMutableDictionary *samplerStates;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  samplerStates = self->_samplerStates;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](samplerStates, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)sharedEventForKey:(unint64_t)a3
{
  NSMutableDictionary *events;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableSet *unusedResources;
  void *v11;

  events = self->_events;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](events, "objectForKeyedSubscript:", v6));

  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MTLSharedEvent))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)sharedEventHandleForKey:(unint64_t)a3
{
  NSMutableDictionary *sharedEventHandles;
  void *v4;
  void *v5;

  sharedEventHandles = self->_sharedEventHandles;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sharedEventHandles, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)textureForKey:(unint64_t)a3
{
  NSMutableDictionary *resources;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableSet *unusedResources;
  void *v11;

  resources = self->_resources;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resources, "objectForKeyedSubscript:", v6));

  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MTLTexture))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)binaryArchiveForKey:(unint64_t)a3
{
  return 0;
}

- (id)dynamicLibraryForKey:(unint64_t)a3
{
  NSMutableDictionary *dynamicLibraries;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  dynamicLibraries = self->_dynamicLibraries;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](dynamicLibraries, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)visibleFunctionTableForKey:(unint64_t)a3
{
  NSMutableDictionary *resources;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableSet *unusedResources;
  void *v11;

  resources = self->_resources;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resources, "objectForKeyedSubscript:", v6));

  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MTLVisibleFunctionTable))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)functionHandleForKey:(unint64_t)a3
{
  NSMutableDictionary *functionHandles;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  functionHandles = self->_functionHandles;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](functionHandles, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)accelerationStructureForKey:(unint64_t)a3
{
  NSMutableDictionary *resources;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableSet *unusedResources;
  void *v11;

  resources = self->_resources;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resources, "objectForKeyedSubscript:", v6));

  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MTLAccelerationStructure))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)intersectionFunctionTableForKey:(unint64_t)a3
{
  NSMutableDictionary *resources;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableSet *unusedResources;
  void *v11;

  resources = self->_resources;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resources, "objectForKeyedSubscript:", v6));

  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MTLIntersectionFunctionTable))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)resourceGroupSPIForKey:(unint64_t)a3
{
  NSMutableDictionary *resourceGroups;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  resourceGroups = self->_resourceGroups;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resourceGroups, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)lateEvalEventForKey:(unint64_t)a3
{
  NSMutableDictionary *events;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableSet *unusedResources;
  void *v11;

  events = self->_events;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](events, "objectForKeyedSubscript:", v6));

  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MTLLateEvalEvent))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)functionPointerHandleForKey:(unint64_t)a3
{
  NSMutableDictionary *functionPointerHandles;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  functionPointerHandles = self->_functionPointerHandles;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](functionPointerHandles, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)functionPrivateArgumentForKey:(unint64_t)a3
{
  NSMutableDictionary *functionPrivateArguments;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  functionPrivateArguments = self->_functionPrivateArguments;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](functionPrivateArguments, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)spatialScalerForKey:(unint64_t)a3
{
  NSMutableDictionary *spatialScalers;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  spatialScalers = self->_spatialScalers;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](spatialScalers, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)temporalScalerForKey:(unint64_t)a3
{
  NSMutableDictionary *temporalScalers;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  temporalScalers = self->_temporalScalers;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](temporalScalers, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)logStateForKey:(unint64_t)a3
{
  NSMutableDictionary *logStates;
  void *v6;
  void *v7;
  NSMutableSet *unusedResources;
  void *v9;

  logStates = self->_logStates;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](logStates, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }
  return v7;
}

- (id)bufferForHeapKey:(unint64_t)a3
{
  NSMutableDictionary *bufferForHeap;
  void *v4;
  void *v5;

  bufferForHeap = self->_bufferForHeap;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](bufferForHeap, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)allocationForKey:(unint64_t)a3
{
  NSMutableDictionary *resources;
  void *v6;
  void *v7;
  NSMutableDictionary *heaps;
  void *v9;

  resources = self->_resources;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resources, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    heaps = self->_heaps;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](heaps, "objectForKeyedSubscript:", v9));

  }
  return v7;
}

- (void)presentDrawableWithKey:(unint64_t)a3
{
  NSMutableDictionary *drawables;
  id v4;

  drawables = self->_drawables;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](drawables, "removeObjectForKey:", v4);

}

- (void)removeAliasableResourceForKey:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_resources, "objectForKeyedSubscript:"));
  v5 = v4;
  if (v4)
  {
    MakeRootResourceAliasable(v4);
    -[NSMutableDictionary removeObjectForKey:](self->_resources, "removeObjectForKey:", v6);
  }

}

- (void)removeArgumentEncoderForKey:(unint64_t)a3
{
  NSMutableDictionary *argumentEncoders;
  id v4;

  argumentEncoders = self->_argumentEncoders;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](argumentEncoders, "removeObjectForKey:", v4);

}

- (void)removeBlitCommandEncoderForKey:(unint64_t)a3
{
  NSMutableDictionary *commandEncoders;
  id v4;

  commandEncoders = self->_commandEncoders;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](commandEncoders, "removeObjectForKey:", v4);

}

- (void)removeBufferForKey:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[GTMTLReplayObjectMap removeAliasableResourceForKey:](self, "removeAliasableResourceForKey:", v4);

}

- (void)removeBufferForHeapKey:(unint64_t)a3
{
  NSMutableDictionary *bufferForHeap;
  id v4;

  bufferForHeap = self->_bufferForHeap;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](bufferForHeap, "removeObjectForKey:", v4);

}

- (void)removeCommandBufferForKey:(unint64_t)a3
{
  NSMutableDictionary *commandBuffers;
  id v4;

  commandBuffers = self->_commandBuffers;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](commandBuffers, "removeObjectForKey:", v4);

}

- (void)removeCommandQueueForKey:(unint64_t)a3
{
  NSMutableDictionary *commandQueues;
  id v4;

  commandQueues = self->_commandQueues;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](commandQueues, "removeObjectForKey:", v4);

}

- (void)removeIOCommandBufferForKey:(unint64_t)a3
{
  NSMutableDictionary *ioCommandBuffers;
  id v4;

  ioCommandBuffers = self->_ioCommandBuffers;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](ioCommandBuffers, "removeObjectForKey:", v4);

}

- (void)removeIOCommandQueueForKey:(unint64_t)a3
{
  NSMutableDictionary *ioCommandQueues;
  id v4;

  ioCommandQueues = self->_ioCommandQueues;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](ioCommandQueues, "removeObjectForKey:", v4);

}

- (void)removeIOHandleForKey:(unint64_t)a3
{
  NSMutableDictionary *ioHandles;
  id v4;

  ioHandles = self->_ioHandles;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](ioHandles, "removeObjectForKey:", v4);

}

- (void)removeIOScratchBufferForKey:(unint64_t)a3
{
  NSMutableDictionary *ioScratchBuffers;
  id v4;

  ioScratchBuffers = self->_ioScratchBuffers;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](ioScratchBuffers, "removeObjectForKey:", v4);

}

- (void)removeIOScratchBufferAllocatorForKey:(unint64_t)a3
{
  NSMutableDictionary *ioScratchBufferAllocators;
  id v4;

  ioScratchBufferAllocators = self->_ioScratchBufferAllocators;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](ioScratchBufferAllocators, "removeObjectForKey:", v4);

}

- (void)removeComputeCommandEncoderForKey:(unint64_t)a3
{
  NSMutableDictionary *commandEncoders;
  id v4;

  commandEncoders = self->_commandEncoders;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](commandEncoders, "removeObjectForKey:", v4);

}

- (void)removeComputePipelineStateForKey:(unint64_t)a3
{
  NSMutableDictionary *computePipelineStates;
  id v4;

  computePipelineStates = self->_computePipelineStates;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](computePipelineStates, "removeObjectForKey:", v4);

}

- (void)removeCounterSampleBufferForKey:(unint64_t)a3
{
  NSMutableDictionary *counterSampleBuffers;
  id v4;

  counterSampleBuffers = self->_counterSampleBuffers;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](counterSampleBuffers, "removeObjectForKey:", v4);

}

- (void)removeCounterSampleBuffer:(unint64_t)a3
{
  NSMutableDictionary *counterSampleBuffers;
  id v4;

  counterSampleBuffers = self->_counterSampleBuffers;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](counterSampleBuffers, "removeObjectForKey:", v4);

}

- (void)removeDepthStencilStateForKey:(unint64_t)a3
{
  NSMutableDictionary *depthStencilStates;
  id v4;

  depthStencilStates = self->_depthStencilStates;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](depthStencilStates, "removeObjectForKey:", v4);

}

- (void)removeDeviceForKey:(unint64_t)a3
{
  NSMutableDictionary *devices;
  id v4;

  devices = self->_devices;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](devices, "removeObjectForKey:", v4);

}

- (void)removeEventForKey:(unint64_t)a3
{
  NSMutableDictionary *events;
  id v4;

  events = self->_events;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](events, "removeObjectForKey:", v4);

}

- (void)removeFenceForKey:(unint64_t)a3
{
  NSMutableDictionary *fences;
  id v4;

  fences = self->_fences;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](fences, "removeObjectForKey:", v4);

}

- (void)removeFunctionForKey:(unint64_t)a3
{
  NSMutableDictionary *functions;
  id v4;

  functions = self->_functions;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](functions, "removeObjectForKey:", v4);

}

- (void)removeHeapForKey:(unint64_t)a3
{
  NSMutableDictionary *heaps;
  id v4;

  heaps = self->_heaps;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](heaps, "removeObjectForKey:", v4);

}

- (void)removeIndirectCommandBufferForKey:(unint64_t)a3
{
  NSMutableDictionary *resources;
  id v4;

  resources = self->_resources;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](resources, "removeObjectForKey:", v4);

}

- (void)removeIndirectComputeCommandForKey:(unint64_t)a3
{
  NSMutableDictionary *indirectComputeCommands;
  id v4;

  indirectComputeCommands = self->_indirectComputeCommands;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](indirectComputeCommands, "removeObjectForKey:", v4);

}

- (void)removeIndirectRenderCommandForKey:(unint64_t)a3
{
  NSMutableDictionary *indirectRenderCommands;
  id v4;

  indirectRenderCommands = self->_indirectRenderCommands;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](indirectRenderCommands, "removeObjectForKey:", v4);

}

- (void)removeLibraryForKey:(unint64_t)a3
{
  NSMutableDictionary *libraries;
  id v4;

  libraries = self->_libraries;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](libraries, "removeObjectForKey:", v4);

}

- (void)removeMotionEstimationPipelineForKey:(unint64_t)a3
{
  NSMutableDictionary *motionEstimationPipelines;
  id v4;

  motionEstimationPipelines = self->_motionEstimationPipelines;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](motionEstimationPipelines, "removeObjectForKey:", v4);

}

- (void)removeParallelRenderCommandEncoderForKey:(unint64_t)a3
{
  NSMutableDictionary *parallelRenderCommandEncoders;
  id v4;

  parallelRenderCommandEncoders = self->_parallelRenderCommandEncoders;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](parallelRenderCommandEncoders, "removeObjectForKey:", v4);

}

- (void)removeObjectPayloadBindingForKey:(unint64_t)a3
{
  NSMutableDictionary *objectPayloadBinding;
  id v4;

  objectPayloadBinding = self->_objectPayloadBinding;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](objectPayloadBinding, "removeObjectForKey:", v4);

}

- (void)removePipelineLibraryForKey:(unint64_t)a3
{
  NSMutableDictionary *pipelineLibraries;
  id v4;

  pipelineLibraries = self->_pipelineLibraries;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](pipelineLibraries, "removeObjectForKey:", v4);

}

- (void)removeRasterizationRateMapForKey:(unint64_t)a3
{
  NSMutableDictionary *rasterizationRateMaps;
  id v4;

  rasterizationRateMaps = self->_rasterizationRateMaps;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](rasterizationRateMaps, "removeObjectForKey:", v4);

}

- (void)removeRenderCommandEncoderForKey:(unint64_t)a3
{
  NSMutableDictionary *commandEncoders;
  id v4;

  commandEncoders = self->_commandEncoders;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](commandEncoders, "removeObjectForKey:", v4);

}

- (void)removeRenderPipelineStateForKey:(unint64_t)a3
{
  NSMutableDictionary *renderPipelineStates;
  id v4;

  renderPipelineStates = self->_renderPipelineStates;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](renderPipelineStates, "removeObjectForKey:", v4);

}

- (void)removeResidencySetForKey:(unint64_t)a3
{
  NSMutableDictionary *residencySets;
  id v4;

  residencySets = self->_residencySets;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](residencySets, "removeObjectForKey:", v4);

}

- (void)removeResourceGroupForKey:(unint64_t)a3
{
  NSMutableDictionary *resourceGroups;
  id v4;

  resourceGroups = self->_resourceGroups;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](resourceGroups, "removeObjectForKey:", v4);

}

- (void)removeResourceStateCommandEncoderForKey:(unint64_t)a3
{
  NSMutableDictionary *commandEncoders;
  id v4;

  commandEncoders = self->_commandEncoders;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](commandEncoders, "removeObjectForKey:", v4);

}

- (void)removeSamplerStateForKey:(unint64_t)a3
{
  NSMutableDictionary *samplerStates;
  id v4;

  samplerStates = self->_samplerStates;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](samplerStates, "removeObjectForKey:", v4);

}

- (void)removeSharedEventForKey:(unint64_t)a3
{
  NSMutableDictionary *events;
  id v4;

  events = self->_events;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](events, "removeObjectForKey:", v4);

}

- (void)removeTextureForKey:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[GTMTLReplayObjectMap removeAliasableResourceForKey:](self, "removeAliasableResourceForKey:", v4);

}

- (void)removeVideoCommandEncoderForKey:(unint64_t)a3
{
  NSMutableDictionary *commandEncoders;
  id v4;

  commandEncoders = self->_commandEncoders;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](commandEncoders, "removeObjectForKey:", v4);

}

- (void)removeDynamicLibraryForKey:(unint64_t)a3
{
  NSMutableDictionary *dynamicLibraries;
  id v4;

  dynamicLibraries = self->_dynamicLibraries;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](dynamicLibraries, "removeObjectForKey:", v4);

}

- (void)removeVisibleFunctionHandleForKey:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[GTMTLReplayObjectMap removeAliasableResourceForKey:](self, "removeAliasableResourceForKey:", v4);

}

- (void)removeFunctionHandleForKey:(unint64_t)a3
{
  NSMutableDictionary *functionHandles;
  id v4;

  functionHandles = self->_functionHandles;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](functionHandles, "removeObjectForKey:", v4);

}

- (void)removeAccelerationStructureForKey:(unint64_t)a3
{
  NSMutableDictionary *resources;
  id v4;

  resources = self->_resources;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](resources, "removeObjectForKey:", v4);

}

- (void)removeAccelerationStructureCommandEncoderForKey:(unint64_t)a3
{
  NSMutableDictionary *commandEncoders;
  id v4;

  commandEncoders = self->_commandEncoders;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](commandEncoders, "removeObjectForKey:", v4);

}

- (void)removeIntersectionFunctionTableForKey:(unint64_t)a3
{
  NSMutableDictionary *resources;
  id v4;

  resources = self->_resources;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](resources, "removeObjectForKey:", v4);

}

- (void)removeResourceGroupSPIForKey:(unint64_t)a3
{
  NSMutableDictionary *resourceGroups;
  id v4;

  resourceGroups = self->_resourceGroups;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](resourceGroups, "removeObjectForKey:", v4);

}

- (void)removeLateEvalEventForKey:(unint64_t)a3
{
  NSMutableDictionary *events;
  id v4;

  events = self->_events;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](events, "removeObjectForKey:", v4);

}

- (void)removeFunctionPointerHandleForKey:(unint64_t)a3
{
  NSMutableDictionary *functionPointerHandles;
  id v4;

  functionPointerHandles = self->_functionPointerHandles;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](functionPointerHandles, "removeObjectForKey:", v4);

}

- (void)removeFunctionPrivateArgumentForKey:(unint64_t)a3
{
  NSMutableDictionary *functionPrivateArguments;
  id v4;

  functionPrivateArguments = self->_functionPrivateArguments;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](functionPrivateArguments, "removeObjectForKey:", v4);

}

- (void)removeVisibleFunctionTableForKey:(unint64_t)a3
{
  NSMutableDictionary *resources;
  id v4;

  resources = self->_resources;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](resources, "removeObjectForKey:", v4);

}

- (void)removeDeadlineProfileForKey:(unint64_t)a3
{
  NSMutableDictionary *deadlineProfiles;
  id v4;

  deadlineProfiles = self->_deadlineProfiles;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](deadlineProfiles, "removeObjectForKey:", v4);

}

- (void)removeSpatialScalerForKey:(unint64_t)a3
{
  NSMutableDictionary *spatialScalers;
  id v4;

  spatialScalers = self->_spatialScalers;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](spatialScalers, "removeObjectForKey:", v4);

}

- (void)removeTemporalScalerForKey:(unint64_t)a3
{
  NSMutableDictionary *temporalScalers;
  id v4;

  temporalScalers = self->_temporalScalers;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](temporalScalers, "removeObjectForKey:", v4);

}

- (void)removeLogStateForKey:(unint64_t)a3
{
  NSMutableDictionary *logStates;
  id v4;

  logStates = self->_logStates;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](logStates, "removeObjectForKey:", v4);

}

- (id)libraries
{
  return self->_libraries;
}

- (id)dynamicLibraries
{
  return self->_dynamicLibraries;
}

- (id)resources
{
  return self->_resources;
}

- (id)executeIndirectCommandBufferMap
{
  return self->_resources;
}

- (id)functionMap
{
  return self->_functions;
}

- (id)renderPipelineDescriptorMap
{
  id v3;
  id v4;

  v3 = -[NSMutableDictionary mutableCopy](self->_functions, "mutableCopy");
  objc_msgSend(v3, "addEntriesFromDictionary:", self->_dynamicLibraries);
  objc_msgSend(v3, "addEntriesFromDictionary:", self->_pipelineLibraries);
  v4 = objc_msgSend(v3, "copy");

  return v4;
}

- (id)computePipelineDescriptorMap
{
  id v3;

  v3 = -[NSMutableDictionary mutableCopy](self->_functions, "mutableCopy");
  objc_msgSend(v3, "addEntriesFromDictionary:", self->_dynamicLibraries);
  objc_msgSend(v3, "addEntriesFromDictionary:", self->_pipelineLibraries);
  return v3;
}

- (id)blitPassDescriptorMap
{
  return self->_resources;
}

- (id)computePassDescriptorMap
{
  return self->_resources;
}

- (id)resourceStatePassDescriptorMap
{
  return self->_resources;
}

- (id)accelerationStructurePassDescriptorMap
{
  return self->_resources;
}

- (id)logStateMap
{
  return self->_logStates;
}

- (id)renderPassDescriptorMapWithMemorylessSubstitutes:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = -[NSMutableDictionary mutableCopy](self->_resources, "mutableCopy");
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v5, "addEntriesFromDictionary:", v4);
  objc_msgSend(v5, "addEntriesFromDictionary:", self->_rasterizationRateMaps);
  v6 = objc_msgSend(v5, "copy");

  return v6;
}

- (id)renderPassDescriptorMap
{
  return -[GTMTLReplayObjectMap renderPassDescriptorMapWithMemorylessSubstitutes:](self, "renderPassDescriptorMapWithMemorylessSubstitutes:", 0);
}

- (id)restoreIndirectCommandBufferDataMap
{
  id v3;
  id v4;

  v3 = -[NSMutableDictionary mutableCopy](self->_resources, "mutableCopy");
  objc_msgSend(v3, "addEntriesFromDictionary:", self->_renderPipelineStates);
  objc_msgSend(v3, "addEntriesFromDictionary:", self->_computePipelineStates);
  v4 = objc_msgSend(v3, "copy");

  return v4;
}

- (void)endEncodingForRenderCommandEncoder:(unint64_t)a3
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[GTMTLReplayObjectMap renderCommandEncoderForKey:](self, "renderCommandEncoderForKey:"));
  objc_msgSend(v5, "endEncoding");
  -[GTMTLReplayObjectMap removeRenderCommandEncoderForKey:](self, "removeRenderCommandEncoderForKey:", a3);

}

- (unsigned)globalTraceIdForEncoder:(unint64_t)a3 ofType:(BOOL)a4
{
  NSMutableDictionary *parallelRenderCommandEncoders;
  void *v5;
  void *v6;
  unsigned int v7;

  if (a4)
    parallelRenderCommandEncoders = self->_parallelRenderCommandEncoders;
  else
    parallelRenderCommandEncoders = self->_commandEncoders;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](parallelRenderCommandEncoders, "objectForKeyedSubscript:", v5));
  v7 = objc_msgSend(v6, "globalTraceObjectID");

  return v7;
}

- (id)encoderForKey:(unint64_t)a3 ofType:(BOOL)a4
{
  NSMutableDictionary *parallelRenderCommandEncoders;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a4)
    parallelRenderCommandEncoders = self->_parallelRenderCommandEncoders;
  else
    parallelRenderCommandEncoders = self->_commandEncoders;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](parallelRenderCommandEncoders, "objectForKeyedSubscript:", v5));

  if (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___MTLCommandEncoder))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)commitCommandBuffers
{
  NSMutableDictionary *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  NSMutableDictionary *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *k;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];

  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v3 = self->_commandEncoders;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_commandEncoders, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i)));
        objc_msgSend(v8, "endEncoding");

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_commandEncoders, "removeAllObjects");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = self->_parallelRenderCommandEncoders;
  v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_parallelRenderCommandEncoders, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j)));
        objc_msgSend(v14, "endEncoding");

      }
      v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v11);
  }

  -[NSMutableDictionary removeAllObjects](self->_parallelRenderCommandEncoders, "removeAllObjects");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = self->_commandBuffers;
  v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      for (k = 0; k != v17; k = (char *)k + 1)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)k);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_commandBuffers, "objectForKeyedSubscript:", v20, (_QWORD)v22));
        objc_msgSend((id)g_activityLog, "logCommandBuffer:withKey:", v21, objc_msgSend(v20, "unsignedLongLongValue"));
        GTMTLReplay_commitCommandBuffer(v21);

      }
      v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v17);
  }

  -[NSMutableDictionary removeAllObjects](self->_commandBuffers, "removeAllObjects");
}

- (void)addUnusedResourceKey:(unint64_t)a3
{
  NSMutableSet *unusedResources;
  id v4;

  unusedResources = self->_unusedResources;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableSet addObject:](unusedResources, "addObject:", v4);

}

- (id)unusedResourceKeys
{
  return -[NSMutableSet copy](self->_unusedResources, "copy");
}

- (MTLDevice)defaultDevice
{
  return self->_defaultDevice;
}

- (MTLCommandQueue)defaultCommandQueue
{
  return self->_defaultCommandQueue;
}

- (void)setDefaultCommandQueue:(id)a3
{
  objc_storeStrong((id *)&self->_defaultCommandQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultCommandQueue, 0);
  objc_storeStrong((id *)&self->_defaultDevice, 0);
  objc_storeStrong((id *)&self->_windowProperties, 0);
  objc_storeStrong((id *)&self->_unusedResources, 0);
  objc_storeStrong((id *)&self->_logStates, 0);
  objc_storeStrong((id *)&self->_temporalScalers, 0);
  objc_storeStrong((id *)&self->_spatialScalers, 0);
  objc_storeStrong((id *)&self->_deadlineProfiles, 0);
  objc_storeStrong((id *)&self->_mpsExternalPluginBases, 0);
  objc_storeStrong((id *)&self->_functionPrivateArguments, 0);
  objc_storeStrong((id *)&self->_functionPointerHandles, 0);
  objc_storeStrong((id *)&self->_intersectionFunctionTables, 0);
  objc_storeStrong((id *)&self->_functionHandles, 0);
  objc_storeStrong((id *)&self->_sharedEventHandles, 0);
  objc_storeStrong((id *)&self->_samplerStates, 0);
  objc_storeStrong((id *)&self->_bufferForHeap, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_resourceGroups, 0);
  objc_storeStrong((id *)&self->_residencySets, 0);
  objc_storeStrong((id *)&self->_renderPipelineStates, 0);
  objc_storeStrong((id *)&self->_rasterizationRateMaps, 0);
  objc_storeStrong((id *)&self->_pipelineLibraries, 0);
  objc_storeStrong((id *)&self->_objectPayloadBinding, 0);
  objc_storeStrong((id *)&self->_parallelRenderCommandEncoders, 0);
  objc_storeStrong((id *)&self->_motionEstimationPipelines, 0);
  objc_storeStrong((id *)&self->_dynamicLibraries, 0);
  objc_storeStrong((id *)&self->_libraries, 0);
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_iosurfaces, 0);
  objc_storeStrong((id *)&self->_indirectRenderCommands, 0);
  objc_storeStrong((id *)&self->_indirectComputeCommands, 0);
  objc_storeStrong((id *)&self->_heaps, 0);
  objc_storeStrong((id *)&self->_functions, 0);
  objc_storeStrong((id *)&self->_fences, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_drawables, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_depthStencilStates, 0);
  objc_storeStrong((id *)&self->_counterSampleBuffers, 0);
  objc_storeStrong((id *)&self->_computePipelineStates, 0);
  objc_storeStrong((id *)&self->_ioCommandQueues, 0);
  objc_storeStrong((id *)&self->_ioScratchBufferAllocators, 0);
  objc_storeStrong((id *)&self->_ioScratchBuffers, 0);
  objc_storeStrong((id *)&self->_ioHandles, 0);
  objc_storeStrong((id *)&self->_ioCommandBuffers, 0);
  objc_storeStrong((id *)&self->_commandQueues, 0);
  objc_storeStrong((id *)&self->_commandEncoders, 0);
  objc_storeStrong((id *)&self->_commandBuffers, 0);
  objc_storeStrong((id *)&self->_argumentEncoders, 0);
}

@end
