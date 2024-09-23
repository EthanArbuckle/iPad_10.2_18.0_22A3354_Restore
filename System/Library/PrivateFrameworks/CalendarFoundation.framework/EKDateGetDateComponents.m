@implementation EKDateGetDateComponents

uint64_t __EKDateGetDateComponents_block_invoke(uint64_t result)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (*(_QWORD *)(result + 32))
  {
    v1 = (_QWORD *)result;
    _EKSharedGregorianCalendarForTimeZone(*(void **)(result + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "components:fromDate:", v1[7], v1[4]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(v1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    return objc_msgSend(*(id *)(*(_QWORD *)(v1[6] + 8) + 40), "setTimeZone:", v1[5]);
  }
  return result;
}

@end
