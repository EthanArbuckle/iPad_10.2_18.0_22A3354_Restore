@implementation CLSCalculation

+ (void)calculateStandardDeviationForItems:(id)a3 valueBlock:(id)a4 result:(id)a5
{
  id v7;
  double (**v8)(id, _QWORD);
  void (**v9)(_QWORD, __n128, __n128);
  uint64_t v10;
  __n128 v11;
  __n128 v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  __n128 v24;
  __n128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (double (**)(id, _QWORD))a4;
  v9 = (void (**)(_QWORD, __n128, __n128))a5;
  v10 = objc_msgSend(v7, "count");
  if (v10)
  {
    v13 = v10;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v7;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      v18 = 0.0;
      v19 = 0.0;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20);
          v22 = (void *)MEMORY[0x1D1796094](v15);
          v23 = v8[2](v8, v21);
          v19 = v19 + v23;
          v18 = v18 + v23 * v23;
          objc_autoreleasePoolPop(v22);
          ++v20;
        }
        while (v16 != v20);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        v16 = v15;
      }
      while (v15);
    }
    else
    {
      v18 = 0.0;
      v19 = 0.0;
    }

    v24.n128_f64[0] = v19 / (double)v13;
    v25.n128_f64[0] = sqrt(((double)v13 * v18 - v19 * v19) / (double)(v13 * v13));
    v9[2](v9, v25, v24);
  }
  else
  {
    v11.n128_u64[0] = 0;
    v12.n128_u64[0] = 0;
    v9[2](v9, v11, v12);
  }

}

+ (double)cumulativeNormalDistributionForX:(double)a3 mu:(double)a4 sigma:(double)a5
{
  return fmin(erfc((a4 - a3) / a5 * 0.707106781) * 0.5, 1.0);
}

@end
