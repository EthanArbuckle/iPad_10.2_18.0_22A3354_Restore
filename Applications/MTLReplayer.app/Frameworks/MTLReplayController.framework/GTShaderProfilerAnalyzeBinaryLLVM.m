@implementation GTShaderProfilerAnalyzeBinaryLLVM

void __GTShaderProfilerAnalyzeBinaryLLVM_block_invoke(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = LLVMInitializeAGX2TargetInfo(a1);
  v2 = LLVMInitializeAGX2TargetMC(v1);
  v3 = LLVMInitializeAGX2Disassembler(v2);
  LLVMInitializeAGX2ClauseAnalyzer(v3);
}

@end
