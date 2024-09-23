@implementation LSApplicationRecord(UserActivity)

+ (uint64_t)applicationRecordsForUserActivityType:()UserActivity limit:error:
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  int v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  _DWORD *v44;
  BOOL v46;
  uint64_t v47;
  _DWORD *v48;
  _DWORD *v49;
  unint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int64_t v56;
  int64_t v57;
  int64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  int v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t *v86;
  int *v87;
  unint64_t v88;
  int v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t *v92;
  int v93;
  uint64_t v94;
  unint64_t v95;
  int *v96;
  int v97;
  int64_t v99;
  int v100;

  v8 = result;
LABEL_2:
  v96 = (int *)(a2 - 16);
  v9 = v8;
  while (2)
  {
    v8 = v9;
    v10 = a2 - v9;
    v11 = (uint64_t)(a2 - v9) >> 4;
    switch(v11)
    {
      case 0:
      case 1:
        return result;
      case 2:
        result = _LSBundleCompareForActivityContinuationSuitability(***a3, *(_QWORD *)(a2 - 8), *(_QWORD *)(v8 + 8));
        if (result == -1)
        {
          v42 = *(_DWORD *)v8;
          *(_DWORD *)v8 = *(_DWORD *)(a2 - 16);
          *(_DWORD *)(a2 - 16) = v42;
          v43 = *(_QWORD *)(v8 + 8);
          *(_QWORD *)(v8 + 8) = *(_QWORD *)(a2 - 8);
          *(_QWORD *)(a2 - 8) = v43;
        }
        return result;
      case 3:
        return std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>((int *)v8, (int *)(v8 + 16), v96, a3);
      case 4:
        return std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>(v8, v8 + 16, v8 + 32, (uint64_t)v96, a3);
      case 5:
        return std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *,0>(v8, v8 + 16, v8 + 32, v8 + 48, (uint64_t)v96, a3);
      default:
        if (v10 <= 383)
        {
          v44 = (_DWORD *)(v8 + 16);
          v46 = v8 == a2 || v44 == (_DWORD *)a2;
          if ((a5 & 1) != 0)
          {
            if (!v46)
            {
              v47 = 0;
              v48 = (_DWORD *)v8;
              do
              {
                v49 = v44;
                result = _LSBundleCompareForActivityContinuationSuitability(***a3, *((_QWORD *)v48 + 3), *((_QWORD *)v48 + 1));
                if (result == -1)
                {
                  v50 = a2;
                  v51 = *v49;
                  v52 = *((_QWORD *)v48 + 3);
                  v53 = v47;
                  while (1)
                  {
                    v54 = v8 + v53;
                    *(_DWORD *)(v54 + 16) = *(_DWORD *)(v8 + v53);
                    *(_QWORD *)(v54 + 24) = *(_QWORD *)(v8 + v53 + 8);
                    if (!v53)
                      break;
                    result = _LSBundleCompareForActivityContinuationSuitability(***a3, v52, *(_QWORD *)(v54 - 8));
                    v53 -= 16;
                    if (result != -1)
                    {
                      v55 = v8 + v53 + 16;
                      goto LABEL_74;
                    }
                  }
                  v55 = v8;
LABEL_74:
                  *(_DWORD *)v55 = v51;
                  *(_QWORD *)(v55 + 8) = v52;
                  a2 = v50;
                }
                v44 = v49 + 4;
                v47 += 16;
                v48 = v49;
              }
              while (v49 + 4 != (_DWORD *)a2);
            }
          }
          else if (!v46)
          {
            v86 = (uint64_t *)(v8 + 24);
            do
            {
              v87 = v44;
              result = _LSBundleCompareForActivityContinuationSuitability(***a3, *(_QWORD *)(v8 + 24), *(_QWORD *)(v8 + 8));
              if (result == -1)
              {
                v88 = a2;
                v89 = *v87;
                v90 = *(_QWORD *)(v8 + 24);
                v91 = v86;
                do
                {
                  v92 = v91;
                  v93 = *((_DWORD *)v91 - 6);
                  v94 = *(v91 - 2);
                  v91 -= 2;
                  *((_DWORD *)v92 - 2) = v93;
                  *v92 = v94;
                  result = _LSBundleCompareForActivityContinuationSuitability(***a3, v90, *(v92 - 4));
                }
                while (result == -1);
                *((_DWORD *)v91 - 2) = v89;
                *v91 = v90;
                a2 = v88;
              }
              v44 = v87 + 4;
              v86 += 2;
              v8 = (uint64_t)v87;
            }
            while (v87 + 4 != (int *)a2);
          }
          return result;
        }
        if (!a4)
        {
          if (v8 != a2)
          {
            v95 = a2;
            v56 = (unint64_t)(v11 - 2) >> 1;
            v57 = v56;
            do
            {
              v58 = v57;
              if (v56 >= v57)
              {
                v59 = (2 * v57) | 1;
                v60 = v8 + 16 * v59;
                if (2 * v57 + 2 < v11)
                {
                  v61 = _LSBundleCompareForActivityContinuationSuitability(***a3, *(_QWORD *)(v60 + 8), *(_QWORD *)(v60 + 24));
                  v60 += 16 * (v61 == -1);
                  if (v61 == -1)
                    v59 = 2 * v58 + 2;
                }
                v62 = v8 + 16 * v58;
                v64 = *(_QWORD *)(v62 + 8);
                v63 = (uint64_t *)(v62 + 8);
                result = _LSBundleCompareForActivityContinuationSuitability(***a3, *(_QWORD *)(v60 + 8), v64);
                if (result != -1)
                {
                  v99 = v58;
                  v65 = v8 + 16 * v58;
                  v97 = *(_DWORD *)v65;
                  v66 = *v63;
                  do
                  {
                    v67 = v65;
                    v65 = v60;
                    *(_DWORD *)v67 = *(_DWORD *)v60;
                    *(_QWORD *)(v67 + 8) = *(_QWORD *)(v60 + 8);
                    if (v56 < v59)
                      break;
                    v68 = (2 * v59) | 1;
                    v60 = v8 + 16 * v68;
                    v69 = 2 * v59 + 2;
                    if (v69 < v11)
                    {
                      v70 = _LSBundleCompareForActivityContinuationSuitability(***a3, *(_QWORD *)(v60 + 8), *(_QWORD *)(v60 + 24));
                      v60 += 16 * (v70 == -1);
                      if (v70 == -1)
                        v68 = v69;
                    }
                    result = _LSBundleCompareForActivityContinuationSuitability(***a3, *(_QWORD *)(v60 + 8), v66);
                    v59 = v68;
                  }
                  while (result != -1);
                  *(_DWORD *)v65 = v97;
                  *(_QWORD *)(v65 + 8) = v66;
                  v58 = v99;
                }
              }
              v57 = v58 - 1;
            }
            while (v58);
            v71 = (unint64_t)v10 >> 4;
            v72 = v95;
            do
            {
              v73 = 0;
              v100 = *(_DWORD *)v8;
              v74 = *(_QWORD *)(v8 + 8);
              v75 = v8;
              do
              {
                v76 = v75 + 16 * (v73 + 1);
                v77 = (2 * v73) | 1;
                v78 = 2 * v73 + 2;
                if (v78 < v71)
                {
                  result = _LSBundleCompareForActivityContinuationSuitability(***a3, *(_QWORD *)(v76 + 8), *(_QWORD *)(v76 + 24));
                  v76 += 16 * (result == -1);
                  if (result == -1)
                    v77 = v78;
                }
                *(_DWORD *)v75 = *(_DWORD *)v76;
                *(_QWORD *)(v75 + 8) = *(_QWORD *)(v76 + 8);
                v75 = v76;
                v73 = v77;
              }
              while (v77 <= (uint64_t)((unint64_t)(v71 - 2) >> 1));
              v79 = v72 - 16;
              if (v76 == v72 - 16)
              {
                *(_DWORD *)v76 = v100;
                *(_QWORD *)(v76 + 8) = v74;
              }
              else
              {
                *(_DWORD *)v76 = *(_DWORD *)(v72 - 16);
                *(_QWORD *)(v76 + 8) = *(_QWORD *)(v72 - 8);
                *(_DWORD *)(v72 - 16) = v100;
                *(_QWORD *)(v72 - 8) = v74;
                v80 = v76 - v8 + 16;
                if (v80 >= 17)
                {
                  v81 = (((unint64_t)v80 >> 4) - 2) >> 1;
                  result = _LSBundleCompareForActivityContinuationSuitability(***a3, *(_QWORD *)(v8 + 16 * v81 + 8), *(_QWORD *)(v76 + 8));
                  if (result == -1)
                  {
                    v82 = *(_DWORD *)v76;
                    v83 = *(_QWORD *)(v76 + 8);
                    do
                    {
                      v84 = v76;
                      v76 = v8 + 16 * v81;
                      *(_DWORD *)v84 = *(_DWORD *)v76;
                      *(_QWORD *)(v84 + 8) = *(_QWORD *)(v76 + 8);
                      if (!v81)
                        break;
                      v81 = (v81 - 1) >> 1;
                      result = _LSBundleCompareForActivityContinuationSuitability(***a3, *(_QWORD *)(v8 + 16 * v81 + 8), v83);
                    }
                    while (result == -1);
                    *(_DWORD *)v76 = v82;
                    *(_QWORD *)(v76 + 8) = v83;
                  }
                }
              }
              v72 = v79;
            }
            while (v71-- > 2);
          }
          return result;
        }
        v12 = (unint64_t)v11 >> 1;
        v13 = v8 + 16 * ((unint64_t)v11 >> 1);
        if ((unint64_t)v10 < 0x801)
        {
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>((int *)v13, (int *)v8, v96, a3);
        }
        else
        {
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>((int *)v8, (int *)v13, v96, a3);
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>((int *)(v8 + 16), (int *)(v13 - 16), (int *)(a2 - 32), a3);
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>((int *)(v8 + 32), (int *)(v8 + 16 + 16 * v12), (int *)(a2 - 48), a3);
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>((int *)(v13 - 16), (int *)v13, (int *)(v8 + 16 + 16 * v12), a3);
          v14 = *(_DWORD *)v8;
          *(_DWORD *)v8 = *(_DWORD *)v13;
          *(_DWORD *)v13 = v14;
          v15 = *(_QWORD *)(v8 + 8);
          *(_QWORD *)(v8 + 8) = *(_QWORD *)(v13 + 8);
          *(_QWORD *)(v13 + 8) = v15;
        }
        --a4;
        if ((a5 & 1) == 0
          && _LSBundleCompareForActivityContinuationSuitability(***a3, *(_QWORD *)(v8 - 8), *(_QWORD *)(v8 + 8)) != -1)
        {
          v32 = *(_DWORD *)v8;
          v33 = *(_QWORD *)(v8 + 8);
          result = _LSBundleCompareForActivityContinuationSuitability(***a3, v33, *(_QWORD *)(a2 - 8));
          if (result == -1)
          {
            v35 = v8;
            do
            {
              v9 = v35 + 16;
              result = _LSBundleCompareForActivityContinuationSuitability(***a3, v33, *(_QWORD *)(v35 + 24));
              v35 = v9;
            }
            while (result != -1);
          }
          else
          {
            v34 = v8 + 16;
            do
            {
              v9 = v34;
              if (v34 >= a2)
                break;
              result = _LSBundleCompareForActivityContinuationSuitability(***a3, v33, *(_QWORD *)(v34 + 8));
              v34 = v9 + 16;
            }
            while (result != -1);
          }
          v36 = a2;
          if (v9 < a2)
          {
            v37 = a2;
            do
            {
              v36 = v37 - 16;
              result = _LSBundleCompareForActivityContinuationSuitability(***a3, v33, *(_QWORD *)(v37 - 8));
              v37 = v36;
            }
            while (result == -1);
          }
          while (v9 < v36)
          {
            v38 = *(_DWORD *)v9;
            *(_DWORD *)v9 = *(_DWORD *)v36;
            *(_DWORD *)v36 = v38;
            v39 = *(_QWORD *)(v9 + 8);
            *(_QWORD *)(v9 + 8) = *(_QWORD *)(v36 + 8);
            *(_QWORD *)(v36 + 8) = v39;
            do
            {
              v40 = *(_QWORD *)(v9 + 24);
              v9 += 16;
            }
            while (_LSBundleCompareForActivityContinuationSuitability(***a3, v33, v40) != -1);
            do
            {
              v41 = *(_QWORD *)(v36 - 8);
              v36 -= 16;
              result = _LSBundleCompareForActivityContinuationSuitability(***a3, v33, v41);
            }
            while (result == -1);
          }
          if (v9 - 16 != v8)
          {
            *(_DWORD *)v8 = *(_DWORD *)(v9 - 16);
            *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 - 8);
          }
          a5 = 0;
          *(_DWORD *)(v9 - 16) = v32;
          *(_QWORD *)(v9 - 8) = v33;
          continue;
        }
        v16 = 0;
        v17 = *(_DWORD *)v8;
        v18 = *(_QWORD *)(v8 + 8);
        do
        {
          v19 = _LSBundleCompareForActivityContinuationSuitability(***a3, *(_QWORD *)(v8 + v16 + 24), v18);
          v16 += 16;
        }
        while (v19 == -1);
        v20 = v8 + v16;
        v21 = a2;
        if (v16 == 16)
        {
          v24 = a2;
          while (v20 < v24)
          {
            v22 = v24 - 16;
            v25 = _LSBundleCompareForActivityContinuationSuitability(***a3, *(_QWORD *)(v24 - 8), v18);
            v24 = v22;
            if (v25 == -1)
              goto LABEL_21;
          }
          v22 = v24;
        }
        else
        {
          do
          {
            v22 = v21 - 16;
            v23 = _LSBundleCompareForActivityContinuationSuitability(***a3, *(_QWORD *)(v21 - 8), v18);
            v21 = v22;
          }
          while (v23 != -1);
        }
LABEL_21:
        v9 = v8 + v16;
        if (v20 < v22)
        {
          v26 = v22;
          do
          {
            v27 = *(_DWORD *)v9;
            *(_DWORD *)v9 = *(_DWORD *)v26;
            *(_DWORD *)v26 = v27;
            v28 = *(_QWORD *)(v9 + 8);
            *(_QWORD *)(v9 + 8) = *(_QWORD *)(v26 + 8);
            *(_QWORD *)(v26 + 8) = v28;
            do
            {
              v29 = *(_QWORD *)(v9 + 24);
              v9 += 16;
            }
            while (_LSBundleCompareForActivityContinuationSuitability(***a3, v29, v18) == -1);
            do
            {
              v30 = *(_QWORD *)(v26 - 8);
              v26 -= 16;
            }
            while (_LSBundleCompareForActivityContinuationSuitability(***a3, v30, v18) != -1);
          }
          while (v9 < v26);
        }
        if (v9 - 16 != v8)
        {
          *(_DWORD *)v8 = *(_DWORD *)(v9 - 16);
          *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 - 8);
        }
        *(_DWORD *)(v9 - 16) = v17;
        *(_QWORD *)(v9 - 8) = v18;
        if (v20 < v22)
        {
LABEL_32:
          result = std::__introsort<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *,false>(v8, v9 - 16, a3, a4, a5 & 1);
          a5 = 0;
          continue;
        }
        v31 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>(v8, v9 - 16, a3);
        result = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>(v9, a2, a3);
        if (!(_DWORD)result)
        {
          if (v31)
            continue;
          goto LABEL_32;
        }
        a2 = v9 - 16;
        if (!v31)
          goto LABEL_2;
        return result;
    }
  }
}

@end
