@implementation FileSinkStartRecording

void __captureSession_FileSinkStartRecording_block_invoke(uint64_t a1)
{
  captureSession_fileStartRecording(*(const void **)(a1 + 48), *(void **)(a1 + 32), *(void **)(a1 + 40), 0, MEMORY[0x1E0CA2E18]);
}

@end
