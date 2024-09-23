@implementation HALS

HALS_ObjectMap *___ZNK11HALS_PlugIn21CopyClockDeviceByUCIDEj_block_invoke(uint64_t a1)
{
  HALS_ObjectMap *result;

  result = HALS_PlugIn::_CopyClockDeviceByUCID(*(HALS_PlugIn **)(a1 + 40), *(_DWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

HALS_ObjectMap *___ZNK11HALS_PlugIn18CopyEndPointByUCIDEj_block_invoke(uint64_t a1)
{
  HALS_PlugIn *v2;
  int v3;
  int NumberEndPoints;
  int v5;
  unsigned int v6;
  HALS_ObjectMap *result;
  HALS_Object *v8;

  v2 = *(HALS_PlugIn **)(a1 + 40);
  v3 = *(_DWORD *)(a1 + 48);
  NumberEndPoints = HALS_PlugIn::GetNumberEndPoints(v2, 0);
  if (NumberEndPoints)
  {
    v5 = NumberEndPoints;
    v6 = 0;
    while (1)
    {
      result = HALS_PlugIn::CopyEndPointByIndex(v2, v6, 0);
      if (*((_DWORD *)result + 331) == v3)
        break;
      HALS_ObjectMap::ReleaseObject(result, v8);
      if (v5 == ++v6)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    result = 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

HALS_ObjectMap *___ZNK15HALS_IOUADriver21CopyClockDeviceByUCIDEj_block_invoke(uint64_t a1)
{
  HALS_ObjectMap *result;

  result = HALS_IOUADriver::_CopyClockDeviceByUCID(*(HALS_IOUADriver **)(a1 + 40), *(_DWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

HALS_ObjectMap *___ZNK18HALS_MetaSubDevice14CopyRealDeviceI11HALS_DeviceEEPT_v_block_invoke(uint64_t a1)
{
  HALS_ObjectMap *result;

  result = HALS_MetaSubDevice::_CopyRealDevice<HALS_Device>(*(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

HALS_MetaSubDevice *___ZNK15HALS_MetaDevice15GetPropertyDataEjRK26AudioObjectPropertyAddressjRjPvjPKvP11HALS_Client_block_invoke_73(uint64_t a1)
{
  HALS_MetaSubDevice *result;

  result = *(HALS_MetaSubDevice **)(*(_QWORD *)(a1 + 32) + 1416);
  if (result)
    result = (HALS_MetaSubDevice *)HALS_MetaSubDevice::CopyRealDeviceUID(result);
  **(_QWORD **)(a1 + 40) = result;
  return result;
}

HALS_DSPSettings *___ZNK11HALS_Device11HasValidDSPEv_block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  HALS_DSPSettings *result;

  result = *(HALS_DSPSettings **)(*(_QWORD *)(a1 + 40) + 456);
  if (result)
    result = (HALS_DSPSettings *)HALS_DSPSettings::HasValidDSPString(result, a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_BYTE)result;
  return result;
}

@end
