@implementation NSStringFromCHSWidgetRenderingModes

uint64_t __NSStringFromCHSWidgetRenderingModes_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  const __CFString *v4;

  v3 = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    result = objc_msgSend(*(id *)(result + 32), "appendString:", CFSTR(", "));
  switch(a2)
  {
    case 1:
      v4 = CFSTR("fullColor");
      goto LABEL_9;
    case 4:
      v4 = CFSTR("accented");
      goto LABEL_9;
    case 2:
      v4 = CFSTR("vibrant");
LABEL_9:
      result = objc_msgSend(*(id *)(v3 + 32), "appendString:", v4);
      break;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24);
  return result;
}

@end
