@implementation GEODistanceStringRoundingInfo

+ (id)roundingInfoForDistanceMeasurement:(id)a3 measurementSystem:(id)a4 locale:(id)a5 formatOptions:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  double v19;
  void *v20;
  double v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_opt_new();
  if (v13)
  {
    v14 = objc_msgSend(a1, "_lookupTableForMeasurementSystem:locale:formatOptions:", v11, v12, a6);
    v27 = v10;
    v15 = v10;
    for (i = 0; ; i = v18)
    {
      v17 = objc_msgSend(a1, "_roundingInfoTierForDistanceMeasurement:lookupTable:formatOptions:", v15, v14, a6, v27);
      v18 = v17;
      v19 = 1.0;
      if ((a6 & 0x40) == 0)
        v19 = *(double *)(v17 + 16);
      if (v17 == i)
        break;
      objc_msgSend(v15, "measurementByConvertingToUnit:", *(_QWORD *)(v17 + 8));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3758]), "initWithDoubleValue:unit:", *(_QWORD *)(v18 + 8), v19 * round(v21 / v19));

      v15 = (id)v22;
    }
    v23 = *(void **)(v13 + 8);
    *(_QWORD *)(v13 + 8) = v15;

    *(double *)(v13 + 16) = v19;
    if ((a6 & 4) != 0)
      v24 = 0;
    else
      v24 = *(_QWORD *)(i + 24);
    *(_QWORD *)(v13 + 24) = v24;
    *(_QWORD *)(v13 + 32) = *(_QWORD *)(i + 32);
    v25 = (id)v13;
    v10 = v27;
  }

  return (id)v13;
}

+ (const)_lookupTableForMeasurementSystem:(id)a3 locale:(id)a4 formatOptions:(unint64_t)a5
{
  char v5;
  id v6;
  unsigned __int8 v7;
  const void *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  _QWORD *v15;
  uint64_t j;
  _QWORD *v17;
  uint64_t i;
  _QWORD *v19;
  uint64_t m;
  _QWORD *v21;
  uint64_t k;
  _QWORD *v23;
  uint64_t ii;
  _QWORD *v25;
  uint64_t n;
  int v27;
  _BYTE v28[12];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64x2_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int64x2_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v5 = a5;
  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C997F8]))
  {
    if ((v5 & 2) != 0)
    {
      v10 = atomic_load((unsigned __int8 *)&qword_1ECDBBB58);
      if ((v10 & 1) == 0 && __cxa_guard_acquire(&qword_1ECDBBB58))
      {
        v17 = (_QWORD *)operator new();
        objc_msgSend(MEMORY[0x1E0CB3AD8], "kilometers", 0x40C3880000000000);
        *(_QWORD *)&v28[4] = objc_claimAutoreleasedReturnValue();
        v29 = 0x3FF0000000000000;
        v30 = 0;
        v31 = 0;
        v32 = 0x408F400000000000;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "kilometers");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = 0x3FB999999999999ALL;
        v35 = vdupq_n_s64(1uLL);
        v36 = 0x4014000000000000;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 0x4014000000000000;
        v40 = 0;
        v39 = 0uLL;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = 0x3FF0000000000000;
        v43 = 0;
        v44 = 0;
        std::vector<_RoundingInfo>::vector[abi:ne180100](v17, (uint64_t)&v27, 4uLL);
        for (i = 128; i != -32; i -= 40)

        qword_1ECDBBB50 = (uint64_t)v17;
        __cxa_guard_release(&qword_1ECDBBB58);
      }
      v8 = (const void *)qword_1ECDBBB50;
    }
    else
    {
      v7 = atomic_load((unsigned __int8 *)&qword_1ECDBBB48);
      if ((v7 & 1) == 0 && __cxa_guard_acquire(&qword_1ECDBBB48))
      {
        v15 = (_QWORD *)operator new();
        objc_msgSend(MEMORY[0x1E0CB3AD8], "kilometers", 0x40C3880000000000);
        *(_QWORD *)&v28[4] = objc_claimAutoreleasedReturnValue();
        v29 = 0x3FF0000000000000;
        v30 = 0;
        v31 = 0;
        v32 = 0x408F400000000000;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "kilometers");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = 0x3FB999999999999ALL;
        v35 = vdupq_n_s64(1uLL);
        v36 = 0x407F400000000000;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 0x4059000000000000;
        v39 = 0uLL;
        v40 = 0x4059000000000000;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = 0x4049000000000000;
        v43 = 0;
        v44 = 0;
        v45 = 0x403E000000000000;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = 0x4024000000000000;
        v48 = 0;
        v49 = 0;
        v50 = 0x4014000000000000;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = 0x4014000000000000;
        v54 = 0;
        v55 = 0;
        v53 = 0;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
        v56 = objc_claimAutoreleasedReturnValue();
        v57 = 0x3FF0000000000000;
        v58 = 0;
        v59 = 0;
        std::vector<_RoundingInfo>::vector[abi:ne180100](v15, (uint64_t)&v27, 7uLL);
        for (j = 248; j != -32; j -= 40)

        _MergedGlobals_201 = (uint64_t)v15;
        __cxa_guard_release(&qword_1ECDBBB48);
      }
      v8 = (const void *)_MergedGlobals_201;
    }
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C99800]))
  {
    if ((v5 & 2) != 0)
    {
      v12 = atomic_load((unsigned __int8 *)&qword_1ECDBBB78);
      if ((v12 & 1) == 0 && __cxa_guard_acquire(&qword_1ECDBBB78))
      {
        v21 = (_QWORD *)operator new();
        objc_msgSend(MEMORY[0x1E0CB3AD8], "miles", 0x40CF6EB851EB851ELL);
        *(_QWORD *)&v28[4] = objc_claimAutoreleasedReturnValue();
        v29 = 0x3FF0000000000000;
        v30 = 0;
        v31 = 0;
        v32 = 0x409925604189374BLL;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = 0x3FB999999999999ALL;
        v35 = (int64x2_t)xmmword_189CCC510;
        v36 = 0x40730DC67DFE329FLL;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 0x3FA999999999999ALL;
        v39 = vdupq_n_s64(1uLL);
        v40 = 0;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "yards");
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = 0x4014000000000000;
        v43 = 0;
        v44 = 0;
        std::vector<_RoundingInfo>::vector[abi:ne180100](v21, (uint64_t)&v27, 4uLL);
        for (k = 128; k != -32; k -= 40)

        qword_1ECDBBB70 = (uint64_t)v21;
        __cxa_guard_release(&qword_1ECDBBB78);
      }
      v8 = (const void *)qword_1ECDBBB70;
    }
    else
    {
      v9 = atomic_load((unsigned __int8 *)&qword_1ECDBBB68);
      if ((v9 & 1) == 0 && __cxa_guard_acquire(&qword_1ECDBBB68))
      {
        v19 = (_QWORD *)operator new();
        objc_msgSend(MEMORY[0x1E0CB3AD8], "miles", 0x40CF6EB851EB851ELL);
        *(_QWORD *)&v28[4] = objc_claimAutoreleasedReturnValue();
        v29 = 0x3FF0000000000000;
        v30 = 0;
        v31 = 0;
        v32 = 0x40730DC67DFE329FLL;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = 0x3FB999999999999ALL;
        v35 = vdupq_n_s64(1uLL);
        v36 = 0x402249BA5E353F7CLL;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "yards");
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 0x4024000000000000;
        v40 = 0;
        v39 = 0uLL;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "yards");
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = 0x4014000000000000;
        v43 = 0;
        v44 = 0;
        std::vector<_RoundingInfo>::vector[abi:ne180100](v19, (uint64_t)&v27, 4uLL);
        for (m = 128; m != -32; m -= 40)

        qword_1ECDBBB60 = (uint64_t)v19;
        __cxa_guard_release(&qword_1ECDBBB68);
      }
      v8 = (const void *)qword_1ECDBBB60;
    }
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C99808]))
  {
    if ((v5 & 2) != 0)
    {
      v13 = atomic_load((unsigned __int8 *)&qword_1ECDBBB98);
      if ((v13 & 1) == 0 && __cxa_guard_acquire(&qword_1ECDBBB98))
      {
        v25 = (_QWORD *)operator new();
        objc_msgSend(MEMORY[0x1E0CB3AD8], "miles", 0x40CF6EB851EB851ELL);
        *(_QWORD *)&v28[4] = objc_claimAutoreleasedReturnValue();
        v29 = 0x3FF0000000000000;
        v30 = 0;
        v31 = 0;
        v32 = 0x409925604189374BLL;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = 0x3FB999999999999ALL;
        v35 = (int64x2_t)xmmword_189CCC510;
        v36 = 0x40730CCCCCCCCCCCLL;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 0x3FA999999999999ALL;
        v39 = vdupq_n_s64(1uLL);
        v40 = 0x402249BA5E353F7CLL;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = 0x4024000000000000;
        v44 = 0;
        v45 = 0;
        v43 = 0;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = 0x4014000000000000;
        v48 = 0;
        v49 = 0;
        std::vector<_RoundingInfo>::vector[abi:ne180100](v25, (uint64_t)&v27, 5uLL);
        for (n = 168; n != -32; n -= 40)

        qword_1ECDBBB90 = (uint64_t)v25;
        __cxa_guard_release(&qword_1ECDBBB98);
      }
      v8 = (const void *)qword_1ECDBBB90;
    }
    else
    {
      v11 = atomic_load((unsigned __int8 *)&qword_1ECDBBB88);
      if ((v11 & 1) == 0 && __cxa_guard_acquire(&qword_1ECDBBB88))
      {
        v23 = (_QWORD *)operator new();
        objc_msgSend(MEMORY[0x1E0CB3AD8], "miles", 0x40CF6EB851EB851ELL);
        *(_QWORD *)&v28[4] = objc_claimAutoreleasedReturnValue();
        v29 = 0x3FF0000000000000;
        v30 = 0;
        v31 = 0;
        v32 = 0x40730CCCCCCCCCCCLL;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = 0x3FB999999999999ALL;
        v35 = vdupq_n_s64(1uLL);
        v36 = 0x40630CCCCCCCCCCCLL;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 0x4059000000000000;
        v39 = 0uLL;
        v40 = 0x403E7AE147AE147ALL;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = 0x4049000000000000;
        v43 = 0;
        v44 = 0;
        v45 = 0x402249BA5E353F7CLL;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = 0x4024000000000000;
        v49 = 0;
        v50 = 0;
        v48 = 0;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = 0x4014000000000000;
        v53 = 0;
        v54 = 0;
        std::vector<_RoundingInfo>::vector[abi:ne180100](v23, (uint64_t)&v27, 6uLL);
        for (ii = 208; ii != -32; ii -= 40)

        qword_1ECDBBB80 = (uint64_t)v23;
        __cxa_guard_release(&qword_1ECDBBB88);
      }
      v8 = (const void *)qword_1ECDBBB80;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v27 = 138412290;
      *(_QWORD *)v28 = v6;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid or unhandled measurement system '%@'", (uint8_t *)&v27, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

+ (const)_roundingInfoTierForDistanceMeasurement:(id)a3 lookupTable:(const void *)a4 formatOptions:(unint64_t)a5
{
  char v5;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double *v12;
  id v13;
  double *v14;
  unint64_t v15;
  unint64_t v16;
  double *v17;
  double *v18;
  double v19;
  uint64_t v20;
  const _RoundingInfo *v21;

  v5 = a5;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "measurementByConvertingToUnit:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  v12 = *(double **)a4;
  if ((v5 & 0x20) != 0)
  {
    v13 = *(id *)(*((_QWORD *)a4 + 1) - 32);
    while ((objc_msgSend(*((id *)v12 + 1), "isEqual:", v13) & 1) == 0)
      v12 += 5;

  }
  v14 = (double *)*((_QWORD *)a4 + 1);
  if (v14 != v12)
  {
    v15 = 0xCCCCCCCCCCCCCCCDLL * (v14 - v12);
    do
    {
      v16 = v15 >> 1;
      v17 = &v12[5 * (v15 >> 1)];
      v19 = *v17;
      v18 = v17 + 5;
      v15 += ~(v15 >> 1);
      if (v19 > v11)
        v12 = v18;
      else
        v15 = v16;
    }
    while (v15);
  }
  if (v12 == v14)
    v20 = -1;
  else
    v20 = 0;
  v21 = (const _RoundingInfo *)&v12[5 * v20];

  return v21;
}

- (NSMeasurement)roundedDistanceMeasurement
{
  return self->_roundedDistanceMeasurement;
}

- (double)roundingIncrement
{
  return self->_roundingIncrement;
}

- (unint64_t)minFractionDigits
{
  return self->_minFractionDigits;
}

- (unint64_t)maxFractionDigits
{
  return self->_maxFractionDigits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roundedDistanceMeasurement, 0);
}

@end
