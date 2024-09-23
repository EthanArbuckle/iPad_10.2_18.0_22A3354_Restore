@implementation ZL38SIPommesSpotlightSuggestionsProcessDBOP8DocStoreP14datastore

unint64_t *___ZL38SIPommesSpotlightSuggestionsProcessDBOP8DocStoreP14datastore_infoP6db_objP17_SuggestionsModelP11CITokenizerPPKjiPPKcP23si_completion_pattern_sSE_j16ci_rankingbits_sU13block_pointerFdPjPbSJ_E_block_invoke_4(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v7;
  uint64_t v8;
  unint64_t *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  __int128 v20;
  __int128 v21;
  unint64_t v22;
  _OWORD v23[5];
  uint64_t v24;
  uint64_t v25;

  if (!a4)
  {
    v24 = v7;
    v25 = v8;
    v11 = result;
    if ((double)(int)a3 * 0.3 <= (double)result[15])
    {
      v13 = result[17];
      v14 = result[16] + 224;
      v15 = v11[18];
      v16 = v11[19];
      v17 = v11[20];
      v18 = v11[21];
      v19 = *((_BYTE *)v11 + 192);
      v20 = *((_OWORD *)v11 + 5);
      v23[2] = *((_OWORD *)v11 + 4);
      v23[3] = v20;
      v23[4] = *((_OWORD *)v11 + 6);
      v21 = *((_OWORD *)v11 + 3);
      v23[0] = *((_OWORD *)v11 + 2);
      v23[1] = v21;
      result = (unint64_t *)_SIPommesSuggestionsProcessTopicAttribute(v14, v13, v15, v16, v17, a2, a3, 0, a5, v18, v19, 0, 8, v23, *((_DWORD *)v11 + 47), *(_WORD *)((char *)v11 + 193), HIBYTE(*(_WORD *)((char *)v11 + 193)));
    }
    if (!*((_BYTE *)v11 + 195))
    {
      v22 = v11[15];
      if (v22 <= 5 && v22 == *(_QWORD *)(*(_QWORD *)(v11[14] + 8) + 24) + 1)
        *a7 = 1;
    }
  }
  return result;
}

@end
