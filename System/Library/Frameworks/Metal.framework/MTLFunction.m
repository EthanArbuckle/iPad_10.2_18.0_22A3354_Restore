@implementation MTLFunction

MTLFunctionReflectionInternal *__53___MTLFunction_reflectionWithOptions_binaryArchives___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  MTLFunctionReflectionInternal *result;

  result = -[MTLFunctionReflectionInternal initWithDevice:reflectionData:functionType:options:]([MTLFunctionReflectionInternal alloc], "initWithDevice:reflectionData:functionType:options:", *(_QWORD *)(a1[4] + 24), a3, *(_QWORD *)(a1[4] + 32), a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = result;
  return result;
}

MTLFunctionReflectionInternal *__54___MTLFunction_reflectionWithOptions_pipelineLibrary___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  MTLFunctionReflectionInternal *result;

  result = -[MTLFunctionReflectionInternal initWithDevice:reflectionData:functionType:options:]([MTLFunctionReflectionInternal alloc], "initWithDevice:reflectionData:functionType:options:", *(_QWORD *)(a1[4] + 24), a3, *(_QWORD *)(a1[4] + 32), a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = result;
  return result;
}

void __56___MTLFunction_reflectionWithOptions_completionHandler___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  MTLFunctionReflectionInternal *v4;

  v4 = -[MTLFunctionReflectionInternal initWithDevice:reflectionData:functionType:options:]([MTLFunctionReflectionInternal alloc], "initWithDevice:reflectionData:functionType:options:", *(_QWORD *)(a1[4] + 24), a3, *(_QWORD *)(a1[4] + 32), a1[6]);
  (*(void (**)(void))(a1[5] + 16))();

}

@end
