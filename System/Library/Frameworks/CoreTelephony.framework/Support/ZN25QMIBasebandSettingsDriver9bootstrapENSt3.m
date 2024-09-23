@implementation ZN25QMIBasebandSettingsDriver9bootstrapENSt3

capabilities::ct *___ZN25QMIBasebandSettingsDriver9bootstrapENSt3__110shared_ptrI43BasebandSettingsDriverEventHandlerInterfaceEE_block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v4[16];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216897000, v2, OS_LOG_TYPE_DEFAULT, "#I PDC QMI client has started", v4, 2u);
  }
  *(_BYTE *)(v1 + 177) = 1;
  return QMIBasebandSettingsDriver::handleClientStarted_sync(v1);
}

@end
