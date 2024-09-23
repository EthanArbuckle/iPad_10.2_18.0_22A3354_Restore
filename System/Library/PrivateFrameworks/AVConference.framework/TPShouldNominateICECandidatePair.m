@implementation TPShouldNominateICECandidatePair

uint64_t __TPShouldNominateICECandidatePair_block_invoke(uint64_t result)
{
  uint64_t (*v1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);

  v1 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(result + 32)
                                                                                                + 34352);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)(result + 32) + 34376), *(unsigned int *)(result + 80), *(_QWORD *)(result + 40), *(unsigned int *)(result + 84), *(_QWORD *)(result + 48), *(_QWORD *)(result + 56), *(_QWORD *)(result + 64), *(_QWORD *)(result + 72));
  return result;
}

@end
