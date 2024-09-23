void *ARDepthCameraCalibrationCreate()
{
  return malloc_type_calloc(1uLL, 0xD0uLL, 0x10000407817DDDBuLL);
}

__n128 ARDepthCameraCalibrationCopy(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  v5 = *(_OWORD *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  result = *(__n128 *)(a2 + 144);
  v9 = *(_OWORD *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v10;
  *(__n128 *)(a1 + 144) = result;
  *(_OWORD *)(a1 + 160) = v9;
  return result;
}

uint64_t ARDepthCameraCalibrationSize()
{
  return 208;
}

__n128 ARDepthCameraCalibrationGetIntrinsics(uint64_t a1)
{
  return *(__n128 *)a1;
}

__n128 ARDepthCameraCalibrationGetExtrinsics(__n128 *a1)
{
  return a1[3];
}

double ARDepthCameraCalibrationGetTimestamp(uint64_t a1)
{
  return *(double *)(a1 + 112);
}

__n128 ARDepthCameraCalibrationGetDeviceTransform(__n128 *a1)
{
  return a1[8];
}

uint64_t ARDepthCameraCalibrationGetSLAMSessionID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 192);
}

uint64_t ARDepthCameraCalibrationGetSLAMReinitCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 200);
}

__n128 *ARDepthCameraCalibrationSetIntrinsics(__n128 *result, __n128 a2, __n128 a3, __n128 a4)
{
  *result = a2;
  result[1] = a3;
  result[2] = a4;
  return result;
}

__n128 *ARDepthCameraCalibrationSetExtrinsics(__n128 *result, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  return result;
}

uint64_t ARDepthCameraCalibrationSetTimestamp(uint64_t result, double a2)
{
  *(double *)(result + 112) = a2;
  return result;
}

__n128 *ARDepthCameraCalibrationSetDeviceTransform(__n128 *result, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  result[11] = a5;
  return result;
}

uint64_t ARDepthCameraCalibrationSetSLAMSessionID(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 192) = a2;
  return result;
}

uint64_t ARDepthCameraCalibrationSetSLAMReinitCount(uint64_t result, int a2)
{
  *(_DWORD *)(result + 200) = a2;
  return result;
}

id ARKitFoundationBuildVersionString()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CFBundleVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x24BDC53A0](texture);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

