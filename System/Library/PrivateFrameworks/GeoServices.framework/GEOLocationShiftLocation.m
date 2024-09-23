@implementation GEOLocationShiftLocation

uint64_t __93___GEOLocationShiftLocation_performCompletionHandlerWithShiftedCoordinate_accuracy_function___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 32);
  if (v3)
  {
    (*(void (**)(double, double, double))(v3 + 16))(*(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = *(_QWORD *)(v2 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __49___GEOLocationShiftLocation_performErrorHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

uint64_t __51___GEOLocationShiftLocation_performMustGoToNetwork__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))();
}

@end
