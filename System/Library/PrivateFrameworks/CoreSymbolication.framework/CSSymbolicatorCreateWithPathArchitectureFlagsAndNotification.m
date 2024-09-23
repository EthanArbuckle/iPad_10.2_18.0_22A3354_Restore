@implementation CSSymbolicatorCreateWithPathArchitectureFlagsAndNotification

uint64_t __CSSymbolicatorCreateWithPathArchitectureFlagsAndNotification_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = CSSymbolicatorCreateWithSignature(a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v4 + 40) = result;
  *(_QWORD *)(v4 + 48) = v5;
  return result;
}

_QWORD *__CSSymbolicatorCreateWithPathArchitectureFlagsAndNotification_block_invoke_20(_QWORD *result, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  if (!*(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24))
  {
    v2 = result;
    if (result[6] == *(_QWORD *)(*a2 + 112))
    {
      result = std::shared_ptr<CSCppSymbolOwner>::operator=[abi:ne180100]((_QWORD *)(*(_QWORD *)(result[5] + 8) + 40), a2);
      *(_BYTE *)(*(_QWORD *)(v2[4] + 8) + 24) = 1;
    }
    else
    {
      v3 = *(_QWORD *)(result[5] + 8);
      v4 = *(_QWORD *)(v3 + 40);
      result = (_QWORD *)(v3 + 40);
      if (!v4)
        return std::shared_ptr<CSCppSymbolOwner>::operator=[abi:ne180100](result, a2);
    }
  }
  return result;
}

@end
