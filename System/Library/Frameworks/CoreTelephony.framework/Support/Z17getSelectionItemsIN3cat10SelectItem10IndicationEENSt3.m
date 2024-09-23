@implementation Z17getSelectionItemsIN3cat10SelectItem10IndicationEENSt3

char **___Z17getSelectionItemsIN3cat10SelectItem10IndicationEENSt3__16vectorI13SelectionItemNS3_9allocatorIS5_EEEEPKN3ctu11OsLogLoggerERKT__block_invoke_2(uint64_t a1, char **a2)
{
  char **result;

  result = (char **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (result != a2)
    return (char **)std::vector<QMI_NextActionIndicator>::__assign_with_size[abi:ne180100]<QMI_NextActionIndicator*,QMI_NextActionIndicator*>(result, *a2, a2[1], (a2[1] - *a2) >> 2);
  return result;
}

@end
