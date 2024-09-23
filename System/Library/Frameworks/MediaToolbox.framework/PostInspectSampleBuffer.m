@implementation PostInspectSampleBuffer

void __bapspManager_PostInspectSampleBuffer_block_invoke(uint64_t a1)
{
  bapspManager_subPipeFinishedProcessingData(a1, *(const void **)(a1 + 32), *MEMORY[0x1E0CA4E48]);
  bapspManager_releaseAsync(*(_QWORD *)(a1 + 32));
}

void __bapspManager_PostInspectSampleBuffer_block_invoke_2(uint64_t a1)
{
  bapspManager_subPipeFinishedProcessingData(a1, *(const void **)(a1 + 32), *MEMORY[0x1E0CA4E48]);
  bapspManager_releaseAsync(*(_QWORD *)(a1 + 32));
}

@end
