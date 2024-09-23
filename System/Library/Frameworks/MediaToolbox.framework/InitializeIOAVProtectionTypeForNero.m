@implementation InitializeIOAVProtectionTypeForNero

void __InitializeIOAVProtectionTypeForNero_block_invoke(uint64_t a1)
{
  _QWORD handler[5];

  _block_invoke_2_source = (uint64_t)dispatch_source_create(MEMORY[0x1E0C80DC0], 0x1EuLL, 0, 0);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 0x40000000;
  handler[2] = __InitializeIOAVProtectionTypeForNero_block_invoke_2;
  handler[3] = &__block_descriptor_tmp_6_7;
  handler[4] = *(_QWORD *)(a1 + 32);
  dispatch_source_set_event_handler((dispatch_source_t)_block_invoke_2_source, handler);
  dispatch_resume((dispatch_object_t)_block_invoke_2_source);
}

void __InitializeIOAVProtectionTypeForNero_block_invoke_2()
{
  SendIOAVProtectionTypeToNero();
}

@end
