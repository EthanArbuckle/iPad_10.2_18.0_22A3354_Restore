@implementation CNPluginCopySupportedInterfaces

BOOL __CNPluginCopySupportedInterfaces_block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = ServerConnectionProcessControl(*(_QWORD *)G_plugin, *(CFPropertyListRef *)(a1 + 48), (const __CFData **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
