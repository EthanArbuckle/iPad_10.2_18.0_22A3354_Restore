@implementation Remote

uint64_t __55__Remote_Driver_Host_Delegate_delete_storage_settings___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1[5] + 720);
  if (v2)
    result = (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 24))(v2, a1[7]);
  else
    result = 560947818;
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

uint64_t __53__Remote_Driver_Host_Delegate_copy_storage_settings___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1[6] + 720);
  if (v2)
    result = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v2 + 8))(v2, a1[8], *(_QWORD *)(a1[5] + 8) + 24);
  else
    result = 560947818;
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

void __67__Remote_Driver_Host_Delegate_write_storage_settings_storage_data___block_invoke(uint64_t a1)
{
  uint64_t v2;
  CFTypeRef cf;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 720);
  if (v2)
  {
    mcp_applesauce::CF::PropertyListRef::from_get((mcp_applesauce::CF::PropertyListRef *)&cf, *(CFTypeRef *)(a1 + 56));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
    if (cf)
      CFRelease(cf);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 560947818;
  }
}

@end
