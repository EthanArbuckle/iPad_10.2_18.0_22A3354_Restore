@implementation ZL44SIPommesSpotlightPhotosSuggestionsProcessDBOP8DocStoreP14datastore

_QWORD *___ZL44SIPommesSpotlightPhotosSuggestionsProcessDBOP8DocStoreP14datastore_infoP6db_objP17_SuggestionsModelP11CITokenizerPPKjiPPKcP23si_completion_pattern_sSE_j16ci_rankingbits_sU13block_pointerFdPjPbSJ_E_block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[5];
  _OWORD v32[5];

  v9 = result;
  v10 = *(_QWORD *)(result[14] + 8);
  v11 = *(_QWORD *)(v10 + 24);
  if (v11 != -1 && v11 >= a6)
  {
    if (a5 && *(_BYTE *)(*(_QWORD *)(result[15] + 8) + 24))
    {
      v22 = result[19];
      v23 = result[18] + 144;
      v24 = v9[20];
      v25 = v9[21];
      v26 = v9[22];
      v27 = v9[23];
      v28 = *((_BYTE *)v9 + 212);
      v29 = *((_OWORD *)v9 + 5);
      v31[2] = *((_OWORD *)v9 + 4);
      v31[3] = v29;
      v31[4] = *((_OWORD *)v9 + 6);
      v30 = *((_OWORD *)v9 + 3);
      v31[0] = *((_OWORD *)v9 + 2);
      v31[1] = v30;
      return (_QWORD *)_SIPommesSuggestionsProcessTopicAttribute(v23, v22, v24, v25, v26, a2, a3, a4, a5, v27, v28, 1, 6, v31, *((_DWORD *)v9 + 52), *(_WORD *)((char *)v9 + 213), HIBYTE(*(_WORD *)((char *)v9 + 213)));
    }
  }
  else
  {
    *(_QWORD *)(v10 + 24) = a6;
    if ((double)(int)a3 * 0.3 <= (double)(unint64_t)result[17])
    {
      v13 = result[19];
      v14 = result[18] + 144;
      v15 = v9[20];
      v16 = v9[21];
      v17 = v9[22];
      v18 = v9[23];
      v19 = *((_BYTE *)v9 + 212);
      v20 = *((_OWORD *)v9 + 5);
      v32[2] = *((_OWORD *)v9 + 4);
      v32[3] = v20;
      v32[4] = *((_OWORD *)v9 + 6);
      v21 = *((_OWORD *)v9 + 3);
      v32[0] = *((_OWORD *)v9 + 2);
      v32[1] = v21;
      result = (_QWORD *)_SIPommesSuggestionsProcessTopicAttribute(v14, v13, v15, v16, v17, a2, a3, a4, a5, v18, v19, 0, 6, v32, *((_DWORD *)v9 + 52), *(_WORD *)((char *)v9 + 213), HIBYTE(*(_WORD *)((char *)v9 + 213)));
      *(_BYTE *)(*(_QWORD *)(v9[15] + 8) + 24) = (_BYTE)result;
    }
  }
  return result;
}

@end
