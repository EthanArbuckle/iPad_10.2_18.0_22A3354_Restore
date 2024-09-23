@implementation ControllerAxisInputSetValue

uint64_t __ControllerAxisInputSetValue_block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 72);
    v8 = 138412546;
    v9 = v5;
    v10 = 2048;
    v11 = v6;
    _os_signpost_emit_with_name_impl(&dword_215181000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Axis Value Change Callback", "%@, receiveTimestamp=%f", (uint8_t *)&v8, 0x16u);
  }

  return (*(uint64_t (**)(float))(*(_QWORD *)(a1 + 56) + 16))(*(float *)(a1 + 80));
}

@end
