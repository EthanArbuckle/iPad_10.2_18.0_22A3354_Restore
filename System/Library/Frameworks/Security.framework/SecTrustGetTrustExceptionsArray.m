@implementation SecTrustGetTrustExceptionsArray

uint64_t __SecTrustGetTrustExceptionsArray_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 40) + 104);
  return result;
}

@end
