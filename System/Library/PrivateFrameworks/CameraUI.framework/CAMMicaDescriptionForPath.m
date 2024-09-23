@implementation CAMMicaDescriptionForPath

uint64_t __CAMMicaDescriptionForPath_block_invoke(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD **)(a2 + 8);
  switch(*(_DWORD *)a2)
  {
    case 0:
      result = objc_msgSend(*(id *)(result + 32), "appendFormat:", CFSTR("%f %f m "), *v2, v2[1], v3, v4, v5, v6);
      break;
    case 1:
      result = objc_msgSend(*(id *)(result + 32), "appendFormat:", CFSTR("%f %f l "), *v2, v2[1], v3, v4, v5, v6);
      break;
    case 3:
      result = objc_msgSend(*(id *)(result + 32), "appendFormat:", CFSTR("%f %f %f %f %f %f c "), *v2, v2[1], v2[2], v2[3], v2[4], v2[5]);
      break;
    case 4:
      result = objc_msgSend(*(id *)(result + 32), "appendString:", CFSTR("h "));
      break;
    default:
      return result;
  }
  return result;
}

@end
