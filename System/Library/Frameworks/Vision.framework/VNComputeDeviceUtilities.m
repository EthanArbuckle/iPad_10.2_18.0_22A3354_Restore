@implementation VNComputeDeviceUtilities

uint64_t __55__VNComputeDeviceUtilities_computeDevices_passingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__VNComputeDeviceUtilities_computeDevices_ofTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "computeDevice:isOneTypeOfTypes:", a2, *(_QWORD *)(a1 + 40));
}

+ (id)mostPerformantNeuralEngineComputeDevice
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "allNeuralEngineComputeDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mostPerformantComputeDeviceOfComputeDevices:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)mostPerformantComputeDeviceOfComputeDevices:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    +[VNComputeDeviceUtilities _decreasingPerformanceSortedComputeDevices:]((uint64_t)a1, v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)espressoV1ModelComputeDevices
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "computeDevicesOfTypes:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNComputeDeviceUtilities _decreasingPerformanceSortedComputeDevices:]((uint64_t)a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)computeDevicesOfTypes:(unint64_t)a3
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "allComputeDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "computeDevices:ofTypes:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)computeDevices:(id)a3 ofTypes:(unint64_t)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__VNComputeDeviceUtilities_computeDevices_ofTypes___block_invoke;
  v5[3] = &__block_descriptor_48_e35_B16__0___MLComputeDeviceProtocol__8l;
  v5[4] = a1;
  v5[5] = a4;
  objc_msgSend(a1, "computeDevices:passingTest:", a3, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)computeDevices:(id)a3 passingTest:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__VNComputeDeviceUtilities_computeDevices_passingTest___block_invoke;
  v11[3] = &unk_1E45440F0;
  v12 = v5;
  v6 = v5;
  v7 = a3;
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectsAtIndexes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)allComputeDevices
{
  void *v3;
  void *v4;

  MLAllComputeDevices();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNComputeDeviceUtilities _decreasingPerformanceSortedComputeDevices:]((uint64_t)a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_decreasingPerformanceSortedComputeDevices:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  objc_opt_self();
  objc_msgSend(v2, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_5838);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)allNeuralEngineComputeDevices
{
  return (id)objc_msgSend(a1, "computeDevicesOfTypes:", 4);
}

+ (id)allCPUComputeDevices
{
  return (id)objc_msgSend(a1, "computeDevicesOfTypes:", 1);
}

+ (BOOL)isNeuralEngineComputeDevice:(id)a3
{
  return objc_msgSend(a1, "typeOfComputeDevice:", a3) == 4;
}

uint64_t __60__VNComputeDeviceUtilities__decreasingPerformanceComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "VNComputeDevicePerformanceScore");
  v6 = objc_msgSend(v4, "VNComputeDevicePerformanceScore");

  if (v5 > v6)
    return -1;
  else
    return v5 < v6;
}

+ (int64_t)performanceScoreForComputeDevice:(id)a3
{
  return objc_msgSend(a3, "VNComputeDevicePerformanceScore");
}

+ (id)mostPerformantComputeDevice
{
  void *v3;
  void *v4;

  MLAllComputeDevices();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mostPerformantComputeDeviceOfComputeDevices:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isGPUComputeDevice:(id)a3
{
  return objc_msgSend(a1, "typeOfComputeDevice:", a3) == 2;
}

+ (BOOL)computeDevice:(id)a3 isOneTypeOfTypes:(unint64_t)a4
{
  uint64_t v5;
  BOOL v6;

  v5 = objc_msgSend(a3, "VNComputeDeviceType");
  v6 = (v5 & ~a4) == 0;
  if (!a4)
    v6 = 0;
  return v5 == a4 || v6;
}

+ (unint64_t)typeOfComputeDevice:(id)a3
{
  return objc_msgSend(a3, "VNComputeDeviceType");
}

+ (id)computeDeviceOfComputeDevices:(id)a3 mostCompatibleWithComputeDevice:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "containsObject:", v9))
  {
    if ((v5 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_12;
    }
    objc_msgSend(a1, "computeDevices:ofTypes:", v8, objc_msgSend(a1, "typeOfComputeDevice:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((v5 & 6) != 0)
    {
      +[VNComputeDeviceUtilities _decreasingPerformanceSortedComputeDevices:]((uint64_t)a1, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v5 & 4) != 0)
      {
        objc_msgSend(v13, "lastObject");
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      v12 = v13;
    }
    else
    {
      v13 = v11;
    }
    objc_msgSend(v12, "firstObject");
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v10 = (id)v14;

    goto LABEL_12;
  }
  v10 = v9;
LABEL_12:

  return v10;
}

+ (id)metalDeviceForComputeDevice:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "metalDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)mostPerformantCPUComputeDevice
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "allCPUComputeDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mostPerformantComputeDeviceOfComputeDevices:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isCPUComputeDevice:(id)a3
{
  return objc_msgSend(a1, "typeOfComputeDevice:", a3) == 1;
}

+ (id)allGPUComputeDevices
{
  return (id)objc_msgSend(a1, "computeDevicesOfTypes:", 2);
}

+ (id)mostPerformantGPUComputeDevice
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "allGPUComputeDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mostPerformantComputeDeviceOfComputeDevices:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allCPUAndGPUComputeDevices
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "computeDevicesOfTypes:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNComputeDeviceUtilities _decreasingPerformanceSortedComputeDevices:]((uint64_t)a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allCPUAndNeuralEngineComputeDevices
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "computeDevicesOfTypes:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNComputeDeviceUtilities _decreasingPerformanceSortedComputeDevices:]((uint64_t)a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allGPUAndNeuralEngineComputeDevices
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "computeDevicesOfTypes:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNComputeDeviceUtilities _decreasingPerformanceSortedComputeDevices:]((uint64_t)a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (unint64_t)computeDeviceTypesForMLComputeUnits:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return qword_1A15E2BD0[a3];
}

+ (id)computeDevicesPassingTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "allComputeDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "computeDevices:passingTest:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)computeDeviceForMetalDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "allGPUComputeDevices", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "metalDevice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

@end
