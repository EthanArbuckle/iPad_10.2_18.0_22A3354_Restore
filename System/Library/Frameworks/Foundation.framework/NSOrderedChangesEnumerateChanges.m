@implementation NSOrderedChangesEnumerateChanges

uint64_t ___NSOrderedChangesEnumerateChanges_block_invoke(uint64_t result, uint64_t a2)
{
  switch(a2)
  {
    case 1:
      if ((*(_BYTE *)(result + 40) & 2) != 0)
        goto LABEL_10;
      break;
    case 2:
      if ((*(_BYTE *)(result + 40) & 4) != 0)
        goto LABEL_10;
      break;
    case 3:
      if ((*(_BYTE *)(result + 40) & 8) != 0)
        goto LABEL_10;
      break;
    case 5:
      if ((*(_BYTE *)(result + 40) & 0x20) != 0)
LABEL_10:
        result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
      break;
    default:
      return result;
  }
  return result;
}

@end
