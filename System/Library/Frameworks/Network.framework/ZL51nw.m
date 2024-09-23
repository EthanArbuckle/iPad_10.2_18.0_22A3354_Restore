@implementation ZL51nw

_QWORD *___ZL51nw_connection_group_handle_connection_state_changedP30NWConcrete_nw_connection_groupP24NWConcrete_nw_connection21nw_connection_state_tPU22objcproto11OS_nw_error8NSObject_block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = result[5];
  v2 = *(_QWORD *)(result[4] + 104);
  if (v2)
    v3 = v1 == 0;
  else
    v3 = 1;
  if (v3)
    goto LABEL_10;
  v5 = *(_QWORD **)(v2 + 16);
  v4 = *(_QWORD **)(v2 + 24);
  if (v5 != v4)
  {
    while (*v5 != v1)
    {
      if (++v5 == v4)
      {
        v5 = v4;
        break;
      }
    }
  }
  if (v5 == v4)
LABEL_10:
    *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = 1;
  return result;
}

_QWORD *___ZL51nw_connection_group_handle_connection_state_changedP30NWConcrete_nw_connection_groupP24NWConcrete_nw_connection21nw_connection_state_tPU22objcproto11OS_nw_error8NSObject_block_invoke_137(_QWORD *result)
{
  *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_DWORD *)(result[4] + 40);
  *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = *(_BYTE *)(result[4] + 190) & 1;
  return result;
}

@end
