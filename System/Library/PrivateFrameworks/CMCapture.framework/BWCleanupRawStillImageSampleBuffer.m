@implementation BWCleanupRawStillImageSampleBuffer

id __BWCleanupRawStillImageSampleBuffer_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id result;
  _QWORD v16[32];

  v16[31] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D06C18];
  v16[0] = *MEMORY[0x1E0D06948];
  v16[1] = v0;
  v1 = *MEMORY[0x1E0D06848];
  v16[2] = *MEMORY[0x1E0D06928];
  v16[3] = v1;
  v2 = *MEMORY[0x1E0D067E8];
  v16[4] = *MEMORY[0x1E0D06820];
  v16[5] = v2;
  v3 = *MEMORY[0x1E0D067F8];
  v16[6] = *MEMORY[0x1E0D06800];
  v16[7] = v3;
  v4 = *MEMORY[0x1E0D06818];
  v16[8] = *MEMORY[0x1E0D067F0];
  v16[9] = v4;
  v5 = *MEMORY[0x1E0D06808];
  v16[10] = *MEMORY[0x1E0D06810];
  v16[11] = v5;
  v6 = *MEMORY[0x1E0D06830];
  v16[12] = *MEMORY[0x1E0D06838];
  v16[13] = v6;
  v7 = *MEMORY[0x1E0D06860];
  v16[14] = *MEMORY[0x1E0D06828];
  v16[15] = v7;
  v8 = *MEMORY[0x1E0D06850];
  v16[16] = *MEMORY[0x1E0D06858];
  v16[17] = v8;
  v9 = *MEMORY[0x1E0D06840];
  v16[18] = *MEMORY[0x1E0D06868];
  v16[19] = v9;
  v10 = *MEMORY[0x1E0D06BD8];
  v16[20] = *MEMORY[0x1E0D06870];
  v16[21] = v10;
  v11 = *MEMORY[0x1E0D06BD0];
  v16[22] = *MEMORY[0x1E0D06BE0];
  v16[23] = v11;
  v12 = *MEMORY[0x1E0D068C8];
  v16[24] = *MEMORY[0x1E0D06AF0];
  v16[25] = v12;
  v13 = *MEMORY[0x1E0D06B18];
  v16[26] = *MEMORY[0x1E0D06B10];
  v16[27] = v13;
  v14 = *MEMORY[0x1E0D08328];
  v16[28] = *MEMORY[0x1E0D06F70];
  v16[29] = v14;
  v16[30] = *MEMORY[0x1E0D08330];
  result = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 31);
  BWCleanupRawStillImageSampleBuffer_sGarbageKeys = (uint64_t)result;
  return result;
}

@end
