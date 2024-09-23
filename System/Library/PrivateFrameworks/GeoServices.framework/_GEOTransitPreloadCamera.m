@implementation _GEOTransitPreloadCamera

- (void)implicateTilesForCoordinate:(id)a3 into:(id)a4 radialDistance:(double)a5 tileSetStyles:(id)a6
{
  double var1;
  double var0;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  char v22;
  double v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  unsigned int v28;
  uint64_t v29;
  __int128 v30;
  unint64_t v31;
  uint64_t v33;
  uint64_t v34;
  id obj;
  uint64_t i;
  unsigned int v37;
  unsigned int v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  unsigned int v43;
  unsigned int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[2];
  _BYTE v54[128];
  _BYTE v55[128];
  _QWORD v56[4];

  var1 = a3.var1;
  var0 = a3.var0;
  v56[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = GEOMapRectMakeWithRadialDistance(var0, var1, a5);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v11;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v50;
    v19 = v12 + v16;
    v20 = v14 + v18;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v50 != v34)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKey:", v21, v33);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "integerValue");
        v23 = (double)(1 << v22) * 0.0000000037252903;
        v39 = vcvtmd_u64_f64(v12 * v23) | 0x3E30000000000000;
        v37 = vcvtmd_u64_f64(v19 * v23);
        if (v39 <= v37)
        {
          v38 = vcvtmd_u64_f64(v14 * v23);
          v43 = vcvtmd_u64_f64(v20 * v23);
          v40 = (unint64_t)(v22 & 0x3F) << 40;
          do
          {
            if (v38 <= v43)
            {
              v41 = v39 << 46;
              v44 = v38;
              do
              {
                v47 = 0u;
                v48 = 0u;
                v45 = 0u;
                v46 = 0u;
                v24 = v42;
                v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
                if (v25)
                {
                  v26 = *(_QWORD *)v46;
                  do
                  {
                    for (j = 0; j != v25; ++j)
                    {
                      if (*(_QWORD *)v46 != v26)
                        objc_enumerationMutation(v24);
                      v28 = objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "integerValue");
                      *(_QWORD *)((char *)v56 + 1) = v41 | v40;
                      LOBYTE(v56[0]) = 2;
                      *((_QWORD *)&v30 + 1) = (v39 >> 18) | ((unint64_t)(v44 & 0x3FFFFFF) << 8) | ((unint64_t)(v28 & 0x3FFF) << 34) | 0x2000000000000;
                      *(_QWORD *)&v30 = v41 | v40;
                      v29 = v30 >> 56;
                      v31 = (unint64_t)(v28 == 26) << 7;
                      if (v28 <= 0x19 && ((1 << v28) & 0x200101C) != 0)
                        v31 = 128;
                      v53[0] = v31 | v56[0] & 0xFFFFFFFFFFFFFF7FLL;
                      v53[1] = v29;
                      objc_msgSend(v10, "addKey:", v53);
                    }
                    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
                  }
                  while (v25);
                }

                ++v44;
              }
              while (v44 <= v43);
            }
            v39 = (v39 + 1);
          }
          while (v39 <= v37);
        }

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v33);
  }

}

@end
