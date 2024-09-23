@implementation TMResetToFirstLaunch

uint64_t __TMResetToFirstLaunch_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = MEMORY[0x1B5E2AE70](a2);
  if (result != MEMORY[0x1E0C81310])
    goto LABEL_2;
  if (a2 == MEMORY[0x1E0C81260])
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    goto LABEL_2;
  }
  if (a2 != MEMORY[0x1E0C81258])
  {
LABEL_2:
    v5 = a1[5];
    goto LABEL_3;
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  v5 = a1[4];
LABEL_3:
  *(_BYTE *)(*(_QWORD *)(v5 + 8) + 24) = 1;
  return result;
}

void __TMResetToFirstLaunch_block_invoke_2(uint64_t a1)
{
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

@end
