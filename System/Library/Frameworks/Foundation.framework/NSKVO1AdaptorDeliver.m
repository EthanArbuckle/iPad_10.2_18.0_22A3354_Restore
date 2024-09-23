@implementation NSKVO1AdaptorDeliver

uint64_t ___NSKVO1AdaptorDeliver_block_invoke(uint64_t result, uint64_t a2)
{
  switch(*(_QWORD *)(result + 56))
  {
    case 1:
      result = objc_msgSend(*(id *)(result + 48), "updateObject:atIndex:", objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "valueForKeyPath:", *(_QWORD *)(result + 40)), "objectAtIndex:", a2), a2);
      break;
    case 2:
      result = objc_msgSend(*(id *)(result + 48), "insertObject:atIndex:", objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "valueForKeyPath:", *(_QWORD *)(result + 40)), "objectAtIndex:", a2), a2);
      break;
    case 3:
      result = objc_msgSend(*(id *)(result + 48), "removeObjectAtIndex:", a2);
      break;
    case 4:
      result = objc_msgSend(*(id *)(result + 48), "replaceObjectAtIndex:withObject:", a2, objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "valueForKeyPath:", *(_QWORD *)(result + 40)), "objectAtIndex:", a2));
      break;
    default:
      return result;
  }
  return result;
}

@end
