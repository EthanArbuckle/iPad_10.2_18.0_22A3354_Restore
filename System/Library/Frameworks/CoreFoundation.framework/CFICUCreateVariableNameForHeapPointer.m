@implementation CFICUCreateVariableNameForHeapPointer

void _____CFICUCreateVariableNameForHeapPointer_block_invoke(uint64_t a1)
{
  if (!variableNamesByHeapPointer)
    variableNamesByHeapPointer = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, &kCFTypeDictionaryValueCallBacks);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = ___CFICUCreateVariableNameLocked(*(char **)(a1 + 40));
  CFDictionarySetValue((CFMutableDictionaryRef)variableNamesByHeapPointer, *(const void **)(a1 + 48), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

@end
